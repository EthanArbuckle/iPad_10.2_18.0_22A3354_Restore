@implementation NavSignLaneGuidanceView

+ (int64_t)maxNumberVisibleLanesForSignWidth:(double)a3
{
  if (a3 <= 0.0)
    return 0;
  else
    return llround((double)GEOConfigGetInteger(MapsConfig_NavigationLaneGuidanceMaxVisibleLanes, off_1014B2FF8) * a3 / 375.0);
}

- (NavSignLaneGuidanceView)initWithLaneStyle:(unint64_t)a3
{
  NavSignLaneGuidanceView *v4;
  uint64_t v5;
  NSMutableArray *laneViews;
  __int128 v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavSignLaneGuidanceView;
  v4 = -[NavSignLaneGuidanceView initWithFrame:](&v10, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    laneViews = v4->_laneViews;
    v4->_laneViews = (NSMutableArray *)v5;

    v4->_laneStyle = a3;
    v4->_lastUpdatedSignWidth = 0.0;
    v4->_maxNumberOfVisibleLanes = 0x7FFFFFFFFFFFFFFFLL;
    v7 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v4->_edgeInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v4->_edgeInsets.bottom = v7;
    v4->_verticalScale = 1.0;
    -[NavSignLaneGuidanceView setClipsToBounds:](v4, "setClipsToBounds:", 0);
    -[NavSignLaneGuidanceView _setupConstraints](v4, "_setupConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[NavSignLaneGuidanceView setBackgroundColor:](v4, "setBackgroundColor:", v8);

  }
  return v4;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[NavSignLaneGuidanceView _updateLaneContentMargins](self, "_updateLaneContentMargins");
  }
}

- (void)setVerticalScale:(double)a3
{
  if (a3 <= 1.0 && a3 > 0.0 && self->_verticalScale != a3)
  {
    self->_verticalScale = a3;
    -[NavSignLaneGuidanceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldTransformWithVerticalScale:(BOOL)a3
{
  if (self->_shouldTransformWithVerticalScale != a3)
  {
    self->_shouldTransformWithVerticalScale = a3;
    -[NavSignLaneGuidanceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLanes:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSArray *lanes;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  NavSignLaneGuidanceView *v26;
  __int16 v27;
  NSArray *v28;
  __int16 v29;
  id v30;

  v4 = a3;
  if ((+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v4, self->_lanes) & 1) == 0)
  {
    v5 = sub_1009DE114();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      lanes = self->_lanes;
      *(_DWORD *)buf = 134349570;
      v26 = self;
      v27 = 2112;
      v28 = lanes;
      v29 = 2112;
      v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Changing lanes from %@ to %@", buf, 0x20u);
    }

    v8 = (NSArray *)objc_msgSend(v4, "copy");
    v9 = self->_lanes;
    self->_lanes = v8;

    self->_maneuverHasPreferredLane = 0;
    self->_laneArrowBiasDirection = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = self->_lanes;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "isPreferredLaneForManeuver", (_QWORD)v20))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "directions"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
            self->_laneArrowBiasDirection = MKLaneDirectionIsToTheLeft(objc_msgSend(v19, "direction")) ^ 1;

            self->_maneuverHasPreferredLane = 1;
            goto LABEL_16;
          }
          if (objc_msgSend(v15, "isLaneForManeuver"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "directions"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
            self->_laneArrowBiasDirection = MKLaneDirectionIsToTheLeft(objc_msgSend(v17, "direction")) ^ 1;

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_16:

    -[NavSignLaneGuidanceView _resetLanes](self, "_resetLanes");
  }

}

- (void)setDebugHighlightLanes:(BOOL)a3
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

  if (self->_debugHighlightLanes != a3)
  {
    self->_debugHighlightLanes = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_laneViews;
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
          -[NavSignLaneGuidanceView _debugHighlightLaneView:](self, "_debugHighlightLaneView:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), (_QWORD)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (_NSRange)highlightedLaneRange
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView lanes](self, "lanes"));
  v3 = +[NavSignLaneGuidanceInfo highlightedLaneRangeForLanes:](NavSignLaneGuidanceInfo, "highlightedLaneRangeForLanes:", v2);
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setInvalidArrowColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = (UIColor *)a3;
  v6 = v5;
  if (v5 && self->_invalidArrowColor != v5)
  {
    objc_storeStrong((id *)&self->_invalidArrowColor, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_laneViews;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "setInvalidArrowColor:", self->_invalidArrowColor, (_QWORD)v13);
          objc_msgSend(v12, "setNeedsDisplay");
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    -[NavSignLaneGuidanceView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (BOOL)highlightedLanesNotInVisibleRange
{
  void *v3;
  id v4;
  unint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  void *v10;
  unint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView lanes](self, "lanes"));
  v4 = objc_msgSend(v3, "count");
  v5 = -[NavSignLaneGuidanceView maxNumberOfVisibleLanes](self, "maxNumberOfVisibleLanes");

  if ((unint64_t)v4 > v5)
  {
    v6 = (char *)-[NavSignLaneGuidanceView highlightedLaneRange](self, "highlightedLaneRange");
    v8 = v7;
    if (v7 >= -[NavSignLaneGuidanceView maxNumberOfVisibleLanes](self, "maxNumberOfVisibleLanes")
      || v6 && v6 <= (char *)-[NavSignLaneGuidanceView _leftmostVisibleLaneIndex](self, "_leftmostVisibleLaneIndex"))
    {
      return 1;
    }
    v9 = &v6[v8 - 1];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView lanes](self, "lanes"));
    if (v9 >= (char *)objc_msgSend(v10, "count") - 1)
    {

    }
    else
    {
      v11 = -[NavSignLaneGuidanceView _rightmostVisibleLaneIndex](self, "_rightmostVisibleLaneIndex");

      if ((unint64_t)v9 >= v11)
        return 1;
    }
  }
  return 0;
}

