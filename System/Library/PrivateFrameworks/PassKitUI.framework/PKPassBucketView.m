@implementation PKPassBucketView

- (void)_measureAndFitVariablySizedSubviews
{
  PKPassBucketView *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  int *v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  PKPassBucketView *v43;
  uint64_t v44;
  int *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  float v76;
  double v77;
  uint64_t v78;
  double v79;
  double v80;
  uint64_t i;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  double width;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  double v103;
  NSMutableArray *obj;
  NSMutableArray *obja;
  CGRect slice;
  CGRect remainder;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;
  CGRect v119;

  v2 = self;
  v118 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_currentFieldViews, "count");
  v4 = 464;
  -[PKPassBucketTemplate minFieldPadding](v2->_bucketTemplate, "minFieldPadding");
  v6 = v5;
  -[PKPassBucketTemplate bucketRect](v2->_bucketTemplate, "bucketRect");
  v8 = v7;
  v100 = v3;
  v9 = (double)(v3 - 1);
  -[PKPassBucketTemplate defaultFieldTemplate](v2->_bucketTemplate, "defaultFieldTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "xHeight");
  v13 = v12;
  objc_msgSend(v10, "valueFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "xHeight");
  v16 = 1.0;
  if (v13 / v15 <= 1.0)
  {
    objc_msgSend(v10, "labelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "xHeight");
    v19 = v18;
    objc_msgSend(v10, "valueFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "xHeight");
    v16 = v19 / v21;

  }
  v101 = v10;
  v22 = v8 - v9 * v6;

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v2->_currentFieldViews;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v113;
    v26 = *MEMORY[0x1E0C9D538];
    v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v28 = 0.0;
    v29 = &OBJC_IVAR___PKAddCredentialToWatchViewController__heroCardView;
    v30 = 0.0;
    do
    {
      v31 = 0;
      v102 = v24;
      do
      {
        if (*(_QWORD *)v113 != v25)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v31);
        objc_msgSend(v32, "fieldTemplate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v29[645]), "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          objc_msgSend(v33, "valueFont");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v33, "setValueFont:", v34);
        objc_msgSend(v32, "setFieldTemplate:", v33);
        objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v4), "bucketRect");
        objc_msgSend(v32, "sizeThatFits:", v35, v36);
        v38 = v37;
        objc_msgSend(v32, "setFrame:", v26, v27, v37, v39);
        v40 = v38;
        if ((objc_msgSend(v33, "valueCanWrap") & 1) == 0)
        {
          objc_msgSend(v32, "valueLabel");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "attributedText");
          v42 = v25;
          v43 = v2;
          v44 = v4;
          v45 = v29;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "size");
          v40 = ceil(v47);

          v29 = v45;
          v4 = v44;
          v2 = v43;
          v25 = v42;
          v24 = v102;

        }
        v30 = v30 + v38;
        objc_msgSend(v32, "labelLabel");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "attributedText");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "size");
        v51 = ceil(v50);

        v52 = -0.0;
        if (v51 < v40)
          v52 = v40;
        v28 = v28 + v52;

        ++v31;
      }
      while (v24 != v31);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
    }
    while (v24);
  }
  else
  {
    v28 = 0.0;
    v30 = 0.0;
  }
  v103 = v16;

  if (v30 <= v22)
  {
    v54 = v101;
  }
  else
  {
    v53 = ceil((v30 - v22) / (double)v100);
    v54 = v101;
    while (1)
    {
      -[PKPassBucketView _fieldViewsByWidth](v2, "_fieldViewsByWidth");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "lastObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "fieldTemplate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "valueCanWrap");

      if (!v58)
        break;
      objc_msgSend(v56, "frame");
      if (v53 >= v59)
        break;
      objc_msgSend(v56, "frame");
      v61 = v60;
      v63 = v62;
      v65 = v30 - v64;
      v66 = v64 - v53;
      objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v4), "bucketRect");
      v68 = v67;
      objc_msgSend(v56, "invalidateCachedFieldSize");
      objc_msgSend(v56, "sizeThatFits:", v66, v68);
      objc_msgSend(v56, "setFrame:", v61, v63, v66, v69);
      v30 = v65 + v66;

      if (v30 <= v22)
        goto LABEL_26;
    }

  }
