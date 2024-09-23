@implementation BSUIWeeklyProgressView

- (BSUIWeeklyProgressView)initWithFrame:(CGRect)a3
{
  BSUIWeeklyProgressView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BSUIWeeklyProgressView;
  v3 = -[BSUIWeeklyProgressView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicRegistry"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingTimeToday kind](BCReadingTimeToday, "kind"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progressProviderForKind:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicProgressForKind:instance:parameters:", v6, 0, 0));
    objc_msgSend(v8, "registerProgressObserver:", v3);
    objc_storeStrong((id *)&v3->_dynamicProgress, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v10 = -[BSUIWeeklyProgressView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v9, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIDynamicProgress unregisterProgressObserver:](self->_dynamicProgress, "unregisterProgressObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)BSUIWeeklyProgressView;
  -[BSUIWeeklyProgressView dealloc](&v3, "dealloc");
}

+ (id)renderModelWithIdentifier:(id)a3 metrics:(id)a4
{
  id v5;
  id v6;
  _BSUIWeeklyProgressRenderModel *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_BSUIWeeklyProgressRenderModel);
  -[_BSUIWeeklyProgressRenderModel setMetrics:](v7, "setMetrics:", v5);

  v8 = objc_msgSend(objc_alloc((Class)TUIRenderModelView), "initWithReuseIdentifier:identifier:submodel:", CFSTR("BSUIReuseIdentifierWeeklyProgressView"), v6, v7);
  return v8;
}

- (void)viewWillDisplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BSUIWeeklyProgressView;
  -[BSUIWeeklyProgressView viewWillDisplay](&v9, "viewWillDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView layer](self, "layer"));
  objc_msgSend(v3, "setMasksToBounds:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView backgroundLayer](self, "backgroundLayer"));
  objc_msgSend(v4, "setMasksToBounds:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressRenderModel metrics](self->_renderModel, "metrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "triggerName"));

  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView feedControllerHost](self, "feedControllerHost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "triggerStateManager"));
    objc_msgSend(v8, "addObserver:forTrigger:", self, v6);

  }
}

- (void)viewDidEndDisplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUIWeeklyProgressView;
  -[BSUIWeeklyProgressView viewDidEndDisplay](&v7, "viewDidEndDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressRenderModel metrics](self->_renderModel, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "triggerName"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView feedControllerHost](self, "feedControllerHost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "triggerStateManager"));
    objc_msgSend(v6, "removeObserver:forTrigger:", self, v4);

  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[BSUIWeeklyProgressView _setupWeeklyProgressWithUpdateMode:](self, "_setupWeeklyProgressWithUpdateMode:", 0);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUIWeeklyProgressView;
  v4 = a3;
  -[BSUIWeeklyProgressView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[BSUIWeeklyProgressView _configureWithModel:](self, "_configureWithModel:", v6);

}

