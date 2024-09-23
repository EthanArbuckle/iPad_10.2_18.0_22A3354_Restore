@implementation CRLiOSPresetCollectionViewLayout

- (CRLiOSPresetCollectionViewLayout)initWithPresetCollectionViewLayoutProvider:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CRLiOSPresetCollectionViewLayout *v9;
  CRLiOSPresetCollectionViewLayout *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSPresetCollectionViewLayout;
  v9 = -[CRLiOSPresetCollectionViewLayout init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutProvider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (double)additionalHeightForItemInSection:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  char v8;
  double v9;
  void *v10;
  double v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  v8 = objc_opt_respondsToSelector(v7, "additionalHeightForItemInSection:context:");

  v9 = 0.0;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
    objc_msgSend(v10, "additionalHeightForItemInSection:context:", a3, v6);
    v9 = v11;

  }
  return v9;
}

- (id)cellReuseIdentifierForSection:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellReuseIdentifierForSection:context:", a3, v6));

  return v8;
}

- (id)cellRegistrationDictionary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cellRegistrationDictionary"));

  return v3;
}

- (BOOL)isCellEditableForSection:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  LOBYTE(a3) = objc_msgSend(v7, "isCellEditableForSection:context:", a3, v6);

  return a3;
}

- (double)horizontalInsetForItemInSection:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  char v8;
  double v9;
  void *v10;
  double v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  v8 = objc_opt_respondsToSelector(v7, "horizontalInsetForItemInSection:context:");

  v9 = 0.0;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
    objc_msgSend(v10, "horizontalInsetForItemInSection:context:", a3, v6);
    v9 = v11;

  }
  return v9;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_context](self, "p_context"));
  v7 = objc_msgSend(v5, "numberOfItemsInSection:context:", a3, v6);

  return (unint64_t)v7;
}

- (unint64_t)numberOfSectionsInCollectionViewForContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  v6 = objc_opt_respondsToSelector(v5, "numberOfSectionsInCollectionViewForContext:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
    v8 = (unint64_t)objc_msgSend(v7, "numberOfSectionsInCollectionViewForContext:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (CGSize)sizeOfPresetInSection:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_context](self, "p_context"));
  -[CRLiOSPresetCollectionViewLayout p_swatchWidthInSection:forContext:](self, "p_swatchWidthInSection:forContext:", a3, v5);
  v7 = v6;
  -[CRLiOSPresetCollectionViewLayout p_swatchHeightGivenWidth:context:](self, "p_swatchHeightGivenWidth:context:", v5);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "layer", a3));
  objc_msgSend(v5, "setHidden:", 0);

}

- (BOOL)showsSubpageNavigator
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  v3 = objc_msgSend(v2, "showsSubpageNavigator");

  return v3;
}

- (NSArray)subpageNavigatorItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  if ((objc_opt_respondsToSelector(v2, "subpageTitles") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subpageTitles"));
  else
    v3 = &__NSArray0__struct;

  return (NSArray *)v3;
}

- (BOOL)supportsSearch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  v3 = objc_msgSend(v2, "supportsSearch");

  return v3;
}

- (unint64_t)pageControlType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  v3 = objc_msgSend(v2, "pageControlType");

  return (unint64_t)v3;
}

