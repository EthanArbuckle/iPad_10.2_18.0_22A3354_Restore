@implementation SKUIOfferView

- (SKUIOfferView)initWithFrame:(CGRect)a3
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
  SKUIOfferView *v16;
  uint64_t v17;
  NSMapTable *buttonElements;
  NSMutableArray *v19;
  NSMutableArray *metadataViews;
  NSMutableArray *v21;
  NSMutableArray *offerButtonViews;
  objc_super v24;

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
        -[SKUIOfferView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIOfferView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    buttonElements = v16->_buttonElements;
    v16->_buttonElements = (NSMapTable *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    metadataViews = v16->_metadataViews;
    v16->_metadataViews = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    offerButtonViews = v16->_offerButtonViews;
    v16->_offerButtonViews = v21;

    -[SKUIOfferView setLayoutMargins:](v16, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[SKUIOfferView setPreservesSuperviewLayoutMargins:](v16, "setPreservesSuperviewLayoutMargins:", 0);
  }
  return v16;
}

- (NSString)offerViewStateDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "offerButtonStateDescription");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_1E73A9FB0;
    }

  }
  else
  {
    v7 = &stru_1E73A9FB0;
  }
  return (NSString *)v7;
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
        +[SKUIOfferView prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__SKUIOfferView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __64__SKUIOfferView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUIOfferView preferredSizeForViewElement:context:].cold.1();
  }
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
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  double v26;
  _QWORD v27[4];

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v10)
        +[SKUIOfferView requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  *(double *)&v27[3] = a4;
  objc_msgSend(v9, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__SKUIOfferView_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E73A98F8;
  v25 = a1;
  v19 = v9;
  v22 = v19;
  v20 = v18;
  v26 = a4;
  v23 = v20;
  v24 = v27;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v21);

  _Block_object_dispose(v27, 8);
}

void __59__SKUIOfferView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "elementType");
  if (v3 > 137)
  {
    if (v3 == 138)
    {
      v5 = v9;
      objc_msgSend(*(id *)(a1 + 56), "_attributedStringForLabel:context:", v5, *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "labelViewStyle");
      v8 = *(void **)(a1 + 40);
      if (v7 == 3)
      {
        objc_msgSend(v8, "requestLayoutForLabel:attributedString:width:", v5, v6, (uint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 64);
      }
      else
      {
        objc_msgSend(v8, "requestLayoutForLabel:attributedString:width:", v5, v6, (uint64_t)*(double *)(a1 + 64));
      }

      goto LABEL_12;
    }
    if (v3 != 141)
      goto LABEL_13;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 56), "_attributedStringForButton:context:", v9, *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestLayoutForButton:attributedString:width:", v9, v5, (uint64_t)*(double *)(a1 + 64));
LABEL_12:

    goto LABEL_13;
  }
  if (v3 == 12)
    goto LABEL_7;
  if (v3 == 13)
  {
    objc_msgSend(*(id *)(a1 + 32), "sizeForItemOfferButton:", v9);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4 + 10.0;
  }
LABEL_13:

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
  double *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double *v22;
  int v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v30;
  int v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  double v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];
  uint64_t v74;
  double *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIOfferView sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = (double *)MEMORY[0x1E0C9D820];
  v74 = 0;
  v75 = (double *)&v74;
  v76 = 0x3010000000;
  v78 = 0;
  v79 = 0;
  v77 = &unk_1BBF15257;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  *(double *)&v73[3] = a3;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v64 = 0;
  v65 = (double *)&v64;
  v66 = 0x3010000000;
  v67 = &unk_1BBF15257;
  v68 = xmmword_1BBED2AD0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v55 = 0;
  v56 = (double *)&v55;
  v57 = 0x3010000000;
  v58 = &unk_1BBF15257;
  v59 = *MEMORY[0x1E0C9D820];
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __55__SKUIOfferView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v40[3] = &unk_1E73A9920;
  v18 = v8;
  v50 = a3;
  v41 = v18;
  v43 = &v55;
  v44 = &v60;
  v45 = &v64;
  v46 = v73;
  v47 = &v69;
  v19 = v7;
  v42 = v19;
  v48 = &v51;
  v49 = &v74;
  objc_msgSend(v19, "enumerateChildrenUsingBlock:", v40);
  v21 = *v17;
  v20 = v17[1];
  if (v75[4] == *v17 && v75[5] == v20)
  {
    v22 = v65;
  }
  else
  {
    v23 = objc_msgSend(v19, "isCompactModeEnabled");
    v22 = v65;
    if (v23)
      v65[4] = v75[4] + 10.0 + v65[4];
    else
      v65[5] = v75[5] + 3.0 + v65[5];
  }
  if (v22[5] >= v56[5])
    v24 = v22[5];
  else
    v24 = v56[5];
  v25 = v70[3];
  v26 = v21;
  if (v25 >= 1)
  {
    v26 = v21 + 10.0;
    if (v61[3] <= 0)
      v26 = v21;
    v27 = v25 - 1;
    if (v27)
      v26 = v26 + (float)((float)v27 * 20.0);
  }
  v28 = v26 + v22[4] + v56[4];
  if (v28 < a3)
    a3 = v28;
  objc_msgSend(v19, "attributes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", CFSTR("supportsPlayButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "BOOLValue"))
  {
    v31 = *((unsigned __int8 *)v52 + 24);

    if (!v31)
    {
      v32 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0;
      v33 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1;
      if (*(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0 == v21
        && *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1 == v20)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1, *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKUIItemOfferButton playImageWithTintColor:](SKUIItemOfferButton, "playImageWithTintColor:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "size");
        sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0 = v36;
        sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1 = v37;

        v32 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0;
        v33 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1;
      }
      a3 = a3 + v32 + 20.0;
      if (v33 >= v24)
        v24 = v33;
    }
  }
  else
  {

  }
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v74, 8);

  v38 = a3;
  v39 = v24;
  result.height = v39;
  result.width = v38;
  return result;
}

