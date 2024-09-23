@implementation GuideHomeCompositionalLayout

- (GuideHomeCompositionalLayout)initWithSectionProvider:(id)a3 dataProvider:(id)a4
{
  id v6;
  GuideHomeCompositionalLayout *v7;
  GuideHomeCompositionalLayout *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GuideHomeCompositionalLayout;
  v7 = -[GuideHomeCompositionalLayout initWithSectionProvider:](&v14, "initWithSectionProvider:", a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_dataProvider, v6);
    v9 = objc_opt_class(GuidesSectionBackground);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesSectionBackground decorationViewKind](GuidesSectionBackground, "decorationViewKind"));
    -[GuideHomeCompositionalLayout registerClass:forDecorationViewOfKind:](v8, "registerClass:forDecorationViewOfKind:", v9, v10);

    v11 = objc_opt_class(CompactGuidesSectionBackground);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CompactGuidesSectionBackground decorationViewKind](CompactGuidesSectionBackground, "decorationViewKind"));
    -[GuideHomeCompositionalLayout registerClass:forDecorationViewOfKind:](v8, "registerClass:forDecorationViewOfKind:", v11, v12);

  }
  return v8;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)GuideHomeCompositionalLayout;
  v4 = -[GuideHomeCompositionalLayout layoutAttributesForElementsInRect:](&v25, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeCompositionalLayout dataProvider](self, "dataProvider"));
  v7 = objc_msgSend(v6, "isCuratedGuidesHome");

  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (!v9)
      goto LABEL_14;
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPath", (_QWORD)v21));
        if (objc_msgSend(v14, "section"))
          goto LABEL_8;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPath"));
        v16 = objc_msgSend(v15, "item");

        if (!v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeCompositionalLayout collectionView](self, "collectionView"));
          objc_msgSend(v17, "contentOffset");
          v19 = v18;

          if (v19 < 0.0)
          {
            objc_msgSend(v13, "frame");
            CGRectGetMaxY(v27);
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuideHomeCompositionalLayout collectionView](self, "collectionView"));
            objc_msgSend(v14, "frame");
            objc_msgSend(v13, "setFrame:", 0.0, v19);
LABEL_8:

            continue;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (!v10)
      {
LABEL_14:

        return v5;
      }
    }
  }
  return v5;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (GuideHomeDataProvider)dataProvider
{
  return (GuideHomeDataProvider *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

- (void)setDataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
}

@end
