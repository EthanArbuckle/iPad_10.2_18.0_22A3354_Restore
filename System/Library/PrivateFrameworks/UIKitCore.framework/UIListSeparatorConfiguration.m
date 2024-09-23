@implementation UIListSeparatorConfiguration

- (void)setVisualEffect:(UIVisualEffect *)visualEffect
{
  objc_setProperty_nonatomic_copy(self, a2, visualEffect, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_multipleSelectionColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)_replaceAutomaticValuesWithValuesFromConfiguration:(id)a3
{
  double v5;
  double v6;
  double leading;
  double trailing;
  double v9;
  double v10;
  double v11;
  double v12;

  if (!self->_topSeparatorVisibility)
    self->_topSeparatorVisibility = objc_msgSend(a3, "topSeparatorVisibility");
  if (!self->_bottomSeparatorVisibility)
    self->_bottomSeparatorVisibility = objc_msgSend(a3, "bottomSeparatorVisibility");
  objc_msgSend(a3, "topSeparatorInsets");
  leading = self->_topSeparatorInsets.leading;
  if (leading == 1.79769313e308)
    leading = v5;
  if (self->_topSeparatorInsets.trailing == 1.79769313e308)
    trailing = v6;
  else
    trailing = self->_topSeparatorInsets.trailing;
  self->_topSeparatorInsets.leading = leading;
  self->_topSeparatorInsets.trailing = trailing;
  objc_msgSend(a3, "bottomSeparatorInsets");
  v11 = self->_bottomSeparatorInsets.leading;
  if (v11 == 1.79769313e308)
    v11 = v9;
  if (self->_bottomSeparatorInsets.trailing == 1.79769313e308)
    v12 = v10;
  else
    v12 = self->_bottomSeparatorInsets.trailing;
  self->_bottomSeparatorInsets.leading = v11;
  self->_bottomSeparatorInsets.trailing = v12;
}

- (NSDirectionalEdgeInsets)topSeparatorInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_topSeparatorInsets.top;
  leading = self->_topSeparatorInsets.leading;
  bottom = self->_topSeparatorInsets.bottom;
  trailing = self->_topSeparatorInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UIListSeparatorVisibility)bottomSeparatorVisibility
{
  return self->_bottomSeparatorVisibility;
}

- (UIListSeparatorVisibility)topSeparatorVisibility
{
  return self->_topSeparatorVisibility;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setBottomSeparatorInsets:(NSDirectionalEdgeInsets)bottomSeparatorInsets
{
  self->_bottomSeparatorInsets = bottomSeparatorInsets;
}

- (void)setTopSeparatorInsets:(NSDirectionalEdgeInsets)topSeparatorInsets
{
  self->_topSeparatorInsets = topSeparatorInsets;
}

- (void)setTopSeparatorVisibility:(UIListSeparatorVisibility)topSeparatorVisibility
{
  self->_topSeparatorVisibility = topSeparatorVisibility;
}

- (void)setBottomSeparatorVisibility:(UIListSeparatorVisibility)bottomSeparatorVisibility
{
  self->_bottomSeparatorVisibility = bottomSeparatorVisibility;
}

- (id)__copyWithSubclass:(Class)a3 inZone:(_NSZone *)a4
{
  objc_class *v5;
  objc_class *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;

  v5 = -[objc_class init](-[objc_class allocWithZone:](a3, "allocWithZone:", a4), "init");
  v6 = v5;
  if (v5)
  {
    *((_QWORD *)v5 + 2) = self->_topSeparatorVisibility;
    *((_QWORD *)v5 + 3) = self->_bottomSeparatorVisibility;
    v7 = *(_OWORD *)&self->_bottomSeparatorInsets.top;
    *(_OWORD *)((char *)v5 + 104) = *(_OWORD *)&self->_bottomSeparatorInsets.bottom;
    *(_OWORD *)((char *)v5 + 88) = v7;
    v8 = *(_OWORD *)&self->_topSeparatorInsets.top;
    *(_OWORD *)((char *)v5 + 72) = *(_OWORD *)&self->_topSeparatorInsets.bottom;
    *(_OWORD *)((char *)v5 + 56) = v8;
    objc_storeStrong((id *)v5 + 4, self->_color);
    objc_storeStrong((id *)v6 + 5, self->_multipleSelectionColor);
    v9 = -[UIVisualEffect copy](self->_visualEffect, "copy");
    v10 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v9;

    *((_BYTE *)v6 + 8) = self->_ignoreTopSeparatorInsetsFromCell;
    *((_BYTE *)v6 + 9) = self->_ignoreBottomSeparatorInsetsFromCell;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIListSeparatorConfiguration __copyWithSubclass:inZone:](self, "__copyWithSubclass:inZone:", objc_opt_class(), a3);
}

- (NSDirectionalEdgeInsets)bottomSeparatorInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_bottomSeparatorInsets.top;
  leading = self->_bottomSeparatorInsets.leading;
  bottom = self->_bottomSeparatorInsets.bottom;
  trailing = self->_bottomSeparatorInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)_setIgnoreTopSeparatorInsetsFromCell:(BOOL)a3
{
  self->_ignoreTopSeparatorInsetsFromCell = a3;
}

