@implementation TUIRenderModelCollection

- (TUIRenderModelCollection)initWithContent:(id)a3 sections:(id)a4 size:(CGSize)a5 insets:(UIEdgeInsets)a6 visibleBoundsObservers:(id)a7 info:(id)a8 anchorSet:(id)a9 layoutDirection:(unint64_t)a10 matchingUUID:(id)a11 matchingUID:(id)a12
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  TUIRenderModelCollection *v32;
  TUIRenderModelCollection *v33;
  NSArray *v34;
  NSArray *sections;
  NSArray *v36;
  NSArray *visibleBoundsObservers;
  NSDictionary *v38;
  NSDictionary *info;
  TUIAnchorSet *v40;
  TUIAnchorSet *anchorSet;
  NSUUID *v42;
  NSUUID *matchingSectionUUID;
  NSString *v44;
  NSString *matchingSectionUID;
  uint64_t v46;
  NSMapTable *liveTransformViewInvalidationMap;
  objc_super v49;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a5.height;
  width = a5.width;
  v25 = a3;
  v26 = a4;
  v27 = a7;
  v28 = a8;
  v29 = a9;
  v30 = a11;
  v31 = a12;
  v49.receiver = self;
  v49.super_class = (Class)TUIRenderModelCollection;
  v32 = -[TUIRenderModelCollection init](&v49, "init");
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_content, a3);
    v34 = (NSArray *)objc_msgSend(v26, "copy");
    sections = v33->_sections;
    v33->_sections = v34;

    v33->_sectionCount = -[NSArray count](v33->_sections, "count");
    v33->_size.width = width;
    v33->_size.height = height;
    v36 = (NSArray *)objc_msgSend(v27, "copy");
    visibleBoundsObservers = v33->_visibleBoundsObservers;
    v33->_visibleBoundsObservers = v36;

    v33->_insets.top = top;
    v33->_insets.left = left;
    v33->_insets.bottom = bottom;
    v33->_insets.right = right;
    v38 = (NSDictionary *)objc_msgSend(v28, "copy");
    info = v33->_info;
    v33->_info = v38;

    v40 = (TUIAnchorSet *)objc_msgSend(v29, "copy");
    anchorSet = v33->_anchorSet;
    v33->_anchorSet = v40;

    v33->_layoutDirection = a10;
    v42 = (NSUUID *)objc_msgSend(v30, "copy");
    matchingSectionUUID = v33->_matchingSectionUUID;
    v33->_matchingSectionUUID = v42;

    v44 = (NSString *)objc_msgSend(v31, "copy");
    matchingSectionUID = v33->_matchingSectionUID;
    v33->_matchingSectionUID = v44;

    v46 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
    -[TUIRenderModelCollection appendLiveTransformViewInvalidationMap:](v33, "appendLiveTransformViewInvalidationMap:", v46);
    liveTransformViewInvalidationMap = v33->_liveTransformViewInvalidationMap;
    v33->_liveTransformViewInvalidationMap = (NSMapTable *)v46;

  }
  return v33;
}

- (NSArray)debugContainedSubmodels
{
  return self->_sections;
}