- (unint64_t)numberOfVisibleLanes
{
  return self->_visibleLaneRange.length;
}

- (double)availableWidthForLanes
{
  double Width;
  double v4;
  double v5;
  double v6;
  double result;
  CGRect v8;

  -[NavSignLaneGuidanceView bounds](self, "bounds");
  Width = CGRectGetWidth(v8);
  -[NavSignLaneGuidanceView edgeInsets](self, "edgeInsets");
  v5 = Width - v4;
  -[NavSignLaneGuidanceView edgeInsets](self, "edgeInsets");
  result = v5 - v6;
  if (v5 - v6 < 0.0)
    return 0.0;
  return result;
}

- (double)availableLaneWidth
{
  double v3;

  if (!-[NavSignLaneGuidanceView numberOfVisibleLanes](self, "numberOfVisibleLanes"))
    return 0.0;
  -[NavSignLaneGuidanceView availableWidthForLanes](self, "availableWidthForLanes");
  return v3 / (double)-[NavSignLaneGuidanceView numberOfVisibleLanes](self, "numberOfVisibleLanes");
}

- (id)duplicateLaneGuidanceView
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithLaneStyle:", self->_laneStyle);
  -[NavSignLaneGuidanceView edgeInsets](self, "edgeInsets");
  objc_msgSend(v3, "setEdgeInsets:");
  -[NavSignLaneGuidanceView verticalScale](self, "verticalScale");
  objc_msgSend(v3, "setVerticalScale:");
  objc_msgSend(v3, "setShouldTransformWithVerticalScale:", -[NavSignLaneGuidanceView shouldTransformWithVerticalScale](self, "shouldTransformWithVerticalScale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView lanes](self, "lanes"));
  objc_msgSend(v3, "setLanes:", v4);

  return v3;
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (void)layoutSubviews
{
  id v3;
  NSObject *v4;
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  double lastUpdatedSignWidth;
  NSString *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  NSObject *v25;
  void *v26;
  double v27;
  id v28;
  NSObject *v29;
  const char *v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  NSUInteger length;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  unint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v55;
  double v56;
  double v57;
  NSMutableArray *laneViews;
  _QWORD v59[9];
  objc_super v60;
  uint8_t buf[4];
  NavSignLaneGuidanceView *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  double v70;
  __int16 v71;
  void *v72;
  CGRect v73;
  CGRect v74;

  v60.receiver = self;
  v60.super_class = (Class)NavSignLaneGuidanceView;
  -[NavSignLaneGuidanceView layoutSubviews](&v60, "layoutSubviews");
  v3 = sub_1009DE114();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[NSMutableArray count](self->_laneViews, "count");
    -[NavSignLaneGuidanceView bounds](self, "bounds");
    v6 = NSStringFromCGRect(v73);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView superview](self, "superview"));
    objc_msgSend(v8, "bounds");
    v9 = NSStringFromCGRect(v74);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    lastUpdatedSignWidth = self->_lastUpdatedSignWidth;
    v12 = NSStringFromRange(self->_visibleLaneRange);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 134350338;
    v62 = self;
    v63 = 2048;
    v64 = v5;
    v65 = 2112;
    v66 = v7;
    v67 = 2112;
    v68 = v10;
    v69 = 2048;
    v70 = lastUpdatedSignWidth;
    v71 = 2112;
    v72 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] layoutSubviews _laneViews.count: %lu, self.bounds: %@, superview.bounds: %@, _lastUpdatedSignWidth: %.2f, visibleLaneRange: %@", buf, 0x3Eu);

  }
  if (-[NSMutableArray count](self->_laneViews, "count"))
  {
    -[NavSignLaneGuidanceView bounds](self, "bounds");
    if (v14 == 0.0 || (v16 = v15, v15 == 0.0))
    {
      v28 = sub_1009DE114();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v62 = self;
        v30 = "[%{public}p] layoutSubviews zero bounds";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v30, buf, 0xCu);
      }
