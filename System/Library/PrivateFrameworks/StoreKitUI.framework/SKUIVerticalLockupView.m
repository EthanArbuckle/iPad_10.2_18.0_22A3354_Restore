@implementation SKUIVerticalLockupView

- (SKUIVerticalLockupView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIVerticalLockupView *v16;
  uint64_t v17;
  NSMapTable *lineSpacings;
  uint64_t v19;
  NSMapTable *topInsets;
  uint64_t v21;
  NSMapTable *viewElementViews;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIVerticalLockupView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIVerticalLockupView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    lineSpacings = v16->_lineSpacings;
    v16->_lineSpacings = (NSMapTable *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    topInsets = v16->_topInsets;
    v16->_topInsets = (NSMapTable *)v19;

    v16->_opacityOfViewsOtherThanProductImageView = 1.0;
    v16->_zoomingImageAlpha = 1.0;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    viewElementViews = v16->_viewElementViews;
    v16->_viewElementViews = (NSMapTable *)v21;

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC278], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIVerticalLockupView;
  -[SKUIViewReuseView dealloc](&v4, sel_dealloc);
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIVerticalLockupView maximumPerspectiveHeightForSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  +[SKUIStackedImageView maximumPerspectiveHeightForSize:](SKUIStackedImageView, "maximumPerspectiveHeightForSize:", width, height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SKUIVerticalLockupView_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_1E73A4178;
  objc_copyWeak(&v5, &location);
  -[SKUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6DD0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SKUIVerticalLockupView_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setPerspectiveTargetView:", WeakRetained);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  _QWORD v3[4];
  CGPoint v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__SKUIVerticalLockupView_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v4 = a3;
  -[SKUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6DD0, v3);
}

uint64_t __44__SKUIVerticalLockupView_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SKUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6DD0, &__block_literal_global_30);
}

uint64_t __68__SKUIVerticalLockupView_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateForChangedDistanceFromVanishingPoint");
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
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
  id v17;
  char v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIVerticalLockupView prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__SKUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v20[3] = &unk_1E73A1208;
  v17 = v8;
  v22 = &v24;
  v23 = a4;
  v21 = v17;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v20);
  v18 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v18;
}

uint64_t __73__SKUIVerticalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", a2, *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = 1;
  else
    v5 = result;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
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
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  double v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  CGSize result;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        +[SKUIVerticalLockupView preferredSizeForViewElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(v6, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForStyle:", CFSTR("itml-lockup-min-width"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    v19 = v18;
  }
  else
  {
    v19 = 80.0;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62__SKUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke;
  v26[3] = &unk_1E73A1208;
  v20 = v7;
  v27 = v20;
  v28 = &v30;
  v29 = v19;
  objc_msgSend(v6, "enumerateChildrenUsingBlock:", v26);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v6, v20, v31[3]);
  v23 = v22;
  if (v21 >= v19)
    v19 = v21;

  _Block_object_dispose(&v30, 8);
  v24 = v19;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

void __62__SKUIVerticalLockupView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "elementType");
  if (v3 <= 137)
  {
    if (v3 != 12)
    {
      if (v3 == 49)
      {
        objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v9);
LABEL_19:
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(double *)(v4 + 24) >= v5)
          v5 = *(double *)(v4 + 24);
        goto LABEL_21;
      }
      if (v3 != 62)
        goto LABEL_22;
    }
LABEL_9:
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(double *)(v4 + 24);
    if (v5 < *(double *)(a1 + 48))
      v5 = *(double *)(a1 + 48);
LABEL_21:
    *(double *)(v4 + 24) = v5;
    goto LABEL_22;
  }
  if (v3 <= 151)
  {
    if (v3 != 138 && v3 != 141)
      goto LABEL_22;
    goto LABEL_9;
  }
  if (v3 != 152)
  {
    if (v3 != 154)
      goto LABEL_22;
    +[SKUIImageGridView preferredSizeForViewElement:context:](SKUIImageGridView, "preferredSizeForViewElement:context:", v9, *(_QWORD *)(a1 + 32));
    goto LABEL_19;
  }
  objc_msgSend(v9, "thumbnailImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v8 + 24) >= v7)
    v7 = *(double *)(v8 + 24);
  *(double *)(v8 + 24) = v7;

LABEL_22:
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
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
  id v19;
  id v20;
  SKUISizeValue *v21;
  SKUISizeValue *v22;
  SKUISizeValue *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  double v32;
  id v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIVerticalLockupView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x3010000000;
  v37 = &unk_1BBF15257;
  v38 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v9, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __68__SKUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke;
  v27 = &unk_1E73A59F0;
  v19 = v18;
  v28 = v19;
  v32 = a4;
  v33 = a1;
  v20 = v9;
  v29 = v20;
  v30 = &v39;
  v31 = &v34;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", &v24);
  if (*((_BYTE *)v40 + 24))
  {
    objc_msgSend(v20, "aggregateValueForKey:", CFSTR("SKUIVLABS"), v24, v25, v26, v27, v28);
    v21 = (SKUISizeValue *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      -[SKUISizeValue unionWithSize:](v21, "unionWithSize:", v35[4], v35[5]);
    }
    else
    {
      v23 = [SKUISizeValue alloc];
      v22 = -[SKUISizeValue initWithSize:](v23, "initWithSize:", v35[4], v35[5]);
      objc_msgSend(v20, "setAggregateValue:forKey:", v22, CFSTR("SKUIVLABS"));
    }

  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v39, 8);

}

