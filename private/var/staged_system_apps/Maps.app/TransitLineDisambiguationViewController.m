@implementation TransitLineDisambiguationViewController

- (void)viewDidLoad
{
  _UNKNOWN **v3;
  ContainerHeaderView *v4;
  ContainerHeaderView *titleHeaderView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  MapsThemeTableView *v16;
  double y;
  double width;
  double height;
  MapsThemeTableView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[3];

  v73.receiver = self;
  v73.super_class = (Class)TransitLineDisambiguationViewController;
  -[ContaineeViewController viewDidLoad](&v73, "viewDidLoad");
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = MKPlaceCollectionsLogicController_ptr;
  if (sub_1002A8AA0(self) != 5)
  {
    v4 = -[ContainerHeaderView initWithHairlineMargin:]([ContainerHeaderView alloc], "initWithHairlineMargin:", 16.0);
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v4;

    -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
    -[ContainerHeaderView setPreservesSuperviewLayoutMargins:](self->_titleHeaderView, "setPreservesSuperviewLayoutMargins:", 1);
    -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    objc_msgSend(v6, "addSubview:", self->_titleHeaderView);

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v66));
    v76[0] = v64;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v8));
    v76[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v76[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 3));
    objc_msgSend(v72, "addObjectsFromArray:", v14);

    v3 = MKPlaceCollectionsLogicController_ptr;
  }
  v15 = sub_1002A8AA0(self) == 5;
  v16 = [MapsThemeTableView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v20 = -[MapsThemeTableView initWithFrame:style:](v16, "initWithFrame:style:", v15, CGRectZero.origin.x, y, width, height);
  -[TransitLineDisambiguationViewController setTableView:](self, "setTableView:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v22, "setRowHeight:", UITableViewAutomaticDimension);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v23, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v24, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);

  v25 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v26, "setTableFooterView:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v27, "setDelegate:", self);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v28, "setDataSource:", self);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v29, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v30, "setEstimatedRowHeight:", 79.0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v32, "setBackgroundColor:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  v34 = objc_opt_class(TransitLineDisambiguationCell);
  v35 = (objc_class *)objc_opt_class(TransitLineDisambiguationCell);
  v36 = NSStringFromClass(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  objc_msgSend(v33, "registerClass:forCellReuseIdentifier:", v34, v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  v39 = objc_opt_class(TransitLineDisambiguationSectionHeaderView);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[TransitLineDisambiguationSectionHeaderView identifier](TransitLineDisambiguationSectionHeaderView, "identifier"));
  objc_msgSend(v38, "registerClass:forHeaderFooterViewReuseIdentifier:", v39, v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
  objc_msgSend(v41, "addSubview:", v42);

  v43 = sub_1002A8AA0(self);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
  v71 = v44;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
  v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:"));
  v65 = (void *)v45;
  if (v43 == 5)
  {
    v75[0] = v45;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](self->_tableView, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:"));
    v75[1] = v60;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](self->_tableView, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
    v59 = v46;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v48));
    v75[2] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](self->_tableView, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
    v75[3] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[304], "arrayWithObjects:count:", v75, 4));
    v55 = v72;
    objc_msgSend(v72, "addObjectsFromArray:", v54);

    v56 = v58;
  }
  else
  {
    v74[0] = v45;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](self->_tableView, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:"));
    v74[1] = v61;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](self->_tableView, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
    v60 = v57;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v47));
    v74[2] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](self->_tableView, "bottomAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v51));
    v74[3] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[304], "arrayWithObjects:count:", v74, 4));
    v55 = v72;
    objc_msgSend(v72, "addObjectsFromArray:", v53);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);
  -[TransitLineDisambiguationViewController updatePreferredContentSize](self, "updatePreferredContentSize");

}

- (void)setTitleMessage:(id)a3
{
  id v4;
  NSString *v5;
  NSString *titleMessage;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  titleMessage = self->_titleMessage;
  self->_titleMessage = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v7, "setTitle:", v4);

}

- (void)setStatusMessage:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = self->_statusMessage;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v10 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v10;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_statusMessage, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
      objc_msgSend(v9, "reloadData");

      -[TransitLineDisambiguationViewController updatePreferredContentSize](self, "updatePreferredContentSize");
      v7 = (unint64_t)v10;
    }
  }

}

