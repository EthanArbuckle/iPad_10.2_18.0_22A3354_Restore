@implementation SKUICardViewElementCollectionViewCell

- (SKUICardViewElementCollectionViewCell)initWithFrame:(CGRect)a3
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
  SKUICardViewElementCollectionViewCell *v16;
  uint64_t v17;
  NSMapTable *viewElements;
  objc_super v20;

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
        -[SKUICardViewElementCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUICardViewElementCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElements = v16->_viewElements;
    v16->_viewElements = (NSMapTable *)v17;

  }
  return v16;
}

+ (CGSize)artworkBoundingSizeWithViewElement:(id)a3 width:(double)a4 context:(id)a5
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
  __int128 v22;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x3010000000;
  v21 = &unk_1BBF15257;
  v22 = *MEMORY[0x1E0C9D820];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__SKUICardViewElementCollectionViewCell_artworkBoundingSizeWithViewElement_width_context___block_invoke;
  v14[3] = &unk_1E73A40C0;
  v16 = &v18;
  v9 = v8;
  v15 = v9;
  v17 = a4;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v14);
  v10 = v19[4];
  v11 = v19[5];

  _Block_object_dispose(&v18, 8);
  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __90__SKUICardViewElementCollectionViewCell_artworkBoundingSizeWithViewElement_width_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(v10, "elementType");
  switch(v5)
  {
    case 152:
      goto LABEL_4;
    case 62:
      +[SKUIHorizontalListView preferredSizeForViewElement:context:](SKUIHorizontalListView, "preferredSizeForViewElement:context:", v10, *(_QWORD *)(a1 + 32));
      if (v6 != *MEMORY[0x1E0C9D820] || v7 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        goto LABEL_9;
      break;
    case 49:
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v10, *(double *)(a1 + 48));
LABEL_9:
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(double *)(v9 + 32) = v6;
      *(double *)(v9 + 40) = v7;
      *a3 = 1;
      break;
  }

}

- (void)setArtworkBoundingSize:(id)a3
{
  SKUISizeValue *v4;
  SKUISizeValue *artworkBoundingSize;
  BOOL v6;
  SKUISizeValue *v7;
  SKUISizeValue *v8;
  SKUISizeValue *v9;

  v4 = (SKUISizeValue *)a3;
  artworkBoundingSize = self->_artworkBoundingSize;
  if (artworkBoundingSize != v4)
  {
    v9 = v4;
    v6 = -[SKUISizeValue isEqual:](artworkBoundingSize, "isEqual:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (SKUISizeValue *)-[SKUISizeValue copy](v9, "copy");
      v8 = self->_artworkBoundingSize;
      self->_artworkBoundingSize = v7;

      -[SKUICardViewElementCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
      v4 = v9;
    }
  }

}

- (UIView)adCardBackgroundView
{
  UIView *adCardBackgroundView;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  adCardBackgroundView = self->_adCardBackgroundView;
  if (!adCardBackgroundView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_adCardBackgroundView;
    self->_adCardBackgroundView = v4;

    -[UIView layer](self->_adCardBackgroundView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 5.0);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = 1.0 / v8;
    -[UIView layer](self->_adCardBackgroundView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderWidth:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", 0.57292, 0.06531, 0.96078, 1.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    -[UIView layer](self->_adCardBackgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderColor:", v12);

    adCardBackgroundView = self->_adCardBackgroundView;
  }
  return adCardBackgroundView;
}

- (CALayer)compactAdCardHairlineLayer
{
  CALayer *compactAdCardHairlineLayer;
  CALayer *v4;
  CALayer *v5;
  id v6;

  compactAdCardHairlineLayer = self->_compactAdCardHairlineLayer;
  if (!compactAdCardHairlineLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_compactAdCardHairlineLayer;
    self->_compactAdCardHairlineLayer = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", 0.57292, 0.06531, 0.96078, 1.0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_compactAdCardHairlineLayer, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

    compactAdCardHairlineLayer = self->_compactAdCardHairlineLayer;
  }
  return compactAdCardHairlineLayer;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v8 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = objc_msgSend(v7, "cardType") == 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__SKUICardViewElementCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
  v12[3] = &unk_1E73A4870;
  v15 = a4;
  v10 = v8;
  v16 = v9;
  v13 = v10;
  v14 = &v17;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v12);
  LOBYTE(v8) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

void __88__SKUICardViewElementCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "elementType");
  if (v3 == 49)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v8 = v13;
      LODWORD(v9) = 1045220557;
      objc_msgSend(v8, "setLayerShadowOpacity:", v9);
      objc_msgSend(v8, "setLayerShadowRadius:", 10.0);
      objc_msgSend(v8, "setLayerShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

      v10 = v13;
      v4 = 0;
      goto LABEL_12;
    }
    v4 = 0;
  }
  else if (v3 == 66)
  {
    v4 = +[SKUIHorizontalLockupView prefetchResourcesForViewElement:reason:context:](SKUIHorizontalLockupView, "prefetchResourcesForViewElement:reason:context:", v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v13, "firstChildForElementType:", 49);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      if (v5)
      {
        LODWORD(v6) = 1045220557;
        objc_msgSend(v5, "setLayerShadowOpacity:", v6);
        objc_msgSend(v7, "setLayerShadowRadius:", 10.0);
        objc_msgSend(v7, "setLayerShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      }

    }
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", v13, *(_QWORD *)(a1 + 48));
  }
  v10 = v13;
LABEL_12:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v11 + 24))
    v12 = 1;
  else
    v12 = v4;
  *(_BYTE *)(v11 + 24) = v12;

}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  CGSize result;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWidth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  if (v11 <= 0.00000011921)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__SKUICardViewElementCollectionViewCell_preferredSizeForViewElement_context___block_invoke;
    v19[3] = &unk_1E73A1208;
    v20 = v7;
    v21 = &v23;
    v22 = a1;
    objc_msgSend(v6, "enumerateChildrenUsingBlock:", v19);

    v12 = v24[3];
  }
  else
  {
    v12 = v11;
    v24[3] = v11;
  }
  if (v12 <= 0.00000011920929)
    objc_msgSend(v7, "defaultItemWidthForViewElement:", v6);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v6, v7);
  v14 = v13;
  v16 = v15;
  _Block_object_dispose(&v23, 8);

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

