@implementation NCBadgedIconView

- (NCBadgedIconView)initWithProminentIcons:(id)a3 subordinateIcons:(id)a4 badgeText:(id)a5 compatibleWithInitialTraitCollection:(id)a6
{
  void *v6;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  SBHIconImageStyleConfiguration *v15;
  SBHIconImageStyleConfiguration *iconImageStyleConfiguration;
  void *v17;
  void *v18;
  id *p_prominentLightIcon;
  char v20;
  void *v21;
  void *v22;
  id *v23;
  id *v24;
  char v25;
  id *v26;
  id *v27;
  NCBadgedIconView *v28;
  NCBadgedIconView *v29;
  void *v30;
  NCProminentIcon *prominentIcon;
  uint64_t v32;
  NCProminentIcon *v33;
  NCProminentIcon *v34;
  NCProminentIcon *v35;
  NCProminentIcon *v36;
  uint64_t v37;
  NCProminentIcon *v38;
  NCProminentIcon *v39;
  NCProminentIcon *v40;
  id v41;
  NCProminentIcon *prominentDarkIcon;
  uint64_t v43;
  NCProminentIcon *v44;
  uint64_t v45;
  NCProminentIcon *v46;
  NCProminentIcon *v47;
  NCBadgedIconView *v48;
  NCProminentIcon *v49;
  UIImage *subordinateLightIcon;
  UIImage *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  SBIconBadgeView *iconBadgeView;
  void *v58;
  id v59;
  id v60;
  objc_super v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v60 = a5;
  v13 = a6;
  self->_userInterfaceStyle = 1;
  if (-[SBHIconImageStyleConfiguration configurationType](self->_iconImageStyleConfiguration, "configurationType") == 3)
  {
    v14 = 2;
  }
  else
  {
    if (-[SBHIconImageStyleConfiguration configurationType](self->_iconImageStyleConfiguration, "configurationType"))
      goto LABEL_6;
    v14 = objc_msgSend(v13, "userInterfaceStyle");
  }
  self->_userInterfaceStyle = v14;
LABEL_6:
  v58 = v13;
  objc_msgSend(v13, "sbh_iconImageStyleConfiguration");
  v15 = (SBHIconImageStyleConfiguration *)objc_claimAutoreleasedReturnValue();
  iconImageStyleConfiguration = self->_iconImageStyleConfiguration;
  self->_iconImageStyleConfiguration = v15;

  objc_msgSend(v11, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v6)
      v18 = 0;
    else
      v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  p_prominentLightIcon = (id *)&self->_prominentLightIcon;
  objc_storeStrong((id *)&self->_prominentLightIcon, v18);
  if (v17)

  if ((unint64_t)objc_msgSend(v11, "count") <= 1)
  {

    v21 = 0;
    v22 = 0;
    v20 = 1;
  }
  else
  {
    v20 = 1;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      if (v21 == v17)
        v22 = 0;
      else
        v22 = v21;
    }
    else
    {
      v22 = 0;
    }
  }
  objc_storeStrong((id *)&self->_prominentDarkIcon, v22);
  if ((v20 & 1) == 0)

  objc_storeStrong((id *)&self->_prominentIcon, *p_prominentLightIcon);
  objc_msgSend(v12, "firstObject");
  v23 = (id *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    p_prominentLightIcon = (id *)objc_claimAutoreleasedReturnValue();
    if (v23 == p_prominentLightIcon)
      v24 = 0;
    else
      v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  objc_storeStrong((id *)&self->_subordinateLightIcon, v24);
  if (v23)

  v59 = v11;
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {

    v26 = 0;
    v27 = 0;
    v25 = 1;
  }
  else
  {
    v25 = 1;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v26 = (id *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (id *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      if (v26 == v23)
        v27 = 0;
      else
        v27 = v26;
    }
    else
    {
      v27 = 0;
    }
  }
  objc_storeStrong((id *)&self->_subordinateDarkIcon, v27);
  if ((v25 & 1) == 0)

  objc_storeStrong((id *)&self->_subordinateIcon, self->_subordinateLightIcon);
  if (self->_prominentIcon || self->_subordinateIcon)
  {
    v61.receiver = self;
    v61.super_class = (Class)NCBadgedIconView;
    v28 = -[NCBadgedIconView init](&v61, sel_init);
    v29 = v28;
    v30 = v59;
    if (v28)
    {
      prominentIcon = v28->_prominentIcon;
      v32 = objc_opt_class();
      v33 = prominentIcon;
      if (v32)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v34 = v33;
        else
          v34 = 0;
      }
      else
      {
        v34 = 0;
      }
      v35 = v34;

      v36 = v29->_prominentIcon;
      v37 = objc_opt_class();
      v38 = v36;
      if (v37)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v39 = v38;
        else
          v39 = 0;
      }
      else
      {
        v39 = 0;
      }
      v40 = v39;

      if (v35)
      {
        -[NCBadgedIconView setIconView:](v29, "setIconView:", v35);
      }
      else if (v40)
      {
        v41 = objc_alloc_init(MEMORY[0x1E0DC3890]);
        objc_msgSend(v41, "setContentMode:", 1);
        if (v29->_userInterfaceStyle == 2)
        {
          prominentDarkIcon = v29->_prominentDarkIcon;
          if (prominentDarkIcon)
          {
            v43 = objc_opt_class();
            v44 = prominentDarkIcon;
            v45 = v43;
            v46 = v44;
            if (v45)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v47 = v46;
              else
                v47 = 0;
            }
            else
            {
              v47 = 0;
            }
            v49 = v47;

            v40 = v49;
          }
        }
        objc_msgSend(v41, "setImage:", v40);
        -[NCBadgedIconView setIconView:](v29, "setIconView:", v41);

      }
      if (v12)
      {
        if (v29->_userInterfaceStyle != 2 || (subordinateLightIcon = v29->_subordinateDarkIcon) == 0)
          subordinateLightIcon = v29->_subordinateLightIcon;
        v51 = subordinateLightIcon;
        +[NCBadgedIconView brandingBadgeWithImage:](NCBadgedIconView, "brandingBadgeWithImage:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setContentMode:", 1);
        objc_msgSend(v52, "nc_setPlatterSubordinateIconShadowEnabled:", 1);
        v62[0] = v52;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCBadgedIconView setBadgeViews:](v29, "setBadgeViews:", v53);

        v30 = v59;
      }
      if (objc_msgSend(v60, "length"))
      {
        v54 = (void *)objc_opt_new();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v54, "setStyle:", 1);
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setOverrideFont:", v55);

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v54, "setOverridePaddingFactor:", 22.0);
        objc_msgSend(v54, "setOverrideText:", v60);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v54, "updateShadowWithRadius:alpha:imageOutset:", 2.0, 0.25, 2.0);
        -[NCBadgedIconView addSubview:](v29, "addSubview:", v54);
        iconBadgeView = v29->_iconBadgeView;
        v29->_iconBadgeView = (SBIconBadgeView *)v54;

      }
    }
    self = v29;
    v48 = self;
  }
  else
  {
    v48 = 0;
    v30 = v59;
  }

  return v48;
}

