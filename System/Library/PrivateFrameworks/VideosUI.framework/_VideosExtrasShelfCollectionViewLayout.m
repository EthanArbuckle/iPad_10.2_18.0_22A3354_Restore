@implementation _VideosExtrasShelfCollectionViewLayout

- (void)_calculateSizes
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  id v24;
  id v25;
  NSDictionary *v26;
  NSDictionary *rects;
  NSDictionary *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _VideosExtrasShelfCollectionViewLayout *v33;
  NSDictionary *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _VideosExtrasShelfCollectionViewLayout *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  _QWORD v52[4];
  __int128 v53;
  uint64_t v54;
  CGRect *v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  CGRect v60;

  if (!self->_rects)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[_VideosExtrasShelfCollectionViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();
    v6 = objc_opt_respondsToSelector() & 1;
    v7 = objc_opt_respondsToSelector() & 1;
    if ((v5 & 1) != 0)
    {
      v8 = *MEMORY[0x1E0C9D820];
      v9 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      -[UICollectionViewFlowLayout itemSize](self, "itemSize");
      v8 = v10;
      v9 = v11;
    }
    if ((v6 & 1) != 0)
    {
      v12 = *MEMORY[0x1E0DC49E8];
      v13 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8);
      v14 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16);
      v15 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24);
    }
    else
    {
      -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
      v12 = v16;
      v13 = v17;
      v14 = v18;
      v15 = v19;
    }
    v20 = 0;
    if ((v7 & 1) == 0)
    {
      -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
      v20 = v21;
    }
    v54 = 0;
    v55 = (CGRect *)&v54;
    v56 = 0x4010000000;
    v57 = &unk_1DA394075;
    v22 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v58 = *MEMORY[0x1E0C9D648];
    v59 = v22;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3010000000;
    v52[3] = &unk_1DA394075;
    v53 = *MEMORY[0x1E0C9D538];
    v23 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke;
    v42[3] = &unk_1E9F9C508;
    v51 = v6;
    v46 = v52;
    v43 = v4;
    v44 = v3;
    v45 = self;
    v47 = v12;
    v48 = v13;
    v49 = v14;
    v50 = v15;
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke_2;
    v30[3] = &unk_1E9F9C530;
    v40 = v5 & 1;
    v24 = v43;
    v31 = v24;
    v25 = v44;
    v32 = v25;
    v33 = self;
    v37 = v8;
    v38 = v9;
    v35 = v52;
    v26 = (NSDictionary *)v29;
    v34 = v26;
    v36 = &v54;
    v41 = v7;
    v39 = v20;
    _MPUEnumerateItemsOfCollectionView(v25, v42, v30);
    v60 = CGRectStandardize(v55[1]);
    self->_contentSize.width = v60.size.width;
    self->_contentSize.height = v60.size.height;
    rects = self->_rects;
    self->_rects = v26;
    v28 = v26;

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(&v54, 8);

  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_rects;
    v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v14, (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](self->_rects, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "CGRectValue");
          objc_msgSend(v15, "setFrame:");

          objc_msgSend(v8, "addObject:", v15);
        }
        v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)_VideosExtrasShelfCollectionViewLayout;
    -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v22, sel_layoutAttributesForElementsInRect_, x, y, width, height);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_VideosExtrasShelfCollectionViewLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v3, sel_prepareLayout);
  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") == 1)
    -[_VideosExtrasShelfCollectionViewLayout _calculateSizes](self, "_calculateSizes");
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  objc_super v5;
  CGSize result;

  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") == 1)
  {
    width = self->_contentSize.width;
    height = self->_contentSize.height;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_VideosExtrasShelfCollectionViewLayout;
    -[UICollectionViewFlowLayout collectionViewContentSize](&v5, sel_collectionViewContentSize);
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)calculatedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rects, 0);
}

@end
