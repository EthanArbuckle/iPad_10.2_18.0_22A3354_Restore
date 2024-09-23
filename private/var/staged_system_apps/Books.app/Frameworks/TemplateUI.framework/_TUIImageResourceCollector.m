@implementation _TUIImageResourceCollector

- (_TUIImageResourceCollector)init
{
  return -[_TUIImageResourceCollector initWithBounds:viewState:](self, "initWithBounds:viewState:", 0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (_TUIImageResourceCollector)initWithBounds:(CGRect)a3 viewState:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  _TUIImageResourceCollector *v11;
  _TUIImageResourceCollector *v12;
  uint64_t v13;
  NSHashTable *imageResources;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TUIImageResourceCollector;
  v11 = -[_TUIImageResourceCollector init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewState, a4);
    v12->_visibleBounds.origin.x = x;
    v12->_visibleBounds.origin.y = y;
    v12->_visibleBounds.size.width = width;
    v12->_visibleBounds.size.height = height;
    v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    imageResources = v12->_imageResources;
    v12->_imageResources = (NSHashTable *)v13;

  }
  return v12;
}

- (BOOL)resourceCollectorShouldIncludeEmbeddedForIdentifier:(id)a3
{
  return 1;
}

- (id)resourceCollectorViewStateForIdentifier:(id)a3
{
  return -[TUIViewState viewStateForIdentifier:](self->_viewState, "viewStateForIdentifier:", a3);
}

- (void)collectImageResource:(id)a3
{
  -[NSHashTable addObject:](self->_imageResources, "addObject:", a3);
}

- (void)reset
{
  -[NSHashTable removeAllObjects](self->_imageResources, "removeAllObjects");
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

- (NSMutableSet)resources
{
  return self->_resources;
}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
}

@end
