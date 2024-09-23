@implementation _UIBackgroundViewConfiguration

+ (id)plainListCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultPlainListCellConfigurationForState:", 0);
}

+ (id)plainListHeaderFooterConfiguration
{
  return (id)objc_msgSend(a1, "defaultPlainListHeaderFooterConfigurationForState:", 0);
}

+ (id)groupedListCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultGroupedListCellConfigurationForState:", 0);
}

+ (id)groupedListHeaderFooterConfiguration
{
  return (id)objc_msgSend(a1, "defaultGroupedListHeaderFooterConfigurationForState:", 0);
}

+ (id)insetGroupedListCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultInsetGroupedListCellConfigurationForState:", 0);
}

+ (id)insetGroupedListHeaderFooterConfiguration
{
  return (id)objc_msgSend(a1, "defaultInsetGroupedListHeaderFooterConfigurationForState:", 0);
}

+ (id)outlineRootParentCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultOutlineParentCellConfigurationForState:", 0);
}

+ (id)outlineCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultOutlineCellConfigurationForState:", 0);
}

+ (id)defaultPlainListCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultPlainListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultPlainListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  void *v5;
  _UIBackgroundViewConfiguration *v6;
  void *v7;
  _BYTE v9[136];
  id v10[18];

  v4 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v10, 0, 136);
  if (v5)
    objc_msgSend(v5, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", 0, v7, v4);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v9, v4);
  if (v6)
    v6->_defaultStyle = 1;
  __destructor_8_s8_s16_s24_s80(v10);

  return v6;
}

+ (id)defaultPlainListHeaderFooterConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultPlainListHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultPlainListHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  void *v5;
  _UIBackgroundViewConfiguration *v6;
  void *v7;
  _BYTE v9[136];
  id v10[18];

  v4 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v10, 0, 136);
  if (v5)
    objc_msgSend(v5, "defaultHeaderFooterBackgroundPropertiesForTableViewStyle:cellConfigurationState:traitCollection:floating:", 0, v7, v4, (a2 >> 11) & 1);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v9, v4);
  if (v6)
    v6->_defaultStyle = 2;
  __destructor_8_s8_s16_s24_s80(v10);

  return v6;
}

+ (id)defaultGroupedListCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultGroupedListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultGroupedListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  void *v5;
  _UIBackgroundViewConfiguration *v6;
  void *v7;
  _BYTE v9[136];
  id v10[18];

  v4 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v10, 0, 136);
  if (v5)
    objc_msgSend(v5, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", 1, v7, v4);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v9, v4);
  if (v6)
    v6->_defaultStyle = 3;
  __destructor_8_s8_s16_s24_s80(v10);

  return v6;
}

+ (id)defaultInsetGroupedListCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultInsetGroupedListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultInsetGroupedListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_self();
  +[_UIBackgroundViewConfiguration defaultGroupedListCellConfigurationForState:traitCollection:](v5, a2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultInsetGroupedListHeaderFooterConfigurationForState:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultInsetGroupedListHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultInsetGroupedListHeaderFooterConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2
{
  id v2;
  _UIBackgroundViewConfiguration *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 6)
  {
    v3 = objc_alloc_init(_UIBackgroundViewConfiguration);
    v4 = v3;
    if (v3)
      v3->_defaultStyle = 8;
  }
  else
  {
    +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:traitCollection:]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (_UIBackgroundViewConfiguration)defaultGroupedListHeaderFooterConfigurationForState:traitCollection:
{
  _UIBackgroundViewConfiguration *v0;

  objc_opt_self();
  v0 = objc_alloc_init(_UIBackgroundViewConfiguration);
  if (v0)
    v0->_defaultStyle = 4;
  return v0;
}

+ (id)defaultGroupedListHeaderFooterConfigurationForState:(unint64_t)a3
{
  void *v3;
  void *v4;

  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:traitCollection:]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultOutlineParentCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultOutlineRootParentCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  _UIBackgroundViewConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v10[136];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v4 = a3;
  objc_opt_self();
  v5 = objc_alloc_init(_UIBackgroundViewConfiguration);
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  _UITableConstantsForTraitCollection(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "defaultSidebarHeaderBackgroundPropertiesWithState:traitCollection:", v6, v4);
  }
  else
  {
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
  }

  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v10, (uint64_t)&v11);
  _UIBackgroundViewConfigurationApplyProperties(v5, (uint64_t)v10, v4);
  if (v5)
    v5->_defaultStyle = 6;
  __destructor_8_s8_s16_s24_s80((id *)&v11);

  return v5;
}