LABEL_17:

      return;
    }
    v17 = v14;
    v18 = objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView superview](self, "superview"));
    if (v18)
    {
      v19 = (void *)v18;
      v20 = self->_lastUpdatedSignWidth;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView superview](self, "superview"));
      objc_msgSend(v21, "bounds");
      v23 = vabdd_f64(v20, v22);

      if (v23 > 2.22044605e-16)
      {
        v24 = sub_1009DE114();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v62 = self;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] layoutSubviews. _lastUpdatedSignWidth does not match current bounds, will update lanes for new width", buf, 0xCu);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView superview](self, "superview"));
        objc_msgSend(v26, "bounds");
        -[NavSignLaneGuidanceView _updateMaxLanesForSignWidth:](self, "_updateMaxLanesForSignWidth:", v27);

        -[NavSignLaneGuidanceView layoutIfNeeded](self, "layoutIfNeeded");
        return;
      }
    }
    if (self->_lastUpdatedSignWidth == 0.0)
    {
      v31 = sub_1009DE114();
      v29 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v62 = self;
        v30 = "[%{public}p] layoutSubviews. _lastUpdatedSignWidth is 0";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    v32 = -[NavSignLaneGuidanceView _leftmostVisibleLaneIndex](self, "_leftmostVisibleLaneIndex");
    v33 = -[NavSignLaneGuidanceView _rightmostVisibleLaneIndex](self, "_rightmostVisibleLaneIndex");
    if (v32 && v32 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_laneViews, "objectAtIndexedSubscript:", v32));
      objc_msgSend(v34, "bounds");
      -[CAGradientLayer setFrame:](self->_leftEdgeLaneGradientLayer, "setFrame:");

    }
    if (v33 != 0x7FFFFFFFFFFFFFFFLL && v33 + 1 < (unint64_t)-[NSMutableArray count](self->_laneViews, "count"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_laneViews, "objectAtIndexedSubscript:", v33));
      objc_msgSend(v35, "bounds");
      -[CAGradientLayer setFrame:](self->_rightEdgeLaneGradientLayer, "setFrame:");

    }
    length = self->_visibleLaneRange.length;
    if (length)
    {
      v37 = v17 / (double)length;
      v38 = 1.0;
      if (!-[NavSignLaneGuidanceView shouldTransformWithVerticalScale](self, "shouldTransformWithVerticalScale"))
      {
        -[NavSignLaneGuidanceView verticalScale](self, "verticalScale");
        if (v39 <= 1.0)
        {
          -[NavSignLaneGuidanceView verticalScale](self, "verticalScale");
          v38 = v40;
        }
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView window](self, "window"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "screen"));
      objc_msgSend(v42, "nativeScale");
      if (v43 <= 2.0)
        v44 = 51.0;
      else
        v44 = 60.0;

      if (v37 < v44 && v38 >= v37 / v44)
        v38 = v37 / v44;
      v46 = 0.0;
      v47 = 0.0;
      if (v32 <= v33)
      {
        v48 = v32;
        do
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_laneViews, "objectAtIndexedSubscript:", v48));
          objc_msgSend(v49, "intrinsicContentSize");
          if (v50 > v46)
          {
            objc_msgSend(v49, "intrinsicContentSize");
            v46 = v51;
          }
          objc_msgSend(v49, "intrinsicContentSize");
          if (v52 > v47)
          {
            objc_msgSend(v49, "intrinsicContentSize");
            v47 = v53;
          }

          ++v48;
        }
        while (v48 <= v33);
      }
      if (v38 * v47 > v37 && v47 > 0.0)
        v38 = v37 / v47;
      v55 = UIRoundToViewScale(self, v45, v46);
      if (v16 < v55 * v38 && v38 >= v16 / v55)
        v38 = v16 / v55;
      v56 = v16 - v55 * v38;
      if (v56 - (1.0 - v38) * 25.0 >= 0.0)
        v57 = (1.0 - v38) * 25.0;
      else
        v57 = v56;
      -[NSLayoutConstraint setConstant:](self->_offsetFromBottomHeightConstraint, "setConstant:", v57);
      laneViews = self->_laneViews;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1009DEBE0;
      v59[3] = &unk_1011DEC38;
      v59[5] = v32;
      v59[6] = v33;
      *(double *)&v59[7] = v38;
      *(double *)&v59[8] = v57;
      v59[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](laneViews, "enumerateObjectsUsingBlock:", v59);
    }
  }
}