- (BOOL)isEqual:(id)a3
{
  NCBadgedIconView *v4;
  NCBadgedIconView *v5;
  NCBadgedIconView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;

  v4 = (NCBadgedIconView *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        NSLog(CFSTR("something seriously wrong"));
      -[NCBadgedIconView _prominentImageView](self, "_prominentImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCBadgedIconView _prominentImageView](v6, "_prominentImageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[NCBadgedIconView _prominentNonImageView](self, "_prominentNonImageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCBadgedIconView _prominentNonImageView](v6, "_prominentNonImageView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects() && BSEqualArrays())
        {
          -[NCBadgedIconView iconBadgeView](self, "iconBadgeView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "overrideText");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCBadgedIconView iconBadgeView](v6, "iconBadgeView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "overrideText");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = BSEqualStrings();

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

+ (id)brandingBadgeWithImage:(id)a3
{
  id v3;
  NCImageBrandingBadge *v4;

  v3 = a3;
  v4 = -[NCImageBrandingBadge initWithImage:]([NCImageBrandingBadge alloc], "initWithImage:", v3);

  return v4;
}

- (void)setIconView:(id)a3
{
  UIView **p_iconView;
  id v6;

  p_iconView = &self->_iconView;
  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[UIView removeFromSuperview](*p_iconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_iconView, a3);
    -[NCBadgedIconView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_iconView, 0);
    -[NCBadgedIconView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBadgeViews:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    v6 = self->_badgeViews;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "setBadgedIconView:", 0);
          objc_msgSend(v11, "removeFromSuperview");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
          objc_msgSend(v17, "setBadgedIconView:", self, (_QWORD)v18);
          -[NCBadgedIconView addSubview:](self, "addSubview:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_badgeViews, a3);
    -[NCBadgedIconView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setShadowEnabled:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    -[NCBadgedIconView _prominentImageView](self, "_prominentImageView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSymbolImage");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v9, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCBadgedIconView traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mt_imageWithDefaultShadowAttributesForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v8);

    }
  }
}

- (BOOL)isFeaturingSymbol
{
  void *v2;
  void *v3;
  char v4;

  -[NCBadgedIconView _prominentImageView](self, "_prominentImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSymbolImage");

  return v4;
}

- (UIColor)dominantColor
{
  void *v2;
  void *v3;
  void *v4;

  -[NCBadgedIconView _prominentImageView](self, "_prominentImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _NCDominantColorForImage(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UIColor *)v4;
}

- (void)updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:(int64_t)a3 visualStylingProvider:(id)a4 outgoingProvider:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  -[NCBadgedIconView _prominentImageView](self, "_prominentImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (-[NCBadgedIconView isFeaturingSymbol](self, "isFeaturingSymbol"))
      v10 = v12;
    else
      v10 = 0;
    -[NCBadgedIconView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v9, a3, v10, v8);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v11);

  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[9];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCBadgedIconView;
  -[NCBadgedIconView layoutSubviews](&v8, sel_layoutSubviews);
  -[NCBadgedIconView bounds](self, "bounds");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__NCBadgedIconView_layoutSubviews__block_invoke;
  v7[3] = &unk_1E8D1BD70;
  v7[4] = self;
  v7[5] = v3;
  v7[6] = v4;
  v7[7] = v5;
  v7[8] = v6;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
}

uint64_t __34__NCBadgedIconView_layoutSubviews__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 504);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_frameForBadgeView:inBounds:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), (_QWORD)v10);
        objc_msgSend(v7, "setFrame:");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateVisibleIcons");
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
  objc_msgSend(v8, "intrinsicContentSize");
  objc_msgSend(*(id *)(a1 + 32), "_shouldReverseLayoutDirection");
  SBIconBadgeViewCalculateAccessoryCenter();
  return objc_msgSend(v8, "setCenter:");
}