- (TUIRenderModelCollection)initWithOther:(id)a3
{
  id v4;
  TUIRenderModelCollection *v5;
  uint64_t v6;
  TUIFeedContent *content;
  uint64_t v8;
  NSArray *sections;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  NSArray *visibleBoundsObservers;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  NSDictionary *info;
  uint64_t v20;
  TUIAnchorSet *anchorSet;
  uint64_t v22;
  NSMapTable *liveTransformViewInvalidationMap;
  uint64_t v24;
  NSUUID *matchingSectionUUID;
  uint64_t v26;
  NSString *matchingSectionUID;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TUIRenderModelCollection;
  v5 = -[TUIRenderModelCollection init](&v29, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    content = v5->_content;
    v5->_content = (TUIFeedContent *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
    sections = v5->_sections;
    v5->_sections = (NSArray *)v8;

    v5->_sectionCount = -[NSArray count](v5->_sections, "count");
    objc_msgSend(v4, "size");
    v5->_size.width = v10;
    v5->_size.height = v11;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleBoundsObservers"));
    visibleBoundsObservers = v5->_visibleBoundsObservers;
    v5->_visibleBoundsObservers = (NSArray *)v12;

    objc_msgSend(v4, "insets");
    v5->_insets.top = v14;
    v5->_insets.left = v15;
    v5->_insets.bottom = v16;
    v5->_insets.right = v17;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    info = v5->_info;
    v5->_info = (NSDictionary *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchorSet"));
    anchorSet = v5->_anchorSet;
    v5->_anchorSet = (TUIAnchorSet *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "liveTransformViewInvalidationMap"));
    liveTransformViewInvalidationMap = v5->_liveTransformViewInvalidationMap;
    v5->_liveTransformViewInvalidationMap = (NSMapTable *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchingSectionUUID"));
    matchingSectionUUID = v5->_matchingSectionUUID;
    v5->_matchingSectionUUID = (NSUUID *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchingSectionUID"));
    matchingSectionUID = v5->_matchingSectionUID;
    v5->_matchingSectionUID = (NSString *)v26;

  }
  return v5;
}

- (unint64_t)kind
{
  return 8;
}

- (NSArray)uids
{
  return (NSArray *)-[NSArray valueForKeyPath:](self->_sections, "valueForKeyPath:", CFSTR("entry.uid"));
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_sections;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        v13 = *(_OWORD *)&a4->c;
        v14[0] = *(_OWORD *)&a4->a;
        v14[1] = v13;
        v14[2] = *(_OWORD *)&a4->tx;
        objc_msgSend(v12, "appendResourcesToCollector:transform:", v6, v14);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  NSArray *sections;
  __int128 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection uids](self, "uids"));
  v21[1] = 3221225472;
  v14 = *(_OWORD *)&a4->c;
  v26 = *(_OWORD *)&a4->a;
  sections = self->_sections;
  v21[0] = _NSConcreteStackBlock;
  v21[2] = sub_5A988;
  v21[3] = &unk_23F0C8;
  v21[4] = self;
  v22 = v13;
  v16 = *(_OWORD *)&a4->tx;
  v27 = v14;
  v28 = v16;
  v23 = v11;
  v24 = v10;
  v25 = v12;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  v20 = v13;
  -[NSArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v21);

}

- (void)updateVisibleBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_layoutDirection == 2)
  {
    v8 = self->_size.width;
    x = v8 - CGRectGetMinX(a3) - a3.size.width;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_visibleBoundsObservers;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "visibleBoundsUpdated:", x, y, width, height, (_QWORD)v14);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)appendLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_sections;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v11, v12, x, y, width, height, (_QWORD)v19);
        objc_msgSend(v18, "appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v11, v12, x, y, width, height);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (id)layoutAttributesForViewAtIndexPath:(id)a3 withLiveTransformResolver:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "tui_section");
  if ((unint64_t)v8 >= self->_sectionCount)
  {
    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutAttributesForViewAtIndexPath:withLiveTransformResolver:", v6, v7));

  }
  return v10;
}

- (id)layoutAttributes
{
  NSMutableArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_new(NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "layoutAttributes", (_QWORD)v12));
        -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = -[NSMutableArray copy](v3, "copy");
  return v10;
}

- (id)viewAtIndexPath:(id)a3 factory:(id)a4 host:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "tui_section");
  if ((unint64_t)v11 >= self->_sectionCount)
  {
    v13 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewAtIndexPath:factory:host:", v8, v9, v10));

  }
  return v13;
}

- (void)appendImpressionLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 snapshot:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_sections;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), "appendImpressionLayoutAttributes:forElementsInRect:snapshot:", v11, v12, x, y, width, height, (_QWORD)v18);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (id)layoutAttributesForImpressionAtIndexPath:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "tui_section");
  if ((unint64_t)v8 >= self->_sectionCount)
  {
    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutAttributesForImpressionAtIndexPath:snapshot:", v6, v7));

  }
  return v10;
}

