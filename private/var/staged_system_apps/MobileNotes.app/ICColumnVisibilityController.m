@implementation ICColumnVisibilityController

- (ICColumnVisibilityController)initWithViewControllerManager:(id)a3
{
  id v4;
  ICColumnVisibilityController *v5;
  ICColumnVisibilityController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICColumnVisibilityController;
  v5 = -[ICColumnVisibilityController init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewControllerManager, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "splitViewWillTransitionToSize:", CFSTR("ICSplitViewControllerWillTransitionToSizeNotification"), 0);

  }
  return v6;
}

- (ICMainSplitViewController)mainSplitViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainSplitViewController"));

  return (ICMainSplitViewController *)v3;
}

- (ICTrailingSidebarSplitViewController)trailingColumnSplitViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(ICTrailingSidebarSplitViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingSidebarViewController"));
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (ICTrailingSidebarSplitViewController *)v7;
}

- (void)splitViewWillTransitionToSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  id v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  _QWORD *v50;
  void *v51;
  id v52;
  int64_t v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  void *v58;
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  BOOL v64;
  BOOL v65;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = objc_msgSend(v6, "ic_hasCompactSize");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICSplitViewControllerWillTransitionToSizeNotificationNewSizeKey")));
    objc_msgSend(v9, "CGSizeValue");
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ICSplitViewControllerWillTransitionToSizeNotificationTransitionCoordinatorKey")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController trailingColumnSplitViewController](self, "trailingColumnSplitViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;

    v22 = v19 < v21 && v11 > v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController trailingColumnSplitViewController](self, "trailingColumnSplitViewController"));

    if (v5 == v23)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "activityStreamSelection"));

      if (v22)
      {
        v28 = objc_msgSend(v5, "displayMode");
        v29 = 1;
        if (v28 != (id)3 && !v27)
        {
          if ((id)-[ICColumnVisibilityController mostRecentTrailingColumnLandscapeDisplayMode](self, "mostRecentTrailingColumnLandscapeDisplayMode") == (id)2)-[ICColumnVisibilityController setMostRecentMainLandscapeDisplayMode:](self, "setMostRecentMainLandscapeDisplayMode:", 2);
          v29 = 0;
        }
      }
      else
      {
        v54 = v15;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "window"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "rootViewController"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_topViewController"));
        v34 = objc_msgSend(v33, "ic_hasFullScreenModalPresentationStyle");

        if ((v34 & 1) != 0)
        {
          v29 = 0;
        }
        else
        {
          -[ICColumnVisibilityController setMostRecentTrailingColumnLandscapeDisplayMode:](self, "setMostRecentTrailingColumnLandscapeDisplayMode:", objc_msgSend(v5, "displayMode"));
          v29 = objc_msgSend(v5, "displayMode") == (id)2 && v27 == 0;
        }
        v15 = v54;
      }
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_1000511D0;
      v61[3] = &unk_100550FB0;
      v64 = v22;
      v61[4] = self;
      v62 = v27;
      v65 = v29;
      v63 = v5;
      v40 = v27;
      v41 = objc_retainBlock(v61);

      goto LABEL_47;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController mainSplitViewController](self, "mainSplitViewController"));

    if (v5 == v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController trailingColumnSplitViewController](self, "trailingColumnSplitViewController"));
      if (objc_msgSend(v25, "displayMode") == (id)1)
      {

        goto LABEL_18;
      }
      v35 = +[UIDevice ic_isiPad](UIDevice, "ic_isiPad");

      if ((v35 & 1) == 0)
      {
LABEL_18:
        if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
          if (objc_msgSend(v36, "noteContainerViewMode") == (id)1)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
            v38 = objc_msgSend(v37, "isNoteEditorVisible");

            if ((v38 & 1) != 0)
              goto LABEL_52;
          }
          else
          {

          }
        }
        if (v11 != v19 && v13 != v21)
          objc_msgSend(v5, "setPreferredDisplayMode:", 0);
        v42 = &__kCFBooleanTrue;
        if (v22)
        {
          if ((id)-[ICColumnVisibilityController mostRecentMainLandscapeDisplayMode](self, "mostRecentMainLandscapeDisplayMode") == (id)1)
          {
            v43 = &__kCFBooleanFalse;
            v44 = &__kCFBooleanFalse;
LABEL_39:
            if (-[ICColumnVisibilityController shouldForceShowMainSplitViewColumn:](self, "shouldForceShowMainSplitViewColumn:", 0))
            {
              v43 = &__kCFBooleanTrue;
            }
            if (!-[ICColumnVisibilityController shouldForceShowMainSplitViewColumn:](self, "shouldForceShowMainSplitViewColumn:", 1))v42 = v44;
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_10005128C;
            v57[3] = &unk_100550020;
            v58 = v43;
            v45 = v5;
            v59 = v45;
            v60 = v42;
            v41 = objc_retainBlock(v57);
            if (!v22)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v47 = objc_msgSend(v46, "applicationState");

              if (!v47)
                -[ICColumnVisibilityController setMostRecentMainLandscapeDisplayMode:](self, "setMostRecentMainLandscapeDisplayMode:", objc_msgSend(v45, "displayMode"));
            }

            v40 = v58;
LABEL_47:

            if (v41)
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v49 = objc_msgSend(v48, "applicationState");

              if (v49 == (id)2)
              {
                ((void (*)(_QWORD *))v41[2])(v41);
              }
              else
              {
                v55[0] = _NSConcreteStackBlock;
                v55[1] = 3221225472;
                v55[2] = sub_100051304;
                v55[3] = &unk_100550460;
                v56 = v41;
                v50 = v41;
                objc_msgSend(v15, "animateAlongsideTransition:completion:", v55, 0);

              }
            }
            goto LABEL_52;
          }
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
          v52 = objc_msgSend(v51, "noteContainerViewMode");

          v53 = -[ICColumnVisibilityController mostRecentMainLandscapeDisplayMode](self, "mostRecentMainLandscapeDisplayMode");
          if (v52 == (id)1)
          {
            v44 = 0;
            if (v53 == 2)
              v43 = &__kCFBooleanTrue;
            else
              v43 = 0;
            goto LABEL_39;
          }
          if (v53 == 4)
            v43 = &__kCFBooleanTrue;
          else
            v43 = 0;
          if ((id)-[ICColumnVisibilityController mostRecentMainLandscapeDisplayMode](self, "mostRecentMainLandscapeDisplayMode") == (id)2|| (id)-[ICColumnVisibilityController mostRecentMainLandscapeDisplayMode](self, "mostRecentMainLandscapeDisplayMode") == (id)4)
          {
            v44 = &__kCFBooleanTrue;
            goto LABEL_39;
          }
        }
        else
        {
          v43 = 0;
        }
        v44 = 0;
        goto LABEL_39;
      }
    }
