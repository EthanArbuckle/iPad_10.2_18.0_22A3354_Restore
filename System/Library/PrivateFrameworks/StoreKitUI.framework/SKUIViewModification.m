@implementation SKUIViewModification

- (SKUIViewModification)initWithViewReusePool:(id)a3
{
  id v5;
  SKUIViewModification *v6;
  SKUIViewModification *v7;
  NSMutableArray *v8;
  NSMutableArray *views;
  objc_super v11;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIViewModification initWithViewReusePool:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIViewModification;
  v6 = -[SKUIViewModification init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewPool, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    views = v7->_views;
    v7->_views = v8;

  }
  return v7;
}

- (id)addReusableViewWithReuseIdentifier:(id)a3
{
  void *v4;

  -[SKUIViewReusePool dequeueReusableViewWithReuseIdentifier:](self->_viewPool, "dequeueReusableViewWithReuseIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray addObject:](self->_views, "addObject:", v4);
  return v4;
}

- (void)addView:(id)a3
{
  -[NSMutableArray addObject:](self->_views, "addObject:", a3);
}

- (void)setTextProperties:(id)a3 forView:(id)a4
{
  id v6;
  NSMapTable *v7;
  NSMapTable *allViewTextProperties;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_allViewTextProperties)
  {
    v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
    allViewTextProperties = self->_allViewTextProperties;
    self->_allViewTextProperties = v7;

  }
  v9 = self->_allViewTextProperties;
  if (v10)
    -[NSMapTable setObject:forKey:](v9, "setObject:forKey:", v10, v6);
  else
    -[NSMapTable removeObjectForKey:](v9, "removeObjectForKey:", v6);

}

- (NSMapTable)allViewTextProperties
{
  return self->_allViewTextProperties;
}

- (NSArray)views
{
  return &self->_views->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allViewTextProperties, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_viewPool, 0);
}

- (id)addBadgeViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addBadgeViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  if (objc_msgSend(v8, "badgeType") != 1)
  {
    objc_msgSend(v8, "resourceName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    if (v24)
    {
      SKUIImageWithResourceName(v24);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "URL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v9, "requestIdentifierForViewElement:", v8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v9, "resourceLoader");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cachedResourceForRequestIdentifier:", objc_msgSend(v27, "unsignedIntegerValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19
            && (objc_msgSend(v28, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v27, "unsignedIntegerValue")) & 1) == 0)
          {
            objc_msgSend(v9, "loadTemplatedImageForBadgeElement:reason:", v8, 1);
          }

        }
        else
        {
          objc_msgSend(v9, "loadTemplatedImageForBadgeElement:reason:", v8, 1);
          v19 = 0;
        }

        goto LABEL_19;
      }
      objc_msgSend(v8, "fallbackImage");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v25;
LABEL_19:
    -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6CF0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityLabel:", v29);

    objc_msgSend(v20, "setImage:", v19);
    objc_msgSend(v8, "size");
    objc_msgSend(v20, "setImageSize:");
    objc_msgSend(v8, "style");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementPlainColorWithStyle(v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v31);

    objc_msgSend(v20, "setUserInteractionEnabled:", 0);
    goto LABEL_20;
  }
  objc_msgSend(v9, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIViewModification _attributedStringViewForLayout:](self, "_attributedStringViewForLayout:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLayout:", v19);
  objc_msgSend(v20, "setStringTreatment:", 1);
  objc_msgSend(v8, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ikBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "color");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTreatmentColor:", v23);

LABEL_20:
  return v20;
}

- (id)addBarRatingWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;

  v7 = a5;
  v8 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIViewModification(SKUIViewElementView) addBarRatingWithElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6BB0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratingValue");
  objc_msgSend(v17, "setRatingValue:");
  objc_msgSend(v8, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "setTintColor:", v20);
  objc_msgSend(v7, "clientContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = SKUIUserInterfaceIdiom(v21) != 1;

  objc_msgSend(v17, "setBarRatingStyle:", v22);
  return v17;
}