+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBackgroundViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_UIBackgroundViewConfiguration)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  uint64_t v5;
  _UIBackgroundViewConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BYTE v12[136];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v4 = a3;
  objc_opt_self();
  v5 = objc_msgSend(v4, "_splitViewControllerContext");
  v6 = objc_alloc_init(_UIBackgroundViewConfiguration);
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  _UITableConstantsForTraitCollection(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v5 == 2)
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(v8, "defaultSidebarCellBackgroundPropertiesForStyle:state:traitCollection:", v10, v7, v4);
  }
  else
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
  }

  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v12, (uint64_t)&v13);
  _UIBackgroundViewConfigurationApplyProperties(v6, (uint64_t)v12, v4);
  if (v6)
    v6->_defaultStyle = 5;
  __destructor_8_s8_s16_s24_s80((id *)&v13);

  return v6;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return -[_UIBackgroundViewConfiguration updatedConfigurationForState:traitCollection:](self, "updatedConfigurationForState:traitCollection:", a3, 0);
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v6;
  uint64_t v7;
  int64_t defaultStyle;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int16 configurationFlags;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a4;
  v7 = -[_UIBackgroundViewConfiguration copy](self, "copy");
  defaultStyle = self->_defaultStyle;
  if (defaultStyle)
  {
    v9 = v6;
    v10 = objc_opt_self();
    if (!v9)
    {
      +[UITraitCollection _fallbackTraitCollection]();
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    switch(defaultStyle)
    {
      case 1:
        +[_UIBackgroundViewConfiguration defaultPlainListCellConfigurationForState:traitCollection:](v10, a3, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        +[_UIBackgroundViewConfiguration defaultPlainListHeaderFooterConfigurationForState:traitCollection:](v10, a3, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 3:
        +[_UIBackgroundViewConfiguration defaultGroupedListCellConfigurationForState:traitCollection:](v10, a3, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 4:
        +[_UIBackgroundViewConfiguration defaultGroupedListHeaderFooterConfigurationForState:traitCollection:]();
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 5:
        +[_UIBackgroundViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:](v10, a3, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 6:
        +[_UIBackgroundViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:](v10, a3, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 7:
        +[_UIBackgroundViewConfiguration defaultInsetGroupedListCellConfigurationForState:traitCollection:](v10, a3, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 8:
        +[_UIBackgroundViewConfiguration defaultInsetGroupedListHeaderFooterConfigurationForState:traitCollection:](v10, v9);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v13 = v11;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v10, CFSTR("_UIBackgroundViewConfiguration.m"), 434, CFSTR("Unknown style: %ld"), defaultStyle);

        v13 = 0;
        break;
    }

    configurationFlags = (__int16)self->_configurationFlags;
    if ((configurationFlags & 1) != 0)
    {
      if ((configurationFlags & 2) != 0)
        goto LABEL_19;
    }
    else
    {
      if (v13)
        v19 = *(void **)(v13 + 16);
      else
        v19 = 0;
      -[UIBackgroundConfiguration _setCustomView:](v7, v19);
      configurationFlags = (__int16)self->_configurationFlags;
      if ((configurationFlags & 2) != 0)
      {
LABEL_19:
        if ((configurationFlags & 4) != 0)
          goto LABEL_26;
LABEL_23:
        if (v13)
        {
          v16 = *(_OWORD *)(v13 + 144);
          v17 = *(_OWORD *)(v13 + 160);
          if (!v7)
            goto LABEL_26;
        }
        else
        {
          v16 = 0uLL;
          v17 = 0uLL;
          if (!v7)
          {
LABEL_26:
            if ((configurationFlags & 8) != 0)
              goto LABEL_30;
            if (v13)
            {
              v20 = *(_QWORD *)(v13 + 32);
              if (!v7)
                goto LABEL_30;
            }
            else
            {
              v20 = 0;
              if (!v7)
              {
LABEL_30:
                if ((configurationFlags & 0x10) == 0)
                {
                  if (v13)
                  {
                    if (v7)
                    {
                      v21 = *(_QWORD *)(v13 + 40);
                      *(_QWORD *)(v7 + 40) = v21;
                      if (v21)
                      {
                        v22 = *(void **)(v7 + 48);
                        *(_QWORD *)(v7 + 48) = 0;

                      }
                    }
                    v23 = *(void **)(v13 + 48);
                  }
                  else
                  {
                    v23 = 0;
                    if (v7)
                      *(_QWORD *)(v7 + 40) = 0;
                  }
                  -[_UIBackgroundViewConfiguration _setBackgroundColor:](v7, v23);
                  configurationFlags = (__int16)self->_configurationFlags;
                }
                if ((configurationFlags & 0x20) == 0)
                {
                  if (v13)
                  {
                    v15 = *(void **)(v13 + 56);
                    if (!v7)
                      goto LABEL_41;
                    goto LABEL_40;
                  }
                  v15 = 0;
                  if (v7)
                  {
LABEL_40:
                    objc_setProperty_nonatomic_copy((id)v7, v14, v15, 56);
                    configurationFlags = (__int16)self->_configurationFlags;
                  }
                }
LABEL_41:
                if ((configurationFlags & 0x40) != 0)
                  goto LABEL_48;
                if (v13)
                {
                  v24 = *(_QWORD *)(v13 + 64);
                  if (!v7)
                  {
LABEL_45:
                    if (v13)
                      v25 = *(void **)(v13 + 72);
                    else
                      v25 = 0;
                    -[UIBackgroundConfiguration _setImage:](v7, v25);
                    configurationFlags = (__int16)self->_configurationFlags;
LABEL_48:
                    if ((configurationFlags & 0x80) != 0)
                      goto LABEL_52;
                    if (v13)
                    {
                      *(_QWORD *)&v16 = *(_QWORD *)(v13 + 80);
                      if (!v7)
                        goto LABEL_52;
                    }
                    else
                    {
                      *(_QWORD *)&v16 = 0;
                      if (!v7)
                      {
LABEL_52:
                        if ((configurationFlags & 0x100) != 0)
                          goto LABEL_56;
                        if (v13)
                        {
                          *(_QWORD *)&v16 = *(_QWORD *)(v13 + 88);
                          if (!v7)
                            goto LABEL_56;
                        }
                        else
                        {
                          *(_QWORD *)&v16 = 0;
                          if (!v7)
                          {
LABEL_56:
                            objc_msgSend((id)v7, "__setMaskedCorners:", objc_msgSend((id)v13, "__maskedCorners", v15, *(double *)&v16, *(double *)&v17));
                            objc_msgSend((id)v13, "__visualEffectGroupName");
                            v26 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend((id)v7, "__setVisualEffectGroupName:", v26);

                            objc_msgSend((id)v7, "__setVisualEffectblurClippingMode:", objc_msgSend((id)v13, "__visualEffectblurClippingMode"));
                            objc_msgSend((id)v7, "_setStrokeLocation:", objc_msgSend((id)v13, "_strokeLocation"));
                            objc_msgSend((id)v7, "_shadowProperties");
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v27)
                            {

                            }
                            else
                            {
                              objc_msgSend((id)v13, "_shadowProperties");
                              v28 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v28)
                              {
LABEL_60:

                                goto LABEL_61;
                              }
                            }
                            -[_UIBackgroundViewConfiguration shadowProperties]((_QWORD *)v7);
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UIBackgroundViewConfiguration shadowProperties]((_QWORD *)v13);
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v29, "_applyPropertiesFromDefaultProperties:", v30);

                            goto LABEL_60;
                          }
                        }
                        *(_QWORD *)(v7 + 88) = v16;
                        goto LABEL_56;
                      }
                    }
                    *(_QWORD *)(v7 + 80) = v16;
                    configurationFlags = (__int16)self->_configurationFlags;
                    goto LABEL_52;
                  }
                }
                else
                {
                  v24 = 0;
                  if (!v7)
                    goto LABEL_45;
                }
                *(_QWORD *)(v7 + 64) = v24;
                goto LABEL_45;
              }
            }
            *(_QWORD *)(v7 + 32) = v20;
            configurationFlags = (__int16)self->_configurationFlags;
            goto LABEL_30;
          }
        }
        *(_OWORD *)(v7 + 144) = v16;
        *(_OWORD *)(v7 + 160) = v17;
        configurationFlags = (__int16)self->_configurationFlags;
        goto LABEL_26;
      }
    }
    objc_msgSend((id)v13, "_cornerRadius");
    objc_msgSend((id)v7, "_setCornerRadius:");
    configurationFlags = (__int16)self->_configurationFlags;
    if ((configurationFlags & 4) != 0)
      goto LABEL_26;
    goto LABEL_23;
  }
LABEL_61:

  return (id)v7;
}

- (void)_setBackgroundColor:(uint64_t)a1
{
  id v4;
  id v5;

  v4 = a2;
  if (a1)
  {
    v5 = v4;
    objc_storeStrong((id *)(a1 + 48), a2);
    v4 = v5;
    if (v5)
      *(_QWORD *)(a1 + 40) = 0;
  }

}

- (_QWORD)shadowProperties
{
  _QWORD *v1;
  void *v2;
  UIShadowProperties *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[12];
    if (!v2)
    {
      v3 = objc_alloc_init(UIShadowProperties);
      v4 = (void *)v1[12];
      v1[12] = v3;

      v2 = (void *)v1[12];
    }
    a1 = v2;
  }
  return a1;
}

