@implementation SKUIEditorialCardCollectionViewCell

- (SKUIEditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIEditorialCardCollectionViewCell *v8;
  NSMutableArray *v9;
  NSMutableArray *allLockupViews;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialCardCollectionViewCell initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIEditorialCardCollectionViewCell;
  v8 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allLockupViews = v8->_allLockupViews;
    v8->_allLockupViews = v9;

    -[SKUIViewReuseCollectionViewCell registerClass:forViewWithReuseIdentifier:](v8, "registerClass:forViewWithReuseIdentifier:", objc_opt_class(), CFSTR("editorialCardLockup"));
  }
  return v8;
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double result;

  +[SKUIVerticalLockupView maximumPerspectiveHeightForSize:](SKUIVerticalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  SKUIVerticalLockupView *primaryLockupView;
  id v4;

  primaryLockupView = self->_primaryLockupView;
  v4 = a3;
  -[SKUIVerticalLockupView setPerspectiveTargetView:](primaryLockupView, "setPerspectiveTargetView:", v4);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[SKUIVerticalLockupView setVanishingPoint:](self->_primaryLockupView, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SKUIVerticalLockupView updateForChangedDistanceFromVanishingPoint](self->_primaryLockupView, "updateForChangedDistanceFromVanishingPoint");
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
  v11[2] = __86__SKUIEditorialCardCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_1E73A1208;
  v14 = a4;
  v9 = v8;
  v12 = v9;
  v13 = &v15;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

void __86__SKUIEditorialCardCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(_QWORD *a1, void *a2)
{
  BOOL v3;
  uint64_t v4;
  char v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 66)
  {
    v3 = +[SKUIVerticalLockupView prefetchResourcesForViewElement:reason:context:](SKUIVerticalLockupView, "prefetchResourcesForViewElement:reason:context:", v6, a1[6], a1[4]);
    v4 = *(_QWORD *)(a1[5] + 8);
    if (*(_BYTE *)(v4 + 24))
      v5 = 1;
    else
      v5 = v3;
    *(_BYTE *)(v4 + 24) = v5;
  }

}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  SKUIEditorialCardLayout *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;

  v7 = a5;
  v8 = a3;
  v15 = -[SKUIEditorialCardLayout initWithCard:width:context:]([SKUIEditorialCardLayout alloc], "initWithCard:width:context:", v8, v7, a4);

  -[SKUIEditorialCardLayout primaryLockup](v15, "primaryLockup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SKUIEditorialCardLayout primaryLockupSize](v15, "primaryLockupSize");
    +[SKUIVerticalLockupView requestLayoutForViewElement:width:context:](SKUIVerticalLockupView, "requestLayoutForViewElement:width:context:", v9, v7);
  }
  -[SKUIEditorialCardLayout secondaryLockupWidth](v15, "secondaryLockupWidth", v15);
  v11 = v10;
  objc_msgSend(v16, "allLockups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__SKUIEditorialCardCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v17[3] = &unk_1E73A5D98;
  v20 = v11;
  v18 = v9;
  v19 = v7;
  v13 = v7;
  v14 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

}

uint64_t __81__SKUIEditorialCardCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    return +[SKUIVerticalLockupView requestLayoutForViewElement:width:context:](SKUIVerticalLockupView, "requestLayoutForViewElement:width:context:", a2, *(_QWORD *)(result + 40), *(double *)(result + 48));
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  SKUIEditorialCardLayout *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  void *v29;
  double v30;
  uint64_t v31;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x3010000000;
  v29 = &unk_1BBF15257;
  v30 = a3;
  v31 = 0;
  v9 = -[SKUIEditorialCardLayout initWithCard:width:context:]([SKUIEditorialCardLayout alloc], "initWithCard:width:context:", v7, v8, a3);
  -[SKUIEditorialCardLayout primaryLockup](v9, "primaryLockup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SKUIEditorialCardLayout primaryLockupSize](v9, "primaryLockupSize");
    *((_QWORD *)v27 + 5) = v11;
  }
  -[SKUIEditorialCardLayout secondaryLockupWidth](v9, "secondaryLockupWidth");
  v13 = v12;
  -[SKUIEditorialCardLayout allLockups](v9, "allLockups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__SKUIEditorialCardCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v21[3] = &unk_1E73A5DC0;
  v15 = v10;
  v22 = v15;
  v25 = v13;
  v16 = v8;
  v23 = v16;
  v24 = &v26;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

  v17 = v27[4];
  v18 = v27[5];

  _Block_object_dispose(&v26, 8);
  v19 = v17;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

uint64_t __77__SKUIEditorialCardCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  double v5;

  if (*(_QWORD *)(result + 32) != a2)
  {
    v2 = result;
    result = +[SKUIVerticalLockupView sizeThatFitsWidth:viewElement:context:](SKUIVerticalLockupView, "sizeThatFitsWidth:viewElement:context:", a2, *(_QWORD *)(v2 + 40), *(double *)(v2 + 56));
    v4 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8);
    v5 = *(double *)(v4 + 40);
    if (v5 < v3)
      v5 = v3;
    *(double *)(v4 + 40) = v5;
  }
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  SKUIEditorialCardLayout *v10;
  SKUIVerticalLockupView *primaryLockupView;
  CGFloat v12;
  CGFloat v13;
  SKUIEditorialCardLayout *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  SKUIEditorialCardLayout *v22;
  id v23;
  SKUIEditorialCardCollectionViewCell *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a5;
  v10 = -[SKUIEditorialCardLayout initWithCard:width:context:]([SKUIEditorialCardLayout alloc], "initWithCard:width:context:", v8, v9, a4);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__51;
  v30 = __Block_byref_object_dispose__51;
  v31 = 0;
  -[NSMutableArray removeAllObjects](self->_allLockupViews, "removeAllObjects");
  primaryLockupView = self->_primaryLockupView;
  self->_primaryLockupView = 0;

  -[SKUIEditorialCardLayout primaryLockupSize](v10, "primaryLockupSize");
  self->_primaryLockupSize.width = v12;
  self->_primaryLockupSize.height = v13;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __75__SKUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v21 = &unk_1E73A5E10;
  v14 = v10;
  v22 = v14;
  v15 = v9;
  v23 = v15;
  v24 = self;
  v25 = &v26;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", &v18);
  v16 = (void *)v27[5];
  if (v16)
  {
    objc_msgSend(v16, "superview", v18, v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bringSubviewToFront:", v27[5]);

  }
  _Block_object_dispose(&v26, 8);

}