- (id)addButtonWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  SKUIButtonBorderStyle *v26;
  void *v27;
  SKUIButtonBorderStyle *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  BOOL v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  void *v75;
  void *v76;
  uint64_t v77;
  _BOOL8 v78;
  void *v79;
  void *v80;
  void *v81;
  int64_t v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  SKUIButtonBorderStyle *v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addButtonWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = objc_msgSend(v8, "buttonViewType");
  switch(v18)
  {
    case 0:
    case 8:
    case 10:
    case 11:
    case 13:
      v19 = objc_msgSend(v8, "buttonViewSubType");
      if (v19 == 1)
      {
        -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6ED0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "nonToggledText");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setNonToggledTitle:", v21);

        objc_msgSend(v8, "toggledText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setToggledTitle:", v22);

        v23 = v20;
        v24 = v23;
      }
      else
      {
        -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6BD0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
      }
      if (v18 == 13)
        v25 = 7;
      else
        v25 = 0;
      objc_msgSend(v24, "setButtonType:", v25);
      v26 = [SKUIButtonBorderStyle alloc];
      objc_msgSend(v8, "style");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[SKUIButtonBorderStyle initWithElementStyle:](v26, "initWithElementStyle:", v27);

      objc_msgSend(v24, "setBorderStyle:", v28);
      objc_msgSend(v9, "labelLayoutCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTitleLayout:", v30);

      v31 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v24, "setEnabled:", v31);
      v32 = 0.4;
      if ((_DWORD)v31)
        v32 = 1.0;
      objc_msgSend(v24, "setAlpha:", v32);
      if (v19 == 1)
      {
        objc_msgSend(v8, "toggleItemIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "length"))
        {
          +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setToggleItemIdentifier:", v33);
          objc_msgSend(v34, "itemForIdentifier:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (!v35 || (objc_msgSend(v35, "toggled") & 0x80000000) != 0)
            v37 = objc_msgSend(v8, "isToggled");
          else
            v37 = objc_msgSend(v36, "toggled") == 1;
          objc_msgSend(v23, "setToggled:animated:", v37, 0);

        }
        else
        {
          objc_msgSend(v23, "setToggled:animated:", objc_msgSend(v8, "isToggled"), 0);
        }

      }
      v38 = v24;
      goto LABEL_52;
    case 1:
    case 7:
      -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6BD0);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setBorderStyle:", 0);
      if (v18 == 1)
        v39 = 3;
      else
        v39 = 4;
      objc_msgSend(v38, "setButtonType:", v39);
      objc_msgSend(v9, "labelLayoutCache");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTitleLayout:", v41);

      v42 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v38, "setEnabled:", v42);
      v43 = 0.4;
      if ((_DWORD)v42)
        v43 = 1.0;
      objc_msgSend(v38, "setAlpha:", v43);
      break;
    case 2:
    case 3:
      -[SKUIViewModification _itemStateForButton:](self, "_itemStateForButton:", v8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6D30);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setElement:", v8);
      goto LABEL_28;
    case 4:
      -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6D30);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIViewModification _itemStateForButton:](self, "_itemStateForButton:", v8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
      objc_msgSend(v8, "buyButtonDescriptor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientContext");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v45, v44, v46, 0);

      -[SKUIViewModification _styleItemOfferButton:forElement:context:](self, "_styleItemOfferButton:forElement:context:", v38, v8, v9);
      break;
    case 5:
      -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6C90);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "imageView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "additionalImageView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buttonImage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      __RequestImage(v49, v9);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setContents:");
      objc_msgSend(v9, "sizeForImageElement:", v49);
      v122 = v47;
      objc_msgSend(v47, "setImageSize:");
      objc_msgSend(v8, "additionalButtonImage");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      __RequestImage(v50, v9);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setContents:", v51);
      objc_msgSend(v9, "sizeForImageElement:", v50);
      objc_msgSend(v48, "setImageSize:");
      objc_msgSend(v49, "accessibilityText");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v52)
      {
        objc_msgSend(v8, "accessibilityText");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v38, "setAccessibilityLabel:", v52);
      v53 = objc_msgSend(v8, "isEnabled");
      v54 = 0.4;
      if ((_DWORD)v53)
        v54 = 1.0;
      objc_msgSend(v38, "setAlpha:", v54);
      objc_msgSend(v38, "setEnabled:", v53);
      objc_msgSend(v8, "style");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIViewElementPlainColorWithStyle(v55, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTintColor:", v56);

      if (objc_msgSend(v8, "isBigHitButton"))
      {
        objc_msgSend(v38, "setUseBigHitTarget:", 1);
        objc_msgSend(v8, "bigHitSize");
        v58 = -v57;
        v59 = v57 == 0.0;
        v60 = -15.0;
        if (!v59)
          v60 = v58;
        objc_msgSend(v38, "setBigHitInsets:", v60, v60, v60, v60);
      }
      else
      {
        objc_msgSend(v38, "setUseBigHitTarget:", 0);
      }

      break;
    case 6:
      if (objc_msgSend(v8, "buttonViewSubType") == 1)
      {
        -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6ED0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "nonToggledText");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setNonToggledTitle:", v62);

        objc_msgSend(v8, "toggledText");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setToggledTitle:", v63);

        objc_msgSend(v61, "setAutoIncrement:", objc_msgSend(v8, "autoIncrementCount"));
        v23 = v61;
        v64 = v23;
      }
      else
      {
        -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6BD0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
      }
      objc_msgSend(v64, "setBorderStyle:", 0);
      v82 = +[SKUIStyledButton buttonTypeForElement:](SKUIStyledButton, "buttonTypeForElement:", v8);
      if (objc_msgSend(v8, "isBigHitButton"))
      {
        objc_msgSend(v8, "bigHitSize");
        v84 = -v83;
        v59 = v83 == 0.0;
        v85 = -15.0;
        if (!v59)
          v85 = v84;
        objc_msgSend(v64, "setBigHitInsets:", v85, v85, v85, v85);
        objc_msgSend(v64, "setUseBigHitTarget:", 1);
      }
      objc_msgSend(v64, "setButtonType:", v82);
      objc_msgSend(v9, "labelLayoutCache");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setTitleLayout:", v87);

      objc_msgSend(v8, "style");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "elementPadding");
      objc_msgSend(v64, "setButtonPadding:");

      v89 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v64, "setEnabled:", v89);
      v90 = 0.4;
      if ((_DWORD)v89)
        v90 = 1.0;
      objc_msgSend(v64, "setAlpha:", v90);
      objc_msgSend(v64, "imageView");
      v28 = (SKUIButtonBorderStyle *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buttonImage");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      __RequestImage(v91, v9);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v23, "setElement:", v8);
        objc_msgSend(v8, "toggleItemIdentifier");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKUIToggleStateCenter defaultCenter](SKUIToggleStateCenter, "defaultCenter");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v93, "length"))
        {
          objc_msgSend(v23, "setToggleItemIdentifier:", v93);
          objc_msgSend(v121, "itemForIdentifier:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v94 = 0;
        }
        if ((objc_msgSend(v94, "toggled") & 0x80000000) != 0)
          v119 = objc_msgSend(v8, "isToggled");
        else
          v119 = objc_msgSend(v94, "count");
        v123 = v94;
        objc_msgSend(v8, "additionalButtonImage");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        if (v104)
        {
          objc_msgSend(v23, "setToggleButtonType:", 1);
          __RequestImage(v104, v9);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v23, "setToggleButtonType:", 0);
          v105 = 0;
        }
        if (objc_msgSend(v8, "autoIncrementCount") && objc_msgSend(v123, "toggled") == -1)
        {
          v113 = v28;
          v114 = v93;
          objc_msgSend(v23, "titleLayout");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "attributedString");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "string");
          v110 = (void *)objc_claimAutoreleasedReturnValue();

          v118 = v110;
          if (objc_msgSend(v110, "length"))
          {
            if (addButtonWithElement_width_context__sOnceToken != -1)
              dispatch_once(&addButtonWithElement_width_context__sOnceToken, &__block_literal_global_31);
            v93 = v114;
            v28 = v113;
            objc_msgSend((id)addButtonWithElement_width_context__sNumberFormatter, "numberFromString:", v118);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            if (v111)
            {
              v115 = v111;
              v119 = objc_msgSend(v111, "integerValue");
              v111 = v115;
            }

          }
          else
          {
            v28 = v113;
            v93 = v114;
          }
          if (v119 < 1)
          {
            objc_msgSend(v23, "setButtonTitleText:", CFSTR(" "));
            objc_msgSend(v23, "setAutoIncrementCount:", v119);
          }
          else
          {
            objc_msgSend(v23, "setAutoIncrementCount:", v119);
            objc_msgSend(v23, "setButtonTitleText:", v118);
          }
          objc_msgSend(v23, "setAutoIncrementCount:", v119);
          objc_msgSend(v23, "setToggled:", objc_msgSend(v8, "isToggled"));

        }
        else if (objc_msgSend(v8, "autoIncrementCount"))
        {
          v116 = v104;
          objc_msgSend(v23, "setToggled:", objc_msgSend(v123, "toggled") == 1);
          if (v119 < 1)
          {
            objc_msgSend(v23, "setButtonTitleText:", CFSTR(" "));
          }
          else
          {
            objc_msgSend(v123, "toggledString");
            v106 = v92;
            v107 = v93;
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setButtonTitleText:", v108);

            v93 = v107;
            v92 = v106;
          }
          v104 = v116;
        }
        else
        {
          objc_msgSend(v23, "setToggled:", objc_msgSend(v8, "isToggled"));
        }
        objc_msgSend(v23, "setNonToggledContents:", v92);
        objc_msgSend(v23, "setToggledContents:", v105);
        if (objc_msgSend(v23, "isToggled"))
          v112 = v105;
        else
          v112 = v92;
        -[SKUIButtonBorderStyle setContents:](v28, "setContents:", v112);

      }
      else
      {
        -[SKUIButtonBorderStyle setContents:](v28, "setContents:", v92);
      }
      objc_msgSend(v9, "sizeForImageElement:", v91);
      -[SKUIButtonBorderStyle setImageSize:](v28, "setImageSize:");
      v38 = v64;

