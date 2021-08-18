const request = require('supertest');
const app = require('../app/app');

test('Hello world works', async () => {
    const response = await request(app.callback()).get('/');
    expect(response.status).toBe(404);
});