- (void)_configureWithModel:(id)a3
{
  _BSUIWeeklyProgressRenderModel *v4;
  _BSUIWeeklyProgressRenderModel *v5;
  double progressToday;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _BSUIWeeklyProgressRenderModel *renderModel;
  _BSUIWeeklyProgressRenderModel *v13;
  BSUIWeeklyProgressMetrics *v14;
  BSUIWeeklyProgressMetrics *metrics;
  NSArray *v16;
  NSArray *days;
  double v18;
  BSUIDynamicValue *v19;
  BSUIDynamicValue *lastVisibleProgressToday;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = (_BSUIWeeklyProgressRenderModel *)a3;
  v5 = v4;
  if (!self->_renderModel)
    goto LABEL_5;
  progressToday = self->_progressToday;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressRenderModel metrics](v4, "metrics"));
  objc_msgSend(v7, "progressToday");
  if (progressToday == v8)
  {

LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v9 = fabs(v8 * 0.000000999999997);
  v10 = vabdd_f64(progressToday, v8);

  if (v10 < v9)
    goto LABEL_5;
  v11 = 1;
LABEL_6:
  renderModel = self->_renderModel;
  self->_renderModel = v5;
  v13 = v5;

  v14 = (BSUIWeeklyProgressMetrics *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressRenderModel metrics](v13, "metrics"));
  metrics = self->_metrics;
  self->_metrics = v14;

  v16 = (NSArray *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics days](self->_metrics, "days"));
  days = self->_days;
  self->_days = v16;

  self->_runningStreakFromPreviousWeek = -[BSUIWeeklyProgressMetrics isRunningStreak](self->_metrics, "isRunningStreak");
  -[BSUIWeeklyProgressMetrics progressToday](self->_metrics, "progressToday");
  self->_progressToday = v18;
  v19 = (BSUIDynamicValue *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressMetrics lastVisibleProgressToday](self->_metrics, "lastVisibleProgressToday"));
  lastVisibleProgressToday = self->_lastVisibleProgressToday;
  self->_lastVisibleProgressToday = v19;

  if (-[BSUIWeeklyProgressView _updateEnvironment](self, "_updateEnvironment"))
    v21 = 0;
  else
    v21 = v11;
  -[BSUIWeeklyProgressView _setupWeeklyProgressWithUpdateMode:](self, "_setupWeeklyProgressWithUpdateMode:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressRenderModel metrics](self->_renderModel, "metrics"));

  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "triggerName"));
  if (objc_msgSend(v26, "length"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView superview](self, "superview"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView feedControllerHost](self, "feedControllerHost"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "triggerStateManager"));
      objc_msgSend(v25, "addObserver:forTrigger:", self, v26);

    }
  }

}

- (BOOL)shouldShowTrailingSpacerLine
{
  return 0;
}