- (void)setLines:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *allLines;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSArray *v18;
  NSArray *linesBySystem;
  NSArray *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD block[5];
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  NSArray *v31;
  _BYTE v32[128];

  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_allLines, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    allLines = self->_allLines;
    self->_allLines = v5;

    if (sub_1002A8AA0(self) == 5)
    {
      v7 = objc_alloc_init((Class)NSMutableDictionary);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v23 = v4;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "system"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v15));
            if (!v16)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v15);
            }
            objc_msgSend(v16, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v10);
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100955734;
      v25[3] = &unk_1011DCAE8;
      v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v17 = v26;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v25);
      v18 = (NSArray *)objc_msgSend(v17, "copy");
      linesBySystem = self->_linesBySystem;
      self->_linesBySystem = v18;

      v4 = v23;
    }
    else
    {
      v20 = self->_allLines;
      if (v20)
      {
        v31 = self->_allLines;
        v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      }
      else
      {
        v7 = 0;
      }
      objc_storeStrong((id *)&self->_linesBySystem, v7);
      if (!v20)
        goto LABEL_18;
    }

LABEL_18:
    -[TransitLineDisambiguationViewController _determineShieldsFromLines](self, "_determineShieldsFromLines");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
    objc_msgSend(v21, "reloadData");

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController tableView](self, "tableView"));
    objc_msgSend(v22, "layoutIfNeeded");

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100955774;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)_determineShieldsFromLines
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (sub_1002A8AA0(self) == 5)
    v4 = 6;
  else
    v4 = 7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  v8 = v7;
  if (!v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "scale");
  v10 = v9;
  if (!v7)

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController allLines](self, "allLines"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100955984;
  v20[3] = &unk_1011DCB10;
  v23 = v4;
  v24 = v10;
  v12 = v3;
  v21 = v12;
  v22 = &v25;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController allLines](self, "allLines"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100955A90;
  v16[3] = &unk_1011DCB38;
  v14 = v12;
  v17 = v14;
  v18 = &v25;
  v19 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

  *(_QWORD *)&self->_maxWidthOfShields = v26[3];
  v15 = objc_msgSend(v14, "copy");
  -[TransitLineDisambiguationViewController setShieldsByLine:](self, "setShieldsByLine:", v15);

  _Block_object_dispose(&v25, 8);
}

- (void)headerViewTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsExpandLayout");

}

- (int)currentUITargetForAnalytics
{
  return 638;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 4, -[TransitLineDisambiguationViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v6.receiver = self;
  v6.super_class = (Class)TransitLineDisambiguationViewController;
  -[ContaineeViewController handleDismissAction:](&v6, "handleDismissAction:", v4);

}

- (void)updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (sub_1002A8AA0(self) == 5)
  {
    -[TransitLineDisambiguationViewController preferredContentSize](self, "preferredContentSize");
    v4 = v3;
    v6 = v5;
    -[TransitLineDisambiguationViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
    if (v4 != v8 || v6 != v7)
      -[TransitLineDisambiguationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (CGSize)calculatePreferredContentSize
{
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;

  *(double *)&v3 = 282.0;
  if (-[TransitLineDisambiguationViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = 282.0;
    if (sub_1002A8AA0(self) == 5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController view](self, "view"));
      objc_msgSend(v5, "layoutIfNeeded");

      -[MapsThemeTableView contentSize](self->_tableView, "contentSize");
      v7 = v6;
      -[ContainerHeaderView frame](self->_titleHeaderView, "frame");
      v4 = fmin(v7 + CGRectGetHeight(v12), 610.0);
      -[ContaineeViewController macContaineeWidth](self, "macContaineeWidth");
      v3 = v8;
    }
  }
  else
  {
    v4 = 282.0;
  }
  v9 = *(double *)&v3;
  v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
  -[TransitLineDisambiguationViewController handleDismissAction:](self, "handleDismissAction:", self);
}

- (BOOL)isLoading
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController statusMessage](self, "statusMessage"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController allLines](self, "allLines"));
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (BOOL)hasStatusMessageToShow
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController statusMessage](self, "statusMessage"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController allLines](self, "allLines"));
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)titleForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  uint64_t v18;

  if (-[TransitLineDisambiguationViewController isLoading](self, "isLoading"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController titleMessage](self, "titleMessage"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController linesBySystem](self, "linesBySystem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "system"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));

    v11 = objc_msgSend(v7, "count");
    v12 = objc_msgSend(v10, "length");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = v13;
    if (v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("number_of_disambiguation_lines_with_system_name"), CFSTR("localized string not found"), 0));

      v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v11, v10);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("number_of_disambiguation_lines"), CFSTR("localized string not found"), 0));

      v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v11, v18);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(v16);

  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  if (-[TransitLineDisambiguationViewController hasStatusMessageToShow](self, "hasStatusMessageToShow", a3)
    || -[TransitLineDisambiguationViewController isLoading](self, "isLoading"))
  {
    return 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController linesBySystem](self, "linesBySystem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));

  v9 = objc_msgSend(v8, "count");
  return (int64_t)v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  if (sub_1002A8AA0(self) != 5)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController linesBySystem](self, "linesBySystem"));
  if ((uint64_t)objc_msgSend(v4, "count") < 1)
  {
    v6 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController linesBySystem](self, "linesBySystem"));
    v6 = (int64_t)objc_msgSend(v5, "count");

  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  if (!-[TransitLineDisambiguationViewController isLoading](self, "isLoading"))
    objc_msgSend(v6, "hideSpinner");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class(TransitLineDisambiguationCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v10));

  if (sub_1002A8AA0(self) != 5)
    objc_msgSend(v11, "set_mapkit_separatorStyleOverride:", 1);
  if (-[TransitLineDisambiguationViewController isLoading](self, "isLoading"))
  {
    objc_msgSend(v11, "showSpinner");
    objc_msgSend(v11, "setLabelText:", 0);
LABEL_7:
    objc_msgSend(v11, "setShieldImage:", 0);
    objc_msgSend(v11, "setMaxWidth:", 0.0);
    goto LABEL_17;
  }
  if (-[TransitLineDisambiguationViewController hasStatusMessageToShow](self, "hasStatusMessageToShow"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController statusMessage](self, "statusMessage"));
    objc_msgSend(v11, "setLabelText:", v12);

    goto LABEL_7;
  }
  v13 = objc_msgSend(v6, "row");
  v14 = objc_msgSend(v6, "section");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController linesBySystem](self, "linesBySystem"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v14));

  if (v13 < objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v13));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController shieldsByLine](self, "shieldsByLine"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "muid")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));

    v21 = objc_opt_class(UIImage);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      v22 = v20;
    else
      v22 = 0;
    objc_msgSend(v11, "setShieldImage:", v22);
    v23 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "system"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));

    }
    objc_msgSend(v11, "setLabelText:", v26);

    objc_msgSend(v11, "setMaxWidth:", self->_maxWidthOfShields);
  }

