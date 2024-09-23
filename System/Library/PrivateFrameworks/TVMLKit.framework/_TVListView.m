@implementation _TVListView

- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4
{
  double bottom;
  double top;
  CGFloat width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  char v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char v40;
  char v41;
  double v42;
  CGSize result;

  bottom = a4.bottom;
  top = a4.top;
  width = a3.width;
  -[_TVListView delegate](self, "delegate", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVListView collectionViewLayout](self, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  v10 = top + bottom;
  objc_msgSend(v9, "itemSize", *(_QWORD *)&width);
  v39 = v11;
  objc_msgSend(v9, "sectionInset");
  v42 = v12;
  v14 = v13;
  objc_msgSend(v9, "headerReferenceSize");
  v16 = v15;
  objc_msgSend(v9, "minimumLineSpacing");
  v18 = v17;
  v41 = objc_opt_respondsToSelector();
  v40 = objc_opt_respondsToSelector();
  v19 = objc_opt_respondsToSelector();
  v20 = objc_opt_respondsToSelector();
  if (-[_TVListView numberOfSections](self, "numberOfSections") >= 1)
  {
    v21 = 0;
    do
    {
      v22 = v42;
      v23 = v14;
      if ((v40 & 1) != 0)
      {
        objc_msgSend(v8, "collectionView:layout:insetForSectionAtIndex:", self, v9, v21);
        v22 = v24;
        v23 = v25;
      }
      v26 = v16;
      if ((v19 & 1) != 0)
      {
        objc_msgSend(v8, "collectionView:layout:referenceSizeForHeaderInSection:", self, v9, v21);
        v26 = v27;
      }
      v28 = v18;
      if ((v20 & 1) != 0)
      {
        objc_msgSend(v8, "collectionView:layout:minimumLineSpacingForSectionAtIndex:", self, v9, v21);
        v28 = v29;
      }
      v30 = -[_TVListView numberOfItemsInSection:](self, "numberOfItemsInSection:", v21);
      v31 = v30;
      v32 = v28 * (double)(v30 - 1);
      if (v30 <= 0)
        v32 = 0.0;
      v10 = v10 + v22 + v23 + v26 + v32;
      if ((v41 & 1) != 0)
      {
        if (v30 >= 1)
        {
          v33 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v33, v21);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "collectionView:layout:sizeForItemAtIndexPath:", self, v9, v34);
            v10 = v10 + v35;

            ++v33;
          }
          while (v31 != v33);
        }
      }
      else
      {
        v10 = v10 + (double)v30 * v39;
      }
      ++v21;
    }
    while (v21 < -[_TVListView numberOfSections](self, "numberOfSections"));
  }

  v36 = v38;
  v37 = v10;
  result.height = v37;
  result.width = v36;
  return result;
}

- (void)setConfigureForStackTemplate:(BOOL)a3
{
  if (self->_configureForStackTemplate != a3)
  {
    self->_configureForStackTemplate = a3;
    -[_TVCollectionView setScrollEnabled:](self, "setScrollEnabled:", !a3);
    -[_TVListView _setShouldDeriveVisibleBoundsFromContainingScrollView:](self, "_setShouldDeriveVisibleBoundsFromContainingScrollView:", self->_configureForStackTemplate);
  }
}

- (BOOL)configureForStackTemplate
{
  return self->_configureForStackTemplate;
}

@end