- (void)_calculateComponents
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  _BSUIWeeklyProgressLayoutInfo *v7;
  _BSUIWeeklyProgressLayoutInfo *v8;
  uint64_t v9;
  double v10;
  BSUIProgressSeparatorController *v11;
  BSUIProgressSeparatorController *v12;
  _BSUIWeeklyProgressLayoutInfo *v13;
  BSUIProgressSingleDayController *v14;
  void *i;
  _BSUIWeeklyProgressLayoutInfo *v16;
  _BSUIWeeklyProgressLayoutInfo *v17;
  BSUIProgressSingleDayController *v18;
  void *v19;
  _BSUIWeeklyProgressLayoutInfo *v20;
  void *v21;
  BSUIProgressSingleDayController *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  void *v38;
  id v39;
  unsigned int v40;
  _BOOL4 v41;
  double v42;
  uint64_t v43;
  BSUIProgressSeparatorController *v44;
  BSUIProgressSeparatorController *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  id obj;
  uint64_t v52;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView days](self, "days"));
  v4 = (uint64_t)objc_msgSend(v3, "count");

  if (v4 < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (2 * v4) | 1));
    v6 = -[BSUIWeeklyProgressView runningStreakFromPreviousWeek](self, "runningStreakFromPreviousWeek");
    v7 = objc_opt_new(_BSUIWeeklyProgressLayoutInfo);
    v8 = v7;
    if (v6)
      v9 = 6;
    else
      v9 = 3;
    if (v6)
      v10 = 1.0;
    else
      v10 = 0.0;
    -[_BSUIWeeklyProgressLayoutInfo setLayoutType:](v7, "setLayoutType:", v9);
    v11 = [BSUIProgressSeparatorController alloc];
    -[_BSUIWeeklyProgressLayoutInfo frame](v8, "frame");
    v12 = -[BSUIProgressSeparatorController initWithProgressView:frame:](v11, "initWithProgressView:frame:", self);
    -[_BSUIWeeklyProgressLayoutInfo setSeparator:](v8, "setSeparator:", v12);

    objc_msgSend(v5, "addObject:", v8);
    v13 = objc_opt_new(_BSUIWeeklyProgressLayoutInfo);
    -[_BSUIWeeklyProgressLayoutInfo setPercentComplete:](v13, "setPercentComplete:", v10);
    -[_BSUIWeeklyProgressLayoutInfo setLayoutType:](v13, "setLayoutType:", 0);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView days](self, "days"));
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v53)
    {
      v54 = 0;
      v14 = 0;
      v52 = *(_QWORD *)v56;
      while (1)
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          v16 = v13;
          v17 = v8;
          v18 = v14;
          if (*(_QWORD *)v56 != v52)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          v20 = objc_opt_new(_BSUIWeeklyProgressLayoutInfo);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "text"));
          -[_BSUIWeeklyProgressLayoutInfo setDayLabel:](v20, "setDayLabel:", v21);

          -[_BSUIWeeklyProgressLayoutInfo setLayoutType:](v20, "setLayoutType:", objc_msgSend(v19, "type"));
          if ((char *)-[_BSUIWeeklyProgressLayoutInfo layoutType](v20, "layoutType") == (char *)&dword_0 + 1)
            -[BSUIWeeklyProgressView visibleProgressToday](self, "visibleProgressToday");
          else
            objc_msgSend(v19, "progress");
          -[_BSUIWeeklyProgressLayoutInfo setPercentComplete:](v20, "setPercentComplete:");
          v22 = [BSUIProgressSingleDayController alloc];
          -[_BSUIWeeklyProgressLayoutInfo frame](v20, "frame");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          -[_BSUIWeeklyProgressLayoutInfo percentComplete](v20, "percentComplete");
          v32 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIWeeklyProgressLayoutInfo dayLabel](v20, "dayLabel"));
          v14 = -[BSUIProgressSingleDayController initWithProgressView:frame:progress:label:](v22, "initWithProgressView:frame:progress:label:", self, v33, v24, v26, v28, v30, v32);

          -[_BSUIWeeklyProgressLayoutInfo setDay:](v20, "setDay:", v14);
          objc_msgSend(v5, "addObject:", v20);
          -[_BSUIWeeklyProgressLayoutInfo percentComplete](v16, "percentComplete");
          if (v34 < 1.0)
          {
LABEL_17:
            v35 = 3;
LABEL_24:
            -[_BSUIWeeklyProgressLayoutInfo setLayoutType:](v17, "setLayoutType:", v35);
            goto LABEL_25;
          }
          -[_BSUIWeeklyProgressLayoutInfo percentComplete](v20, "percentComplete");
          if (v36 >= 1.0)
          {
            if ((char *)-[_BSUIWeeklyProgressLayoutInfo layoutType](v17, "layoutType") == (char *)&dword_4 + 2)
              v35 = 7;
            else
              v35 = 5;
            goto LABEL_24;
          }
          if ((char *)-[_BSUIWeeklyProgressLayoutInfo layoutType](v20, "layoutType") != (char *)&dword_0 + 1)
            goto LABEL_17;
LABEL_25:
          if ((char *)-[_BSUIWeeklyProgressLayoutInfo layoutType](v20, "layoutType") == (char *)&dword_0 + 1)
          {
            -[BSUIWeeklyProgressView setTodayLayoutInfo:](self, "setTodayLayoutInfo:", v20);
            -[BSUIWeeklyProgressView setTodaySeparatorLayoutInfo:](self, "setTodaySeparatorLayoutInfo:", v17);
          }
          v37 = (uint64_t)i + v54 + 1;
          v13 = v20;

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView days](self, "days"));
          v39 = objc_msgSend(v38, "count");

          v40 = -[BSUIWeeklyProgressView shouldShowTrailingSpacerLine](self, "shouldShowTrailingSpacerLine");
          v8 = objc_opt_new(_BSUIWeeklyProgressLayoutInfo);
          v41 = v37 == (_QWORD)v39;
          if ((id)v37 == v39 && v40)
          {
            -[_BSUIWeeklyProgressLayoutInfo percentComplete](v13, "percentComplete");
            v41 = v42 < 1.0;
          }
          if (v41)
            v43 = 3;
          else
            v43 = 4;
          -[_BSUIWeeklyProgressLayoutInfo setLayoutType:](v8, "setLayoutType:", v43);
          v44 = [BSUIProgressSeparatorController alloc];
          -[_BSUIWeeklyProgressLayoutInfo frame](v8, "frame");
          v45 = -[BSUIProgressSeparatorController initWithProgressView:frame:](v44, "initWithProgressView:frame:", self);
          -[_BSUIWeeklyProgressLayoutInfo setSeparator:](v8, "setSeparator:", v45);

          objc_msgSend(v5, "addObject:", v8);
        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        v54 += (uint64_t)i;
        if (!v53)
        {

          break;
        }
      }
    }

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "rightToLeft"));
  v48 = objc_msgSend(v47, "BOOLValue");

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allObjects"));
    -[BSUIWeeklyProgressView setLayoutInfosToDisplay:](self, "setLayoutInfosToDisplay:", v50);

  }
  else
  {
    -[BSUIWeeklyProgressView setLayoutInfosToDisplay:](self, "setLayoutInfosToDisplay:", v5);
  }

}

