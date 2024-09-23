@implementation AEMinimalTemplateSet

+ (id)templateSet
{
  return objc_alloc_init(AEMinimalTemplateSet);
}

- (AEMinimalTemplateSet)init
{
  AEMinimalTemplateSet *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *templates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEMinimalTemplateSet;
  v2 = -[AEMinimalTemplateSet init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    templates = v2->_templates;
    v2->_templates = v3;

  }
  return v2;
}

- (void)addTemplate:(id)a3 withName:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_templates, "setObject:forKey:", a3, a4);
}

- (void)removeTemplateForName:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_templates, "removeObjectForKey:", a3);
}

- (id)evaluateTemplateWithName:(id)a3 withData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_templates, "objectForKey:", v8));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
    a5 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "evaluateWithData:templateSet:cycleContext:error:", v9, self, v11, a5));
LABEL_5:

    goto LABEL_6;
  }
  if (a5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No such template '%@'"), v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, NSLocalizedDescriptionKey, v8, CFSTR("name"), 0));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AEMinimalTemplateErrorDomain"), 5, v12));

    a5 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return a5;
}

- (NSDictionary)templates
{
  return &self->_templates->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templates, 0);
}

@end