void __77__SKUICardViewElementCollectionViewCell_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "elementType");
  if (v3 > 65)
  {
    if (v3 == 66)
    {
      v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 48), "_defaultWidthForLockupWithContext:", *(_QWORD *)(a1 + 32));
      if (v11 >= v4)
        v4 = v11;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      goto LABEL_22;
    }
    if (v3 == 152)
    {
      objc_msgSend(v12, "thumbnailImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v7);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(double *)(v9 + 24) >= v8)
        v8 = *(double *)(v9 + 24);
      *(double *)(v9 + 24) = v8;

    }
  }
  else
  {
    if (v3 == 49)
    {
      objc_msgSend(*(id *)(a1 + 32), "sizeForImageElement:", v12);
LABEL_16:
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(double *)(v10 + 24) >= v4)
        v4 = *(double *)(v10 + 24);
LABEL_22:
      *(double *)(v10 + 24) = v4;
      goto LABEL_23;
    }
    if (v3 == 62)
    {
      +[SKUIHorizontalListView preferredSizeForViewElement:context:](SKUIHorizontalListView, "preferredSizeForViewElement:context:", v12, *(_QWORD *)(a1 + 32));
      if (v4 != *MEMORY[0x1E0C9D820] || v5 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        goto LABEL_16;
    }
  }
LABEL_23:

}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  double v19;

  v7 = a5;
  v8 = a3;
  +[SKUICardLayout layoutWithCardViewElement:context:](SKUICardLayout, "layoutWithCardViewElement:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "horizontalContentInset");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__SKUICardViewElementCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v15[3] = &unk_1E73A4898;
  v16 = v9;
  v17 = v10;
  v19 = a4 + v11 * -2.0;
  v18 = v7;
  v12 = v7;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v15);

}

void __83__SKUICardViewElementCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "elementType");
  if (v3 > 61)
  {
    if (v3 > 130)
    {
      if (v3 != 131)
      {
        v4 = v3 == 138;
        v5 = v8;
        if (!v4)
          goto LABEL_27;
        objc_msgSend(*(id *)(a1 + 32), "attributedStringForLabel:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "requestLayoutForLabel:attributedString:width:", v8, v6, (uint64_t)*(double *)(a1 + 56));
        goto LABEL_20;
      }
      v7 = SKUIStackListCollectionViewCell;
    }
    else if (v3 == 62)
    {
      v7 = SKUIHorizontalListView;
    }
    else
    {
      v4 = v3 == 66;
      v5 = v8;
      if (!v4)
        goto LABEL_27;
      v7 = SKUIHorizontalLockupView;
    }
LABEL_25:
    -[__objc2_class requestLayoutForViewElement:width:context:](v7, "requestLayoutForViewElement:width:context:", v8, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    goto LABEL_26;
  }
  if (v3 > 47)
  {
    if (v3 == 48)
    {
      v7 = SKUISectionHeaderView;
    }
    else
    {
      v4 = v3 == 51;
      v5 = v8;
      if (!v4)
        goto LABEL_27;
      v7 = SKUIImageDeckView;
    }
    goto LABEL_25;
  }
  if (v3 == 8)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestLayoutForBadge:width:", v8, (uint64_t)*(double *)(a1 + 56));
    goto LABEL_26;
  }
  v4 = v3 == 12;
  v5 = v8;
  if (!v4)
    goto LABEL_27;
  objc_msgSend(*(id *)(a1 + 32), "attributedStringForButton:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requestLayoutForButton:attributedString:width:", v8, v6, (uint64_t)*(double *)(a1 + 56));
LABEL_20:

LABEL_26:
  v5 = v8;
LABEL_27:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t *v35;
  double v36;
  BOOL v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  void *v53;
  double v54;
  uint64_t v55;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x3010000000;
  v53 = &unk_1BBF15257;
  v54 = a3;
  v55 = 0;
  +[SKUICardLayout layoutWithCardViewElement:context:](SKUICardLayout, "layoutWithCardViewElement:context:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "horizontalContentInset");
  v11 = v10;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x3010000000;
  v48 = &unk_1BBF15257;
  v49 = *MEMORY[0x1E0C9D820];
  v29 = v49;
  objc_msgSend(v7, "flattenedChildren");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__34;
  v43[4] = __Block_byref_object_dispose__34;
  v44 = 0;
  v13 = objc_msgSend(v7, "cardType");
  v14 = a3 + v11 * -2.0;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x3010000000;
  v41 = &unk_1BBF15257;
  v42 = v29;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __79__SKUICardViewElementCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v30[3] = &unk_1E73A48C0;
  v15 = v9;
  v36 = v14;
  v31 = v15;
  v32 = &v45;
  v33 = &v38;
  v34 = v43;
  v37 = v13 == 2;
  v35 = &v50;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v30);
  objc_msgSend(v12, "lastObject");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v13 == 2)
  {
    v18 = v39;
    v19 = v51;
    v20 = v39[5] + v51[5];
    v51[5] = v20;
    if (v18[5] == 0.0)
      v21 = 30.0;
    else
      v21 = 15.0;
    goto LABEL_7;
  }
  if (v16)
  {
    objc_msgSend(v15, "bottomInsetForLastViewElement:width:", v16, v14);
    v19 = v51;
    v21 = v51[5];
LABEL_7:
    v19[5] = v20 + v21;
    goto LABEL_8;
  }
  v19 = v51;
