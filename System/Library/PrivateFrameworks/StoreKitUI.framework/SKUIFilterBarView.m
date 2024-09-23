@implementation SKUIFilterBarView

- (SKUIFilterBarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIFilterBarView *v8;
  NSMutableArray *v9;
  NSMutableArray *centerElementViews;
  NSMutableArray *v11;
  NSMutableArray *leftElementViews;
  NSMutableArray *v13;
  NSMutableArray *rightElementViews;
  uint64_t v15;
  NSMapTable *viewElementViews;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFilterBarView initWithFrame:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIFilterBarView;
  v8 = -[SKUIViewReuseView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    centerElementViews = v8->_centerElementViews;
    v8->_centerElementViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leftElementViews = v8->_leftElementViews;
    v8->_leftElementViews = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rightElementViews = v8->_rightElementViews;
    v8->_rightElementViews = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    viewElementViews = v8->_viewElementViews;
    v8->_viewElementViews = (NSMapTable *)v15;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIFilterBarView;
  -[SKUIViewReuseView dealloc](&v3, sel_dealloc);
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__SKUIFilterBarView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_1E73A1208;
  v9 = v8;
  v13 = &v15;
  v14 = a4;
  v12 = v9;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __68__SKUIFilterBarView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;
  id v17;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__SKUIFilterBarView_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_1E73A2CA0;
  v16 = a4;
  v17 = a1;
  v14 = v10;
  v15 = v8;
  v11 = v8;
  v12 = v10;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v13);

}

void __63__SKUIFilterBarView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "elementType");
  if (v3 > 68)
  {
    if (v3 == 69)
    {
      objc_msgSend(v7, "titleItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "_attributedStringForMenuItem:context:", v5, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForViewElement:attributedString:width:", v5, v6, (uint64_t)*(double *)(a1 + 48));

      goto LABEL_11;
    }
    v4 = v7;
    if (v3 == 138)
    {
      objc_msgSend(*(id *)(a1 + 56), "_attributedStringForLabel:context:", v7, *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestLayoutForLabel:attributedString:width:", v7, v5, (uint64_t)*(double *)(a1 + 48));
      goto LABEL_11;
    }
    if (v3 != 141)
      goto LABEL_14;
LABEL_8:
    objc_msgSend(*(id *)(a1 + 56), "_attributedStringForButton:context:", v7, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "requestLayoutForButton:attributedString:width:", v7, v5, (uint64_t)*(double *)(a1 + 48));
LABEL_11:

LABEL_13:
    v4 = v7;
    goto LABEL_14;
  }
  if (v3 == 8)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestLayoutForBadge:width:", v7, (uint64_t)*(double *)(a1 + 48));
    goto LABEL_13;
  }
  v4 = v7;
  if (v3 == 12)
    goto LABEL_8;
LABEL_14:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  double v22;
  uint64_t v23;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v21 = &unk_1BBF15257;
  v22 = a3;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__SKUIFilterBarView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v14[3] = &unk_1E73A1208;
  v9 = v8;
  v17 = a3;
  v15 = v9;
  v16 = &v18;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v14);
  v10 = v19[4];
  if (v19[5] >= 29.0)
    v11 = v19[5];
  else
    v11 = 29.0;
  v19[5] = v11;

  _Block_object_dispose(&v18, 8);
  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

uint64_t __59__SKUIFilterBarView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;
  double v6;

  result = objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", a2, *(double *)(a1 + 48));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(double *)(v5 + 40);
  if (v6 < v4)
    v6 = v4;
  *(double *)(v5 + 40) = v6;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  SKUIDividerView *bottomDividerView;
  NSMutableArray *elementControllers;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  -[NSMutableArray removeAllObjects](self->_centerElementViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_leftElementViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_rightElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  bottomDividerView = self->_bottomDividerView;
  self->_bottomDividerView = 0;

  elementControllers = self->_elementControllers;
  self->_elementControllers = 0;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SKUIFilterBarView_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_1E73A1230;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v14);

}