void __68__SKUIVerticalLockupView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __objc2_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v3 = a2;
  v4 = objc_msgSend(v3, "elementType");
  if (v4 > 134)
  {
    switch(v4)
    {
      case 135:
        v5 = SKUIStarRatingViewElementView;
        goto LABEL_32;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_36;
      case 138:
        v21 = 0;
        objc_msgSend(v3, "style");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        SKUIViewElementMarginForStyle(v9, &v21);
        v11 = v10;
        v13 = v12;

        if (v21)
          v14 = *(double *)(a1 + 64) - v11 - v13;
        else
          v14 = *(double *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 72), "_attributedStringForLabel:context:", v3, *(_QWORD *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "requestLayoutForLabel:attributedString:width:", v3, v8, (uint64_t)v14);
        goto LABEL_25;
      case 141:
        goto LABEL_20;
      case 144:
        v5 = SKUITomatoRatingView;
        goto LABEL_32;
      default:
        if (v4 != 152)
        {
          if (v4 != 154)
            goto LABEL_36;
          goto LABEL_15;
        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          goto LABEL_36;
        v16 = *(void **)(a1 + 40);
        objc_msgSend(v3, "thumbnailImage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sizeForImageElement:", v17);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        *(_QWORD *)(v18 + 32) = v19;
        *(_QWORD *)(v18 + 40) = v20;

        break;
    }
    goto LABEL_35;
  }
  if (v4 <= 48)
  {
    if (v4 == 8)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForBadge:width:", v3, (uint64_t)*(double *)(a1 + 64));
      goto LABEL_36;
    }
    if (v4 == 12)
    {
LABEL_20:
      objc_msgSend(*(id *)(a1 + 72), "_attributedStringForButton:context:", v3, *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForButton:attributedString:width:", v3, v8, (uint64_t)*(double *)(a1 + 64));
LABEL_25:

      goto LABEL_36;
    }
    if (v4 != 48)
      goto LABEL_36;
    v5 = SKUISectionHeaderView;
LABEL_32:
    -[__objc2_class requestLayoutForViewElement:width:context:](v5, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
    goto LABEL_36;
  }
  if (v4 > 61)
  {
    if (v4 == 62)
    {
      v5 = SKUIHorizontalListView;
    }
    else
    {
      if (v4 != 77)
        goto LABEL_36;
      v5 = SKUIOfferView;
    }
    goto LABEL_32;
  }
  if (v4 == 49)
  {
    +[SKUIAdornedImageView requestLayoutForViewElement:width:context:](SKUIAdornedImageView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "sizeForImageElement:", v3);
      goto LABEL_29;
    }
  }
  else if (v4 == 51)
  {
    +[SKUIImageDeckView requestLayoutForViewElement:width:context:](SKUIImageDeckView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
LABEL_15:
    +[SKUIImageGridView requestLayoutForViewElement:width:context:](SKUIImageGridView, "requestLayoutForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      +[SKUIImageGridView sizeThatFitsWidth:viewElement:context:](SKUIImageGridView, "sizeThatFitsWidth:viewElement:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
LABEL_29:
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      *(_QWORD *)(v15 + 32) = v6;
      *(_QWORD *)(v15 + 40) = v7;
LABEL_35:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
LABEL_36:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
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
  void *v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t *v34;
  double v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  CGSize result;

  v8 = a4;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIVerticalLockupView sizeThatFitsWidth:viewElement:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x3010000000;
  v46 = &unk_1BBF15257;
  v18 = MEMORY[0x1E0C9D820];
  v47 = *MEMORY[0x1E0C9D820];
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x2020000000;
  v42 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__48;
  v37[4] = __Block_byref_object_dispose__48;
  v38 = 0;
  objc_msgSend(v9, "aggregateValueForKey:", CFSTR("SKUIVLAUBS"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (v20)
  {
    objc_msgSend(v9, "aggregateValueForKey:", CFSTR("SKUIVLABS"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __64__SKUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v29[3] = &unk_1E73A5A18;
  v22 = v9;
  v35 = a3;
  v30 = v22;
  v32 = v37;
  v23 = v21;
  v31 = v23;
  v33 = &v39;
  v36 = a1;
  v34 = &v43;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v29);
  v25 = v44[4];
  v24 = v44[5];
  if (v24 - v40[3] >= *(double *)(v18 + 8))
    v26 = v24 - v40[3];
  else
    v26 = *(double *)(v18 + 8);
  v44[5] = v26;

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  v27 = v25;
  v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

void __64__SKUIVerticalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", *(double *)(a1 + 72));
  v4 = v3;
  v6 = v5;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && *(_QWORD *)(a1 + 40))
  {
    v7 = objc_msgSend(v18, "elementType");
    if (v7 != 154)
    {
      if (v7 == 152)
      {
        objc_msgSend(v18, "thumbnailImage");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v10 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;
        goto LABEL_8;
      }
      if (v7 != 49)
        goto LABEL_9;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = v18;
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
LABEL_8:

    objc_msgSend(*(id *)(a1 + 40), "size");
    v6 = v13;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 80), "_bottomInsetForViewElement:width:context:", v18, *(_QWORD *)(a1 + 32), *(double *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v6
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 40);
  objc_msgSend(*(id *)(a1 + 80), "_topInsetForViewElement:width:context:", v18, *(_QWORD *)(a1 + 32), *(double *)(a1 + 72));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v15
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 40);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(double *)(v16 + 32);
  if (v17 < v4)
    v17 = v4;
  *(double *)(v16 + 32) = v17;

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  SKUISizeValue *productImageBoundingSize;
  UIView *productImageView;
  void *v13;
  int v14;
  SKUISizeValue *v15;
  SKUISizeValue *v16;
  id v17;
  id v18;
  UIView *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  SKUIVerticalLockupView *v26;
  double v27;

  v9 = a3;
  v10 = a5;
  objc_storeStrong((id *)&self->_lockupElement, a3);
  -[NSMapTable removeAllObjects](self->_lineSpacings, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_topInsets, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  productImageBoundingSize = self->_productImageBoundingSize;
  self->_productImageBoundingSize = 0;

  productImageView = self->_productImageView;
  self->_productImageView = 0;

  -[NSHashTable removeAllObjects](self->_artworkRelatedChildViewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  objc_msgSend(v10, "aggregateValueForKey:", CFSTR("SKUIVLAUBS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    objc_msgSend(v10, "aggregateValueForKey:", CFSTR("SKUIVLABS"));
    v15 = (SKUISizeValue *)objc_claimAutoreleasedReturnValue();
    v16 = self->_productImageBoundingSize;
    self->_productImageBoundingSize = v15;

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke;
  v23[3] = &unk_1E73A1230;
  v17 = v9;
  v24 = v17;
  v27 = a4;
  v18 = v10;
  v25 = v18;
  v26 = self;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v23);
  v19 = self->_productImageView;
  if (v19)
  {
    -[UIView transform](v19, "transform");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
  }
  *(_OWORD *)&self->_productImageViewOriginalTransform.a = v20;
  *(_OWORD *)&self->_productImageViewOriginalTransform.c = v21;
  *(_OWORD *)&self->_productImageViewOriginalTransform.tx = v22;

}

void __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v8[3] = &unk_1E73A4898;
  v9 = v3;
  v12 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v8);

}

void __62__SKUIVerticalLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id *v23;
  id *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  int *v41;
  char v42;

  v3 = a2;
  v4 = objc_msgSend(v3, "elementType");
  v5 = 0;
  if (v4 > 61)
  {
    if (v4 <= 134)
    {
      if (v4 == 62)
      {
        objc_msgSend(*(id *)(a1 + 32), "addHorizontalListWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        v7 = v8;
      }
      else
      {
        v7 = 0;
        v8 = 0;
        if (v4 != 77)
          goto LABEL_60;
        objc_msgSend(*(id *)(a1 + 32), "addOfferViewWithViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v8 = (id)v6;
LABEL_28:
        v7 = 0;
        v5 = 0;
      }
    }
    else
    {
      v7 = 0;
      v8 = 0;
      switch(v4)
      {
        case 135:
          objc_msgSend(*(id *)(a1 + 32), "addStarRatingViewWithViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 136:
        case 137:
        case 139:
        case 140:
        case 142:
        case 143:
          goto LABEL_60;
        case 138:
          v42 = 0;
          objc_msgSend(v3, "style");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          SKUIViewElementMarginForStyle(v15, &v42);
          v17 = v16;
          v19 = v18;

          v20 = *(double *)(a1 + 56);
          if (v42)
            v20 = v20 - v17 - v19;
          objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), v20);
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 141:
LABEL_17:
          objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__cancelConfirmationAction_, 0x10000);
          objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 0x20000);
          objc_msgSend(v8, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__showConfirmationAction_, 0x40000);
          LODWORD(v13) = -0.5;
          objc_msgSend(v8, "setCharge:", v13);
          objc_msgSend(v8, "setItemOfferDelegate:", *(_QWORD *)(a1 + 48));
          goto LABEL_28;
        case 144:
          objc_msgSend(*(id *)(a1 + 32), "addTomatoRatingViewWithViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        default:
          if (v4 == 152)
          {
            objc_msgSend(*(id *)(a1 + 32), "addImageViewWithVideoElement:context:", v3, *(_QWORD *)(a1 + 40));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v21;
LABEL_39:
            v24 = (id *)(*(_QWORD *)(a1 + 48) + 512);
            if (!*v24)
              objc_storeStrong(v24, v21);
LABEL_43:
            v7 = 0;
            v5 = v8;
          }
          else
          {
            v7 = 0;
            v8 = 0;
            if (v4 != 154)
              goto LABEL_60;
            objc_msgSend(*(id *)(a1 + 32), "addImageGridViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
            v22 = v12;
            v8 = v12;
            v23 = (id *)(*(_QWORD *)(a1 + 48) + 512);
            if (!*v23)
              objc_storeStrong(v23, v22);
            v5 = 0;
            v7 = v8;
          }
          break;
      }
    }
LABEL_44:
    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "_bottomInsetForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
      if (v25 > 0.00000011920929)
      {
        v26 = *(void **)(*(_QWORD *)(a1 + 48) + 480);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v27, v8);

      }
      objc_msgSend((id)objc_opt_class(), "_topInsetForViewElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
      if (v28 > 0.00000011920929)
      {
        v29 = *(void **)(*(_QWORD *)(a1 + 48) + 576);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v30, v8);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 584), "setObject:forKey:", v3, v8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 584), "setObject:forKey:", v8, v3);
    }
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        if (!v32)
        {
          v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
          v34 = *(_QWORD *)(a1 + 48);
          v35 = *(void **)(v34 + 472);
          *(_QWORD *)(v34 + 472) = v33;

          v32 = *(void **)(*(_QWORD *)(a1 + 48) + 472);
        }
        objc_msgSend(v32, "setObject:forKey:", v31, v5);
      }

    }
    if (v7)
    {
      v36 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
      if (!v36)
      {
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
        v38 = *(_QWORD *)(a1 + 48);
        v39 = *(void **)(v38 + 432);
        *(_QWORD *)(v38 + 432) = v37;

        v36 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
      }
      objc_msgSend(v36, "addObject:", v7);
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
    switch(v4)
    {
      case 7:
        objc_msgSend(v3, "firstChildForElementType:", 49);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v9, *(_QWORD *)(a1 + 40));
          v8 = (id)objc_claimAutoreleasedReturnValue();
          v10 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setBackgroundColor:", v11);

        }
        else
        {
          v8 = 0;
        }

        goto LABEL_43;
      case 8:
        objc_msgSend(*(id *)(a1 + 32), "addBadgeViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v5 = v8;
        goto LABEL_44;
      case 9:
      case 10:
      case 11:
        break;
      case 12:
LABEL_18:
        objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
        v8 = v14;
        if (objc_msgSend(v3, "elementType") == 50)
          v5 = v8;
        else
          v5 = 0;

        v7 = 0;
        goto LABEL_44;
      case 13:
        goto LABEL_17;
      default:
        switch(v4)
        {
          case '0':
            objc_msgSend(*(id *)(a1 + 32), "addHeaderViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v6 = objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          case '1':
            objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v3, *(_QWORD *)(a1 + 40));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v21;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v8, "setUserInteractionEnabled:", 0);
            goto LABEL_39;
          case '2':
            goto LABEL_18;
          case '3':
            objc_msgSend(*(id *)(a1 + 32), "addImageDeckViewWithElement:width:context:", v3, *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          default:
            v7 = 0;
            v8 = 0;
            if (v4 != 32)
              goto LABEL_60;
            objc_msgSend(*(id *)(a1 + 32), "addDividerWithElement:context:", v3, *(_QWORD *)(a1 + 40));
            v6 = objc_claimAutoreleasedReturnValue();
            break;
        }
        goto LABEL_27;
    }
  }
LABEL_60:
  v40 = *(_QWORD *)(a1 + 48);
  if (v8 == *(id *)(v40 + 512))
    v41 = &OBJC_IVAR___SKUIVerticalLockupView__zoomingImageAlpha;
  else
    v41 = &OBJC_IVAR___SKUIVerticalLockupView__opacityOfViewsOtherThanProductImageView;
  objc_msgSend(v8, "setAlpha:", *(double *)(v40 + *v41));

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIVerticalLockupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  NSMapTable *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v8 = a4;
  v9 = a5;
  v27 = v8;
  v10 = objc_msgSend(v8, "requestIdentifier");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "imageView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v26;
            objc_msgSend(v24, "setImage:", v26);

            v22 = v8;
          }
          else
          {
            objc_opt_class();
            v22 = v8;
            v21 = v26;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v15, "setImage:cacheKey:context:", v26, v16, v9);
            else
              objc_msgSend(v15, "setImage:", v26);
          }

          goto LABEL_26;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_artworkRelatedChildViewElementViews;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v30;
    v21 = v26;
    v22 = v27;
