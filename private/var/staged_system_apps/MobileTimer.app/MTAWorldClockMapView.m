@implementation MTAWorldClockMapView

- (MTAWorldClockMapView)initWithFrame:(CGRect)a3
{
  MTAWorldClockMapView *v3;
  NSDateFormatter *v4;
  NSDateFormatter *timeFormatter;
  NSMutableDictionary *v6;
  NSMutableDictionary *cityViews;
  UIImageView *v8;
  UIImageView *mapWithTerminator;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  MTAWorldClockMapView *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v26.receiver = self;
  v26.super_class = (Class)MTAWorldClockMapView;
  v3 = -[MTAWorldClockMapView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    timeFormatter = v3->_timeFormatter;
    v3->_timeFormatter = v4;

    -[NSDateFormatter setTimeStyle:](v3->_timeFormatter, "setTimeStyle:", 1);
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cityViews = v3->_cityViews;
    v3->_cityViews = v6;

    v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", 0);
    mapWithTerminator = v3->_mapWithTerminator;
    v3->_mapWithTerminator = v8;

    -[MTAWorldClockMapView addSubview:](v3, "addSubview:", v3->_mapWithTerminator);
    objc_msgSend((id)objc_opt_class(v3), "updateNewYearsDay");
    -[MTAWorldClockMapView updateTerminator](v3, "updateTerminator");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTAWorldClockMapCityView secondaryLabelFont](MTAWorldClockMapCityView, "secondaryLabelFont"));
    -[MTAWorldClockMapView maxWidthForDateStringWithFont:](v3, "maxWidthForDateStringWithFont:", v10);
    v3->_maxTimeStringWidth = v11;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cities"));

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          -[MTAWorldClockMapView addCity:animated:](v3, "addCity:animated:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v17), 0);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v15);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v3, "handleLocaleChange", NSCurrentLocaleDidChangeNotification, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v3, "handleSignificantTimeChange:", UIApplicationSignificantTimeChangeNotification, 0);

    v20 = v3;
  }

  return v3;
}

- (void)handleLocaleChange
{
  void *v3;
  double v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTAWorldClockMapCityView secondaryLabelFont](MTAWorldClockMapCityView, "secondaryLabelFont"));
  -[MTAWorldClockMapView maxWidthForDateStringWithFont:](self, "maxWidthForDateStringWithFont:", v3);
  self->_maxTimeStringWidth = v4;

  -[MTAWorldClockMapView resizeCityViews](self, "resizeCityViews");
  -[MTAWorldClockMapView setNeedsLayout](self, "setNeedsLayout");
}

- (void)handleSignificantTimeChange:(id)a3
{
  objc_msgSend((id)objc_opt_class(self), "updateNewYearsDay");
  -[MTAWorldClockMapView updateTerminator](self, "updateTerminator");
}

- (void)resizeCityViews
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_cityViews, "allValues", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "setTimeLabelWidth:", self->_maxTimeStringWidth);
        objc_msgSend(v8, "handleLocaleChange");
        objc_msgSend(v8, "sizeToFit");
        objc_msgSend(v8, "setNeedsLayout");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

+ (double)mapHeightForWidth:(double)a3
{
  id v3;
  double v4;
  double v5;
  int v6;
  double v7;

  v3 = sub_100022C50(a3);
  v5 = v4;
  v6 = MTUIShouldUseLargePadLayout(v3);
  v7 = 10.0;
  if (v6)
    v7 = 13.0;
  return v5 + v7 * 2.0;
}

- (double)maxWidthForDateStringWithFont:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v15;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  objc_msgSend(v5, "setTimeZone:", v6);

  v7 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v7, "setYear:", 2010, (unsigned __int128)0, (unsigned __int128)0xCuLL, xmmword_10007A710, xmmword_10007A720);
  objc_msgSend(v7, "setMonth:", 7);
  objc_msgSend(v7, "setDay:", 10);
  objc_msgSend(v7, "setSecond:", 0);
  v8 = 0;
  v9 = 0.0;
  do
  {
    objc_msgSend(v7, "setHour:", *(_QWORD *)((char *)&v15 + v8));
    objc_msgSend(v7, "setMinute:", *(_QWORD *)((char *)&v15 + v8 + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v10));
    objc_msgSend(v11, "_legacy_sizeWithFont:", v4);
    v13 = v12;

    if (v13 > v9)
      v9 = v13;

    v8 += 16;
  }
  while (v8 != 64);

  return v9 + 6.0;
}