LABEL_52:

  }
}

- (BOOL)shouldForceShowMainSplitViewColumn:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController topViewControllerForMainSplitViewColumn:](self, "topViewControllerForMainSplitViewColumn:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController viewControllerManager](self, "viewControllerManager"));
  if ((objc_msgSend(v5, "isTrailingContentVisible") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController mainSplitViewController](self, "mainSplitViewController"));
    if (objc_msgSend(v7, "displayMode") == (id)1)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v4, "isEditing") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchController"));
      v6 = objc_msgSend(v9, "isActive");

    }
  }

  return v6;
}

- (id)topViewControllerForMainSplitViewColumn:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICColumnVisibilityController mainSplitViewController](self, "mainSplitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForColumn:", a3));

  v6 = objc_opt_class(UINavigationController);
  v7 = ICDynamicCast(v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topViewController"));

  return v9;
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (int64_t)mostRecentMainLandscapeDisplayMode
{
  return self->_mostRecentMainLandscapeDisplayMode;
}

- (void)setMostRecentMainLandscapeDisplayMode:(int64_t)a3
{
  self->_mostRecentMainLandscapeDisplayMode = a3;
}

- (int64_t)mostRecentTrailingColumnLandscapeDisplayMode
{
  return self->_mostRecentTrailingColumnLandscapeDisplayMode;
}

- (void)setMostRecentTrailingColumnLandscapeDisplayMode:(int64_t)a3
{
  self->_mostRecentTrailingColumnLandscapeDisplayMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerManager);
}

@end
