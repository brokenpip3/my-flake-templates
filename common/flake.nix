{
  description = "Dirty hack to copy common files across the other templates";

  outputs = { self }: {

    templates.default = {
      path = ./files;
      description = "This is a dirty hack";
    };
  };
}
