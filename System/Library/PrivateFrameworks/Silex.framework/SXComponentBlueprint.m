@implementation SXComponentBlueprint

- (SXComponentBlueprint)initWithComponent:(id)a3 componentLayout:(id)a4 componentSizer:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXComponentBlueprint *v12;
  SXComponentBlueprint *v13;
  CGSize v14;
  NSUInteger v15;
  uint64_t v16;
  SXComponentState *componentState;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SXComponentBlueprint;
  v12 = -[SXComponentBlueprint init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_component, a3);
    objc_storeStrong((id *)&v13->_componentLayout, a4);
    objc_storeStrong((id *)&v13->_componentSizer, a5);
    v14 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v13->_frame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v13->_frame.size = v14;
    v13->_columnRange.location = objc_msgSend(v10, "columnRange");
    v13->_columnRange.length = v15;
    v16 = objc_opt_new();
    componentState = v13->_componentState;
    v13->_componentState = (SXComponentState *)v16;

  }
  return v13;
}

- (void)updateSize:(CGSize)a3
{
  self->_frame.size = a3;
  self->_hasValidSize = 1;
}

- (void)updatePosition:(CGPoint)a3
{
  self->_frame.origin = a3;
  self->_hasValidPosition = 1;
}

- (BOOL)hasValidLayout
{
  return self->_hasValidPosition && self->_hasValidSize || self->_hidden;
}

- (SXLayoutBlueprint)rootLayoutBlueprint
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  objc_msgSend(WeakRetained, "parentLayoutBlueprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      objc_msgSend(WeakRetained, "parentLayoutBlueprint");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "parentLayoutBlueprint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v4;
    }
    while (v5);
  }
  else
  {
    v4 = WeakRetained;
  }
  return (SXLayoutBlueprint *)v4;
}

- (void)invalidateLayout
{
  -[SXComponentBlueprint invalidateSize](self, "invalidateSize");
  -[SXComponentBlueprint invalidatePosition](self, "invalidatePosition");
}

- (void)invalidatePosition
{
  if (self)
    self->_hasValidPosition = 0;
}

- (void)invalidateSize
{
  if (self)
    self->_hasValidSize = 0;
}

