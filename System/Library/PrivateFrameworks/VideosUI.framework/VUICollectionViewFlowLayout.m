@implementation VUICollectionViewFlowLayout

- (VUICollectionViewFlowLayout)init
{
  VUICollectionViewFlowLayout *v2;
  VUICollectionViewFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUICollectionViewFlowLayout;
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
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  double v35;
  uint64_t v36;
  double v37;
  double v39;
  double v40;

  -[VUICollectionViewFlowLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v40 = v9;
  v11 = v10;
  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v21 = v20;
  -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
  v23 = v22;
  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") == 1)
  {
    v24 = v17 + v13 + v11 * (double)a3 + v21 * (double)(a3 - 1);
  }
  else
  {
    v39 = v19;
    if (a3 > 0 || (v24 = 0.0, a4 > 0.0))
    {
      if (!a3)
      {
        if (-[VUICollectionViewFlowLayout isHeterogeneous](self, "isHeterogeneous"))
          a3 = 0;
        else
          a3 = (uint64_t)((v21 + a4 - v15 - v39) / (v40 + v21));
      }
      objc_msgSend(v7, "delegate", *(_QWORD *)&v39);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        if (v8 < 1)
        {
          v24 = 0.0;
        }
        else
        {
          v26 = 0;
          v24 = 0.0;
          do
          {
            v27 = objc_msgSend(v7, "numberOfItemsInSection:", v26);
            v24 = v24 + v17 + v13 + v11 * (double)((a3 - 1 + v27) / a3) + v23 * (double)((a3 - 1 + v27) / a3 - 1);
            ++v26;
          }
          while (v8 != v26);
        }
      }
      else
      {
        v24 = 0.0;
        if ((objc_opt_respondsToSelector() & 1) != 0 && v8 >= 1)
        {
          v28 = 0;
          v29 = v13 + v17;
          do
          {
            v24 = v29 + v24;
            v30 = objc_msgSend(v7, "numberOfItemsInSection:", v28);
            if (v30 >= 1)
            {
              v31 = v30;
              v32 = 0;
              do
              {
                v33 = a4;
                while (1)
                {
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v32, v28);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "collectionView:layout:sizeForItemAtIndexPath:", v7, self, v34);
                  if (v33 < v35)
                  {
                    v36 = v33 == a4;
                    goto LABEL_26;
                  }
                  v33 = v33 - (v21 + v35);
                  if (v33 < 0.0)
                    break;

                  if (++v32 >= v31)
                    goto LABEL_27;
                }
                v36 = 1;
LABEL_26:
                v32 += v36;

LABEL_27:
                v37 = -0.0;
                if (v32 < v31)
                  v37 = v23;
                v24 = v11 + v24 + v37;
              }
              while (v32 < v31);
            }
            ++v28;
          }
          while (v28 != v8);
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
  v20.super_class = (Class)VUICollectionViewFlowLayout;
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
      -[VUICollectionViewFlowLayout collectionView](self, "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      if (v14 != x)
      {
LABEL_10:

        goto LABEL_11;
      }
      -[VUICollectionViewFlowLayout collectionView](self, "collectionView");
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
    -[VUICollectionViewFlowLayout collectionView](self, "collectionView");
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
    -[VUICollectionViewFlowLayout collectionView](self, "collectionView");
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
