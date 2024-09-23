@implementation UIBackgroundConfiguration

- (void)_setCustomView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong(&self->_strokeColorTransformer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_visualEffectGroupName, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong(&self->_backgroundColorTransformer, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

- (void)setVisualEffect:(UIVisualEffect *)visualEffect
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  objc_setProperty_nonatomic_copy(self, a2, visualEffect, 56);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;

  v4 = (id *)-[UIBackgroundConfiguration _init](+[UIBackgroundConfiguration allocWithZone:](UIBackgroundConfiguration, "allocWithZone:", a3));
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 2, self->_customView);
    v5[3] = *(id *)&self->_cornerRadius;
    v5[16] = (id)self->_maskedCorners;
    objc_storeStrong(v5 + 5, self->_backgroundColor);
    v6 = objc_msgSend(self->_backgroundColorTransformer, "copy");
    v7 = v5[6];
    v5[6] = (id)v6;

    v5[19] = (id)self->_backgroundColorTransformerIdentifier;
    v8 = -[UIVisualEffect copy](self->_visualEffect, "copy");
    v9 = v5[7];
    v5[7] = (id)v8;

    v10 = -[NSString copy](self->_visualEffectGroupName, "copy");
    v11 = v5[8];
    v5[8] = (id)v10;

    v5[17] = (id)self->_visualEffectblurClippingMode;
    objc_storeStrong(v5 + 9, self->_image);
    v5[10] = (id)self->_imageContentMode;
    v12 = *(_OWORD *)&self->_backgroundInsets.bottom;
    *((_OWORD *)v5 + 11) = *(_OWORD *)&self->_backgroundInsets.top;
    *((_OWORD *)v5 + 12) = v12;
    v5[4] = (id)self->_edgesAddingLayoutMarginsToBackgroundInsets;
    objc_storeStrong(v5 + 11, self->_strokeColor);
    v13 = objc_msgSend(self->_strokeColorTransformer, "copy");
    v14 = v5[12];
    v5[12] = (id)v13;

    v5[20] = (id)self->_strokeColorTransformerIdentifier;
    v5[13] = *(id *)&self->_strokeWidth;
    v5[14] = *(id *)&self->_strokeOutset;
    v5[21] = (id)self->_strokeLocation;
    v15 = -[UIShadowProperties copy](self->_shadowProperties, "copy");
    v16 = v5[15];
    v5[15] = (id)v15;

    v5[18] = (id)self->_defaultStyle;
    *((_DWORD *)v5 + 2) = self->_configurationFlags;
  }
  return v5;
}

