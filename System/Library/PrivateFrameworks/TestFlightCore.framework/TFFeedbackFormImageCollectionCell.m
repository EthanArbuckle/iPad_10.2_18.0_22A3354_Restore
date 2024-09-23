@implementation TFFeedbackFormImageCollectionCell

- (TFFeedbackFormImageCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TFFeedbackFormImageCollectionCell *v4;
  NSMutableArray *v5;
  NSMutableArray *imageViews;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TFFeedbackFormImageCollectionCell;
  v4 = -[TFFeedbackFormBaseCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    imageViews = v4->_imageViews;
    v4->_imageViews = v5;

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MinX;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)TFFeedbackFormImageCollectionCell;
  -[TFFeedbackFormBaseCell layoutSubviews](&v43, sel_layoutSubviews);
  +[TFFeedbackFormImageCollectionCell _imageViewInsetsInTraitEnvironment:](TFFeedbackFormImageCollectionCell, "_imageViewInsetsInTraitEnvironment:", self);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TFFeedbackFormImageCollectionCell traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "layoutDirection");

  -[TFFeedbackFormImageCollectionCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[TFFeedbackFormImageCollectionCell imageViews](self, "imageViews", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = v21 - (v4 + v8);
    v26 = v19 - (v6 + v10);
    v27 = v4 + v17;
    v28 = v6 + v15;
    v29 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v22);
        v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v31, "image");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v46.origin.x = v28;
        v46.origin.y = v27;
        v46.size.width = v26;
        v46.size.height = v25;
        +[TFFeedbackFormImageCollectionCell _sizeForImage:constrainedToWidth:](TFFeedbackFormImageCollectionCell, "_sizeForImage:constrainedToWidth:", v32, CGRectGetWidth(v46));
        v34 = v33;
        v36 = v35;
        v47.origin.x = v28;
        v47.origin.y = v27;
        v47.size.width = v26;
        v47.size.height = v25;
        MinX = CGRectGetMinX(v47);
        if (v12 == 1)
        {
          v48.origin.x = v28;
          v48.origin.y = v27;
          v48.size.width = v26;
          v48.size.height = v25;
          v38 = CGRectGetMaxX(v48) - v34;
        }
        else
        {
          v38 = MinX;
        }
        objc_msgSend(v31, "setFrame:", v38, v4, v34, v36);
        v49.origin.x = v38;
        v49.origin.y = v4;
        v49.size.width = v34;
        v49.size.height = v36;
        v4 = v4 + CGRectGetHeight(v49) + 16.0;

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v24);
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TFFeedbackFormImageCollectionCell;
  -[TFFeedbackFormImageCollectionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[TFFeedbackFormImageCollectionCell setImageCollectionEntry:](self, "setImageCollectionEntry:", 0);
}

- (void)applyContentsOfEntry:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 3)
    -[TFFeedbackFormImageCollectionCell setImageCollectionEntry:](self, "setImageCollectionEntry:", v4);

}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageCollectionForIdentifer:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_sizeForImages:fittingSize:inTraitEnvironment:", v15, v13, width, height);
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v17 = *MEMORY[0x24BDBF148];
    v19 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (unint64_t)displayableDataType
{
  return 3;
}

- (void)setDisplayedDataImageCollection:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[TFFeedbackFormImageCollectionCell _setupImagesViewsForImages:](self, "_setupImagesViewsForImages:", v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__TFFeedbackFormImageCollectionCell_setDisplayedDataImageCollection___block_invoke;
  v5[3] = &unk_24D794CF8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  -[TFFeedbackFormImageCollectionCell setNeedsLayout](self, "setNeedsLayout");
}

void __69__TFFeedbackFormImageCollectionCell_setDisplayedDataImageCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "imageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setImage:", v5);
}

- (void)_setupImagesViewsForImages:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v20 = v4;
  if (v4)
    v5 = objc_msgSend(v4, "count");
  else
    v5 = 0;
  -[TFFeedbackFormImageCollectionCell imageViews](self, "imageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 != v5)
  {
    -[TFFeedbackFormImageCollectionCell imageViews](self, "imageViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[TFFeedbackFormImageCollectionCell imageViews](self, "imageViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9 >= v5)
    {
      v16 = v11 - v5;
      if ((uint64_t)(v11 - v5) >= 1)
      {
        do
        {
          -[TFFeedbackFormImageCollectionCell imageViews](self, "imageViews");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "removeFromSuperview");
          -[TFFeedbackFormImageCollectionCell imageViews](self, "imageViews");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObject:", v18);

          --v16;
        }
        while (v16);
      }
    }
    else
    {
      v12 = v5 - v11;
      if ((uint64_t)(v5 - v11) >= 1)
      {
        do
        {
          -[TFFeedbackFormImageCollectionCell _createImageView](self, "_createImageView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TFFeedbackFormImageCollectionCell contentView](self, "contentView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addSubview:", v13);

          -[TFFeedbackFormImageCollectionCell imageViews](self, "imageViews");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v13);

          --v12;
        }
        while (v12);
      }
    }
  }

}

- (id)_createImageView
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend(v3, "setContentMode:", 1);
  -[TFFeedbackFormImageCollectionCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  return v3;
}

+ (UIEdgeInsets)_imageViewInsetsInTraitEnvironment:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:](TFFeedbackFormViewSpecification, "formCellInsetsInTraitEnvironment:", a3);
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (CGSize)_sizeForImages:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5
{
  double width;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGSize result;

  width = a4.width;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    +[TFFeedbackFormImageCollectionCell _imageViewInsetsInTraitEnvironment:](TFFeedbackFormImageCollectionCell, "_imageViewInsetsInTraitEnvironment:", a5);
    v10 = v9;
    v12 = v11;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = width - v10 - v12;
      v17 = *(_QWORD *)v25;
      v18 = 0.0;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(a1, "_sizeForImage:constrainedToWidth:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v16, (_QWORD)v24);
          v18 = v18 + v20;
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }
    else
    {
      v18 = 0.0;
    }

    v21 = v18 + (double)(unint64_t)(objc_msgSend(v13, "count") - 1) * 16.0 + 15.0 + 30.0;
  }
  else
  {
    width = *MEMORY[0x24BDBF148];
    v21 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v22 = width;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (CGSize)_sizeForImage:(id)a3 constrainedToWidth:(double)a4
{
  id v5;
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
  CGSize result;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "size");
    v8 = v7;
    objc_msgSend(v6, "size");
    if (v8 <= a4)
    {
      v13 = v10;
      a4 = v9;
    }
    else
    {
      v11 = a4 / v9;
      objc_msgSend(v6, "size");
      v13 = v11 * v12;
    }
  }
  else
  {
    a4 = *MEMORY[0x24BDBF148];
    v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v14 = a4;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (TFFeedbackEntryImageCollection)imageCollectionEntry
{
  return self->_imageCollectionEntry;
}

- (void)setImageCollectionEntry:(id)a3
{
  objc_storeStrong((id *)&self->_imageCollectionEntry, a3);
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageCollectionEntry, 0);
}

@end