- (void)addCity:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *cityViews;
  void *v8;
  void *v9;
  MTAWorldClockMapCityView *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  cityViews = self->_cityViews;
  v13 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alCityId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cityViews, "objectForKey:", v8));

  if (!v9)
  {
    v10 = -[MTAWorldClockMapCityView initWithCity:]([MTAWorldClockMapCityView alloc], "initWithCity:", v13);
    -[MTAWorldClockMapCityView start](v10, "start");
    -[MTAWorldClockMapCityView setTimeFormatter:](v10, "setTimeFormatter:", self->_timeFormatter);
    -[MTAWorldClockMapCityView setTimeLabelWidth:](v10, "setTimeLabelWidth:", self->_maxTimeStringWidth);
    -[MTAWorldClockMapCityView sizeToFit](v10, "sizeToFit");
    v11 = self->_cityViews;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alCityId"));
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

    -[MTAWorldClockMapView addSubview:](self, "addSubview:", v10);
    if (v4)
      objc_storeStrong((id *)&self->_addedCityView, v10);

  }
}

- (void)addCity:(id)a3
{
  -[MTAWorldClockMapView addCity:animated:](self, "addCity:animated:", a3, 1);
}

- (void)removeCity:(id)a3
{
  NSMutableDictionary *cityViews;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  MTAWorldClockMapView *v15;

  cityViews = self->_cityViews;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alCityId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cityViews, "objectForKey:", v6));

  v8 = self->_cityViews;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alCityId"));

  -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);
  -[MTAWorldClockMapView setNeedsLayout](self, "setNeedsLayout");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000230CC;
  v13[3] = &unk_1000993B8;
  v14 = v7;
  v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000230F8;
  v11[3] = &unk_100099878;
  v12 = v14;
  v10 = v14;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v13, v11, 0.3, 0.0);

}