LABEL_26:
  v70 = 1.0;
  if (v30 > v22 && v28 > 0.0)
  {
    objc_msgSend(v54, "valueFont");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "pointSize");
    v73 = v72;

    if ((v22 - (v30 - v28)) / v28 >= v103)
      v70 = (v22 - (v30 - v28)) / v28;
    else
      v70 = v103;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    obja = v2->_currentFieldViews;
    v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
    if (v74)
    {
      v75 = v74;
      v76 = v70 * v73;
      v77 = floorf(v76);
      v78 = *(_QWORD *)v109;
      v79 = *MEMORY[0x1E0C9D538];
      v80 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v30 = 0.0;
      do
      {
        for (i = 0; i != v75; ++i)
        {
          if (*(_QWORD *)v109 != v78)
            objc_enumerationMutation(obja);
          v82 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
          objc_msgSend(v82, "fieldTemplate");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = (void *)MEMORY[0x1E0DC1350];
          objc_msgSend(v83, "valueFont");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "fontDescriptor");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "fontWithDescriptor:size:", v86, v77);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setValueFont:", v87);

          objc_msgSend(v82, "setFieldTemplate:", v83);
          objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v4), "bucketRect");
          objc_msgSend(v82, "sizeThatFits:", v88, v89);
          v91 = v90;
          objc_msgSend(v82, "setFrame:", v79, v80, v90, v92);
          v30 = v30 + v91;

        }
        v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
      }
      while (v75);
    }
    else
    {
      v30 = 0.0;
    }

    v54 = v101;
  }
  if (v30 > v22)
  {
    -[PKPassBucketView _fieldViewsByWidth](v2, "_fieldViewsByWidth");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0;
    v95 = objc_msgSend(v93, "count") - 1;
    do
    {
      v96 = v94;
      objc_msgSend(v93, "objectAtIndex:", v95);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v94, "frame");
      memset(&remainder, 0, sizeof(remainder));
      memset(&slice, 0, sizeof(slice));
      CGRectDivide(v119, &slice, &remainder, v30 - v22, CGRectMaxXEdge);
      objc_msgSend(v94, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      width = slice.size.width;
      objc_msgSend(v94, "valueLabel");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setAdjustsFontSizeToFitWidth:", 1);

      objc_msgSend(v94, "valueLabel");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setMinimumScaleFactor:", v70);

      if (!v95)
        break;
      v30 = v30 - width;
      --v95;
    }
    while (v30 > v22);

  }
}

