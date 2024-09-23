@implementation SNTestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (SNTestContext)initWithApplication:(id)a3 testName:(id)a4
{
  id v7;
  id v8;
  SNTestContext *v9;
  SNTestContext *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *objects;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SNTestContext;
  v9 = -[SNTestContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_application, a3);
    objc_storeStrong((id *)&v10->_testName, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objects = v10->_objects;
    v10->_objects = v11;

  }
  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SNTestContext objects](self, "objects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SNTestContext objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIApplication)application
{
  return self->_application;
}

- (NSString)testName
{
  return self->_testName;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

@end
