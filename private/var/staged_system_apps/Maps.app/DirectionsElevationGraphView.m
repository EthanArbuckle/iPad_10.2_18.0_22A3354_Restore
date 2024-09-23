@implementation DirectionsElevationGraphView

- (DirectionsElevationGraphView)initWithConfiguration:(id)a3
{
  id v5;
  DirectionsElevationGraphView *v6;
  DirectionsElevationGraphView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DirectionsElevationGraphView;
  v6 = -[DirectionsElevationGraphView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_chartUpdateDistanceThreshold = GEOConfigGetDouble(MapsConfig_NavigationChartUpdateDistanceThreshold, off_1014B4C38);
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[DirectionsElevationGraphView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v10);

    -[DirectionsElevationGraphView _prepareForFirstUse](v7, "_prepareForFirstUse");
  }

  return v7;
}

- (void)_prepareForFirstUse
{
  void *v3;
  NSMeasurementFormatter *v4;
  NSMeasurementFormatter *elevationFormatter;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *chartContainerView;
  UIView *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  -[DirectionsElevationGraphView setOpaque:](self, "setOpaque:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[DirectionsElevationGraphView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
  elevationFormatter = self->_elevationFormatter;
  self->_elevationFormatter = v4;

  -[NSMeasurementFormatter setUnitOptions:](self->_elevationFormatter, "setUnitOptions:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter numberFormatter](self->_elevationFormatter, "numberFormatter"));
  objc_msgSend(v6, "setMaximumFractionDigits:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  self->_metric = objc_msgSend(v7, "_navigation_distanceUsesMetricSystem");

  -[DirectionsElevationGraphView _updateMeasurementUnits](self, "_updateMeasurementUnits");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = MNLocaleDidChangeNotification();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_unitsDidChange", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[DirectionsElevationGraphView setBackgroundColor:](self, "setBackgroundColor:", v11);

  v12 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("ChartContainerView"));
  -[DirectionsElevationGraphView addSubview:](self, "addSubview:", v12);
  chartContainerView = self->_chartContainerView;
  self->_chartContainerView = v12;
  v14 = v12;

  v18 = objc_alloc_init((Class)NSMutableArray);
  LODWORD(v15) = 1148846080;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfView:priority:](v14, "_maps_constraintsEqualToEdgesOfView:priority:", self, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DirectionsElevationGraphView;
  -[DirectionsElevationGraphView layoutSubviews](&v3, "layoutSubviews");
  -[DirectionsElevationGraphView _updateChartViewIfNeeded](self, "_updateChartViewIfNeeded");
}

- (void)setConfiguration:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  DirectionsElevationGraphView *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;

  v5 = a3;
  v6 = self->_configuration;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_100432CAC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        objc_storeStrong((id *)&self->_configuration, a3);
        -[DirectionsElevationGraphView _updateChartView](self, "_updateChartView");
        goto LABEL_11;
      }
      v11 = self;
      v12 = (objc_class *)objc_opt_class(v11);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
        v16 = v15;
        if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

          goto LABEL_9;
        }

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

      *(_DWORD *)buf = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ | Updating configuration", buf, 0xCu);

      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)setElevationProfile:(id)a3 routeLength:(double)a4
{
  id v6;
  GEOElevationProfile *elevationProfile;
  unint64_t v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  DirectionsElevationGraphView *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  GEOElevationProfile *v21;
  GEOElevationProfile *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  double v28;

  v6 = a3;
  elevationProfile = self->_elevationProfile;
  v8 = (unint64_t)v6;
  v9 = elevationProfile;
  if (v8 | (unint64_t)v9
    && (v10 = v9, v11 = objc_msgSend((id)v8, "isEqual:", v9),
                  v10,
                  (id)v8,
                  !v11)
    || vabdd_f64(self->_routeLength, a4) > 2.22044605e-16)
  {
    v12 = sub_100432CAC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      v21 = (GEOElevationProfile *)objc_msgSend((id)v8, "copy");
      v22 = self->_elevationProfile;
      self->_elevationProfile = v21;

      self->_routeLength = a4;
      -[DirectionsElevationGraphView _updateChartView](self, "_updateChartView");
      goto LABEL_12;
    }
    v14 = self;
    v15 = (objc_class *)objc_opt_class(v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_10;
      }

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_10:

    *(_DWORD *)buf = 138412802;
    v24 = v20;
    v25 = 2048;
    v26 = objc_msgSend((id)v8, "pointsCount");
    v27 = 2048;
    v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ | Updating elevation profile (%lu points, %#.2fm length)", buf, 0x20u);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)setNavigationProgress:(double)a3
{
  if (vabdd_f64(a3, self->_progressInMeters) >= self->_chartUpdateDistanceThreshold)
  {
    self->_progressInMeters = a3;
    -[DirectionsElevationGraphView _updateChartView](self, "_updateChartView");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[DirectionsElevationGraphView _updateChartView](self, "_updateChartView");
  }
}

- (void)_updateChartViewIfNeeded
{
  double v3;
  BOOL v4;
  double v5;

  -[DirectionsElevationGraphView _targetChartDrawingWidth](self, "_targetChartDrawingWidth");
  if (self->_chartViewController)
    v4 = v3 < 2.22044605e-16;
  else
    v4 = 0;
  v5 = vabdd_f64(v3, self->_chartUsedWidth);
  if (v4 || v5 >= 1.0)
    -[DirectionsElevationGraphView _updateChartView](self, "_updateChartView", v5);
}

- (id)_chartStyle
{
  void *v2;

  v2 = -[DirectionsElevationGraphConfiguration useType](self->_configuration, "useType");
  if (v2 == (void *)2)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsElevationChartStyle navigationDetailStyle](_TtC4Maps23MapsElevationChartStyle, "navigationDetailStyle"));
  }
  else if (v2 == (void *)1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsElevationChartStyle routePlanningMiniLineStyle](_TtC4Maps23MapsElevationChartStyle, "routePlanningMiniLineStyle"));
  }
  else if (!v2)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsElevationChartStyle navigationLineStyle](_TtC4Maps23MapsElevationChartStyle, "navigationLineStyle"));
  }
  return v2;
}