void __55__SKUIOfferView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  char isKindOfClass;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  id v34;

  v34 = a2;
  v3 = objc_msgSend(v34, "elementType");
  if (v3 > 49)
  {
    if (v3 != 141)
    {
      if (v3 != 138)
      {
        if (v3 != 50)
          goto LABEL_31;
        goto LABEL_13;
      }
      v7 = v34;
      v12 = objc_msgSend(v7, "labelViewStyle");
      objc_msgSend(*(id *)(a1 + 32), "labelLayoutCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12 == 3)
      {
        objc_msgSend(v13, "sizeForLabel:width:", v7, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32));
        v16 = v15;
        v18 = v17;

        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v20 = *(double *)(v19 + 40);
        if (v20 < v18)
          v20 = v18;
        *(double *)(v19 + 40) = v20;
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v22 = *(double *)(v21 + 32);
        if (v22 < v16)
          v22 = v16;
        *(double *)(v21 + 32) = v22;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(a1 + 104);
      }
      else
      {
        objc_msgSend(v13, "sizeForLabel:width:", v7, *(double *)(a1 + 104));
        v24 = v23;
        v26 = v25;

        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v26
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 40);
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v28 = *(double *)(v27 + 32);
        if (v28 < v24)
          v28 = v24;
        *(double *)(v27 + 32) = v28;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      }
LABEL_30:

      goto LABEL_31;
    }
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v34, *(double *)(a1 + 104));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(double *)(v6 + 40) >= v5)
      v5 = *(double *)(v6 + 40);
    *(double *)(v6 + 40) = v5;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 32);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 32);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "attributes");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("supportsPlayButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "BOOLValue") && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_31;
      v30 = objc_msgSend(v34, "itemIdentifier");
      if (!v30)
        goto LABEL_31;
      v31 = v30;
      +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stateForItemWithIdentifier:", v31);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v33 = (objc_msgSend(v7, "state") >> 6) & 1;
      if (!v7)
        LOBYTE(v33) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v33;
    }
    else
    {

    }
    goto LABEL_30;
  }
  if (v3 != 12)
  {
    if (v3 != 13)
      goto LABEL_31;
    goto LABEL_8;
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v34, *(double *)(a1 + 104));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v10
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 40);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(double *)(v11 + 32) >= v9)
    v9 = *(double *)(v11 + 32);
  *(double *)(v11 + 32) = v9;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
LABEL_31:

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  SKUIOfferView *v23;
  double v24;

  v8 = a3;
  v9 = a5;
  -[SKUIOfferView buttonElements](self, "buttonElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[SKUIOfferView buyButtonDescriptorToButton](self, "buyButtonDescriptorToButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[SKUIOfferView metadataViews](self, "metadataViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[SKUIOfferView setHlsID:](self, "setHlsID:", 0);
  -[SKUIOfferView hlsPlayButton](self, "hlsPlayButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  -[SKUIOfferView setHlsPlayButton:](self, "setHlsPlayButton:", 0);
  -[SKUIOfferView setShowingConfirmation:](self, "setShowingConfirmation:", 0);
  -[SKUIOfferView setNotices:](self, "setNotices:", 0);
  -[SKUIOfferView setCompactModeEnabled:](self, "setCompactModeEnabled:", objc_msgSend(v8, "isCompactModeEnabled"));
  objc_msgSend(v8, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "elementAlignment");

  if (v16 == 3)
    v17 = 3;
  else
    v17 = 1;
  -[SKUIOfferView setAlignment:](self, "setAlignment:", v17);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke;
  v20[3] = &unk_1E73A1230;
  v24 = a4;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v18 = v9;
  v19 = v8;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v20);

}

void __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[3];
  char v34;

  v3 = a2;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__103;
  v29[4] = __Block_byref_object_dispose__103;
  v30 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke_22;
  v10[3] = &unk_1E73A9948;
  v5 = v3;
  v11 = v5;
  v20 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v12 = v6;
  v13 = v7;
  v15 = v33;
  v16 = v29;
  v17 = v31;
  v14 = *(id *)(a1 + 32);
  v18 = &v21;
  v19 = &v25;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v10);
  v8 = v26[3];
  v9 = v8 < 1 || v8 < v22[3];
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 448) = v9;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