- (void)_calculateLayout
{
  void *v3;
  id v4;
  double Width;
  double Height;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double MidY;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView days](self, "days"));
  v4 = objc_msgSend(v3, "count");

  -[BSUIWeeklyProgressView bounds](self, "bounds");
  Width = CGRectGetWidth(v37);
  -[BSUIWeeklyProgressView bounds](self, "bounds");
  Height = CGRectGetHeight(v38);
  -[BSUIWeeklyProgressView bounds](self, "bounds");
  MidY = CGRectGetMidY(v39);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spacerWidth"));
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spacerHeight"));
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  v15 = floor((Width - (double)((uint64_t)v4 + 1) * v10) / (double)(uint64_t)v4);
  if (v15 <= Height)
    v16 = -0.0;
  else
    v16 = v15 - Height;
  v34 = 0u;
  v35 = 0u;
  if (v15 <= Height)
    v17 = v15;
  else
    v17 = Height;
  v32 = 0uLL;
  v33 = 0uLL;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView layoutInfosToDisplay](self, "layoutInfosToDisplay"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = v14;
    v22 = v16 + v10;
    v23 = *(_QWORD *)v33;
    v24 = 0.0;
    do
    {
      v25 = 0;
      v26 = v24;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v18);
        v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "day"));

        if (v28)
          v29 = v17;
        else
          v29 = v22;
        if (v28)
          v30 = v17;
        else
          v30 = v21;
        v40.origin.x = v26;
        v40.origin.y = MidY + v30 * -0.5;
        v40.size.width = v29;
        v40.size.height = v30;
        v24 = v26 + CGRectGetWidth(v40);
        objc_msgSend(v27, "setFrame:", v26, MidY + v30 * -0.5, v29, v30);
        v25 = (char *)v25 + 1;
        v26 = v24;
      }
      while (v20 != v25);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v20);
  }

}

- (void)_setupViews
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView layoutInfosToDisplay](self, "layoutInfosToDisplay", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "day"));
        if (v8)
          objc_msgSend(v8, "configureWithType:", objc_msgSend(v7, "layoutType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "separator"));
        if (v9)
          objc_msgSend(v9, "configureWithType:", objc_msgSend(v7, "layoutType"));

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)_setupBackground
{
  void *v3;
  CALayer *v4;
  CALayer *backgroundLayer;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView backgroundLayer](self, "backgroundLayer"));

  if (!v3)
  {
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v4;

  }
  -[BSUIWeeklyProgressView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:");
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v7, v9, v11, v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView backgroundColor](self, "backgroundColor")));
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  if (self->_debugBounds)
  {
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor")));
    -[CALayer setBorderColor:](self->_backgroundLayer, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    -[CALayer setBorderWidth:](self->_backgroundLayer, "setBorderWidth:", 0.5);
  }
  -[CALayer setMasksToBounds:](self->_backgroundLayer, "setMasksToBounds:", 1);
  v16 = (id)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView layer](self, "layer"));
  objc_msgSend(v16, "addSublayer:", self->_backgroundLayer);

}

