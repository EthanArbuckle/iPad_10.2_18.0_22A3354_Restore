@implementation SUNativeScriptMenuViewController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNativeScriptMenuViewController;
  -[SUMenuViewController dealloc](&v3, sel_dealloc);
}

- (void)setMenuItems:(id)a3
{
  NSArray *menuItems;

  menuItems = self->_menuItems;
  if (menuItems != a3)
  {

    self->_menuItems = (NSArray *)a3;
    -[SUMenuViewController reload](self, "reload");
  }
}

- (id)copyScriptViewController
{
  SUScriptMenuViewController *v3;

  v3 = objc_alloc_init(SUScriptMenuViewController);
  -[SUScriptViewController setNativeViewController:](v3, "setNativeViewController:", self);
  return v3;
}

- (BOOL)isMenuItemEnabledAtIndex:(int64_t)a3
{
  return objc_msgSend(-[NSArray objectAtIndex:](self->_menuItems, "objectAtIndex:", a3), "enabled");
}

- (int64_t)numberOfMenuItems
{
  return -[NSArray count](self->_menuItems, "count");
}

- (void)performActionForMenuItemAtIndex:(int64_t)a3
{
  id v4;

  if (self->_action)
  {
    v4 = -[NSArray objectAtIndex:](self->_menuItems, "objectAtIndex:", a3);
    -[SUScriptFunction callWithArguments:](self->_action, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, 0));
  }
  else
  {
    -[UIViewController dismissAnimated:](self, "dismissAnimated:", 1);
  }
}

- (id)titleOfMenuItemAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](self->_menuItems, "objectAtIndex:", a3), "title");
}

- (SUScriptFunction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1136);
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

@end
