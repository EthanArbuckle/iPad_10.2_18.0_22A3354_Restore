@implementation SKUIProductLockupCollectionViewCell

- (SKUIProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUIProductLockupCollectionViewCell *v16;
  uint64_t v17;
  NSMapTable *elementViews;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIProductLockupCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIProductLockupCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    elementViews = v16->_elementViews;
    v16->_elementViews = (NSMapTable *)v17;

  }
  return v16;
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
        +[SKUIProductLockupCollectionViewCell maximumPerspectiveHeightForSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
  v4[2] = __64__SKUIProductLockupCollectionViewCell_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_1E73A4178;
  objc_copyWeak(&v5, &location);
  -[SKUIViewReuseCollectionViewCell enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6DD0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__SKUIProductLockupCollectionViewCell_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
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
  v3[2] = __57__SKUIProductLockupCollectionViewCell_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v4 = a3;
  -[SKUIViewReuseCollectionViewCell enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6DD0, v3);
}

uint64_t __57__SKUIProductLockupCollectionViewCell_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SKUIViewReuseCollectionViewCell enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6DD0, &__block_literal_global_16);
}

uint64_t __81__SKUIProductLockupCollectionViewCell_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
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
        +[SKUIProductLockupCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__SKUIProductLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __86__SKUIProductLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[SKUIProductLockupCollectionViewCell preferredSizeForViewElement:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
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
  SKUIProductLockupLayout *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;

  v8 = a5;
  v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIProductLockupCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = -[SKUIProductLockupLayout initWithLockup:width:context:]([SKUIProductLockupLayout alloc], "initWithLockup:width:context:", v9, v8, a4);

  -[SKUIProductLockupLayout metadataWidthForWidth:](v18, "metadataWidthForWidth:", a4);
  v20 = v19;
  -[SKUIProductLockupLayout viewElementsForSection:](v18, "viewElementsForSection:", 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v21, v8, v20);

  -[SKUIProductLockupLayout viewElementsForSection:](v18, "viewElementsForSection:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v22, v8, v20);

  if (v18)
    -[SKUIProductLockupLayout layoutWidthsForWidth:](v18, "layoutWidthsForWidth:", a4);
  -[SKUIProductLockupLayout viewElementsForSection:](v18, "viewElementsForSection:", 4, (unsigned __int128)0, (unsigned __int128)0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v23, v8, 0.0);

  -[SKUIProductLockupLayout viewElementsForSection:](v18, "viewElementsForSection:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v24, v8, 0.0);

  -[SKUIProductLockupLayout viewElementsForSection:](v18, "viewElementsForSection:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v25, v8, v26);

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
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
  SKUIProductLockupLayout *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  v7 = a5;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIProductLockupCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = -[SKUIProductLockupLayout initWithLockup:width:context:]([SKUIProductLockupLayout alloc], "initWithLockup:width:context:", v8, v7, a3);

  -[SKUIProductLockupLayout viewElementsForSection:](v17, "viewElementsForSection:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0.0;
  if (v19)
  {
    objc_msgSend(v7, "sizeForViewElement:width:", v19, a3);
    v20 = v21;
  }
  if (v17)
    -[SKUIProductLockupLayout sizingToFitWidth:](v17, "sizingToFitWidth:", a3, 0.0, 0.0, 0.0, 0);
  v22 = 0.0 > 0.00000011920929;
  if (0.0 > 0.00000011920929)
    v22 += 2;
  v23 = 0.0 + 0.0 + 0.0;
  if (v22 > 1)
    v23 = v23 + (double)(uint64_t)(v22 - 1) * 5.0;
  v24 = -0.0;
  if (0.0 > 0.00000011920929)
    v24 = 5.0;
  v25 = 0.0 + 0.0 + v24;
  if (v23 >= v25)
    v25 = v23;
  if (v20 < v25)
    v20 = v25;

  v26 = a3;
  v27 = v20;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  NSMapTable *buyButtonDescriptorToButton;
  id v10;
  SKUIProductLockupLayout *v11;
  SKUIProductLockupLayout *layout;
  NSMutableArray *segmentedControlControllers;
  SKUIGradientView *offerConfirmationGradientView;
  id v15;
  _QWORD v16[5];
  id v17;
  double v18;

  v8 = a5;
  buyButtonDescriptorToButton = self->_buyButtonDescriptorToButton;
  v10 = a3;
  -[NSMapTable removeAllObjects](buyButtonDescriptorToButton, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_offerViews, "removeAllObjects");
  v11 = -[SKUIProductLockupLayout initWithLockup:width:context:]([SKUIProductLockupLayout alloc], "initWithLockup:width:context:", v10, v8, a4);

  layout = self->_layout;
  self->_layout = v11;

  self->_offerMetadataPosition = 1;
  segmentedControlControllers = self->_segmentedControlControllers;
  self->_segmentedControlControllers = 0;

  -[SKUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  self->_offerConfirmationGradientView = 0;

  -[NSMapTable removeAllObjects](self->_elementViews, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_artworkRelatedChildViewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v16[3] = &unk_1E73A4098;
  v18 = a4;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v16);

}

void __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke(double *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  double v12;

  v3 = a2;
  v4 = *((_QWORD *)a1 + 4);
  v5 = (void *)*((_QWORD *)a1 + 5);
  v6 = *(void **)(v4 + 856);
  v7 = a1[6];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_1E73A4200;
  v12 = v7;
  v9[4] = v4;
  v10 = v3;
  v11 = v5;
  v8 = v3;
  objc_msgSend(v6, "enumerateViewElementsForWidth:usingBlock:", v9, v7);

}

void __75__SKUIProductLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  unint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  SKUISegmentedControlViewElementController *v11;
  SKUISegmentedControlViewElementController *v12;
  SKUISegmentedControlViewElementController *v13;
  SKUISegmentedControlViewElementController *v14;
  uint64_t v15;
  void *v16;
  double v17;
  SKUISegmentedControlViewElementController *v18;
  void *v19;
  SKUISegmentedControlViewElementController *v20;
  uint64_t v21;
  void *v22;
  double v23;
  SKUISegmentedControlViewElementController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  SKUISegmentedControlViewElementController *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;

  v53 = a2;
  v7 = a3 & 0xFFFFFFFFFFFFFFFBLL;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "metadataWidthForWidth:", *(double *)(a1 + 56));
    a4 = v8;
  }
  v9 = objc_msgSend(v53, "elementType");
  v10 = v9;
  v11 = 0;
  if (v9 > 108)
  {
    if (v9 > 134)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      switch(v9)
      {
        case 135:
          objc_msgSend(*(id *)(a1 + 40), "addStarRatingViewWithViewElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        case 136:
        case 137:
        case 139:
        case 140:
        case 142:
        case 143:
          goto LABEL_69;
        case 138:
          objc_msgSend(*(id *)(a1 + 40), "addLabelViewWithElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        case 141:
          goto LABEL_35;
        case 144:
          objc_msgSend(*(id *)(a1 + 40), "addTomatoRatingViewWithViewElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        default:
          v12 = 0;
          v13 = 0;
          v14 = 0;
          if (v9 != 152)
            goto LABEL_69;
          objc_msgSend(*(id *)(a1 + 40), "addImageViewWithVideoElement:context:", v53, *(_QWORD *)(a1 + 48));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          break;
      }
LABEL_39:
      v24 = v25;
LABEL_44:
      v13 = v24;
      v11 = 0;
      v12 = 0;
      goto LABEL_51;
    }
    if (v9 == 109)
    {
      objc_msgSend(*(id *)(a1 + 40), "addReusableViewWithReuseIdentifier:", 0x1E73B0ED0);
      v14 = (SKUISegmentedControlViewElementController *)objc_claimAutoreleasedReturnValue();
      v20 = -[SKUISegmentedControlViewElementController initWithViewElement:segmentedControl:]([SKUISegmentedControlViewElementController alloc], "initWithViewElement:segmentedControl:", v53, v14);
      objc_msgSend(*(id *)(a1 + 48), "clientContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISegmentedControlViewElementController setClientContext:](v20, "setClientContext:", v28);

      -[SKUISegmentedControlViewElementController setDesiredSegmentWidth:](v20, "setDesiredSegmentWidth:", 40.0);
      v29 = *(void **)(*(_QWORD *)(a1 + 32) + 896);
      if (!v29)
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v31 = *(_QWORD *)(a1 + 32);
        v32 = *(void **)(v31 + 896);
        *(_QWORD *)(v31 + 896) = v30;

        v29 = *(void **)(*(_QWORD *)(a1 + 32) + 896);
      }
      v33 = v20;
      goto LABEL_76;
    }
    v12 = 0;
    v13 = 0;
    v14 = 0;
    if (v9 != 131)
      goto LABEL_69;
    objc_msgSend(*(id *)(a1 + 40), "addStackListViewWithElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
    v24 = v19;
    v12 = v24;
    v11 = 0;
    goto LABEL_50;
  }
  if (v9 > 48)
  {
    if (v9 <= 61)
    {
      if (v9 != 49)
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        if (v9 != 50)
          goto LABEL_69;
LABEL_15:
        objc_msgSend(*(id *)(a1 + 40), "addButtonWithElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 64);
        LODWORD(v17) = -1097229926;
        objc_msgSend(v16, "setCharge:", v17);
        v18 = v16;
        v14 = v18;
        v12 = 0;
        if (v10 == 50)
          v11 = 0;
        else
          v11 = v18;
        if (v10 == 50)
          v13 = v18;
        else
          v13 = 0;
        if (!v18)
          goto LABEL_53;
        goto LABEL_52;
      }
      objc_msgSend(*(id *)(a1 + 40), "addImageViewWithElement:context:", v53, *(_QWORD *)(a1 + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "tapRecognizer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addTarget:action:", *(_QWORD *)(a1 + 32), sel__imageTapAction_);

      v24 = v26;
      goto LABEL_44;
    }
    if (v9 != 62)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      if (v9 != 77)
        goto LABEL_69;
      v20 = (SKUISegmentedControlViewElementController *)v53;
      objc_msgSend(*(id *)(a1 + 40), "addOfferViewWithViewElement:width:context:", v20, *(_QWORD *)(a1 + 48), a4);
      v14 = (SKUISegmentedControlViewElementController *)objc_claimAutoreleasedReturnValue();
      if (-[SKUISegmentedControlViewElementController isSimpleOffer](v20, "isSimpleOffer"))
      {
        if (v7 == 1)
          -[SKUISegmentedControlViewElementController setMetadataPosition:](v14, "setMetadataPosition:", 0);
        v21 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v49 = -[SKUISegmentedControlViewElementController metadataPosition](v14, "metadataPosition");
        v21 = 0;
        if (v49 != 1)
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 880) = v49;
      }
      -[SKUISegmentedControlViewElementController setDelegate:](v14, "setDelegate:", v21);
      if (!v14)
        goto LABEL_77;
      v29 = *(void **)(*(_QWORD *)(a1 + 32) + 888);
      if (!v29)
      {
        v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
        v51 = *(_QWORD *)(a1 + 32);
        v52 = *(void **)(v51 + 888);
        *(_QWORD *)(v51 + 888) = v50;

        v29 = *(void **)(*(_QWORD *)(a1 + 32) + 888);
      }
      v33 = v14;
LABEL_76:
      objc_msgSend(v29, "addObject:", v33);
LABEL_77:

      goto LABEL_78;
    }
    objc_msgSend(*(id *)(a1 + 40), "addHorizontalListWithElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  if (v9 <= 12)
  {
    if (v9 != 8)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      if (v9 != 12)
        goto LABEL_69;
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 40), "addBadgeViewWithElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if (v9 != 13)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    if (v9 != 48)
      goto LABEL_69;
    objc_msgSend(*(id *)(a1 + 40), "addHeaderViewWithElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_42:
    v14 = (SKUISegmentedControlViewElementController *)v15;
LABEL_78:
    v11 = 0;
    v12 = 0;
    v13 = 0;
    if (!v14)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_35:
  objc_msgSend(*(id *)(a1 + 40), "addButtonWithElement:width:context:", v53, *(_QWORD *)(a1 + 48), a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 0x20000);
  objc_msgSend(v22, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__cancelConfirmationAction_, 0x10000);
  objc_msgSend(v22, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__showConfirmationAction_, 0x40000);
  LODWORD(v23) = -1097229926;
  objc_msgSend(v22, "setCharge:", v23);
  objc_msgSend(v22, "setItemOfferDelegate:", *(_QWORD *)(a1 + 32));
  v24 = v22;
  v11 = v24;
  v12 = 0;
LABEL_50:
  v13 = 0;
LABEL_51:
  v14 = v24;
  if (v24)
  {
LABEL_52:
    objc_msgSend(*(id *)(a1 + 48), "textPropertiesForViewElement:width:", v53, a4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setTextProperties:forView:", v34, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "setObject:forKey:", v14, v53);

  }
LABEL_53:
  if (v11)
  {
    objc_msgSend(v53, "buyButtonDescriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = *(void **)(*(_QWORD *)(a1 + 32) + 832);
      if (!v36)
      {
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 517, 1);
        v38 = *(_QWORD *)(a1 + 32);
        v39 = *(void **)(v38 + 832);
        *(_QWORD *)(v38 + 832) = v37;

        v36 = *(void **)(*(_QWORD *)(a1 + 32) + 832);
      }
      objc_msgSend(v36, "setObject:forKey:", v11, v35);
    }

  }
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 48), "imageResourceCacheKeyForViewElement:", v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = *(void **)(*(_QWORD *)(a1 + 32) + 848);
      if (!v41)
      {
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
        v43 = *(_QWORD *)(a1 + 32);
        v44 = *(void **)(v43 + 848);
        *(_QWORD *)(v43 + 848) = v42;

        v41 = *(void **)(*(_QWORD *)(a1 + 32) + 848);
      }
      objc_msgSend(v41, "setObject:forKey:", v40, v13);
    }

  }
  if (v12)
  {
    v45 = *(void **)(*(_QWORD *)(a1 + 32) + 824);
    if (!v45)
    {
      v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
      v47 = *(_QWORD *)(a1 + 32);
      v48 = *(void **)(v47 + 824);
      *(_QWORD *)(v47 + 824) = v46;

      v45 = *(void **)(*(_QWORD *)(a1 + 32) + 824);
    }
    objc_msgSend(v45, "addObject:", v12);
  }
LABEL_69:

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
  v27 = a3;
  v8 = a4;
  v9 = a5;
  v26 = v8;
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
            v21 = v27;
            objc_msgSend(v24, "setImage:", v27);

          }
          else
          {
            v21 = v27;
            objc_msgSend(v15, "setImage:", v27);
          }
          v22 = v8;

          goto LABEL_23;
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
    v22 = v26;
    v21 = v27;
LABEL_12:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v20)
        objc_enumerationMutation(obj);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "setImage:forArtworkRequest:context:", v27, v26, v9) & 1) != 0)
        break;
      if (v19 == ++v23)
      {
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
          goto LABEL_12;
        goto LABEL_24;
      }
    }