+ (_NSRange)_visibleLaneRangeForNumberOfLanes:(unint64_t)a3 maxNumberOfVisibleLanes:(unint64_t)a4 highlightedLaneRange:(_NSRange)a5
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v5 = 0;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 && a4)
  {
    v7 = a3 - a4;
    if (a3 >= a4)
      v5 = a4;
    else
      v5 = a3;
    if (a3 > a4)
    {
      if (a3 - (a5.location + a5.length) >= a5.location || a5.location < v7)
        v7 = 0;
      if (a5.length > a4)
        v7 = 0;
      if (a5.location == 0x7FFFFFFFFFFFFFFFLL)
        v6 = 0;
      else
        v6 = v7;
    }
    else
    {
      v6 = 0;
    }
  }
  result.length = v5;
  result.location = v6;
  return result;
}

- (void)_updateMaxLanesForSignWidth:(double)a3
{
  id v5;
  NSObject *v6;
  double lastUpdatedSignWidth;
  unint64_t v8;
  id v9;
  NSObject *v10;
  unint64_t maxNumberOfVisibleLanes;
  int v12;
  NavSignLaneGuidanceView *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;

  v5 = sub_1009DE114();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    lastUpdatedSignWidth = self->_lastUpdatedSignWidth;
    v12 = 134349568;
    v13 = self;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = lastUpdatedSignWidth;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] _updateMaxLanesForSignWidth: %.2f, previousWidth: %.2f", (uint8_t *)&v12, 0x20u);
  }

  if (a3 > 0.0 && vabdd_f64(self->_lastUpdatedSignWidth, a3) > 2.22044605e-16)
  {
    self->_lastUpdatedSignWidth = a3;
    if (self->_laneStyle - 1 < 2)
      a3 = a3 + a3;
    if (+[NavSignLaneGuidanceView maxNumberVisibleLanesForSignWidth:](NavSignLaneGuidanceView, "maxNumberVisibleLanesForSignWidth:", a3) < 0)v8 = 0;
    else
      v8 = +[NavSignLaneGuidanceView maxNumberVisibleLanesForSignWidth:](NavSignLaneGuidanceView, "maxNumberVisibleLanesForSignWidth:", a3);
    self->_maxNumberOfVisibleLanes = v8;
    v9 = sub_1009DE114();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      maxNumberOfVisibleLanes = self->_maxNumberOfVisibleLanes;
      v12 = 134349312;
      v13 = self;
      v14 = 2048;
      v15 = *(double *)&maxNumberOfVisibleLanes;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] _updateMaxLanesForSignWidth: _maxNumberOfVisibleLanes set to %lu", (uint8_t *)&v12, 0x16u);
    }

    -[NavSignLaneGuidanceView _resetLanes](self, "_resetLanes");
  }
}