LABEL_52:
      break;
    case 9:
      -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6BD0);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAlpha:", 1.0);
      objc_msgSend(v38, "setBorderStyle:", 0);
      v65 = 1;
      objc_msgSend(v38, "setButtonType:", 1);
      objc_msgSend(v9, "labelLayoutCache");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTitleLayout:", v67);

      -[SKUIViewModification _itemStateForButton:](self, "_itemStateForButton:", v8);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buyButtonDescriptor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientContext");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v69, v68, v70, 0);

      if ((objc_msgSend(v38, "isUsingItemOfferAppearance") & 1) == 0)
        v65 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v38, "setEnabled:", v65);
      objc_msgSend(v8, "style");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIViewElementPlainColorWithStyle(v71, 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "setTintColor:", v72);
      goto LABEL_74;
    case 12:
      -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6D50);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sizeVariant");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("large"));

      objc_msgSend(v38, "setStyle:", v74);
      objc_msgSend(v8, "playItemIdentifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "isIndeterminate"))
        objc_msgSend(v38, "endIndeterminateAnimation");
      objc_msgSend(v38, "setShowOnDemand:", objc_msgSend(v8, "showOnDemand"));
      objc_msgSend(v38, "showPlayIndicator:", 1);
      objc_msgSend(v38, "setPlayItemIdentifier:", v68);
      objc_msgSend(v38, "setItemIdentifier:", objc_msgSend(v68, "longLongValue"));
      objc_msgSend(v38, "setBigHitInsets:", -15.0, -15.0, -15.0, -15.0);
      objc_msgSend(v8, "style");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "ikBackgroundColor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = objc_msgSend(v76, "colorType");
      if (v77 == 2)
      {
        v80 = 0;
        v81 = 0;
      }
      else
      {
        if (v77 == 3)
        {
          v78 = objc_msgSend(v76, "gradientDirectionType") == 2;
          objc_msgSend(v76, "gradientColors");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setBackgroundGradientColors:withGradientType:", v79, v78);
          v80 = 0;
          v81 = 0;
          v77 = 4;
        }
        else
        {
          objc_msgSend(v76, "color");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "style");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "ikColor");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "color");
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v77 = 1;
        }

      }
      objc_msgSend(v38, "setItemIdentifier:", objc_msgSend(v68, "longLongValue"));
      objc_msgSend(v38, "setBackgroundType:", v77);
      if (v80)
        objc_msgSend(v38, "setControlForegroundColor:", v80);
      if (v81)
        objc_msgSend(v38, "setControlColor:", v81);
      objc_msgSend(v38, "setElement:", v8);
      objc_msgSend(v38, "setEnabled:", objc_msgSend(v8, "isEnabled"));
      objc_msgSend(v38, "setDisabledButSelectable:", objc_msgSend(v8, "isDisabledButSelectable"));
      objc_msgSend(v38, "setHidden:", objc_msgSend(v38, "showOnDemand"));