LABEL_23:
    LOBYTE(v19) = 1;
  }
  else
  {
    v22 = v8;
    v21 = v27;
  }
LABEL_24:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSHashTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v24;
  SKUIProductLockupCollectionViewCell *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "clientContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = self->_buyButtonDescriptorToButton;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v16, "canPersonalizeUsingItemState:", v8))
        {
          -[NSMapTable objectForKey:](v25->_buyButtonDescriptorToButton, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v13 |= objc_msgSend(v17, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v16, v8, v24, v5);

        }
      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v25->_offerViews;
  v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v13 |= objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "updateWithItemState:context:animated:", v8, v9, v5);
      }
      v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  if ((v13 & 1) != 0)
    -[SKUIProductLockupCollectionViewCell setNeedsLayout](v25, "setNeedsLayout");

  return v13 & 1;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_elementViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "itmlID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[NSMapTable objectForKey:](self->_elementViews, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  int ShouldReverseLayoutDirection;
  uint64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  void (**v57)(double, double, double, double, double);
  void *v58;
  int64_t v59;
  void *v60;
  double v61;
  double MinY;
  double MaxX;
  uint64_t v64;
  double v65;
  double *v66;
  double v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double rect;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  _QWORD v84[13];
  _QWORD v85[13];
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double *v95;
  uint64_t v96;
  void *v97;
  __int128 v98;
  _QWORD v99[16];
  _QWORD aBlock[4];
  id v101;
  id v102;
  id v103;
  SKUIProductLockupCollectionViewCell *v104;
  uint64_t *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CGFloat v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  CGFloat *v128;
  uint64_t v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  uint64_t v135;
  double *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  objc_super v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  v141.receiver = self;
  v141.super_class = (Class)SKUIProductLockupCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v141, sel_layoutSubviews);
  -[SKUIProductLockupCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SKUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  v78 = v13;
  v79 = v12;
  v135 = 0;
  v136 = (double *)&v135;
  v137 = 0x3010000000;
  v138 = &unk_1BBF15257;
  v72 = v15;
  v73 = v14;
  v139 = v15;
  v140 = v14;
  -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSMapTable objectForKey:](self->_elementViews, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v19 = v136[4];
    v20 = v136[5];
    objc_msgSend(v18, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v22 = v21;
    v24 = v23;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v19, v20, v21, v23, v5, v7, v9, v11);
    objc_msgSend(v18, "setFrame:");
    v142.origin.x = v19;
    v142.origin.y = v20;
    v142.size.width = v22;
    v142.size.height = v24;
    v136[4] = CGRectGetMaxX(v142) + 13.0;

  }
  v82 = v136[5];
  v83 = v136[4];
  -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v80 = v11 - v79 - v82;
  v81 = v9 - v78 - v83;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v83, v82, v81, v80, v5, v7, v9, v11);
  if (ShouldReverseLayoutDirection)
    v27 = 7;
  else
    v27 = 8;
  -[SKUIProductLockupCollectionViewCell _stackElements:alignment:inRect:](self, "_stackElements:alignment:inRect:", v25, v27, v11 - v79);
  v77 = SKUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(v28, v29, v30, v31, v5, v7, v9, v11);
  v70 = v33;
  v71 = v32;
  v69 = v34;
  -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductLockupCollectionViewCell _stackBottomRightElements:inRect:](self, "_stackBottomRightElements:inRect:", v35, v83, v82, v81, v80);
  v68 = v36;
  v75 = v38;
  v76 = v37;
  rect = v39;
  v127 = 0;
  v128 = (CGFloat *)&v127;
  v129 = 0x4010000000;
  v130 = &unk_1BBF15257;
  v131 = v83;
  v132 = v82;
  v133 = v9 - v78 - v83;
  v134 = v11 - v79 - v82;
  if (objc_msgSend(v25, "count"))
    v128[6] = v77 - 5.0 - v128[4];
  -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (storeShouldReverseLayoutDirection())
    v41 = 8;
  else
    v41 = 7;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v128[4], v128[5], v128[6], v128[7], v5, v7, v9, v11);
  -[SKUIProductLockupCollectionViewCell _stackElements:alignment:inRect:](self, "_stackElements:alignment:inRect:", v40, v41);
  v46 = SKUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(v42, v43, v44, v45, v5, v7, v9, v11);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v53 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E73A4228;
  v105 = &v127;
  v106 = v83;
  v107 = v82;
  v108 = v9 - v78 - v83;
  v109 = v11 - v79 - v82;
  v54 = v40;
  v101 = v54;
  v110 = v46;
  v111 = v48;
  v112 = v50;
  v113 = v52;
  v114 = v5;
  v115 = v7;
  v116 = v9;
  v117 = v11;
  v118 = v73;
  v119 = v72;
  v120 = v79;
  v121 = v78;
  v55 = v25;
  v102 = v55;
  v122 = v77;
  v123 = v71;
  v124 = v70;
  v125 = v69;
  v56 = v35;
  v103 = v56;
  v104 = self;
  v126 = v41;
  v57 = (void (**)(double, double, double, double, double))_Block_copy(aBlock);
  v57[2](v68, v76, v75, rect, 0.0);
  -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v58, "count"))
  {
    v59 = -[SKUIProductLockupLayout bottomLeftLayoutStyle](self->_layout, "bottomLeftLayoutStyle");
    if (v59 == 2)
    {
      v94 = 0;
      v95 = (double *)&v94;
      v60 = (void *)*((_QWORD *)v136 + 4);
      v96 = 0x2020000000;
      v97 = v60;
      v99[0] = v53;
      v99[1] = 3221225472;
      v99[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_2;
      v99[3] = &unk_1E73A4250;
      *(double *)&v99[6] = v9 - v78 - v83;
      *(double *)&v99[7] = v11 - v79 - v82;
      v99[4] = self;
      v99[5] = &v94;
      *(CGFloat *)&v99[8] = v5;
      *(CGFloat *)&v99[9] = v7;
      *(CGFloat *)&v99[10] = v9;
      *(CGFloat *)&v99[11] = v11;
      v99[12] = v73;
      v99[13] = v72;
      *(double *)&v99[14] = v79;
      *(double *)&v99[15] = v78;
      objc_msgSend(v58, "enumerateObjectsUsingBlock:", v99);
      if (objc_msgSend(v56, "count"))
      {
        v143.origin.x = v68;
        v143.size.width = v75;
        v143.origin.y = v76;
        v143.size.height = rect;
        if (CGRectGetMinX(v143) < v95[3])
        {
          if (-[SKUIProductLockupLayout hasBottomRightElementWithRightAlignment](self->_layout, "hasBottomRightElementWithRightAlignment"))
          {
            v61 = v95[3];
            v144.origin.x = v83;
            v144.origin.y = v82;
            v144.size.width = v9 - v78 - v83;
            v144.size.height = v80;
            MinY = CGRectGetMinY(v144);
            v145.origin.x = v83;
            v145.origin.y = v82;
            v145.size.width = v81;
            v145.size.height = v80;
            MaxX = CGRectGetMaxX(v145);
            v146.origin.x = v83;
            v146.origin.y = v82;
            v146.size.width = v81;
            v146.size.height = v80;
            -[SKUIProductLockupCollectionViewCell _stackBottomRightElements:inRect:](self, "_stackBottomRightElements:inRect:", v56, v61, MinY, MaxX - v95[3], CGRectGetHeight(v146));
            ((void (*)(void (**)(double, double, double, double, double)))v57[2])(v57);
          }
        }
      }
    }
    else
    {
      v64 = objc_msgSend(v56, "count");
      v94 = 0;
      v95 = (double *)&v94;
      if (v64)
        v65 = v68 - 5.0 - v83;
      else
        v65 = v9 - v78 - v83;
      v96 = 0x3010000000;
      v97 = &unk_1BBF15257;
      v98 = *MEMORY[0x1E0C9D820];
      v90 = 0;
      v91 = &v90;
      v92 = 0x2020000000;
      v93 = 0;
      v86 = 0;
      v87 = &v86;
      v88 = 0x2020000000;
      v89 = 0;
      v85[0] = v53;
      v85[1] = 3221225472;
      v85[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_3;
      v85[3] = &unk_1E73A4278;
      *(double *)&v85[8] = v65;
      *(CGFloat *)&v85[9] = v5;
      *(CGFloat *)&v85[10] = v7;
      *(CGFloat *)&v85[11] = v9;
      *(CGFloat *)&v85[12] = v11;
      v85[4] = self;
      v85[5] = &v86;
      v85[6] = &v94;
      v85[7] = &v90;
      objc_msgSend(v58, "enumerateObjectsUsingBlock:", v85);
      v66 = v95;
      if (v59 && v95[4] < v65)
        v65 = v95[4];
      v95[4] = v65;
      v91[3] = 0;
      v136[5] = v67 - v66[5];
      v87[3] = 0;
      v84[0] = v53;
      v84[1] = 3221225472;
      v84[2] = __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_4;
      v84[3] = &unk_1E73A42A0;
      v84[4] = self;
      v84[5] = &v135;
      v84[6] = &v90;
      v84[7] = &v86;
      v84[8] = &v94;
      *(CGFloat *)&v84[9] = v5;
      *(CGFloat *)&v84[10] = v7;
      *(CGFloat *)&v84[11] = v9;
      *(CGFloat *)&v84[12] = v11;
      objc_msgSend(v58, "enumerateObjectsUsingBlock:", v84);
      _Block_object_dispose(&v86, 8);
      _Block_object_dispose(&v90, 8);
    }
    _Block_object_dispose(&v94, 8);
  }

  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v135, 8);
}