- (void)_updateLaneContentMargins
{
  double v3;
  double v4;
  double v5;

  -[NavSignLaneGuidanceView edgeInsets](self, "edgeInsets");
  -[NSLayoutConstraint setConstant:](self->_laneContentTopMarginConstraint, "setConstant:");
  -[NavSignLaneGuidanceView edgeInsets](self, "edgeInsets");
  -[NSLayoutConstraint setConstant:](self->_laneContentBottomMarginConstraint, "setConstant:", v3);
  -[NavSignLaneGuidanceView edgeInsets](self, "edgeInsets");
  -[NSLayoutConstraint setConstant:](self->_laneContentLeftMarginConstraint, "setConstant:", v4);
  -[NavSignLaneGuidanceView edgeInsets](self, "edgeInsets");
  -[NSLayoutConstraint setConstant:](self->_laneContentRightMarginConstraint, "setConstant:", v5);
}

- (id)_newGradientLayerWithFrame:(CGRect)a3 forLeftEdge:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  id v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  _QWORD v18[2];

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView theme](self, "theme"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navSignPrimaryColor"));

  v11 = objc_alloc_init((Class)CAGradientLayer);
  objc_msgSend(v11, "setFrame:", x, y, width, height);
  objc_msgSend(v11, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  v12 = 0.0;
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorWithAlphaComponent:", 0.0)));
  v18[0] = objc_msgSend(v13, "CGColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorWithAlphaComponent:", 1.0)));
  v18[1] = objc_msgSend(v14, "CGColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  objc_msgSend(v11, "setColors:", v15);

  objc_msgSend(v11, "setLocations:", &off_101274190);
  if (v4)
    v16 = 0.0;
  else
    v16 = 1.0;
  if (v4)
    v12 = 1.0;
  objc_msgSend(v11, "setStartPoint:", v16, 0.5);
  objc_msgSend(v11, "setEndPoint:", v12, 0.5);

  return v11;
}

- (unint64_t)_leftmostVisibleLaneIndex
{
  return self->_visibleLaneRange.location;
}

- (unint64_t)_rightmostVisibleLaneIndex
{
  _NSRange *p_visibleLaneRange;
  NSUInteger location;
  unint64_t result;
  NSUInteger length;

  p_visibleLaneRange = &self->_visibleLaneRange;
  location = self->_visibleLaneRange.location;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = p_visibleLaneRange->length;
    if (length)
      return location + length - 1;
  }
  return result;
}