- (BOOL)_updateEnvironment
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "axValue"));
  v5 = objc_msgSend(v4, "integerValue");

  v6 = -[BSUIWeeklyProgressView lastAXValue](self, "lastAXValue");
  v7 = v6 != (_QWORD)v5;
  if ((id)v6 != v5)
    -[BSUIWeeklyProgressView setLastAXValue:](self, "setLastAXValue:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDayShortString"));

  v10 = objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView dateOfLastDay](self, "dateOfLastDay"));
  if (!v10
    || (v11 = (void *)v10,
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView dateOfLastDay](self, "dateOfLastDay")),
        v13 = objc_msgSend(v9, "isEqualToString:", v12),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView dateOfLastDay](self, "dateOfLastDay"));

    if (v14 && v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
      objc_msgSend(v15, "progressToday");
      v17 = v16;

      -[BSUIWeeklyProgressView setVisibleProgressToday:](self, "setVisibleProgressToday:", v17);
    }
    -[BSUIWeeklyProgressView setDateOfLastDay:](self, "setDateOfLastDay:", v9);
    v7 = 1;
  }

  return v7;
}

- (void)_setupWeeklyProgressWithUpdateMode:(unint64_t)a3
{
  CALayer *backgroundLayer;
  NSArray *layoutInfosToDisplay;

  if (a3 == 1)
  {
    if (-[BSUIWeeklyProgressView _isVisible](self, "_isVisible"))
      -[BSUIWeeklyProgressView _animateProgressTodayIfNeeded](self, "_animateProgressTodayIfNeeded");
  }
  else if (!a3)
  {
    -[CALayer removeFromSuperlayer](self->_backgroundLayer, "removeFromSuperlayer");
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = 0;

    layoutInfosToDisplay = self->_layoutInfosToDisplay;
    self->_layoutInfosToDisplay = 0;

    -[BSUIWeeklyProgressView _setupBackground](self, "_setupBackground");
    -[BSUIWeeklyProgressView _calculateComponents](self, "_calculateComponents");
    -[BSUIWeeklyProgressView _calculateLayout](self, "_calculateLayout");
    -[BSUIWeeklyProgressView _setupViews](self, "_setupViews");
  }
}

- (BOOL)clipsToBounds
{
  return 1;
}

- (BOOL)_isVisible
{
  return self->_lastTriggerState == 2;
}

- (double)visibleProgressToday
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _UNKNOWN **v8;
  _UNKNOWN **v9;
  float v10;
  float v11;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicValue value](self->_lastVisibleProgressToday, "value"));
  v5 = BUDynamicCast(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)v6;
  v8 = &off_2FB960;
  if (v6)
    v8 = (_UNKNOWN **)v6;
  v9 = v8;

  objc_msgSend(v9, "floatValue");
  v11 = v10;

  return v11;
}

- (void)setVisibleProgressToday:(double)a3
{
  BSUIDynamicValue *lastVisibleProgressToday;
  id v4;

  lastVisibleProgressToday = self->_lastVisibleProgressToday;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[BSUIDynamicValue updateWithValueIfChanged:](lastVisibleProgressToday, "updateWithValueIfChanged:", v4);

}

- (void)_animateProgressTodayIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  double v8;
  void *v9;
  void *v10;
  id v12;

  -[BSUIWeeklyProgressView visibleProgressToday](self, "visibleProgressToday");
  v4 = v3;
  -[BSUIWeeklyProgressView progressToday](self, "progressToday");
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_todayLayoutInfo);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "day"));

  objc_msgSend(v12, "progress");
  if (v4 == v6)
  {
    if (v6 != v8 && v12 != 0)
      goto LABEL_3;
  }
  else if (v12)
  {
LABEL_3:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView todaySeparatorLayoutInfo](self, "todaySeparatorLayoutInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "separator"));
    objc_msgSend(v10, "updateProgress:animate:", 1, v6);

    -[BSUIWeeklyProgressView setVisibleProgressToday:](self, "setVisibleProgressToday:", v6);
    objc_msgSend(v12, "updateProgress:animate:", 1, v6);
  }

}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  dispatch_time_t v17;
  _QWORD block[5];

  v7 = a3;
  self->_lastTriggerState = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
  v9 = objc_msgSend(v8, "targetTriggerState");
  if (a4 && v9 == (id)a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "triggerName"));
    v12 = objc_msgSend(v11, "isEqualToString:", v7);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "triggerDelay"));
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      if (v16 <= 0.0)
      {
        -[BSUIWeeklyProgressView _animateProgressTodayIfNeeded](self, "_animateProgressTodayIfNeeded");
      }
      else
      {
        v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_31D74;
        block[3] = &unk_2E4608;
        block[4] = self;
        dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  else
  {

  }
}