- (PKPassBucketTemplate)bucketTemplate
{
  return self->_bucketTemplate;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  int64_t v5;
  double v6;
  double v7;
  unint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  double v17;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  void *v26;
  double width;
  double height;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v69 = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)PKPassBucketView;
  -[PKPassBucketView layoutSubviews](&v64, sel_layoutSubviews);
  if (-[NSArray count](self->_bucket, "count"))
  {
    -[PKPassBucketView _updateSubviews](self, "_updateSubviews");
    -[PKPassBucketView bounds](self, "bounds");
    v4 = v3;
    v5 = -[PKPassBucketTemplate bucketAlignment](self->_bucketTemplate, "bucketAlignment");
    if (v5 == 3)
      -[PKPassBucketView _measureAndFitEvenlySizedSubviews](self, "_measureAndFitEvenlySizedSubviews");
    else
      -[PKPassBucketView _measureAndFitVariablySizedSubviews](self, "_measureAndFitVariablySizedSubviews");
    -[PKPassBucketTemplate minFieldPadding](self->_bucketTemplate, "minFieldPadding");
    v7 = v6;
    v8 = -[NSMutableArray count](self->_currentFieldViews, "count");
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v9 = self->_currentFieldViews;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    v11 = 0.0;
    v12 = 0.0;
    if (v10)
    {
      v13 = v10;
      v14 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v61 != v14)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "frame");
          v12 = v12 + v7 + v16;
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v13);
    }

    v17 = v4 - (v12 - v7);
    if (v17 > 0.0 && v8 >= 2)
      v11 = v17 / (double)(v8 - 1);
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v19 = self->_currentFieldViews;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v57;
        v23 = 0.0;
        do
        {
          v24 = 0;
          v25 = v23;
          do
          {
            if (*(_QWORD *)v57 != v22)
              objc_enumerationMutation(v19);
            v26 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v24);
            objc_msgSend(v26, "frame");
            width = v70.size.width;
            height = v70.size.height;
            v70.origin.y = 0.0;
            v70.origin.x = v25;
            v23 = v7 + v11 + CGRectGetMaxX(v70);
            objc_msgSend(v26, "setFrame:", v25, 0.0, width, height);
            ++v24;
            v25 = v23;
          }
          while (v21 != v24);
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        }
        while (v21);
      }
    }
    else if (v5)
    {
      if (v5 != 1)
        return;
      -[PKPassBucketTemplate bucketRect](self->_bucketTemplate, "bucketRect");
      v30 = v29;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v19 = self->_currentFieldViews;
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v53 != v33)
              objc_enumerationMutation(v19);
            v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_msgSend(v35, "frame");
            v36 = v71.size.width;
            v37 = v71.size.height;
            v38 = v30 - v71.size.width;
            v71.origin.y = 0.0;
            v71.origin.x = v30 - v71.size.width;
            v30 = CGRectGetMinX(v71) - v7;
            objc_msgSend(v35, "setFrame:", v38, 0.0, v36, v37);
          }
          v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        }
        while (v32);
      }
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v19 = self->_currentFieldViews;
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v49;
        v42 = 0.0;
        do
        {
          v43 = 0;
          v44 = v42;
          do
          {
            if (*(_QWORD *)v49 != v41)
              objc_enumerationMutation(v19);
            v45 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v43);
            objc_msgSend(v45, "frame", (_QWORD)v48);
            v46 = v72.size.width;
            v47 = v72.size.height;
            v72.origin.y = 0.0;
            v72.origin.x = v44;
            v42 = v7 + CGRectGetMaxX(v72);
            objc_msgSend(v45, "setFrame:", v44, 0.0, v46, v47);
            ++v43;
            v44 = v42;
          }
          while (v40 != v43);
          v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
        }
        while (v40);
      }
    }

  }
}

- (void)_updateSubviews
{
  id v3;
  NSMapTable *v4;
  NSMapTable *templateToOriginalValueFontMap;
  NSArray *bucket;
  id v7;
  NSArray *v8;
  NSArray *fieldViews;
  NSMutableArray *currentFieldViews;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self->_fieldViews)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3748], "pk_strongPointerPersonalityToWeakObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    templateToOriginalValueFontMap = self->_templateToOriginalValueFontMap;
    self->_templateToOriginalValueFontMap = v4;

    bucket = self->_bucket;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __35__PKPassBucketView__updateSubviews__block_invoke;
    v27[3] = &unk_1E3E64AA8;
    v27[4] = self;
    v28 = v3;
    v7 = v3;
    -[NSArray enumerateObjectsUsingBlock:](bucket, "enumerateObjectsUsingBlock:", v27);
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    fieldViews = self->_fieldViews;
    self->_fieldViews = v8;

  }
  currentFieldViews = self->_currentFieldViews;
  if (currentFieldViews)
  {
    -[NSMutableArray removeAllObjects](currentFieldViews, "removeAllObjects");
  }
  else
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = self->_currentFieldViews;
    self->_currentFieldViews = v11;

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_fieldViews;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v17, "field");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "foreignReferenceType"))
        {
          objc_msgSend(v17, "setHidden:", 0);
LABEL_16:
          -[NSMutableArray addObject:](self->_currentFieldViews, "addObject:", v17);
          goto LABEL_18;
        }
        objc_msgSend(v18, "label");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          objc_msgSend(v18, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setHidden:", v21 == 0);
          if (v21)
            goto LABEL_16;
        }
        else
        {
          objc_msgSend(v17, "setHidden:", 1);
        }