LABEL_12:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v20)
        objc_enumerationMutation(obj);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "setImage:forArtworkRequest:context:", v26, v27, v9) & 1) != 0)
        break;
      if (v19 == ++v23)
      {
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
          goto LABEL_12;
        goto LABEL_27;
      }
    }
LABEL_26:
    LOBYTE(v19) = 1;
  }
  else
  {
    v21 = v26;
    v22 = v8;
  }
LABEL_27:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__48;
  v19 = __Block_byref_object_dispose__48;
  v20 = 0;
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElement flattenedChildren](self->_lockupElement, "flattenedChildren");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__SKUIVerticalLockupView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_1E73A30E8;
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __51__SKUIVerticalLockupView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "itmlID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    *a4 = 1;
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double left;
  double right;
  double top;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  UIView *v18;
  void *v19;
  double v20;
  double v21;
  double height;
  double width;
  char v24;
  double v25;
  double v26;
  void *v27;
  SKUISizeValue *productImageBoundingSize;
  double y;
  double v30;
  double v31;
  unint64_t v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  uint64_t v37;
  double x;
  float v39;
  SKUISizeValue *v40;
  double v41;
  double productImageAdjustedWidth;
  double v43;
  __int128 v44;
  double v45;
  double MidX;
  void *v47;
  void *v48;
  float v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  char v53;
  uint64_t v54;
  id obj;
  double v56;
  double v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v68 = *MEMORY[0x1E0C80C00];
  v66.receiver = self;
  v66.super_class = (Class)SKUIVerticalLockupView;
  -[SKUIVerticalLockupView layoutSubviews](&v66, sel_layoutSubviews);
  -[SKUIVerticalLockupView bounds](self, "bounds");
  v56 = v4;
  v57 = v3;
  v6 = v5;
  v8 = v7;
  left = self->_contentInset.left;
  right = self->_contentInset.right;
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  top = self->_contentInset.top;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v12)
  {
    v13 = v12;
    v53 = 0;
    v14 = v6 - left - right;
    v15 = *(_QWORD *)v63;
    v52 = *MEMORY[0x1E0C9D648];
    v16 = &OBJC_IVAR___SKUIRedeemCameraViewController__successfulRedeem;
    v50 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v51 = *MEMORY[0x1E0C9D538];
    do
    {
      v17 = 0;
      v54 = v13;
      do
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(obj);
        v18 = *(UIView **)(*((_QWORD *)&v62 + 1) + 8 * v17);
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16[992]), "objectForKey:", v18, *(_QWORD *)&v50, *(_QWORD *)&v51);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "elementType") == 32)
        {
          -[UIView sizeThatFits:](v18, "sizeThatFits:", v6 - self->_contentInset.left, 1.79769313e308);
          height = v21;
          if (v6 - self->_contentInset.left >= v20)
            width = v20;
          else
            width = v6 - self->_contentInset.left;
          v24 = 1;
        }
        else
        {
          -[UIView sizeThatFits:](v18, "sizeThatFits:", v14, 1.79769313e308);
          height = v26;
          if (v14 >= v25)
            width = v25;
          else
            width = v14;
          v24 = v53;
        }
        if (objc_msgSend(v19, "elementType") == 7)
        {
          -[UIView setFrame:](v18, "setFrame:", v57, v56, v6, v8);
          -[SKUIVerticalLockupView sendSubviewToBack:](self, "sendSubviewToBack:", v18);
        }
        else
        {
          objc_msgSend(v19, "style");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          productImageBoundingSize = self->_productImageBoundingSize;
          y = top;
          if (productImageBoundingSize)
          {
            y = top;
            if (v18 == self->_productImageView)
            {
              -[SKUISizeValue size](productImageBoundingSize, "size");
              v31 = v30;
              v32 = objc_msgSend(v27, "elementPosition");
              y = top;
              if (v32 <= 9)
              {
                if (((1 << v32) & 0x309) != 0)
                {
                  y = top + v31 - height;
                }
                else
                {
                  y = top;
                  if (((1 << v32) & 0x32) != 0)
                  {
                    v33 = top + (v31 - height) * 0.5;
                    y = floorf(v33);
                  }
                }
              }
            }
          }
          -[NSMapTable objectForKey:](self->_topInsets, "objectForKey:", v18);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            objc_msgSend(v34, "floatValue");
            y = y + v36;
          }
          if (objc_msgSend(v19, "elementType") == 138)
            v37 = objc_msgSend(v27, "textAlignment");
          else
            v37 = objc_msgSend(v27, "elementAlignment");
          x = v52;
          switch(v37)
          {
            case 0:
              switch(objc_msgSend(v27, "elementPosition"))
              {
                case 1:
                  goto LABEL_33;
                case 5:
                case 7:
                case 9:
                  goto LABEL_32;
                default:
                  goto LABEL_30;
              }
            case 1:
            case 4:
            case 5:
LABEL_30:
              x = self->_contentInset.left;
              break;
            case 2:
LABEL_33:
              v39 = (v14 - width) * 0.5;
              x = self->_contentInset.left + floorf(v39);
              break;
            case 3:
LABEL_32:
              x = v6 - self->_contentInset.right - width;
              break;
            default:
              break;
          }
          memset(&v61, 0, sizeof(v61));
          if (v18)
            -[UIView transform](v18, "transform");
          v40 = self->_productImageBoundingSize;
          if (!v40)
            goto LABEL_41;
          if (v18 != self->_productImageView)
            goto LABEL_41;
          -[SKUISizeValue size](v40, "size");
          y = top + v41 - height;
          productImageAdjustedWidth = self->_productImageAdjustedWidth;
          if (productImageAdjustedWidth <= 0.00000011920929)
            goto LABEL_41;
          v43 = productImageAdjustedWidth / width;
          v44 = *(_OWORD *)&self->_productImageViewOriginalTransform.c;
          *(_OWORD *)&v59.a = *(_OWORD *)&self->_productImageViewOriginalTransform.a;
          *(_OWORD *)&v59.c = v44;
          *(_OWORD *)&v59.tx = *(_OWORD *)&self->_productImageViewOriginalTransform.tx;
          CGAffineTransformScale(&v60, &v59, v43, v43);
          v61 = v60;
          -[UIView setTransform:](v18, "setTransform:", &v60);
          v45 = self->_productImageAdjustedWidth;
          if (vabdd_f64(v45, width) > 0.00000011920929)
          {
            x = x + (v45 - width) * -0.5;
            width = width * v43;
            height = height * v43;
            v60 = v61;
            CGAffineTransformInvert(&v58, &v60);
            v69.origin.y = v50;
            v69.origin.x = v51;
            v69.size.width = width;
            v69.size.height = height;
            v70 = CGRectApplyAffineTransform(v69, &v58);
            -[UIView setBounds:](v18, "setBounds:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
            SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8);
            MidX = CGRectGetMidX(v71);
            v72.origin.x = x;
            v72.origin.y = y;
            v72.size.width = width;
            v72.size.height = height;
            -[UIView setCenter:](v18, "setCenter:", MidX, CGRectGetMidY(v72));
            v53 = 1;
          }
          else
          {
LABEL_41:
            if ((v24 & 1) == 0)
            {
              v73.origin.x = x;
              v73.origin.y = y;
              v73.size.width = width;
              v73.size.height = height;
              v74 = CGRectIntegral(v73);
              x = v74.origin.x;
              y = v74.origin.y;
              width = v74.size.width;
              height = v74.size.height;
            }
            SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v57, v56, v6, v8);
            -[UIView setFrame:](v18, "setFrame:");
          }
          v75.origin.x = x;
          v75.origin.y = y;
          v75.size.width = width;
          v75.size.height = height;
          top = CGRectGetMaxY(v75);
          -[NSMapTable objectForKey:](self->_lineSpacings, "objectForKey:", v18);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            objc_msgSend(v47, "floatValue");
            top = top + v49;
          }

          v13 = v54;
          v16 = &OBJC_IVAR___SKUIRedeemCameraViewController__successfulRedeem;
        }

        ++v17;
      }
      while (v13 != v17);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v13);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIEdgeInsets *p_contentInset;
  double v5;
  UIView *productImageView;
  double v7;
  void *v8;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[8];
  uint64_t v17;
  double *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  CGSize result;

  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x3010000000;
  v20 = &unk_1BBF15257;
  v21 = *MEMORY[0x1E0C9D820];
  p_contentInset = &self->_contentInset;
  v5 = a3.width - self->_contentInset.left - self->_contentInset.right;
  if (self->_sizingStyle == 1)
  {
    productImageView = self->_productImageView;
    if (productImageView)
    {
      -[UIView sizeThatFits:](productImageView, "sizeThatFits:");
      v5 = v7;
    }
  }
  -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__SKUIVerticalLockupView_sizeThatFits___block_invoke;
  v16[3] = &unk_1E73A5A40;
  *(double *)&v16[6] = v5;
  v16[4] = self;
  v16[5] = &v17;
  v16[7] = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  v10 = v18;
  v11 = v18[4];
  v12 = p_contentInset->bottom + p_contentInset->top + v18[5];
  v18[5] = v12;
  v13 = v11 + p_contentInset->left + p_contentInset->right;
  v10[4] = v13;

  _Block_object_dispose(&v17, 8);
  v14 = v13;
  v15 = v12;
  result.height = v15;
  result.width = v14;
  return result;
}