- (_QWORD)_init
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)UIBackgroundConfiguration;
  v1 = objc_msgSendSuper2(&v8, sel_init);
  v2 = v1;
  if (v1)
  {
    v1[18] = 0;
    +[UIColor clearColor](UIColor, "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[5];
    v2[5] = v3;

    +[UIColor clearColor](UIColor, "clearColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[11];
    v2[11] = v5;

    v2[16] = 15;
    v2[21] = 0;
  }
  return v2;
}

- (UIBackgroundConfiguration)updatedConfigurationForState:(id)state
{
  id v4;
  uint64_t v5;
  unint64_t defaultStyle;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  __int128 v29;
  __int16 configurationFlags;
  void *v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = state;
  v5 = -[UIBackgroundConfiguration copy](self, "copy");
  defaultStyle = self->_defaultStyle;
  if (defaultStyle)
  {
    v7 = v4;
    v8 = objc_opt_self();
    if (defaultStyle - 11 >= 3)
    {
      v9 = v7;
      v13 = objc_opt_self();
      +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      switch(defaultStyle)
      {
        case 1uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 2uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 3uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 4uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 5uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v13;
          v23 = v10;
          v24 = v14;
          v25 = 0;
          goto LABEL_24;
        case 6uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListSidebarHeaderConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 7uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v13;
          v23 = v10;
          v24 = v14;
          v25 = 1;
LABEL_24:
          +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:](v22, v23, v24, v25);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 8uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 9uLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 0xAuLL:
          objc_msgSend(v9, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIBackgroundConfiguration _defaultListSidebarPlainCellConfigurationForState:traitCollection:](v13, v10, v14);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_28:
          v21 = v15;
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForFixedStyle_state_, v13, CFSTR("UIBackgroundConfiguration.m"), 617, CFSTR("Unknown style: %ld"), defaultStyle);
          v21 = 0;
          break;
      }

    }
    else
    {
      objc_msgSend(v7, "traitCollection");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "listEnvironment");
      switch(defaultStyle)
      {
        case 0xDuLL:
          switch(v11)
          {
            case 3:
            case 5:
              +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              v17 = objc_claimAutoreleasedReturnValue();
              break;
            case 4:
              +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              v17 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              v17 = objc_claimAutoreleasedReturnValue();
              break;
          }
          v21 = v17;
          if (v17)
          {
            v26 = 13;
            goto LABEL_43;
          }
          break;
        case 0xCuLL:
          switch(v11)
          {
            case 3:
              +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              v16 = objc_claimAutoreleasedReturnValue();
              break;
            case 4:
              +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              v16 = objc_claimAutoreleasedReturnValue();
              break;
            case 5:
              +[UIBackgroundConfiguration _defaultListSidebarHeaderConfigurationForState:traitCollection:](v8, v10, v9);
              v16 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:](v8, v10, v9);
              v16 = objc_claimAutoreleasedReturnValue();
              break;
          }
          v21 = v16;
          if (v16)
          {
            v26 = 12;
            goto LABEL_43;
          }
          break;
        case 0xBuLL:
          switch(v11)
          {
            case 3:
              +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:](v8, v10, v9);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            case 4:
              +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:](v8, v10, v9);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            case 5:
              +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:](v8, v10, v9, objc_msgSend(v9, "_splitViewControllerContext") == 2);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            case 6:
              +[UIBackgroundConfiguration _defaultListSidebarPlainCellConfigurationForState:traitCollection:](v8, v10, v9);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:](v8, v10, v9);
              v12 = objc_claimAutoreleasedReturnValue();
              break;
          }
          v21 = v12;
          if (v12)
          {
            v26 = 11;
LABEL_43:
            *(_QWORD *)(v21 + 144) = v26;
          }
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[UIBackgroundConfiguration _defaultConfigurationForStyle:state:]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          _UIBackgroundConfigurationStyleToString(defaultStyle);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("UIBackgroundConfiguration.m"), 585, CFSTR("Attempting to fetch default configuration for unknown generic style. Style: %@"), v20);

          +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
          v21 = objc_claimAutoreleasedReturnValue();
          break;
      }
    }

    configurationFlags = (__int16)self->_configurationFlags;
    if ((configurationFlags & 1) != 0)
    {
      if ((configurationFlags & 2) != 0)
        goto LABEL_48;
    }
    else
    {
      if (v21)
        v31 = *(void **)(v21 + 16);
      else
        v31 = 0;
      -[UIBackgroundConfiguration _setCustomView:](v5, v31);
      configurationFlags = (__int16)self->_configurationFlags;
      if ((configurationFlags & 2) != 0)
      {
LABEL_48:
        if ((configurationFlags & 4) != 0)
          goto LABEL_55;
LABEL_52:
        if (v21)
        {
          v29 = *(_OWORD *)(v21 + 176);
          v32 = *(_OWORD *)(v21 + 192);
          if (!v5)
            goto LABEL_55;
        }
        else
        {
          v29 = 0uLL;
          v32 = 0uLL;
          if (!v5)
          {
LABEL_55:
            if ((configurationFlags & 8) != 0)
              goto LABEL_59;
            if (v21)
            {
              v33 = *(_QWORD *)(v21 + 32);
              if (!v5)
                goto LABEL_59;
            }
            else
            {
              v33 = 0;
              if (!v5)
              {
LABEL_59:
                if ((configurationFlags & 0x10) != 0)
                {
                  if ((configurationFlags & 0x20) != 0)
                    goto LABEL_63;
                }
                else
                {
                  if (v21)
                    v34 = *(void **)(v21 + 40);
                  else
                    v34 = 0;
                  -[UIBackgroundConfiguration _setBackgroundColor:](v5, v34);
                  configurationFlags = (__int16)self->_configurationFlags;
                  if ((configurationFlags & 0x20) != 0)
                  {
LABEL_63:
                    if ((configurationFlags & 0x40) != 0)
                      goto LABEL_72;
LABEL_69:
                    if (v21)
                    {
                      v28 = *(void **)(v21 + 56);
                      if (!v5)
                        goto LABEL_72;
                      goto LABEL_71;
                    }
                    v28 = 0;
                    if (v5)
                    {
LABEL_71:
                      objc_setProperty_nonatomic_copy((id)v5, v27, v28, 56);
                      configurationFlags = (__int16)self->_configurationFlags;
                    }
LABEL_72:
                    if ((configurationFlags & 0x80) != 0)
                    {
                      if ((configurationFlags & 0x100) != 0)
                      {
LABEL_74:
                        if ((configurationFlags & 0x200) == 0)
                          goto LABEL_75;
                        goto LABEL_81;
                      }
                    }
                    else
                    {
                      objc_msgSend((id)v21, "__visualEffectGroupName", v28);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend((id)v5, "__setVisualEffectGroupName:", v36);

                      configurationFlags = (__int16)self->_configurationFlags;
                      if ((configurationFlags & 0x100) != 0)
                        goto LABEL_74;
                    }
                    objc_msgSend((id)v5, "__setVisualEffectblurClippingMode:", objc_msgSend((id)v21, "__visualEffectblurClippingMode"));
                    configurationFlags = (__int16)self->_configurationFlags;
                    if ((configurationFlags & 0x200) == 0)
                    {
LABEL_75:
                      if (v21)
                        v37 = *(void **)(v21 + 72);
                      else
                        v37 = 0;
                      -[UIBackgroundConfiguration _setImage:](v5, v37);
                      configurationFlags = (__int16)self->_configurationFlags;
                      if ((configurationFlags & 0x400) != 0)
                        goto LABEL_85;
                      goto LABEL_82;
                    }
LABEL_81:
                    if ((configurationFlags & 0x400) != 0)
                      goto LABEL_85;
LABEL_82:
                    if (v21)
                    {
                      v38 = *(_QWORD *)(v21 + 80);
                      if (!v5)
                        goto LABEL_85;
                      goto LABEL_84;
                    }
                    v38 = 0;
                    if (v5)
                    {
LABEL_84:
                      *(_QWORD *)(v5 + 80) = v38;
                      configurationFlags = (__int16)self->_configurationFlags;
                    }
LABEL_85:
                    if ((configurationFlags & 0x800) != 0)
                    {
                      if ((configurationFlags & 0x1000) != 0)
                        goto LABEL_89;
                    }
                    else
                    {
                      if (v21)
                        v39 = *(void **)(v21 + 88);
                      else
                        v39 = 0;
                      -[UIBackgroundConfiguration _setStrokeColor:](v5, v39);
                      configurationFlags = (__int16)self->_configurationFlags;
                      if ((configurationFlags & 0x1000) != 0)
                      {
LABEL_89:
                        if ((configurationFlags & 0x2000) != 0)
                          goto LABEL_98;
LABEL_95:
                        if (v21)
                        {
                          *(_QWORD *)&v29 = *(_QWORD *)(v21 + 104);
                          if (!v5)
                            goto LABEL_98;
                          goto LABEL_97;
                        }
                        *(_QWORD *)&v29 = 0;
                        if (v5)
                        {
LABEL_97:
                          *(_QWORD *)(v5 + 104) = v29;
                          configurationFlags = (__int16)self->_configurationFlags;
                        }
LABEL_98:
                        if ((configurationFlags & 0x4000) != 0)
                          goto LABEL_102;
                        if (v21)
                        {
                          *(_QWORD *)&v29 = *(_QWORD *)(v21 + 112);
                          if (!v5)
                            goto LABEL_102;
                        }
                        else
                        {
                          *(_QWORD *)&v29 = 0;
                          if (!v5)
                          {
LABEL_102:
                            if ((configurationFlags & 0x8000) == 0)
                              objc_msgSend((id)v5, "__setMaskedCorners:", objc_msgSend((id)v21, "__maskedCorners", *(double *)&v29));
                            objc_msgSend((id)v5, "_shadowProperties", *(double *)&v29);
                            v41 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v41)
                            {

                            }
                            else
                            {
                              objc_msgSend((id)v21, "_shadowProperties");
                              v42 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v42)
                              {
LABEL_108:
                                objc_msgSend((id)v5, "_setStrokeLocation:", objc_msgSend((id)v21, "_strokeLocation"));

                                goto LABEL_109;
                              }
                            }
                            objc_msgSend((id)v5, "shadowProperties");
                            v43 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend((id)v21, "shadowProperties");
                            v44 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v43, "_applyPropertiesFromDefaultProperties:", v44);

                            goto LABEL_108;
                          }
                        }
                        *(_QWORD *)(v5 + 112) = v29;
                        configurationFlags = (__int16)self->_configurationFlags;
                        goto LABEL_102;
                      }
                    }
                    if (v21)
                      v40 = *(void **)(v21 + 96);
                    else
                      v40 = 0;
                    -[UIBackgroundConfiguration _setStrokeColorTransformer:](v5, v40);
                    configurationFlags = (__int16)self->_configurationFlags;
                    if ((configurationFlags & 0x2000) != 0)
                      goto LABEL_98;
                    goto LABEL_95;
                  }
                }
                if (v21)
                  v35 = *(void **)(v21 + 48);
                else
                  v35 = 0;
                -[UIBackgroundConfiguration _setBackgroundColorTransformer:](v5, v35);
                configurationFlags = (__int16)self->_configurationFlags;
                if ((configurationFlags & 0x40) != 0)
                  goto LABEL_72;
                goto LABEL_69;
              }
            }
            *(_QWORD *)(v5 + 32) = v33;
            configurationFlags = (__int16)self->_configurationFlags;
            goto LABEL_59;
          }
        }
        *(_OWORD *)(v5 + 176) = v29;
        *(_OWORD *)(v5 + 192) = v32;
        configurationFlags = (__int16)self->_configurationFlags;
        goto LABEL_55;
      }
    }
    objc_msgSend((id)v21, "_cornerRadius");
    objc_msgSend((id)v5, "_setCornerRadius:");
    configurationFlags = (__int16)self->_configurationFlags;
    if ((configurationFlags & 4) != 0)
      goto LABEL_55;
    goto LABEL_52;
  }
