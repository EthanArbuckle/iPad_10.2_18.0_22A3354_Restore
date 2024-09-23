@implementation VUILibraryMenuDataSource

- (NSSet)validCategories
{
  return self->_validCategories;
}

- (VUILibraryMenuDataSource)initWithValidCategories:(id)a3
{
  id v5;
  VUILibraryMenuDataSource *v6;
  VUILibraryMenuDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryMenuDataSource;
  v6 = -[VUILibraryMenuDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_validCategories, a3);

  return v7;
}

- (void)setMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_menuItems, a3);
}

- (VUIMenuDataSource)menuItems
{
  return self->_menuItems;
}

- (void)setValidCategories:(id)a3
{
  objc_storeStrong((id *)&self->_validCategories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validCategories, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
}

@end
