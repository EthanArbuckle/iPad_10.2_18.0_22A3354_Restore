@implementation _UITabBarItemData

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3
{
  UIOffset *titlePositionAdjustment;
  CGFloat *p_vertical;
  double v5;
  double horizontal;
  UIOffset result;

  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 4) != 0)
  {
    titlePositionAdjustment = &self->_titlePositionAdjustment[a3];
  }
  else
  {
    if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 4) != 0)
    {
      titlePositionAdjustment = &self->_titlePositionAdjustment[1];
      p_vertical = &self->_titlePositionAdjustment[1].vertical;
      goto LABEL_9;
    }
    if ((*(_WORD *)self->_stateFlags & 4) != 0)
      titlePositionAdjustment = self->_titlePositionAdjustment;
    else
      titlePositionAdjustment = (UIOffset *)&UIOffsetZero;
  }
  p_vertical = &titlePositionAdjustment->vertical;
LABEL_9:
  v5 = *p_vertical;
  horizontal = titlePositionAdjustment->horizontal;
  result.vertical = v5;
  result.horizontal = horizontal;
  return result;
}

- (UIOffset)badgeTitlePositionAdjustmentForState:(int64_t)a3
{
  UIOffset *badgeTitlePositionAdjustment;
  CGFloat *p_vertical;
  double v5;
  double horizontal;
  UIOffset result;

  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 0x100) != 0)
  {
    badgeTitlePositionAdjustment = &self->_badgeTitlePositionAdjustment[a3];
  }
  else
  {
    if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x100) != 0)
    {
      badgeTitlePositionAdjustment = &self->_badgeTitlePositionAdjustment[1];
      p_vertical = &self->_badgeTitlePositionAdjustment[1].vertical;
      goto LABEL_9;
    }
    if ((*(_WORD *)self->_stateFlags & 0x100) != 0)
      badgeTitlePositionAdjustment = self->_badgeTitlePositionAdjustment;
    else
      badgeTitlePositionAdjustment = (UIOffset *)&UIOffsetZero;
  }
  p_vertical = &badgeTitlePositionAdjustment->vertical;
LABEL_9:
  v5 = *p_vertical;
  horizontal = badgeTitlePositionAdjustment->horizontal;
  result.vertical = v5;
  result.horizontal = horizontal;
  return result;
}

- (BOOL)titleTextAttributesSpecifyColorForState:(int64_t)a3
{
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  _BOOL4 v4;

  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (!a3)
    {
      stateFlags = self->_stateFlags;
      return (*(_WORD *)stateFlags >> 1) & 1;
    }
    if (a3 != 4)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    stateFlags = self->_stateFlags;
    if ((*(_WORD *)&self[1].super._immutable & 2) == 0 && (*(_WORD *)&self->_stateFlags[2] & 2) == 0)
      return (*(_WORD *)stateFlags >> 1) & 1;
  }
  else
  {
    stateFlags = self->_stateFlags;
    if ((*(_WORD *)&self->_stateFlags[2 * a3] & 2) == 0)
      return (*(_WORD *)stateFlags >> 1) & 1;
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  unint64_t style;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  style = self->_style;
  if (style < 2)
  {
    v5 = (void *)_MergedGlobals_3_25;
    if (!_MergedGlobals_3_25)
    {
      if (dyld_program_sdk_at_least())
        +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 3, 18.0);
      else
        +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
      v6 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)_MergedGlobals_3_25;
      _MergedGlobals_3_25 = v6;

      v5 = (void *)_MergedGlobals_3_25;
    }
    goto LABEL_16;
  }
  if (style == 2)
  {
    v5 = (void *)qword_1ECD7A7A8;
    if (!qword_1ECD7A7A8)
    {
      if (dyld_program_sdk_at_least())
        +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 17.0);
      else
        +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleFootnote"), 3);
      v7 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)qword_1ECD7A7A8;
      qword_1ECD7A7A8 = v7;

      v5 = (void *)qword_1ECD7A7A8;
    }
LABEL_16:
    v4 = v5;
    return (UIImageSymbolConfiguration *)v4;
  }
  if (style == 3)
    v3 = +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 2);
  v4 = 0;
  return (UIImageSymbolConfiguration *)v4;
}

+ (id)standardItemDataForStyle:(int64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  void *v12;
  uint64_t v13;

  if ((unint64_t)a3 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UITabBarItemData.m"), 44, CFSTR("Unsupported style %li"), a3);
  }
  else
  {
    if (a3 != 3)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UITabBarItemData.m"), 45, CFSTR("CarPlay customization is not currently supported"), v13);
  }

LABEL_3:
  v6 = (void *)_UITabBarItemStyleData[a3];
  if (!v6)
  {
    v7 = objc_opt_new();
    v8 = (void *)_UITabBarItemStyleData[a3];
    _UITabBarItemStyleData[a3] = v7;

    v9 = (_QWORD *)_UITabBarItemStyleData[a3];
    v9[2] = a3;
    v10 = (id)objc_msgSend(v9, "markReadOnly");
    v6 = (void *)_UITabBarItemStyleData[a3];
  }
  return v6;
}

- (id)replicate
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UITabBarItemData;
  -[_UIBarAppearanceData replicate](&v12, sel_replicate);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  v3[2] = self->_style;
  v6 = v3 + 3;
  do
  {
    v7 = -[NSDictionary copy](self->_titleTextAttributes[v5 / 2], "copy");
    v8 = (void *)v6[v5 / 2];
    v6[v5 / 2] = v7;

    v9 = -[NSDictionary copy](self->_badgeTextAttributes[v5 / 2], "copy");
    v10 = (void *)v3[v5 / 2 + 8];
    v3[v5 / 2 + 8] = v9;

    objc_storeStrong((id *)&v3[v5 / 2 + 13], self->_iconColor[v5 / 2]);
    objc_storeStrong((id *)&v3[v5 / 2 + 18], self->_badgeBackgroundColor[v5 / 2]);
    *(UIOffset *)&v3[v4 / 8 + 23] = self->_titlePositionAdjustment[v4 / 0x10];
    *(UIOffset *)&v3[v4 / 8 + 33] = self->_badgePositionAdjustment[v4 / 0x10];
    *(UIOffset *)&v3[v4 / 8 + 43] = self->_badgeTitlePositionAdjustment[v4 / 0x10];
    v3[v5 / 2 + 53] = *(_QWORD *)&self->_stateFlags[v5];
    v5 += 2;
    v4 += 16;
  }
  while (v5 != 10);
  return v3;
}