double __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  double v13;
  double *v14;
  double v15;
  double v16;
  id *v17;
  void *v18;
  uint64_t v19;
  CGFloat *v20;
  double v21;
  double v22;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(v10 + 48) = v11;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = CGRectGetMaxY(*(CGRect *)(a1 + 104)) + 5.0;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56) = *(double *)(a1 + 160)
                                                                - *(double *)(a1 + 184)
                                                                - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 40);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(double *)(a1 + 200) - 5.0 - *(double *)(v12 + 32);
    if (*(double *)(v12 + 48) < v13)
      v13 = *(double *)(v12 + 48);
    *(double *)(v12 + 48) = v13;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v14 = *(double **)(*(_QWORD *)(a1 + 64) + 8);
    if (a6 <= 0.00000011920929)
    {
      v16 = a2 - 5.0 - v14[4];
      if (v14[6] < v16)
        v16 = v14[6];
      v14[6] = v16;
    }
    else
    {
      v15 = a3 - 5.0 - v14[5];
      if (v14[7] < v15)
        v15 = v14[7];
      v14[7] = v15;
    }
  }
  v17 = *(id **)(a1 + 56);
  objc_msgSend(v17[107], "viewElementsForSection:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 232);
  v20 = *(CGFloat **)(*(_QWORD *)(a1 + 64) + 8);
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v20[4], v20[5], v20[6], v20[7], *(CGFloat *)(a1 + 136), *(CGFloat *)(a1 + 144), *(CGFloat *)(a1 + 152), *(CGFloat *)(a1 + 160));
  objc_msgSend(v17, "_stackElements:alignment:inRect:", v18, v19);
  v22 = v21;

  return v22;
}

