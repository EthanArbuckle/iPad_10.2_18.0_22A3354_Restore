@implementation SBHSidebarVisualConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    v5 = *(_OWORD *)&self->_insets.top;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_insets.bottom;
    *(_OWORD *)((char *)result + 40) = v5;
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_contentWidth;
    *((_BYTE *)result + 8) = self->_contentFullscreen;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_searchBarTopOffset;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_firstWidgetTopOffset;
  }
  return result;
}

- (SBHSidebarVisualConfiguration)init
{
  SBHSidebarVisualConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHSidebarVisualConfiguration;
  result = -[SBHSidebarVisualConfiguration init](&v3, sel_init);
  if (result)
    result->_contentWidth = 400.0;
  return result;
}

- (void)setSearchBarTopOffset:(double)a3
{
  self->_searchBarTopOffset = a3;
}

- (void)setContentWidth:(double)a3
{
  self->_contentWidth = a3;
}

- (void)setContentFullscreen:(BOOL)a3
{
  self->_contentFullscreen = a3;
}

- (double)effectiveContentWidthWithContainerWidth:(double)a3
{
  double v5;
  double v6;
  double result;

  if (-[SBHSidebarVisualConfiguration isContentFullscreen](self, "isContentFullscreen"))
  {
    -[SBHSidebarVisualConfiguration insets](self, "insets");
    return a3 - v5 - v6;
  }
  else
  {
    -[SBHSidebarVisualConfiguration contentWidth](self, "contentWidth");
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBHSidebarVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  SBHSidebarVisualConfiguration *v7;
  BOOL v8;

  v4 = (SBHSidebarVisualConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v7->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v7->_insets.bottom))), 0xFuLL))) & 1) != 0&& self->_contentWidth == v7->_contentWidth&& self->_contentFullscreen == v7->_contentFullscreen&& self->_searchBarTopOffset == v7->_searchBarTopOffset&& self->_firstWidgetTopOffset == v7->_firstWidgetTopOffset;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  double contentWidth;
  CGFloat v3;

  contentWidth = self->_contentWidth;
  v3 = self->_insets.top + self->_insets.leading + self->_insets.bottom + self->_insets.trailing + contentWidth;
  LOBYTE(contentWidth) = self->_contentFullscreen;
  return (unint64_t)(self->_firstWidgetTopOffset
                          + self->_searchBarTopOffset
                          + v3
                          + (double)*(unint64_t *)&contentWidth);
}

- (NSString)description
{
  return (NSString *)-[SBHSidebarVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHSidebarVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHSidebarVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  -[SBHSidebarVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSidebarVisualConfiguration contentWidth](self, "contentWidth");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("contentWidth"));
  -[SBHSidebarVisualConfiguration searchBarTopOffset](self, "searchBarTopOffset");
  v6 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("searchBarTopOffset"));
  -[SBHSidebarVisualConfiguration firstWidgetTopOffset](self, "firstWidgetTopOffset");
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("firstWidgetTopOffset"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHSidebarVisualConfiguration isContentFullscreen](self, "isContentFullscreen"), CFSTR("isContentFullscreen"));
  NSStringFromDirectionalEdgeInsets(self->_insets);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v9, CFSTR("insets"));

  return v4;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (double)searchBarTopOffset
{
  return self->_searchBarTopOffset;
}

- (double)firstWidgetTopOffset
{
  return self->_firstWidgetTopOffset;
}

- (void)setFirstWidgetTopOffset:(double)a3
{
  self->_firstWidgetTopOffset = a3;
}

- (BOOL)isContentFullscreen
{
  return self->_contentFullscreen;
}

- (NSDirectionalEdgeInsets)insets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_insets.top;
  leading = self->_insets.leading;
  bottom = self->_insets.bottom;
  trailing = self->_insets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  self->_insets = a3;
}

@end