- (void)_setIgnoreBottomSeparatorInsetsFromCell:(BOOL)a3
{
  self->_ignoreBottomSeparatorInsetsFromCell = a3;
}

- (BOOL)_ignoreBottomSeparatorInsetsFromCell
{
  return self->_ignoreBottomSeparatorInsetsFromCell;
}

- (BOOL)_ignoreTopSeparatorInsetsFromCell
{
  return self->_ignoreTopSeparatorInsetsFromCell;
}

- (void)setColor:(UIColor *)color
{
  objc_storeStrong((id *)&self->_color, color);
}

- (UIListSeparatorConfiguration)initWithListAppearance:(UICollectionLayoutListAppearance)listAppearance
{
  UIListSeparatorConfiguration *v4;
  UIListSeparatorConfiguration *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIColor *v9;
  UIColor *color;
  UIColor *v11;
  uint64_t v12;
  UIColor *multipleSelectionColor;
  uint64_t v14;
  UIVisualEffect *visualEffect;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIListSeparatorConfiguration;
  v4 = -[UIListSeparatorConfiguration init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    v4->_topSeparatorVisibility = 0;
    v4->_bottomSeparatorVisibility = 0;
    v4->_bottomSeparatorInsets = UIListSeparatorAutomaticInsets;
    v4->_topSeparatorInsets = UIListSeparatorAutomaticInsets;
    if ((unint64_t)(listAppearance - 1) <= 2)
      v6 = qword_186680B30[listAppearance - 1];
    +[UITraitCollection _fallbackTraitCollection]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UITableConstantsForTraitCollection(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "defaultSeparatorColorForTableViewStyle:", v6);
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = v9;
    v11 = v9;

    -[UIListSeparatorConfiguration _multiselectSeparatorColorForListAppearance:](v5, "_multiselectSeparatorColorForListAppearance:", listAppearance);
    v12 = objc_claimAutoreleasedReturnValue();
    multipleSelectionColor = v5->_multipleSelectionColor;
    v5->_multipleSelectionColor = (UIColor *)v12;

    objc_msgSend(v8, "defaultSeparatorVisualEffectForTableViewStyle:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    visualEffect = v5->_visualEffect;
    v5->_visualEffect = (UIVisualEffect *)v14;

  }
  return v5;
}

- (id)_multiselectSeparatorColorForListAppearance:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain](UIListSeparatorConfiguration, "_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain", v3, v4);
      self = (UIListSeparatorConfiguration *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped](UIListSeparatorConfiguration, "_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped", v3, v4);
      self = (UIListSeparatorConfiguration *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped](UIListSeparatorConfiguration, "_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped", v3, v4);
      self = (UIListSeparatorConfiguration *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar](UIListSeparatorConfiguration, "_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar", v3, v4);
      self = (UIListSeparatorConfiguration *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[UIListSeparatorConfiguration _dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain](UIListSeparatorConfiguration, "_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain", v3, v4);
      self = (UIListSeparatorConfiguration *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain
{
  if (qword_1ECD7EEB0 != -1)
    dispatch_once(&qword_1ECD7EEB0, &__block_literal_global_336);
  return (id)_MergedGlobals_1124;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped
{
  if (qword_1ECD7EED0 != -1)
    dispatch_once(&qword_1ECD7EED0, &__block_literal_global_4_9);
  return (id)qword_1ECD7EEC8;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain
{
  if (qword_1ECD7EEF0 != -1)
    dispatch_once(&qword_1ECD7EEF0, &__block_literal_global_6_6);
  return (id)qword_1ECD7EEE8;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped
{
  if (qword_1ECD7EEC0 != -1)
    dispatch_once(&qword_1ECD7EEC0, &__block_literal_global_3_11);
  return (id)qword_1ECD7EEB8;
}

- (BOOL)isEqual:(id)a3
{
  char *v5;
  unsigned __int8 *v6;
  BOOL v7;

  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (char *)a3;
  v6 = (unsigned __int8 *)v5;
  v7 = self->_topSeparatorVisibility == *((_QWORD *)v5 + 2)
    && self->_bottomSeparatorVisibility == *((_QWORD *)v5 + 3)
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_bottomSeparatorInsets.top, *(float64x2_t *)(v5 + 88)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_bottomSeparatorInsets.bottom, *(float64x2_t *)(v5 + 104)))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_topSeparatorInsets.top, *(float64x2_t *)(v5 + 56)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_topSeparatorInsets.bottom,
                                                   *(float64x2_t *)(v5 + 72)))),
                                  0xFuLL))) & 1) != 0
    && -[UIColor isEqual:](self->_color, "isEqual:", *((_QWORD *)v5 + 4))
    && -[UIColor isEqual:](self->_multipleSelectionColor, "isEqual:", *((_QWORD *)v6 + 5))
    && UIEqual(self->_visualEffect, *((void **)v6 + 6))
    && self->_ignoreTopSeparatorInsetsFromCell == v6[8]
    && self->_ignoreBottomSeparatorInsetsFromCell == v6[9];

  return v7;
}