void __39__SKUIVerticalLockupView_sizeThatFits___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  id v17;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 504);
  v17 = v5;
  if (v7 && *(id *)(v6 + 512) == v5)
  {
    objc_msgSend(v7, "size");
  }
  else
  {
    objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
    if (v8 >= *(double *)(a1 + 48))
      v8 = *(double *)(a1 + 48);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v10 + 32) >= v8)
    v8 = *(double *)(v10 + 32);
  *(double *)(v10 + 32) = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "objectForKey:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "floatValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + v13;
  }
  if (*(_QWORD *)(a1 + 56) - 1 > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "objectForKey:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 40)
                                                                  + v16;
    }

  }
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  double x;
  double y;
  double MaxX;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double left;
  double v15;
  float v16;
  id v17;
  CGRect v18;

  v17 = a3;
  objc_msgSend(v17, "frame");
  x = v18.origin.x;
  y = v18.origin.y;
  MaxX = CGRectGetMaxX(v18);
  objc_msgSend(v17, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v8 = v7;
  v10 = v9;
  -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = SKUIViewElementAlignmentForStyle(v12);

  if (v13 == 3)
  {
    x = MaxX - v8;
  }
  else if (v13 == 2)
  {
    -[SKUIVerticalLockupView bounds](self, "bounds");
    left = self->_contentInset.left;
    v16 = (v15 - left - self->_contentInset.right - v8) * 0.5;
    x = left + floorf(v16);
  }
  objc_msgSend(v17, "setFrame:", x, y, v8, v10);

}