LABEL_8:
  v22 = v46;
  v23 = v46[4];
  v24 = v19[4];
  if (v23 > v24)
  {
    v19[4] = v23;
    v24 = v23;
  }
  v25 = v22[5];
  v26 = v19[5];
  if (v25 > v26)
  {
    v19[5] = v25;
    v26 = v25;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v50, 8);

  v27 = v24;
  v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

void __79__SKUICardViewElementCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  BOOL v17;
  id v18;

  v18 = a2;
  v6 = objc_msgSend(v18, "elementType");
  objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v18, *(double *)(a1 + 72));
  v9 = v8;
  if (v6 == 7)
  {
    v10 = v18;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v7 > *(double *)(v11 + 32))
    {
      *(double *)(v11 + 32) = v7;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    if (v8 > *(double *)(v11 + 40))
      *(double *)(v11 + 40) = v8;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(double *)(v12 + 32) = v7;
    *(double *)(v12 + 40) = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "topInsetForViewElement:previousViewElement:width:", v18, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(a1 + 72));
    v14 = v13;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    if (*(_BYTE *)(a1 + 80))
    {
      v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v16 = a3 > 1;
      if (v15 <= 0.0)
        v16 = 0;
      v17 = v15 != 0.0 && !v16;
      v10 = v18;
      if (!v17)
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v9
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 40);
    }
    else
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v9
                                                                  + v14
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 40);
      v10 = v18;
    }
  }

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  SKUICardLayout *v11;
  SKUICardLayout *layout;
  SKUIViewElement *productImageElement;
  int64_t v14;
  UIView *programmedCardBackgroundView;
  BOOL v16;
  UIView *v17;
  UIView *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  SKUIBackgroundImageWrapperForHorizontalLockup *backgroundWrapper;
  SKUIPerspectiveView *backgroundViewWithParallax;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, void *);
  void *v56;
  id v57;
  id v58;
  SKUICardViewElementCollectionViewCell *v59;
  uint64_t *v60;
  double v61;
  BOOL v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;

  v9 = a3;
  v10 = a5;
  -[NSHashTable removeAllObjects](self->_artworkRelatedChildViewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  objc_storeStrong((id *)&self->_cardElement, a3);
  +[SKUICardLayout layoutWithCardViewElement:context:](SKUICardLayout, "layoutWithCardViewElement:context:", v9, v10);
  v11 = (SKUICardLayout *)objc_claimAutoreleasedReturnValue();
  layout = self->_layout;
  self->_layout = v11;

  productImageElement = self->_productImageElement;
  self->_productImageElement = 0;

  -[NSMapTable removeAllObjects](self->_viewElements, "removeAllObjects");
  self->_hasBottomAlignedItems = 0;
  self->_isActivityCard = objc_msgSend(v9, "cardType") == 1;
  v14 = -[SKUICardLayout layoutStyle](self->_layout, "layoutStyle");
  programmedCardBackgroundView = self->_programmedCardBackgroundView;
  v16 = v14 == 1;
  if (v14 == 1)
  {
    if (!programmedCardBackgroundView)
    {
      v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v18 = self->_programmedCardBackgroundView;
      self->_programmedCardBackgroundView = v17;

      -[UIView layer](self->_programmedCardBackgroundView, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCornerRadius:", 5.0);

      -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", self->_programmedCardBackgroundView);

      programmedCardBackgroundView = self->_programmedCardBackgroundView;
    }
    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  -[UIView setHidden:](programmedCardBackgroundView, "setHidden:", v21);
  v22 = objc_msgSend(v9, "isAdCard");
  -[SKUICardViewElementCollectionViewCell adCardBackgroundView](self, "adCardBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    objc_msgSend(v23, "setHidden:", 0);

    -[SKUICardViewElementCollectionViewCell compactAdCardHairlineLayer](self, "compactAdCardHairlineLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = 0;
  }
  else
  {
    objc_msgSend(v23, "setHidden:", 1);

    -[SKUICardViewElementCollectionViewCell compactAdCardHairlineLayer](self, "compactAdCardHairlineLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = 1;
  }
  objc_msgSend(v25, "setHidden:", v27);

  -[SKUICardLayout horizontalContentInset](self->_layout, "horizontalContentInset");
  v29 = a4 + v28 * -2.0;
  backgroundWrapper = self->_backgroundWrapper;
  self->_backgroundWrapper = 0;

  backgroundViewWithParallax = self->_backgroundViewWithParallax;
  self->_backgroundViewWithParallax = 0;

  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v53 = MEMORY[0x1E0C809B0];
  v54 = 3221225472;
  v55 = __77__SKUICardViewElementCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v56 = &unk_1E73A48E8;
  v32 = v9;
  v57 = v32;
  v61 = v29;
  v33 = v10;
  v58 = v33;
  v59 = self;
  v62 = v16;
  v60 = &v63;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", &v53);
  if (objc_msgSend(v32, "cardType", v53, v54, v55, v56) == 2 && self->_backgroundWrapper && *((_BYTE *)v64 + 24))
    self->_hasBottomAlignedItems = 1;
  if (self->_isActivityCard)
  {
    objc_msgSend(v33, "clientContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = SKUIUserInterfaceIdiom(v34);

    if (v35 == 1)
    {
      -[SKUICardViewElement style](self->_cardElement, "style");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "borderRadius");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        v38 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        objc_msgSend(v37, "cornerRadiiValue");
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v47 = (void *)MEMORY[0x1E0DC3508];
        -[SKUICardViewElementCollectionViewCell bounds](self, "bounds");
        v48 = 4 * (v40 > 0.0);
        if (v42 > 0.0)
          v48 = (4 * (v40 > 0.0)) | 8;
        if (v46 == 0.0)
          v49 = v48 | (v44 != 0.0);
        else
          v49 = v48 | (v44 != 0.0) | 2;
        objc_msgSend(v47, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v49);
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v38, "setPath:", objc_msgSend(v50, "CGPath"));
        -[SKUICardViewElementCollectionViewCell layer](self, "layer");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setMasksToBounds:", 1);

        -[SKUICardViewElementCollectionViewCell layer](self, "layer");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setMask:", v38);

      }
    }
  }

  _Block_object_dispose(&v63, 8);
}

void __77__SKUICardViewElementCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SKUIBackgroundImageWrapperForHorizontalLockup *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id *v38;
  id v39;
  void *v40;
  void *v41;
  id *v42;
  uint64_t v43;
  char *v44;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v46 = a2;
  objc_msgSend(*(id *)(a1 + 32), "flattenedChildren");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v48;
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      v8 = 0;
      v44 = sel__imageTapAction_;
      do
      {
        if (*(_QWORD *)v48 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "elementType", v44);
        v11 = 0;
        if (v10 > 61)
        {
          if (v10 <= 137)
          {
            if (v10 == 62)
            {
              if (!*(_QWORD *)(*(_QWORD *)(a1 + 48) + 896) && !*(_BYTE *)(a1 + 72))
              {
                +[SKUIHorizontalListView preferredSizeForViewElement:context:](SKUIHorizontalListView, "preferredSizeForViewElement:context:", v9, *(_QWORD *)(a1 + 40));
                if (v23 != v6 || v22 != v7)
                  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 896), v9);
              }
              objc_msgSend(v46, "addHorizontalListWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_70:
              v13 = v25;
              v11 = 0;
              v12 = v13;
              goto LABEL_45;
            }
            if (v10 == 66)
            {
              objc_msgSend(v46, "addHorizontalLockupWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
              v13 = (id)objc_claimAutoreleasedReturnValue();
              v26 = *(void **)(*(_QWORD *)(a1 + 48) + 840);
              if (v26)
                objc_msgSend(v26, "setLockup:", v13);
              v11 = 0;
              v12 = v13;
              goto LABEL_45;
            }
            v12 = 0;
            v13 = 0;
            if (v10 != 131)
              goto LABEL_57;
            objc_msgSend(v46, "addStackListViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
            v14 = objc_claimAutoreleasedReturnValue();
            goto LABEL_43;
          }
          if (v10 == 138)
          {
            objc_msgSend(v46, "addLabelViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
            v14 = objc_claimAutoreleasedReturnValue();
            goto LABEL_43;
          }
          if (v10 == 152)
          {
            v38 = (id *)(*(_QWORD *)(a1 + 48) + 896);
            if (!*v38)
              objc_storeStrong(v38, v9);
            objc_msgSend(v46, "addImageViewWithVideoElement:context:", v9, *(_QWORD *)(a1 + 40));
            v39 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:
            v13 = v39;
            v12 = 0;
            v11 = v39;
            goto LABEL_45;
          }
          v12 = 0;
          v13 = 0;
          if (v10 != 141)
            goto LABEL_57;
        }
        else
        {
          if (v10 > 31)
          {
            switch(v10)
            {
              case '0':
                objc_msgSend(v46, "addHeaderViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
                v14 = objc_claimAutoreleasedReturnValue();
                goto LABEL_43;
              case '1':
                objc_msgSend(v46, "addImageViewWithElement:context:", v9, *(_QWORD *)(a1 + 40));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "tapRecognizer");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "addTarget:action:", *(_QWORD *)(a1 + 48), v44);

                v42 = (id *)(*(_QWORD *)(a1 + 48) + 896);
                if (!*v42 && !*(_BYTE *)(a1 + 72))
                  objc_storeStrong(v42, v9);
                v39 = v40;
                goto LABEL_68;
              case '2':
                goto LABEL_22;
              case '3':
                objc_msgSend(v46, "addImageDeckViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_70;
              default:
                v12 = 0;
                v13 = 0;
                if (v10 != 32)
                  goto LABEL_57;
                objc_msgSend(v46, "addDividerWithElement:context:", v9, *(_QWORD *)(a1 + 40));
                v13 = (id)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = v9;
                  if (objc_msgSend(v20, "dividerType") == 3)
                  {
                    objc_msgSend(*(id *)(a1 + 48), "_dividerHeight:", v20);
                    objc_msgSend(v13, "setDividerSize:");
                    v21 = 1;
                  }
                  else
                  {
                    v21 = 0;
                  }
                  objc_msgSend(v13, "setDividerOrientation:", v21);

                }
                break;
            }
            goto LABEL_44;
          }
          if (v10 == 7)
          {
            objc_msgSend(v9, "firstChildForElementType:", 49);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addImageViewWithElement:context:", v15, *(_QWORD *)(a1 + 40));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[SKUIBackgroundImageWrapperForHorizontalLockup initWithImage:]([SKUIBackgroundImageWrapperForHorizontalLockup alloc], "initWithImage:", v16);
            v18 = *(_QWORD *)(a1 + 48);
            v19 = *(void **)(v18 + 840);
            *(_QWORD *)(v18 + 840) = v17;

            v11 = *(id *)(*(_QWORD *)(a1 + 48) + 840);
            v13 = v16;
            if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EF42F8D8))
              objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 832), v16);

            v12 = 0;
            goto LABEL_45;
          }
          if (v10 == 8)
          {
            objc_msgSend(v46, "addBadgeViewWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
            v14 = objc_claimAutoreleasedReturnValue();
LABEL_43:
            v13 = (id)v14;
            goto LABEL_44;
          }
          v12 = 0;
          v13 = 0;
          if (v10 != 12)
            goto LABEL_57;
        }
LABEL_22:
        objc_msgSend(v46, "addButtonWithElement:width:context:", v9, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
LABEL_44:
        v12 = 0;
        v11 = 0;
LABEL_45:
        if (v13)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 904), "setObject:forKey:", v9, v13);
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v9);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = *(void **)(*(_QWORD *)(a1 + 48) + 864);
            if (!v28)
            {
              v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
              v30 = *(_QWORD *)(a1 + 48);
              v31 = *(void **)(v30 + 864);
              *(_QWORD *)(v30 + 864) = v29;

              v28 = *(void **)(*(_QWORD *)(a1 + 48) + 864);
            }
            objc_msgSend(v28, "setObject:forKey:", v27, v11);
          }

        }
        if (v12)
        {
          v32 = *(void **)(*(_QWORD *)(a1 + 48) + 824);
          if (!v32)
          {
            v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
            v34 = *(_QWORD *)(a1 + 48);
            v35 = *(void **)(v34 + 824);
            *(_QWORD *)(v34 + 824) = v33;

            v32 = *(void **)(*(_QWORD *)(a1 + 48) + 824);
          }
          objc_msgSend(v32, "addObject:", v12);
        }