- (void)_updateChartView
{
  UIViewController *chartViewController;
  double v4;
  double v5;
  id v6;
  double progressInMeters;
  void *v8;
  GEOElevationProfile *elevationProfile;
  _BOOL8 metric;
  void *v11;
  _BOOL8 selected;
  void *v13;
  UIViewController *v14;
  UIViewController *v15;
  UIView *v16;
  UIView *chartSubcontainerView;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  -[UIView removeFromSuperview](self->_chartSubcontainerView, "removeFromSuperview");
  chartViewController = self->_chartViewController;
  self->_chartViewController = 0;

  -[DirectionsElevationGraphView _targetChartDrawingWidth](self, "_targetChartDrawingWidth");
  v5 = v4;
  self->_chartUsedWidth = v4;
  if (v4 >= 2.22044605e-16)
  {
    v6 = objc_alloc((Class)NSMeasurement);
    progressInMeters = self->_progressInMeters;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
    v22 = objc_msgSend(v6, "initWithDoubleValue:unit:", v8, progressInMeters);

    elevationProfile = self->_elevationProfile;
    metric = self->_metric;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView traitCollection](self, "traitCollection"));
    selected = self->_selected;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView _chartStyle](self, "_chartStyle"));
    v14 = (UIViewController *)objc_claimAutoreleasedReturnValue(+[MapsElevationGraphViewController makeHostingControllerFor:width:isMetric:traitCollection:shouldHighlight:chartStyle:currentPosition:](_TtC4Maps32MapsElevationGraphViewController, "makeHostingControllerFor:width:isMetric:traitCollection:shouldHighlight:chartStyle:currentPosition:", elevationProfile, metric, v11, selected, v13, v22, v5));
    v15 = self->_chartViewController;
    self->_chartViewController = v14;

    v16 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_chartViewController, "view"));
    chartSubcontainerView = self->_chartSubcontainerView;
    self->_chartSubcontainerView = v16;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_chartSubcontainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](self->_chartSubcontainerView, "setBackgroundColor:", v18);

    -[UIView addSubview:](self->_chartContainerView, "addSubview:", self->_chartSubcontainerView);
    LODWORD(v19) = 1148846080;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfView:priority:](self->_chartSubcontainerView, "_maps_constraintsEqualToEdgesOfView:priority:", self->_chartContainerView, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  }
}