LABEL_109:

  return (UIBackgroundConfiguration *)(id)v5;
}

- (void)__setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (NSString)__visualEffectGroupName
{
  return self->_visualEffectGroupName;
}

- (void)_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)_setBackgroundColorTransformerIdentifier:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    _UIConfigurationColorTransformerForIdentifier(a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v4;

    if (*(_QWORD *)(a1 + 48))
      v6 = a2;
    else
      v6 = 0;
    *(_QWORD *)(a1 + 152) = v6;
  }
}

- (UIView)customView
{
  return self->_customView;
}

- (void)_setStrokeColor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)_setBackgroundColor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (unint64_t)__maskedCorners
{
  return self->_maskedCorners;
}

- (int64_t)_strokeLocation
{
  return self->_strokeLocation;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)_isEqualToInternalConfigurationQuick:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[UIBackgroundConfiguration _isEqualToConfigurationQuick:]((uint64_t)self, v4);
  else
    v5 = 0;

  return v5;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  void **v3;
  void *v4;
  void *v5;
  void **v7;

  v3 = a2;
  if (a1)
  {
    if (v3 == (void **)a1)
    {
      a1 = 1;
    }
    else if (*(void **)(a1 + 144) == v3[18]
           && *(void **)(a1 + 40) == v3[5]
           && *(void **)(a1 + 16) == v3[2]
           && *(double *)(a1 + 24) == *((double *)v3 + 3)
           && *(void **)(a1 + 128) == v3[16]
           && *(void **)(a1 + 32) == v3[4]
           && *(void **)(a1 + 88) == v3[11]
           && *(double *)(a1 + 104) == *((double *)v3 + 13)
           && *(double *)(a1 + 112) == *((double *)v3 + 14)
           && *(void **)(a1 + 72) == v3[9]
           && *(void **)(a1 + 80) == v3[10])
    {
      v7 = v3;
      if (*(void **)(a1 + 168) == v3[21]
        && *(void **)(a1 + 136) == v3[17]
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 176), *((float64x2_t *)v3 + 11)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 192), *((float64x2_t *)v3 + 12)))), 0xFuLL))) & 1) != 0&& (v4 = *(void **)(a1 + 152), v4 == v3[19])&& (v4 != (void *)1 || *(void **)(a1 + 48) == v3[6])&& (v5 = *(void **)(a1 + 160), v5 == v3[20])&& (v5 != (void *)1 || *(void **)(a1 + 96) == v3[12])&& UIEqual(*(void **)(a1 + 120), v3[15])&& UIEqual(*(void **)(a1 + 64), v7[8]))
      {
        a1 = UIEqual(*(void **)(a1 + 56), v7[7]);
        v3 = v7;
      }
      else
      {
        a1 = 0;
        v3 = v7;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (UIImage)image
{
  return self->_image;
}

- (void)_setStrokeLocation:(int64_t)a3
{
  self->_strokeLocation = a3;
}

- (void)_setStrokeColorTransformer:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v3 = a2;
    *(_QWORD *)(a1 + 160) = _UIConfigurationIdentifierForColorTransformer(v3);
    v4 = objc_msgSend(v3, "copy");

    v5 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v4;

  }
}

- (void)_setImage:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)_setBackgroundColorTransformer:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v3 = a2;
    *(_QWORD *)(a1 + 152) = _UIConfigurationIdentifierForColorTransformer(v3);
    v4 = objc_msgSend(v3, "copy");

    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v4;

  }
}

- (void)__setVisualEffectGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)_hasBackgroundColor
{
  UIColor *backgroundColor;
  UIColor *v3;

  backgroundColor = self->_backgroundColor;
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  LOBYTE(backgroundColor) = backgroundColor != v3;

  return (char)backgroundColor;
}

- (BOOL)_hasStroke
{
  UIColor *strokeColor;
  UIColor *v3;
  BOOL v4;

  if (self->_strokeWidth <= 0.0)
    return 0;
  strokeColor = self->_strokeColor;
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v4 = strokeColor != v3;

  return v4;
}

- (CGFloat)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  -[UIBackgroundConfiguration _setCornerRadius:](self, "_setCornerRadius:", cornerRadius);
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

- (NSDirectionalRectEdge)edgesAddingLayoutMarginsToBackgroundInsets
{
  return self->_edgesAddingLayoutMarginsToBackgroundInsets;
}