void __75__SKUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "primaryLockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secondaryLockupWidth");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "allLockups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__SKUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v10[3] = &unk_1E73A5DE8;
  v11 = v3;
  v12 = v4;
  v15 = v6;
  v13 = *(id *)(a1 + 40);
  v14 = *(_OWORD *)(a1 + 48);
  v8 = v4;
  v9 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

void __75__SKUIEditorialCardCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addReusableViewWithReuseIdentifier:", CFSTR("editorialCardLockup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSizingStyle:", 0);
  if (*(id *)(a1 + 40) == v5)
  {
    objc_msgSend(v3, "reloadWithViewElement:width:context:", *(double *)(*(_QWORD *)(a1 + 56) + 840));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 832), v3);
  }
  else
  {
    objc_msgSend(v3, "reloadWithViewElement:width:context:", *(double *)(a1 + 72));
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(v5, "firstChildForElementType:", 13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v3);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 824), "addObject:", v3);

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_allLockupViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v11);
        v14 |= objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setImage:forArtworkRequest:context:", v8, v9, v10, (_QWORD)v18);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_allLockupViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v10);
        v13 |= objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "updateWithItemState:context:animated:", v8, v9, v5, (_QWORD)v17);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13 & 1;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_allLockupViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "viewForElementIdentifier:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v23;
  float v24;
  double v25;
  double v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  float v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  SKUIVerticalLockupView *v37;
  CGFloat width;
  CGFloat height;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;

  v51 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)SKUIEditorialCardCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v49, sel_layoutSubviews);
  v3 = -[NSMutableArray count](self->_allLockupViews, "count");
  v4 = v3 - 1;
  if (v3 >= 1)
  {
    v5 = v3;
    -[SKUIEditorialCardCollectionViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[SKUIViewReuseCollectionViewCell contentInset](self, "contentInset");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v12 - (v17 + v21);

    v23 = (double)v4;
    v24 = v22 - (double)v4 * 15.0;
    v25 = floorf(v24);
    if (self->_primaryLockupView)
      v25 = v25 - self->_primaryLockupSize.width;
    else
      v23 = (double)v5;
    v26 = v25 / v23;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v27 = self->_allLockupViews;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v28)
    {
      v29 = v28;
      v30 = v8 + v18;
      v31 = v10 + v16;
      v32 = v14 - (v16 + v20);
      v33 = v26;
      v34 = floorf(v33);
      v35 = *(_QWORD *)v46;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(v27);
          v37 = *(SKUIVerticalLockupView **)(*((_QWORD *)&v45 + 1) + 8 * v36);
          width = v34;
          height = v32;
          if (v37 == self->_primaryLockupView)
          {
            width = self->_primaryLockupSize.width;
            height = self->_primaryLockupSize.height;
          }
          -[SKUIEditorialCardCollectionViewCell contentView](self, "contentView", (_QWORD)v45);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bounds");
          SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v30, v31, width, height, v41, v42, v43, v44);
          -[SKUIVerticalLockupView setFrame:](v37, "setFrame:");

          v52.origin.x = v30;
          v52.origin.y = v31;
          v52.size.width = width;
          v52.size.height = height;
          v30 = CGRectGetMaxX(v52) + 15.0;
          ++v36;
        }
        while (v29 != v36);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v29);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLockupView, 0);
  objc_storeStrong((id *)&self->_allLockupViews, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorialCardCollectionViewCell initWithFrame:]";
}

@end
