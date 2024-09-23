@implementation TransportTypePicker

- (void)dealloc
{
  uint64_t v3;
  id authBlockListener;
  id featureBlockListener;
  objc_super v6;

  GEOConfigRemoveBlockListener(self->_authBlockListener, a2);
  GEOConfigRemoveBlockListener(self->_featureBlockListener, v3);
  authBlockListener = self->_authBlockListener;
  self->_authBlockListener = 0;

  featureBlockListener = self->_featureBlockListener;
  self->_featureBlockListener = 0;

  v6.receiver = self;
  v6.super_class = (Class)TransportTypePicker;
  -[TransportTypePicker dealloc](&v6, "dealloc");
}

- (TransportTypePicker)initWithFrame:(CGRect)a3
{
  TransportTypePicker *v3;
  TransportTypePicker *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransportTypePicker;
  v3 = -[TransportTypePicker initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TransportTypePicker _customInit](v3, "_customInit");
  return v4;
}

- (TransportTypePicker)initWithCoder:(id)a3
{
  TransportTypePicker *v3;
  TransportTypePicker *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransportTypePicker;
  v3 = -[TransportTypePicker initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[TransportTypePicker _customInit](v3, "_customInit");
  return v4;
}

- (void)_customInit
{
  UILargeContentViewerInteraction *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  id v11;

  -[TransportTypePicker _mapkit_addPointerInteractionWithDelegate:](self, "_mapkit_addPointerInteractionWithDelegate:", self);
  v3 = objc_opt_new(UILargeContentViewerInteraction);
  -[TransportTypePicker addInteraction:](self, "addInteraction:", v3);

  -[TransportTypePicker setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  v5 = objc_msgSend(v4, "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker layer](self, "layer"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  LODWORD(v7) = 1148846080;
  -[TransportTypePicker setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  self->_selectedType = 0;
  v8 = (objc_class *)objc_opt_class(self);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[TransportTypePicker setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

  -[TransportTypePicker _updateSubviews](self, "_updateSubviews");
  -[TransportTypePicker _updateSegmentsForSelectedTransportType:](self, "_updateSegmentsForSelectedTransportType:", -[TransportTypePicker selectedType](self, "selectedType"));
  if (sub_10048286C())
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "offlineStatusChanged:", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  }
}

- (void)_updateSubviews
{
  NSMutableArray *segments;
  UIStackView *segmentStackView;
  void *v5;
  id v6;
  void *v7;
  UISegmentedControl *segmentedControl;
  UISegmentedControl *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  UIStackView *v13;
  UISegmentedControl *v14;
  UISegmentedControl *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  UIStackView *v23;
  UIStackView *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  NSAttributedStringKey v36;
  void *v37;

  if (sub_1002A8AA0(self) == 5)
  {
    segments = self->_segments;
    self->_segments = 0;

    -[UIStackView removeFromSuperview](self->_segmentStackView, "removeFromSuperview");
    segmentStackView = self->_segmentStackView;
    self->_segmentStackView = 0;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker types](self, "types"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1009D77C8;
    v35[3] = &unk_1011DEA68;
    v35[4] = self;
    v6 = sub_10039DCD4(v5, v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    segmentedControl = self->_segmentedControl;
    if (segmentedControl)
    {
      -[UISegmentedControl removeAllSegments](segmentedControl, "removeAllSegments");
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1009D7A14;
      v34[3] = &unk_1011DEA90;
      v34[4] = self;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v34);
    }
    else
    {
      v14 = (UISegmentedControl *)objc_msgSend(objc_alloc((Class)UISegmentedControl), "initWithItems:", v7);
      v15 = self->_segmentedControl;
      self->_segmentedControl = v14;

      -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UISegmentedControl setControlSize:](self->_segmentedControl, "setControlSize:", 2);
      LODWORD(v16) = 1148846080;
      -[UISegmentedControl setContentCompressionResistancePriority:forAxis:](self->_segmentedControl, "setContentCompressionResistancePriority:forAxis:", 1, v16);
      -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, "_didSelectSegmentInControl:", 4096);
      -[UISegmentedControl setAccessibilityIdentifier:](self->_segmentedControl, "setAccessibilityIdentifier:", CFSTR("TransportTypePickerSegementedControl"));
      v36 = NSForegroundColorAttributeName;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v37 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));

      -[UISegmentedControl setTitleTextAttributes:forState:](self->_segmentedControl, "setTitleTextAttributes:forState:", v18, 0);
      -[TransportTypePicker addSubview:](self, "addSubview:", self->_segmentedControl);
      v19 = objc_alloc_init((Class)NSMutableArray);
      LODWORD(v20) = 1148846080;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl _maps_constraintsEqualToEdgesOfView:priority:](self->_segmentedControl, "_maps_constraintsEqualToEdgesOfView:priority:", self, v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allConstraints"));
      objc_msgSend(v19, "addObjectsFromArray:", v22);

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);
    }
    -[TransportTypePicker _updateSegmentsForSelectedTransportType:](self, "_updateSegmentsForSelectedTransportType:", self->_selectedType);

  }
  else
  {
    -[UISegmentedControl removeFromSuperview](self->_segmentedControl, "removeFromSuperview");
    v9 = self->_segmentedControl;
    self->_segmentedControl = 0;

    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = self->_segments;
    self->_segments = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker types](self, "types"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1009D7A34;
    v33[3] = &unk_1011BF628;
    v33[4] = self;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v33);

    v13 = self->_segmentStackView;
    if (v13)
    {
      -[UIStackView _maps_setArrangedSubviews:](v13, "_maps_setArrangedSubviews:", self->_segments);
    }
    else
    {
      v23 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", self->_segments);
      v24 = self->_segmentStackView;
      self->_segmentStackView = v23;

      -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIStackView setAxis:](self->_segmentStackView, "setAxis:", 0);
      -[UIStackView setDistribution:](self->_segmentStackView, "setDistribution:", 1);
      -[UIStackView setAlignment:](self->_segmentStackView, "setAlignment:", 0);
      -[UIStackView setSpacing:](self->_segmentStackView, "setSpacing:", 10.0);
      LODWORD(v25) = 1144750080;
      -[UIStackView setContentHuggingPriority:forAxis:](self->_segmentStackView, "setContentHuggingPriority:forAxis:", 1, v25);
      LODWORD(v26) = 1132068864;
      -[UIStackView setContentHuggingPriority:forAxis:](self->_segmentStackView, "setContentHuggingPriority:forAxis:", 0, v26);
      LODWORD(v27) = 1148846080;
      -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_segmentStackView, "setContentCompressionResistancePriority:forAxis:", 1, v27);
      LODWORD(v28) = 1132068864;
      -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_segmentStackView, "setContentCompressionResistancePriority:forAxis:", 0, v28);
      -[TransportTypePicker addSubview:](self, "addSubview:", self->_segmentStackView);
      v29 = objc_alloc_init((Class)NSMutableArray);
      LODWORD(v30) = 1148846080;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_constraintsEqualToEdgesOfView:priority:](self->_segmentStackView, "_maps_constraintsEqualToEdgesOfView:priority:", self, v30));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allConstraints"));
      objc_msgSend(v29, "addObjectsFromArray:", v32);

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);
    }
    -[TransportTypePicker _updateSegmentsForSelectedTransportType:](self, "_updateSegmentsForSelectedTransportType:", self->_selectedType);
  }
}

