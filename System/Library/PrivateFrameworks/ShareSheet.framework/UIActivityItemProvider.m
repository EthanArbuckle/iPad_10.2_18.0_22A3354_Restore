@implementation UIActivityItemProvider

- (UIActivityItemProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIActivityItemProvider;
  return -[UIActivityItemProvider init](&v3, sel_init);
}

- (UIActivityItemProvider)initWithPlaceholderItem:(id)placeholderItem
{
  id v4;
  UIActivityItemProvider *v5;
  UIActivityItemProvider *v6;
  objc_super v8;

  v4 = placeholderItem;
  v8.receiver = self;
  v8.super_class = (Class)UIActivityItemProvider;
  v5 = -[UIActivityItemProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIActivityItemProvider setPlaceholderItem:](v5, "setPlaceholderItem:", v4);
    -[UIActivityItemProvider setProvidedItem:](v6, "setProvidedItem:", v4);
  }

  return v6;
}

- (id)item
{
  return 0;
}

- (void)main
{
  id v3;

  -[UIActivityItemProvider item](self, "item");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIActivityItemProvider setProvidedItem:](self, "setProvidedItem:", v3);

}

- (BOOL)_shouldExecuteItemOperationForActivity:(id)a3
{
  return 1;
}

- (id)placeholderItem
{
  return self->_placeholderItem;
}

- (void)setPlaceholderItem:(id)a3
{
  objc_storeStrong(&self->_placeholderItem, a3);
}

- (UIActivityType)activityType
{
  return self->_activityType;
}

- (void)_setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (id)providedItem
{
  return self->_providedItem;
}

- (void)setProvidedItem:(id)a3
{
  objc_storeStrong(&self->_providedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providedItem, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong(&self->_placeholderItem, 0);
}

@end
