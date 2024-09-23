@implementation WFTagFactory

+ (id)tagsForWebpage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = +[WFTagFactory defaultFactory](WFTagFactory, "defaultFactory");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = objc_msgSend(v4, "tagWithClass:webpage:", objc_opt_class(), a3);
  v7 = objc_msgSend(v4, "tagWithClass:webpage:", objc_opt_class(), a3);
  v8 = objc_msgSend(v4, "tagWithClass:webpage:", objc_opt_class(), a3);
  if (v6)
    objc_msgSend(v5, "appendString:", v6);
  if (v7)
  {
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
    objc_msgSend(v5, "appendString:", v7);
  }
  if (v8)
  {
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
    objc_msgSend(v5, "appendString:", v8);
  }
  return v5;
}

+ (id)defaultFactory
{
  id v2;
  id result;

  if (defaultFactory_TagFactory)
  {
    v2 = (id)defaultFactory_TagFactory;
    return (id)defaultFactory_TagFactory;
  }
  else
  {
    objc_opt_class();
    result = (id)objc_opt_new();
    defaultFactory_TagFactory = (uint64_t)result;
  }
  return result;
}

- (WFTagFactory)init
{
  WFTagFactory *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTagFactory;
  v2 = -[WFTagFactory init](&v4, sel_init);
  if (v2)
    v2->sharedTags = (NSMutableDictionary *)objc_opt_new();
  return v2;
}

- (id)tagWithClass:(Class)a3 webpage:(id)a4
{
  NSString *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = NSStringFromClass(a3);
  v8 = (id)-[NSMutableDictionary objectForKey:](self->sharedTags, "objectForKey:", v7);
  if (!v8)
  {
    v8 = objc_alloc_init(a3);
    -[NSMutableDictionary setObject:forKey:](self->sharedTags, "setObject:forKey:", v8, v7);

  }
  v9 = (void *)objc_msgSend(v8, "tagWithWebpage:", a4);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "insertString:atIndex:", CFSTR("[ "), 0);
    objc_msgSend(v10, "appendString:", CFSTR(" ]"));
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTagFactory;
  -[WFTagFactory dealloc](&v3, sel_dealloc);
}

@end