- (NSArray)types
{
  NSArray *types;
  NSArray *v4;
  NSArray *v5;

  types = self->_types;
  if (!types)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker _types](self, "_types"));
    v5 = self->_types;
    self->_types = v4;

    types = self->_types;
  }
  return types;
}

- (id)_types
{
  id v2;
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  BOOL v6;
  id v7;

  v2 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", &off_1012701B0, &off_1012701C8, &off_1012701E0, &off_1012701F8, 0);
  v3 = sub_10048286C();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v5 = objc_msgSend(v4, "isUsingOfflineMaps");

  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
    objc_msgSend(v2, "addObject:", &off_101270210);
  v7 = objc_msgSend(v2, "copy");

  return v7;
}

- (void)setSelectedType:(int64_t)a3
{
  if (self->_selectedType != a3)
  {
    self->_selectedType = a3;
    -[TransportTypePicker _updateSegmentsForSelectedTransportType:](self, "_updateSegmentsForSelectedTransportType:");
  }
}

- (void)offlineStatusChanged:(id)a3
{
  NSArray *types;

  types = self->_types;
  self->_types = 0;

  -[TransportTypePicker _updateSubviews](self, "_updateSubviews");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TransportTypePicker;
  -[TransportTypePicker traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v6 == objc_msgSend(v4, "userInterfaceIdiom"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker traitCollection](self, "traitCollection"));
    objc_msgSend(v7, "displayScale");
    v9 = v8;
    objc_msgSend(v4, "displayScale");
    v11 = v10;

    if (v9 == v11)
      goto LABEL_6;
  }
  else
  {

  }
  -[TransportTypePicker _updateSubviews](self, "_updateSubviews");
LABEL_6:

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  double x;
  double y;
  double width;
  double height;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  CGPoint v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v6 = a4;
  v7 = -[NSMutableArray count](self->_segments, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v9));
      objc_msgSend(v10, "frame");
      v22 = CGRectInset(v21, -2.5, -2.5);
      x = v22.origin.x;
      y = v22.origin.y;
      width = v22.size.width;
      height = v22.size.height;
      objc_msgSend(v6, "location");
      v20.x = v15;
      v20.y = v16;
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      if (CGRectContainsPoint(v23, v20))
        break;

      if (v8 == (id)++v9)
        goto LABEL_5;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v18, x, y, width, height));

  }
  else
  {
LABEL_5:
    v17 = 0;
  }

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    if (v10 >= -[NSMutableArray count](self->_segments, "count"))
    {
      v15 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v10));
      v12 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v12));
      objc_msgSend(v11, "frame");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v13, v14));

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_didSelectSegment:(id)a3
{
  -[TransportTypePicker _didSelectType:](self, "_didSelectType:", objc_msgSend(a3, "transportType"));
}

- (void)_didSelectSegmentInControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "selectedSegmentIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker types](self, "types"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v4));
  v7 = objc_msgSend(v6, "integerValue");

  -[TransportTypePicker _didSelectType:](self, "_didSelectType:", v7);
}

- (void)_didSelectType:(int64_t)a3
{
  id v5;

  -[TransportTypePicker setSelectedType:](self, "setSelectedType:");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransportTypePicker delegate](self, "delegate"));
  objc_msgSend(v5, "transportTypePicker:typeSelected:", self, a3);

}

- (void)_updateSegmentsForSelectedTransportType:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker segments](self, "segments", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "setSelected:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "transportType") == (id)a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypePicker types](self, "types"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", objc_msgSend(v10, "indexOfObject:", v11));

}

- (TransportTypePickerDelegate)delegate
{
  return (TransportTypePickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)selectedType
{
  return self->_selectedType;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (UIStackView)segmentStackView
{
  return self->_segmentStackView;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_segmentStackView, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong(&self->_authBlockListener, 0);
  objc_storeStrong(&self->_featureBlockListener, 0);
}

@end