- (void)storeInformationForRenderingPhase:(id)a3
{
  objc_storeStrong((id *)&self->_infoFromLayouting, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  id WeakRetained;
  CGSize size;
  CGSize v9;
  CGSize v10;
  CGSize v11;
  CGSize v12;
  __int128 v13;
  CGSize v14;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_storeStrong((id *)(v4 + 16), self->_component);
  objc_storeStrong((id *)(v4 + 40), self->_componentLayout);
  objc_storeStrong((id *)(v4 + 32), self->_componentSizer);
  v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)(v4 + 128) = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)(v4 + 144) = v5;
  v6 = *(_OWORD *)&self->_layoutMargins.bottom;
  *(_OWORD *)(v4 + 160) = *(_OWORD *)&self->_layoutMargins.top;
  *(_OWORD *)(v4 + 176) = v6;
  objc_storeStrong((id *)(v4 + 56), self->_infoFromLayouting);
  *(_NSRange *)(v4 + 64) = self->_columnRange;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  objc_storeWeak((id *)(v4 + 48), WeakRetained);

  *(_BYTE *)(v4 + 8) = self->_hasValidSize;
  *(_BYTE *)(v4 + 9) = self->_hasValidPosition;
  size = self->_frame.size;
  *(CGPoint *)(v4 + 96) = self->_frame.origin;
  *(CGSize *)(v4 + 112) = size;
  v9 = self->_absoluteFrame.size;
  *(CGPoint *)(v4 + 224) = self->_absoluteFrame.origin;
  *(CGSize *)(v4 + 240) = v9;
  v10 = self->_componentViewFrame.size;
  *(CGPoint *)(v4 + 256) = self->_componentViewFrame.origin;
  *(CGSize *)(v4 + 272) = v10;
  v11 = self->_contentViewFrame.size;
  *(CGPoint *)(v4 + 288) = self->_contentViewFrame.origin;
  *(CGSize *)(v4 + 304) = v11;
  v12 = self->_contentFrame.size;
  *(CGPoint *)(v4 + 320) = self->_contentFrame.origin;
  *(CGSize *)(v4 + 336) = v12;
  *(CGSize *)(v4 + 80) = self->_suggestedSizeAfterInvalidation;
  objc_storeStrong((id *)(v4 + 24), self->_componentState);
  v13 = *(_OWORD *)&self->_borderInsets.bottom;
  *(_OWORD *)(v4 + 192) = *(_OWORD *)&self->_borderInsets.top;
  *(_OWORD *)(v4 + 208) = v13;
  v14 = self->_backgroundViewFrame.size;
  *(CGPoint *)(v4 + 352) = self->_backgroundViewFrame.origin;
  *(CGSize *)(v4 + 368) = v14;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_class *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  NSRange v19;
  NSRange v20;
  CGRect v21;

  v18 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentBlueprint frame](self, "frame");
  NSStringFromCGRect(v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SXComponentBlueprint hasValidPosition](self, "hasValidPosition");
  v4 = -[SXComponentBlueprint hasValidSize](self, "hasValidSize");
  v5 = -[SXComponentBlueprint hasValidLayout](self, "hasValidLayout");
  -[SXComponentBlueprint component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  -[SXComponentBlueprint component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentBlueprint componentLayout](self, "componentLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19.location = objc_msgSend(v10, "columnRange");
  NSStringFromRange(v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20.location = -[SXComponentBlueprint columnRange](self, "columnRange");
  NSStringFromRange(v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p; frame: %@; hasValidPosition: %d; hasValidSize: %d; hasValidLayout: %d, component: %@, identifier: %@, columnRange: %@, convertedColumnRange: %@>"),
    v17,
    self,
    v16,
    v15,
    v4,
    v5,
    v7,
    v9,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentState)componentState
{
  return self->_componentState;
}

- (void)setComponentState:(id)a3
{
  objc_storeStrong((id *)&self->_componentState, a3);
}

- (SXComponentSizer)componentSizer
{
  return self->_componentSizer;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (SXLayoutBlueprint)parentLayoutBlueprint
{
  return (SXLayoutBlueprint *)objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
}

- (void)setParentLayoutBlueprint:(id)a3
{
  objc_storeWeak((id *)&self->_parentLayoutBlueprint, a3);
}

- (_NSRange)columnRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_columnRange.length;
  location = self->_columnRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setColumnRange:(_NSRange)a3
{
  self->_columnRange = a3;
}

- (BOOL)hasValidSize
{
  return self->_hasValidSize;
}

- (BOOL)hasValidPosition
{
  return self->_hasValidPosition;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (UIEdgeInsets)borderInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderInsets.top;
  left = self->_borderInsets.left;
  bottom = self->_borderInsets.bottom;
  right = self->_borderInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
}

- (CGRect)absoluteFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_absoluteFrame.origin.x;
  y = self->_absoluteFrame.origin.y;
  width = self->_absoluteFrame.size.width;
  height = self->_absoluteFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  self->_absoluteFrame = a3;
}

- (CGRect)componentViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_componentViewFrame.origin.x;
  y = self->_componentViewFrame.origin.y;
  width = self->_componentViewFrame.size.width;
  height = self->_componentViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setComponentViewFrame:(CGRect)a3
{
  self->_componentViewFrame = a3;
}

- (CGRect)contentViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentViewFrame.origin.x;
  y = self->_contentViewFrame.origin.y;
  width = self->_contentViewFrame.size.width;
  height = self->_contentViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentViewFrame:(CGRect)a3
{
  self->_contentViewFrame = a3;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (CGRect)backgroundViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundViewFrame.origin.x;
  y = self->_backgroundViewFrame.origin.y;
  width = self->_backgroundViewFrame.size.width;
  height = self->_backgroundViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBackgroundViewFrame:(CGRect)a3
{
  self->_backgroundViewFrame = a3;
}

- (CGSize)suggestedSizeAfterInvalidation
{
  double width;
  double height;
  CGSize result;

  width = self->_suggestedSizeAfterInvalidation.width;
  height = self->_suggestedSizeAfterInvalidation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSuggestedSizeAfterInvalidation:(CGSize)a3
{
  self->_suggestedSizeAfterInvalidation = a3;
}

- (NSDictionary)infoFromLayouting
{
  return self->_infoFromLayouting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoFromLayouting, 0);
  objc_destroyWeak((id *)&self->_parentLayoutBlueprint);
  objc_storeStrong((id *)&self->_componentLayout, 0);
  objc_storeStrong((id *)&self->_componentSizer, 0);
  objc_storeStrong((id *)&self->_componentState, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
