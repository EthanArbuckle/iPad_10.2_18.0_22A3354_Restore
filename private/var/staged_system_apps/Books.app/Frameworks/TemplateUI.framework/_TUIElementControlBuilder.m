@implementation _TUIElementControlBuilder

- (void)addMenuContainer:(id)a3
{
  objc_storeStrong((id *)&self->_menuContainer, a3);
}

- (void)addLinkEntity:(id)a3
{
  id v4;
  NSMutableArray *linkEntities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  linkEntities = self->_linkEntities;
  v8 = v4;
  if (!linkEntities)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_linkEntities;
    self->_linkEntities = v6;

    v4 = v8;
    linkEntities = self->_linkEntities;
  }
  -[NSMutableArray addObject:](linkEntities, "addObject:", v4);

}

- (id)finalizeLinkEntities
{
  return -[NSMutableArray copy](self->_linkEntities, "copy");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (NSMutableArray)linkEntities
{
  return self->_linkEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