+ (_QWORD)_defaultListGroupedCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _BYTE v10[136];
  id v11[18];

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (objc_msgSend(v5, "userInterfaceIdiom") == 6 && dyld_program_sdk_at_least())
  {
    +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:](v6, v4, v5);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _UITableConstantsForTraitCollection(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    memset(v11, 0, 136);
    if (v8)
      objc_msgSend(v8, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", 1, v4, v5);
    __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v10, (uint64_t)v11);
    _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v10, v5);
    if (v7)
      v7[18] = 3;
    __destructor_8_s8_s16_s24_s80(v11);

  }
  return v7;
}

+ (_QWORD)_defaultListPlainCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  void *v6;
  _QWORD *v7;
  _BYTE v9[136];
  id v10[18];

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  memset(v10, 0, 136);
  if (v6)
    objc_msgSend(v6, "defaultCellBackgroundPropertiesForTableViewStyle:state:traitCollection:", 0, v4, v5);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v9, v5);
  if (v7)
    v7[18] = 1;
  __destructor_8_s8_s16_s24_s80(v10);

  return v7;
}

+ (UIBackgroundConfiguration)clearConfiguration
{
  return (UIBackgroundConfiguration *)-[UIBackgroundConfiguration _init]([UIBackgroundConfiguration alloc]);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
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
  UIImage *v16;
  int v17;
  _BOOL4 v18;
  UIVisualEffect *visualEffect;
  void *v20;
  UIImage *v21;
  int v22;
  UIImage *image;
  void *v24;
  UIImage *v25;
  UIVisualEffect *v26;
  BOOL v27;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    customView = self->_customView;
    objc_msgSend(v6, "customView");
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    if (customView != v9)
    {
LABEL_29:

LABEL_30:
      LOBYTE(v18) = 0;
      goto LABEL_31;
    }
    -[UIBackgroundConfiguration resolvedBackgroundColorForTintColor:](self, "resolvedBackgroundColorForTintColor:", v7);
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
      v16 = (UIImage *)v12;
      if (!v12)
        goto LABEL_26;
      v15 = v13;
      v16 = (UIImage *)v12;
      if (!v13)
        goto LABEL_26;
      v17 = -[UIVisualEffect isEqual:](v12, "isEqual:", v13);

      if (!v17)
        goto LABEL_28;
    }
    visualEffect = self->_visualEffect;
    objc_msgSend(v6, "visualEffect");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = visualEffect;
    v21 = v20;
    v16 = v21;
    if (v15 == (UIVisualEffect *)v21)
    {

    }
    else
    {
      if (!v15 || !v21)
      {
        v25 = v21;
LABEL_25:

LABEL_26:
LABEL_27:

LABEL_28:
        v9 = customView;
        goto LABEL_29;
      }
      v22 = -[UIVisualEffect isEqual:](v15, "isEqual:", v21);

      if (!v22)
        goto LABEL_27;
    }
    image = self->_image;
    objc_msgSend(v6, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = image;
    v26 = v24;
    if (v25 == (UIImage *)v26)
    {

LABEL_23:
      LOBYTE(v18) = 1;
      goto LABEL_31;
    }
    v15 = v26;
    if (v25 && v26)
    {
      v27 = -[UIImage isEqual:](v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_30;
      goto LABEL_23;
    }

    goto LABEL_25;
  }
  v18 = !-[UIBackgroundConfiguration _hasBackgroundFill](self, "_hasBackgroundFill");
LABEL_31:

  return v18;
}

- (UIColor)resolvedBackgroundColorForTintColor:(UIColor *)tintColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *backgroundColor;
  UIColor *v7;
  void (**backgroundColorTransformer)(id, id);
  UIColor *v9;
  UIColor *v10;

  v4 = tintColor;
  v5 = v4;
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
    backgroundColor = v4;
  v7 = backgroundColor;
  backgroundColorTransformer = (void (**)(id, id))self->_backgroundColorTransformer;
  if (backgroundColorTransformer)
  {
    backgroundColorTransformer[2](backgroundColorTransformer, v7);
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (UIBackgroundConfiguration)listPlainCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBackgroundConfiguration *)v5;
}

+ (id)_listInsetGroupedCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListInsetGroupedCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultListInsetGroupedCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:](v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self, backgroundColor);
}

- (void)setCustomView:(UIView *)customView
{
  UIView *v5;
  UIView *v6;
  BOOL v7;
  void *v8;
  UIView *v9;

  v5 = customView;
  v6 = v5;
  v9 = v5;
  if (v5)
  {
    v7 = -[UIView translatesAutoresizingMaskIntoConstraints](v5, "translatesAutoresizingMaskIntoConstraints");
    v6 = v9;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBackgroundConfiguration.m"), 1061, CFSTR("Custom view must have translatesAutoresizingMaskIntoConstraints enabled, even if auto layout constraints are used inside it. Custom view: %@"), v9);

      v6 = v9;
    }
  }
  *(_WORD *)&self->_configurationFlags |= 1u;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)self, v6);

}

+ (id)_listInsetGroupedHeaderFooterConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListInsetGroupedHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultListInsetGroupedHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (objc_msgSend(v5, "userInterfaceIdiom") == 6)
  {
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      *(_QWORD *)(v7 + 144) = 9;
  }
  else
  {
    +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:](v6, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (_QWORD)_defaultListGroupedHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  void *v6;
  _QWORD *v7;
  _BYTE v9[136];
  id v10[18];

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  memset(v10, 0, 136);
  if (v6)
    objc_msgSend(v6, "defaultHeaderFooterBackgroundPropertiesForTableViewStyle:cellConfigurationState:traitCollection:floating:", 1, v4, v5, 0);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v9, (uint64_t)v10);
  _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v9, v5);
  if (v7)
    v7[18] = 4;
  __destructor_8_s8_s16_s24_s80(v10);

  return v7;
}

+ (UIBackgroundConfiguration)listGroupedCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListGroupedCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBackgroundConfiguration *)v5;
}

- (CGFloat)strokeOutset
{
  return self->_strokeOutset;
}

- (void)setStrokeWidth:(CGFloat)strokeWidth
{
  *(_WORD *)&self->_configurationFlags |= 0x2000u;
  self->_strokeWidth = strokeWidth;
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  *(_WORD *)&self->_configurationFlags |= 0x800u;
  -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)self, strokeColor);
}