void __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  CGFloat v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHidden") & 1) == 0)
  {
    objc_msgSend(v9, "frame");
    objc_msgSend(v9, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
    v10.size.width = v3;
    v10.size.height = v4;
    v10.origin.x = *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10.origin.y = *(double *)(a1 + 88) - *(double *)(a1 + 112) - v4;
    v11 = CGRectIntegral(v10);
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v11.origin.x, v11.origin.y, v11.size.width, v11.size.height, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
    objc_msgSend(v9, "setFrame:");
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxX(v12) + 5.0;
  }

}

void __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 64), 1.79769313e308);
    v10 = v9;
    if (v8 >= *(double *)(a1 + 64))
      v11 = *(double *)(a1 + 64);
    else
      v11 = v8;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v5, v7, v11, v9, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
    objc_msgSend(v3, "setFrame:");
    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= 0)
    {
      v12 = v17;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "topPaddingForViewElement:", v17);
      v12 = v17;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v13
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40);
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(double *)(v14 + 32);
    if (v15 < v11)
      v15 = v11;
    *(double *)(v14 + 32) = v15;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "bottomPaddingForViewElement:", v12);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v16;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void __53__SKUIProductLockupCollectionViewCell_layoutSubviews__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v20 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
       + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < 1)
    {
      v9 = v20;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "topPaddingForViewElement:", v20);
      v9 = v20;
      v8 = v8 + v10;
    }
    if (objc_msgSend(v9, "elementType") == 77)
    {
      v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
    }
    else
    {
      v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 880) != 1)
        v11 = v11 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) - v5;
    }
    v12 = v8;
    v13 = v5;
    v14 = v7;
    v21 = CGRectIntegral(*(CGRect *)&v11);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
    objc_msgSend(v3, "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "bottomPaddingForViewElement:", v20);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CGRectGetMaxY(v22);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }

}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  SKUIGradientView *offerConfirmationGradientView;

  if ((objc_msgSend(a3, "isShowingConfirmation") & 1) == 0)
  {
    -[SKUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;

  }
}