- (void)setCities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_cityViews, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("alCityId")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v7));

  if ((objc_msgSend(v6, "isEqualToSet:", v8) & 1) == 0)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = self->_cityViews;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cityViews, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v13)));
          objc_msgSend(v14, "removeFromSuperview");

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v11);
    }

    -[NSMutableDictionary removeAllObjects](self->_cityViews, "removeAllObjects");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          -[MTAWorldClockMapView addCity:animated:](self, "addCity:animated:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), 0, (_QWORD)v20);
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  MTAWorldClockMapView *v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapView window](self, "window"));

  if (v6)
  {
    v7 = objc_alloc((Class)UISnapshotView);
    -[UIImageView frame](self->_mapWithTerminator, "frame");
    v8 = objc_msgSend(v7, "initWithFrame:");
    objc_msgSend(v8, "captureSnapshotOfView:withSnapshotType:", self->_mapWithTerminator, 1);
    -[MTAWorldClockMapView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v8, self->_mapWithTerminator);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100023458;
    v12[3] = &unk_1000992D0;
    v13 = v8;
    v14 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100023498;
    v10[3] = &unk_1000992F8;
    v11 = v13;
    v9 = v13;
    objc_msgSend(v5, "animateAlongsideTransition:completion:", v12, v10);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  sub_1000234DC(a3.width, a3.height);
  v7 = v5 / v6;
  v8 = width / (v5 / v6);
  if (width / height >= v7)
    v9 = height;
  else
    v9 = v8;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockMapView;
  -[MTAWorldClockMapView didMoveToWindow](&v4, "didMoveToWindow");
  if (self->_needsUpdateTerminator)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapView window](self, "window"));

    if (v3)
      -[MTAWorldClockMapView updateTerminator](self, "updateTerminator");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *mapWithTerminator;
  void *v12;
  char *v13;
  uint64_t v14;
  float64x2_t *v15;
  char *v16;
  double v17;
  double *f64;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  id v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __n128 v42;
  uint64_t v43;
  double v44;
  __n128 v45;
  uint64_t v46;
  double v47;
  __n128 v48;
  uint64_t v49;
  double v50;
  __n128 v51;
  uint64_t v52;
  double v53;
  char *v54;
  double *v55;
  MTAWorldClockMapCityView *v56;
  __n128 v57;
  unint64_t v58;
  double v59;
  double v60;
  double v61;
  __n128 v62;
  uint64_t v63;
  double v64;
  MTAWorldClockMapCityView *addedCityView;
  BOOL v66;
  MTAWorldClockMapCityView *v67;
  float64x2_t v68;
  float64x2_t *v69;
  double v70;
  double v71;
  _QWORD v72[4];
  MTAWorldClockMapCityView *v73;
  double v74;
  double v75;
  double v76;
  double v77;

  -[MTAWorldClockMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MTAWorldClockMapView updateTerminator](self, "updateTerminator");
  -[UIImageView setImage:](self->_mapWithTerminator, "setImage:", self->_terminatorImages[0]);
  mapWithTerminator = self->_mapWithTerminator;
  v70 = v8;
  v71 = v10;
  -[UIImageView setFrame:](mapWithTerminator, "setFrame:", v4, v6, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_cityViews, "allValues"));
  v13 = (char *)objc_msgSend(v12, "count");
  v14 = __chkstk_darwin(v13);
  v15 = &v68 - 2 * v14;
  if (v14)
  {
    v68.f64[0] = v4;
    v68.f64[1] = v6;
    v69 = &v68;
    v16 = 0;
    v17 = v70 / v70;
    f64 = v15[1].f64;
    v19 = v71 / v71;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v16, *(_QWORD *)&v68.f64[0], *(_QWORD *)&v68.f64[1], v69));
      objc_msgSend(v20, "setIconPlacement:", 1);
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "city"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "alCity"));
      objc_msgSend(v23, "latitude");
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "alCity"));
      v27 = objc_msgSend(v26, "longitude");
      v29 = MTUILocationCoordinate2DMake(v27, v25, v28);
      v31 = sub_100024C4C(v29, v30, v70, v71);
      v33 = v32;

      objc_msgSend(v21, "frame");
      v35 = v34;
      v37 = v36;
      objc_msgSend(v21, "hotspotOffset");
      v39 = v38;
      v41 = v40;

      v42.n128_f64[0] = v31 - v39;
      v44 = MTUIRoundToPixel(v43, v42);
      v45.n128_f64[0] = v33 - v41;
      v47 = MTUIRoundToPixel(v46, v45);

      v48.n128_f64[0] = v17 * v44;
      v50 = MTUIRoundToPixel(v49, v48);
      v51.n128_f64[0] = v19 * v47;
      v53 = MTUIRoundToPixel(v52, v51);
      *(f64 - 2) = v50;
      *(f64 - 1) = v53;
      *(_QWORD *)f64 = v35;
      *((_QWORD *)f64 + 1) = v37;
      f64 += 4;

      ++v16;
    }
    while (v13 != v16);
    sub_100023928(v15, (unint64_t)v13, v12, v68.f64[0], v68.f64[1], v70, v71);
    v54 = 0;
    v55 = v15[1].f64;
    do
    {
      v56 = (MTAWorldClockMapCityView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v54));
      v57.n128_f64[0] = *(v55 - 2);
      v58 = *((_QWORD *)v55 - 1);
      v60 = *v55;
      v59 = v55[1];
      v61 = MTUIRoundToPixel(v56, v57);
      v62.n128_u64[0] = v58;
      v64 = MTUIRoundToPixel(v63, v62);
      addedCityView = self->_addedCityView;
      if (addedCityView)
        v66 = v56 == addedCityView;
      else
        v66 = 1;
      if (v66)
      {
        -[MTAWorldClockMapCityView setFrame:](v56, "setFrame:", v61, v64, v60, v59);
      }
      else
      {
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_1000240D4;
        v72[3] = &unk_1000995C8;
        v73 = v56;
        v74 = v61;
        v75 = v64;
        v76 = v60;
        v77 = v59;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v72, 0.3);

      }
      ++v54;
      v55 += 4;
    }
    while (v13 != v54);
  }
  else
  {
    sub_100023928(&v68, (unint64_t)v13, v12, v4, v6, v70, v71);
  }
  v67 = self->_addedCityView;
  self->_addedCityView = 0;

}

- (void)startUpdatingTime
{
  id v3;

  -[MTAWorldClockMapView scheduleTerminatorUpdate](self, "scheduleTerminatorUpdate");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_cityViews, "allValues"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "start");

}

- (void)stopUpdatingTime
{
  id v3;

  -[MTAWorldClockMapView cancelTerminatorUpdate](self, "cancelTerminatorUpdate");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_cityViews, "allValues"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "stop");

}

- (double)terminatorUpdateInterval
{
  double v3;
  double v4;
  double result;

  v3 = MTUIMainScreenScale(self, a2);
  -[MTAWorldClockMapView bounds](self, "bounds");
  result = 112.5;
  if (v3 * v4 != 0.0)
    return 86400.0 / (v3 * v4);
  return result;
}

