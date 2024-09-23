@implementation TCVegaHTMLElement

- (TCVegaHTMLElement)init
{
  return -[TCVegaHTMLElement initWithTagName:](self, "initWithTagName:", 0);
}

- (TCVegaHTMLElement)initWithTagName:(id)a3
{
  id v4;
  TCVegaHTMLElement *v5;
  TCVegaCSSStyleDeclaration *v6;
  id v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCVegaHTMLElement;
  v5 = -[TCVegaHTMLElement init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(TCVegaCSSStyleDeclaration);
    -[TCVegaHTMLElement setStyle:](v5, "setStyle:", v6);

    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[TCVegaHTMLElement setChildNodes:](v5, "setChildNodes:", v7);

    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[TCVegaHTMLElement setEvents:](v5, "setEvents:", v8);

    -[TCVegaHTMLElement setTagName:](v5, "setTagName:", v4);
  }

  return v5;
}

- (id)parentNode
{
  return -[TCVegaHTMLElement initWithTagName:]([TCVegaHTMLElement alloc], "initWithTagName:", CFSTR("div"));
}

- (id)removeWithChild:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TCVegaHTMLElement childNodes](self, "childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  return 0;
}

- (id)appendWithChild:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TCVegaHTMLElement childNodes](self, "childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return v4;
}

- (void)addEventListenerWithType:(id)a3 listener:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDDA728];
  v7 = a3;
  objc_msgSend(v6, "managedValueWithValue:andOwner:", a4, self);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TCVegaHTMLElement events](self, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, v7);

}

- (id)getBoundingClientRect
{
  return &unk_24D95FD98;
}

- (TCVegaCSSStyleDeclaration)style
{
  return self->style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->style, a3);
}

- (NSMutableArray)childNodes
{
  return self->childNodes;
}

- (void)setChildNodes:(id)a3
{
  objc_storeStrong((id *)&self->childNodes, a3);
}

- (NSString)tagName
{
  return self->tagName;
}

- (void)setTagName:(id)a3
{
  objc_storeStrong((id *)&self->tagName, a3);
}

- (NSMutableDictionary)events
{
  return self->events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->events, 0);
  objc_storeStrong((id *)&self->tagName, 0);
  objc_storeStrong((id *)&self->childNodes, 0);
  objc_storeStrong((id *)&self->style, 0);
}

@end
