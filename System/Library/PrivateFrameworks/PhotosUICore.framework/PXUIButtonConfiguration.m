@implementation PXUIButtonConfiguration

- (PXUIButtonConfiguration)init
{
  PXUIButtonConfiguration *result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUIButtonConfiguration;
  result = -[PXUIButtonConfiguration init](&v4, sel_init);
  if (result)
  {
    v3 = *((_OWORD *)off_1E50B8010 + 1);
    *(_OWORD *)&result->_hitTestOutset.top = *(_OWORD *)off_1E50B8010;
    *(_OWORD *)&result->_hitTestOutset.bottom = v3;
    result->_allowAnimatedHighlighting = 0;
    result->_cursorEffect = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_hitTestOutset.top;
  *(_OWORD *)((char *)result + 40) = *(_OWORD *)&self->_hitTestOutset.bottom;
  *(_OWORD *)((char *)result + 24) = v5;
  *((_BYTE *)result + 8) = self->_allowAnimatedHighlighting;
  *((_QWORD *)result + 2) = self->_cursorEffect;
  return result;
}

- (UIEdgeInsets)hitTestOutset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestOutset.top;
  left = self->_hitTestOutset.left;
  bottom = self->_hitTestOutset.bottom;
  right = self->_hitTestOutset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitTestOutset:(UIEdgeInsets)a3
{
  self->_hitTestOutset = a3;
}

- (BOOL)allowAnimatedHighlighting
{
  return self->_allowAnimatedHighlighting;
}

- (void)setAllowAnimatedHighlighting:(BOOL)a3
{
  self->_allowAnimatedHighlighting = a3;
}

- (int64_t)cursorEffect
{
  return self->_cursorEffect;
}

- (void)setCursorEffect:(int64_t)a3
{
  self->_cursorEffect = a3;
}

+ (id)configurationWithCursorEffect:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setHitTestOutset:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  objc_msgSend(v4, "setCursorEffect:", a3);
  return v4;
}

@end