void __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SKUIStoreIdentifier *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;

  v45 = a2;
  v3 = objc_msgSend(v45, "elementType");
  v4 = 0;
  v5 = 1;
  if (v3 <= 49)
  {
    if (v3 == 12)
    {
LABEL_24:
      objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v45, *(_QWORD *)(a1 + 40), *(double *)(a1 + 104));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
      objc_msgSend(v7, "addTarget:action:forControlEvents:", 0, sel_skuiadvertising_advertSelectionEventShouldBeForwarded_, 64);
      if (v7)
      {
LABEL_25:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          v31 = *(_QWORD *)(a1 + 88);
        else
          v31 = *(_QWORD *)(a1 + 96);
        ++*(_QWORD *)(*(_QWORD *)(v31 + 8) + 24);
        objc_msgSend(*(id *)(a1 + 48), "metadataViews");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v7);
        v4 = 0;
        v6 = 0;
        v8 = 0;
        goto LABEL_34;
      }
      goto LABEL_36;
    }
    v6 = 0;
    v7 = 0;
    v8 = 1;
    if (v3 != 13)
      goto LABEL_38;
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v45, *(_QWORD *)(a1 + 40), *(double *)(a1 + 104));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 0x20000);
    objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__cancelConfirmationAction_, 0x10000);
    objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__showConfirmationAction_, 0x40000);
    objc_msgSend(v9, "addTarget:action:forControlEvents:", 0, sel_skuiadvertising_advertSelectionEventShouldBeForwarded_, 64);
    LODWORD(v10) = -0.5;
    objc_msgSend(v9, "setCharge:", v10);
    objc_msgSend(v9, "setItemOfferDelegate:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v9);
    v4 = v9;
    v11 = *(void **)(a1 + 48);
    objc_msgSend(v45, "buyButtonDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v11, "_shouldHideNoticesWithBuyButtonDescriptor:context:", v12, *(_QWORD *)(a1 + 40));

    if (!v4)
    {
      v6 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v45, "buyButtonDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 48), "buyButtonDescriptorToButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 517, 1);
        objc_msgSend(*(id *)(a1 + 48), "setBuyButtonDescriptorToButton:", v15);

      }
      objc_msgSend(*(id *)(a1 + 48), "buyButtonDescriptorToButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v4, v13);

    }
    objc_msgSend(*(id *)(a1 + 56), "attributes");
    v17 = (SKUIStoreIdentifier *)objc_claimAutoreleasedReturnValue();
    -[SKUIStoreIdentifier objectForKey:](v17, "objectForKey:", CFSTR("supportsPlayButton"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "BOOLValue"))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_22:

        objc_msgSend(*(id *)(a1 + 48), "offerButtonViews");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v4);
        v5 = 0;
        v6 = 0;
        v7 = 0;
        goto LABEL_23;
      }
      v17 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", objc_msgSend(v45, "itemIdentifier"));
      if (!v17)
      {
LABEL_21:

        goto LABEL_22;
      }
      +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stateForItemWithStoreIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v18, "state");
      if (objc_msgSend(v45, "buttonViewType") == 3 && (!v18 || (v21 & 0x40) == 0))
      {
        v22 = objc_alloc_init(MEMORY[0x1E0DC3518]);
        objc_msgSend(v22, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
        v23 = (void *)objc_opt_class();
        objc_msgSend(*(id *)(a1 + 48), "backgroundColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "playTintColorForBackgroundColor:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "playImageWithTintColor:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setImage:forState:", v26, 0);

        objc_msgSend((id)objc_opt_class(), "playHighlightImageWithTintColor:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setImage:forState:", v27, 1);

        objc_msgSend(v22, "setAdjustsImageWhenHighlighted:", 1);
        objc_msgSend(v22, "sizeToFit");
        objc_msgSend(v22, "setEnabled:", objc_msgSend(v45, "isEnabled"));
        objc_msgSend(*(id *)(a1 + 48), "addSubview:", v22);
        objc_msgSend(*(id *)(a1 + 48), "setHlsPlayButton:", v22);
        -[SKUIStoreIdentifier numberValue](v17, "numberValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setHlsID:", v28);

        objc_msgSend(*(id *)(a1 + 48), "buttonElements");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v45, v22);

      }
    }

    goto LABEL_21;
  }
  if (v3 == 141)
    goto LABEL_8;
  if (v3 == 138)
  {
    if (objc_msgSend(v45, "labelViewStyle") != 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v45, *(_QWORD *)(a1 + 40), *(double *)(a1 + 104));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_25;
LABEL_36:
      v4 = 0;
      v6 = 0;
      goto LABEL_37;
    }
    v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v32)
    {
      objc_msgSend(v32, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v34 = v33 + 10.0;
    }
    else
    {
      v34 = *(double *)(a1 + 104);
    }
    objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v45, *(_QWORD *)(a1 + 40), v34);
    v40 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v40;
    if (v40)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      {
        v7 = (void *)v40;
        goto LABEL_25;
      }
      objc_msgSend(*(id *)(a1 + 48), "notices");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
        objc_msgSend(*(id *)(a1 + 48), "setNotices:", v42);

      }
      objc_msgSend(*(id *)(a1 + 48), "notices");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKey:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        objc_msgSend(v6, "setHidden:", 1);
      v4 = 0;
      v7 = 0;
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v30 = *(void **)(v44 + 40);
      *(_QWORD *)(v44 + 40) = 0;