- (NSArray)requiredVisualStyleCategories
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_badgeViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "requiredVisualStyleCategories", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[NCBadgedIconView _prominentImageView](self, "_prominentImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "addObject:", &unk_1E8D5FA70);
  objc_msgSend(v3, "allObjects", (_QWORD)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NCBadgedIconView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_badgeViews;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "setVisualStylingProvider:forCategory:", v6, a4, (_QWORD)v18);
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  -[NCBadgedIconView _prominentImageView](self, "_prominentImageView", (_QWORD)v18);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (a4 == 1 && v16 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setVisualStylingProvider:forCategory:", v6, 1);

}

- (id)copyWithBadgeText:(id)a3
{
  void *v4;
  NCProminentIcon *prominentLightIcon;
  NCProminentIcon *v6;
  NCProminentIcon *v7;
  void *v8;
  NCProminentIcon *prominentDarkIcon;
  NCProminentIcon *v10;
  NCProminentIcon *v11;
  UIImage *v12;
  UIImage *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[NCBadgedIconView _prominentNonImageView](self, "_prominentNonImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  prominentLightIcon = self->_prominentLightIcon;
  if (v4)
    v6 = (NCProminentIcon *)-[NCProminentIcon copy](prominentLightIcon, "copy");
  else
    v6 = prominentLightIcon;
  v7 = v6;

  -[NCBadgedIconView _prominentNonImageView](self, "_prominentNonImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  prominentDarkIcon = self->_prominentDarkIcon;
  if (v8)
    v10 = (NCProminentIcon *)-[NCProminentIcon copy](prominentDarkIcon, "copy");
  else
    v10 = prominentDarkIcon;
  v11 = v10;

  v12 = self->_subordinateLightIcon;
  v13 = self->_subordinateDarkIcon;
  if (v7)
  {
    if (v11)
    {
      v38[0] = v7;
      v38[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }
  if (v12)
  {
    v36[0] = v12;
    v16 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)

  }
  else
  {
    v17 = 0;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__11;
  v34 = __Block_byref_object_dispose__11;
  v35 = 0;
  v18 = (void *)MEMORY[0x1E0DC3F10];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __38__NCBadgedIconView_copyWithBadgeText___block_invoke;
  v25[3] = &unk_1E8D1E210;
  v29 = &v30;
  v25[4] = self;
  v19 = v14;
  v26 = v19;
  v20 = v17;
  v27 = v20;
  v21 = v24;
  v28 = v21;
  objc_msgSend(v18, "performWithoutAnimation:", v25);
  v22 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v22;
}

unint64_t __38__NCBadgedIconView_copyWithBadgeText___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t result;
  unint64_t i;
  void *v13;
  void *v14;

  v2 = objc_alloc((Class)objc_opt_class());
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "initWithProminentIcons:subordinateIcons:badgeText:compatibleWithInitialTraitCollection:", v5, v3, v4, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 496), "setFrame:");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 504), "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      objc_msgSend(v13, "setFrame:");

      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "count");
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBIconBadgeView overrideText](self->_iconBadgeView, "overrideText", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = -[NCBadgedIconView copyWithBadgeText:](self, "copyWithBadgeText:", v5);
  return v6;
}