- (void)dynamicProgressChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
  v6 = objc_msgSend(v5, "dailyReadingGoal");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progress"));
    objc_msgSend(v7, "floatValue");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView metrics](self, "metrics"));
    -[BSUIWeeklyProgressView setProgressToday:](self, "setProgressToday:", (float)(v9 / (float)(uint64_t)objc_msgSend(v10, "dailyReadingGoal")));

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_31E64;
    block[3] = &unk_2E4608;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (NSString)description
{
  uint64_t v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  CGRect v9;

  v3 = objc_opt_class(self);
  -[BSUIWeeklyProgressView frame](self, "frame");
  v4 = NSStringFromCGRect(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressView layoutInfosToDisplay](self, "layoutInfosToDisplay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@: %p frame=%@, layoutType: %@"), v3, self, v5, v6));

  return (NSString *)v7;
}

- (BSUIWeeklyProgressMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (_BSUIWeeklyProgressRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (NSArray)days
{
  return self->_days;
}

- (void)setDays:(id)a3
{
  objc_storeStrong((id *)&self->_days, a3);
}

- (double)progressToday
{
  return self->_progressToday;
}

- (void)setProgressToday:(double)a3
{
  self->_progressToday = a3;
}

- (BSUIDynamicValue)lastVisibleProgressToday
{
  return self->_lastVisibleProgressToday;
}

- (void)setLastVisibleProgressToday:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, a3);
}

- (NSArray)layoutInfosToDisplay
{
  return self->_layoutInfosToDisplay;
}

- (void)setLayoutInfosToDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_layoutInfosToDisplay, a3);
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (BOOL)runningStreakFromPreviousWeek
{
  return self->_runningStreakFromPreviousWeek;
}

- (void)setRunningStreakFromPreviousWeek:(BOOL)a3
{
  self->_runningStreakFromPreviousWeek = a3;
}

- (int64_t)lastAXValue
{
  return self->_lastAXValue;
}

- (void)setLastAXValue:(int64_t)a3
{
  self->_lastAXValue = a3;
}

- (NSString)dateOfLastDay
{
  return self->_dateOfLastDay;
}

- (void)setDateOfLastDay:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastDay, a3);
}

- (_BSUIWeeklyProgressLayoutInfo)todayLayoutInfo
{
  return (_BSUIWeeklyProgressLayoutInfo *)objc_loadWeakRetained((id *)&self->_todayLayoutInfo);
}

- (void)setTodayLayoutInfo:(id)a3
{
  objc_storeWeak((id *)&self->_todayLayoutInfo, a3);
}

- (_BSUIWeeklyProgressLayoutInfo)todaySeparatorLayoutInfo
{
  return (_BSUIWeeklyProgressLayoutInfo *)objc_loadWeakRetained((id *)&self->_todaySeparatorLayoutInfo);
}

- (void)setTodaySeparatorLayoutInfo:(id)a3
{
  objc_storeWeak((id *)&self->_todaySeparatorLayoutInfo, a3);
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_destroyWeak((id *)&self->_todaySeparatorLayoutInfo);
  objc_destroyWeak((id *)&self->_todayLayoutInfo);
  objc_storeStrong((id *)&self->_dateOfLastDay, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_layoutInfosToDisplay, 0);
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, 0);
  objc_storeStrong((id *)&self->_days, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
