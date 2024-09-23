@implementation PXStoryViewChromeTitleConfiguration

- (PXStoryViewChromeTitleConfiguration)init
{
  return -[PXStoryViewChromeTitleConfiguration initWithTextAlignment:margins:](self, "initWithTextAlignment:margins:", 1, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (PXStoryViewChromeTitleConfiguration)initWithTextAlignment:(int64_t)a3 margins:(UIEdgeInsets)a4
{
  return -[PXStoryViewChromeTitleConfiguration initWithTextAlignment:margins:hidden:](self, "initWithTextAlignment:margins:hidden:", a3, 0, a4.top, a4.left, a4.bottom, a4.right);
}

- (PXStoryViewChromeTitleConfiguration)initWithTextAlignment:(int64_t)a3 margins:(UIEdgeInsets)a4 hidden:(BOOL)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  PXStoryViewChromeTitleConfiguration *result;
  objc_super v12;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryViewChromeTitleConfiguration;
  result = -[PXStoryViewChromeTitleConfiguration init](&v12, sel_init);
  if (result)
  {
    result->_textAlignment = a3;
    result->_margins.top = top;
    result->_margins.left = left;
    result->_margins.bottom = bottom;
    result->_margins.right = right;
    result->_hidden = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[PXStoryViewChromeTitleConfiguration textAlignment](self, "textAlignment");
  -[PXStoryViewChromeTitleConfiguration margins](self, "margins");
  return (id)objc_msgSend(v4, "initWithTextAlignment:margins:hidden:", v5, -[PXStoryViewChromeTitleConfiguration hidden](self, "hidden"), v6, v7, v8, v9);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PXStoryViewChromeTitleConfiguration textAlignment](self, "textAlignment");
    if (v6 == objc_msgSend(v5, "textAlignment")
      && (-[PXStoryViewChromeTitleConfiguration margins](self, "margins"),
          objc_msgSend(v5, "margins"),
          PXEdgeInsetsEqualToEdgeInsets()))
    {
      v7 = -[PXStoryViewChromeTitleConfiguration hidden](self, "hidden");
      v8 = v7 ^ objc_msgSend(v5, "hidden") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[PXStoryViewChromeTitleConfiguration hidden](self, "hidden");
  return v3 | (2 * -[PXStoryViewChromeTitleConfiguration textAlignment](self, "textAlignment"));
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

@end