- (unint64_t)numberOfSections
{
  return self->_sectionCount;
}

- (id)viewModelWithIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "tui_section");
  if ((unint64_t)v5 >= self->_sectionCount)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewModelWithIndex:", objc_msgSend(v4, "tui_row")));

  }
  return v7;
}

- (id)sectionForIndexPath:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "tui_section");
  if ((unint64_t)v4 >= self->_sectionCount)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v4));
  return v5;
}

- (id)identifierForViewAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "tui_section");
  if ((unint64_t)v5 >= self->_sectionCount)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierForViewAtIndex:", objc_msgSend(v4, "tui_row")));

  }
  return v7;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
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
  BOOL v22;
  BOOL v23;
  BOOL v25;
  TUIFeedContent *v27;
  TUIFeedContent *v28;
  TUIFeedContent *content;

  v4 = a3;
  v6 = objc_opt_class(2859008, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!TUIRenderModelIsEqualToRenderModel(self, v8))
    goto LABEL_13;
  v9 = -[TUIRenderModelCollection layoutDirection](self, "layoutDirection");
  if (v9 != objc_msgSend(v8, "layoutDirection"))
    goto LABEL_13;
  -[TUIRenderModelCollection insets](self, "insets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "insets");
  v22 = v13 == v21 && v11 == v18;
  v23 = v22 && v17 == v20;
  if (v23 && v15 == v19)
  {
    v27 = (TUIFeedContent *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self, "sections"));
    v28 = (TUIFeedContent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sections"));
    if (v27 == v28 || (-[TUIFeedContent isEqual:](v27, "isEqual:", v28) & 1) != 0)
    {

      content = self->_content;
      v27 = (TUIFeedContent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
      v25 = content == v27;
    }
    else
    {

      v25 = 0;
    }

  }
  else
  {
LABEL_13:
    v25 = 0;
  }

  return v25;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 1;
}

- (void)appendLiveTransformViewInvalidationMap:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "appendLiveTransformViewInvalidationMap:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)invalidateRenderOverride:(id)a3 flags:(unint64_t)a4 feedView:(id)a5 uids:(id)a6
{
  id v9;
  NSArray *v10;
  id v11;
  id v12;
  TUIFeedViewInvalidationContext *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSUUID *matchingSectionUUID;
  NSUUID *v18;
  NSUUID *v19;
  id v20;
  NSString *matchingSectionUID;
  NSString *v22;
  NSString *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  NSArray *v39;
  TUIRenderModelCollection *v40;
  id v41;
  NSString *v42;
  NSUUID *v43;
  void *v44;
  id obj;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v9 = a3;
  v36 = a5;
  v37 = a6;
  v35 = v9;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "query"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v10 = self->_sections;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (!v11)
  {
    v13 = (TUIFeedViewInvalidationContext *)v10;
    goto LABEL_30;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v52;
  v39 = v10;
  v40 = self;
  v38 = *(_QWORD *)v52;
  do
  {
    v15 = 0;
    v41 = v12;
    do
    {
      if (*(_QWORD *)v52 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v15);
      matchingSectionUUID = self->_matchingSectionUUID;
      if (matchingSectionUUID)
        v18 = matchingSectionUUID;
      else
        v18 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v15), "UUID"));
      v19 = v18;
      v20 = objc_msgSend(v16, "section");
      matchingSectionUID = self->_matchingSectionUID;
      if (matchingSectionUID)
        v22 = matchingSectionUID;
      else
        v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndexedSubscript:", v20));
      v23 = v22;
      if (objc_msgSend(v46, "matchesUUID:uid:", v19, v22))
      {
        v42 = v23;
        v43 = v19;
        v44 = v15;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "viewModels"));
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v24)
        {
          v25 = v24;
          v26 = v20;
          v27 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v48 != v27)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "refId"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "refInstance"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
              v33 = objc_msgSend(v46, "matchesRefId:refInstance:identifier:", v30, v31, v32);

              if (v33)
              {
                if (!v13)
                  v13 = objc_alloc_init(TUIFeedViewInvalidationContext);
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", objc_msgSend(v29, "itemIndex"), v26));
                -[TUIFeedViewInvalidationContext invalidateIndexPath:](v13, "invalidateIndexPath:", v34);

              }
            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v25);
        }

        v10 = v39;
        self = v40;
        v14 = v38;
        v12 = v41;
        v23 = v42;
        v19 = v43;
        v15 = v44;
      }

      v15 = (char *)v15 + 1;
    }
    while (v15 != v12);
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  }
  while (v12);

  if (v13)
  {
    objc_msgSend(v36, "invalidateWithContext:", v13);
LABEL_30:

  }
}