LABEL_23:
      v8 = 1;
LABEL_34:

      goto LABEL_38;
    }
    v4 = 0;
LABEL_31:
    v7 = 0;
LABEL_37:
    v8 = 1;
    goto LABEL_38;
  }
  v6 = 0;
  v7 = 0;
  v8 = 1;
  if (v3 == 50)
    goto LABEL_24;
LABEL_38:
  objc_msgSend(*(id *)(a1 + 48), "hlsPlayButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(*(id *)(a1 + 48), "offerButtonViews");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "hlsPlayButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v37);

  }
  if (SKUIIKViewElementTypeIsButton(objc_msgSend(v45, "elementType")))
  {
    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "buttonElements");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKey:", v45, v7);

    }
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "buttonElements");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKey:", v45, v4);

    }
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v22;
  _BOOL4 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v23 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = a4;
  objc_msgSend(v22, "clientContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SKUIOfferView buyButtonDescriptorToButton](self, "buyButtonDescriptorToButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v9)
  {

LABEL_17:
    v20 = 0;
    goto LABEL_18;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if (objc_msgSend(v14, "canPersonalizeUsingItemState:", v7))
      {
        -[SKUIOfferView buyButtonDescriptorToButton](self, "buyButtonDescriptorToButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v14, v7, v24, v23);
        -[SKUIOfferView notices](self, "notices");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[SKUIOfferView notices](self, "notices");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v19, "setHidden:", -[SKUIOfferView _shouldHideNoticesWithBuyButtonDescriptor:context:](self, "_shouldHideNoticesWithBuyButtonDescriptor:context:", v14, v22));

        }
        v11 = 1;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v10);

  if ((v11 & 1) == 0)
    goto LABEL_17;
  -[SKUIOfferView setNeedsLayout](self, "setNeedsLayout");
  v20 = 1;