+ (unint64_t)_defaultDirectionForBadgeType:(int64_t)a3
{
  if (a3)
    return 12;
  else
    return 9;
}

- (CGRect)_frameForIndicatorBadgeOfSize:(CGSize)a3 cornerRadius:(double)a4 withLocation:(unint64_t)a5 inBounds:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  unsigned int v9;
  double v11;
  int v12;
  double v13;
  float v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  char v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat rect;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  rect = a6.origin.x;
  v9 = a5;
  v11 = a3.height;
  v12 = -[NCBadgedIconView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v13 = v11 * 0.5;
  if (a4 > 0.0)
  {
    v14 = a4;
    v13 = v13 - (sqrtf((float)(v14 * v14) + (float)(v14 * v14)) - a4);
  }
  BSRectWithSize();
  v16 = v15;
  v32 = v17;
  v19 = v18;
  v21 = v20;
  v22 = v12 ^ 1;
  if (((v12 ^ 1) & (v9 >> 3) & 1) == 0)
  {
    if ((v9 & 2) == 0)
      v22 = 1;
    if ((v22 & 1) != 0)
    {
      v38.origin.x = rect;
      v23 = y;
      v38.origin.y = y;
      v24 = width;
      v38.size.width = width;
      v25 = height;
      v38.size.height = height;
      v27 = CGRectGetMinX(v38) - v13;
      if ((v9 & 1) == 0)
        goto LABEL_8;
LABEL_10:
      v39.origin.x = rect;
      v39.origin.y = v23;
      v39.size.width = v24;
      v39.size.height = v25;
      CGRectGetMinY(v39);
      goto LABEL_11;
    }
  }
  v34.origin.x = rect;
  v23 = y;
  v34.origin.y = y;
  v24 = width;
  v34.size.width = width;
  v25 = height;
  v34.size.height = height;
  v26 = v13 + CGRectGetMaxX(v34);
  v35.origin.x = v16;
  v35.origin.y = v32;
  v35.size.width = v19;
  v35.size.height = v21;
  v27 = v26 - CGRectGetWidth(v35);
  if ((v9 & 1) != 0)
    goto LABEL_10;
LABEL_8:
  v36.origin.x = rect;
  v36.origin.y = v23;
  v36.size.width = v24;
  v36.size.height = v25;
  CGRectGetMaxY(v36);
  v37.origin.x = v27;
  v37.origin.y = v32;
  v37.size.width = v19;
  v37.size.height = v21;
  CGRectGetHeight(v37);
LABEL_11:
  UIRectIntegralWithScale();
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_frameForIndicatorBadgeView:(id)a3 inBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "sizeThatFits:", width, height);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cornerRadius");
  v16 = v15 * 0.654165563;
  v17 = objc_msgSend(v9, "badgeLocation");

  -[NCBadgedIconView _frameForIndicatorBadgeOfSize:cornerRadius:withLocation:inBounds:](self, "_frameForIndicatorBadgeOfSize:cornerRadius:withLocation:inBounds:", v17, v11, v13, v16, x, y, width, height);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)_frameForBrandingBadgeOfSize:(CGSize)a3 withLocation:(unint64_t)a4 inBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char v9;
  int v10;
  char v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v10 = -[NCBadgedIconView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  BSRectWithSize();
  if ((v9 & 8) != 0 && !v10)
    goto LABEL_6;
  v11 = v10 ^ 1;
  if ((v9 & 2) == 0)
    v11 = 1;
  if ((v11 & 1) != 0)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    CGRectGetMaxX(v21);
  }
  else
  {
LABEL_6:
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    CGRectGetMinX(v20);
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  if ((v9 & 4) != 0)
    CGRectGetMinY(*(CGRect *)&v12);
  else
    CGRectGetMaxY(*(CGRect *)&v12);
  UIRectIntegralWithScale();
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_frameForBrandingBadgeView:(id)a3 inBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[NCBadgedIconView _frameForBrandingBadgeOfSize:withLocation:inBounds:](self, "_frameForBrandingBadgeOfSize:withLocation:inBounds:", objc_msgSend(a3, "badgeLocation"), 16.0, 16.0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_frameForBadgeView:(id)a3 inBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void (**badgeLayoutBlock)(id, id, double, double, double, double);
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  badgeLayoutBlock = (void (**)(id, id, double, double, double, double))self->_badgeLayoutBlock;
  if (badgeLayoutBlock)
  {
    badgeLayoutBlock[2](badgeLayoutBlock, v9, x, y, width, height);
  }
  else if (objc_msgSend(v9, "badgeType"))
  {
    -[NCBadgedIconView _frameForBrandingBadgeView:inBounds:](self, "_frameForBrandingBadgeView:inBounds:", v9, x, y, width, height);
  }
  else
  {
    -[NCBadgedIconView _frameForIndicatorBadgeView:inBounds:](self, "_frameForIndicatorBadgeView:inBounds:", v9, x, y, width, height);
  }
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;

  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_updateVisibleIcons
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  NCProminentIcon *prominentIcon;
  uint64_t v8;
  NCProminentIcon *v9;
  NCProminentIcon *v10;
  NCProminentIcon *v11;
  UIView *iconView;
  uint64_t v13;
  UIView *v14;
  UIView *v15;
  NCProminentIcon *v16;
  UIView *v17;
  NCProminentIcon *prominentLightIcon;
  uint64_t v19;
  NCProminentIcon *v20;
  NCProminentIcon *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  UIImage *subordinateLightIcon;
  uint64_t v28;
  UIImage *v29;
  UIImage *v30;
  UIImage *v31;
  void *v32;
  void *v33;
  UIImage *subordinateIcon;
  UIImage *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[NCBadgedIconView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[NCBadgedIconView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sbh_iconImageStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "configurationType") == 3)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v6, "configurationType") == 2 || objc_msgSend(v6, "configurationType") == 4)
  {
    v4 = 1;
  }
  if (self->_userInterfaceStyle != v4)
    self->_userInterfaceStyle = v4;
  objc_storeStrong((id *)&self->_iconImageStyleConfiguration, v6);
  prominentIcon = self->_prominentIcon;
  v8 = objc_opt_class();
  v9 = prominentIcon;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (v11)
  {
    iconView = self->_iconView;
    v13 = objc_opt_class();
    v14 = iconView;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v17 = v15;

    if (self->_userInterfaceStyle != 2 || (prominentLightIcon = self->_prominentDarkIcon) == 0)
      prominentLightIcon = self->_prominentLightIcon;
    v19 = objc_opt_class();
    v20 = prominentLightIcon;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v16 = v21;

    -[UIView setImage:](v17, "setImage:", v16);
    objc_storeStrong((id *)&self->_prominentIcon, v16);

  }
  else
  {
    v16 = 0;
  }
  -[NSArray firstObject](self->_badgeViews, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_class();
  v24 = v22;
  if (v23)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;

  if (v26)
  {
    if (self->_userInterfaceStyle != 2 || (subordinateLightIcon = self->_subordinateDarkIcon) == 0)
      subordinateLightIcon = self->_subordinateLightIcon;
    v28 = objc_opt_class();
    v29 = subordinateLightIcon;
    if (v28)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
    }
    else
    {
      v30 = 0;
    }
    v31 = v30;

    +[NCBadgedIconView brandingBadgeWithImage:](NCBadgedIconView, "brandingBadgeWithImage:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setContentMode:", 1);
    objc_msgSend(v32, "nc_setPlatterSubordinateIconShadowEnabled:", 1);
    v36[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCBadgedIconView setBadgeViews:](self, "setBadgeViews:", v33);

    subordinateIcon = self->_subordinateIcon;
    self->_subordinateIcon = v31;
    v35 = v31;

  }
}