- (void)_updateMeasurementUnits
{
  void *v3;
  void *v4;
  NSUnitLength **p_elevationUnit;
  id v6;
  NSObject *v7;
  DirectionsElevationGraphView *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUnitLength *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  NSUnitLength *v19;

  if (self->_metric)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength feet](NSUnitLength, "feet"));
  v4 = v3;
  p_elevationUnit = &self->_elevationUnit;
  objc_storeStrong((id *)&self->_elevationUnit, v3);

  v6 = sub_100432CAC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

    v15 = *p_elevationUnit;
    *(_DWORD *)buf = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ | Will use '%@' for elevation", buf, 0x16u);

  }
}

- (void)_unitsDidChange
{
  void *v3;
  id v4;
  NSObject *v5;
  DirectionsElevationGraphView *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  self->_metric = objc_msgSend(v3, "_navigation_distanceUsesMetricSystem");

  v4 = sub_100432CAC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    goto LABEL_11;
  v6 = self;
  v7 = (objc_class *)objc_opt_class(v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

      goto LABEL_7;
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

  if (self->_metric)
    v13 = "metric";
  else
    v13 = "imperial";
  *(_DWORD *)buf = 138412546;
  v15 = v12;
  v16 = 2080;
  v17 = v13;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ | Notified units changed to %s", buf, 0x16u);

LABEL_11:
  -[DirectionsElevationGraphView _updateMeasurementUnits](self, "_updateMeasurementUnits");
  -[DirectionsElevationGraphView _updateChartView](self, "_updateChartView");
}

- (unint64_t)_numberOfBarsForCurrentWidth
{
  double Width;
  double v4;
  CGRect v6;

  -[UIView bounds](self->_chartContainerView, "bounds");
  Width = CGRectGetWidth(v6);
  if (fabs(Width) <= 2.22044605e-16)
    return 0;
  -[DirectionsElevationGraphView _estimatedElevationAxisWidth](self, "_estimatedElevationAxisWidth");
  return -[DirectionsElevationGraphConfiguration targetNumberOfBarsForRouteLength:availableWidth:](self->_configuration, "targetNumberOfBarsForRouteLength:availableWidth:", self->_routeLength, Width - v4);
}

- (double)_estimatedElevationAxisWidth
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  void *i;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  NSAttributedStringKey v30;
  void *v31;
  UIFontDescriptorAttributeName v32;
  void *v33;
  UIFontDescriptorTraitKey v34;
  void *v35;
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView elevationProfile](self, "elevationProfile"));
  if (objc_msgSend(v3, "isValid"))
  {
    v4 = -[DirectionsElevationGraphConfiguration showsElevationAxisLabels](self->_configuration, "showsElevationAxisLabels");

    v5 = 0.0;
    if ((v4 & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView elevationProfile](self, "elevationProfile", 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "points"));

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        v11 = 0x80000000;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            if (v11 <= (int)objc_msgSend(v13, "elevationCm"))
              v11 = objc_msgSend(v13, "elevationCm");
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 0x80000000;
      }

      v14 = 3.2808399;
      if (self->_metric)
        v14 = 1.0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphView _stringForAxesWithElevation:](self, "_stringForAxesWithElevation:", (double)v11 / 100.0 * v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCaption2));
      v34 = UIFontWeightTrait;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightMedium));
      v35 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));

      v32 = UIFontDescriptorTraitsAttribute;
      v33 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fontDescriptorByAddingAttributes:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v20, 0.0));
      v30 = NSFontAttributeName;
      v31 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      objc_msgSend(v15, "sizeWithAttributes:", v22);
      v24 = v23;

      v5 = v24 + 8.0;
    }
  }
  else
  {

    return 0.0;
  }
  return v5;
}