LABEL_18:

  return v20;
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
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  CGFloat v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat v35;
  CGFloat v36;
  uint64_t j;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  int64_t metadataPosition;
  double v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  CGFloat v52;
  double v53;
  double v54;
  CGFloat v55;
  float v56;
  double v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double MidY;
  CGFloat v66;
  double v67;
  double MaxY;
  CGFloat v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  float v76;
  float v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  double MaxX;
  double v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  float v100;
  double v101;
  uint64_t v102;
  uint64_t m;
  void *v104;
  double v105;
  double v106;
  double v107;
  CGFloat v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat rect;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  double v119;
  double v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  CGFloat v125;
  double v126;
  double v127;
  CGFloat v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;

  v149 = *MEMORY[0x1E0C80C00];
  if (!-[SKUIOfferView isShowingConfirmation](self, "isShowingConfirmation"))
  {
    -[SKUIOfferView layoutMargins](self, "layoutMargins");
    v4 = v3;
    v6 = v5;
    -[SKUIOfferView bounds](self, "bounds");
    v128 = v7;
    v9 = v8;
    v11 = v10;
    v126 = v12;
    v123 = v4;
    v13 = *MEMORY[0x1E0C9D820];
    v141 = 0u;
    v142 = 0u;
    v14 = v12 - v4 - v6;
    v143 = 0u;
    v144 = 0u;
    -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v141, v148, 16);
    v17 = (double *)MEMORY[0x1E0C9D648];
    v127 = v11;
    if (v16)
    {
      v18 = v16;
      v19 = 0;
      v20 = *(_QWORD *)v142;
      v21 = *MEMORY[0x1E0C9D648];
      v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v142 != v20)
            objc_enumerationMutation(v15);
          v24 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
          if ((objc_msgSend(v24, "isHidden") & 1) == 0)
          {
            objc_msgSend(v24, "sizeThatFits:", v126, v11);
            v26 = v25;
            objc_msgSend(v24, "setFrame:", v21, v22, v25, v27);
            v13 = v13 + v26;
            ++v19;
          }
        }
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v141, v148, 16);
      }
      while (v18);

      if (v19 >= 1)
      {
        if (v19 != 1)
          v13 = v13 + (float)((float)(v19 - 1) * 20.0);
        v14 = v14 - (v13 + 10.0);
      }
    }
    else
    {

    }
    v28 = 0.0;
    v137 = 0u;
    v138 = 0u;
    if (-[SKUIOfferView isCompactModeEnabled](self, "isCompactModeEnabled"))
      v29 = 0.0;
    else
      v29 = v14;
    v120 = v29;
    v139 = 0uLL;
    v140 = 0uLL;
    -[SKUIOfferView metadataViews](self, "metadataViews");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
    v32 = v126;
    if (v31)
    {
      v33 = v31;
      v34 = *(_QWORD *)v138;
      v35 = *v17;
      v36 = v17[1];
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v138 != v34)
            objc_enumerationMutation(v30);
          v38 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
          objc_msgSend(v38, "sizeThatFits:", v126, v127);
          v41 = v40;
          if (v39 >= v120)
            v42 = v120;
          else
            v42 = v39;
          SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v36, v42, v40, v128, v9, v126, v127);
          objc_msgSend(v38, "setFrame:");
          v28 = v28 + v41;
        }
        v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
      }
      while (v33);
    }

    metadataPosition = self->_metadataPosition;
    v44 = v123 + v13 + 10.0;
    if (!metadataPosition)
      v44 = v123;
    v119 = v44;
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
    if (v46)
    {
      v47 = v46;
      if (metadataPosition)
        v48 = v123;
      else
        v48 = v123 + v120 + 10.0;
      v49 = *(_QWORD *)v134;
      v112 = *v17;
      v113 = v17[1];
      v110 = v17[3];
      v111 = v17[2];
      v125 = v9;
      v114 = v28;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v134 != v49)
            objc_enumerationMutation(v45);
          v51 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * k);
          if ((objc_msgSend(v51, "isHidden", *(_QWORD *)&v110, *(_QWORD *)&v111, *(_QWORD *)&v112) & 1) != 0)
          {
            v9 = v125;
            v32 = v126;
          }
          else
          {
            objc_msgSend(v51, "frame");
            v53 = v52;
            v55 = v54;
            v56 = (v127 - v54) * 0.5;
            v57 = floorf(v56);
            SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v48, v57, v52, v54, v128, v125, v126, v127);
            objc_msgSend(v51, "setFrame:");
            -[SKUIOfferView notices](self, "notices");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKey:", v51);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            v122 = v53;
            v124 = v48;
            v118 = v55;
            if (v59)
            {
              rect = v57;
              v60 = -[SKUIOfferView isCompactModeEnabled](self, "isCompactModeEnabled");
              objc_msgSend(v59, "sizeThatFits:", v53 + 10.0, 1.79769313e308);
              v63 = v62;
              if (v61 >= v53 + 10.0)
                v64 = v53 + 10.0;
              else
                v64 = v61;
              v116 = v64;
              v117 = v62;
              if (v60)
              {
                v150.origin.x = v48;
                v150.origin.y = rect;
                v150.size.width = v53;
                v150.size.height = v55;
                MidY = CGRectGetMidY(v150);
                v151.origin.x = v48;
                v151.origin.y = v113;
                v151.size.width = v64;
                v151.size.height = v63;
                v66 = MidY + CGRectGetHeight(v151) * -0.5;
                v67 = v55;
                SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v48, v66, v64, v63, v128, v125, v126, v127);
                objc_msgSend(v59, "setFrame:");
                v152.origin.x = v48;
                v152.origin.y = v66;
                v152.size.width = v64;
                v152.size.height = v63;
                MaxY = CGRectGetMaxY(v152);
                v153.origin.x = v48;
                v153.origin.y = v66;
                v153.size.width = v64;
                v153.size.height = v63;
                v69 = v48 + CGRectGetWidth(v153) + 10.0;
                v57 = rect;
                v70 = v67;
                v71 = v66;
                v72 = v127;
                v73 = v125;
                SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v69, rect, v122, v70, v128, v125, v126, v127);
                objc_msgSend(v51, "setFrame:");
                v121 = v124;
                v124 = v69;
                v74 = v126;
                v75 = v128;
              }
              else
              {
                v76 = v48 + (v53 - v64) * 0.5;
                v77 = floorf(v76);
                v154.origin.x = v48;
                v78 = v77;
                v121 = v77;
                v154.origin.y = rect;
                v154.size.width = v53;
                v154.size.height = v55;
                v71 = CGRectGetMaxY(v154) + 3.0;
                v79 = v78;
                v72 = v127;
                v74 = v126;
                v73 = v125;
                SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v79, v71, v64, v63, v128, v125, v126, v127);
                objc_msgSend(v59, "setFrame:");
                v155.origin.x = v121;
                v155.origin.y = v71;
                v155.size.width = v64;
                v57 = rect;
                v155.size.height = v63;
                v80 = CGRectGetMaxY(v155);
                v75 = v128;
                MaxY = v80;
              }
            }
            else
            {
              v72 = v127;
              v75 = v128;
              MaxY = 0.0;
              v116 = v111;
              v117 = v110;
              v71 = v113;
              v121 = v112;
              v73 = v125;
              v74 = v126;
            }
            v81 = v75;
            v156.origin.x = v75;
            v156.origin.y = v73;
            v156.size.width = v74;
            v156.size.height = v72;
            v82 = CGRectGetMaxY(v156);
            if (MaxY <= v82)
            {
              v88 = v57;
              v86 = v122;
              v85 = v124;
              v92 = v117;
              v87 = v118;
              v94 = v121;
              v90 = v116;
            }
            else
            {
              v83 = MaxY - v82;
              v84 = v72;
              v85 = v124;
              v157.origin.x = v124;
              v157.origin.y = v57;
              v86 = v122;
              v157.size.width = v122;
              v87 = v118;
              v157.size.height = v118;
              v88 = fmax(round(CGRectGetMinY(v157) - v83), 0.0);
              SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v124, v88, v122, v118, v81, v73, v74, v84);
              objc_msgSend(v51, "setFrame:");
              v158.origin.x = v124;
              v158.origin.y = v88;
              v158.size.width = v122;
              v158.size.height = v118;
              v71 = CGRectGetMaxY(v158) + 3.0;
              v89 = v73;
              v90 = v116;
              v91 = v74;
              v92 = v117;
              v93 = v81;
              v94 = v121;
              SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v121, v71, v116, v117, v93, v89, v91, v127);
              objc_msgSend(v59, "setFrame:");
            }
            v159.origin.x = v85;
            v159.origin.y = v88;
            v159.size.width = v86;
            v159.size.height = v87;
            MaxX = CGRectGetMaxX(v159);
            v160.origin.x = v94;
            v160.origin.y = v71;
            v160.size.width = v90;
            v160.size.height = v92;
            v96 = CGRectGetMaxX(v160);
            if (MaxX >= v96)
              v96 = MaxX;
            v48 = v96 + 20.0;

            v9 = v125;
            v32 = v126;
            v28 = v114;
          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
      }
      while (v47);
    }

    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    -[SKUIOfferView metadataViews](self, "metadataViews");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
    if (v98)
    {
      v99 = v98;
      v100 = (v127 - v28) * 0.5;
      v101 = floorf(v100);
      v102 = *(_QWORD *)v130;
      do
      {
        for (m = 0; m != v99; ++m)
        {
          if (*(_QWORD *)v130 != v102)
            objc_enumerationMutation(v97);
          v104 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * m);
          objc_msgSend(v104, "frame");
          v106 = v105;
          v108 = v107;
          if (-[SKUIOfferView alignment](self, "alignment") == 3)
            v109 = v120 + v119 - v106;
          else
            v109 = v119;
          SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v109, v101, v106, v108, v128, v9, v32, v127);
          objc_msgSend(v104, "setFrame:");
          v161.origin.x = v109;
          v161.origin.y = v101;
          v161.size.width = v106;
          v161.size.height = v108;
          v101 = CGRectGetMaxY(v161);
        }
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
      }
      while (v99);
    }

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double height;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v62 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[SKUIOfferView metadataViews](self, "metadataViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  v9 = v6;
  v10 = v5;
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v57;
    v9 = v6;
    v10 = v5;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "sizeThatFits:", width, height);
        v9 = v9 + v15;
        if (v10 < v14)
          v10 = v14;
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v11);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  v18 = v6;
  v19 = v5;
  v49 = v6;
  v50 = v5;
  if (v17)
  {
    v20 = v17;
    v21 = *(_QWORD *)v53;
    v18 = v6;
    v19 = v5;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v23, "sizeThatFits:", width, height);
        v26 = v25;
        if (v18 < v24)
          v18 = v24;
        -[SKUIOfferView notices](self, "notices");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = -[SKUIOfferView isCompactModeEnabled](self, "isCompactModeEnabled");
          objc_msgSend(v28, "sizeThatFits:", v26, 1.79769313e308);
          v32 = v6 >= v31 ? v6 : v31;
          v6 = v29 ? v31 : v32;
          if (v29)
            v5 = v30;
        }
        v19 = v19 + v26 + 10.0;

      }
      v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v20);
  }

  if (v5 != v50 || v6 != v49)
  {
    if (-[SKUIOfferView isCompactModeEnabled](self, "isCompactModeEnabled"))
    {
      v19 = v19 + v5 + 10.0;
      if (v6 >= v18)
        v18 = v6;
    }
    else
    {
      v18 = v18 + v6 + 3.0;
    }
  }
  -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  -[SKUIOfferView metadataViews](self, "metadataViews");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  v38 = v35 <= 0 || v37 == 0;
  v39 = v10 + v19 + 10.0;
  if (v38)
    v39 = v10 + v19;
  if (v35 >= 2)
    v40 = v39 + (float)((float)(v35 - 1) * 20.0);
  else
    v40 = v39;
  if (v9 >= v18)
    v41 = v9;
  else
    v41 = v18;
  -[SKUIOfferView layoutMargins](self, "layoutMargins");
  v44 = v41 + v43 + v42;
  v47 = v40 + v45 + v46;
  v48 = v44;
  result.height = v48;
  result.width = v47;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  uint64_t v17;
  void *v18;
  objc_super v20;
  CGPoint v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SKUIOfferView hlsPlayButton](self, "hlsPlayButton");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = (void *)v8;
  -[SKUIOfferView hlsPlayButton](self, "hlsPlayButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabled");

  if (!v11)
    goto LABEL_5;
  -[SKUIOfferView hlsPlayButton](self, "hlsPlayButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v23 = CGRectInset(v22, -10.0, -11.0);
  v13 = v23.origin.x;
  v14 = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;

  v24.origin.x = v13;
  v24.origin.y = v14;
  v24.size.width = width;
  v24.size.height = height;
  v21.x = x;
  v21.y = y;
  if (CGRectContainsPoint(v24, v21))
  {
    -[SKUIOfferView hlsPlayButton](self, "hlsPlayButton");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v20.receiver = self;
    v20.super_class = (Class)SKUIOfferView;
    -[SKUIOfferView hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  return v18;
}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[SKUIOfferView isShowingConfirmation](self, "isShowingConfirmation"))
    v4 = objc_msgSend(v6, "isShowingConfirmation");
  else
    v4 = 0;
  -[SKUIOfferView setShowingConfirmation:](self, "setShowingConfirmation:", v4);
  -[SKUIOfferView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "offerViewDidAnimateTransition:", self);

}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  int64_t metadataPosition;
  double MaxX;
  double v18;
  double v19;
  double v20;
  double v21;
  int ShouldReverseLayoutDirection;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int v51;
  double v52;
  unint64_t v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIOfferView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v5, "offerViewAnimateTransition:", self))
  {
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObjectIdenticalTo:", v4);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      metadataPosition = self->_metadataPosition;
      v70.origin.x = v7;
      v70.origin.y = v9;
      v70.size.width = v11;
      v70.size.height = v13;
      MaxX = CGRectGetMaxX(v70);
      objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v19 = v18;
      v21 = v20;
      ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
      if (metadataPosition)
      {
        if (ShouldReverseLayoutDirection)
          v7 = MaxX - v19;
        objc_msgSend(v4, "setFrame:", v7, v9, v19, v21);
        -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (storeShouldReverseLayoutDirection())
        {
          v25 = v7 + -20.0;
        }
        else
        {
          v72.origin.x = v7;
          v72.origin.y = v9;
          v72.size.width = v19;
          v72.size.height = v21;
          v25 = CGRectGetMaxX(v72);
        }
        v27 = v15 + 1;
        if (v27 < v24)
        {
          do
          {
            -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndex:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v29, "isHidden") & 1) == 0)
            {
              objc_msgSend(v29, "frame");
              v31 = v30;
              v33 = v32;
              v35 = v34;
              if (storeShouldReverseLayoutDirection())
                v36 = v33;
              else
                v36 = -20.0;
              objc_msgSend(v29, "setFrame:", v25 - v36, v31, v33, v35);
            }

            ++v27;
          }
          while (v24 != v27);
        }
        if (-[SKUIOfferView alignment](self, "alignment") != 3)
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          -[SKUIOfferView metadataViews](self, "metadataViews", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v65 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                objc_msgSend(v42, "frame");
                v44 = v43;
                v46 = v45;
                v48 = v47;
                v50 = v49;
                v51 = storeShouldReverseLayoutDirection();
                v52 = v25;
                if (v51)
                {
                  v73.origin.x = v44;
                  v73.origin.y = v46;
                  v73.size.width = v48;
                  v73.size.height = v50;
                  v52 = v25 - CGRectGetWidth(v73);
                }
                objc_msgSend(v42, "setFrame:", v52 + 10.0, v46, v48, v50);
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
            }
            while (v39);
          }

        }
      }
      else
      {
        if (!ShouldReverseLayoutDirection)
          v7 = MaxX - v19;
        objc_msgSend(v4, "setFrame:", v7, v9, v19, v21);
        if (storeShouldReverseLayoutDirection())
        {
          v71.origin.x = v7;
          v71.origin.y = v9;
          v71.size.width = v19;
          v71.size.height = v21;
          v26 = CGRectGetMaxX(v71);
        }
        else
        {
          v26 = v7 + -20.0;
        }
        if (v15 >= 1)
        {
          v53 = v15 + 1;
          do
          {
            -[SKUIOfferView offerButtonViews](self, "offerButtonViews");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectAtIndex:", v53 - 2);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v55, "isHidden") & 1) == 0)
            {
              objc_msgSend(v55, "frame");
              v57 = v56;
              v59 = v58;
              v61 = v60;
              if (storeShouldReverseLayoutDirection())
                v62 = -20.0;
              else
                v62 = v59;
              v63 = v26 - v62;
              objc_msgSend(v55, "setFrame:", v63, v57, v59, v61);
              if (storeShouldReverseLayoutDirection())
              {
                v74.origin.x = v63;
                v74.origin.y = v57;
                v74.size.width = v59;
                v74.size.height = v61;
                v26 = CGRectGetMaxX(v74) + 20.0;
              }
              else
              {
                v26 = v63 + -20.0;
              }
            }

            --v53;
          }
          while (v53 > 1);
        }
      }
    }
  }
  -[SKUIOfferView setShowingConfirmation:](self, "setShowingConfirmation:", objc_msgSend(v4, "isShowingConfirmation"));

}