LABEL_18:

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v14);
  }

}

- (void)setPass:(id)a3
{
  PKPass *v5;
  PKPass *v6;

  v5 = (PKPass *)a3;
  if (self->_pass != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pass, a3);
    v5 = v6;
  }

}

- (void)setColorProfile:(id)a3
{
  PKPassColorProfile *v5;
  PKPassColorProfile *v6;

  v5 = (PKPassColorProfile *)a3;
  if (self->_colorProfile != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_colorProfile, a3);
    v5 = v6;
  }

}

- (void)setBucketTemplate:(id)a3
{
  PKPassBucketTemplate *v5;
  PKPassBucketTemplate *v6;

  v5 = (PKPassBucketTemplate *)a3;
  if (self->_bucketTemplate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bucketTemplate, a3);
    self->_background = -[PKPassBucketView _backgroundForBucketTemplate:](self, "_backgroundForBucketTemplate:", self->_bucketTemplate);
    v5 = v6;
  }

}

- (int64_t)_backgroundForBucketTemplate:(id)a3
{
  void *v4;
  char v5;
  void *v7;
  int v8;

  if (objc_msgSend(a3, "sitsOnStripImage"))
  {
    -[PKPass displayProfile](self->_pass, "displayProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showsStripImage");

    if ((v5 & 1) != 0)
      return 1;
  }
  -[PKPass displayProfile](self->_pass, "displayProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showsBackgroundImage");

  if (v8)
    return 2;
  else
    return 0;
}

- (void)setBucket:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_bucket != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bucket, a3);
    v5 = v6;
  }

}

