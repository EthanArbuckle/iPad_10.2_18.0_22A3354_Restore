@implementation WBSPageTestBundle

- (WBSPageTestBundle)initWithIdentifier:(id)a3 tests:(id)a4
{
  id v7;
  id v8;
  WBSPageTestBundle *v9;
  WBSPageTestBundle *v10;
  WBSPageTestBundle *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPageTestBundle;
  v9 = -[WBSPageTestBundle init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_allTests, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)allTests
{
  return self->_allTests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTests, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