- (void)setOpacityOfViewsOtherThanProductImageView:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  UIView *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (vabdd_f64(self->_opacityOfViewsOtherThanProductImageView, a3) > 0.00000011920929)
  {
    self->_opacityOfViewsOtherThanProductImageView = a3;
    -[SKUIViewReuseView allExistingViews](self, "allExistingViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(UIView **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (v10 != self->_productImageView)
            -[UIView setAlpha:](v10, "setAlpha:", a3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)setZoomingImageAlpha:(double)a3
{
  if (vabdd_f64(self->_zoomingImageAlpha, a3) > 0.00000011920929)
  {
    self->_zoomingImageAlpha = a3;
    -[UIView setAlpha:](self->_productImageView, "setAlpha:");
  }
}

- (void)setZoomingImageWidth:(double)a3
{
  if (vabdd_f64(self->_productImageAdjustedWidth, a3) > 0.00000011920929)
  {
    self->_productImageAdjustedWidth = a3;
    -[SKUIVerticalLockupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_buttonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  SKUICollectionViewCellForView(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SKUICollectionViewForView(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "indexPathForCell:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v5, v8, 0, v7);

  }
  else
  {
    objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }

}

- (void)_cancelConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_showConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 1, 1);
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIVerticalLockupView _attributedStringForButton:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v5, "buttonTitleStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v5, "style");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  SKUIViewElementFontWithStyle(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    SKUIFontForTextStyle(6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "attributedStringWithDefaultFont:foregroundColor:style:", v19, v21, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        +[SKUIVerticalLockupView _attributedStringForLabel:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v5, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithStyle(v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = SKUIViewElementAlignmentForStyle(v15);
  if (v19)
    v20 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v19);
  else
    v20 = 0;
  v21 = objc_msgSend(v5, "labelViewStyle");
  if (v21 <= 5)
  {
    if (((1 << v21) & 0x1B) == 0)
    {
      if (v16)
      {
        if (v18)
          goto LABEL_21;
      }
      else
      {
        SKUIFontForTextStyle(6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v18)
        goto LABEL_17;
    }
    else
    {
      SKUIFontForTextStyle(5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v18 = (void *)v22;
      }
    }
  }
LABEL_21:
  objc_msgSend(v5, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v16, v18, v20, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (double)_bottomInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
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
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  char v27;
  char v28;

  v6 = a3;
  v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        +[SKUIVerticalLockupView _bottomInsetForViewElement:width:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v28 = 0;
  objc_msgSend(v6, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPaddingForStyle(v16, &v28);
  v18 = v17;

  v27 = 0;
  objc_msgSend(v6, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementMarginForStyle(v19, &v27);
  v21 = v20;

  v22 = objc_msgSend(v6, "elementType");
  if (v22 == 154 || !v28)
  {
    if (v22 == 154 && v27)
    {
      v18 = v21;
      goto LABEL_29;
    }
    v23 = objc_msgSend(v6, "elementType");
    v18 = 0.0;
    if (v23 <= 48)
    {
      switch(v23)
      {
        case 8:
          if (objc_msgSend(v6, "badgeType") == 1)
            v18 = 2.0;
          else
            v18 = 0.0;
          break;
        case 13:
LABEL_25:
          v18 = 5.0;
          break;
        case 32:
          v18 = 12.0;
          break;
      }
    }
    else
    {
      if (v23 > 151)
      {
        if (v23 != 152 && v23 != 154)
          goto LABEL_29;
      }
      else if (v23 != 49)
      {
        if (v23 != 77)
          goto LABEL_29;
        goto LABEL_25;
      }
      objc_msgSend(v7, "aggregateValueForKey:", CFSTR("SKUIVLABS"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "size");
      if (v25 >= 100.0)
        v18 = 12.0;
      else
        v18 = 7.0;

    }
  }
LABEL_29:

  return v18;
}

+ (double)_topInsetForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v17;
  char v18;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        +[SKUIVerticalLockupView _topInsetForViewElement:width:context:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v18 = 0;
  objc_msgSend(v5, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = SKUIViewElementPaddingForStyle(v14, &v18);

  if (v18)
    goto LABEL_6;
  v17 = objc_msgSend(v5, "elementType");
  v15 = 0.0;
  if (v17 <= 31)
  {
    if (v17 == 8)
    {
      if (objc_msgSend(v5, "badgeType") == 1)
        v15 = 3.0;
      else
        v15 = 0.0;
      goto LABEL_6;
    }
    if (v17 != 13)
      goto LABEL_6;
LABEL_13:
    v15 = 5.0;
    goto LABEL_6;
  }
  if (v17 == 32)
  {
    v15 = 12.0;
    goto LABEL_6;
  }
  if (v17 == 77)
    goto LABEL_13;
LABEL_6:

  return v15;
}

- (int64_t)sizingStyle
{
  return self->_sizingStyle;
}

- (void)setSizingStyle:(int64_t)a3
{
  self->_sizingStyle = a3;
}

- (double)opacityOfViewsOtherThanProductImageView
{
  return self->_opacityOfViewsOtherThanProductImageView;
}

- (double)zoomingImageAlpha
{
  return self->_zoomingImageAlpha;
}

- (double)zoomingImageWidth
{
  return self->_zoomingImageWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_topInsets, 0);
  objc_storeStrong((id *)&self->_productImageView, 0);
  objc_storeStrong((id *)&self->_productImageBoundingSize, 0);
  objc_storeStrong((id *)&self->_lockupElement, 0);
  objc_storeStrong((id *)&self->_lineSpacings, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)maximumPerspectiveHeightForSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)_attributedStringForButton:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)_attributedStringForLabel:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)_bottomInsetForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)_topInsetForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