- (void)cancelTerminatorUpdate
{
  NSTimer *terminatorTimer;

  -[NSTimer invalidate](self->_terminatorTimer, "invalidate");
  terminatorTimer = self->_terminatorTimer;
  self->_terminatorTimer = 0;

}

- (void)scheduleTerminatorUpdate
{
  id v3;
  void *v4;
  NSTimer *v5;
  NSTimer *terminatorTimer;
  id v7;

  -[MTAWorldClockMapView cancelTerminatorUpdate](self, "cancelTerminatorUpdate");
  v3 = objc_alloc((Class)NSTimer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[MTAWorldClockMapView terminatorUpdateInterval](self, "terminatorUpdateInterval");
  v5 = (NSTimer *)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, self, "updateTerminator", 0, 1);
  terminatorTimer = self->_terminatorTimer;
  self->_terminatorTimer = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v7, "addTimer:forMode:", self->_terminatorTimer, NSDefaultRunLoopMode);

}

- (void)updateTerminator
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  size_t v15;
  size_t v16;
  CGColorSpace *DeviceRGB;
  double v18;
  CGContext *v19;
  id v20;
  void *v21;
  double v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  double v27;
  id v28;
  id v29;
  CGColorSpace *v30;
  void *v31;
  CGContext *v32;
  id v33;
  CGImage *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGImage *Image;
  uint64_t v46;
  CGMutablePathRef Mutable;
  CGPath *v48;
  double v49;
  double v50;
  float v51;
  CGFloat v52;
  id v53;
  CGImage *v54;
  UIImage *v55;
  UIImage *v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  char v61;
  uint64_t size;
  void *v63;
  BOOL v64;
  id obj;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  -[MTAWorldClockMapView bounds](self, "bounds");
  if (!CGRectIsEmpty(v66))
  {
    obj = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[MTAWorldClockMapView bounds](self, "bounds");
    v3 = CGRectEqualToRect(v67, self->_lastTerminatorUpdateBounds);
    if (!v3
      || (-[MTAWorldClockMapView terminatorUpdateInterval](self, "terminatorUpdateInterval"),
          v5 = v4,
          -[NSDate timeIntervalSinceDate:](self->_terminatorTimestamp, "timeIntervalSinceDate:", obj),
          v5 - fabs(v6) < 1.0))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapView window](self, "window"));

      if (v7)
      {
        v64 = v3;
        v8 = -[MTAWorldClockMapView bounds](self, "bounds");
        v10 = v9;
        v12 = v11;
        v14 = MTUIMainScreenScale(v8, v13);
        v15 = (unint64_t)(v14 * v10);
        v16 = (unint64_t)(v14 * v12);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v18 = (double)v16;
        size = 4 * v15 * v16;
        v63 = malloc_type_malloc(size, 0xEC6210D4uLL);
        v19 = CGBitmapContextCreate(v63, v15, v16, 8uLL, 4 * v15, DeviceRGB, 0x2002u);
        v68.origin.x = 0.0;
        v68.origin.y = 0.0;
        v68.size.width = (double)v15;
        v68.size.height = (double)v16;
        CGContextClearRect(v19, v68);
        CGContextTranslateCTM(v19, 0.0, (double)v16);
        CGContextScaleCTM(v19, v14, -v14);
        CGContextSetAlpha(v19, 0.6);
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
        CGContextSetFillColorWithColor(v19, (CGColorRef)objc_msgSend(v20, "CGColor"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v22 = sub_10002515C(v21);
        v23 = sub_1000249A4(1, v22, v10, v12);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v23));
        CGContextAddPath(v19, (CGPathRef)objc_msgSend(v24, "CGPath"));

        CGContextFillPath(v19);
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9)));
        CGContextSetStrokeColorWithColor(v19, (CGColorRef)objc_msgSend(v25, "CGColor"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v27 = sub_10002515C(v26);
        v28 = sub_1000249A4(0, v27, v10, v12);
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v28));
        CGContextAddPath(v19, (CGPathRef)objc_msgSend(v29, "CGPath"));

        v30 = DeviceRGB;
        CGContextStrokePath(v19);
        v31 = malloc_type_calloc(1uLL, size, 0xB3D3DF3BuLL);
        v32 = CGBitmapContextCreate(v31, v15, v16, 8uLL, 4 * v15, DeviceRGB, 0x2006u);
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor")));
        CGContextSetFillColorWithColor(v32, (CGColorRef)objc_msgSend(v33, "CGColor"));

        v69.origin.x = 0.0;
        v69.origin.y = 0.0;
        v69.size.width = (double)(unint64_t)(v14 * v10);
        v69.size.height = (double)v16;
        CGContextFillRect(v32, v69);
        v34 = (CGImage *)objc_msgSend((id)sub_100024CFC(v10)[1], "CGImage");
        sub_1000234DC(v10, v12);
        if (v14 == 1.0)
          v39 = v35;
        else
          v39 = v14 * v35;
        if (v14 == 1.0)
        {
          v40 = v37;
        }
        else
        {
          v36 = v14 * v36;
          v40 = v14 * v37;
        }
        if (v14 == 1.0)
          v41 = v38;
        else
          v41 = v14 * v38;
        v42 = v39;
        v43 = v40;
        v44 = v41;
        v70.origin.y = v18 - CGRectGetMaxY(*(CGRect *)(&v36 - 1));
        v70.origin.x = v39;
        v70.size.width = v40;
        v70.size.height = v41;
        CGContextDrawImage(v32, v70, v34);
        Image = CGBitmapContextCreateImage(v19);
        v71.origin.x = 0.0;
        v71.origin.y = 0.0;
        v71.size.width = (double)(unint64_t)(v14 * v10);
        v71.size.height = (double)(unint64_t)(v14 * v12);
        CGContextDrawImage(v32, v71, Image);
        CGImageRelease(Image);
        v46 = -180;
        Mutable = CGPathCreateMutable();
        v48 = Mutable;
        do
        {
          v46 += 30;
          v49 = MTUILocationCoordinate2DMake(Mutable, 0.0, (double)v46);
          v51 = sub_100024C4C(v49, v50, v10, v12);
          v52 = v14 * (floorf(v51) + 0.5);
          CGPathMoveToPoint(v48, 0, v52, 0.0);
          CGPathAddLineToPoint(v48, 0, v52, v18);
        }
        while (v46 < 150);
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
        CGContextSetStrokeColorWithColor(v32, (CGColorRef)objc_msgSend(v53, "CGColor"));

        CGContextSetAlpha(v32, 0.100000001);
        CGContextSetLineWidth(v32, v14);
        CGContextAddPath(v32, v48);
        CGContextStrokePath(v32);
        v54 = CGBitmapContextCreateImage(v32);
        v55 = (UIImage *)objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:scale:orientation:", v54, 0, v14);
        CGImageRelease(v54);
        CGColorSpaceRelease(v30);
        CGContextRelease(v32);
        CGContextRelease(v19);
        CGPathRelease(v48);
        free(v63);
        free(v31);
        v56 = self->_terminatorImages[0];
        self->_terminatorImages[0] = v55;

        objc_storeStrong((id *)&self->_terminatorTimestamp, obj);
        -[MTAWorldClockMapView bounds](self, "bounds");
        self->_lastTerminatorUpdateBounds.origin.x = v57;
        self->_lastTerminatorUpdateBounds.origin.y = v58;
        self->_lastTerminatorUpdateBounds.size.width = v59;
        self->_lastTerminatorUpdateBounds.size.height = v60;
        self->_needsUpdateTerminator = 0;
        if (self->_terminatorTimer)
          v61 = v64;
        else
          v61 = 1;
        if ((v61 & 1) == 0)
          -[MTAWorldClockMapView scheduleTerminatorUpdate](self, "scheduleTerminatorUpdate");
        -[MTAWorldClockMapView setNeedsLayout](self, "setNeedsLayout", size);
      }
      else
      {
        self->_needsUpdateTerminator = 1;
      }
    }

  }
}

+ (void)updateNewYearsDay
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v7, "setTimeZone:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 4, v3));

  objc_msgSend(v4, "setMonth:", 1);
  objc_msgSend(v4, "setDay:", 1);
  objc_msgSend(v4, "setHour:", 0);
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v4, "setSecond:", 0);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFromComponents:", v4));
  v6 = (void *)qword_1000BFBC8;
  qword_1000BFBC8 = v5;

}

- (id)terminatorPathForDayOfYear:(double)a3 size:(CGSize)a4
{
  return sub_1000249A4(1, a3, a4.width, a4.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminatorTimer, 0);
  objc_storeStrong((id *)&self->_terminatorTimestamp, 0);
  objc_storeStrong((id *)self->_terminatorImages, 0);
  objc_storeStrong((id *)&self->_mapWithTerminator, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_addedCityView, 0);
  objc_storeStrong((id *)&self->_cityViews, 0);
}

@end