- (BOOL)offerViewAnimateTransition:(id)a3
{
  -[SKUIProductLockupCollectionViewCell _updateLayoutToAnimateOfferTransitionForView:](self, "_updateLayoutToAnimateOfferTransitionForView:", a3);
  return 0;
}

- (void)offerViewDidAnimateTransition:(id)a3
{
  SKUIGradientView *offerConfirmationGradientView;

  if ((objc_msgSend(a3, "isShowingConfirmation") & 1) == 0)
  {
    -[SKUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;

  }
}

- (void)_buttonAction:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SKUICollectionViewForView(self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_elementViews;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = v5;
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_elementViews, "objectForKey:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          v5 = v10;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v15, "indexPathForCell:", self);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v15, v12, 0, v14);

          }
          else
          {
            objc_msgSend(v12, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
          }
          goto LABEL_13;
        }
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v5 = v10;
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4;

  v4 = a3;
  -[SKUIProductLockupCollectionViewCell bringSubviewToFront:](self, "bringSubviewToFront:", v4);
  objc_msgSend(v4, "setShowingConfirmation:animated:", 0, 1);

}

- (void)_imageTapAction:(id)a3
{
  void *v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_elementViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_elementViews, "objectForKey:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          objc_msgSend(v10, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_showConfirmationAction:(id)a3
{
  id v4;

  v4 = a3;
  -[SKUIProductLockupCollectionViewCell _prepareOfferConfirmationGradientForView:](self, "_prepareOfferConfirmationGradientForView:", v4);
  objc_msgSend(v4, "setShowingConfirmation:animated:", 1, 1);

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
        +[SKUIProductLockupCollectionViewCell _attributedStringForButton:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
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
    SKUIFontLimitedPreferredFontForTextStyle(21, 5);
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
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        +[SKUIProductLockupCollectionViewCell _attributedStringForLabel:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
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

  switch(objc_msgSend(v5, "labelViewStyle"))
  {
    case 0:
    case 1:
      if (v16)
      {
        if (!v18)
          goto LABEL_21;
      }
      else
      {
        SKUIFontForTextStyle(10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
LABEL_21:
          v19 = (void *)MEMORY[0x1E0DC3658];
          v20 = 0.6;
          goto LABEL_22;
        }
      }
LABEL_26:
      objc_msgSend(v5, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "attributedStringWithDefaultFont:foregroundColor:style:", v16, v18, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      return v23;
    case 2:
    case 5:
      if (v16)
      {
        if (v18)
          goto LABEL_26;
      }
      else
      {
        SKUIFontLimitedPreferredFontForTextStyle(2, 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v18 = (void *)v21;
      goto LABEL_26;
    case 3:
      if (!v16)
      {
        SKUIFontForTextStyle(10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v18)
        goto LABEL_26;
      v19 = (void *)MEMORY[0x1E0DC3658];
      v20 = 0.4;
      goto LABEL_22;
    case 4:
      if (!v16)
      {
        SKUIFontLimitedPreferredFontForTextStyle(21, 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v18)
        goto LABEL_26;
      v19 = (void *)MEMORY[0x1E0DC3658];
      v20 = 0.8;
LABEL_22:
      objc_msgSend(v19, "colorWithWhite:alpha:", 0.0, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    default:
      goto LABEL_26;
  }
}

+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  __objc2_class *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIProductLockupCollectionViewCell _requestLayoutForViewElements:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v9, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v25 = objc_msgSend(v24, "elementType", (_QWORD)v28);
        if (v25 > 76)
        {
          switch(v25)
          {
            case 135:
              v26 = SKUIStarRatingViewElementView;
              break;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              continue;
            case 138:
              objc_msgSend(a1, "_attributedStringForLabel:context:", v24, v9);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "requestLayoutForLabel:attributedString:width:", v24, v27, (uint64_t)a4);
              goto LABEL_27;
            case 141:
              goto LABEL_20;
            case 144:
              v26 = SKUITomatoRatingView;
              break;
            default:
              if (v25 == 77)
              {
                v26 = SKUIOfferView;
              }
              else
              {
                if (v25 != 131)
                  continue;
                v26 = SKUIStackListCollectionViewCell;
              }
              break;
          }
LABEL_30:
          -[__objc2_class requestLayoutForViewElement:width:context:](v26, "requestLayoutForViewElement:width:context:", v24, v9, a4);
          continue;
        }
        if (v25 > 47)
        {
          if (v25 == 48)
          {
            v26 = SKUISectionHeaderView;
          }
          else
          {
            if (v25 != 62)
              continue;
            v26 = SKUIHorizontalListView;
          }
          goto LABEL_30;
        }
        if (v25 == 8)
        {
          objc_msgSend(v18, "requestLayoutForBadge:width:", v24, (uint64_t)a4);
        }
        else if (v25 == 12)
        {
LABEL_20:
          objc_msgSend(a1, "_attributedStringForButton:context:", v24, v9);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "requestLayoutForButton:attributedString:width:", v24, v27, (uint64_t)a4);
LABEL_27:

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v21);
  }

}

- (CGRect)_frameForSection:(int64_t)a3
{
  __int128 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[6];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  CGRect result;

  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x4010000000;
  v18 = &unk_1BBF15257;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *MEMORY[0x1E0C9D648];
  v20 = v4;
  -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__SKUIProductLockupCollectionViewCell__frameForSection___block_invoke;
  v14[3] = &unk_1E73A42C8;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

  v6 = v16[4];
  v7 = v16[5];
  v8 = v16[6];
  v9 = v16[7];
  _Block_object_dispose(&v15, 8);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

void __56__SKUIProductLockupCollectionViewCell__frameForSection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CGRect *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = v5;
    if (a3)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v6 = a1 + 40;
      v8 = *(CGRect **)(v7 + 8);
      objc_msgSend(v5, "frame");
      v15.origin.x = v9;
      v15.origin.y = v10;
      v15.size.width = v11;
      v15.size.height = v12;
      v14 = CGRectUnion(v8[1], v15);
    }
    else
    {
      objc_msgSend(v5, "frame");
      v6 = a1 + 40;
    }
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 32) = v14;
    v5 = v13;
  }

}

- (void)_layoutConfirmationGradientRelativeToSection:(int64_t)a3 alpha:(double)a4
{
  SKUIGradientView *offerConfirmationGradientView;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[9];
  uint64_t v27;
  double *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  if (offerConfirmationGradientView)
  {
    v27 = 0;
    v28 = (double *)&v27;
    v29 = 0x4010000000;
    v30 = &unk_1BBF15257;
    v31 = 0u;
    v32 = 0u;
    -[SKUIGradientView frame](offerConfirmationGradientView, "frame");
    *(_QWORD *)&v31 = v8;
    *((_QWORD *)&v31 + 1) = v9;
    *(_QWORD *)&v32 = v10;
    *((_QWORD *)&v32 + 1) = v11;
    -[SKUIGradientView layer](self->_offerConfirmationGradientView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductLockupCollectionViewCell _frameForSection:](self, "_frameForSection:", a3);
    v15 = v13;
    v17 = v16;
    v18 = v14;
    v20 = v19;
    v21 = v28;
    if (a3)
    {
      v28[4] = v13 + -30.0;
      v21[6] = v14 + 30.0;
      v33[0] = &unk_1E749B540;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 30.0 / (v14 + 30.0));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v22;
      v33[2] = &unk_1E749B528;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    }
    else
    {
      v28[4] = v13;
      v21[6] = v14 + 30.0;
      v34[0] = &unk_1E749B528;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - 30.0 / (v14 + 30.0));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v22;
      v34[2] = &unk_1E749B540;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocations:", v23);

    -[SKUIGradientView superview](self->_offerConfirmationGradientView, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "subviews");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __90__SKUIProductLockupCollectionViewCell__layoutConfirmationGradientRelativeToSection_alpha___block_invoke;
    v26[3] = &unk_1E73A42F0;
    *(double *)&v26[5] = v15;
    v26[6] = v17;
    *(double *)&v26[7] = v18;
    v26[8] = v20;
    v26[4] = &v27;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v26);

    -[SKUIGradientView setAlpha:](self->_offerConfirmationGradientView, "setAlpha:", a4);
    -[SKUIGradientView setFrame:](self->_offerConfirmationGradientView, "setFrame:", v28[4], v28[5], v28[6], v28[7]);

    _Block_object_dispose(&v27, 8);
  }
}

