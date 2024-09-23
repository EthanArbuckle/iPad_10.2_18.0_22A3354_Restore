@implementation _TVCollectionViewFlowLayout

- (_TVCollectionViewFlowLayout)init
{
  _TVCollectionViewFlowLayout *v2;
  _TVCollectionViewFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVCollectionViewFlowLayout;
  v2 = -[UICollectionViewFlowLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UICollectionViewFlowLayout setSectionInsetReference:](v2, "setSectionInsetReference:", 0);
  return v3;
}

- (double)contentHeightThatFitsItemCount:(int64_t)a3 expectedWidth:(double)a4
{
  void *v7;
  uint64_t v8;
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
  double v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  char v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v42;
  double v43;

  -[_TVCollectionViewFlowLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v10 = v9;
  v12 = v11;
  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  v14 = v13;
  v43 = v15;
  v17 = v16;
  v19 = v18;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v21 = v20;
  -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
  v23 = v22;
  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") == 1)
  {
    v24 = v17 + v14 + v12 * (double)a3 + v21 * (double)(a3 - 1);
  }
  else
  {
    v42 = v10;
    v24 = 0.0;
    if (a3 > 0 || a4 > 0.0)
    {
      if (a3
        || !-[_TVCollectionViewFlowLayout isHeterogeneous](self, "isHeterogeneous")
        && (a3 = (uint64_t)((v21 + a4 - v43 - v19) / (v42 + v21))) != 0)
      {
        if (v8 >= 1)
        {
          for (i = 0; i != v8; ++i)
          {
            v26 = objc_msgSend(v7, "numberOfItemsInSection:", i, *(_QWORD *)&v42);
            v24 = v24 + v17 + v14 + v12 * (double)((a3 - 1 + v26) / a3) + v23 * (double)((a3 - 1 + v26) / a3 - 1);
          }
        }
      }
      else
      {
        objc_msgSend(v7, "delegate", *(_QWORD *)&v42);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) != 0 && v8 >= 1)
        {
          v29 = 0;
          v30 = v14 + v17;
          do
          {
            v24 = v30 + v24;
            v31 = objc_msgSend(v7, "numberOfItemsInSection:", v29);
            if (v31 >= 1)
            {
              v32 = v31;
              v33 = 0;
              do
              {
                v34 = a4;
                while (1)
                {
                  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v33, v29);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "delegate");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "collectionView:layout:sizeForItemAtIndexPath:", v7, self, v35);
                  v38 = v37;

                  if (v34 < v38)
                  {
                    v39 = v34 == a4;
                    goto LABEL_24;
                  }
                  v34 = v34 - (v21 + v38);
                  if (v34 < 0.0)
                    break;

                  if (++v33 >= v32)
                    goto LABEL_25;
                }
                v39 = 1;
LABEL_24:
                v33 += v39;

LABEL_25:
                v40 = -0.0;
                if (v33 < v32)
                  v40 = v23;
                v24 = v12 + v24 + v40;
              }
              while (v33 < v32);
            }
            ++v29;
          }
          while (v29 != v8);
        }
      }
    }
  }

  return v24;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v3;
  void *v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  int64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  double v18;
  double v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)_TVCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v20, sel_invalidationContextForBoundsChange_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection");
    if (v11)
    {
      if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") != 1)
        return v10;
    }
    else
    {
      -[_TVCollectionViewFlowLayout collectionView](self, "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      if (v14 != x)
      {
LABEL_10:

        goto LABEL_11;
      }
      -[_TVCollectionViewFlowLayout collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      if (v15 != width)
      {
LABEL_9:

        goto LABEL_10;
      }
      if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") != 1)
      {

        return v10;
      }
    }
    -[_TVCollectionViewFlowLayout collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    if (v13 != y)
    {

      if (v11)
      {
LABEL_11:
        objc_msgSend(v10, "setInvalidateFlowLayoutDelegateMetrics:", 1);
        return v10;
      }
      goto LABEL_9;
    }
    -[_TVCollectionViewFlowLayout collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;

    if (!v11)
    {

    }
    if (v19 != height)
      goto LABEL_11;
  }
  return v10;
}

- (int64_t)developmentLayoutDirection
{
  return 0;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (BOOL)isHeterogeneous
{
  return self->_heterogeneous;
}

- (void)setHeterogeneous:(BOOL)a3
{
  self->_heterogeneous = a3;
}

@end
