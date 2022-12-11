Flutter JSON Task

Input-1

[{"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},[{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]]



Input-2

[{"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},{"0":{"id":8,"title":"Froyo"},"1":{"id":9,"title":"Éclair"},"3":{"id":10,"title":"Donut"}},[{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]]



Keep these inputs as static in the separete variables and keep two buttons to display output. You have to create only one function to parse the JSON. That means whatever the same structure of input you will pass on to this function it will be able to parse.

Create another function to search using id. You will pass id inside the fuction and it will return you the title and display it.

Rules:
You can design it yourself as long as it looks good.
Don’t use any state management
Don’t use JSON POJO class. You have to parse json manually.

class AndroidVerison {
AndroidVerison({
this.id,
this.title,
});

    int? id;
    String? title;
}

Use this model class to make the list. Don’t modify this model class. 



