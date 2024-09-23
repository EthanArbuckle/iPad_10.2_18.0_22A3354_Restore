@implementation UGCPOIEnrichmentGroupedSectionView

- (UGCPOIEnrichmentGroupedSectionView)initWithRowItems:(id)a3
{
  id v4;
  UGCPOIEnrichmentGroupedSectionView *v5;
  NSArray *v6;
  NSArray *rowItems;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _QWORD v26[2];
  _BYTE v27[128];

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UGCPOIEnrichmentGroupedSectionView;
  v5 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v25, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    rowItems = v5->_rowItems;
    v5->_rowItems = v6;

    v8 = objc_msgSend(objc_alloc((Class)MUPlatterView), "initWithContentView:", 0);
    objc_msgSend(v8, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
    objc_msgSend(v8, "setDirectionalLayoutMargins:", 0.0, kMUPlacePlatterPadding, 0.0, kMUPlacePlatterPadding);
    -[UGCPOIEnrichmentGroupedSectionView addSubview:](v5, "addSubview:", v8);
    v9 = objc_alloc((Class)MUEdgeLayout);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentGroupedSectionView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v11 = objc_msgSend(v9, "initWithItem:container:", v8, v10);

    v12 = objc_msgSend(objc_alloc((Class)MUStackLayout), "initWithContainer:axis:", v8, 1);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v17), "rowView", (_QWORD)v21));
          objc_msgSend(v18, "setPreservesSuperviewLayoutMargins:", 1);
          objc_msgSend(v8, "addSubview:", v18);
          objc_msgSend(v12, "addArrangedLayoutItem:", v18);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v15);
    }

    v26[0] = v11;
    v26[1] = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v19);

  }
  return v5;
}

+ (id)groupedSectionRowItemWithRowItems:(id)a3 bottomSpacing:(double)a4
{
  id v5;
  UGCPOIEnrichmentGroupedSectionView *v6;
  void *v7;

  v5 = a3;
  v6 = -[UGCPOIEnrichmentGroupedSectionView initWithRowItems:]([UGCPOIEnrichmentGroupedSectionView alloc], "initWithRowItems:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentRowItem rowItemWithView:bottomSpacing:](UGCPOIEnrichmentRowItem, "rowItemWithView:bottomSpacing:", v6, a4));
  return v7;
}

- (NSArray)rowItems
{
  return self->_rowItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowItems, 0);
}

@end
