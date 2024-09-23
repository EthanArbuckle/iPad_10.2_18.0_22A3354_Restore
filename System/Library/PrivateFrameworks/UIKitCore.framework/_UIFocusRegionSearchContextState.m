@implementation _UIFocusRegionSearchContextState

- (_UIFocusRegionSearchContextState)initWithRegionContainer:(id)a3 focusSystem:(id)a4 clippingRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  _UIFocusRegionSearchContextState *v14;
  _UIFocusRegionSearchContextState *v15;
  objc_super v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIFocusRegionSearchContextState;
  v14 = -[_UIFocusRegionSearchContextState init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_regionContainer, a3);
    objc_storeStrong((id *)&v15->_regionContainerFocusSystem, a4);
    v15->_clippingRect.origin.x = x;
    v15->_clippingRect.origin.y = y;
    v15->_clippingRect.size.width = width;
    v15->_clippingRect.size.height = height;
  }

  return v15;
}

+ (id)stateWithRegionContainer:(id)a3 focusSystem:(id)a4 clippingRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegionContainer:focusSystem:clippingRect:", v12, v11, x, y, width, height);

  return v13;
}

- (_UIFocusRegionContainer)regionContainer
{
  return self->_regionContainer;
}

- (UIFocusSystem)regionContainerFocusSystem
{
  return self->_regionContainerFocusSystem;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionContainerFocusSystem, 0);
  objc_storeStrong((id *)&self->_regionContainer, 0);
}

@end