- (_UIBackgroundViewConfiguration)init
{
  _UIBackgroundViewConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBackgroundViewConfiguration;
  result = -[_UIBackgroundViewConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_strokeLocation = 0;
    result->_maskedCorners = 15;
    result->_defaultStyle = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBackgroundViewConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIBackgroundViewConfiguration *v5;
  uint64_t v6;
  UIView *customView;
  double v8;
  uint64_t v9;
  UIColor *backgroundColor;
  uint64_t v11;
  UIVisualEffect *visualEffect;
  uint64_t v13;
  NSString *visualEffectGroupName;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  UIColor *strokeColor;
  double v22;
  double v23;
  uint64_t v24;
  void *shadowProperties;
  uint64_t v26;
  uint64_t v27;
  UIShadowProperties *v28;
  void *v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_UIBackgroundViewConfiguration;
  v5 = -[_UIBackgroundViewConfiguration init](&v47, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "requiresSecureCoding") & 1) == 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customView"));
      v6 = objc_claimAutoreleasedReturnValue();
      customView = v5->_customView;
      v5->_customView = (UIView *)v6;

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
    v5->_cornerRadius = v8;
    v5->_maskedCorners = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maskedCorners"));
    v5->_backgroundColorMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundColorMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visualEffect"));
    v11 = objc_claimAutoreleasedReturnValue();
    visualEffect = v5->_visualEffect;
    v5->_visualEffect = (UIVisualEffect *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visualEffectGroupName"));
    v13 = objc_claimAutoreleasedReturnValue();
    visualEffectGroupName = v5->_visualEffectGroupName;
    v5->_visualEffectGroupName = (NSString *)v13;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("visualEffectblurClippingMode")))
      v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("visualEffectblurClippingMode"));
    else
      v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("visualEffectAllowsTransparentBlurring"));
    v5->_visualEffectblurClippingMode = v15;
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("backgroundInsets"));
    v5->_backgroundInsets.top = v16;
    v5->_backgroundInsets.leading = v17;
    v5->_backgroundInsets.bottom = v18;
    v5->_backgroundInsets.trailing = v19;
    v5->_edgesAddingLayoutMarginsToBackgroundInsets = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
    v5->_strokeColorMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("strokeColorMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strokeColor"));
    v20 = objc_claimAutoreleasedReturnValue();
    strokeColor = v5->_strokeColor;
    v5->_strokeColor = (UIColor *)v20;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("strokeWidth"));
    v5->_strokeWidth = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("strokeOutset"));
    v5->_strokeOutset = v23;
    v5->_strokeLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("strokeLocation"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shadowProperties")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadowProperties"));
      v24 = objc_claimAutoreleasedReturnValue();
      shadowProperties = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v24;
    }
    else
    {
      v26 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shadowType"));
      +[UITraitCollection _fallbackTraitCollection]();
      shadowProperties = (void *)objc_claimAutoreleasedReturnValue();
      _UIShadowPropertiesFromShadowType(v26, shadowProperties);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v27;

    }
    v5->_defaultStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultStyle"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("customView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", v29);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v30))
      v31 = 2;
    else
      v31 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v31;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundInsets"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v32))
      v33 = 4;
    else
      v33 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v33;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v34))
      v35 = 8;
    else
      v35 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v35;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundColor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v36))
      v37 = 16;
    else
      v37 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v37;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("visualEffect"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v38))
      v39 = 32;
    else
      v39 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v39;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v40))
      v41 = 64;
    else
      v41 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v41;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeWidth"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v42))
      v43 = 128;
    else
      v43 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFF7F | v43;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeOutset"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v44))
      v45 = 256;
    else
      v45 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v45;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIShadowProperties *shadowProperties;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  if ((objc_msgSend(v23, "requiresSecureCoding") & 1) == 0)
    objc_msgSend(v23, "encodeObject:forKey:", self->_customView, CFSTR("customView"));
  objc_msgSend(v23, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(v23, "encodeInteger:forKey:", self->_maskedCorners, CFSTR("maskedCorners"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_backgroundColorMode, CFSTR("backgroundColorMode"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_visualEffect, CFSTR("visualEffect"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_visualEffectGroupName, CFSTR("visualEffectGroupName"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_visualEffectblurClippingMode, CFSTR("visualEffectblurClippingMode"));
  objc_msgSend(v23, "encodeDirectionalEdgeInsets:forKey:", CFSTR("backgroundInsets"), self->_backgroundInsets.top, self->_backgroundInsets.leading, self->_backgroundInsets.bottom, self->_backgroundInsets.trailing);
  objc_msgSend(v23, "encodeInteger:forKey:", self->_edgesAddingLayoutMarginsToBackgroundInsets, CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_strokeColorMode, CFSTR("strokeColorMode"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_strokeColor, CFSTR("strokeColor"));
  objc_msgSend(v23, "encodeDouble:forKey:", CFSTR("strokeWidth"), self->_strokeWidth);
  objc_msgSend(v23, "encodeDouble:forKey:", CFSTR("strokeOutset"), self->_strokeOutset);
  objc_msgSend(v23, "encodeInteger:forKey:", self->_strokeLocation, CFSTR("strokeLocation"));
  shadowProperties = self->_shadowProperties;
  if (shadowProperties)
  {
    objc_msgSend(v23, "encodeInteger:forKey:", -[UIShadowProperties _backgroundConfigurationShadowType](shadowProperties, "_backgroundConfigurationShadowType"), CFSTR("shadowType"));
    objc_msgSend(v23, "encodeObject:forKey:", self->_shadowProperties, CFSTR("shadowProperties"));
  }
  objc_msgSend(v23, "encodeInteger:forKey:", self->_defaultStyle, CFSTR("defaultStyle"));
  v5 = *(_WORD *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("customView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v5, v6);

  v7 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v7, v8);

  v9 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundInsets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v9, v10);

  v11 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v11, v12);

  v13 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v13, v14);

  v15 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("visualEffect"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v15, v16);

  v17 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v17, v18);

  v19 = (*(_WORD *)&self->_configurationFlags >> 7) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeWidth"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v19, v20);

  v21 = HIBYTE(*(_WORD *)&self->_configurationFlags) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeOutset"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeBool:forKey:", v21, v22);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 16), self->_customView);
    *(double *)(v6 + 24) = self->_cornerRadius;
    *(_QWORD *)(v6 + 120) = self->_maskedCorners;
    *(_QWORD *)(v6 + 40) = self->_backgroundColorMode;
    objc_storeStrong((id *)(v6 + 48), self->_backgroundColor);
    v7 = -[UIVisualEffect copy](self->_visualEffect, "copy");
    v8 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v7;

    v9 = -[NSString copy](self->_visualEffectGroupName, "copy");
    v10 = *(void **)(v6 + 128);
    *(_QWORD *)(v6 + 128) = v9;

    *(_QWORD *)(v6 + 136) = self->_visualEffectblurClippingMode;
    v11 = *(_OWORD *)&self->_backgroundInsets.bottom;
    *(_OWORD *)(v6 + 144) = *(_OWORD *)&self->_backgroundInsets.top;
    *(_OWORD *)(v6 + 160) = v11;
    *(_QWORD *)(v6 + 32) = self->_edgesAddingLayoutMarginsToBackgroundInsets;
    *(_QWORD *)(v6 + 64) = self->_strokeColorMode;
    objc_storeStrong((id *)(v6 + 72), self->_strokeColor);
    *(double *)(v6 + 80) = self->_strokeWidth;
    *(double *)(v6 + 88) = self->_strokeOutset;
    *(_QWORD *)(v6 + 112) = self->_strokeLocation;
    v12 = -[UIShadowProperties copyWithZone:](self->_shadowProperties, "copyWithZone:", a3);
    v13 = *(void **)(v6 + 96);
    *(_QWORD *)(v6 + 96) = v12;

    *(_QWORD *)(v6 + 104) = self->_defaultStyle;
    *($343470A21C251F9819AE9B93F46C3241 *)(v6 + 8) = self->_configurationFlags;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  _UIBackgroundViewConfiguration *v4;
  _UIBackgroundViewConfiguration *v5;
  _UIBackgroundViewConfiguration *v6;
  _UIBackgroundViewConfiguration *v7;
  BOOL v8;

  v4 = (_UIBackgroundViewConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    v8 = self->_defaultStyle == v6->_defaultStyle
      && self->_customView == v6->_customView
      && self->_cornerRadius == v6->_cornerRadius
      && self->_maskedCorners == v6->_maskedCorners
      && self->_strokeLocation == v6->_strokeLocation
      && self->_backgroundColorMode == v6->_backgroundColorMode
      && self->_backgroundColor == v6->_backgroundColor
      && UIEqual(self->_visualEffect, v6->_visualEffect)
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundInsets.top, *(float64x2_t *)&v7->_backgroundInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundInsets.bottom, *(float64x2_t *)&v7->_backgroundInsets.bottom))), 0xFuLL))) & 1) != 0&& self->_edgesAddingLayoutMarginsToBackgroundInsets == v7->_edgesAddingLayoutMarginsToBackgroundInsets&& self->_strokeColorMode == v7->_strokeColorMode&& self->_strokeColor == v7->_strokeColor&& self->_strokeWidth == v7->_strokeWidth&& self->_strokeOutset == v7->_strokeOutset&& UIEqual(self->_shadowProperties, v7->_shadowProperties)&& UIEqual(self->_visualEffectGroupName, v7->_visualEffectGroupName)&& self->_visualEffectblurClippingMode == v7->_visualEffectblurClippingMode;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t cornerRadius;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[UIView hash](self->_customView, "hash");
  cornerRadius = (unint64_t)self->_cornerRadius;
  v5 = v3 ^ self->_backgroundColorMode;
  v6 = v5 ^ -[UIColor hash](self->_backgroundColor, "hash");
  v7 = v6 ^ -[UIVisualEffect hash](self->_visualEffect, "hash") ^ self->_strokeColorMode;
  return v7 ^ -[UIColor hash](self->_strokeColor, "hash") ^ cornerRadius ^ (unint64_t)self->_strokeWidth;
}