- (NSArray)pageControlTitles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  if ((objc_opt_respondsToSelector(v2, "pageControlTitles") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pageControlTitles"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_arrayByMappingObjectsUsingBlock:", &stru_10122E630));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (BOOL)shouldVerticallyDistributeEvenlyForContext:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  v6 = objc_msgSend(v5, "shouldVerticallyDistributeEvenlyForContext:", v4);

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v6 = objc_msgSend(a5, "section", a3, a4);
  -[CRLiOSPresetCollectionViewLayout sizeOfPresetInSection:](self, "sizeOfPresetInSection:", v6);
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_context](self, "p_context"));
  -[CRLiOSPresetCollectionViewLayout horizontalInsetForItemInSection:context:](self, "horizontalInsetForItemInSection:context:", v6, v11);
  v13 = v8 + v12 * 2.0;
  -[CRLiOSPresetCollectionViewLayout additionalHeightForItemInSection:context:](self, "additionalHeightForItemInSection:context:", v6, v11);
  v15 = v10 + v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
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
  UIEdgeInsets result;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_context](self, "p_context", a3, a4));
  -[CRLiOSPresetCollectionViewLayout p_insetsInSection:forContext:](self, "p_insetsInSection:forContext:", a5, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  void *v7;
  double v8;
  double v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_context](self, "p_context", a3, a4));
  -[CRLiOSPresetCollectionViewLayout p_minimumInteritemSpacingInSection:forContext:](self, "p_minimumInteritemSpacingInSection:forContext:", a5, v7);
  v9 = v8;

  return v9;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  void *v7;
  double v8;
  double v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_context](self, "p_context", a3, a4));
  -[CRLiOSPresetCollectionViewLayout p_minimumLineSpacingInSection:forContext:](self, "p_minimumLineSpacingInSection:forContext:", a5, v7);
  v9 = v8;

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_delegate](self, "p_delegate"));
  v7 = objc_msgSend(v6, "presetCollectionViewLayoutShouldHighlightPresetAtIndexPath:", v5);

  return v7;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_delegate](self, "p_delegate"));
  objc_msgSend(v6, "presetCollectionViewLayoutDidHighlightPresetAtIndexPath:", v5);

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_delegate](self, "p_delegate"));
  objc_msgSend(v6, "presetCollectionViewLayoutDidUnhighlightPresetAtIndexPath:", v5);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_delegate](self, "p_delegate"));
  objc_msgSend(v6, "presetCollectionViewLayoutDidSelectPresetAtIndexPath:", v5);

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CRLiOSPresetCollectionViewLayout;
  if (-[CRLiOSPresetCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v20, "shouldInvalidateLayoutForBoundsChange:"))
  {
    return 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout collectionView](self, "collectionView"));
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  v18 = CGRectGetHeight(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v19 = CGRectGetHeight(v22);
  return v18 != v19 && vabdd_f64(v18, v19) >= fabs(v19 * 0.000000999999997);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  _BOOL4 v27;
  CGFloat rect;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  rect = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)objc_opt_class(UICollectionViewFlowLayoutInvalidationContext, a2);
  v30.receiver = self;
  v30.super_class = (Class)CRLiOSPresetCollectionViewLayout;
  v9 = -[CRLiOSPresetCollectionViewLayout invalidationContextForBoundsChange:](&v30, "invalidationContextForBoundsChange:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_1002223BC(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout collectionView](self, "collectionView"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v31.origin.x = v15;
  v31.origin.y = v17;
  v31.size.width = v19;
  v31.size.height = v21;
  v22 = CGRectGetWidth(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = rect;
  v23 = CGRectGetWidth(v32);
  v24 = v22 != v23 && vabdd_f64(v22, v23) >= fabs(v23 * 0.000000999999997);
  v33.origin.x = v15;
  v33.origin.y = v17;
  v33.size.width = v19;
  v33.size.height = v21;
  v25 = CGRectGetHeight(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = rect;
  v26 = CGRectGetHeight(v34);
  v27 = v25 != v26 && vabdd_f64(v25, v26) >= fabs(v26 * 0.000000999999997);
  objc_msgSend(v12, "setInvalidateFlowLayoutDelegateMetrics:", objc_msgSend(v12, "invalidateFlowLayoutDelegateMetrics") | (v24 || v27));
  objc_msgSend(v12, "setInvalidateFlowLayoutAttributes:", objc_msgSend(v12, "invalidateFlowLayoutAttributes") | v27);
  return v12;
}

- (id)p_context
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_delegate](self, "p_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "context"));

  return v3;
}

- (double)p_swatchWidthInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a4;
  v7 = (double)-[CRLiOSPresetCollectionViewLayout p_itemsPerRowInContext:](self, "p_itemsPerRowInContext:", v6);
  -[CRLiOSPresetCollectionViewLayout p_swatchInsets](self, "p_swatchInsets");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  objc_msgSend(v10, "minimumHorizontalSpacingMultiplierInSection:forContext:", a3, v6);
  v12 = v11;

  v13 = v7 + v12 * (v7 + 1.0);
  objc_msgSend(v6, "contentSize");
  v15 = v14;

  return floor(v15 / v13 + v9 * 2.0);
}

- (double)p_swatchHeightGivenWidth:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  objc_msgSend(v7, "presetWidthToHeightRatioForContext:", v6);
  v9 = v8;

  return floor(a3 / v9);
}