- (void)_buttonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIOfferView buttonElements](self, "buttonElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIOfferView hlsPlayButton](self, "hlsPlayButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4 && v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DAF640]);
    -[SKUIOfferView hlsID](self, "hlsID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __31__SKUIOfferView__buttonAction___block_invoke;
    v16[3] = &unk_1E73A9970;
    v17 = v6;
    v18 = v9;
    v10 = v9;
    objc_msgSend(v8, "isRemovedSystemApplicationWithBundleIdentifier:completionBlock:", CFSTR("com.apple.tv"), v16);

    v11 = v17;
LABEL_12:

    goto LABEL_13;
  }
  if (v6)
  {
    SKUICollectionViewCellForView(self);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    SKUICollectionViewForView(v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIOfferView offerViewStateDescription](self, "offerViewStateDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v19 = CFSTR("action");
      -[SKUIOfferView offerViewStateDescription](self, "offerViewStateDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "indexPathForCell:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v10, v6, v14, v15);

    }
    else
    {
      objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v14, 0);
    }

    goto LABEL_12;
  }
LABEL_13:

}

void __31__SKUIOfferView__buttonAction___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__SKUIOfferView__buttonAction___block_invoke_2;
  v7[3] = &unk_1E73A9580;
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __31__SKUIOfferView__buttonAction___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(a1 + 32))
  {
    v6 = CFSTR("adam-identifier");
    v2 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "longLongValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", CFSTR("playbackDisabledEvent"), CFSTR("onPlay"), 1, 0, v4, 0);

  }
  else
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("videos://play?adam-id=%lld&allowCloudPlayback=1"), objc_msgSend(*(id *)(a1 + 48), "longLongValue"));
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIMetricsOpenSensitiveURL(v1, 0);

  }
}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4;

  v4 = a3;
  -[SKUIOfferView setShowingConfirmation:](self, "setShowingConfirmation:", 0);
  -[SKUIOfferView bringSubviewToFront:](self, "bringSubviewToFront:", v4);
  -[SKUIOfferView _sendWillAnimate](self, "_sendWillAnimate");
  objc_msgSend(v4, "setShowingConfirmation:animated:", 0, 1);

}

