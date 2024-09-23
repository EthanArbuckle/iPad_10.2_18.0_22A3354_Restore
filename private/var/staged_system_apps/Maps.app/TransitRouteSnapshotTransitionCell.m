@implementation TransitRouteSnapshotTransitionCell

- (id)initToTransitionFromCell:(id)a3 toCell:(id)a4 withBackgroundBlur:(BOOL)a5
{
  _BOOL4 v5;
  TransitRouteSnapshotTransitionCell *v8;
  NSMutableArray *v9;
  NSMutableArray *updateHandlers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  unint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  id v33;
  _QWORD *v34;
  id v35;
  void *v36;
  NSMutableArray *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  uint64_t IsRightToLeft;
  double v42;
  double MaxX;
  double v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSMutableArray *v64;
  _QWORD *v65;
  TransitRouteSnapshotTransitionCell *v66;
  id *v68;
  id *v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  id v86[5];
  BOOL v87;
  id location;
  objc_super v89;
  CGRect v90;
  CGRect v91;

  v5 = a5;
  v71 = a3;
  v72 = a4;
  objc_msgSend(v71, "frame");
  v89.receiver = self;
  v89.super_class = (Class)TransitRouteSnapshotTransitionCell;
  v8 = -[TransitRouteSnapshotTransitionCell initWithFrame:](&v89, "initWithFrame:");
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    updateHandlers = v8->_updateHandlers;
    v8->_updateHandlers = v9;

    if (v5)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAppearanceManager customGrayBlurCellBackgroundView](RoutingAppearanceManager, "customGrayBlurCellBackgroundView"));
    else
      v11 = 0;
    objc_msgSend(v71, "bounds");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v72, "bounds");
    v17 = v16;
    v19 = v18;
    -[TransitRouteSnapshotTransitionCell frame](v8, "frame");
    -[TransitRouteSnapshotTransitionCell setFrame:](v8, "setFrame:");
    if (v5)
      objc_msgSend(v11, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, *(double *)&v13, *(double *)&v15);
    objc_initWeak(&location, v8);
    v20 = v8->_updateHandlers;
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10078D110;
    v84[3] = &unk_1011C65E8;
    v86[1] = v13;
    v86[2] = v15;
    v86[3] = v17;
    v86[4] = v19;
    v68 = v86;
    objc_copyWeak(v86, &location);
    v87 = v5;
    v70 = v11;
    v85 = v70;
    v21 = objc_retainBlock(v84);
    -[NSMutableArray addObject:](v20, "addObject:", v21);

    if (v5)
      -[TransitRouteSnapshotTransitionCell addSubview:](v8, "addSubview:", v70, v86);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "_indexedContentSubviewOrNullArray", v68));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "_indexedContentSubviewOrNullArray"));
    for (i = 0; ; ++i)
    {
      if (i >= (unint64_t)objc_msgSend(v22, "count"))
      {
        v66 = v8;

        objc_destroyWeak(v69);
        objc_destroyWeak(&location);

        goto LABEL_38;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", i));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v27 = v25 == v26
          ? 0
          : (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", i));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", i));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v30 = v28 == v29
          ? 0
          : (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", i));

      if (!v27)
      {
        if (v30)
          break;
      }
      if (v27 && !v30)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "snapshotViewAfterScreenUpdates:", 1));
        objc_msgSend(v27, "bounds");
        objc_msgSend(v71, "convertRect:fromView:", v27);
        objc_msgSend(v36, "setFrame:");
        objc_msgSend(v36, "setAlpha:", 1.0);
        v37 = v8->_updateHandlers;
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_10078D1E0;
        v80[3] = &unk_1011B2300;
        v33 = v36;
        v81 = v33;
        v38 = objc_retainBlock(v80);
        -[NSMutableArray addObject:](v37, "addObject:", v38);

        -[TransitRouteSnapshotTransitionCell addSubview:](v8, "addSubview:", v33);
        v35 = v81;
        goto LABEL_35;
      }
      if (v27 && v30)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "snapshotViewAfterScreenUpdates:", 1));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "snapshotViewAfterScreenUpdates:", 1));
        IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft(v40);
        if ((_DWORD)IsRightToLeft)
          v42 = 1.0;
        else
          v42 = 0.0;
        if (MKApplicationLayoutDirectionIsRightToLeft(IsRightToLeft))
        {
          objc_msgSend(v27, "bounds");
          MaxX = CGRectGetMaxX(v90);
        }
        else
        {
          objc_msgSend(v27, "bounds");
        }
        v44 = MaxX;
        v45 = objc_msgSend(v27, "bounds");
        v47 = v46;
        if (MKApplicationLayoutDirectionIsRightToLeft(v45))
        {
          objc_msgSend(v30, "bounds");
          v48 = CGRectGetMaxX(v91);
        }
        else
        {
          objc_msgSend(v30, "bounds");
        }
        v49 = v48;
        objc_msgSend(v30, "bounds");
        v51 = v50;
        objc_msgSend(v71, "convertPoint:fromView:", v27, v44, v47);
        v53 = v52;
        v55 = v54;
        objc_msgSend(v72, "convertPoint:fromView:", v30, v49, v51);
        v57 = v56;
        v59 = v58;
        objc_msgSend(v39, "setAlpha:", 0.0);
        objc_msgSend(v40, "setAlpha:", 1.0);
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
        objc_msgSend(v60, "setAnchorPoint:", v42, 0.0);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layer"));
        objc_msgSend(v61, "setAnchorPoint:", v42, 0.0);

        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
        objc_msgSend(v62, "setPosition:", v53, v55);
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layer"));
        objc_msgSend(v63, "setPosition:", v53, v55);

        v64 = v8->_updateHandlers;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_10078D1F0;
        v73[3] = &unk_1011C6610;
        v35 = v40;
        v74 = v35;
        v33 = v39;
        v75 = v33;
        v76 = v53;
        v77 = v55;
        v78 = v57;
        v79 = v59;
        v65 = objc_retainBlock(v73);
        -[NSMutableArray addObject:](v64, "addObject:", v65);

        -[TransitRouteSnapshotTransitionCell addSubview:](v8, "addSubview:", v35);
        -[TransitRouteSnapshotTransitionCell addSubview:](v8, "addSubview:", v33);

        goto LABEL_35;
      }
LABEL_36:

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "snapshotViewAfterScreenUpdates:", 1));
    objc_msgSend(v30, "bounds");
    objc_msgSend(v72, "convertRect:fromView:", v30);
    objc_msgSend(v31, "setFrame:");
    objc_msgSend(v31, "setAlpha:", 0.0);
    v32 = v8->_updateHandlers;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10078D1D8;
    v82[3] = &unk_1011B2300;
    v33 = v31;
    v83 = v33;
    v34 = objc_retainBlock(v82);
    -[NSMutableArray addObject:](v32, "addObject:", v34);

    -[TransitRouteSnapshotTransitionCell addSubview:](v8, "addSubview:", v33);
    v35 = v83;
LABEL_35:

    goto LABEL_36;
  }
LABEL_38:

  return v8;
}

+ (id)snapshotToTransitionFromCell:(id)a3 toCell:(id)a4 withBackgroundBlur:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initToTransitionFromCell:toCell:withBackgroundBlur:", v9, v8, v5);

  return v10;
}

- (void)updateWithTransitionProgress:(double)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_updateHandlers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8) + 16))(a3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
}

@end