- (BOOL)checkEqualTo:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  void *v9;
  UIColor *v10;
  UIColor *v11;
  UIColor *v12;
  BOOL v13;
  _BOOL4 v14;
  void *v15;
  UIColor *v16;
  _BOOL4 v17;
  void *v18;
  UIColor *v19;
  _BOOL4 v20;
  void *v21;
  UIColor *v22;
  _BOOL4 v23;
  BOOL v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UITabBarItemData;
  if (-[_UIBarAppearanceData checkEqualTo:](&v26, sel_checkEqualTo_, v4) && self->_style == v4[2])
  {
    v5 = 0;
    while (1)
    {
      v6 = vmovn_s64(vceqq_f64((float64x2_t)self->_titlePositionAdjustment[v5], *(float64x2_t *)&v4[2 * v5 + 23]));
      if ((v6.i32[0] & v6.i32[1] & 1) == 0)
        break;
      v7 = vmovn_s64(vceqq_f64((float64x2_t)self->_badgePositionAdjustment[v5], *(float64x2_t *)&v4[2 * v5 + 33]));
      if ((v7.i32[0] & v7.i32[1] & 1) == 0)
        break;
      v8 = vmovn_s64(vceqq_f64((float64x2_t)self->_badgeTitlePositionAdjustment[v5], *(float64x2_t *)&v4[2 * v5 + 43]));
      if ((v8.i32[0] & v8.i32[1] & 1) == 0)
        break;
      v9 = (void *)v4[v5 + 13];
      v10 = self->_iconColor[v5];
      v11 = v9;
      if (v10 == v11)
      {

      }
      else
      {
        v12 = v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (v13)
        {
LABEL_35:

          break;
        }
        v14 = -[UIColor isEqual:](v10, "isEqual:", v11);

        if (!v14)
          break;
      }
      v15 = (void *)v4[v5 + 18];
      v10 = self->_badgeBackgroundColor[v5];
      v16 = v15;
      if (v10 == v16)
      {

      }
      else
      {
        v12 = v16;
        if (!v10 || !v16)
          goto LABEL_35;
        v17 = -[UIColor isEqual:](v10, "isEqual:", v16);

        if (!v17)
          break;
      }
      v18 = (void *)v4[v5 + 3];
      v10 = self->_titleTextAttributes[v5];
      v19 = v18;
      if (v10 == v19)
      {

      }
      else
      {
        v12 = v19;
        if (!v10 || !v19)
          goto LABEL_35;
        v20 = -[UIColor isEqual:](v10, "isEqual:", v19);

        if (!v20)
          break;
      }
      v21 = (void *)v4[v5 + 8];
      v10 = self->_badgeTextAttributes[v5];
      v22 = v21;
      if (v10 == v22)
      {

      }
      else
      {
        v12 = v22;
        if (!v10 || !v22)
          goto LABEL_35;
        v23 = -[UIColor isEqual:](v10, "isEqual:", v22);

        if (!v23)
          break;
      }
      if (++v5 == 5)
      {
        v24 = 1;
        goto LABEL_37;
      }
    }
  }
  v24 = 0;
LABEL_37:

  return v24;
}

- (id)badgeBackgroundColorForState:(int64_t)a3
{
  UIColor *v3;
  UIColor *v4;

  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 0x20) != 0)
  {
    v4 = self->_badgeBackgroundColor[a3];
LABEL_11:
    v3 = v4;
    return v3;
  }
  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x20) != 0)
  {
    v4 = self->_badgeBackgroundColor[1];
    goto LABEL_11;
  }
  if ((*(_WORD *)self->_stateFlags & 0x20) != 0)
  {
    v4 = self->_badgeBackgroundColor[0];
    goto LABEL_11;
  }
  if ((unint64_t)(self->_style - 3) >= 2)
    +[UIColor systemRedColor](UIColor, "systemRedColor");
  else
    +[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)badgeTextAttributesForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6;
  void *v7;
  $BBD6068E7A01029EE6768D8E462B9288 *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *v18;

  v6 = a4;
  v7 = v6;
  v8 = &self->_stateFlags[2 * a3];
  if ((*(_WORD *)v8 & 0x40) != 0)
  {
    if (v6)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_badgeTextAttributes[a3], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 == v11)
        v9 = 0;
      else
        v9 = v11;

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    -[_UITabBarItemData _fallbackBadgeTitleFontForState:compatibleWithTraitCollection:](self, "_fallbackBadgeTitleFontForState:compatibleWithTraitCollection:", a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  if ((*(_WORD *)v8 & 0x80) != 0)
  {
    v13 = 0;
  }
  else
  {
    -[_UITabBarItemData _fallbackBadgeTitleColorForState:](self, "_fallbackBadgeTitleColorForState:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = self->_badgeTextAttributes[a3];
  if (v9 | v13)
  {
    v15 = (void *)-[NSDictionary mutableCopy](v14, "mutableCopy");
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    if (v9)
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v9, *(_QWORD *)off_1E1678D90);
    if (v13)
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v13, *(_QWORD *)off_1E1678D98);
  }
  else
  {
    v18 = v14;
  }

  return v18;
}

- (id)_fallbackBadgeTitleFontForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a4;
  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x40) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_badgeTextAttributes[1], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if ((*(_WORD *)self->_stateFlags & 0x40) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_badgeTextAttributes[0], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v7, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
  }
  else
  {
    switch(self->_style)
    {
      case 0:
      case 1:
        v10 = off_1E167A828;
        v11 = 13.0;
        goto LABEL_16;
      case 2:
        objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 10.0, *(double *)off_1E167DC68);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3:
        v10 = off_1E167A828;
        v11 = 10.0;
        goto LABEL_16;
      case 4:
        v10 = off_1E167A828;
        v11 = 28.0;
LABEL_16:
        objc_msgSend(v10, "systemFontOfSize:", v11);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v7 = (void *)v14;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UITabBarItemData _fallbackBadgeTitleFontForState:compatibleWithTraitCollection:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_UITabBarItemData.m"), 472, CFSTR("Unknown title style %li"), self->_style);

        v7 = 0;
        break;
    }
  }

  return v7;
}