- (double)_targetChartDrawingWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = (double)-[DirectionsElevationGraphView _numberOfBarsForCurrentWidth](self, "_numberOfBarsForCurrentWidth");
  -[DirectionsElevationGraphConfiguration barWidth](self->_configuration, "barWidth");
  v5 = v4;
  -[DirectionsElevationGraphConfiguration gapWidth](self->_configuration, "gapWidth");
  v7 = v5 + v6;
  -[DirectionsElevationGraphConfiguration gapWidth](self->_configuration, "gapWidth");
  if (-(v8 - v3 * v7) < 0.0)
    return 0.0;
  v10 = (double)-[DirectionsElevationGraphView _numberOfBarsForCurrentWidth](self, "_numberOfBarsForCurrentWidth");
  -[DirectionsElevationGraphConfiguration barWidth](self->_configuration, "barWidth");
  v12 = v11;
  -[DirectionsElevationGraphConfiguration gapWidth](self->_configuration, "gapWidth");
  v14 = v12 + v13;
  -[DirectionsElevationGraphConfiguration gapWidth](self->_configuration, "gapWidth");
  return -(v15 - v10 * v14);
}

- (id)_stringForAxesWithOffset:(double)a3
{
  if (!self->_metric)
    a3 = a3 * 0.3048;
  return -[DirectionsElevationGraphView _stringForAxesWithOffsetInMeters:](self, "_stringForAxesWithOffsetInMeters:", a3);
}

- (id)_stringForAxesWithOffsetInMeters:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  double routeLength;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (a3 == 0.0)
  {
    v4 = objc_alloc_init((Class)NSMeasurementFormatter);
    objc_msgSend(v4, "setUnitOptions:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberFormatter"));
    objc_msgSend(v5, "setMaximumFractionDigits:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberFormatter"));
    objc_msgSend(v6, "setMinimumFractionDigits:", 0);

    routeLength = self->_routeLength;
    if (self->_metric)
    {
      if (routeLength >= 1000.0)
        v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength kilometers](NSUnitLength, "kilometers"));
      else
        v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
    }
    else if (routeLength * 3.2808399 >= 5280.0)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength miles](NSUnitLength, "miles"));
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength feet](NSUnitLength, "feet"));
    }
    v10 = (void *)v8;
    v11 = objc_msgSend(objc_alloc((Class)NSMeasurement), "initWithDoubleValue:unit:", v8, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromMeasurement:", v11));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0));
  }
  return v9;
}

- (id)_stringForAxesWithElevation:(double)a3
{
  NSMeasurementFormatter *v5;
  id v6;
  void *v7;

  v5 = self->_elevationFormatter;
  v6 = objc_msgSend(objc_alloc((Class)NSMeasurement), "initWithDoubleValue:unit:", self->_elevationUnit, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter stringFromMeasurement:](v5, "stringFromMeasurement:", v6));

  return v7;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (GEOElevationProfile)elevationProfile
{
  return self->_elevationProfile;
}

- (void)setElevationProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)routeLength
{
  return self->_routeLength;
}

- (void)setRouteLength:(double)a3
{
  self->_routeLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_chartSubcontainerView, 0);
  objc_storeStrong((id *)&self->_chartViewController, 0);
  objc_storeStrong((id *)&self->_chartContainerView, 0);
  objc_storeStrong((id *)&self->_elevationUnit, 0);
  objc_storeStrong((id *)&self->_elevationFormatter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