- (void)_setupConstraints
{
  UILayoutGuide *v3;
  UILayoutGuide *laneContentGuide;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *laneContentTopMarginConstraint;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *laneContentBottomMarginConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *laneContentLeftMarginConstraint;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *laneContentRightMarginConstraint;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *v22;
  void *v23;
  UILayoutGuide *v24;
  UILayoutGuide *offsetFromBottomGuide;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *offsetFromBottomHeightConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSLayoutConstraint *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[4];

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  laneContentGuide = self->_laneContentGuide;
  self->_laneContentGuide = v3;

  -[NavSignLaneGuidanceView addLayoutGuide:](self, "addLayoutGuide:", self->_laneContentGuide);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_laneContentGuide, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView topAnchor](self, "topAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  laneContentTopMarginConstraint = self->_laneContentTopMarginConstraint;
  self->_laneContentTopMarginConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView bottomAnchor](self, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_laneContentGuide, "bottomAnchor"));
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  laneContentBottomMarginConstraint = self->_laneContentBottomMarginConstraint;
  self->_laneContentBottomMarginConstraint = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](self->_laneContentGuide, "leftAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView leftAnchor](self, "leftAnchor"));
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  laneContentLeftMarginConstraint = self->_laneContentLeftMarginConstraint;
  self->_laneContentLeftMarginConstraint = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView rightAnchor](self, "rightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](self->_laneContentGuide, "rightAnchor"));
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  laneContentRightMarginConstraint = self->_laneContentRightMarginConstraint;
  self->_laneContentRightMarginConstraint = v19;

  v21 = self->_laneContentLeftMarginConstraint;
  v42[0] = self->_laneContentTopMarginConstraint;
  v42[1] = v21;
  v22 = self->_laneContentBottomMarginConstraint;
  v42[2] = self->_laneContentRightMarginConstraint;
  v42[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
  objc_msgSend(v40, "addObjectsFromArray:", v23);

  v24 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  offsetFromBottomGuide = self->_offsetFromBottomGuide;
  self->_offsetFromBottomGuide = v24;

  -[NavSignLaneGuidanceView addLayoutGuide:](self, "addLayoutGuide:", self->_offsetFromBottomGuide);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_offsetFromBottomGuide, "heightAnchor"));
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 0.0));
  offsetFromBottomHeightConstraint = self->_offsetFromBottomHeightConstraint;
  self->_offsetFromBottomHeightConstraint = v27;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_offsetFromBottomGuide, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_laneContentGuide, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v29));
  v41[0] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](self->_offsetFromBottomGuide, "leftAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](self->_laneContentGuide, "leftAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  v41[1] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](self->_offsetFromBottomGuide, "rightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](self->_laneContentGuide, "rightAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  v37 = self->_offsetFromBottomHeightConstraint;
  v41[2] = v36;
  v41[3] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
  objc_msgSend(v40, "addObjectsFromArray:", v38);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);
}

- (void)_resetLanes
{
  id v3;
  NSObject *v4;
  id v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  CAGradientLayer *leftEdgeLaneGradientLayer;
  CAGradientLayer *rightEdgeLaneGradientLayer;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  int64_t v17;
  id v18;
  uint64_t v19;
  NSUInteger v20;
  BOOL v21;
  id v22;
  id v23;
  NSString *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger length;
  NSObject *v29;
  double v30;
  uint64_t v31;
  int *v32;
  double v33;
  uint64_t v34;
  void *v35;
  NavSignLaneGuidanceView *v36;
  void *v37;
  NavSignLaneGuidanceView *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  id v66;
  NSString *v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  NSArray *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  NavSignLaneGuidanceView *v83;
  __int16 v84;
  id v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  CGRect v90;

  v3 = sub_1009DE114();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[NSMutableArray count](self->_laneViews, "count");
    v6 = NSStringFromRange(self->_visibleLaneRange);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavSignLaneGuidanceView frame](self, "frame");
    v8 = NSStringFromCGRect(v90);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 134349826;
    v83 = self;
    v84 = 2048;
    v85 = v5;
    v86 = 2112;
    v87 = v7;
    v88 = 2112;
    v89 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] _resetLanes: will reset lanes, current - lanes.count: %lu, _visibleLaneRange: %@, frame: %@", buf, 0x2Au);

  }
  leftEdgeLaneGradientLayer = self->_leftEdgeLaneGradientLayer;
  self->_leftEdgeLaneGradientLayer = 0;

  rightEdgeLaneGradientLayer = self->_rightEdgeLaneGradientLayer;
  self->_rightEdgeLaneGradientLayer = 0;

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v12 = self->_laneViews;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    }
    while (v14);
  }

  -[NSMutableArray removeAllObjects](self->_laneViews, "removeAllObjects");
  v75 = self->_lanes;
  v17 = -[NSArray count](v75, "count");
  v18 = -[NavSignLaneGuidanceView highlightedLaneRange](self, "highlightedLaneRange");
  self->_visibleLaneRange.location = (NSUInteger)+[NavSignLaneGuidanceView _visibleLaneRangeForNumberOfLanes:maxNumberOfVisibleLanes:highlightedLaneRange:](NavSignLaneGuidanceView, "_visibleLaneRangeForNumberOfLanes:maxNumberOfVisibleLanes:highlightedLaneRange:", v17, self->_maxNumberOfVisibleLanes, v18, v19);
  self->_visibleLaneRange.length = v20;
  if (v17)
    v21 = v20 == 0;
  else
    v21 = 1;
  if (!v21)
  {
    v26 = -[NavSignLaneGuidanceView _leftmostVisibleLaneIndex](self, "_leftmostVisibleLaneIndex");
    v27 = -[NavSignLaneGuidanceView _rightmostVisibleLaneIndex](self, "_rightmostVisibleLaneIndex");
    length = self->_visibleLaneRange.length;
    v29 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v30 = 0.5 / (double)length;
    v76 = -(uint64_t)(v26 + (length >> 1));
    v73 = -v17;
    v74 = length;
    v69 = v17 - 1;
    v70 = -(uint64_t)v27;
    v71 = v29;
    v72 = -(uint64_t)v26;
    v31 = -1;
    v32 = &OBJC_IVAR___SearchHomeBrowseCategoriesDataProvider__identifier;
    v33 = 1.0 / (double)length;
    while (1)
    {
      v34 = v76 + v31;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v75, "objectAtIndexedSubscript:", v31 + 1));
      v36 = (NavSignLaneGuidanceView *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView _laneViewForLane:](self, "_laneViewForLane:", v35));

      -[NSMutableArray addObject:](self->_laneViews, "addObject:", v36);
      -[NavSignLaneGuidanceView addSubview:](self, "addSubview:", v36);
      if ((v74 & 1) != 0)
      {
        if (v34 != -1)
          goto LABEL_26;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView centerXAnchor](v36, "centerXAnchor"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView centerXAnchor](self, "centerXAnchor"));
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
      }
      else
      {
        if (v34 == -1)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView centerXAnchor](self, "centerXAnchor"));
          v38 = v36;
        }
        else
        {
          if (v76 + v31 != -2)
            goto LABEL_26;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView centerXAnchor](v36, "centerXAnchor"));
          v38 = self;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView centerXAnchor](v38, "centerXAnchor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "anchorWithOffsetToAnchor:", v42));

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                           + v32[377]), "widthAnchor"));
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:multiplier:", v40, v30));
      }
      v43 = (void *)v41;
      -[NSObject addObject:](v29, "addObject:", v41);

