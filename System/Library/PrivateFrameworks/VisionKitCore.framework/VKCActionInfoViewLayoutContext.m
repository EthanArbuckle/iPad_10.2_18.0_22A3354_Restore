@implementation VKCActionInfoViewLayoutContext

- (VKCActionInfoViewLayoutContext)init
{
  VKCActionInfoViewLayoutContext *v2;
  NSMutableArray *v3;
  NSMutableArray *leadingLayout;
  NSMutableArray *v5;
  NSMutableArray *trailingLayout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKCActionInfoViewLayoutContext;
  v2 = -[VKCActionInfoViewLayoutContext init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leadingLayout = v2->_leadingLayout;
    v2->_leadingLayout = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    trailingLayout = v2->_trailingLayout;
    v2->_trailingLayout = v5;

  }
  return v2;
}

- (void)reset
{
  CGSize v3;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_containerBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_containerBounds.size = v3;
  self->_padding = 0.0;
  self->_scale = 0.0;
  self->_edgeInsets = *(UIEdgeInsets *)VKUIEdgeInsetsZero;
  *(_WORD *)&self->_didAddLeadingItem = 0;
  self->_animateItemVisibilityChanges = 0;
  self->_currentMaxX = 0.0;
  self->_currentMinX = 0.0;
  -[NSMutableArray removeAllObjects](self->_leadingLayout, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_trailingLayout, "removeAllObjects");
}

- (double)remainingWidth
{
  double v3;
  double v4;
  double v5;

  -[VKCActionInfoViewLayoutContext currentMaxX](self, "currentMaxX");
  v4 = v3;
  -[VKCActionInfoViewLayoutContext currentMinX](self, "currentMinX");
  return v4 - v5;
}

- (CGRect)containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerBounds.origin.x;
  y = self->_containerBounds.origin.y;
  width = self->_containerBounds.size.width;
  height = self->_containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (double)currentMaxX
{
  return self->_currentMaxX;
}

- (void)setCurrentMaxX:(double)a3
{
  self->_currentMaxX = a3;
}

- (double)currentMinX
{
  return self->_currentMinX;
}

- (void)setCurrentMinX:(double)a3
{
  self->_currentMinX = a3;
}

- (CATransform3D)transform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transform.m23 = v5;
  *(_OWORD *)&self->_transform.m11 = v3;
  *(_OWORD *)&self->_transform.m13 = v4;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transform.m43 = v8;
  *(_OWORD *)&self->_transform.m31 = v6;
  *(_OWORD *)&self->_transform.m33 = v7;
}

- (BOOL)didAddLeadingItem
{
  return self->_didAddLeadingItem;
}

- (void)setDidAddLeadingItem:(BOOL)a3
{
  self->_didAddLeadingItem = a3;
}

- (BOOL)didAddTrailingItem
{
  return self->_didAddTrailingItem;
}

- (void)setDidAddTrailingItem:(BOOL)a3
{
  self->_didAddTrailingItem = a3;
}

- (BOOL)animateItemVisibilityChanges
{
  return self->_animateItemVisibilityChanges;
}

- (void)setAnimateItemVisibilityChanges:(BOOL)a3
{
  self->_animateItemVisibilityChanges = a3;
}

- (BOOL)showingMoreButton
{
  return self->_showingMoreButton;
}

- (void)setShowingMoreButton:(BOOL)a3
{
  self->_showingMoreButton = a3;
}

- (NSMutableArray)leadingLayout
{
  return self->_leadingLayout;
}

- (void)setLeadingLayout:(id)a3
{
  objc_storeStrong((id *)&self->_leadingLayout, a3);
}

- (NSMutableArray)trailingLayout
{
  return self->_trailingLayout;
}

- (void)setTrailingLayout:(id)a3
{
  objc_storeStrong((id *)&self->_trailingLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingLayout, 0);
  objc_storeStrong((id *)&self->_leadingLayout, 0);
}

@end