+ (UIBackgroundConfiguration)listPlainHeaderFooterConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBackgroundConfiguration *)v5;
}

+ (_QWORD)_defaultListPlainHeaderFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
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

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v8 = objc_msgSend(v4, "isPinned");
  if (v6)
  {
    objc_msgSend(v6, "defaultHeaderFooterBackgroundPropertiesForTableViewStyle:cellConfigurationState:traitCollection:floating:", 0, v4, v5, v8);
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
  _UIBackgroundConfigurationApplyProperties(v7, (uint64_t)v10, v5);
  if (v7)
    v7[18] = 2;
  __destructor_8_s8_s16_s24_s80((id *)&v11);

  return v7;
}

+ (UIBackgroundConfiguration)listGroupedHeaderFooterConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListGroupedHeaderFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBackgroundConfiguration *)v5;
}

- (BOOL)_hasBackgroundFill
{
  return -[UIBackgroundConfiguration _hasBackgroundColor](self, "_hasBackgroundColor")
      || self->_visualEffect
      || self->_image
      || self->_customView != 0;
}

- (BOOL)isEqual:(id)a3
{
  UIBackgroundConfiguration *v4;
  UIBackgroundConfiguration *v5;
  char v6;

  v4 = (UIBackgroundConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[UIBackgroundConfiguration _isEqualToConfiguration:]((uint64_t)self, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_isEqualToConfiguration:(uint64_t)a1
{
  void **v3;
  void *v5;
  void *v6;
  void **v7;

  v3 = a2;
  if (a1)
  {
    if (v3 == (void **)a1)
    {
      a1 = 1;
    }
    else if (*(void **)(a1 + 144) == v3[18]
           && *(void **)(a1 + 16) == v3[2]
           && *(double *)(a1 + 24) == *((double *)v3 + 3)
           && *(void **)(a1 + 128) == v3[16]
           && *(void **)(a1 + 32) == v3[4]
           && *(double *)(a1 + 104) == *((double *)v3 + 13)
           && *(double *)(a1 + 112) == *((double *)v3 + 14)
           && *(void **)(a1 + 80) == v3[10]
           && *(void **)(a1 + 168) == v3[21]
           && *(void **)(a1 + 136) == v3[17]
           && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 176), *((float64x2_t *)v3 + 11)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 192), *((float64x2_t *)v3 + 12)))), 0xFuLL))) & 1) != 0)
    {
      v5 = *(void **)(a1 + 152);
      v7 = v3;
      if (v5 == v3[19]
        && (v5 != (void *)1 || *(void **)(a1 + 48) == v3[6])
        && (v6 = *(void **)(a1 + 160), v6 == v3[20])
        && (v6 != (void *)1 || *(void **)(a1 + 96) == v3[12])
        && UIEqual(*(void **)(a1 + 40), v3[5])
        && UIEqual(*(void **)(a1 + 88), v7[11])
        && UIEqual(*(void **)(a1 + 64), v7[8])
        && UIEqual(*(void **)(a1 + 56), v7[7])
        && UIEqual(*(void **)(a1 + 72), v7[9]))
      {
        a1 = UIEqual(*(void **)(a1 + 120), v7[15]);
        v3 = v7;
      }
      else
      {
        a1 = 0;
        v3 = v7;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

+ (UIBackgroundConfiguration)listSidebarHeaderConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListSidebarHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBackgroundConfiguration *)v5;
}

+ (_QWORD)_defaultListSidebarHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  _QWORD *v6;
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

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  _UITableConstantsForTraitCollection(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "defaultSidebarHeaderBackgroundPropertiesWithState:traitCollection:", v4, v5);
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
  _UIBackgroundConfigurationApplyProperties(v6, (uint64_t)v10, v5);
  if (v6)
    v6[18] = 6;
  __destructor_8_s8_s16_s24_s80((id *)&v11);

  return v6;
}

+ (id)listCellConfiguration
{
  void *v2;
  void *v3;
  _QWORD *v4;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListPlainCellConfigurationForState:traitCollection:]((uint64_t)UIBackgroundConfiguration, v2, v3);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v4[18] = 11;
  return v4;
}

+ (id)listHeaderConfiguration
{
  void *v2;
  void *v3;
  _QWORD *v4;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:]((uint64_t)UIBackgroundConfiguration, v2, v3);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v4[18] = 12;
  return v4;
}

+ (id)listFooterConfiguration
{
  void *v2;
  void *v3;
  _QWORD *v4;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListPlainHeaderFooterConfigurationForState:traitCollection:]((uint64_t)UIBackgroundConfiguration, v2, v3);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v4[18] = 13;
  return v4;
}

+ (UIBackgroundConfiguration)listAccompaniedSidebarCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:]((uint64_t)a1, v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBackgroundConfiguration *)v5;
}

+ (_QWORD)_defaultListSidebarCellConfigurationForState:(void *)a3 traitCollection:(int)a4 isAccompanied:
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[136];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  _UITableConstantsForTraitCollection(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (a4)
      v11 = 2;
    else
      v11 = 1;
    objc_msgSend(v9, "defaultSidebarCellBackgroundPropertiesForStyle:state:traitCollection:", v11, v6, v7);
  }
  else
  {
    v23 = 0;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
  }

  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v14, (uint64_t)&v15);
  _UIBackgroundConfigurationApplyProperties(v8, (uint64_t)v14, v7);
  if (v8)
  {
    v12 = 5;
    if (a4)
      v12 = 7;
    v8[18] = v12;
  }
  __destructor_8_s8_s16_s24_s80((id *)&v15);

  return v8;
}

+ (id)_sidebarPlainCellConfiguration
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_opt_self();
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListSidebarPlainCellConfigurationForState:traitCollection:](v0, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (_QWORD)_defaultListSidebarPlainCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  _QWORD *v6;
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

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  _UITableConstantsForTraitCollection(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "defaultSidebarCellBackgroundPropertiesForStyle:state:traitCollection:", 3, v4, v5);
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
  _UIBackgroundConfigurationApplyProperties(v6, (uint64_t)v10, v5);
  if (v6)
    v6[18] = 10;
  __destructor_8_s8_s16_s24_s80((id *)&v11);

  return v6;
}