LABEL_26:
      if (v31 != -1)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_laneViews, "objectAtIndexedSubscript:", v31));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerXAnchor"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView centerXAnchor](v36, "centerXAnchor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "anchorWithOffsetToAnchor:", v46));

        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                           + v32[377]), "widthAnchor"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:multiplier:", v48, v33));
        -[NSObject addObject:](v29, "addObject:", v49);

      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView topAnchor](v36, "topAnchor"));
      v51 = v32[377];
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + v51), "topAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
      -[NSObject addObject:](v29, "addObject:", v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView bottomAnchor](v36, "bottomAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + v51), "bottomAnchor"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
      -[NSObject addObject:](v29, "addObject:", v56);

      if (v72 + v31 != -1 || v31 == -1)
      {
        if (v70 + v31 != -1 || v31 + 1 >= v69)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView layer](v36, "layer"));
          v62 = v61;
          v63 = 0;
          goto LABEL_36;
        }
        -[NavSignLaneGuidanceView bounds](v36, "bounds");
        v57 = -[NavSignLaneGuidanceView _newGradientLayerWithFrame:forLeftEdge:](self, "_newGradientLayerWithFrame:forLeftEdge:", 0);
        v58 = 32;
      }
      else
      {
        -[NavSignLaneGuidanceView bounds](v36, "bounds");
        v57 = -[NavSignLaneGuidanceView _newGradientLayerWithFrame:forLeftEdge:](self, "_newGradientLayerWithFrame:forLeftEdge:", 1);
        v58 = 24;
      }
      v59 = *(Class *)((char *)&self->super.super.super.super.isa + v58);
      *(Class *)((char *)&self->super.super.super.super.isa + v58) = v57;

      v60 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v58);
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView layer](v36, "layer"));
      v62 = v61;
      v63 = v60;