- (NSString)description
{
  id v3;
  void *v4;
  unint64_t defaultStyle;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat top;
  double leading;
  double bottom;
  double trailing;
  void *v15;
  void *v16;
  void *v17;
  unint64_t edgesAddingLayoutMarginsToBackgroundInsets;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t backgroundColorMode;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t strokeColorMode;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  defaultStyle = self->_defaultStyle;
  if (defaultStyle >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_UIBackgroundViewConfigurationStyleToString(_UIBackgroundViewConfigurationStyle)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIBackgroundViewConfiguration.m"), 54, CFSTR("Unknown style: %ld"), defaultStyle);

    v6 = 0;
  }
  else
  {
    v6 = off_1E16DFE60[defaultStyle];
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Base Style = %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  if (self->_cornerRadius > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cornerRadius = %g"), *(_QWORD *)&self->_cornerRadius);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  top = self->_backgroundInsets.top;
  leading = self->_backgroundInsets.leading;
  bottom = self->_backgroundInsets.bottom;
  trailing = self->_backgroundInsets.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("backgroundInsets = %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  edgesAddingLayoutMarginsToBackgroundInsets = self->_edgesAddingLayoutMarginsToBackgroundInsets;
  if (edgesAddingLayoutMarginsToBackgroundInsets)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    if (edgesAddingLayoutMarginsToBackgroundInsets == 15)
    {
      v20 = CFSTR("All");
LABEL_20:
      objc_msgSend(v19, "stringWithFormat:", CFSTR("edgesAddingLayoutMarginsToBackgroundInsets = %@"), v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v25);

      goto LABEL_21;
    }
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = v21;
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 1) != 0)
    {
      objc_msgSend(v21, "addObject:", CFSTR("Top"));
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
      {
LABEL_16:
        if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0)
          goto LABEL_17;
        goto LABEL_44;
      }
    }
    else if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
    {
      goto LABEL_16;
    }
    objc_msgSend(v22, "addObject:", CFSTR("Leading"));
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0)
    {
LABEL_17:
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0)
      {
LABEL_19:
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("[%@]"), v24);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
LABEL_18:
      objc_msgSend(v22, "addObject:", CFSTR("Trailing"));
      goto LABEL_19;
    }