- (id)_prominentImageView
{
  UIView *iconView;
  uint64_t v3;
  UIView *v4;
  UIView *v5;
  UIView *v6;

  iconView = self->_iconView;
  v3 = objc_opt_class();
  v4 = iconView;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)_prominentNonImageView
{
  void *v3;
  UIView *iconView;
  UIView *v5;

  -[NCBadgedIconView _prominentImageView](self, "_prominentImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    iconView = 0;
  else
    iconView = self->_iconView;
  v5 = iconView;

  return v5;
}

- (id)badgeLayoutBlock
{
  return self->_badgeLayoutBlock;
}

- (void)setBadgeLayoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (BOOL)isShadowEnabled
{
  return self->_shadowEnabled;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (NSArray)badgeViews
{
  return self->_badgeViews;
}

- (SBIconBadgeView)iconBadgeView
{
  return self->_iconBadgeView;
}

- (void)setIconBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_iconBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconBadgeView, 0);
  objc_storeStrong((id *)&self->_badgeViews, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong(&self->_badgeLayoutBlock, 0);
  objc_storeStrong((id *)&self->_iconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_subordinateDarkIcon, 0);
  objc_storeStrong((id *)&self->_subordinateLightIcon, 0);
  objc_storeStrong((id *)&self->_subordinateIcon, 0);
  objc_storeStrong((id *)&self->_prominentDarkIcon, 0);
  objc_storeStrong((id *)&self->_prominentLightIcon, 0);
  objc_storeStrong((id *)&self->_prominentIcon, 0);
}

@end