LABEL_17:
  return v11;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (-[TransitLineDisambiguationViewController hasStatusMessageToShow](self, "hasStatusMessageToShow")
    || -[TransitLineDisambiguationViewController isLoading](self, "isLoading"))
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = objc_msgSend(v6, "section");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController linesBySystem](self, "linesBySystem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v8));

  if (v7 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v18, "deselectRowAtIndexPath:animated:", v6, 1);
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v13 = -[TransitLineDisambiguationViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:targetID:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:targetID:", 0, v7, objc_msgSend(v11, "muid"), 0.0));
    objc_msgSend(v12, "captureUserAction:onTarget:eventValue:placeActionDetails:", 1032, v13, 0, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController lineSelectionBlock](self, "lineSelectionBlock"));
    if (v15)
    {
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController lineSelectionBlock](self, "lineSelectionBlock"));
      v16[2](v16, v11);

    }
    goto LABEL_6;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController lineSelectionBlock](self, "lineSelectionBlock"));

  if (v17)
  {
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationViewController lineSelectionBlock](self, "lineSelectionBlock"));
    v11[2](v11, 0);
LABEL_6:

  }
}

- (id)lineSelectionBlock
{
  return self->_lineSelectionBlock;
}

- (void)setLineSelectionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)titleMessage
{
  return self->_titleMessage;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (UILabel)macTitleLabel
{
  return self->_macTitleLabel;
}

- (void)setMacTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_macTitleLabel, a3);
}

- (MapsThemeTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSDictionary)shieldsByLine
{
  return self->_shieldsByLine;
}

- (void)setShieldsByLine:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)linesBySystem
{
  return self->_linesBySystem;
}

- (void)setLinesBySystem:(id)a3
{
  objc_storeStrong((id *)&self->_linesBySystem, a3);
}

- (NSArray)allLines
{
  return self->_allLines;
}

- (void)setAllLines:(id)a3
{
  objc_storeStrong((id *)&self->_allLines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLines, 0);
  objc_storeStrong((id *)&self->_linesBySystem, 0);
  objc_storeStrong((id *)&self->_shieldsByLine, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_macTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_titleMessage, 0);
  objc_storeStrong(&self->_lineSelectionBlock, 0);
}

@end