LABEL_74:
      break;
    default:
      v38 = 0;
      break;
  }
  objc_msgSend(v8, "attributes");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("privacy"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v98 = v97;
  else
    v98 = 0;
  objc_msgSend(v38, "setAdPrivacyData:", v98);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = v38;
    objc_msgSend(v8, "buttonTitleStyle");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v100;
    if (!v100)
    {
      objc_msgSend(v8, "style");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v101, "ikColor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setUsesTintColor:", objc_msgSend(v102, "colorType") == 1);

    if (!v100)
  }

  return v38;
}

uint64_t __80__SKUIViewModification_SKUIViewElementView__addButtonWithElement_width_context___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)addButtonWithElement_width_context__sNumberFormatter;
  addButtonWithElement_width_context__sNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)addButtonWithElement_width_context__sNumberFormatter, "setNumberStyle:", 1);
}

- (id)addDividerWithElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIViewModification(SKUIViewElementView) addDividerWithElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73AEFD0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithStyle(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 || objc_msgSend(v6, "dividerType") == 3)
  {
    if (objc_msgSend(v6, "dividerType") == 3)
    {

      v19 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "setDividerColor:", v19);

  return v16;
}

- (id)addHeaderViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addHeaderViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6C10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addHorizontalListWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addHorizontalListWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6C30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "elementPadding");
  objc_msgSend(v18, "setContentInset:");

  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);
  return v18;
}