- (UIEdgeInsets)p_insetsInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6;
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
  UIEdgeInsets result;

  v6 = a4;
  -[CRLiOSPresetCollectionViewLayout p_swatchInsets](self, "p_swatchInsets");
  v8 = v7;
  v10 = v9;
  -[CRLiOSPresetCollectionViewLayout p_horizontalSpacingInSection:forContext:](self, "p_horizontalSpacingInSection:forContext:", a3, v6);
  v12 = v11;
  -[CRLiOSPresetCollectionViewLayout horizontalInsetForItemInSection:context:](self, "horizontalInsetForItemInSection:context:", a3, v6);
  v14 = v13;
  -[CRLiOSPresetCollectionViewLayout p_verticalSpacingForSection:context:](self, "p_verticalSpacingForSection:context:", a3, v6);
  v16 = v15;
  LODWORD(a3) = -[CRLiOSPresetCollectionViewLayout p_shouldVerticallyDistributeEvenlyInContext:](self, "p_shouldVerticallyDistributeEvenlyInContext:", v6);

  v17 = fmin(v16 - v10, 32.0);
  if ((_DWORD)a3)
    v17 = v16;
  v18 = v12 - (v8 + v14);
  v19 = v17;
  v20 = v18;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (double)p_minimumLineSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v10;

  v6 = a4;
  -[CRLiOSPresetCollectionViewLayout p_verticalSpacingForSection:context:](self, "p_verticalSpacingForSection:context:", a3, v6);
  v8 = v7;
  LOBYTE(a3) = -[CRLiOSPresetCollectionViewLayout p_shouldVerticallyDistributeEvenlyInContext:](self, "p_shouldVerticallyDistributeEvenlyInContext:", v6);

  if ((a3 & 1) != 0)
    return v8;
  -[CRLiOSPresetCollectionViewLayout p_swatchInsets](self, "p_swatchInsets");
  return v8 + v10 * -2.0;
}

- (double)p_minimumInteritemSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v6 = a4;
  -[CRLiOSPresetCollectionViewLayout p_horizontalSpacingInSection:forContext:](self, "p_horizontalSpacingInSection:forContext:", a3, v6);
  v8 = v7;
  -[CRLiOSPresetCollectionViewLayout p_swatchInsets](self, "p_swatchInsets");
  v10 = v9;
  -[CRLiOSPresetCollectionViewLayout horizontalInsetForItemInSection:context:](self, "horizontalInsetForItemInSection:context:", a3, v6);
  v12 = v11;

  return v8 + (v10 + v12) * -2.0;
}

- (double)p_horizontalSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  objc_msgSend(v7, "minimumHorizontalSpacingMultiplierInSection:forContext:", a3, v6);
  v9 = v8;

  -[CRLiOSPresetCollectionViewLayout p_swatchWidthInSection:forContext:](self, "p_swatchWidthInSection:forContext:", a3, v6);
  v11 = v10;

  -[CRLiOSPresetCollectionViewLayout p_swatchInsets](self, "p_swatchInsets");
  return v9 * (v11 + v12 * -2.0);
}

- (BOOL)p_shouldVerticallyDistributeEvenlyInContext:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  v6 = objc_msgSend(v5, "shouldVerticallyDistributeEvenlyForContext:", v4);

  return v6;
}

- (double)p_verticalSpacingForSection:(unint64_t)a3 context:(id)a4
{
  id v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  v6 = a4;
  -[CRLiOSPresetCollectionViewLayout p_swatchWidthInSection:forContext:](self, "p_swatchWidthInSection:forContext:", a3, v6);
  -[CRLiOSPresetCollectionViewLayout p_swatchHeightGivenWidth:context:](self, "p_swatchHeightGivenWidth:context:", v6);
  v8 = v7;
  if (-[CRLiOSPresetCollectionViewLayout p_shouldVerticallyDistributeEvenlyInContext:](self, "p_shouldVerticallyDistributeEvenlyInContext:", v6))
  {
    v9 = vcvtps_u32_f32((float)-[CRLiOSPresetCollectionViewLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", a3)/ (float)-[CRLiOSPresetCollectionViewLayout p_itemsPerRowInContext:](self, "p_itemsPerRowInContext:", v6));
    objc_msgSend(v6, "contentSize");
    v11 = floor((v10 - (double)v9 * v8) / (double)(v9 + 1));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
    objc_msgSend(v12, "minimumVerticalSpacingMultiplierInSection:forContext:", a3, v6);
    v14 = v13;

    -[CRLiOSPresetCollectionViewLayout p_swatchInsets](self, "p_swatchInsets");
    v11 = v14 * (v8 + v15 * -2.0);
  }

  return v11;
}

- (unint64_t)p_itemsPerRowInContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout p_layoutProvider](self, "p_layoutProvider"));
  v6 = objc_msgSend(v5, "itemsPerRowForContext:", v4);

  return (unint64_t)v6;
}

- (CGSize)p_swatchInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewLayout presetCollectionViewLayoutProvider](self, "presetCollectionViewLayoutProvider"));
  objc_msgSend(v2, "swatchInsets");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CRLiOSPresetCollectionViewLayoutDelegate)p_delegate
{
  return (CRLiOSPresetCollectionViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setP_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRLiOSPresetCollectionViewLayoutProviding)p_layoutProvider
{
  return self->_layoutProvider;
}

- (void)setP_layoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_layoutProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