+ (UIBackgroundConfiguration)listSidebarCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBackgroundConfiguration _defaultListSidebarCellConfigurationForState:traitCollection:isAccompanied:]((uint64_t)a1, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBackgroundConfiguration *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIBackgroundConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIBackgroundConfiguration *v5;
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
  uint64_t v16;
  UIImage *image;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  UIColor *strokeColor;
  uint64_t v24;
  uint64_t v25;
  id strokeColorTransformer;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  void *shadowProperties;
  uint64_t v32;
  uint64_t v33;
  UIShadowProperties *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  int v54;
  const __CFString *v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  objc_super v73;

  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)UIBackgroundConfiguration;
  v5 = -[UIBackgroundConfiguration init](&v73, sel_init);
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
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v9;

    -[UIBackgroundConfiguration _setBackgroundColorTransformerIdentifier:]((uint64_t)v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundColorTransformerIdentifier")));
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
      v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("visualEffectAllowsTransparentBlurring")) ^ 1;
    v5->_visualEffectblurClippingMode = v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v16 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v16;

    v5->_imageContentMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imageContentMode"));
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("backgroundInsets"));
    v5->_backgroundInsets.top = v18;
    v5->_backgroundInsets.leading = v19;
    v5->_backgroundInsets.bottom = v20;
    v5->_backgroundInsets.trailing = v21;
    v5->_edgesAddingLayoutMarginsToBackgroundInsets = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strokeColor"));
    v22 = objc_claimAutoreleasedReturnValue();
    strokeColor = v5->_strokeColor;
    v5->_strokeColor = (UIColor *)v22;

    v24 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("strokeColorTransformerIdentifier"));
    _UIConfigurationColorTransformerForIdentifier(v24);
    v25 = objc_claimAutoreleasedReturnValue();
    strokeColorTransformer = v5->_strokeColorTransformer;
    v5->_strokeColorTransformer = (id)v25;

    if (v5->_strokeColorTransformer)
      v27 = v24;
    else
      v27 = 0;
    v5->_strokeColorTransformerIdentifier = v27;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("strokeWidth"));
    v5->_strokeWidth = v28;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("strokeOutset"));
    v5->_strokeOutset = v29;
    v5->_strokeLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("strokeLocation"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shadowProperties")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadowProperties"));
      v30 = objc_claimAutoreleasedReturnValue();
      shadowProperties = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v30;
    }
    else
    {
      v32 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shadowType"));
      +[UITraitCollection _fallbackTraitCollection]();
      shadowProperties = (void *)objc_claimAutoreleasedReturnValue();
      _UIShadowPropertiesFromShadowType(v32, shadowProperties);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v5->_shadowProperties;
      v5->_shadowProperties = (UIShadowProperties *)v33;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("defaultStyle_v2")))
      v35 = CFSTR("defaultStyle_v2");
    else
      v35 = CFSTR("defaultStyle");
    v36 = objc_msgSend(v4, "decodeIntegerForKey:", v35);
    if ((unint64_t)(v36 - 1) >= 0xD)
      v37 = 0;
    else
      v37 = v36;
    v5->_defaultStyle = v37;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("customView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", v38);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v39))
      v40 = 2;
    else
      v40 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v40;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundInsets"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v41))
      v42 = 4;
    else
      v42 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v42;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v43))
      v44 = 8;
    else
      v44 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v44;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundColor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v45))
      v46 = 16;
    else
      v46 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v46;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundColorTransformerIdentifier"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v47))
      v48 = 32;
    else
      v48 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v48;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("visualEffect"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v49))
      v50 = 64;
    else
      v50 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v50;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("visualEffectGroupName"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v51))
      v52 = 128;
    else
      v52 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFF7F | v52;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("visualEffectblurClippingMode"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v4, "containsValueForKey:", v53);

    v55 = CFSTR("visualEffectAllowsTransparentBlurring");
    if (v54)
      v55 = CFSTR("visualEffectblurClippingMode");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v56))
      v57 = 256;
    else
      v57 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v57;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("image"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v58))
      v59 = 512;
    else
      v59 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFDFF | v59;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageContentMode"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v60))
      v61 = 1024;
    else
      v61 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFBFF | v61;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v62))
      v63 = 2048;
    else
      v63 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xF7FF | v63;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColorTransformerIdentifier"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v64))
      v65 = 4096;
    else
      v65 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xEFFF | v65;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeWidth"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v66))
      v67 = 0x2000;
    else
      v67 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xDFFF | v67;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeOutset"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v68))
      v69 = 0x4000;
    else
      v69 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xBFFF | v69;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maskedCorners"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v70))
      v71 = 0x8000;
    else
      v71 = 0;
    *(_WORD *)&v5->_configurationFlags = v71 & 0x8000 | *(_WORD *)&v5->_configurationFlags & 0x7FFF;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIShadowProperties *shadowProperties;
  unint64_t defaultStyle;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  if ((objc_msgSend(v37, "requiresSecureCoding") & 1) == 0)
    objc_msgSend(v37, "encodeObject:forKey:", self->_customView, CFSTR("customView"));
  objc_msgSend(v37, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(v37, "encodeInteger:forKey:", self->_maskedCorners, CFSTR("maskedCorners"));
  objc_msgSend(v37, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v37, "encodeInteger:forKey:", self->_backgroundColorTransformerIdentifier, CFSTR("backgroundColorTransformerIdentifier"));
  objc_msgSend(v37, "encodeObject:forKey:", self->_visualEffect, CFSTR("visualEffect"));
  objc_msgSend(v37, "encodeObject:forKey:", self->_visualEffectGroupName, CFSTR("visualEffectGroupName"));
  objc_msgSend(v37, "encodeInteger:forKey:", self->_visualEffectblurClippingMode, CFSTR("visualEffectblurClippingMode"));
  objc_msgSend(v37, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v37, "encodeInteger:forKey:", self->_imageContentMode, CFSTR("imageContentMode"));
  objc_msgSend(v37, "encodeDirectionalEdgeInsets:forKey:", CFSTR("backgroundInsets"), self->_backgroundInsets.top, self->_backgroundInsets.leading, self->_backgroundInsets.bottom, self->_backgroundInsets.trailing);
  objc_msgSend(v37, "encodeInteger:forKey:", self->_edgesAddingLayoutMarginsToBackgroundInsets, CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
  objc_msgSend(v37, "encodeObject:forKey:", self->_strokeColor, CFSTR("strokeColor"));
  objc_msgSend(v37, "encodeInteger:forKey:", self->_strokeColorTransformerIdentifier, CFSTR("strokeColorTransformerIdentifier"));
  objc_msgSend(v37, "encodeDouble:forKey:", CFSTR("strokeWidth"), self->_strokeWidth);
  objc_msgSend(v37, "encodeDouble:forKey:", CFSTR("strokeOutset"), self->_strokeOutset);
  objc_msgSend(v37, "encodeInteger:forKey:", self->_strokeLocation, CFSTR("strokeLocation"));
  shadowProperties = self->_shadowProperties;
  if (shadowProperties)
  {
    objc_msgSend(v37, "encodeObject:forKey:", shadowProperties, CFSTR("shadowProperties"));
    objc_msgSend(v37, "encodeInteger:forKey:", -[UIShadowProperties _backgroundConfigurationShadowType](self->_shadowProperties, "_backgroundConfigurationShadowType"), CFSTR("shadowType"));
  }
  defaultStyle = self->_defaultStyle;
  objc_msgSend(v37, "encodeInteger:forKey:", defaultStyle, CFSTR("defaultStyle_v2"));
  if ((defaultStyle & 0x8000000000000000) != 0)
  {
    defaultStyle = 0;
    v7 = v37;
  }
  else
  {
    v6 = defaultStyle - 10;
    v7 = v37;
    if (defaultStyle >= 0xA)
    {
      if (v6 > 3)
        defaultStyle = 1;
      else
        defaultStyle = qword_1866785A8[v6];
    }
  }
  objc_msgSend(v7, "encodeInteger:forKey:", defaultStyle, CFSTR("defaultStyle"));
  v8 = *(_WORD *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("customView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v8, v9);

  v10 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v10, v11);

  v12 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundInsets"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v12, v13);

  v14 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("edgesAddingLayoutMarginsToBackgroundInsets"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v14, v15);

  v16 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v16, v17);

  v18 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("backgroundColorTransformerIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v18, v19);

  v20 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("visualEffect"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v20, v21);

  v22 = (*(_WORD *)&self->_configurationFlags >> 7) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("visualEffectGroupName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v22, v23);

  v24 = (*(_WORD *)&self->_configurationFlags >> 9) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("image"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v24, v25);

  v26 = (*(_WORD *)&self->_configurationFlags >> 10) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageContentMode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v26, v27);

  v28 = (*(_WORD *)&self->_configurationFlags >> 11) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v28, v29);

  v30 = (*(_WORD *)&self->_configurationFlags >> 12) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColorTransformerIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v30, v31);

  v32 = (*(_WORD *)&self->_configurationFlags >> 13) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeWidth"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v32, v33);

  v34 = (*(_WORD *)&self->_configurationFlags >> 14) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeOutset"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v34, v35);

  LODWORD(v34) = self->_configurationFlags;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maskedCorners"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "encodeBool:forKey:", v34 >> 15, v36);

}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t cornerRadius;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[UIView hash](self->_customView, "hash");
  cornerRadius = (unint64_t)self->_cornerRadius;
  v5 = v3 ^ -[UIColor hash](self->_backgroundColor, "hash");
  v6 = v5 ^ -[UIVisualEffect hash](self->_visualEffect, "hash");
  v7 = v6 ^ -[UIImage hash](self->_image, "hash");
  return v7 ^ -[UIColor hash](self->_strokeColor, "hash") ^ cornerRadius ^ (unint64_t)self->_strokeWidth;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat top;
  double leading;
  double bottom;
  double trailing;
  void *v12;
  void *v13;
  void *v14;
  unint64_t edgesAddingLayoutMarginsToBackgroundInsets;
  void *v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t backgroundColorTransformerIdentifier;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t strokeColorTransformerIdentifier;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  _UIBackgroundConfigurationStyleToString(self->_defaultStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Base Style = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (self->_cornerRadius > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cornerRadius = %g"), *(_QWORD *)&self->_cornerRadius);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  top = self->_backgroundInsets.top;
  leading = self->_backgroundInsets.leading;
  bottom = self->_backgroundInsets.bottom;
  trailing = self->_backgroundInsets.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("backgroundInsets = %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  edgesAddingLayoutMarginsToBackgroundInsets = self->_edgesAddingLayoutMarginsToBackgroundInsets;
  if (edgesAddingLayoutMarginsToBackgroundInsets)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    if (edgesAddingLayoutMarginsToBackgroundInsets == 15)
    {
      v17 = CFSTR("All");
LABEL_17:
      objc_msgSend(v16, "stringWithFormat:", CFSTR("edgesAddingLayoutMarginsToBackgroundInsets = %@"), v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v22);

      goto LABEL_18;
    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = v18;
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 1) != 0)
    {
      objc_msgSend(v18, "addObject:", CFSTR("Top"));
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
      {
LABEL_13:
        if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0)
          goto LABEL_14;
        goto LABEL_46;
      }
    }
    else if ((edgesAddingLayoutMarginsToBackgroundInsets & 2) == 0)
    {
      goto LABEL_13;
    }
    objc_msgSend(v19, "addObject:", CFSTR("Leading"));
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 4) == 0)
    {
LABEL_14:
      if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0)
      {
LABEL_16:
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("[%@]"), v21);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
LABEL_15:
      objc_msgSend(v19, "addObject:", CFSTR("Trailing"));
      goto LABEL_16;
    }