void __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  +[UITraitCollection _fallbackTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "defaultSeparatorColorForTableViewStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "defaultSidebarPlainMultiSelectSeparatorColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped__block_invoke_2;
  v9[3] = &unk_1E16D56A0;
  v12 = 0;
  v10 = v3;
  v11 = v2;
  v5 = v2;
  v6 = v4;
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ECD7EEB8;
  qword_1ECD7EEB8 = v7;

}

void __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  +[UITraitCollection _fallbackTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "defaultSeparatorColorForTableViewStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "defaultSidebarPlainMultiSelectSeparatorColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain__block_invoke_2;
  v9[3] = &unk_1E16D56A0;
  v12 = 1;
  v10 = v3;
  v11 = v2;
  v5 = v2;
  v6 = v4;
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ECD7EEE8;
  qword_1ECD7EEE8 = v7;

}

void __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  +[UITraitCollection _fallbackTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "defaultSeparatorColorForTableViewStyle:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "defaultSidebarPlainMultiSelectSeparatorColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped__block_invoke_2;
  v9[3] = &unk_1E16D56A0;
  v12 = 0;
  v10 = v3;
  v11 = v2;
  v5 = v2;
  v6 = v4;
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ECD7EEC8;
  qword_1ECD7EEC8 = v7;

}

void __103__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  +[UITraitCollection _fallbackTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "defaultSeparatorColorForTableViewStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "defaultSidebarPlainMultiSelectSeparatorColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain__block_invoke_2;
  v9[3] = &unk_1E16D56A0;
  v12 = 0;
  v10 = v3;
  v11 = v2;
  v5 = v2;
  v6 = v4;
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_MergedGlobals_1124;
  _MergedGlobals_1124 = v7;

}