void __90__SKUIProductLockupCollectionViewCell__layoutConfirmationGradientRelativeToSection_alpha___block_invoke(double *a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a2, "frame");
  v4 = v3;
  v6 = v5;
  v7 = a1[5];
  v8 = a1[7];
  v10.origin.x = v7;
  v10.origin.y = v3;
  v10.size.width = v8;
  v10.size.height = v5;
  if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 32), v10))
  {
    v11.origin.x = v7;
    v11.origin.y = v4;
    v11.size.width = v8;
    v11.size.height = v6;
    v9 = CGRectUnion(*(CGRect *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 32), v11);
    *(CGFloat *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 40) = v9.origin.y;
    *(CGFloat *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 56) = v9.size.height;
  }
}

- (void)_prepareOfferConfirmationGradientForView:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  void *v11;
  id v12;
  SKUIGradientView *offerConfirmationGradientView;
  SKUIGradientView *v14;
  SKUIGradientView *v15;
  SKUIGradientView *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];

  v36[3] = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[SKUIProductLockupCollectionViewCell _viewElementForView:](self, "_viewElementForView:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v24);

    objc_msgSend(v23, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__31;
    v34 = __Block_byref_object_dispose__31;
    v35 = 0;
    -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke;
    v27[3] = &unk_1E73A4318;
    v27[4] = self;
    v29 = &v30;
    v9 = v6;
    v28 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);

    for (i = 0; i != 4; ++i)
    {
      -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", qword_1BBED1778[i]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke_2;
      v25[3] = &unk_1E73A4340;
      v25[4] = self;
      v12 = v9;
      v26 = v12;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v25);

    }
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    if (!offerConfirmationGradientView)
    {
      v14 = [SKUIGradientView alloc];
      v15 = -[SKUIGradientView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v16 = self->_offerConfirmationGradientView;
      self->_offerConfirmationGradientView = v15;

      -[SKUIProductLockupCollectionViewCell backgroundColor](self, "backgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGradientView layer](self->_offerConfirmationGradientView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "colorWithAlphaComponent:", 0.0);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v36[0] = objc_msgSend(v19, "CGColor");
      v20 = objc_retainAutorelease(v17);
      v36[1] = objc_msgSend(v20, "CGColor");
      v21 = objc_retainAutorelease(v20);
      v36[2] = objc_msgSend(v21, "CGColor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setColors:", v22);

      objc_msgSend(v18, "setEndPoint:", 1.0, 0.5);
      objc_msgSend(v18, "setStartPoint:", 0.0, 0.5);

      offerConfirmationGradientView = self->_offerConfirmationGradientView;
    }
    objc_msgSend(v12, "insertSubview:belowSubview:", offerConfirmationGradientView, v31[5]);
    -[SKUIProductLockupCollectionViewCell _layoutConfirmationGradientRelativeToSection:alpha:](self, "_layoutConfirmationGradientRelativeToSection:alpha:", v5, 0.0);

    _Block_object_dispose(&v30, 8);
  }

}

