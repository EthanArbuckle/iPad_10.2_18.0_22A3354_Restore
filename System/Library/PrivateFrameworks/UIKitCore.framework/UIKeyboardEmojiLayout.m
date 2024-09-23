@implementation UIKeyboardEmojiLayout

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  NSMutableDictionary *attributes;
  NSMutableArray *headerWidths;
  objc_super v5;

  attributes = self->_attributes;
  self->_attributes = 0;

  headerWidths = self->_headerWidths;
  self->_headerWidths = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiLayout;
  -[UIKeyboardEmojiLayout dealloc](&v5, sel_dealloc);
}

- (void)_setAttributes:(id)a3 forSection:(int64_t)a4
{
  NSMutableDictionary *attributes;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  attributes = self->_attributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](attributes, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (v8 != v12)
  {
    v10 = self->_attributes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, v11);
    else
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

    v9 = v12;
  }

}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *attributes;
  NSMutableArray *v7;
  NSMutableArray *headerWidths;
  uint64_t i;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v10, sel_prepareLayout);
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (!self->_attributes)
  {
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4);
    attributes = self->_attributes;
    self->_attributes = v5;

  }
  if (self->_headerWidths)
  {
    if (!v4)
      return;
  }
  else
  {
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    headerWidths = self->_headerWidths;
    self->_headerWidths = v7;

    if (!v4)
      return;
  }
  for (i = 0; i != v4; ++i)
    -[NSMutableArray setObject:atIndexedSubscript:](self->_headerWidths, "setObject:atIndexedSubscript:", &unk_1E1A95B00, i);
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  NSMutableArray *headerWidths;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardEmojiLayout;
  -[UICollectionViewFlowLayout invalidateLayoutWithContext:](&v20, sel_invalidateLayoutWithContext_, v4);
  if ((objc_msgSend(v4, "invalidateDataSourceCounts") & 1) != 0
    || objc_msgSend(v4, "invalidateEverything"))
  {
    if (self->_attributes)
    {
      headerWidths = self->_headerWidths;
      if (headerWidths)
      {
        if (-[NSMutableArray count](headerWidths, "count"))
        {
          v6 = 0;
          do
          {
            -[UIKeyboardEmojiLayout _setAttributes:forSection:](self, "_setAttributes:forSection:", 0, v6);
            -[NSMutableArray setObject:atIndexedSubscript:](self->_headerWidths, "setObject:atIndexedSubscript:", &unk_1E1A95B00, v6++);
          }
          while (v6 < -[NSMutableArray count](self->_headerWidths, "count"));
        }
      }
    }
  }
  else
  {
    objc_msgSend(v4, "invalidatedSupplementaryIndexPaths");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UICollectionElementKindSectionHeader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "section");
          -[UIKeyboardEmojiLayout _setAttributes:forSection:](self, "_setAttributes:forSection:", 0, v12);
          objc_msgSend(v4, "preferredWidthForHeaderInSection:", v12);
          if (v13 > 0.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray setObject:atIndexedSubscript:](self->_headerWidths, "setObject:atIndexedSubscript:", v14, v12);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *attributes;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  double v36;
  double v37;
  double v38;
  double v39;
  double MinX;
  objc_super v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41.receiver = self;
  v41.super_class = (Class)UIKeyboardEmojiLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v41, sel_layoutAttributesForElementsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfSections");

  if (v11 >= 1)
  {
    v12 = 0;
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v39 = *MEMORY[0x1E0C9D648];
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v37 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    do
    {
      attributes = self->_attributes;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](attributes, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardEmojiLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("UICollectionElementKindSectionHeader"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardEmojiLayout _setAttributes:forSection:](self, "_setAttributes:forSection:", v17, v12);

      }
      v18 = self->_attributes;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = self->_attributes;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v38;
        v24 = v39;
        v27 = v36;
        v26 = v37;
        if (v23)
          objc_msgSend(v23, "frame", v39, v38, v37, v36);
        v28 = v24;
        v29 = v25;
        v30 = v26;
        v31 = v27;
        MinX = CGRectGetMinX(*(CGRect *)&v24);
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        if (MinX >= CGRectGetMaxX(v42))
        {

          return v9;
        }
        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        v44.origin.x = v28;
        v44.origin.y = v29;
        v44.size.width = v30;
        v44.size.height = v31;
        if (CGRectIntersectsRect(v43, v44))
        {
          v32 = self->_attributes;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v34);

        }
      }
      ++v12;
    }
    while (v11 != v12);
  }
  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  _BYTE *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double MinX;
  double MaxX;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v97;
  CGFloat x;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  id v108;
  double v109;
  objc_super v110;
  uint64_t v111;
  _QWORD v112[3];
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v112[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection"))
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = objc_msgSend(v7, "section");
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "numberOfItemsInSection:", v17);

    if (!v19)
    {
      v83 = *MEMORY[0x1E0C9D648];
      v84 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v86 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v85 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_22:
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](UICollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setFrame:", v83, v84, v86, v85);
      goto LABEL_23;
    }
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "emojiGraphicsTraits");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndexedSubscript:](self->_headerWidths, "objectAtIndexedSubscript:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    if (v24 == 0.0)
    {
      +[UIKeyboardEmojiCategory displayName:](UIKeyboardEmojiCategory, "displayName:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", v17));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uppercaseStringWithLocale:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "categoryHeaderFontSize");
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v111 = *(_QWORD *)off_1E1678D90;
      objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, &v111, 1);
      v30 = v6;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v7;
      v32 = v27;
      objc_msgSend(v27, "sizeWithAttributes:", v31);
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      UICeilToViewScale(v33);
      objc_msgSend(v28, "numberWithDouble:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](self->_headerWidths, "setObject:atIndexedSubscript:", v34, v17);

      v6 = v30;
      v7 = v108;
    }
    v106 = v16;
    v107 = v10;
    v102 = v14;
    v103 = v12;
    -[UICollectionViewFlowLayout _calculateAttributesForRect:](self, "_calculateAttributesForRect:", v10, v12, v14, v16);
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layoutAttributesForItemAtIndexPath:", v7);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    -[UICollectionViewLayout collectionView](self, "collectionView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "numberOfItemsInSection:", v17) - 1;

    -[UICollectionViewLayout collectionView](self, "collectionView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v46, v17);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutAttributesForItemAtIndexPath:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "frame");
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;

    v113.origin.x = v38;
    v113.origin.y = v40;
    v101 = v42;
    v113.size.width = v42;
    v58 = v44;
    v113.size.height = v44;
    v122.origin.x = v51;
    v122.origin.y = v53;
    v122.size.width = v55;
    v122.size.height = v57;
    v114 = CGRectUnion(v113, v122);
    x = v114.origin.x;
    y = v114.origin.y;
    width = v114.size.width;
    height = v114.size.height;
    -[NSMutableArray objectAtIndexedSubscript:](self->_headerWidths, "objectAtIndexedSubscript:", v17);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "doubleValue");
    v64 = v63;

    objc_msgSend(v21, "categoryHeaderHeight");
    v105 = v65;
    objc_msgSend(v21, "columnOffset");
    v67 = v66;
    objc_msgSend(v21, "inputViewLeftMostPadding");
    v104 = v64;
    v99 = height;
    v100 = width;
    if (v68 <= 50.0)
    {
      objc_msgSend(v21, "categoryHeaderLeftPadding");
      v97 = v87 + v87;
      v72 = v67;
      if (v17)
      {
LABEL_16:
        v109 = v72;
        v115.origin.x = v38;
        v115.origin.y = v40;
        v115.size.width = v101;
        v115.size.height = v58;
        MinX = CGRectGetMinX(v115);
        v116.origin.x = v107;
        v116.origin.y = v103;
        v116.size.width = v102;
        v116.size.height = v106;
        if (MinX >= v109 + CGRectGetMinX(v116))
        {
          v120.origin.x = v38;
          v120.origin.y = v40;
          v120.size.width = v101;
          v120.size.height = v58;
          v92 = CGRectGetMinX(v120);
          objc_msgSend(v21, "categoryHeaderLeftPadding");
          v83 = v92 + v93;
          v86 = v104;
        }
        else
        {
          v117.origin.x = x;
          v117.origin.y = y;
          v117.size.height = v99;
          v117.size.width = width;
          MaxX = CGRectGetMaxX(v117);
          v118.origin.x = v107;
          v118.origin.y = v103;
          v118.size.width = v102;
          v118.size.height = v106;
          v86 = v104;
          if (MaxX - CGRectGetMinX(v118) >= v104 + v67 + v97)
          {
            v121.origin.x = v107;
            v121.origin.y = v103;
            v121.size.width = v102;
            v121.size.height = v106;
            v94 = v109 + CGRectGetMinX(v121);
            objc_msgSend(v21, "categoryHeaderLeftPadding");
            v83 = v94 + v95;
          }
          else
          {
            v119.origin.x = x;
            v119.origin.y = y;
            v119.size.height = v99;
            v119.size.width = v100;
            v90 = CGRectGetMaxX(v119) - v104;
            objc_msgSend(v21, "categoryHeaderLeftPadding");
            v83 = v90 - v91;
          }
        }

        v84 = 0.0;
        v85 = v105;
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v21, "inputViewLeftMostPadding");
      v70 = v69;
      objc_msgSend(v21, "categoryHeaderLeftPadding");
      v72 = v70 - (v71 + v71);
      v97 = v72;
    }
    objc_msgSend(v21, "inputViewLeftMostPadding", v72);
    goto LABEL_16;
  }
  v110.receiver = self;
  v110.super_class = (Class)UIKeyboardEmojiLayout;
  -[UICollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v110, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v6, v7);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "item") && !objc_msgSend(v7, "section"))
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "emojiGraphicsTraits");
    v75 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v75 && v75[8])
    {
      v77 = objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader"));

      if (v77)
      {
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "superview");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "frame");
        +[UIKBResizableKeyplaneTransformation estimatedProgressForHeight:](UIKBResizableKeyplaneTransformation, "estimatedProgressForHeight:", v80);
        v82 = v81;

        objc_msgSend(v73, "setAlpha:", v82);
      }
    }
    else
    {

    }
  }
LABEL_23:

  return v73;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardEmojiLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");

  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionHeader"), v9);

    }
  }
  return v4;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v5;
  double Width;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGRect v16;
  CGRect v17;

  v5 = a4;
  objc_msgSend(a3, "frame");
  Width = CGRectGetWidth(v16);
  objc_msgSend(v5, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  return Width != CGRectGetWidth(v17);
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardEmojiLayout;
  -[UICollectionViewFlowLayout invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:](&v20, sel_invalidationContextForPreferredLayoutAttributes_withOriginalAttributes_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForVisibleItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "section", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionHeader"), v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v10);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerWidths, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