id __103__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearancePlain__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id *v4;

  if ((unint64_t)(objc_msgSend(a2, "_focusSystemState") - 1) <= 1
    && !_AXSFullKeyboardAccessEnabled())
  {
    if (a2)
    {
      _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
      if (a2[25] == 1)
        goto LABEL_4;
    }
LABEL_7:
    v4 = (id *)(a1 + 40);
    return *v4;
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_7;
LABEL_4:
  v4 = (id *)(a1 + 32);
  return *v4;
}

id __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceGrouped__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id *v4;

  if ((unint64_t)(objc_msgSend(a2, "_focusSystemState") - 1) <= 1
    && !_AXSFullKeyboardAccessEnabled())
  {
    if (a2)
    {
      _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
      if (a2[25] == 1)
        goto LABEL_4;
    }
LABEL_7:
    v4 = (id *)(a1 + 40);
    return *v4;
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_7;
LABEL_4:
  v4 = (id *)(a1 + 32);
  return *v4;
}

id __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceInsetGrouped__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id *v4;

  if ((unint64_t)(objc_msgSend(a2, "_focusSystemState") - 1) <= 1
    && !_AXSFullKeyboardAccessEnabled())
  {
    if (a2)
    {
      _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
      if (a2[25] == 1)
        goto LABEL_4;
    }
LABEL_7:
    v4 = (id *)(a1 + 40);
    return *v4;
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_7;
LABEL_4:
  v4 = (id *)(a1 + 32);
  return *v4;
}

+ (id)_dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar
{
  if (qword_1ECD7EEE0 != -1)
    dispatch_once(&qword_1ECD7EEE0, &__block_literal_global_5_6);
  return (id)qword_1ECD7EED8;
}

void __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  +[UITraitCollection _fallbackTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "defaultSeparatorColorForTableViewStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "defaultSidebarPlainMultiSelectSeparatorColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar__block_invoke_2;
  v9[3] = &unk_1E16D56A0;
  v12 = 0;
  v10 = v3;
  v11 = v2;
  v5 = v2;
  v6 = v4;
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ECD7EED8;
  qword_1ECD7EED8 = v7;

}

id __105__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebar__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id *v4;

  if ((unint64_t)(objc_msgSend(a2, "_focusSystemState") - 1) <= 1
    && !_AXSFullKeyboardAccessEnabled())
  {
    if (a2)
    {
      _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
      if (a2[25] == 1)
        goto LABEL_4;
    }
LABEL_7:
    v4 = (id *)(a1 + 40);
    return *v4;
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_7;
LABEL_4:
  v4 = (id *)(a1 + 32);
  return *v4;
}

id __110__UIListSeparatorConfiguration__dynamicMultiselectSeparatorColor_UICollectionLayoutListAppearanceSidebarPlain__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id *v4;

  if ((unint64_t)(objc_msgSend(a2, "_focusSystemState") - 1) <= 1
    && !_AXSFullKeyboardAccessEnabled())
  {
    if (a2)
    {
      _UIRecordTraitUsage((unint64_t)a2, 0x19uLL);
      if (a2[25] == 1)
        goto LABEL_4;
    }
LABEL_7:
    v4 = (id *)(a1 + 40);
    return *v4;
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_7;
LABEL_4:
  v4 = (id *)(a1 + 32);
  return *v4;
}