void __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v7 = v3;
  if (!v6)
  {
    objc_storeStrong(v5, v3);
    v3 = v7;
  }
  objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:", v3);

}

void __80__SKUIProductLockupCollectionViewCell__prepareOfferConfirmationGradientForView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:", v3);

}

- (CGRect)_stackBottomRightElements:(id)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGFloat MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[12];
  _QWORD v20[4];
  _QWORD v21[4];
  uint64_t v22;
  double *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  CGRect v28;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x4010000000;
  v25 = &unk_1BBF15257;
  v26 = 0u;
  v27 = 0u;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MaxY = CGRectGetMaxY(v28);
  *(CGFloat *)&v26 = x;
  *((CGFloat *)&v26 + 1) = MaxY;
  v27 = 0uLL;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__SKUIProductLockupCollectionViewCell__stackBottomRightElements_inRect___block_invoke;
  v19[3] = &unk_1E73A4368;
  *(CGFloat *)&v19[8] = x;
  *(CGFloat *)&v19[9] = y;
  *(CGFloat *)&v19[10] = width;
  *(CGFloat *)&v19[11] = height;
  v19[4] = self;
  v19[5] = &v22;
  v19[6] = v21;
  v19[7] = v20;
  objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v19);
  v11 = v23[4];
  v12 = v23[5];
  v13 = v23[6];
  v14 = v23[7];
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

void __72__SKUIProductLockupCollectionViewCell__stackBottomRightElements_inRect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect *v14;
  uint64_t v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v16 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 80), 1.79769313e308);
    v17.size.width = v4;
    v17.size.height = v5;
    v17.origin.x = *(double *)(a1 + 64) + *(double *)(a1 + 80) - v4;
    v17.origin.y = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
                 - v5
                 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v18 = CGRectIntegral(v17);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x, y, width, height, v10, v11, v12, v13);
    objc_msgSend(v3, "setFrame:");
    objc_msgSend(v3, "setNeedsLayout");
    v14 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v19 = CGRectUnion(v14[1], v20);
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
      v14 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
      v14[1].origin.x = v19.origin.x;
    }
    else
    {
      v14[1].origin.x = x;
    }
    v14[1].origin.y = y;
    v14[1].size.width = width;
    v14[1].size.height = height;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "bottomPaddingForViewElement:", v16);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v15;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }

}

- (CGRect)_stackElements:(id)a3 alignment:(int64_t)a4 inRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[14];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  uint64_t v25;
  double *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x4010000000;
  v28 = &unk_1BBF15257;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v29 = *MEMORY[0x1E0C9D648];
  v30 = v12;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__SKUIProductLockupCollectionViewCell__stackElements_alignment_inRect___block_invoke;
  v21[3] = &unk_1E73A4390;
  *(CGFloat *)&v21[9] = x;
  *(CGFloat *)&v21[10] = y;
  *(CGFloat *)&v21[11] = width;
  *(CGFloat *)&v21[12] = height;
  v21[4] = self;
  v21[5] = &v25;
  v21[13] = a4;
  v21[6] = v24;
  v21[7] = v22;
  v21[8] = v23;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);
  v13 = v26[4];
  v14 = v26[5];
  v15 = v26[6];
  v16 = v26[7];
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);

  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