LABEL_57:
        objc_msgSend(v9, "style");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "elementPosition");

        if (v37 == 3)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

        ++v8;
      }
      while (v4 != v8);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      v4 = v43;
    }
    while (v43);
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
  uint64_t j;
  id v25;
  id v26;
  NSMapTable *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v8 = a4;
  v9 = a5;
  v25 = v8;
  v10 = objc_msgSend(v8, "requestIdentifier");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v10)
        {
          v21 = v26;
          objc_msgSend(v15, "setImage:", v26);

          LOBYTE(v19) = 1;
          v22 = v8;
          goto LABEL_22;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v12)
        continue;
      break;
    }
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_artworkRelatedChildViewElementViews;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v29;
    v22 = v25;
    v21 = v26;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "setImage:forArtworkRequest:context:", v26, v25, v9) & 1) != 0)
        {
          LOBYTE(v19) = 1;
          goto LABEL_22;
        }
      }
      v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v19)
        continue;
      break;
    }
  }
  else
  {
    v22 = v8;
    v21 = v26;
  }
LABEL_22:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  -[SKUIViewElement flattenedChildren](self->_cardElement, "flattenedChildren");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__SKUICardViewElementCollectionViewCell_updateWithItemState_context_animated___block_invoke;
  v17[3] = &unk_1E73A4910;
  v12 = v11;
  v18 = v12;
  v21 = &v23;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v22 = a5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);
  v15 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __78__SKUICardViewElementCollectionViewCell_updateWithItemState_context_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  char v8;
  id v9;

  v7 = objc_msgSend(a2, "elementType");
  if (v7 == 66 || v7 == 62)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "updateWithItemState:context:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
    *a4 = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;

  }
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
  -[SKUIViewElement flattenedChildren](self->_cardElement, "flattenedChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__34;
  v19 = __Block_byref_object_dispose__34;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__SKUICardViewElementCollectionViewCell_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_1E73A4318;
  v7 = v6;
  v12 = v7;
  v14 = &v15;
  v8 = v4;
  v13 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __66__SKUICardViewElementCollectionViewCell_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = objc_msgSend(a2, "elementType");
  if (v7 == 66 || v7 == 62)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewForElementIdentifier:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      *a4 = 1;

  }
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)setPerspectiveTargetView:(id)a3
{
  SKUIPerspectiveView *backgroundViewWithParallax;
  id v4;

  backgroundViewWithParallax = self->_backgroundViewWithParallax;
  v4 = a3;
  -[SKUIPerspectiveView setPerspectiveTargetView:](backgroundViewWithParallax, "setPerspectiveTargetView:", v4);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[SKUIPerspectiveView setVanishingPoint:](self->_backgroundViewWithParallax, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SKUIPerspectiveView updateForChangedDistanceFromVanishingPoint](self->_backgroundViewWithParallax, "updateForChangedDistanceFromVanishingPoint");
}