void __57__SKUIFilterBarView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SKUISegmentedControlViewElementController *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  SKUISearchBarController *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t j;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v41[0] = *(id *)(*(_QWORD *)(a1 + 32) + 496);
  v41[1] = *(id *)(*(_QWORD *)(a1 + 32) + 440);
  v4 = 0;
  v41[2] = *(id *)(*(_QWORD *)(a1 + 32) + 512);
  do
  {
    objc_msgSend(*(id *)(a1 + 40), "childViewElementsForAlignment:", qword_1BBED1218[v4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (!v6)
      goto LABEL_44;
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "elementType");
        if (v11 <= 68)
        {
          if (v11 > 12)
          {
            if (v11 == 13)
              goto LABEL_29;
            if (v11 != 49)
            {
              if (v11 != 50)
                continue;
              goto LABEL_27;
            }
            objc_msgSend(v3, "addImageViewWithElement:context:", v10, *(_QWORD *)(a1 + 48));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "tapRecognizer");
            v23 = (SKUISearchBarController *)objc_claimAutoreleasedReturnValue();
            -[SKUISearchBarController addTarget:action:](v23, "addTarget:action:", *(_QWORD *)(a1 + 32), sel__imageTapAction_);
            goto LABEL_37;
          }
          if (v11 != 8)
          {
            if (v11 != 12)
              continue;
LABEL_27:
            objc_msgSend(v3, "addButtonWithElement:width:context:", v10, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), 0, 0xFFFFFFFFLL);
            objc_msgSend(v13, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 64);
            if (v13)
              goto LABEL_41;
            continue;
          }
          objc_msgSend(v3, "addBadgeViewWithElement:width:context:", v10, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
          v21 = objc_claimAutoreleasedReturnValue();
LABEL_40:
          v13 = (void *)v21;
          if (!v21)
            continue;
LABEL_41:
          objc_msgSend((id)v41[v4], "addObject:", v13);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setObject:forKey:", v10, v13);

          continue;
        }
        if (v11 > 137)
        {
          switch(v11)
          {
            case 138:
              objc_msgSend(v3, "addLabelViewWithElement:width:context:", v10, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
              v21 = objc_claimAutoreleasedReturnValue();
              break;
            case 141:
LABEL_29:
              objc_msgSend(v3, "addButtonWithElement:width:context:", v10, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 0x20000);
              objc_msgSend(v13, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__cancelConfirmationAction_, 0x10000);
              objc_msgSend(v13, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__showConfirmationAction_, 0x40000);
              LODWORD(v22) = -0.5;
              objc_msgSend(v13, "setCharge:", v22);
              objc_msgSend(v13, "setItemOfferDelegate:", *(_QWORD *)(a1 + 32));
              if (v13)
                goto LABEL_41;
              continue;
            case 152:
              objc_msgSend(v3, "addImageViewWithVideoElement:context:", v10, *(_QWORD *)(a1 + 48));
              v21 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              continue;
          }
          goto LABEL_40;
        }
        switch(v11)
        {
          case 'E':
            objc_msgSend(v10, "titleItem");
            v23 = (SKUISearchBarController *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addMenuButtonWithTitleItem:width:context:", v23, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), 0, 0xFFFFFFFFLL);
            objc_msgSend(v13, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__menuButtonAction_, 64);
            goto LABEL_37;
          case 'j':
            v23 = -[SKUISearchBarController initWithSearchBarViewElement:]([SKUISearchBarController alloc], "initWithSearchBarViewElement:", v10);
            objc_msgSend(*(id *)(a1 + 48), "clientContext");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUISearchBarController setClientContext:](v23, "setClientContext:", v24);

            objc_msgSend(*(id *)(a1 + 48), "parentViewController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUISearchBarController setParentViewController:](v23, "setParentViewController:", v25);

            v26 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
            if (!v26)
            {
              v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v28 = *(_QWORD *)(a1 + 32);
              v29 = *(void **)(v28 + 480);
              *(_QWORD *)(v28 + 480) = v27;

              v26 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
            }
            objc_msgSend(v26, "addObject:", v23);
            -[SKUISearchBarController searchBar](v23, "searchBar");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addView:", v13);
LABEL_37:

            if (v13)
              goto LABEL_41;
            continue;
          case 'm':
            v12 = v4;
            objc_msgSend(v3, "addReusableViewWithReuseIdentifier:", 0x1E73B0ED0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[SKUISegmentedControlViewElementController initWithViewElement:segmentedControl:]([SKUISegmentedControlViewElementController alloc], "initWithViewElement:segmentedControl:", v10, v13);
            objc_msgSend(*(id *)(a1 + 48), "clientContext");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUISegmentedControlViewElementController setClientContext:](v14, "setClientContext:", v15);

            objc_msgSend(*(id *)(a1 + 48), "parentViewController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUISegmentedControlViewElementController setParentViewController:](v14, "setParentViewController:", v16);

            v17 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
            if (!v17)
            {
              v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v19 = *(_QWORD *)(a1 + 32);
              v20 = *(void **)(v19 + 480);
              *(_QWORD *)(v19 + 480) = v18;

              v17 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
            }
            objc_msgSend(v17, "addObject:", v14);

            v4 = v12;
            if (v13)
              goto LABEL_41;
            break;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v7);
LABEL_44:

    ++v4;
  }
  while (v4 != 3);
  objc_msgSend(*(id *)(a1 + 40), "bottomDivider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v3, "addDividerWithElement:context:", v30, *(_QWORD *)(a1 + 48));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(v32 + 432);
    *(_QWORD *)(v32 + 432) = v31;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setDividerOrientation:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setDividerSize:", 0.0);
  }

  for (j = 2; j != -1; --j)
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[SKUIFilterBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double right;
  double j;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  double left;
  double v33;
  double v34;
  double v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  double v43;
  double v44;
  CGFloat v45;
  float v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  uint64_t m;
  double v53;
  SKUIFilterBarView *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  double v71;
  double v72;
  double v73;
  _QWORD v74[5];
  CGRect v75;

  v74[3] = *MEMORY[0x1E0C80C00];
  -[SKUIFilterBarView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v74[0] = self->_leftElementViews;
  v74[1] = self->_centerElementViews;
  v54 = self;
  v7 = 0;
  v8 = 0;
  v74[2] = self->_rightElementViews;
  v71 = 0.0;
  v72 = 0.0;
  v73 = 0.0;
  v9 = 0.0;
  do
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v10 = (id)v74[v8];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v66 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v15, "frame");
          v17 = v16;
          v19 = v18;
          objc_msgSend(v15, "sizeThatFits:", v4, v6);
          v21 = v20;
          objc_msgSend(v15, "setFrame:", v17, v19, v20, v22);
          *(&v71 + v8) = v21 + *(&v71 + v8);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v12);
    }

    v23 = objc_msgSend(v10, "count");
    if (v23 > 0)
      ++v7;
    if (v23 <= 1)
    {
      v24 = *(&v71 + v8);
    }
    else
    {
      v24 = *(&v71 + v8) + (float)((float)(v23 - 1) * 9.0);
      *(&v71 + v8) = v24;
    }
    v9 = v9 + v24;
    ++v8;
  }
  while (v8 != 3);
  if (v7 > 1)
    v9 = v9 + (float)((float)(uint64_t)(v7 - 1) * 9.0);
  right = v54->_contentInset.right;
  for (j = v4 - v54->_contentInset.left - right; v9 > j; v9 = v9 + -5.0)
  {
    v27 = 0;
    v28 = 0.0;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (*(&v71 + v27) > v28)
      {
        v28 = *(&v71 + v27);
        v29 = v27;
      }
      ++v27;
    }
    while (v27 != 3);
    *(&v71 + v29) = *(&v71 + v29) + -5.0;
  }
  v30 = 0;
  v59 = v73;
  v53 = v4;
  v31 = (v4 - v72) * 0.5;
  v57 = floorf(v31);
  v58 = v71;
  v60 = v4 - right - v73;
  v55 = v60 - v72 + -9.0;
  v56 = v60 - v72;
  do
  {
    left = v60;
    if (v30 != 2)
    {
      if (v30 == 1)
      {
        v33 = v58 + v54->_contentInset.left;
        if (v58 > 0.00000011920929)
          v33 = v33 + 9.0;
        if (v33 < v57)
          v33 = v57;
        if (v59 <= 0.00000011920929)
          v34 = v56;
        else
          v34 = v55;
        if (v33 >= v34)
          left = v34;
        else
          left = v33;
      }
      else if (v30)
      {
        left = 0.0;
      }
      else
      {
        left = v54->_contentInset.left;
      }
    }
    v35 = *(&v71 + v30);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v36 = (id)v74[v30];
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v37)
    {
      v38 = v37;
      v39 = left + v35;
      v40 = *(_QWORD *)v62;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v62 != v40)
            objc_enumerationMutation(v36);
          v42 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
          objc_msgSend(v42, "frame", *(_QWORD *)&v53);
          v45 = v44;
          v46 = (v6 - v44) * 0.5;
          v47 = floorf(v46);
          if (v43 >= v39 - left)
            v48 = v39 - left;
          else
            v48 = v43;
          objc_msgSend(v42, "setFrame:", left, v47, v48);
          objc_msgSend(v42, "setHidden:", left > v39);
          v75.origin.x = left;
          v75.origin.y = v47;
          v75.size.width = v48;
          v75.size.height = v45;
          left = CGRectGetMaxX(v75) + 9.0;
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v38);
    }

    ++v30;
  }
  while (v30 != 3);
  if (v54->_bottomDividerView)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "scale");
    v51 = 1.0 / v50;

    -[SKUIDividerView setFrame:](v54->_bottomDividerView, "setFrame:", 0.0, v6 - v51, v53, v51);
  }
  for (m = 2; m != -1; --m)

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGSize result;

  width = a3.width;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_viewElementViews;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 29.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "sizeThatFits:", width, v8, (_QWORD)v13);
        if (v8 < v10)
          v8 = v10;
      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 29.0;
  }

  v11 = width;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  double x;
  double y;
  double width;
  double MaxX;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  int v14;
  id v15;
  CGRect v16;

  v15 = a3;
  objc_msgSend(v15, "frame");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  MaxX = CGRectGetMaxX(v16);
  objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v9 = v8;
  v11 = v10;
  if (-[NSMutableArray containsObject:](self->_centerElementViews, "containsObject:", v15))
  {
    v12 = (v9 - width) * 0.5;
    v13 = x - floorf(v12);
  }
  else
  {
    v14 = -[NSMutableArray containsObject:](self->_rightElementViews, "containsObject:", v15);
    v13 = MaxX - v9;
    if (!v14)
      v13 = x;
  }
  objc_msgSend(v15, "setFrame:", v13, y, v9, v11);

}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  BOOL v6;
  void *v7;
  id v8;

  if (self->_focusedMenuButton)
  {
    -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) == 0;
    v7 = v8;
    if (v6)
      v7 = 0;
    objc_msgSend(v7, "dispatchEventOfType:forItemAtIndex:", 2, a4);
    -[SKUIFilterBarView _destroyMenuPopover](self, "_destroyMenuPopover");

  }
}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  -[UIControl frame](self->_focusedMenuButton, "frame", a3, a4, a5);
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

