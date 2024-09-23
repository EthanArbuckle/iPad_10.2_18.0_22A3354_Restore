@implementation UICollectionView

- (void)pageDirection:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double MinY;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;

  -[UICollectionView mf_visibleHeight](self, "mf_visibleHeight");
  v6 = v5;
  -[UICollectionView contentInset](self, "contentInset");
  v8 = v7;
  v9 = v6 + -20.0;
  -[UICollectionView visibleBounds](self, "visibleBounds");
  MinY = CGRectGetMinY(v15);
  v11 = MinY;
  if (a3 == 1)
  {
    v11 = MinY - v9;
    if (MinY - v9 <= -v8)
      v11 = -v8;
  }
  else if (!a3)
  {
    v11 = v9 + MinY;
    v12 = v6 + v9 + MinY;
    -[UICollectionView contentSize](self, "contentSize");
    if (v12 >= v13)
    {
      -[UICollectionView contentSize](self, "contentSize");
      v11 = v14 - v6;
    }
  }
  -[UICollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0, v11);
  -[UICollectionView flashScrollIndicators](self, "flashScrollIndicators");
}

- (void)mf_pageUp
{
  -[UICollectionView pageDirection:](self, "pageDirection:", 1);
}

- (void)mf_pageDown
{
  -[UICollectionView pageDirection:](self, "pageDirection:", 0);
}

+ (id)mf_offsetLog
{
  if (qword_1005AA5D8 != -1)
    dispatch_once(&qword_1005AA5D8, &stru_100523AB8);
  return (id)qword_1005AA5D0;
}

- (id)mf_mostVisibleCellNearestEdge:(unint64_t)a3 preferredMinimumHeight:(double)a4
{
  char v4;
  NSObject *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  double v11;
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
  NSObject *v22;
  NSString *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  char v55;
  _BYTE v56[128];
  _BYTE v57[24];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v4 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
  v7 = v4 & 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100395A5C(v7, v6, a4);

  v8 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[UICollectionView contentOffset](self, "contentOffset");
    sub_100395A24((uint64_t)v57, v8, v9, v10, v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](self, "visibleCells"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1001E4378;
  v54[3] = &unk_100523AD8;
  v55 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedArrayUsingComparator:", v54));

  -[UICollectionView mui_safeVisibleBounds](self, "mui_safeVisibleBounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v58.origin.x = v15;
    v58.origin.y = v17;
    v58.size.width = v19;
    v58.size.height = v21;
    v23 = NSStringFromCGRect(v58);
    objc_claimAutoreleasedReturnValue(v23);
    sub_1003959E4();
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v25)
  {
    v26 = 0;
    v27 = *(_QWORD *)v51;
    v49 = 0.0;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v29, "frame");
        v64.origin.x = v30;
        v64.origin.y = v31;
        v64.size.width = v32;
        v64.size.height = v33;
        v59.origin.x = v15;
        v59.origin.y = v17;
        v59.size.width = v19;
        v59.size.height = v21;
        v60 = CGRectIntersection(v59, v64);
        x = v60.origin.x;
        y = v60.origin.y;
        width = v60.size.width;
        height = v60.size.height;
        if (!CGRectIsNull(v60))
        {
          objc_msgSend(v29, "frame");
          if (CGRectGetHeight(v61) > a4)
          {
            objc_msgSend(v29, "frame");
            v65.origin.x = v38;
            v65.origin.y = v39;
            v65.size.width = v40;
            v65.size.height = v41;
            v62.origin.x = v15;
            v62.origin.y = v17;
            v62.size.width = v19;
            v62.size.height = v21;
            if (CGRectContainsRect(v62, v65))
            {
              v45 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              {
                objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathForCell:](self, "indexPathForCell:", v29));
                sub_1003959A4();
              }

              v46 = v29;
              goto LABEL_30;
            }
          }
          v63.origin.x = x;
          v63.origin.y = y;
          v63.size.width = width;
          v63.size.height = height;
          v42 = CGRectGetHeight(v63);
          if (v42 > v49)
          {
            v43 = v29;

            v49 = v42;
            v26 = v43;
          }
        }
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v25)
        continue;
      break;
    }

    if (v26)
    {
      v44 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathForCell:](self, "indexPathForCell:", v26));
        sub_100395964();
      }
      goto LABEL_29;
    }
  }
  else
  {

  }
  v44 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    sub_100395924(v44);
  v26 = 0;