- (unint64_t)hash
{
  int64_t v3;
  unint64_t v4;

  v3 = self->_bottomSeparatorVisibility ^ self->_topSeparatorVisibility;
  v4 = v3 ^ -[UIColor hash](self->_color, "hash");
  return v4 ^ -[UIColor hash](self->_multipleSelectionColor, "hash") ^ ((unint64_t)self->_bottomSeparatorInsets.trailing
                                                                      + (unint64_t)self->_bottomSeparatorInsets.leading);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t topSeparatorVisibility;
  const __CFString *v6;
  unint64_t bottomSeparatorVisibility;
  const __CFString *v8;
  double leading;
  double trailing;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  topSeparatorVisibility = self->_topSeparatorVisibility;
  if (topSeparatorVisibility > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E16D56C0[topSeparatorVisibility];
  bottomSeparatorVisibility = self->_bottomSeparatorVisibility;
  if (bottomSeparatorVisibility > 2)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E16D56C0[bottomSeparatorVisibility];
  leading = self->_bottomSeparatorInsets.leading;
  trailing = self->_bottomSeparatorInsets.trailing;
  v11 = (void *)MEMORY[0x1E0CB3940];
  if (leading == 1.79769313e308)
  {
    v12 = CFSTR("auto");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bottomSeparatorInsets.leading);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (trailing == 1.79769313e308)
  {
    objc_msgSend(v11, "stringWithFormat:", CFSTR("{l: %@, t: %@}"), v12, CFSTR("auto"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", trailing);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("{l: %@, t: %@}"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (leading != 1.79769313e308)

  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p visibility: {top: %@, bottom: %@}, bottom insets: %@>"), v4, self, v6, v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListSeparatorConfiguration)initWithCoder:(id)a3
{
  UIListSeparatorConfiguration *v4;
  uint64_t v5;
  UIColor *color;
  uint64_t v7;
  UIColor *multipleSelectionColor;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  UIVisualEffect *visualEffect;

  v4 = -[UIListSeparatorConfiguration init](self, "init");
  if (v4)
  {
    v4->_topSeparatorVisibility = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("topSepVisibility"));
    v4->_bottomSeparatorVisibility = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bottomSepVisibility"));
    objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v5 = objc_claimAutoreleasedReturnValue();
    color = v4->_color;
    v4->_color = (UIColor *)v5;

    objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiSelectColor"));
    v7 = objc_claimAutoreleasedReturnValue();
    multipleSelectionColor = v4->_multipleSelectionColor;
    v4->_multipleSelectionColor = (UIColor *)v7;

    objc_msgSend(a3, "decodeDirectionalEdgeInsetsForKey:", CFSTR("topSepInsets"));
    v4->_topSeparatorInsets.top = v9;
    v4->_topSeparatorInsets.leading = v10;
    v4->_topSeparatorInsets.bottom = v11;
    v4->_topSeparatorInsets.trailing = v12;
    objc_msgSend(a3, "decodeDirectionalEdgeInsetsForKey:", CFSTR("insets"));
    v4->_bottomSeparatorInsets.top = v13;
    v4->_bottomSeparatorInsets.leading = v14;
    v4->_bottomSeparatorInsets.bottom = v15;
    v4->_bottomSeparatorInsets.trailing = v16;
    objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visualEffect"));
    v17 = objc_claimAutoreleasedReturnValue();
    visualEffect = v4->_visualEffect;
    v4->_visualEffect = (UIVisualEffect *)v17;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_topSeparatorVisibility, CFSTR("topSepVisibility"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_bottomSeparatorVisibility, CFSTR("bottomSepVisibility"));
  objc_msgSend(a3, "encodeDirectionalEdgeInsets:forKey:", CFSTR("topSepInsets"), self->_topSeparatorInsets.top, self->_topSeparatorInsets.leading, self->_topSeparatorInsets.bottom, self->_topSeparatorInsets.trailing);
  objc_msgSend(a3, "encodeDirectionalEdgeInsets:forKey:", CFSTR("insets"), self->_bottomSeparatorInsets.top, self->_bottomSeparatorInsets.leading, self->_bottomSeparatorInsets.bottom, self->_bottomSeparatorInsets.trailing);
  objc_msgSend(a3, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_multipleSelectionColor, CFSTR("multiSelectColor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_visualEffect, CFSTR("visualEffect"));
}

- (UIColor)multipleSelectionColor
{
  return self->_multipleSelectionColor;
}

- (void)setMultipleSelectionColor:(UIColor *)multipleSelectionColor
{
  objc_storeStrong((id *)&self->_multipleSelectionColor, multipleSelectionColor);
}

@end
