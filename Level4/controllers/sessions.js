const db = require('../config');

exports.getSessions = async (req, res) => {
    try  {
        const query = `
        SELECT json_build_object(
            'id', t.id,
            'name', t.name,
            'description', t.description,
            'room', t.room,
            'dateTime', t."datetime",
            'speakers', json_agg(json_build_object(
                'id', s.id,
                'name', s.name,
                'bio', s.bio,
                'pictureUrl', s.pictureurl
                ))
            ) AS session
        FROM sessions t
        INNER JOIN sessions_speakers ts ON ts.session_id = t.id
        INNER JOIN speakers s ON ts.speaker_id = s.id
        GROUP BY t.id;
    `;
     
    const { rows } = await db.query(query);

    res.json(rows);

    } catch (error) {
        console.log(error);
    }
}