LABEL_44:
    objc_msgSend(v22, "addObject:", CFSTR("Bottom"));
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_21:
  if (-[_UIBackgroundViewConfiguration _hasBackgroundColor](self, "_hasBackgroundColor"))
  {
    backgroundColorMode = self->_backgroundColorMode;
    v27 = (void *)MEMORY[0x1E0CB3940];
    if (backgroundColorMode)
    {
      _stringForColorMode(backgroundColorMode);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("backgroundColorMode = %@"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v29);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backgroundColor = %@"), self->_backgroundColor);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v28);
    }

  }
  if (self->_visualEffect)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("visualEffect = %@"), self->_visualEffect);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  if (-[_UIBackgroundViewConfiguration _hasStroke](self, "_hasStroke"))
  {
    strokeColorMode = self->_strokeColorMode;
    v32 = (void *)MEMORY[0x1E0CB3940];
    if (strokeColorMode)
    {
      _stringForColorMode(strokeColorMode);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("strokeColorMode = %@"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v34);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeColor = %@"), self->_strokeColor);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v33);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeWidth = %g"), *(_QWORD *)&self->_strokeWidth);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v35);

    if (self->_strokeOutset > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeOutset = %g"), *(_QWORD *)&self->_strokeOutset);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v36);

    }
  }
  if (self->_shadowProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shadowProperties = %@"), self->_shadowProperties);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v37);

  }
  if (self->_customView)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("customView = %@"), self->_customView);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v38);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = CFSTR("empty configuration");
  }
  v40 = (void *)MEMORY[0x1E0CB3940];
  v41 = (objc_class *)objc_opt_class();
  NSStringFromClass(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v42, self, v39);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v43;
}