- (id)addHorizontalLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addHorizontalLockupWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6C70);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addImageDeckViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addImageDeckViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6CB0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addImageGridViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addImageGridViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6CD0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addImageViewWithElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v35;
  _BYTE v36[48];

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIViewModification(SKUIViewElementView) addImageViewWithElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v6, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageTreatment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = SKUIImageTreatmentForString(v17);

  if (v18 == 13)
  {
    -[SKUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x1E73B6D70, v6, v7);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v16, "transform");
      objc_msgSend(v19, "setTransform:", v36);
    }
    SKUIViewElementPlainColorWithStyle(v16, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v21);

    objc_msgSend(v16, "elementPadding");
    objc_msgSend(v19, "setImagePadding:");
    objc_msgSend(v16, "ikBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "color");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v22);

  }
  else if (v18 == 7)
  {
    -[SKUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x1E73B6DD0, v6, v7);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "borderDrawingCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderDrawingCache:", v20);

  }
  else
  {
    objc_msgSend(v6, "children");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      -[SKUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x1E73B6B50, v6, v7);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      objc_msgSend(v19, "reloadWithViewElement:width:context:", v6, v7);
    }
    else
    {
      objc_msgSend(v6, "shadowOffset");
      if (v26 == *MEMORY[0x1E0C9D820] && v25 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        -[SKUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x1E73B6CF0, v6, v7);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "layerShadowOpacity");
        if (v28 != 0.0)
        {
          objc_msgSend(v19, "layer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setMasksToBounds:", 0);

          objc_msgSend(v19, "layer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "layerShadowOpacity");
          objc_msgSend(v30, "setShadowOpacity:");

          objc_msgSend(v19, "layer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "layerShadowOffset");
          objc_msgSend(v31, "setShadowOffset:");

        }
        objc_msgSend(v6, "layerShadowRadius");
        if (v32 != 0.0)
        {
          objc_msgSend(v19, "layer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "layerShadowRadius");
          objc_msgSend(v33, "setShadowRadius:");

        }
      }
      else
      {
        -[SKUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x1E73B6D10, v6, v7);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setContentMode:", 4);
      }
    }
    if (v16)
    {
      objc_msgSend(v16, "transform");
      objc_msgSend(v19, "setTransform:", &v35);
    }
    SKUIViewElementPlainColorWithStyle(v16, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v20);
  }

  return v19;
}