- (CGRect)boundingRectForMatchingQuery:(id)a3 viewState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __int128 v9;
  void *v10;
  id v11;
  CGSize size;
  void *v13;
  double v14;
  double x;
  double *v16;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  CGPoint origin;
  CGSize v28;
  CGRect result;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceCollector referenceCollectorWithViewState:](TUIRenderReferenceCollector, "referenceCollectorWithViewState:", v7));
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v25 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v26 = v9;
  origin = *(CGPoint *)&CGAffineTransformIdentity.tx;
  -[TUIRenderModelCollection appendReferencesToCollector:transform:query:liveTransformResolver:](self, "appendReferencesToCollector:transform:query:liveTransformResolver:", v8, &v25, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "renderReferences"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = &v25;
    *(_QWORD *)&v26 = 0x4010000000;
    *((_QWORD *)&v26 + 1) = "";
    size = CGRectNull.size;
    origin = CGRectNull.origin;
    v28 = size;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "renderReferences"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_5BA6C;
    v24[3] = &unk_23F118;
    v24[4] = &v25;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v24);

    if (self->_layoutDirection == 2)
    {
      -[TUIRenderModelCollection size](self, "size");
      x = v14 - CGRectGetMaxX(*(CGRect *)(*((_QWORD *)&v25 + 1) + 32));
      v16 = (double *)*((_QWORD *)&v25 + 1);
      *(double *)(*((_QWORD *)&v25 + 1) + 32) = x;
    }
    else
    {
      v16 = (double *)*((_QWORD *)&v25 + 1);
      x = *(double *)(*((_QWORD *)&v25 + 1) + 32);
    }
    y = v16[5];
    width = v16[6];
    height = v16[7];
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v7, self);

  v9 = NSStringFromCGSize(self->_size);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "appendFormat:", CFSTR(" size=%@"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_sectionCount));
  objc_msgSend(v8, "appendFormat:", CFSTR(" sectionCount=%@"), v11);

  objc_msgSend(v8, "appendFormat:", CFSTR(" sections=%@"), self->_sections);
  objc_msgSend(v8, "appendFormat:", CFSTR(">"));
  v12 = objc_msgSend(v8, "copy");

  return (NSString *)v12;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)sections
{
  return self->_sections;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)visibleBoundsObservers
{
  return self->_visibleBoundsObservers;
}

- (NSDictionary)info
{
  return self->_info;
}

- (TUIAnchorSet)anchorSet
{
  return self->_anchorSet;
}

- (NSUUID)matchingSectionUUID
{
  return self->_matchingSectionUUID;
}

- (NSString)matchingSectionUID
{
  return self->_matchingSectionUID;
}

- (NSMapTable)liveTransformViewInvalidationMap
{
  return self->_liveTransformViewInvalidationMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveTransformViewInvalidationMap, 0);
  objc_storeStrong((id *)&self->_matchingSectionUID, 0);
  objc_storeStrong((id *)&self->_matchingSectionUUID, 0);
  objc_storeStrong((id *)&self->_anchorSet, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_visibleBoundsObservers, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
