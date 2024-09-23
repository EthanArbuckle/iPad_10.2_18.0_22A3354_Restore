@implementation _PXSharedLibrarySettingsSection

- (void)addItemWithConfigurationHandler:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *items;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (!self->_items)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    items = self->_items;
    self->_items = v4;

  }
  v6 = (void *)objc_opt_new();
  v7[2](v7, v6);
  -[NSMutableArray addObject:](self->_items, "addObject:", v6);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)items
{
  return &self->_items->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