void __71__SKUIProductLockupCollectionViewCell__stackElements_alignment_inRect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v25 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "textPropertiesForView:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 88), 1.79769313e308);
    v7 = v6;
    if (v5 >= *(double *)(a1 + 88))
      v9 = *(double *)(a1 + 88);
    else
      v9 = v5;
    v8 = *(double *)(a1 + 80);
    v10 = v8 + CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
    v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v12 = *(double *)(a1 + 72);
    if (*(_QWORD *)(a1 + 104) == 8)
      v12 = CGRectGetMaxX(*(CGRect *)(a1 + 72)) - v9;
    v13 = v10 + v11;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(v4, "desiredOffsetTop");
      v15 = v14;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "topPaddingForViewElement:", v25);
      if (v15 >= v16)
        v16 = v15;
      v17 = v16 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v13 = v13 + fmaxf(roundf(v17), 0.0);
    }
    v26.origin.x = v12;
    v26.origin.y = v13;
    v26.size.width = v9;
    v26.size.height = v7;
    v27 = CGRectIntegral(v26);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    objc_msgSend(v3, "setFrame:");
    v22 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v28 = CGRectUnion(v22[1], v29);
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      v22 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
      v22[1].origin.x = v28.origin.x;
    }
    else
    {
      v22[1].origin.x = x;
    }
    v22[1].origin.y = y;
    v22[1].size.width = width;
    v22[1].size.height = height;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "bottomPaddingForViewElement:", v25);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;
    objc_msgSend(v4, "baselineOffsetFromBottom");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v24;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  }
}

- (void)_updateLayoutToAnimateOfferTransitionForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double x;
  double y;
  double MaxX;
  double v11;
  double v12;
  double v13;
  double v14;
  int ShouldReverseLayoutDirection;
  double v16;
  uint64_t v17;
  void *v18;
  NSMapTable *elementViews;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSMapTable *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  CGFloat *v38;
  uint64_t v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v4 = a3;
  -[SKUIProductLockupCollectionViewCell _viewElementForView:](self, "_viewElementForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    objc_msgSend(v4, "frame");
    x = v41.origin.x;
    y = v41.origin.y;
    MaxX = CGRectGetMaxX(v41);
    objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v12 = v11;
    v14 = v13;
    ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    v16 = MaxX - v12;
    if (ShouldReverseLayoutDirection)
      v16 = x;
    objc_msgSend(v4, "setFrame:", v16, y, v12, v14);
    v17 = 1;
  }
  else
  {
    if (-[SKUIProductLockupLayout bottomLeftLayoutStyle](self->_layout, "bottomLeftLayoutStyle") == 2)
    {
      -[SKUIProductLockupLayout viewElementsForSection:](self->_layout, "viewElementsForSection:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v38 = (CGFloat *)&v37;
      v39 = 0x2020000000;
      v40 = 0;
      elementViews = self->_elementViews;
      objc_msgSend(v18, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](elementViews, "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v23 = v22;

      v40 = v23;
      if (storeShouldReverseLayoutDirection())
      {
        v24 = self->_elementViews;
        objc_msgSend(v18, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](v24, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "frame");
        v38[3] = CGRectGetMaxX(v42);

      }
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __84__SKUIProductLockupCollectionViewCell__updateLayoutToAnimateOfferTransitionForView___block_invoke;
      v34[3] = &unk_1E73A4318;
      v34[4] = self;
      v36 = &v37;
      v35 = v4;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v34);

      _Block_object_dispose(&v37, 8);
    }
    else
    {
      objc_msgSend(v4, "frame");
      v27 = v43.origin.x;
      v28 = v43.origin.y;
      v29 = CGRectGetMaxX(v43);
      objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v31 = v30;
      v33 = v32;
      if (!self->_offerMetadataPosition && !storeShouldReverseLayoutDirection())
        v27 = v29 - v31;
      objc_msgSend(v4, "setFrame:", v27, v28, v31, v33);
    }
    v17 = 0;
  }
  -[SKUIProductLockupCollectionViewCell _layoutConfirmationGradientRelativeToSection:alpha:](self, "_layoutConfirmationGradientRelativeToSection:alpha:", v17, 1.0);

}

void __84__SKUIProductLockupCollectionViewCell__updateLayoutToAnimateOfferTransitionForView___block_invoke(_QWORD *a1, uint64_t a2)
{
  char v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MaxX;
  double v16;
  double v17;
  int ShouldReverseLayoutDirection;
  double v19;
  double v20;
  double v21;
  double v22;
  double MinX;
  double v24;
  void *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(*(id *)(a1[4] + 840), "objectForKey:", a2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "isHidden");
  v4 = v25;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v25, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (storeShouldReverseLayoutDirection())
    {
      v13 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
      v26.origin.x = v6;
      v26.origin.y = v8;
      v26.size.width = v10;
      v26.size.height = v12;
      v14 = v13 - CGRectGetWidth(v26);
    }
    else
    {
      v14 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
    v27.origin.x = v14;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    MaxX = CGRectGetMaxX(v27);
    if (v25 == (void *)a1[5])
    {
      objc_msgSend(v25, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v10 = v16;
      v12 = v17;
    }
    if (storeShouldReverseLayoutDirection())
    {
      v28.origin.x = v14;
      v28.origin.y = v8;
      v28.size.width = v10;
      v28.size.height = v12;
      v14 = MaxX - CGRectGetWidth(v28);
    }
    objc_msgSend(v25, "setFrame:", v14, v8, v10, v12);
    ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    v19 = v14;
    v20 = v8;
    v21 = v10;
    v22 = v12;
    if (ShouldReverseLayoutDirection)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v19);
      v24 = -5.0;
    }
    else
    {
      MinX = CGRectGetMaxX(*(CGRect *)&v19);
      v24 = 5.0;
    }
    v4 = v25;
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = MinX + v24;
  }

}

- (id)_viewElementForView:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_elementViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_elementViews, "objectForKey:", v10, (_QWORD)v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControlControllers, 0);
  objc_storeStrong((id *)&self->_offerViews, 0);
  objc_storeStrong((id *)&self->_offerConfirmationGradientView, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_elementViews, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);
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

+ (void)_requestLayoutForViewElements:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
