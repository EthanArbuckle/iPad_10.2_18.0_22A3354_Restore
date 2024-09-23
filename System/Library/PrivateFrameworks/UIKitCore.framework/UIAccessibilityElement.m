@implementation UIAccessibilityElement

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  -[NSObject setAccessibilityLabel:](&v3, sel_setAccessibilityLabel_, accessibilityLabel);
}

- (UIAccessibilityElement)initWithAccessibilityContainer:(id)container
{
  UIAccessibilityElement *v4;
  UIAccessibilityElement *v5;
  CGSize v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityElement;
  v4 = -[UIAccessibilityElement init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[NSObject setAccessibilityContainer:](v4, "setAccessibilityContainer:", container);
    -[UIAccessibilityElement setIsAccessibilityElement:](v5, "setIsAccessibilityElement:", 1);
    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v5->_accessibilityFrameInContainerSpace.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v5->_accessibilityFrameInContainerSpace.size = v6;
  }
  return v5;
}

- (void)setIsAccessibilityElement:(BOOL)isAccessibilityElement
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  -[NSObject setIsAccessibilityElement:](&v3, sel_setIsAccessibilityElement_, isAccessibilityElement);
}

- (void)dealloc
{
  objc_super v3;

  -[UIAccessibilityElement _destroyFocusLayer](self, "_destroyFocusLayer");
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  -[UIResponder dealloc](&v3, sel_dealloc);
}

- (BOOL)isAccessibilityElement
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return -[NSObject isAccessibilityElement](&v3, sel_isAccessibilityElement);
}

- (NSString)accessibilityLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return -[NSObject accessibilityLabel](&v3, sel_accessibilityLabel);
}

- (NSString)accessibilityHint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return -[NSObject accessibilityHint](&v3, sel_accessibilityHint);
}

- (void)setAccessibilityHint:(NSString *)accessibilityHint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  -[NSObject setAccessibilityHint:](&v3, sel_setAccessibilityHint_, accessibilityHint);
}

- (NSString)accessibilityValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return -[NSObject accessibilityValue](&v3, sel_accessibilityValue);
}

- (void)setAccessibilityValue:(NSString *)accessibilityValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  -[NSObject setAccessibilityValue:](&v3, sel_setAccessibilityValue_, accessibilityValue);
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityElement;
  -[NSObject accessibilityFrame](&v6, sel_accessibilityFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)accessibilityFrame
{
  CGSize v4;
  objc_super v5;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_accessibilityFrameInContainerSpace.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_accessibilityFrameInContainerSpace.size = v4;
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElement;
  -[NSObject setAccessibilityFrame:](&v5, sel_setAccessibilityFrame_, accessibilityFrame.origin.x, accessibilityFrame.origin.y, accessibilityFrame.size.width, accessibilityFrame.size.height);
  -[UIAccessibilityElement _updateFocusLayerFrame](self, "_updateFocusLayerFrame");
}

- (UIAccessibilityTraits)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return -[NSObject accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)setAccessibilityTraits:(UIAccessibilityTraits)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  -[NSObject setAccessibilityTraits:](&v3, sel_setAccessibilityTraits_, accessibilityTraits);
}

- (void)setAccessibilityFrameInContainerSpace:(CGRect)accessibilityFrameInContainerSpace
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_accessibilityFrameInContainerSpace;

  height = accessibilityFrameInContainerSpace.size.height;
  width = accessibilityFrameInContainerSpace.size.width;
  y = accessibilityFrameInContainerSpace.origin.y;
  x = accessibilityFrameInContainerSpace.origin.x;
  p_accessibilityFrameInContainerSpace = &self->_accessibilityFrameInContainerSpace;
  if (!CGRectEqualToRect(self->_accessibilityFrameInContainerSpace, accessibilityFrameInContainerSpace))
  {
    p_accessibilityFrameInContainerSpace->origin.x = x;
    p_accessibilityFrameInContainerSpace->origin.y = y;
    p_accessibilityFrameInContainerSpace->size.width = width;
    p_accessibilityFrameInContainerSpace->size.height = height;
    -[UIAccessibilityElement _updateFocusLayerFrame](self, "_updateFocusLayerFrame");
  }
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  UIAccessibilityElement *v2;
  UIAccessibilityElement *v3;

  while (1)
  {
    v2 = -[NSObject accessibilityContainer](self, "accessibilityContainer");
    v3 = v2;
    if (!v2 || _UIFocusEnvironmentSafeCast(v2))
      break;
    self = v3;
  }
  return (UIFocusEnvironment *)v3;
}