- (void)applyLayoutAttributes:(id)a3
{
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUICardViewElementCollectionViewCell;
  -[SKUIViewReuseCollectionViewCell applyLayoutAttributes:](&v9, sel_applyLayoutAttributes_, a3);
  if (-[SKUICardViewElement isAdCard](self->_cardElement, "isAdCard"))
  {
    -[SKUICardViewElementCollectionViewCell adCardBackgroundView](self, "adCardBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");
      -[SKUICardViewElementCollectionViewCell layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v7);

    }
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKUICardViewElementCollectionViewCell;
  -[SKUICollectionViewCell setSelected:](&v6, sel_setSelected_);
  if (v3)
  {
    if (-[SKUICardViewElement isAdCard](self->_cardElement, "isAdCard"))
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sendAction:to:from:forEvent:", sel_skuiadvertising_advertWasSelected_, 0, self, 0);

    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  objc_super v5;
  objc_super v6;

  if (self->_isActivityCard)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)SKUICardViewElementCollectionViewCell;
    -[SKUIViewReuseCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKUICardViewElementCollectionViewCell;
    -[SKUIViewReuseCollectionViewCell setBackgroundColor:](&v5, sel_setBackgroundColor_, a3);
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
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
  UIView *programmedCardBackgroundView;
  unint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double Width;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double MaxY;
  CGFloat v53;
  double Height;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double x;
  double y;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
  int64_t v94;
  void *v95;
  _QWORD v96[5];
  id v97;
  id v98;
  _QWORD *v99;
  uint64_t *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  uint64_t v109;
  BOOL v110;
  _QWORD v111[3];
  char v112;
  _QWORD v113[4];
  _QWORD v114[4];
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  _QWORD v121[4];
  _QWORD v122[5];
  id v123;
  objc_super v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;

  v124.receiver = self;
  v124.super_class = (Class)SKUICardViewElementCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v124, sel_layoutSubviews);
  -[SKUICardViewElementCollectionViewCell backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElement firstChildForElementType:](self->_cardElement, "firstChildForElementType:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = -[SKUICardViewElement cardType](self->_cardElement, "cardType");
  v95 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SKUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  v16 = v8 + v15;
  v18 = v10 + v17;
  v20 = v12 - (v15 + v19);
  v22 = v14 - (v17 + v21);

  programmedCardBackgroundView = self->_programmedCardBackgroundView;
  if (programmedCardBackgroundView && !-[UIView isHidden](programmedCardBackgroundView, "isHidden"))
  {
    v24 = SKUIColorSchemeStyleForColor(v3);
    if (v24 <= 3)
    {
      SKUIColorByAdjustingBrightness(v3, flt_1BBED1A90[v24]);
      v25 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v25;
    }
    -[UIView setBackgroundColor:](self->_programmedCardBackgroundView, "setBackgroundColor:", v3);
    -[UIView setFrame:](self->_programmedCardBackgroundView, "setFrame:", v16, v18, v20, v22);
  }
  -[SKUICardLayout horizontalContentInset](self->_layout, "horizontalContentInset", 880);
  v27 = v26;
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x3032000000;
  v122[3] = __Block_byref_object_copy__34;
  v122[4] = __Block_byref_object_dispose__34;
  v123 = 0;
  -[SKUIViewReuseCollectionViewCell allExistingViews](self, "allExistingViews");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2020000000;
  *(double *)&v121[3] = v18;
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__34;
  v119 = __Block_byref_object_dispose__34;
  v120 = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  v114[3] = 0x402E000000000000;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x2020000000;
  v113[3] = 0;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x2020000000;
  v112 = 0;
  -[SKUICardViewElementCollectionViewCell adCardBackgroundView](self, "adCardBackgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "removeFromSuperview");

  -[SKUICardViewElementCollectionViewCell compactAdCardHairlineLayer](self, "compactAdCardHairlineLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "removeFromSuperlayer");

  v32 = v16 + v27;
  v33 = v20 + v27 * -2.0;
  if (-[SKUICardViewElement isAdCard](self->_cardElement, "isAdCard"))
  {
    -[SKUICardViewElementCollectionViewCell traitCollection](self, "traitCollection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "horizontalSizeClass");

    -[SKUICardViewElement style](self->_cardElement, "style");
    if (v35 == 1)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "ikBackgroundColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "color");
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v39 = objc_msgSend(v38, "CGColor");
      -[SKUICardViewElementCollectionViewCell layer](self, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setBackgroundColor:", v39);

      -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICardViewElementCollectionViewCell compactAdCardHairlineLayer](self, "compactAdCardHairlineLayer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addSublayer:", v43);

      -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "frame");
      Width = CGRectGetWidth(v125);
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "scale");
      v49 = v48;

      -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "layer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "frame");
      MaxY = CGRectGetMaxY(v126);
      v127.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
      v127.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
      v53 = 1.0 / v49;
      v127.size.width = Width;
      v127.size.height = v53;
      Height = CGRectGetHeight(v127);

      -[SKUICardViewElementCollectionViewCell compactAdCardHairlineLayer](self, "compactAdCardHairlineLayer");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setFrame:", 0.0, MaxY - Height, Width, v53);
    }
    else
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "ikBackgroundColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "color");
      v58 = objc_claimAutoreleasedReturnValue();

      -[SKUICardViewElementCollectionViewCell adCardBackgroundView](self, "adCardBackgroundView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setBackgroundColor:", v58);

      -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICardViewElementCollectionViewCell adCardBackgroundView](self, "adCardBackgroundView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addSubview:", v61);

      -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICardViewElementCollectionViewCell adCardBackgroundView](self, "adCardBackgroundView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "sendSubviewToBack:", v63);

      v128.origin.x = v32;
      v128.origin.y = v18;
      v128.size.width = v20 + v27 * -2.0;
      v128.size.height = v22;
      v129 = CGRectInset(v128, -10.0, -10.0);
      x = v129.origin.x;
      y = v129.origin.y;
      v66 = v129.size.width;
      v67 = v129.size.height;
      -[SKUICardViewElementCollectionViewCell adCardBackgroundView](self, "adCardBackgroundView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setFrame:", x, y, v66, v67);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v69 = objc_msgSend(v55, "CGColor");
      -[SKUICardViewElementCollectionViewCell layer](self, "layer");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setBackgroundColor:", v69);

      v3 = (void *)v58;
    }

  }
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __55__SKUICardViewElementCollectionViewCell_layoutSubviews__block_invoke;
  v96[3] = &unk_1E73A4938;
  v105 = v32;
  v106 = v18;
  v107 = v33;
  v108 = v22;
  v96[4] = self;
  v99 = v113;
  v110 = v94 == 2;
  v100 = &v115;
  v101 = v111;
  v109 = v29;
  v102 = v114;
  v103 = v121;
  v104 = v122;
  v71 = v28;
  v97 = v71;
  v72 = v3;
  v98 = v72;
  objc_msgSend(v71, "enumerateObjectsUsingBlock:", v96);
  if (-[SKUICardViewElement isAdCard](self->_cardElement, "isAdCard"))
  {
    -[SKUICardViewElementCollectionViewCell compactAdCardHairlineLayer](self, "compactAdCardHairlineLayer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "frame");
    v75 = v74;
    v77 = v76;

    -[SKUICardViewElementCollectionViewCell contentView](self, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bounds");
    v79 = CGRectGetWidth(v130);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "scale");
    v82 = v81;

    -[SKUICardViewElementCollectionViewCell compactAdCardHairlineLayer](self, "compactAdCardHairlineLayer");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setFrame:", v75, v77, v79, 1.0 / v82);

  }
  if (v95 && v116[5] && v94 != 2)
  {
    -[NSMapTable objectForKey:](self->_viewElements, "objectForKey:");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v116[5], "frame");
    v86 = v85;
    v88 = v87;
    v90 = v89;
    v131.origin.x = v32;
    v131.origin.y = v18;
    v131.size.width = v33;
    v131.size.height = v22;
    v91 = CGRectGetMaxY(v131);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v93), "bottomInsetForLastViewElement:width:", v84, v33);
    objc_msgSend((id)v116[5], "setFrame:", v86, v91 - v90 - v92, v88, v90);

  }
  _Block_object_dispose(v111, 8);
  _Block_object_dispose(v113, 8);
  _Block_object_dispose(v114, 8);
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v122, 8);

}