LABEL_29:

  v26 = v26;
  v46 = v26;
LABEL_30:

  return v46;
}

- (id)mf_dynamicOffsetForVisibleCell:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  NSString *v36;
  NSObject *v37;
  NSObject *v38;
  double v39;
  NSObject *v40;
  MFDynamicCellOffsetRepresentation *v41;
  NSObject *v42;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](self, "visibleCells"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100395C50((uint64_t)v4, v7, v8);

    -[UICollectionView mui_safeVisibleBounds](self, "mui_safeVisibleBounds");
    v45 = v10;
    v46 = v9;
    v12 = v11;
    v14 = v13;
    -[UICollectionView mui_safeVisibleBounds](self, "mui_safeVisibleBounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v4, "frame");
    v56.origin.x = v23;
    v56.origin.y = v24;
    v56.size.width = v25;
    v56.size.height = v26;
    v47.origin.x = v16;
    v47.origin.y = v18;
    v47.size.width = v20;
    v47.size.height = v22;
    v48 = CGRectIntersection(v47, v56);
    x = v48.origin.x;
    y = v48.origin.y;
    width = v48.size.width;
    height = v48.size.height;
    objc_msgSend(v4, "frame");
    v44 = CGRectGetHeight(v49);
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    MinY = CGRectGetMinY(v50);
    objc_msgSend(v4, "frame");
    v32 = CGRectGetMinY(v51);
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v33 = CGRectGetMinY(v52);
    v53.origin.y = v45;
    v53.origin.x = v46;
    v53.size.width = v12;
    v53.size.height = v14;
    v34 = CGRectGetMinY(v53);
    v35 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v54.origin.y = v45;
      v54.origin.x = v46;
      v54.size.width = v12;
      v54.size.height = v14;
      v36 = NSStringFromCGRect(v54);
      objc_claimAutoreleasedReturnValue(v36);
      sub_1003959E4();
    }

    v37 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      sub_100395BE8();

    v38 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    v39 = MinY - v32;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      sub_100395B80();

    v40 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      sub_100395B18();

    v55.origin.y = v45;
    v55.origin.x = v46;
    v55.size.width = v12;
    v55.size.height = v14;
    v41 = -[MFDynamicCellOffsetRepresentation initWithRelativeCellAnchor:relativeDistanceFromTop:]([MFDynamicCellOffsetRepresentation alloc], "initWithRelativeCellAnchor:relativeDistanceFromTop:", v39 / v44, (v33 - v34) / CGRectGetHeight(v55));
    v42 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      objc_claimAutoreleasedReturnValue(-[MFDynamicCellOffsetRepresentation ef_publicDescription](v41, "ef_publicDescription"));
      sub_100395AD8();
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (double)mf_cellOffsetByApplyingDynamicOffset:(id)a3 cellHeight:(double)a4
{
  id v6;
  double v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __n128 v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  CGRect v18;

  v6 = a3;
  v7 = 0.0;
  if (a4 > 0.0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
      sub_100395DF0();
    }

    objc_msgSend(v6, "relativeCellAnchor");
    v10 = v9;
    objc_msgSend(v6, "relativeDistanceFromTop");
    v12 = v11;
    -[UICollectionView mui_safeVisibleBounds](self, "mui_safeVisibleBounds");
    v13.n128_f64[0] = v10 * a4 - v12 * CGRectGetHeight(v18);
    v7 = UIRoundToViewScale(self, v13);
    v14 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_100395D88();

    v15 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_100395D20();

    v16 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_100395CB8();

  }
  return v7;
}