- (id)_fallbackBadgeTitleColorForState:(int64_t)a3
{
  void *v3;
  NSDictionary *v4;

  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x80) != 0)
  {
    v4 = self->_badgeTextAttributes[1];
    goto LABEL_7;
  }
  if ((*(_WORD *)self->_stateFlags & 0x80) != 0)
  {
    v4 = self->_badgeTextAttributes[0];
LABEL_7:
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  +[UIColor whiteColor](UIColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)iconColorForState:(int64_t)a3
{
  UIColor **iconColor;

  if (a3 == 2 || (*(_WORD *)&self->_stateFlags[2 * a3] & 8) != 0)
  {
    iconColor = &self->_iconColor[a3];
  }
  else if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 8) != 0)
  {
    iconColor = &self->_iconColor[1];
  }
  else
  {
    if ((*(_WORD *)self->_stateFlags & 8) == 0)
      return 0;
    iconColor = self->_iconColor;
  }
  return *iconColor;
}

- (id)titleTextAttributesForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6;
  void *v7;
  $BBD6068E7A01029EE6768D8E462B9288 *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *v18;

  v6 = a4;
  v7 = v6;
  v8 = &self->_stateFlags[2 * a3];
  if ((*(_WORD *)v8 & 1) != 0)
  {
    if (v6)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[a3], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 == v11)
        v9 = 0;
      else
        v9 = v11;

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    -[_UITabBarItemData _fallbackTitleFontForState:compatibleWithTraitCollection:](self, "_fallbackTitleFontForState:compatibleWithTraitCollection:", a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v13 = 0;
  if (a3 != 2 && (*(_WORD *)v8 & 2) == 0)
  {
    -[_UITabBarItemData _fallbackTitleColorForState:](self, "_fallbackTitleColorForState:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = self->_titleTextAttributes[a3];
  if (v9 | v13)
  {
    v15 = (void *)-[NSDictionary mutableCopy](v14, "mutableCopy");
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    if (v9)
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v9, *(_QWORD *)off_1E1678D90);
    if (v13)
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v13, *(_QWORD *)off_1E1678D98);
  }
  else
  {
    v18 = v14;
  }

  return v18;
}

- (id)_fallbackTitleFontForState:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const UIFontTextStyle *v14;

  v6 = a4;
  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[1], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if ((*(_WORD *)self->_stateFlags & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_titleTextAttributes[0], "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v7, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
  }
  else
  {
    v7 = 0;
    switch(self->_style)
    {
      case 0:
        objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 10.0, *(double *)off_1E167DC68);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 1:
        v13 = off_1E167A828;
        v14 = &UIFontTextStyleFootnote;
        goto LABEL_15;
      case 2:
        v13 = off_1E167A828;
        v14 = &UIFontTextStyleCaption1;
LABEL_15:
        objc_msgSend(v13, "preferredFontForTextStyle:compatibleWithTraitCollection:", *v14, v6);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v7 = (void *)v10;
        break;
      case 3:
      case 4:
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UITabBarItemData _fallbackTitleFontForState:compatibleWithTraitCollection:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_UITabBarItemData.m"), 425, CFSTR("Unknown title style %li"), self->_style);

        v7 = 0;
        break;
    }
  }

  return v7;
}

- (id)_fallbackTitleColorForState:(int64_t)a3
{
  NSDictionary **titleTextAttributes;

  if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 2) != 0)
  {
    titleTextAttributes = &self->_titleTextAttributes[1];
  }
  else
  {
    if ((*(_WORD *)self->_stateFlags & 2) == 0)
      return 0;
    titleTextAttributes = self->_titleTextAttributes;
  }
  -[NSDictionary objectForKeyedSubscript:](*titleTextAttributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)titleTextAttributesForState:(int64_t)a3
{
  return -[_UITabBarItemData titleTextAttributesForState:compatibleWithTraitCollection:](self, "titleTextAttributesForState:compatibleWithTraitCollection:", a3, 0);
}

- (void)setTitleTextAttributes:(id)a3 forState:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;

  v7 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFFE | (v8 != 0);

  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFFD | (2 * (v9 != 0));

  v10 = (NSDictionary *)objc_msgSend(v7, "copy");
  v11 = self->_titleTextAttributes[a4];
  self->_titleTextAttributes[a4] = v10;

}

- (void)setIconColor:(id)a3 forState:(int64_t)a4
{
  UIColor *v7;
  UIColor *v8;

  v7 = (UIColor *)a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = self->_iconColor[a4];
  self->_iconColor[a4] = v7;

  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFF7 | (8 * (v7 != 0));
}

- (void)_decodeTitleTextAttributesFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSDictionary **titleTextAttributes;
  uint64_t v10;
  void *v11;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *v29;
  NSDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Normal.TitleTextAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", CFSTR("Normal.TitleTextAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  titleTextAttributes = self->_titleTextAttributes;
  objc_storeStrong((id *)self->_titleTextAttributes, v8);
  v10 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFFE | (v11 != 0);

  v13 = *(_QWORD *)off_1E1678D98;
  v33 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)stateFlags = *(_WORD *)stateFlags & 0xFFFD | (2 * (v14 != 0));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Highlighted.TitleTextAttributes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", CFSTR("Highlighted.TitleTextAttributes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)titleTextAttributes + 1, v16);
  objc_msgSend(v16, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFFE | (v17 != 0);

  objc_msgSend(v16, "objectForKeyedSubscript:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFFD | (2 * (v18 != 0));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Selected.TitleTextAttributes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", CFSTR("Selected.TitleTextAttributes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)titleTextAttributes + 2, v20);
  objc_msgSend(v20, "objectForKeyedSubscript:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFFE | (v21 != 0);

  objc_msgSend(v20, "objectForKeyedSubscript:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFFD | (2 * (v22 != 0));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Disabled.TitleTextAttributes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", CFSTR("Disabled.TitleTextAttributes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)titleTextAttributes + 3, v24);
  objc_msgSend(v24, "objectForKeyedSubscript:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFFE | (v25 != 0);

  objc_msgSend(v24, "objectForKeyedSubscript:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFFD | (2 * (v26 != 0));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Focused.TitleTextAttributes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", v27);
    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v34, "_ui_decodeTextAttributesForKey:", CFSTR("Focused.TitleTextAttributes"));
    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v29 = titleTextAttributes[4];
  titleTextAttributes[4] = v28;
  v30 = v28;

  -[NSDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFFE | (v31 != 0);

  -[NSDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFFD | (2 * (v32 != 0));
}

- (void)_decodeBadgeTextAttributesFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSDictionary **badgeTextAttributes;
  uint64_t v10;
  void *v11;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Normal.BadgeTextAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", CFSTR("Normal.BadgeTextAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  badgeTextAttributes = self->_badgeTextAttributes;
  objc_storeStrong((id *)self->_badgeTextAttributes, v8);
  v10 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFBF | ((v11 != 0) << 6);

  v13 = *(_QWORD *)off_1E1678D98;
  v32 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)stateFlags = *(_WORD *)stateFlags & 0xFF7F | ((v14 != 0) << 7);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Highlighted.BadgeTextAttributes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", CFSTR("Highlighted.BadgeTextAttributes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)badgeTextAttributes + 1, v16);
  objc_msgSend(v16, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFBF | ((v17 != 0) << 6);

  objc_msgSend(v16, "objectForKeyedSubscript:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFF7F | ((v18 != 0) << 7);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Selected.BadgeTextAttributes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", CFSTR("Selected.BadgeTextAttributes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)badgeTextAttributes + 2, v20);
  objc_msgSend(v20, "objectForKeyedSubscript:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFBF | ((v21 != 0) << 6);

  objc_msgSend(v20, "objectForKeyedSubscript:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFF7F | ((v22 != 0) << 7);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Disabled.BadgeTextAttributes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", CFSTR("Disabled.BadgeTextAttributes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)badgeTextAttributes + 3, v24);
  objc_msgSend(v24, "objectForKeyedSubscript:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFBF | ((v25 != 0) << 6);

  objc_msgSend(v24, "objectForKeyedSubscript:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFF7F | ((v26 != 0) << 7);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Focused.BadgeTextAttributes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v33, "_ui_decodeTextAttributesForKey:", CFSTR("Focused.BadgeTextAttributes"));
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v29 = badgeTextAttributes[4];
  badgeTextAttributes[4] = (NSDictionary *)v28;

  objc_msgSend(v24, "objectForKeyedSubscript:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFBF | ((v30 != 0) << 6);

  objc_msgSend(v24, "objectForKeyedSubscript:", v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFF7F | ((v31 != 0) << 7);

}

- (void)_decodeIconColorFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *iconColor;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Normal.IconColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v7, CFSTR("Normal.IconColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  iconColor = (id *)self->_iconColor;
  objc_storeStrong((id *)self->_iconColor, v9);
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFF7 | (8 * (v9 != 0));
  v12 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Highlighted.IconColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v12, CFSTR("Highlighted.IconColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v14)
    v15 = v14;
  else
    v15 = v9;
  objc_storeStrong(iconColor + 1, v15);
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFF7 | (8 * (v14 != 0));
  v16 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Selected.IconColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v16, CFSTR("Selected.IconColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v18)
    v19 = v18;
  else
    v19 = v9;
  objc_storeStrong(iconColor + 2, v19);
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFF7 | (8 * (v18 != 0));
  v20 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Disabled.IconColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v20, CFSTR("Disabled.IconColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v22)
    v23 = v22;
  else
    v23 = v9;
  objc_storeStrong(iconColor + 3, v23);
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFF7 | (8 * (v22 != 0));
  v24 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Focused.IconColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v24, CFSTR("Focused.IconColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v26)
    v27 = v26;
  else
    v27 = v15;
  objc_storeStrong(iconColor + 4, v27);
  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFF7 | (8 * (v26 != 0));

}

- (void)_decodeBadgeBackgroundColorFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *badgeBackgroundColor;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Normal.BadgeBackgroundColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v7, CFSTR("Normal.BadgeBackgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  badgeBackgroundColor = (id *)self->_badgeBackgroundColor;
  objc_storeStrong((id *)self->_badgeBackgroundColor, v9);
  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFDF | (32 * (v9 != 0));
  v12 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Highlighted.BadgeBackgroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v12, CFSTR("Highlighted.BadgeBackgroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v14)
    v15 = v14;
  else
    v15 = v9;
  objc_storeStrong(badgeBackgroundColor + 1, v15);
  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFDF | (32 * (v14 != 0));
  v16 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Selected.BadgeBackgroundColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v16, CFSTR("Selected.BadgeBackgroundColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v18)
    v19 = v18;
  else
    v19 = v9;
  objc_storeStrong(badgeBackgroundColor + 2, v19);
  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFDF | (32 * (v18 != 0));
  v20 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Disabled.BadgeBackgroundColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v20, CFSTR("Disabled.BadgeBackgroundColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v22)
    v23 = v22;
  else
    v23 = v9;
  objc_storeStrong(badgeBackgroundColor + 3, v23);
  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFDF | (32 * (v22 != 0));
  v24 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, CFSTR("Focused.BadgeBackgroundColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v28, "decodeObjectOfClass:forKey:", v24, CFSTR("Focused.BadgeBackgroundColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v26)
    v27 = v26;
  else
    v27 = v15;
  objc_storeStrong(badgeBackgroundColor + 4, v27);
  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFDF | (32 * (v26 != 0));

}

- (void)_decodeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  __int16 v15;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  UIOffset *titlePositionAdjustment;
  __CFString *v18;
  id v19;
  __CFString *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  __int16 v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  __int16 v33;
  __CFString *v34;
  id v35;
  __CFString *v36;
  double v37;
  double v38;
  __int16 v39;
  __CFString *v40;
  __CFString *v41;
  double v42;
  double v43;
  __int16 v44;
  id v45;

  v6 = a3;
  v7 = a4;
  v8 = CFSTR("Normal.TitlePosition");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Normal.TitlePosition"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = v8;
  if (objc_msgSend(v9, "containsValueForKey:", v10))
  {
    objc_msgSend(v9, "decodeUIOffsetForKey:", v10);
    v12 = v11;
    v14 = v13;
    v15 = 4;
  }
  else
  {
    v15 = 0;
    v12 = 0.0;
    v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFFB | v15;
  if (v7)
  {

    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].horizontal = v12;
    self->_titlePositionAdjustment[0].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Highlighted.TitlePosition"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    titlePositionAdjustment = self->_titlePositionAdjustment;
    self->_titlePositionAdjustment[0].horizontal = v12;
    self->_titlePositionAdjustment[0].vertical = v14;
    v18 = CFSTR("Highlighted.TitlePosition");
  }
  v19 = v9;
  v20 = v18;
  if (objc_msgSend(v19, "containsValueForKey:", v20))
  {
    objc_msgSend(v19, "decodeUIOffsetForKey:", v20);
    v22 = v21;
    v24 = v23;
    v25 = 4;
  }
  else
  {
    v25 = 0;
    v22 = v12;
    v24 = v14;
  }

  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFFB | v25;
  if (v7)
  {

    titlePositionAdjustment[1].horizontal = v22;
    titlePositionAdjustment[1].vertical = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Selected.TitlePosition"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    titlePositionAdjustment[1].horizontal = v22;
    titlePositionAdjustment[1].vertical = v24;
    v26 = CFSTR("Selected.TitlePosition");
  }
  v27 = v19;
  v28 = v26;
  if (objc_msgSend(v27, "containsValueForKey:", v28))
  {
    objc_msgSend(v27, "decodeUIOffsetForKey:", v28);
    v30 = v29;
    v32 = v31;
    v33 = 4;
  }
  else
  {
    v33 = 0;
    v30 = v12;
    v32 = v14;
  }

  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFFB | v33;
  if (v7)
  {

    titlePositionAdjustment[2].horizontal = v30;
    titlePositionAdjustment[2].vertical = v32;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Disabled.TitlePosition"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    titlePositionAdjustment[2].horizontal = v30;
    titlePositionAdjustment[2].vertical = v32;
    v34 = CFSTR("Disabled.TitlePosition");
  }
  v35 = v27;
  v36 = v34;
  if (objc_msgSend(v35, "containsValueForKey:", v36))
  {
    objc_msgSend(v35, "decodeUIOffsetForKey:", v36);
    v12 = v37;
    v14 = v38;
    v39 = 4;
  }
  else
  {
    v39 = 0;
  }

  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFFB | v39;
  if (v7)
  {

    titlePositionAdjustment[3].horizontal = v12;
    titlePositionAdjustment[3].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Focused.TitlePosition"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    titlePositionAdjustment[3].horizontal = v12;
    titlePositionAdjustment[3].vertical = v14;
    v40 = CFSTR("Focused.TitlePosition");
  }
  v45 = v35;
  v41 = v40;
  if (objc_msgSend(v45, "containsValueForKey:", v41))
  {
    objc_msgSend(v45, "decodeUIOffsetForKey:", v41);
    v22 = v42;
    v24 = v43;
    v44 = 4;
  }
  else
  {
    v44 = 0;
  }

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFFB | v44;
  if (v7)

  titlePositionAdjustment[4].horizontal = v22;
  titlePositionAdjustment[4].vertical = v24;

}

- (void)_decodeBadgePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  __int16 v15;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  UIOffset *badgePositionAdjustment;
  __CFString *v18;
  id v19;
  __CFString *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  __int16 v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  __int16 v33;
  __CFString *v34;
  id v35;
  __CFString *v36;
  double v37;
  double v38;
  __int16 v39;
  __CFString *v40;
  __CFString *v41;
  double v42;
  double v43;
  __int16 v44;
  id v45;

  v6 = a3;
  v7 = a4;
  v8 = CFSTR("Normal.BadgePosition");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Normal.BadgePosition"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = v8;
  if (objc_msgSend(v9, "containsValueForKey:", v10))
  {
    objc_msgSend(v9, "decodeUIOffsetForKey:", v10);
    v12 = v11;
    v14 = v13;
    v15 = 16;
  }
  else
  {
    v15 = 0;
    v12 = 0.0;
    v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFFEF | v15;
  if (v7)
  {

    badgePositionAdjustment = self->_badgePositionAdjustment;
    self->_badgePositionAdjustment[0].horizontal = v12;
    self->_badgePositionAdjustment[0].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Highlighted.BadgePosition"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgePositionAdjustment = self->_badgePositionAdjustment;
    self->_badgePositionAdjustment[0].horizontal = v12;
    self->_badgePositionAdjustment[0].vertical = v14;
    v18 = CFSTR("Highlighted.BadgePosition");
  }
  v19 = v9;
  v20 = v18;
  if (objc_msgSend(v19, "containsValueForKey:", v20))
  {
    objc_msgSend(v19, "decodeUIOffsetForKey:", v20);
    v22 = v21;
    v24 = v23;
    v25 = 16;
  }
  else
  {
    v25 = 0;
    v22 = v12;
    v24 = v14;
  }

  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFFEF | v25;
  if (v7)
  {

    badgePositionAdjustment[1].horizontal = v22;
    badgePositionAdjustment[1].vertical = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Selected.BadgePosition"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgePositionAdjustment[1].horizontal = v22;
    badgePositionAdjustment[1].vertical = v24;
    v26 = CFSTR("Selected.BadgePosition");
  }
  v27 = v19;
  v28 = v26;
  if (objc_msgSend(v27, "containsValueForKey:", v28))
  {
    objc_msgSend(v27, "decodeUIOffsetForKey:", v28);
    v30 = v29;
    v32 = v31;
    v33 = 16;
  }
  else
  {
    v33 = 0;
    v30 = v12;
    v32 = v14;
  }

  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFFEF | v33;
  if (v7)
  {

    badgePositionAdjustment[2].horizontal = v30;
    badgePositionAdjustment[2].vertical = v32;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Disabled.BadgePosition"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgePositionAdjustment[2].horizontal = v30;
    badgePositionAdjustment[2].vertical = v32;
    v34 = CFSTR("Disabled.BadgePosition");
  }
  v35 = v27;
  v36 = v34;
  if (objc_msgSend(v35, "containsValueForKey:", v36))
  {
    objc_msgSend(v35, "decodeUIOffsetForKey:", v36);
    v12 = v37;
    v14 = v38;
    v39 = 16;
  }
  else
  {
    v39 = 0;
  }

  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFFEF | v39;
  if (v7)
  {

    badgePositionAdjustment[3].horizontal = v12;
    badgePositionAdjustment[3].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Focused.BadgePosition"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgePositionAdjustment[3].horizontal = v12;
    badgePositionAdjustment[3].vertical = v14;
    v40 = CFSTR("Focused.BadgePosition");
  }
  v45 = v35;
  v41 = v40;
  if (objc_msgSend(v45, "containsValueForKey:", v41))
  {
    objc_msgSend(v45, "decodeUIOffsetForKey:", v41);
    v22 = v42;
    v24 = v43;
    v44 = 16;
  }
  else
  {
    v44 = 0;
  }

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFFEF | v44;
  if (v7)

  badgePositionAdjustment[4].horizontal = v22;
  badgePositionAdjustment[4].vertical = v24;

}

- (void)_decodeBadgeTitlePositionAdjustmentsFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  __int16 v15;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  UIOffset *badgeTitlePositionAdjustment;
  __CFString *v18;
  id v19;
  __CFString *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  __int16 v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  __int16 v33;
  __CFString *v34;
  id v35;
  __CFString *v36;
  double v37;
  double v38;
  __int16 v39;
  __CFString *v40;
  __CFString *v41;
  double v42;
  double v43;
  __int16 v44;
  id v45;

  v6 = a3;
  v7 = a4;
  v8 = CFSTR("Normal.BadgeTitlePosition");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Normal.BadgeTitlePosition"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = v8;
  if (objc_msgSend(v9, "containsValueForKey:", v10))
  {
    objc_msgSend(v9, "decodeUIOffsetForKey:", v10);
    v12 = v11;
    v14 = v13;
    v15 = 256;
  }
  else
  {
    v15 = 0;
    v12 = 0.0;
    v14 = 0.0;
  }

  stateFlags = self->_stateFlags;
  *(_WORD *)self->_stateFlags = *(_WORD *)self->_stateFlags & 0xFEFF | v15;
  if (v7)
  {

    badgeTitlePositionAdjustment = self->_badgeTitlePositionAdjustment;
    self->_badgeTitlePositionAdjustment[0].horizontal = v12;
    self->_badgeTitlePositionAdjustment[0].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Highlighted.BadgeTitlePosition"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgeTitlePositionAdjustment = self->_badgeTitlePositionAdjustment;
    self->_badgeTitlePositionAdjustment[0].horizontal = v12;
    self->_badgeTitlePositionAdjustment[0].vertical = v14;
    v18 = CFSTR("Highlighted.BadgeTitlePosition");
  }
  v19 = v9;
  v20 = v18;
  if (objc_msgSend(v19, "containsValueForKey:", v20))
  {
    objc_msgSend(v19, "decodeUIOffsetForKey:", v20);
    v22 = v21;
    v24 = v23;
    v25 = 256;
  }
  else
  {
    v25 = 0;
    v22 = v12;
    v24 = v14;
  }

  *(_WORD *)&stateFlags[2] = *(_WORD *)&stateFlags[2] & 0xFEFF | v25;
  if (v7)
  {

    badgeTitlePositionAdjustment[1].horizontal = v22;
    badgeTitlePositionAdjustment[1].vertical = v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Selected.BadgeTitlePosition"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgeTitlePositionAdjustment[1].horizontal = v22;
    badgeTitlePositionAdjustment[1].vertical = v24;
    v26 = CFSTR("Selected.BadgeTitlePosition");
  }
  v27 = v19;
  v28 = v26;
  if (objc_msgSend(v27, "containsValueForKey:", v28))
  {
    objc_msgSend(v27, "decodeUIOffsetForKey:", v28);
    v30 = v29;
    v32 = v31;
    v33 = 256;
  }
  else
  {
    v33 = 0;
    v30 = v12;
    v32 = v14;
  }

  *(_WORD *)&stateFlags[4] = *(_WORD *)&stateFlags[4] & 0xFEFF | v33;
  if (v7)
  {

    badgeTitlePositionAdjustment[2].horizontal = v30;
    badgeTitlePositionAdjustment[2].vertical = v32;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Disabled.BadgeTitlePosition"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgeTitlePositionAdjustment[2].horizontal = v30;
    badgeTitlePositionAdjustment[2].vertical = v32;
    v34 = CFSTR("Disabled.BadgeTitlePosition");
  }
  v35 = v27;
  v36 = v34;
  if (objc_msgSend(v35, "containsValueForKey:", v36))
  {
    objc_msgSend(v35, "decodeUIOffsetForKey:", v36);
    v12 = v37;
    v14 = v38;
    v39 = 256;
  }
  else
  {
    v39 = 0;
  }

  *(_WORD *)&stateFlags[6] = *(_WORD *)&stateFlags[6] & 0xFEFF | v39;
  if (v7)
  {

    badgeTitlePositionAdjustment[3].horizontal = v12;
    badgeTitlePositionAdjustment[3].vertical = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("Focused.BadgeTitlePosition"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    badgeTitlePositionAdjustment[3].horizontal = v12;
    badgeTitlePositionAdjustment[3].vertical = v14;
    v40 = CFSTR("Focused.BadgeTitlePosition");
  }
  v45 = v35;
  v41 = v40;
  if (objc_msgSend(v45, "containsValueForKey:", v41))
  {
    objc_msgSend(v45, "decodeUIOffsetForKey:", v41);
    v22 = v42;
    v24 = v43;
    v44 = 256;
  }
  else
  {
    v44 = 0;
  }

  *(_WORD *)&stateFlags[8] = *(_WORD *)&stateFlags[8] & 0xFEFF | v44;
  if (v7)

  badgeTitlePositionAdjustment[4].horizontal = v22;
  badgeTitlePositionAdjustment[4].vertical = v24;

}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  _QWORD *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = CFSTR("DefaultStyle");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("DefaultStyle"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v6, "containsValueForKey:", v8))
  {
    objc_msgSend(a1, "standardItemDataForStyle:", objc_msgSend(v6, "decodeIntegerForKey:", v8));
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (_QWORD *)objc_opt_new();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("CustomizedStyle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2] = objc_msgSend(v6, "decodeIntegerForKey:", v10);

    }
    else
    {
      v9[2] = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("CustomizedStyle"));
    }
    objc_msgSend(v9, "_decodeTitleTextAttributesFromCoder:prefix:", v6, v7);
    objc_msgSend(v9, "_decodeBadgeTextAttributesFromCoder:prefix:", v6, v7);
    objc_msgSend(v9, "_decodeIconColorFromCoder:prefix:", v6, v7);
    objc_msgSend(v9, "_decodeBadgeBackgroundColorFromCoder:prefix:", v6, v7);
    objc_msgSend(v9, "_decodeTitlePositionAdjustmentsFromCoder:prefix:", v6, v7);
    objc_msgSend(v9, "_decodeBadgePositionAdjustmentsFromCoder:prefix:", v6, v7);
    objc_msgSend(v9, "_decodeBadgeTitlePositionAdjustmentsFromCoder:prefix:", v6, v7);
  }

  return v9;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t style;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  NSDictionary *v17;
  void *v18;
  NSDictionary *v19;
  void *v20;
  NSDictionary *v21;
  void *v22;
  unint64_t v23;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  __int16 v25;
  UIColor *v26;
  void *v27;
  UIColor *v28;
  void *v29;
  UIColor *v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  char v34;
  const __CFString *v35;
  char v36;
  const __CFString *v37;
  uint64_t i;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  _OWORD v42[2];
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  style = self->_style;
  if ((_UITabBarItemData *)_UITabBarItemStyleData[style] != self)
  {
    v10 = 0x1E0CB3000uLL;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("CustomizedStyle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encodeInteger:forKey:", style, v11);

    }
    else
    {
      objc_msgSend(v6, "encodeInteger:forKey:", self->_style, CFSTR("CustomizedStyle"));
    }
    v13 = 0;
    v14 = 8;
    v42[0] = xmmword_1E16E7CD8;
    v42[1] = *(_OWORD *)off_1E16E7CE8;
    v43 = CFSTR("Focused");
    while (1)
    {
      if (v8)
      {
        objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v8, *(_QWORD *)((char *)v42 + v13));
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = *(id *)((char *)v42 + v13);
      }
      v16 = v15;
      v17 = self->_titleTextAttributes[v13 / 8];
      if (!v17)
        goto LABEL_14;
      if (v15)
        break;
      objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", self->_titleTextAttributes[v13 / 8], CFSTR("TitleTextAttributes"));
      v21 = self->_badgeTextAttributes[v13 / 8];
      if (!v21)
        goto LABEL_21;
      v22 = v6;
LABEL_20:
      objc_msgSend(v22, "_ui_encodeTextAttributes:forKey:", v21, CFSTR("BadgeTextAttributes"));
LABEL_21:
      v23 = v10;
      stateFlags = self->_stateFlags;
      v25 = (__int16)self->_stateFlags[v13 / 4];
      if ((v25 & 8) == 0)
        goto LABEL_24;
      v26 = self->_iconColor[v13 / 8];
      if (v16)
      {
        objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("IconColor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encodeObject:forKey:", v26, v27);

        v25 = (__int16)stateFlags[v13 / 4];
LABEL_24:
        if ((v25 & 0x20) == 0)
          goto LABEL_31;
        v28 = self->_badgeBackgroundColor[v13 / 8];
        if (v16)
        {
          objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("BadgeBackgroundColor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "encodeObject:forKey:", v28, v29);

          goto LABEL_31;
        }
        v31 = v6;
        v30 = self->_badgeBackgroundColor[v13 / 8];
        goto LABEL_30;
      }
      objc_msgSend(v6, "encodeObject:forKey:", self->_iconColor[v13 / 8], CFSTR("IconColor"));
      if ((*(_WORD *)&stateFlags[v13 / 4] & 0x20) == 0)
        goto LABEL_31;
      v30 = self->_badgeBackgroundColor[v13 / 8];
      v31 = v6;
LABEL_30:
      objc_msgSend(v31, "encodeObject:forKey:", v30, CFSTR("BadgeBackgroundColor"));
LABEL_31:
      v32 = (__int16)stateFlags[v13 / 4];
      if ((v32 & 4) == 0)
        goto LABEL_37;
      if (v16)
      {
        objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("TitlePosition"));
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v33 = v41;
      }
      else
      {
        v33 = CFSTR("TitlePosition");
      }
      objc_msgSend(v6, "encodeUIOffset:forKey:", v33, *(double *)&self->_badgeBackgroundColor[v14 / 8 + 4], *(double *)((char *)&self->_titlePositionAdjustment[0].horizontal + v14));
      if (v16)
      {

        v32 = (__int16)stateFlags[v13 / 4];
LABEL_37:
        if ((v32 & 0x10) != 0)
        {
          if (v16)
          {
            objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("BadgePosition"));
            v34 = 0;
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = v39;
          }
          else
          {
LABEL_43:
            v34 = 1;
            v35 = CFSTR("BadgePosition");
          }
          objc_msgSend(v6, "encodeUIOffset:forKey:", v35, *(double *)((char *)&self->_titlePositionAdjustment[4].vertical + v14), *(double *)((char *)&self->_badgePositionAdjustment[0].horizontal + v14));
          if ((v34 & 1) == 0)

        }
        if ((*(_WORD *)&stateFlags[v13 / 4] & 0x100) != 0)
        {
          v10 = v23;
          if (v16)
          {
            objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("BadgeTitlePosition"));
            v36 = 0;
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v37 = v40;
          }
          else
          {
            v36 = 1;
            v37 = CFSTR("BadgeTitlePosition");
          }
LABEL_51:
          objc_msgSend(v6, "encodeUIOffset:forKey:", v37, *(double *)((char *)&self->_badgePositionAdjustment[4].vertical + v14), *(double *)((char *)&self->_badgeTitlePositionAdjustment[0].horizontal + v14));
          if ((v36 & 1) == 0)

          goto LABEL_53;
        }
        goto LABEL_47;
      }
      if ((*(_WORD *)&stateFlags[v13 / 4] & 0x10) != 0)
        goto LABEL_43;
      if ((*(_WORD *)&stateFlags[v13 / 4] & 0x100) != 0)
      {
        v36 = 1;
        v37 = CFSTR("BadgeTitlePosition");
        v10 = v23;
        goto LABEL_51;
      }
LABEL_47:
      v10 = v23;
LABEL_53:

      v14 += 16;
      v13 += 8;
      if (v14 == 88)
      {
        for (i = 32; i != -8; i -= 8)

        goto LABEL_56;
      }
    }
    objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v15, CFSTR("TitleTextAttributes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", v17, v18);

LABEL_14:
    v19 = self->_badgeTextAttributes[v13 / 8];
    if (!v19)
      goto LABEL_21;
    if (v16)
    {
      objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("BadgeTextAttributes"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_ui_encodeTextAttributes:forKey:", v19, v20);

      goto LABEL_21;
    }
    v22 = v6;
    v21 = self->_badgeTextAttributes[v13 / 8];
    goto LABEL_20;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("DefaultStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeInteger:forKey:", style, v12);

  }
  else
  {
    objc_msgSend(v6, "encodeInteger:forKey:", self->_style, CFSTR("DefaultStyle"));
  }
LABEL_56:

}

- (void)describeInto:(id)a3
{
  id v4;
  unint64_t style;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  $BBD6068E7A01029EE6768D8E462B9288 *stateFlags;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UITabBarItemData;
  -[_UIBarAppearanceData describeInto:](&v15, sel_describeInto_, v4);
  style = self->_style;
  if (style >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%li)"), self->_style);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E16E7D00[style];
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(" baseStyle=%@"), v6);

  v7 = 0;
  v8 = 0;
  v9 = 1;
  while (2)
  {
    v10 = CFSTR("normal");
    switch(v8)
    {
      case 0:
        goto LABEL_10;
      case 1:
        goto LABEL_17;
      case 2:
        v10 = CFSTR("selected");
        goto LABEL_10;
      case 3:
        v10 = CFSTR("disabled");
        goto LABEL_10;
      case 4:
        v10 = CFSTR("focused");
        goto LABEL_10;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%li)"), v8);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        objc_msgSend(v4, "appendFormat:", CFSTR(" %@=(titleTextAttributes="), v10);

        _UIBADPrettyPrintTextAttributes(v4, self->_titleTextAttributes[v8]);
        stateFlags = self->_stateFlags;
        if ((*(_WORD *)&self->_stateFlags[v7] & 4) != 0)
        {
          NSStringFromUIOffset(*(UIOffset *)&self->_badgeBackgroundColor[v9 + 4]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR(", titlePositionAdjustment=%@"), v12);

        }
        objc_msgSend(v4, "appendFormat:", CFSTR(", iconColor=%@"), self->_iconColor[v8]);
        if ((*(_WORD *)&stateFlags[v7] & 0x10) != 0)
        {
          NSStringFromUIOffset(*(UIOffset *)((char *)&self->_titlePositionAdjustment[4].vertical + v9 * 8));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR(", badgePositionAdjustment=%@"), v13);

        }
        objc_msgSend(v4, "appendFormat:", CFSTR(", badgeBackgroundColor=%@, badgeTextAttributes="), self->_badgeBackgroundColor[v8]);
        _UIBADPrettyPrintTextAttributes(v4, self->_badgeTextAttributes[v8]);
        if ((*(_WORD *)&stateFlags[v7] & 0x100) != 0)
        {
          NSStringFromUIOffset(*(UIOffset *)((char *)&self->_badgePositionAdjustment[4].vertical + v9 * 8));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR(", badgeTitlePositionAdjustment=%@"), v14);

        }
        objc_msgSend(v4, "appendString:", CFSTR(")"));
LABEL_17:
        ++v8;
        v7 += 2;
        v9 += 2;
        if (v8 != 5)
          continue;

        return;
    }
  }
}

- (int64_t)hashInto:(int64_t)a3
{
  int64_t v4;
  NSDictionary *v5;
  int64_t v6;
  NSDictionary *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITabBarItemData;
  v4 = -[_UIBarAppearanceData hashInto:](&v9, sel_hashInto_, a3);
  v5 = self->_titleTextAttributes[0];
  if (v5)
    v4 += -[NSDictionary hash](v5, "hash");
  v6 = v4 << 8;
  v7 = self->_badgeTextAttributes[0];
  if (v7)
    v6 = -[NSDictionary hash](v7, "hash") | (unint64_t)v6;
  return v6 << 8;
}

- (void)setTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical;
  CGFloat horizontal;
  UIOffset *v8;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = &self->_titlePositionAdjustment[a4];
  v8->horizontal = horizontal;
  v8->vertical = vertical;
  *(_WORD *)&self->_stateFlags[2 * a4] |= 4u;
}

- (UIOffset)badgePositionAdjustmentForState:(int64_t)a3
{
  UIOffset *badgePositionAdjustment;
  CGFloat *p_vertical;
  double v5;
  double horizontal;
  UIOffset result;

  if ((*(_WORD *)&self->_stateFlags[2 * a3] & 0x10) != 0)
  {
    badgePositionAdjustment = &self->_badgePositionAdjustment[a3];
  }
  else
  {
    if (a3 == 4 && (*(_WORD *)&self->_stateFlags[2] & 0x10) != 0)
    {
      badgePositionAdjustment = &self->_badgePositionAdjustment[1];
      p_vertical = &self->_badgePositionAdjustment[1].vertical;
      goto LABEL_9;
    }
    if ((*(_WORD *)self->_stateFlags & 0x10) != 0)
      badgePositionAdjustment = self->_badgePositionAdjustment;
    else
      badgePositionAdjustment = (UIOffset *)&UIOffsetZero;
  }
  p_vertical = &badgePositionAdjustment->vertical;
LABEL_9:
  v5 = *p_vertical;
  horizontal = badgePositionAdjustment->horizontal;
  result.vertical = v5;
  result.horizontal = horizontal;
  return result;
}

- (void)setBadgePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical;
  CGFloat horizontal;
  UIOffset *v8;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = &self->_badgePositionAdjustment[a4];
  v8->horizontal = horizontal;
  v8->vertical = vertical;
  *(_WORD *)&self->_stateFlags[2 * a4] |= 0x10u;
}

- (void)setBadgeBackgroundColor:(id)a3 forState:(int64_t)a4
{
  UIColor *v7;
  UIColor *v8;

  v7 = (UIColor *)a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = self->_badgeBackgroundColor[a4];
  self->_badgeBackgroundColor[a4] = v7;

  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFDF | (32 * (v7 != 0));
}

- (id)badgeTextAttributesForState:(int64_t)a3
{
  return -[_UITabBarItemData badgeTextAttributesForState:compatibleWithTraitCollection:](self, "badgeTextAttributesForState:compatibleWithTraitCollection:", a3, 0);
}

- (void)setBadgeTextAttributes:(id)a3 forState:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;

  v7 = a3;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFFBF | ((v8 != 0) << 6);

  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)&self->_stateFlags[2 * a4] = *(_WORD *)&self->_stateFlags[2 * a4] & 0xFF7F | ((v9 != 0) << 7);

  v10 = (NSDictionary *)objc_msgSend(v7, "copy");
  v11 = self->_badgeTextAttributes[a4];
  self->_badgeTextAttributes[a4] = v10;

}

- (void)setBadgeTitlePositionAdjustment:(UIOffset)a3 forState:(int64_t)a4
{
  CGFloat vertical;
  CGFloat horizontal;
  UIOffset *v8;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIBarAppearanceData assertMutable:](self, "assertMutable:", a2);
  v8 = &self->_badgeTitlePositionAdjustment[a4];
  v8->horizontal = horizontal;
  v8->vertical = vertical;
  *(_WORD *)&self->_stateFlags[2 * a4] |= 0x100u;
}

- (void).cxx_destruct
{
  UIColor **badgeBackgroundColor;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  NSDictionary **titleTextAttributes;
  uint64_t m;

  badgeBackgroundColor = self->_badgeBackgroundColor;
  for (i = 4; i != -1; --i)
    objc_storeStrong((id *)&badgeBackgroundColor[i], 0);
  for (j = 4; j != -1; --j)
    objc_storeStrong((id *)&self->_iconColor[j], 0);
  for (k = 4; k != -1; --k)
    objc_storeStrong((id *)&self->_badgeTextAttributes[k], 0);
  titleTextAttributes = self->_titleTextAttributes;
  for (m = 4; m != -1; --m)
    objc_storeStrong((id *)&titleTextAttributes[m], 0);
}

@end