- (id)addImageViewWithVideoElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIViewModification(SKUIViewElementView) addImageViewWithVideoElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v7, "thumbnailImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v7, "isEnabled");

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v16, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x1E73B6F10, v16, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v18, "transform");
      objc_msgSend(v19, "setTransform:", &v21);
    }

  }
  else
  {
    -[SKUIViewModification addImageViewWithElement:context:](self, "addImageViewWithElement:context:", v16, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)addLabelViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addLabelViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v9, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIViewModification _attributedStringViewForLayout:](self, "_attributedStringViewForLayout:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLayout:", v19);
  objc_msgSend(v20, "setContainsLinks:", objc_msgSend(v8, "containsLinks"));
  if (objc_msgSend(v8, "containsLinks"))
  {
    objc_msgSend(v8, "linkDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLinkDelegate:", v21);

  }
  objc_msgSend(v20, "setStringTreatment:", 0);
  objc_msgSend(v20, "setTreatmentColor:", 0);
  objc_msgSend(v8, "style");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ikColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColorFollowsTintColor:", objc_msgSend(v23, "colorType") == 1);

  if (v19)
  {
    objc_msgSend(v8, "trailingBadges");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "badgeImageLoader");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "badges");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v27)
    {
      v28 = v27;
      v35 = v24;
      v36 = v9;
      LOBYTE(v29) = 0;
      v30 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v26);
          v32 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (v29)
          {
            v29 = 1;
          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "image");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v33 == 0;

          }
          objc_msgSend(v25, "loadImageForBadge:layout:reason:", v32, v19, 1, v35, v36);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v28);
      v24 = v35;
      v9 = v36;
      if (v29)
        objc_msgSend(v25, "connectStringView:", v20);
    }

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v20, "setRequiredBadges:", v24);
  objc_msgSend(v20, "setBadgePlacement:", objc_msgSend(v8, "badgePlacement") == 1);

  return v20;
}

- (id)addLabelViewWithOrdinalElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addLabelViewWithOrdinalElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v8, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutForWidth:viewElement:", (uint64_t)a4, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIViewModification _attributedStringViewForLayout:](self, "_attributedStringViewForLayout:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLayout:", v19);
  objc_msgSend(v20, "setStringTreatment:", 0);
  objc_msgSend(v20, "setTreatmentColor:", 0);
  objc_msgSend(v9, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "ikColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColorFollowsTintColor:", objc_msgSend(v22, "colorType") == 1);

  return v20;
}

- (id)addMenuButtonWithTitleItem:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addMenuButtonWithTitleItem:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6BD0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBorderStyle:", 0);
  objc_msgSend(v18, "setButtonType:", 2);
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  objc_msgSend(v8, "labelLayoutCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "layoutForWidth:viewElement:", (uint64_t)a4, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setTitleLayout:", v20);
  objc_msgSend(v18, "setUsesTintColor:", 1);
  return v18;
}

- (id)addOfferViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addOfferViewWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73ADB70);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addStackListViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addStackListViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6DF0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "elementPadding");
  objc_msgSend(v18, "setContentInset:");

  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);
  return v18;
}

- (id)addStackItemViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addStackItemViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B4C70);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "elementPadding");
  objc_msgSend(v18, "setContentInset:");

  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);
  return v18;
}