- (BOOL)_hasBackgroundColor
{
  return self->_backgroundColorMode || self->_backgroundColor != 0;
}

- (BOOL)_hasStroke
{
  if (self->_strokeWidth <= 0.0)
    return 0;
  if (self->_strokeColorMode)
    return 1;
  return self->_strokeColor != 0;
}

- (BOOL)_hasBackgroundFill
{
  return -[_UIBackgroundViewConfiguration _hasBackgroundColor](self, "_hasBackgroundColor")
      || self->_visualEffect
      || self->_customView != 0;
}

- (BOOL)_backgroundFillIsEqual:(id)a3 withTintColor:(id)a4
{
  id v6;
  id v7;
  UIView *customView;
  UIView *v9;
  void *v10;
  void *v11;
  UIVisualEffect *v12;
  UIVisualEffect *v13;
  UIVisualEffect *v14;
  UIVisualEffect *v15;
  UIVisualEffect *v16;
  int v17;
  _BOOL4 v18;
  UIVisualEffect *visualEffect;
  void *v20;
  UIVisualEffect *v21;
  char v22;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    customView = self->_customView;
    objc_msgSend(v6, "customView");
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    if (customView != v9)
    {
LABEL_20:

LABEL_21:
      LOBYTE(v18) = 0;
      goto LABEL_22;
    }
    -[_UIBackgroundViewConfiguration resolvedBackgroundColorForTintColor:](self, "resolvedBackgroundColorForTintColor:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolvedBackgroundColorForTintColor:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    v14 = v13;
    if (v12 == v13)
    {

    }
    else
    {
      v15 = v13;
      v16 = v12;
      if (!v12)
        goto LABEL_18;
      v15 = v13;
      v16 = v12;
      if (!v13)
        goto LABEL_18;
      v17 = -[UIVisualEffect isEqual:](v12, "isEqual:", v13);

      if (!v17)
        goto LABEL_19;
    }
    visualEffect = self->_visualEffect;
    objc_msgSend(v6, "visualEffect");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = visualEffect;
    v21 = v20;
    if (v15 == v21)
    {

LABEL_16:
      LOBYTE(v18) = 1;
      goto LABEL_22;
    }
    v16 = v21;
    if (v15 && v21)
    {
      v22 = -[UIVisualEffect isEqual:](v15, "isEqual:", v21);

      if ((v22 & 1) == 0)
        goto LABEL_21;
      goto LABEL_16;
    }

LABEL_18:
LABEL_19:

    v9 = customView;
    goto LABEL_20;
  }
  v18 = !-[_UIBackgroundViewConfiguration _hasBackgroundFill](self, "_hasBackgroundFill");
LABEL_22:

  return v18;
}

