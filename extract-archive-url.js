var list = [];
$$("td a").forEach(function(a){
    if (a.getAttribute('href').match(/.*\.txt\.gz/)) {
        console.log(a, a.getAttribute('href'));
        list.push(a.getAttribute('href'));
    }
});

console.log(JSON.stringify(list, null, 3));