void __35__PKPassBucketView__updateSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "templateForFieldAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "maxFields") > a3)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
    objc_msgSend(v7, "valueFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v7);

    v10 = +[PKPassFieldView newViewForField:fieldTemplate:](PKPassFieldView, "newViewForField:fieldTemplate:", v11, v7);
    objc_msgSend(v10, "setColorProfile:background:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v10);

  }
  else
  {
    *a4 = 1;
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassBucketView frame](self, "frame");
  objc_msgSend(v3, "appendFormat:", CFSTR("frame = (%g %g; %g %g); "), v4, v5, v6, v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_fieldViews;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n    %@"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_measureAndFitEvenlySizedSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  uint64_t obj;
  id obja;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  -[PKPassBucketTemplate defaultFieldTemplate](self->_bucketTemplate, "defaultFieldTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableArray count](self->_currentFieldViews, "count");
  -[PKPassBucketTemplate minFieldPadding](self->_bucketTemplate, "minFieldPadding");
  v6 = v5;
  -[PKPassBucketTemplate bucketRect](self->_bucketTemplate, "bucketRect");
  v8 = v7 - (double)(v4 - 1) * v6;
  v9 = (double)v4;
  objc_msgSend(v3, "valueFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointSize");
  v12 = v11;

  objc_msgSend(v3, "labelFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "xHeight");
  v15 = v14;
  objc_msgSend(v3, "valueFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "xHeight");
  v18 = 1.0;
  if (v15 / v17 <= 1.0)
  {
    objc_msgSend(v3, "labelFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "xHeight");
    v21 = v20;
    objc_msgSend(v3, "valueFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "xHeight");
    v18 = v21 / v23;

  }
  v55 = v3;
  v24 = v8 / v9;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = 424;
  v25 = self->_currentFieldViews;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v63;
    v29 = v12;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v31, "fieldTemplate", v55, obj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_templateToOriginalValueFontMap, "objectForKey:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33)
        {
          objc_msgSend(v32, "valueFont");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v32, "setValueFont:", v33);
        objc_msgSend(v31, "setFieldTemplate:", v32);
        -[PKPassBucketTemplate bucketRect](self->_bucketTemplate, "bucketRect");
        objc_msgSend(v31, "sizeThatFits:", v34, v35);
        objc_msgSend(v31, "valueLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "bounds");
        v38 = v37;

        if (v38 > v24)
        {
          v39 = v24 / v38;
          if (v24 / v38 <= v18)
            v39 = v18;
          v40 = floor(v12 * v39);
          if (v40 < v29)
            v29 = v40;
        }

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v27);
  }
  else
  {
    v29 = v12;
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obja = *(id *)((char *)&self->super.super.super.isa + obj);
  v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v59;
    v44 = *MEMORY[0x1E0C9D538];
    v45 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(obja);
        v47 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        objc_msgSend(v47, "fieldTemplate", v55);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)MEMORY[0x1E0DC1350];
        objc_msgSend(v48, "valueFont");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "fontDescriptor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "fontWithDescriptor:size:", v51, v29);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "setValueFont:", v52);
        objc_msgSend(v47, "setFieldTemplate:", v48);
        -[PKPassBucketTemplate bucketRect](self->_bucketTemplate, "bucketRect");
        v54 = v53;
        objc_msgSend(v47, "sizeThatFits:", v24, v53);
        objc_msgSend(v47, "setFrame:", v44, v45, v24, v54);

      }
      v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v42);
  }

}

- (id)_fieldViewsByWidth
{
  return (id)-[NSMutableArray sortedArrayUsingComparator:](self->_currentFieldViews, "sortedArrayUsingComparator:", &__block_literal_global_34);
}

uint64_t __38__PKPassBucketView__fieldViewsByWidth__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  v8 = v7;

  if (v6 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 > v8)
    return 1;
  else
    return v9;
}

- (void)presentDiff:(id)a3 inView:(id)a4 completion:(id)a5
{
  -[PKPassBucketView _presentRecursiveDiff:inView:forSubviewAtIndex:withSubviews:completion:](self, "_presentRecursiveDiff:inView:forSubviewAtIndex:withSubviews:completion:", a3, a4, 0, self->_currentFieldViews, a5);
}

- (void)_presentRecursiveDiff:(id)a3 inView:(id)a4 forSubviewAtIndex:(unint64_t)a5 withSubviews:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  id v22[2];
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(_QWORD))a7;
  if (objc_msgSend(v14, "count") <= a5)
  {
    if (v15)
      v15[2](v15);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v14, "objectAtIndexedSubscript:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __91__PKPassBucketView__presentRecursiveDiff_inView_forSubviewAtIndex_withSubviews_completion___block_invoke;
    v17[3] = &unk_1E3E64AD0;
    objc_copyWeak(v22, &location);
    v18 = v12;
    v19 = v13;
    v22[1] = (id)a5;
    v20 = v14;
    v21 = v15;
    objc_msgSend(v16, "presentDiff:inView:completion:", v18, v19, v17);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

}

void __91__PKPassBucketView__presentRecursiveDiff_inView_forSubviewAtIndex_withSubviews_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_presentRecursiveDiff:inView:forSubviewAtIndex:withSubviews:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72) + 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (PKPass)pass
{
  return self->_pass;
}

- (PKPassColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (NSArray)bucket
{
  return self->_bucket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_bucketTemplate, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_templateToOriginalValueFontMap, 0);
  objc_storeStrong((id *)&self->_currentFieldViews, 0);
  objc_storeStrong((id *)&self->_fieldViews, 0);
}

@end