- (double)mf_contentOffsetApplyingDynamicOffset:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double MinY;
  double v14;
  __n128 v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  CGRect v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v7));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_100395F74((uint64_t)v7, (uint64_t)v6, v9);

    objc_msgSend(v8, "size");
    -[UICollectionView mf_cellOffsetByApplyingDynamicOffset:cellHeight:](self, "mf_cellOffsetByApplyingDynamicOffset:cellHeight:", v6, v10);
    v12 = v11;
    objc_msgSend(v8, "frame");
    MinY = CGRectGetMinY(v26);
    -[UICollectionView contentInset](self, "contentInset");
    v15.n128_f64[0] = v12 + MinY - v14;
    v16 = UIRoundToViewScale(self, v15);
    v17 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_100395F0C();

    v18 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_100395EA4();

    -[UICollectionView mf_minContentOffset](self, "mf_minContentOffset");
    v20 = v19;
    -[UICollectionView mf_maxContentOffset](self, "mf_maxContentOffset");
    if (v16 >= v21)
      v22 = v21;
    else
      v22 = v16;
    if (v20 >= v22)
      v23 = v20;
    else
      v23 = v22;
    v24 = objc_claimAutoreleasedReturnValue(+[UICollectionView mf_offsetLog](UICollectionView, "mf_offsetLog"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_100395E3C();

  }
  else
  {
    v23 = 0.0;
  }

  return v23;
}

- (BOOL)mf_isIndexPathValid:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");
  v8 = v4
    && (v7 = v6, (uint64_t)v6 < -[UICollectionView numberOfSections](self, "numberOfSections"))
    && (uint64_t)v5 < -[UICollectionView numberOfItemsInSection:](self, "numberOfItemsInSection:", v7);

  return v8;
}

- (BOOL)mf_isIndexPathVisible:(id)a3 overlap:(CGRect)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  char v21;
  BOOL v22;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v5));
    objc_msgSend(v8, "frame");
    -[UICollectionView convertRect:toView:](self, "convertRect:toView:", self);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UICollectionView mui_safeVisibleBounds](self, "mui_safeVisibleBounds");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v27.origin.x = v10;
    v27.origin.y = v12;
    v27.size.width = v14;
    v27.size.height = v16;
    if (CGRectContainsRect(v25, v27))
    {
      v21 = 1;
    }
    else
    {
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v28.origin.x = v10;
      v28.origin.y = v12;
      v28.size.width = v14;
      v28.size.height = v16;
      v21 = CGRectIntersectsRect(v26, v28);
    }
    if (!CGRectIsNull(a4))
    {
      v29.origin.x = v10;
      v29.origin.y = v12;
      v29.size.width = v14;
      v29.size.height = v16;
      v22 = CGRectContainsRect(a4, v29);
      v30.origin.x = v10;
      v30.origin.y = v12;
      v30.size.width = v14;
      v30.size.height = v16;
      CGRectIntersectsRect(a4, v30);
      v21 &= !v22;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)mf_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];

  v4 = a4;
  v6 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001E4F54;
  v15[3] = &unk_100523B00;
  v15[4] = self;
  v7 = objc_retainBlock(v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems"));
  if (objc_msgSend(v8, "count"))
  {
    if (v6)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1001E5094;
      v12[3] = &unk_100523B28;
      v12[4] = self;
      v14 = v7;
      v13 = v8;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001E5120;
      v9[3] = &unk_10051C630;
      v11 = v14;
      v10 = v13;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", v12, v9);

    }
    else
    {
      ((void (*)(_QWORD *, void *, _QWORD, _BOOL8))v7[2])(v7, v8, 0, v4);
    }
  }

}

@end