- (id)addReviewListTitleViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addReviewListTitleViewWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6DB0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addResponseViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addResponseViewWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6D90);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addStarRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addStarRatingViewWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6E10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setElementSpacing:", 3);
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addStarRatingControlViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addStarRatingControlViewWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6E30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addTabularLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addTabularLockupWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6E90);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)addTextViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addTextViewWithElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6EB0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editorialLayoutForLabelElement:width:", v8, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bodyTextLayoutForOrientation:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v18, "setEnabled:", 0);
  objc_msgSend(v18, "setFixedWidthTextFrame:", objc_msgSend(v20, "textFrame"));
  objc_msgSend(v8, "moreButtonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMoreButtonTitle:", v21);

  v22 = objc_msgSend(v20, "requiresTruncation");
  v23 = 0;
  if (v22)
  {
    if ((objc_msgSend(v9, "isEditorialLayoutExpanded:", v19) & 1) != 0)
      v23 = 0;
    else
      v23 = objc_msgSend(v8, "isEnabled");
  }
  objc_msgSend(v18, "setUserInteractionEnabled:", v23);
  if ((objc_msgSend(v9, "isEditorialLayoutExpanded:", v19) & 1) != 0)
    v24 = 0;
  else
    v24 = objc_msgSend(v8, "numberOfLines");
  objc_msgSend(v18, "setNumberOfVisibleLines:", v24);

  return v18;
}

- (id)addTomatoRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewModification(SKUIViewElementView) addTomatoRatingViewWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x1E73B6EF0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v18;
}

- (id)_addImageViewWithReuseIdentifier:(id)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v8 = a5;
  v9 = a4;
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  objc_msgSend(v10, "setUserInteractionEnabled:", objc_msgSend(v9, "isEnabled"));
  __RequestImage(v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContents:", v12);
  objc_msgSend(v8, "sizeForImageElement:", v9);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v10, "setImageSize:", v14, v16);
  return v10;
}

- (id)_itemStateForButton:(id)a3
{
  id v3;
  uint64_t v4;
  SKUIStoreIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "itemIdentifier");
  objc_msgSend(v3, "storeIdentifier");
  v5 = (SKUIStoreIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v5 && v4)
    v5 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", v4);
  if (v5)
  {
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateForItemWithStoreIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (objc_msgSend(v3, "buyButtonDescriptor"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "canPersonalizeUsingItemState:", v7),
          v8,
          v9))
    {
      v10 = v7;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_styleItemOfferButton:(id)a3 forElement:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = a4;
  objc_msgSend(a5, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setTintColor:", v10);
  v11 = v7;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    do
    {
      v14 = v13;
      objc_msgSend(v13, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ikBackgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIViewElementPlainColorWithIKColor(v16, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v13 && !v17);
  }
  else
  {
    v17 = 0;
    v13 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "cloudTintColorForBackgroundColor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCloudTintColor:", v18);

  objc_msgSend(v20, "setElement:", v12);
  objc_msgSend(v20, "setEnabled:", objc_msgSend(v12, "isEnabled"));
  objc_msgSend(v20, "setDisabledButSelectable:", objc_msgSend(v12, "isDisabledButSelectable"));
  objc_msgSend(v12, "badgeResourceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUniversal:", objc_msgSend(v19, "isEqualToString:", CFSTR("plus")));

}

- (id)_attributedStringViewForLayout:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v10;
  __CFString **v11;

  objc_msgSend(a3, "edgeInsetsForShadow");
  v10 = v7 == *(double *)(MEMORY[0x1E0DC49E8] + 16)
     && v6 == *(double *)(MEMORY[0x1E0DC49E8] + 24)
     && v4 == *MEMORY[0x1E0DC49E8]
     && v5 == *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v11 = SKUIViewReuseAttributedStringIdentifier;
  if (!v10)
    v11 = SKUIViewReuseAttributedStringWrapperIdentifier;
  -[SKUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", *v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)initWithViewReusePool:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewModification initWithViewReusePool:]";
}

@end
