//https://tmijs.com/
// const tmi = require('tmi.js');


const client = new tmi.Client({
	channels: [ 'channel' ]
});

client.connect();

client.on('message', (channel, tags, message, self) => {
    if (self) return;
    // if(tags['username']=='wuuuben') {
    //     document.getElementById('showbox').innerText = message;
    //     console.log(`${tags['username']}: ${message}`);
    // }
    document.getElementById('showbox').innerText = message.split('')[0];
        console.log(`${tags['username']}: ${message}`);
});