- (void)_buttonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SKUICollectionViewCellForView(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SKUICollectionViewForView(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_viewElementViews;
  v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (*(id *)(*((_QWORD *)&v15 + 1) + 8 * i) == v4)
        {
          -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v4, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "indexPathForCell:", v5);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v6, v13, 0, v14);

          }
          else
          {
            objc_msgSend(v13, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
          }

          goto LABEL_14;
        }
      }
      v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4;

  v4 = a3;
  -[SKUIFilterBarView bringSubviewToFront:](self, "bringSubviewToFront:", v4);
  objc_msgSend(v4, "setShowingConfirmation:animated:", 0, 1);

}

- (void)_imageTapAction:(id)a3
{
  NSMapTable *viewElementViews;
  void *v4;
  id v5;

  viewElementViews = self->_viewElementViews;
  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](viewElementViews, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

- (void)_menuButtonAction:(id)a3
{
  SKUIMenuPopoverController *popoverController;
  UIControl *focusedMenuButton;
  SKUIMenuPopoverController *v7;
  void *v8;
  UIControl **p_focusedMenuButton;
  SKUIMenuPopoverController *v10;
  void *v11;
  SKUIMenuPopoverController *v12;
  SKUIMenuPopoverController *v13;
  SKUIMenuPopoverController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v24 = a3;
  popoverController = self->_popoverController;
  if (popoverController)
  {
    -[SKUIMenuPopoverController setDelegate:](popoverController, "setDelegate:", 0);
    -[SKUIMenuPopoverController dismissAnimated:](self->_popoverController, "dismissAnimated:", 1);
    focusedMenuButton = self->_focusedMenuButton;
    self->_focusedMenuButton = 0;

    v7 = self->_popoverController;
    self->_popoverController = 0;

  }
  -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    p_focusedMenuButton = &self->_focusedMenuButton;
    objc_storeStrong((id *)&self->_focusedMenuButton, a3);
    v10 = [SKUIMenuPopoverController alloc];
    objc_msgSend(v8, "menuItemTitles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SKUIMenuPopoverController initWithMenuTitles:selectedIndex:](v10, "initWithMenuTitles:selectedIndex:", v11, objc_msgSend(v8, "selectedItemIndex"));
    v13 = self->_popoverController;
    self->_popoverController = v12;

    -[SKUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    v14 = self->_popoverController;
    -[UIControl frame](*p_focusedMenuButton, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[UIControl superview](*p_focusedMenuButton, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v14, "presentFromRect:inView:permittedArrowDirections:animated:", v23, 15, 1, v16, v18, v20, v22);

  }
}

- (void)_showConfirmationAction:(id)a3
{
  id v4;

  v4 = a3;
  -[SKUIFilterBarView bringSubviewToFront:](self, "bringSubviewToFront:", v4);
  objc_msgSend(v4, "setShowingConfirmation:animated:", 1, 1);

}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonTitleStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "_attributedStringForButtonText:style:context:", v8, v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_attributedStringForButtonText:style:context:", v8, v11, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)_attributedStringForButtonText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  SKUIViewElementFontWithStyle(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "attributedStringWithDefaultFont:foregroundColor:style:", v10, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_attributedStringForButtonText:style:context:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_destroyMenuPopover
{
  UIControl *focusedMenuButton;
  SKUIMenuPopoverController *popoverController;

  -[SKUIMenuPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  focusedMenuButton = self->_focusedMenuButton;
  self->_focusedMenuButton = 0;

  popoverController = self->_popoverController;
  self->_popoverController = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_rightElementViews, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_leftElementViews, 0);
  objc_storeStrong((id *)&self->_focusedMenuButton, 0);
  objc_storeStrong((id *)&self->_elementControllers, 0);
  objc_storeStrong((id *)&self->_centerElementViews, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFilterBarView initWithFrame:]";
}

@end
