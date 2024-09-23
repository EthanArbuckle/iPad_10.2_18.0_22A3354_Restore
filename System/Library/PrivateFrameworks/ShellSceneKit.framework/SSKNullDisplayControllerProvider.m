@implementation SSKNullDisplayControllerProvider

- (SSKNullDisplayControllerProvider)init
{
  SSKNullDisplayControllerProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *createdControllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSKNullDisplayControllerProvider;
  v2 = -[SSKNullDisplayControllerProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    createdControllers = v2->_createdControllers;
    v2->_createdControllers = v3;

  }
  return v2;
}

- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4
{
  id v5;
  SSKNullDisplayController *v6;

  v5 = a3;
  v6 = objc_alloc_init(SSKNullDisplayController);
  -[NSMutableDictionary setObject:forKey:](self->_createdControllers, "setObject:forKey:", v6, v5);

  return v6;
}

- (id)controllerForDisplay:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_createdControllers, "objectForKey:", a3);
}

- (BOOL)didCreateControllers
{
  return -[NSMutableDictionary count](self->_createdControllers, "count") != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdControllers, 0);
}

@end