LABEL_36:
      objc_msgSend(v61, "setMask:", v63);
      v32 = &OBJC_IVAR___SearchHomeBrowseCategoriesDataProvider__identifier;

      -[NavSignLaneGuidanceView _debugHighlightLaneView:](self, "_debugHighlightLaneView:", v36);
      ++v31;
      v29 = v71;
      if (v73 + v31 == -1)
      {
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v71);
        v64 = sub_1009DE114();
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v66 = -[NSMutableArray count](self->_laneViews, "count");
          v67 = NSStringFromRange(self->_visibleLaneRange);
          v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
          *(_DWORD *)buf = 134349570;
          v83 = self;
          v84 = 2048;
          v85 = v66;
          v86 = 2112;
          v87 = v68;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "[%{public}p] _resetLanes: did reset lanes, current - lanes.count: %lu, _visibleLaneRange: %@", buf, 0x20u);

        }
        -[NavSignLaneGuidanceView setNeedsLayout](self, "setNeedsLayout");
        goto LABEL_40;
      }
    }
  }
  self->_visibleLaneRange = (_NSRange)xmmword_100E34B10;
  v22 = sub_1009DE114();
  v29 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v23 = -[NSMutableArray count](self->_laneViews, "count");
    v24 = NSStringFromRange(self->_visibleLaneRange);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 134349570;
    v83 = self;
    v84 = 2048;
    v85 = v23;
    v86 = 2112;
    v87 = v25;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] _resetLanes: did reset lanes, current - lanes.count: %lu, _visibleLaneRange: %@", buf, 0x20u);

  }
LABEL_40:

}

- (void)_debugHighlightLaneView:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[NavSignLaneGuidanceView debugHighlightLanes](self, "debugHighlightLanes"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "laneInfo"));
    v5 = objc_msgSend(v4, "isPreferredLaneForManeuver");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
LABEL_7:
      v7 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.5));
      objc_msgSend(v11, "setBackgroundColor:", v10);

      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "laneInfo"));
    v9 = objc_msgSend(v8, "isLaneForManeuver");

    if (v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
      goto LABEL_7;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v11, "setBackgroundColor:", v7);
LABEL_8:

}

- (id)_laneViewForLane:(id)a3
{
  id v4;
  GuidanceLaneView *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = -[GuidanceLaneView initWithLaneInfo:maneuverHasPreferredLane:drawingBiasDirection:laneStyle:]([GuidanceLaneView alloc], "initWithLaneInfo:maneuverHasPreferredLane:drawingBiasDirection:laneStyle:", v4, self->_maneuverHasPreferredLane, self->_laneArrowBiasDirection, self->_laneStyle);

  -[GuidanceLaneView setInvalidArrowColor:](v5, "setInvalidArrowColor:", self->_invalidArrowColor);
  -[GuidanceLaneView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1148846080;
  -[GuidanceLaneView setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1144750080;
  -[GuidanceLaneView setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  LODWORD(v8) = 1144750080;
  -[GuidanceLaneView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1144733696;
  -[GuidanceLaneView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 1, v9);
  return v5;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)verticalScale
{
  return self->_verticalScale;
}

- (BOOL)shouldTransformWithVerticalScale
{
  return self->_shouldTransformWithVerticalScale;
}

- (unint64_t)maxNumberOfVisibleLanes
{
  return self->_maxNumberOfVisibleLanes;
}

- (_NSRange)visibleLaneRange
{
  _NSRange *p_visibleLaneRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_visibleLaneRange = &self->_visibleLaneRange;
  location = self->_visibleLaneRange.location;
  length = p_visibleLaneRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)debugHighlightLanes
{
  return self->_debugHighlightLanes;
}

- (UIColor)invalidArrowColor
{
  return self->_invalidArrowColor;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_invalidArrowColor, 0);
  objc_storeStrong((id *)&self->_offsetFromBottomHeightConstraint, 0);
  objc_storeStrong((id *)&self->_offsetFromBottomGuide, 0);
  objc_storeStrong((id *)&self->_laneContentRightMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentLeftMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentBottomMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentTopMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneContentGuide, 0);
  objc_storeStrong((id *)&self->_laneViews, 0);
  objc_storeStrong((id *)&self->_rightEdgeLaneGradientLayer, 0);
  objc_storeStrong((id *)&self->_leftEdgeLaneGradientLayer, 0);
}

@end