void __55__SKUICardViewElementCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  unint64_t v18;
  float v19;
  double v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double Height;
  void *v34;
  double MaxX;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  float v49;
  double v50;
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v51 = a2;
  v6 = (double *)MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 904), "objectForKey:", v51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(double *)(a1 + 120);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 872))
  {
    v9 = v9 + -2.0;
    v10 = 1.0;
  }
  else
  {
    v10 = 0.0;
  }
  objc_msgSend(v51, "sizeThatFits:", v9, 1.79769313e308);
  v12 = v11;
  v14 = v13;
  if (objc_msgSend(v8, "elementType") == 7)
  {
    v15 = (*(double *)(a1 + 120) - v12) * 0.5;
    v16 = *(double *)(a1 + 104) + floorf(v15);
    objc_msgSend(v51, "setContentMode:", 2);
    objc_msgSend(v51, "setFrame:", v16, v7, v12, v14);
    objc_msgSend(*(id *)(a1 + 32), "sendSubviewToBack:", v51);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 856))
    {
      v52.origin.x = v16;
      v52.origin.y = v7;
      v52.size.width = v12;
      v52.size.height = v14;
      *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CGRectGetHeight(v52);
    }
    goto LABEL_51;
  }
  objc_msgSend(v8, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = SKUIViewElementAlignmentForStyle(v17);

  if (v18 > 5)
  {
    v20 = *v6;
  }
  else if (((1 << v18) & 0x25) != 0)
  {
    v19 = (*(double *)(a1 + 120) - v12) * 0.5;
    v20 = *(double *)(a1 + 104) + floorf(v19);
  }
  else if (((1 << v18) & 0x12) != 0)
  {
    v20 = v10 + *(double *)(a1 + 104);
  }
  else
  {
    v20 = *(double *)(a1 + 104) + *(double *)(a1 + 120) - v12;
  }
  v21 = objc_msgSend(v8, "elementType");
  if (v21 == 66)
  {
    v22 = v8;
    v23 = objc_msgSend(v22, "lockupViewType");
    v24 = v23 == 7;
    if (v23 != 7)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "isAdCard")
      && (objc_msgSend(*(id *)(a1 + 32), "adCardBackgroundView"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v25, "isHidden"),
          v25,
          (v26 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "adCardBackgroundView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "backgroundColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setGradientColor:", v28);

    }
    else
    {
      objc_msgSend(v51, "setGradientColor:", 0);
    }

  }
  else
  {
    v24 = 0;
  }
  if (*(_BYTE *)(a1 + 144))
  {
    objc_msgSend(v8, "style");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "elementPosition");

    if (v30 == 3
      && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 856)
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v31 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v53.origin.x = v20;
      v53.origin.y = v7;
      v53.size.width = v12;
      v53.size.height = v14;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v31 - CGRectGetHeight(v53);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    v32 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v54.origin.x = v20;
    v54.origin.y = v32;
    v54.size.width = v12;
    v54.size.height = v14;
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = CGRectGetHeight(v54) + v32;
    goto LABEL_29;
  }
  if (*(_QWORD *)(a1 + 136) - 1 == a3 && objc_msgSend(v8, "elementType") == 32)
  {
    v32 = CGRectGetMaxY(*(CGRect *)(a1 + 104)) - v14;
    goto LABEL_29;
  }
  v41 = *(_QWORD *)(a1 + 32);
  v42 = *(void **)(v41 + 912);
  if (v42 && v8 == *(void **)(v41 + 896))
  {
    v47 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    objc_msgSend(v42, "size");
    v49 = v47 + (v48 - v14) * 0.5;
    v32 = floorf(v49);
    if (v24)
      goto LABEL_29;
  }
  else
  {
    v32 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (v24)
      goto LABEL_29;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 880), "topInsetForViewElement:previousViewElement:width:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(double *)(a1 + 120));
  v32 = v32 + v50;