LABEL_46:
    objc_msgSend(v19, "addObject:", CFSTR("Bottom"));
    if ((edgesAddingLayoutMarginsToBackgroundInsets & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_18:
  if (-[UIBackgroundConfiguration _hasBackgroundColor](self, "_hasBackgroundColor"))
  {
    if (self->_backgroundColor)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backgroundColor = %@"), self->_backgroundColor);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v23);

    }
    else
    {
      objc_msgSend(v3, "addObject:", CFSTR("backgroundColor = Inherited Tint Color"));
    }
    backgroundColorTransformerIdentifier = self->_backgroundColorTransformerIdentifier;
    if (backgroundColorTransformerIdentifier)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      _UIConfigurationColorTransformerIdentifierToString(backgroundColorTransformerIdentifier);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("backgroundColorTransformer = %@"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v27);

    }
  }
  if (self->_visualEffect)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("visualEffect = %@"), self->_visualEffect);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

  }
  if (self->_image)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("image = %@"), self->_image);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

    v30 = (void *)MEMORY[0x1E0CB3940];
    _UIViewContentModeToString(self->_imageContentMode);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("imageContentMode = %@"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v32);

  }
  if (-[UIBackgroundConfiguration _hasStroke](self, "_hasStroke"))
  {
    if (self->_strokeColor)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeColor = %@"), self->_strokeColor);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v33);

    }
    else
    {
      objc_msgSend(v3, "addObject:", CFSTR("strokeColor = Inherited Tint Color"));
    }
    strokeColorTransformerIdentifier = self->_strokeColorTransformerIdentifier;
    if (strokeColorTransformerIdentifier)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      _UIConfigurationColorTransformerIdentifierToString(strokeColorTransformerIdentifier);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("strokeColorTransformer = %@"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v37);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeWidth = %g"), *(_QWORD *)&self->_strokeWidth);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v38);

    if (self->_strokeOutset > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeOutset = %g"), *(_QWORD *)&self->_strokeOutset);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v39);

    }
  }
  if (self->_shadowProperties)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shadowProperties = %@"), self->_shadowProperties);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v40);

  }
  if (self->_customView)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("customView = %@"), self->_customView);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v41);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = CFSTR("empty configuration");
  }
  v43 = (void *)MEMORY[0x1E0CB3940];
  v44 = (objc_class *)objc_opt_class();
  NSStringFromClass(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v45, self, v42);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v46;
}

- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)backgroundInsets
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_backgroundInsets = backgroundInsets;
}

- (void)setEdgesAddingLayoutMarginsToBackgroundInsets:(NSDirectionalRectEdge)edgesAddingLayoutMarginsToBackgroundInsets
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_edgesAddingLayoutMarginsToBackgroundInsets = edgesAddingLayoutMarginsToBackgroundInsets;
}

- (void)setBackgroundColorTransformer:(UIConfigurationColorTransformer)backgroundColorTransformer
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  -[UIBackgroundConfiguration _setBackgroundColorTransformer:]((uint64_t)self, backgroundColorTransformer);
}

- (UIConfigurationColorTransformer)backgroundColorTransformer
{
  return _Block_copy(self->_backgroundColorTransformer);
}

- (void)_setVisualEffectGroupName:(id)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  -[UIBackgroundConfiguration __setVisualEffectGroupName:](self, "__setVisualEffectGroupName:", a3);
}

- (NSString)_visualEffectGroupName
{
  return self->_visualEffectGroupName;
}

- (void)_setVisualEffectAllowsTransparentBlurring:(BOOL)a3
{
  -[UIBackgroundConfiguration _setVisualEffectblurClippingMode:](self, "_setVisualEffectblurClippingMode:", !a3);
}

- (BOOL)_visualEffectAllowsTransparentBlurring
{
  return -[UIBackgroundConfiguration _visualEffectblurClippingMode](self, "_visualEffectblurClippingMode") == 0;
}

- (void)_setVisualEffectblurClippingMode:(unint64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x100u;
  -[UIBackgroundConfiguration __setVisualEffectblurClippingMode:](self, "__setVisualEffectblurClippingMode:", a3);
}

- (unint64_t)_visualEffectblurClippingMode
{
  return self->_visualEffectblurClippingMode;
}

- (void)setImage:(UIImage *)image
{
  *(_WORD *)&self->_configurationFlags |= 0x200u;
  -[UIBackgroundConfiguration _setImage:]((uint64_t)self, image);
}

- (void)setImageContentMode:(UIViewContentMode)imageContentMode
{
  *(_WORD *)&self->_configurationFlags |= 0x400u;
  self->_imageContentMode = imageContentMode;
}

- (UIViewContentMode)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setStrokeColorTransformer:(UIConfigurationColorTransformer)strokeColorTransformer
{
  *(_WORD *)&self->_configurationFlags |= 0x1000u;
  -[UIBackgroundConfiguration _setStrokeColorTransformer:]((uint64_t)self, strokeColorTransformer);
}

- (UIConfigurationColorTransformer)strokeColorTransformer
{
  return _Block_copy(self->_strokeColorTransformer);
}

- (void)setStrokeOutset:(CGFloat)strokeOutset
{
  *(_WORD *)&self->_configurationFlags |= 0x4000u;
  self->_strokeOutset = strokeOutset;
}

- (void)_setMaskedCorners:(unint64_t)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x8000u;
  -[UIBackgroundConfiguration __setMaskedCorners:](self, "__setMaskedCorners:", a3);
}

- (unint64_t)_maskedCorners
{
  return self->_maskedCorners;
}

- (BOOL)isTintBackgroundColor
{
  return self->_backgroundColor == 0;
}

- (UIColor)resolvedStrokeColorForTintColor:(UIColor *)tintColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *strokeColor;
  UIColor *v7;
  void (**strokeColorTransformer)(id, id);
  UIColor *v9;
  UIColor *v10;

  v4 = tintColor;
  v5 = v4;
  strokeColor = self->_strokeColor;
  if (!strokeColor)
    strokeColor = v4;
  v7 = strokeColor;
  strokeColorTransformer = (void (**)(id, id))self->_strokeColorTransformer;
  if (strokeColorTransformer)
  {
    strokeColorTransformer[2](strokeColorTransformer, v7);
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (UIShadowProperties)shadowProperties
{
  UIShadowProperties *shadowProperties;
  UIShadowProperties *v4;
  UIShadowProperties *v5;

  shadowProperties = self->_shadowProperties;
  if (!shadowProperties)
  {
    v4 = objc_alloc_init(UIShadowProperties);
    v5 = self->_shadowProperties;
    self->_shadowProperties = v4;

    shadowProperties = self->_shadowProperties;
  }
  return shadowProperties;
}

- (UIShadowProperties)_shadowProperties
{
  return self->_shadowProperties;
}

- (void)_setShadowProperties:(id)a3
{
  objc_storeStrong((id *)&self->_shadowProperties, a3);
}

- (unint64_t)__visualEffectblurClippingMode
{
  return self->_visualEffectblurClippingMode;
}

- (void)__setVisualEffectblurClippingMode:(unint64_t)a3
{
  self->_visualEffectblurClippingMode = a3;
}

@end
