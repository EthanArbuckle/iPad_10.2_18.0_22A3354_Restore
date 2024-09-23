@implementation _TUIResourceCollector

- (_TUIResourceCollector)initWithBounds:(CGRect)a3 viewState:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  _TUIResourceCollector *v11;
  _TUIResourceCollector *v12;
  NSMutableSet *v13;
  NSMutableSet *resources;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TUIResourceCollector;
  v11 = -[_TUIResourceCollector init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewState, a4);
    v13 = objc_opt_new(NSMutableSet);
    resources = v12->_resources;
    v12->_resources = v13;

    v12->_visibleBounds.origin.x = x;
    v12->_visibleBounds.origin.y = y;
    v12->_visibleBounds.size.width = width;
    v12->_visibleBounds.size.height = height;
  }

  return v12;
}

- (BOOL)resourceCollectorShouldIncludeEmbeddedForIdentifier:(id)a3
{
  return 1;
}

- (id)resourceCollectorViewStateForIdentifier:(id)a3
{
  return 0;
}

- (void)collectResource:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_resources, "addObject:");
}

- (void)reset
{
  -[NSMutableSet removeAllObjects](self->_resources, "removeAllObjects");
}

- (void)performWithViewState:(id)a3 block:(id)a4
{
  id v7;
  TUIViewState **p_viewState;
  TUIViewState *viewState;
  TUIViewState *v10;
  void (**v11)(void);
  TUIViewState *v12;
  id v13;

  v7 = a3;
  if (a4)
  {
    viewState = self->_viewState;
    p_viewState = &self->_viewState;
    v13 = v7;
    v10 = viewState;
    objc_storeStrong((id *)p_viewState, a3);
    v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_viewState;
    *p_viewState = v10;

    v7 = v13;
  }

}

- (NSMutableSet)resources
{
  return self->_resources;
}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
}

@end