LABEL_29:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "isAdCard"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && *(_QWORD *)(a1 + 136) - 1 == a3)
    {
      v55.origin.x = v20;
      v55.origin.y = v32;
      v55.size.width = v12;
      v55.size.height = v14;
      Height = CGRectGetHeight(v55);
      v32 = CGRectGetMaxY(*(CGRect *)(a1 + 104)) - Height;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 - 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "frame");
      MaxX = CGRectGetMaxX(v56);
      v57.origin.x = v20;
      v57.origin.y = v32;
      v57.size.width = v12;
      v57.size.height = v14;
      v20 = MaxX - CGRectGetWidth(v57);

    }
  }
  objc_msgSend(v51, "setFrame:", v20, v32, v12, v14);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v8);
  v58.origin.x = v20;
  v58.origin.y = v32;
  v58.size.width = v12;
  v58.size.height = v14;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = CGRectGetMaxY(v58);
  v36 = *(_QWORD *)(a1 + 32);
  if (v21 == 66 || !*(_BYTE *)(v36 + 872))
  {
    if (v21 == 66)
    {
      objc_msgSend(v8, "style");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "ikBackgroundColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "color");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v40 = 0;
    }
    if (objc_msgSend(*(id *)(v36 + 848), "isAdCard"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 848), "style");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "ikBackgroundColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "color");
      v45 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v45;
    }
    v46 = v40;
    if (!v40)
      v46 = *(void **)(a1 + 48);
    objc_msgSend(v51, "setBackgroundColor:", v46);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBackgroundColor:", v37);

  }