- (void)_showConfirmationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIOfferView buttonElements](self, "buttonElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = CFSTR("action");
    -[SKUIOfferView offerViewStateDescription](self, "offerViewStateDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", CFSTR("buyInitiate"), CFSTR("onbuyinitiate"), 1, 1, v8, 0);

  }
  -[SKUIOfferView bringSubviewToFront:](self, "bringSubviewToFront:", v4);
  -[SKUIOfferView _sendWillAnimate](self, "_sendWillAnimate");
  objc_msgSend(v4, "setShowingConfirmation:animated:", 1, 1);

}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SKUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 9.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v5, "buttonViewType") == 9;
  objc_msgSend(v5, "buttonText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v11, v13, v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v5, "labelViewStyle");
  if (v11 > 5)
    goto LABEL_18;
  if (((1 << v11) & 0x13) != 0)
  {
    if (v8)
    {
      if (!v10)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 9.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v10 = (void *)v12;
      }
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  if (((1 << v11) & 0x24) != 0)
  {
    if (v8)
    {
      if (v10)
        goto LABEL_18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 7.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_14;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (!v10)
    goto LABEL_21;
LABEL_14:
  v13 = 1;
LABEL_19:
  objc_msgSend(v5, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v8, v10, v13, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_sendWillAnimate
{
  id v3;

  -[SKUIOfferView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "offerViewWillAnimateTransition:", self);

}

- (BOOL)_shouldHideNoticesWithBuyButtonDescriptor:(id)a3 context:(id)a4
{
  id v4;
  uint64_t v5;
  SKUIStoreIdentifier *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "itemIdentifier");
  objc_msgSend(v4, "storeIdentifier");
  v6 = (SKUIStoreIdentifier *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v5)
    v6 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", v5);
  v10 = 0;
  if (v6)
  {
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stateForItemWithStoreIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "state") & 0xF;
    if (v9)
      v10 = 1;
  }

  return v10;
}

- (SKUIOfferViewDelegate)delegate
{
  return (SKUIOfferViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)metadataPosition
{
  return self->_metadataPosition;
}

- (void)setMetadataPosition:(int64_t)a3
{
  self->_metadataPosition = a3;
}

- (BOOL)isShowingConfirmation
{
  return self->_showingConfirmation;
}

- (void)setShowingConfirmation:(BOOL)a3
{
  self->_showingConfirmation = a3;
}

- (BOOL)isCompactModeEnabled
{
  return self->_compactModeEnabled;
}

- (void)setCompactModeEnabled:(BOOL)a3
{
  self->_compactModeEnabled = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSMapTable)buttonElements
{
  return self->_buttonElements;
}

- (void)setButtonElements:(id)a3
{
  objc_storeStrong((id *)&self->_buttonElements, a3);
}

- (NSMapTable)buyButtonDescriptorToButton
{
  return self->_buyButtonDescriptorToButton;
}

- (void)setBuyButtonDescriptorToButton:(id)a3
{
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, a3);
}

- (NSMapTable)notices
{
  return self->_notices;
}

- (void)setNotices:(id)a3
{
  objc_storeStrong((id *)&self->_notices, a3);
}

- (UIButton)hlsPlayButton
{
  return self->_hlsPlayButton;
}

- (void)setHlsPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_hlsPlayButton, a3);
}

- (NSNumber)hlsID
{
  return self->_hlsID;
}

- (void)setHlsID:(id)a3
{
  objc_storeStrong((id *)&self->_hlsID, a3);
}

- (NSMutableArray)metadataViews
{
  return self->_metadataViews;
}

- (void)setMetadataViews:(id)a3
{
  objc_storeStrong((id *)&self->_metadataViews, a3);
}

- (NSMutableArray)offerButtonViews
{
  return self->_offerButtonViews;
}

- (void)setOfferButtonViews:(id)a3
{
  objc_storeStrong((id *)&self->_offerButtonViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerButtonViews, 0);
  objc_storeStrong((id *)&self->_metadataViews, 0);
  objc_storeStrong((id *)&self->_hlsID, 0);
  objc_storeStrong((id *)&self->_hlsPlayButton, 0);
  objc_storeStrong((id *)&self->_notices, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);
  objc_storeStrong((id *)&self->_buttonElements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIOfferView preferredSizeForViewElement:context:]";
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

@end