- (void)setNeedsFocusUpdate
{
  -[UIFocusSystem requestFocusUpdateToEnvironment:](+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self), "requestFocusUpdateToEnvironment:", self);
  -[UIAccessibilityElement _updateFocusLayerFrame](self, "_updateFocusLayerFrame");
}

- (void)updateFocusIfNeeded
{
  -[UIFocusSystem updateFocusIfNeeded](+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self), "updateFocusIfNeeded");
  -[UIAccessibilityElement _updateFocusLayerFrame](self, "_updateFocusLayerFrame");
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)_destroyFocusLayer
{
  +[UIFocusRingManager removeRingFromFocusItem:](UIFocusRingManager, "removeRingFromFocusItem:", self);
}

- (void)_updateFocusLayerFrame
{
  +[UIFocusRingManager updateRingForFocusItem:](UIFocusRingManager, "updateRingForFocusItem:", self);
}

- (BOOL)canBecomeFocused
{
  _BOOL4 v3;

  v3 = -[UIAccessibilityElement isAccessibilityElement](self, "isAccessibilityElement");
  if (v3)
    LOBYTE(v3) = -[NSObject accessibilityRespondsToUserInteraction](self, "accessibilityRespondsToUserInteraction");
  return v3;
}

- (CGRect)frame
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v3 = -[UIAccessibilityElement _firstViewAncestor](self, "_firstViewAncestor");
  v4 = (void *)objc_msgSend(v3, "window");
  -[UIAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  objc_msgSend(v4, "convertRect:toView:", v3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  _UIFocusRegionSearchContextSearchForFocusRegionsInEnvironment(a3, self, 65793);
}

- (id)_preferredFocusRegionCoordinateSpace
{
  return (id)objc_msgSend((id)objc_msgSend(-[UIAccessibilityElement _firstViewAncestor](self, "_firstViewAncestor"), "_screen"), "coordinateSpace");
}

- (id)focusItemsInRect:(CGRect)a3
{
  NSArray *v3;

  v3 = -[NSObject accessibilityElements](self, "accessibilityElements", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return -[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1));
}

id __43__UIAccessibilityElement_focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = _UIFocusItemSafeCast(a2);
  if (result)
    return (id)(_IsKindOfUIView((uint64_t)a2) ^ 1);
  return result;
}

- (id)_firstViewAncestor
{
  id v2;

  v2 = -[NSObject accessibilityContainer](self, "accessibilityContainer");
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    v2 = (id)objc_msgSend(v2, "accessibilityContainer");
    objc_opt_class();
  }
  return v2;
}

- (id)nextResponder
{
  id v2;
  char v3;
  int v4;

  v2 = -[NSObject accessibilityContainer](self, "accessibilityContainer");
  v3 = objc_msgSend(v2, "__isKindOfUIResponder");
  if (v2 && (v3 & 1) == 0)
  {
    do
    {
      v2 = (id)objc_msgSend(v2, "accessibilityContainer");
      v4 = objc_msgSend(v2, "__isKindOfUIResponder");
    }
    while (v2 && !v4);
  }
  return v2;
}

- (CGRect)accessibilityFrameInContainerSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_accessibilityFrameInContainerSpace.origin.x;
  y = self->_accessibilityFrameInContainerSpace.origin.y;
  width = self->_accessibilityFrameInContainerSpace.size.width;
  height = self->_accessibilityFrameInContainerSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