LABEL_51:

}

- (void)_buttonAction:(id)a3
{
  id v3;

  -[NSMapTable objectForKey:](self->_viewElements, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (void)_imageTapAction:(id)a3
{
  id v4;
  NSMapTable *viewElements;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  viewElements = self->_viewElements;
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](viewElements, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SKUICardViewElementCollectionViewCell__imageTapAction___block_invoke;
  v9[3] = &unk_1E73A3160;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __57__SKUICardViewElementCollectionViewCell__imageTapAction___block_invoke(uint64_t a1, int a2, char a3)
{
  _QWORD v4[4];
  id v5;
  id v6;

  if (!a2 || (a3 & 1) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__SKUICardViewElementCollectionViewCell__imageTapAction___block_invoke_2;
    v4[3] = &unk_1E73A3138;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }
}

void __57__SKUICardViewElementCollectionViewCell__imageTapAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performDefaultActionForViewElement:", *(_QWORD *)(a1 + 32));

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SKUICardViewElementCollectionViewCell;
    v7 = -[SKUICardViewElementCollectionViewCell canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (void)skuiadvertising_advertSelectionEventShouldBeForwarded:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAction:to:from:forEvent:", sel_skuiadvertising_advertWasSelected_, 0, self, 0);

}

- (NSString)lineItem
{
  void *v3;
  void *v4;

  if (-[SKUICardViewElement isAdCard](self->_cardElement, "isAdCard"))
  {
    -[SKUICardViewElement attributes](self->_cardElement, "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lineItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)impressionIdentifier
{
  void *v3;
  void *v4;

  if (-[SKUICardViewElement isAdCard](self->_cardElement, "isAdCard"))
  {
    -[SKUICardViewElement attributes](self->_cardElement, "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("impressionId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

+ (double)_defaultWidthForLockupWithContext:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  double *v9;

  v3 = a3;
  objc_msgSend(v3, "activePageWidth");
  v5 = v4;
  objc_msgSend(v3, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = SKUIUserInterfaceIdiom(v6);
  if (v7 == 1)
  {
    v8 = v5 < 500.0;
    v9 = (double *)&unk_1BBED1A80;
    return v9[v8];
  }
  if (v5 > 500.0)
    return 284.0;
  if (v5 > 414.0)
    return 357.6;
  if (v5 <= 375.0)
  {
    v8 = v5 > 320.0;
    v9 = (double *)&unk_1BBED1A70;
    return v9[v8];
  }
  return 364.0;
}

- (double)_dividerHeight:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  objc_msgSend(a3, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 10.0;
  }

  return v6;
}

- (void)_performDefaultActionForViewElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  SKUICollectionViewForView(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "collectionView:performDefaultActionForViewElement:indexPath:", v4, v7, v5);

  }
}

- (SKUISizeValue)artworkBoundingSize
{
  return self->_artworkBoundingSize;
}

- (void)setAdCardBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_adCardBackgroundView, a3);
}

- (void)setCompactAdCardHairlineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_compactAdCardHairlineLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactAdCardHairlineLayer, 0);
  objc_storeStrong((id *)&self->_adCardBackgroundView, 0);
  objc_storeStrong((id *)&self->_artworkBoundingSize, 0);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_productImageElement, 0);
  objc_storeStrong((id *)&self->_programmedCardBackgroundView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_cardElement, 0);
  objc_storeStrong((id *)&self->_backgroundWrapper, 0);
  objc_storeStrong((id *)&self->_backgroundViewWithParallax, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