- (void)setCustomView:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  v9 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "translatesAutoresizingMaskIntoConstraints");
    v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBackgroundViewConfiguration.m"), 767, CFSTR("Custom view must have translatesAutoresizingMaskIntoConstraints enabled, even if auto layout constraints are used inside it. Custom view: %@"), v9);

      v6 = v9;
    }
  }
  *(_WORD *)&self->_configurationFlags |= 1u;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)self, v6);

}

- (UIView)customView
{
  return self->_customView;
}

- (void)setCornerRadius:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  -[_UIBackgroundViewConfiguration _setCornerRadius:](self, "_setCornerRadius:", a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)a3
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_backgroundInsets = a3;
}

- (NSDirectionalEdgeInsets)backgroundInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_backgroundInsets.top;
  leading = self->_backgroundInsets.leading;
  bottom = self->_backgroundInsets.bottom;
  trailing = self->_backgroundInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setEdgesAddingLayoutMarginsToBackgroundInsets:(unint64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_edgesAddingLayoutMarginsToBackgroundInsets = a3;
}

- (unint64_t)edgesAddingLayoutMarginsToBackgroundInsets
{
  return self->_edgesAddingLayoutMarginsToBackgroundInsets;
}

- (void)setBackgroundColorMode:(int64_t)a3
{
  UIColor *backgroundColor;

  *(_WORD *)&self->_configurationFlags |= 0x10u;
  self->_backgroundColorMode = a3;
  if (a3)
  {
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = 0;

  }
}

- (int64_t)backgroundColorMode
{
  return self->_backgroundColorMode;
}

- (void)setBackgroundColor:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  -[_UIBackgroundViewConfiguration _setBackgroundColor:]((uint64_t)self, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setVisualEffect:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (void)setStrokeColorMode:(int64_t)a3
{
  UIColor *strokeColor;

  *(_WORD *)&self->_configurationFlags |= 0x40u;
  self->_strokeColorMode = a3;
  if (a3)
  {
    strokeColor = self->_strokeColor;
    self->_strokeColor = 0;

  }
}

- (int64_t)strokeColorMode
{
  return self->_strokeColorMode;
}

- (void)setStrokeColor:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  -[UIBackgroundConfiguration _setImage:]((uint64_t)self, a3);
  if (a3)
    self->_strokeColorMode = 0;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeWidth:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  self->_strokeWidth = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeOutset:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x100u;
  self->_strokeOutset = a3;
}

- (double)strokeOutset
{
  return self->_strokeOutset;
}

- (id)_updatedConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_viewConfigurationState");

  objc_msgSend(v4, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIBackgroundViewConfiguration updatedConfigurationForState:traitCollection:](self, "updatedConfigurationForState:traitCollection:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resolvedBackgroundColorForTintColor:(id)a3
{
  UIColor *v4;
  UIColor *backgroundColor;
  UIColor *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UIColor *v11;
  UIColor *v12;
  UIColor *v13;
  UIColor *v14;

  v4 = (UIColor *)a3;
  backgroundColor = v4;
  if (!self->_backgroundColorMode)
    backgroundColor = self->_backgroundColor;
  v6 = backgroundColor;
  v7 = self->_backgroundColorMode - 2;
  if (v7 > 9)
    v8 = 0;
  else
    v8 = qword_186682EE8[v7];
  _UIConfigurationColorTransformerForIdentifier(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, UIColor *))(v9 + 16))(v9, v6);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v6;
  }
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (BOOL)isTintBackgroundColor
{
  return self->_backgroundColorMode != 0;
}

- (id)resolvedStrokeColorForTintColor:(id)a3
{
  UIColor *v4;
  UIColor *strokeColor;
  UIColor *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UIColor *v11;
  UIColor *v12;
  UIColor *v13;
  UIColor *v14;

  v4 = (UIColor *)a3;
  strokeColor = v4;
  if (!self->_strokeColorMode)
    strokeColor = self->_strokeColor;
  v6 = strokeColor;
  v7 = self->_strokeColorMode - 2;
  if (v7 > 9)
    v8 = 0;
  else
    v8 = qword_186682EE8[v7];
  _UIConfigurationColorTransformerForIdentifier(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, UIColor *))(v9 + 16))(v9, v6);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v6;
  }
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (UIImage)image
{
  return 0;
}

- (int64_t)imageContentMode
{
  return 0;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIShadowProperties)_shadowProperties
{
  return self->_shadowProperties;
}

- (void)_setShadowProperties:(id)a3
{
  objc_storeStrong((id *)&self->_shadowProperties, a3);
}

- (int64_t)_strokeLocation
{
  return self->_strokeLocation;
}

- (void)_setStrokeLocation:(int64_t)a3
{
  self->_strokeLocation = a3;
}

- (unint64_t)__maskedCorners
{
  return self->_maskedCorners;
}

- (void)__setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (NSString)__visualEffectGroupName
{
  return self->_visualEffectGroupName;
}

- (void)__setVisualEffectGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)__visualEffectblurClippingMode
{
  return self->_visualEffectblurClippingMode;
}

- (void)__setVisualEffectblurClippingMode:(unint64_t)a3
{
  self->_visualEffectblurClippingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectGroupName, 0);
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

@end
