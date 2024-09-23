@implementation CarManeuverView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarManeuverView)initWithGuidance:(id)a3 variant:(unint64_t)a4 destination:(unint64_t)a5 layoutType:(unint64_t)a6 sizeDataSource:(id)a7
{
  id v13;
  id v14;
  CarManeuverView *v15;
  CarManeuverView *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *dynamicConstraints;
  uint64_t v19;
  CarManeuverViewStyle *configuredStyle;
  uint64_t v21;
  CarManeuverViewStyle *lowGuidanceStyle;
  id v23;
  NSObject *v24;
  CarManeuverView *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;

  v13 = a3;
  v14 = a7;
  v38.receiver = self;
  v38.super_class = (Class)CarManeuverView;
  v15 = -[CarManeuverView initWithFrame:](&v38, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v16 = v15;
  if (v15)
  {
    -[CarManeuverView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeWeak((id *)&v16->_sizeDataSource, v14);
    v17 = objc_opt_new(NSMutableDictionary);
    dynamicConstraints = v16->_dynamicConstraints;
    v16->_dynamicConstraints = v17;

    v16->_destination = a5;
    objc_storeStrong((id *)&v16->_guidance, a3);
    v19 = objc_claimAutoreleasedReturnValue(+[CarManeuverViewStyle styleWithVariant:destination:layoutType:](CarManeuverViewStyle, "styleWithVariant:destination:layoutType:", a4, a5, a6));
    configuredStyle = v16->_configuredStyle;
    v16->_configuredStyle = (CarManeuverViewStyle *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[CarManeuverViewStyle styleWithVariant:destination:layoutType:](CarManeuverViewStyle, "styleWithVariant:destination:layoutType:", 1, a5, 0));
    lowGuidanceStyle = v16->_lowGuidanceStyle;
    v16->_lowGuidanceStyle = (CarManeuverViewStyle *)v21;

    -[NavSignManeuverGuidanceInfo addGuidanceObserver:](v16->_guidance, "addGuidanceObserver:", v16);
    -[CarManeuverView _setupSubviews](v16, "_setupSubviews");
    -[CarManeuverView _setupStyling](v16, "_setupStyling");
    -[CarManeuverView _setupConstraints](v16, "_setupConstraints");
    -[CarManeuverView _updateContents](v16, "_updateContents");
    v23 = sub_10043341C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      goto LABEL_10;
    }
    v25 = v16;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_8;
      }

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_8:

    v32 = sub_100ABF414(-[CarManeuverView variant](v25, "variant"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = sub_10029A24C(v16->_destination);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "signID"));
    *(_DWORD *)buf = 138544386;
    v40 = v31;
    v41 = 2112;
    v42 = v33;
    v43 = 2112;
    v44 = v35;
    v45 = 2112;
    v46 = v13;
    v47 = 2114;
    v48 = v36;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] Initialized variant: %@, destination: %@, guidance: %@, %{public}@", buf, 0x34u);

    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (void)layoutSubviews
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  int64_t v12;
  int64_t v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  NSString *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  int64_t v27;
  int64_t v28;
  unsigned int v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  id v41;
  const __CFString *v42;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  CarManeuverView *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  int64_t v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  __CFString *v60;
  CGRect v61;
  CGRect v62;

  v44.receiver = self;
  v44.super_class = (Class)CarManeuverView;
  -[CarManeuverView layoutSubviews](&v44, "layoutSubviews");
  v3 = sub_10043341C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[CarManeuverView frame](self, "frame");
    v7 = NSStringFromCGRect(v61);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[CarManeuverView compressionStage](self, "compressionStage");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    v11 = objc_msgSend(v10, "variant");
    v12 = -[NavSignLabel maxNumberOfTotalLines](self->_instructionsLabel, "maxNumberOfTotalLines");
    v13 = -[CarManeuverView labelLineBreakMode](self, "labelLineBreakMode");
    v14 = -[CarManeuverView _shouldShowLaneGuidance](self, "_shouldShowLaneGuidance");
    v15 = CFSTR("YES");
    if (!v14)
      v15 = CFSTR("NO");
    v16 = v15;
    *(_DWORD *)buf = 138414082;
    v46 = v6;
    v47 = 2048;
    v48 = self;
    v49 = 2112;
    v50 = v8;
    v51 = 2048;
    v52 = v9;
    v53 = 2048;
    v54 = v11;
    v55 = 2048;
    v56 = v12;
    v57 = 2048;
    v58 = v13;
    v59 = 2112;
    v60 = v16;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, layoutSubviews before updating styles, frame: %@, compressionStage: %lu, variant: %lu, instructionMaxLines: %ld, lineBreakMode: %ld, shouldShowLaneGuidance: %@", buf, 0x52u);

  }
  -[CarManeuverView _updateStyling](self, "_updateStyling");
  -[CarManeuverView _updateSubviews](self, "_updateSubviews");
  -[CarManeuverView _updateConstraints](self, "_updateConstraints");
  -[NavSignLabel updateLabelIfNeeded](self->_distanceLabel, "updateLabelIfNeeded");
  -[NavSignLabel updateLabelIfNeeded](self->_instructionsLabel, "updateLabelIfNeeded");
  v17 = objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  if (-[NSObject variant](v17, "variant"))
    goto LABEL_6;
  v32 = objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_shieldView, "image"));
  if (!v32)
    goto LABEL_6;
  v33 = (void *)v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_shieldView, "image"));
  objc_msgSend(v34, "size");
  v36 = v35;

  if (v36 > 0.0)
  {
    -[UIImageView frame](self->_shieldView, "frame");
    v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_shieldView, "image"));
    objc_msgSend(v39, "size");
    -[UIImageView setHidden:](self->_shieldView, "setHidden:", v38 / v40 < 0.779999971);

    if (-[UIImageView isHidden](self->_shieldView, "isHidden"))
    {
      v41 = sub_10043341C();
      v17 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v42 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        *(_DWORD *)buf = 138412546;
        v46 = v43;
        v47 = 2048;
        v48 = self;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, Hide exit shield because it scaled below the min threshold to fit with content.", buf, 0x16u);

      }
LABEL_6:

    }
  }
  v18 = sub_10043341C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[CarManeuverView frame](self, "frame");
    v22 = NSStringFromCGRect(v62);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = -[CarManeuverView compressionStage](self, "compressionStage");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    v26 = objc_msgSend(v25, "variant");
    v27 = -[NavSignLabel maxNumberOfTotalLines](self->_instructionsLabel, "maxNumberOfTotalLines");
    v28 = -[CarManeuverView labelLineBreakMode](self, "labelLineBreakMode");
    v29 = -[CarManeuverView _shouldShowLaneGuidance](self, "_shouldShowLaneGuidance");
    v30 = CFSTR("YES");
    if (!v29)
      v30 = CFSTR("NO");
    v31 = v30;
    *(_DWORD *)buf = 138414082;
    v46 = v21;
    v47 = 2048;
    v48 = self;
    v49 = 2112;
    v50 = v23;
    v51 = 2048;
    v52 = v24;
    v53 = 2048;
    v54 = v26;
    v55 = 2048;
    v56 = v27;
    v57 = 2048;
    v58 = v28;
    v59 = 2112;
    v60 = v31;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, layoutSubviews after updating styles, frame: %@, compressionStage: %lu, variant: %lu, instructionMaxLines: %ld, lineBreakMode: %ld, shouldShowLaneGuidance: %@", buf, 0x52u);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarManeuverView;
  -[CarManeuverView didMoveToWindow](&v5, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView window](self, "window"));
  -[CarManeuverViewStyle setAlignmentStyle:](self->_configuredStyle, "setAlignmentStyle:", objc_msgSend(v3, "_car_hybridInstrumentClusterAlignmentStyle"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView window](self, "window"));
  -[CarManeuverViewStyle setAlignmentStyle:](self->_lowGuidanceStyle, "setAlignmentStyle:", objc_msgSend(v4, "_car_hybridInstrumentClusterAlignmentStyle"));

  -[CarManeuverView resetCompressionSizes](self, "resetCompressionSizes");
  -[CarManeuverView _setupConstraints](self, "_setupConstraints");
  -[CarManeuverView _updateConstraints](self, "_updateConstraints");
  -[CarManeuverView _setupStyling](self, "_setupStyling");
}

- (void)setSecondarySignVisible:(BOOL)a3
{
  if (self->_secondarySignVisible != a3)
  {
    self->_secondarySignVisible = a3;
    -[CarManeuverView setNeedsLayout](self, "setNeedsLayout");
    -[CarManeuverView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setCompressionStage:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  unint64_t compressionStage;
  void *v10;
  _BOOL4 v11;
  void *v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  void *v21;
  __int16 v22;
  CarManeuverView *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;

  if (self->_compressionStage != a3)
  {
    if (-[CarManeuverView stopUpdatingCompressionStage](self, "stopUpdatingCompressionStage"))
    {
      v5 = sub_10043341C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        compressionStage = self->_compressionStage;
        v20 = 138413058;
        v21 = v8;
        v22 = 2048;
        v23 = self;
        v24 = 2048;
        v25 = compressionStage;
        v26 = 2048;
        v27 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, Tried to change compressionStage from: %lu to %lu, but stopUpdatingCompressionStage was set, so ignoring the call.", (uint8_t *)&v20, 0x2Au);

      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
      v11 = objc_msgSend(v10, "variant") != (id)2 && (a3 == 6 || self->_compressionStage == 6);

      self->_compressionStage = a3;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
      objc_msgSend(v13, "setCompressionStage:", a3);

      if (v11)
      {
        -[CarManeuverView _setupConstraints](self, "_setupConstraints");
        -[CarManeuverView _updateConstraints](self, "_updateConstraints");
      }
      v14 = sub_10043341C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = CFSTR("NO");
        if (v11)
          v18 = CFSTR("YES");
        v19 = v18;
        v20 = 138413058;
        v21 = v17;
        v22 = 2048;
        v23 = self;
        v24 = 2048;
        v25 = a3;
        v26 = 2112;
        v27 = (unint64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, setCompressionStage %lu. redoingConstraints: %@", (uint8_t *)&v20, 0x2Au);

      }
      -[CarManeuverView setNeedsLayout](self, "setNeedsLayout");
      -[CarManeuverView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)setBlurMode:(int)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v6 = objc_msgSend(v5, "blurMode");

  if (v6 != (_DWORD)v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    objc_msgSend(v7, "setBlurMode:", v3);

    -[CarManeuverView _updateStyling](self, "_updateStyling");
  }
}

- (CarManeuverViewStyle)style
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
  v4 = objc_msgSend(v3, "variant");

  if (v4 == (id)2 || -[CarManeuverView compressionStage](self, "compressionStage") < 6)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView lowGuidanceStyle](self, "lowGuidanceStyle"));
  return (CarManeuverViewStyle *)v5;
}

- (unint64_t)variant
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
  v3 = objc_msgSend(v2, "variant");

  return (unint64_t)v3;
}

- (unint64_t)compressionStageForSize:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  CarManeuverView *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  unint64_t v28;
  CGSize v29;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  if (objc_msgSend(v6, "isSecondary"))
    v7 = 2;
  else
    v7 = 6;

  v8 = 0;
  while (1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeByCompressionStage](self, "sizeByCompressionStage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
    objc_msgSend(v11, "CGSizeValue");
    v13 = v12;

    if (v13 < height)
      break;
    if (v7 == ++v8)
    {
      v8 = v7;
      break;
    }
  }
  v14 = sub_10043341C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v29.width = width;
    v29.height = height;
    v18 = NSStringFromCGSize(v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v21 = 138413058;
    v22 = v17;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v19;
    v27 = 2048;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, compressionStageForSize: %@, desiredStage: %lu", (uint8_t *)&v21, 0x2Au);

  }
  return v8;
}

- (void)resetCompressionSizes
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSDictionary *sizeByCompressionStage;
  int v10;
  void *v11;
  __int16 v12;
  CarManeuverView *v13;
  __int16 v14;
  void *v15;
  CGRect v16;

  v3 = sub_10043341C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[CarManeuverView frame](self, "frame");
    v7 = NSStringFromCGRect(v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = 138412802;
    v11 = v6;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, resetting compression sizes. (current frame: %@)", (uint8_t *)&v10, 0x20u);

  }
  sizeByCompressionStage = self->_sizeByCompressionStage;
  self->_sizeByCompressionStage = 0;

}

- (CGSize)sizeForCompressionStage:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeByCompressionStage](self, "sizeByCompressionStage"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeByCompressionStage](self, "sizeByCompressionStage"));
    a3 = (unint64_t)objc_msgSend(v7, "count") - 1;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeByCompressionStage](self, "sizeByCompressionStage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  objc_msgSend(v10, "CGSizeValue");
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (NSDictionary)sizeByCompressionStage
{
  NSDictionary **p_sizeByCompressionStage;
  NSDictionary *sizeByCompressionStage;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSMutableDictionary *v9;
  id v10;
  void *v11;
  double v12;
  id v13;
  CarManeuverView *v14;
  uint64_t v15;
  void *v16;
  CarManeuverView *v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  CarManeuverView *v22;
  void *v23;
  CarManeuverView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  const __CFString *v54;
  void *v55;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id *v61;
  CarManeuverView *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  CarManeuverView *v66;
  __int16 v67;
  void *v68;
  _QWORD v69[3];

  p_sizeByCompressionStage = &self->_sizeByCompressionStage;
  sizeByCompressionStage = self->_sizeByCompressionStage;
  if (!sizeByCompressionStage)
  {
    v61 = (id *)p_sizeByCompressionStage;
    v5 = sub_10043341C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138412546;
      v64 = v8;
      v65 = 2048;
      v66 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, sizing calculations began ----------------------------------", buf, 0x16u);

    }
    v9 = objc_opt_new(NSMutableDictionary);
    v10 = objc_alloc((Class)UIView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
    objc_msgSend(v11, "availableWidth");
    v13 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, v12, 1.79769313e308);

    v14 = [CarManeuverView alloc];
    v15 = objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
    v59 = objc_msgSend(v16, "variant");
    v17 = self;
    v18 = -[CarManeuverView destination](self, "destination");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
    v20 = objc_msgSend(v19, "layoutType");
    v62 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
    v22 = v14;
    v23 = (void *)v15;
    v24 = -[CarManeuverView initWithGuidance:variant:destination:layoutType:sizeDataSource:](v22, "initWithGuidance:variant:destination:layoutType:sizeDataSource:", v15, v59, v18, v20, v21);

    -[CarManeuverView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarManeuverView setLabelLineBreakMode:](v24, "setLabelLineBreakMode:", 0);
    -[CarManeuverView showLaneGuidanceFromManeuver:](v24, "showLaneGuidanceFromManeuver:", v17);
    objc_msgSend(v13, "addSubview:", v24);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](v24, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v58));
    v69[0] = v57;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView leadingAnchor](v24, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v69[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](v24, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v69[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](v62, "style"));
    LODWORD(v28) = objc_msgSend(v32, "isSecondary");

    v33 = 0;
    if ((_DWORD)v28)
      v34 = 2;
    else
      v34 = 6;
    do
    {
      v35 = objc_autoreleasePoolPush();
      -[CarManeuverView setCompressionStage:](v24, "setCompressionStage:", v33);
      objc_msgSend(v13, "setNeedsLayout");
      objc_msgSend(v13, "layoutIfNeeded");
      -[CarManeuverView frame](v24, "frame");
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", v36, v37));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v33));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v38, v39);

      objc_autoreleasePoolPop(v35);
      ++v33;
    }
    while (v34 != v33);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](v62, "style"));
    v41 = objc_msgSend(v40, "isSecondary");

    if ((v41 & 1) == 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](v62, "sizeDataSource"));
      objc_msgSend(v42, "availableWidth");
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v34));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v43, v44);

      v34 |= 1uLL;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", CGSizeZero.width, CGSizeZero.height));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v34));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v45, v46);

    objc_storeStrong(v61, v9);
    v47 = sub_10043341C();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = sub_100ABF414(-[CarManeuverView variant](v62, "variant"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](v9, "description"));
      *(_DWORD *)buf = 138412802;
      v64 = v50;
      v65 = 2048;
      v66 = v62;
      v67 = 2112;
      v68 = v51;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, building sizeByCompressionStage: %@", buf, 0x20u);

    }
    v52 = sub_10043341C();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = sub_100ABF414(-[CarManeuverView variant](v62, "variant"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      *(_DWORD *)buf = 138412546;
      v64 = v55;
      v65 = 2048;
      v66 = v62;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, sizing calculations ended ----------------------------------", buf, 0x16u);

    }
    sizeByCompressionStage = (NSDictionary *)*v61;
  }
  return sizeByCompressionStage;
}

- (void)_setupSubviews
{
  NavSignLaneGuidanceView *v3;
  uint64_t v4;
  NavSignLaneGuidanceView *v5;
  NavSignLaneGuidanceView *laneGuidanceView;
  double v7;
  double v8;
  GuidanceManeuverView *v9;
  double y;
  double width;
  double height;
  GuidanceManeuverView *v13;
  GuidanceManeuverView *maneuverView;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  NavSignLabel *v21;
  NavSignLabel *distanceLabel;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  NavSignLabel *v28;
  void *v29;
  double v30;
  NavSignLabel *v31;
  NavSignLabel *instructionsLabel;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  NavSignLabel *v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  UIImageView *v43;
  UIImageView *shieldView;
  double v45;
  double v46;
  double v47;

  v3 = [NavSignLaneGuidanceView alloc];
  if ((id)-[CarManeuverView destination](self, "destination") == (id)1)
    v4 = 2;
  else
    v4 = 1;
  v5 = -[NavSignLaneGuidanceView initWithLaneStyle:](v3, "initWithLaneStyle:", v4);
  laneGuidanceView = self->_laneGuidanceView;
  self->_laneGuidanceView = v5;

  -[NavSignLaneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:](self->_laneGuidanceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148846080;
  -[NavSignLaneGuidanceView setContentHuggingPriority:forAxis:](self->_laneGuidanceView, "setContentHuggingPriority:forAxis:", 1, v7);
  LODWORD(v8) = 1148846080;
  -[NavSignLaneGuidanceView setContentCompressionResistancePriority:forAxis:](self->_laneGuidanceView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  -[NavSignLaneGuidanceView setHidden:](self->_laneGuidanceView, "setHidden:", 1);
  -[CarManeuverView addSubview:](self, "addSubview:", self->_laneGuidanceView);
  v9 = [GuidanceManeuverView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = -[GuidanceManeuverView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  maneuverView = self->_maneuverView;
  self->_maneuverView = v13;

  -[GuidanceManeuverView setShieldIdiom:](self->_maneuverView, "setShieldIdiom:", 1);
  -[GuidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:](self->_maneuverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v15) = 1144733696;
  -[GuidanceManeuverView setContentCompressionResistancePriority:forAxis:](self->_maneuverView, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  LODWORD(v16) = 1148846080;
  -[GuidanceManeuverView setContentCompressionResistancePriority:forAxis:](self->_maneuverView, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  LODWORD(v17) = 1148846080;
  -[GuidanceManeuverView setContentHuggingPriority:forAxis:](self->_maneuverView, "setContentHuggingPriority:forAxis:", 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v19 = objc_msgSend(v18, "variant");

  if (v19 != (id)2)
  {
    LODWORD(v20) = 1148846080;
    -[GuidanceManeuverView setContentHuggingPriority:forAxis:](self->_maneuverView, "setContentHuggingPriority:forAxis:", 1, v20);
  }
  -[CarManeuverView addSubview:](self, "addSubview:", self->_maneuverView);
  v21 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v21;

  -[NavSignLabel setAccessibilityIdentifier:](self->_distanceLabel, "setAccessibilityIdentifier:", CFSTR("DistanceLabel"));
  -[NavSignLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_distanceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v23) = 1148813312;
  -[NavSignLabel setContentCompressionResistancePriority:forAxis:](self->_distanceLabel, "setContentCompressionResistancePriority:forAxis:", 0, v23);
  LODWORD(v24) = 1148846080;
  -[NavSignLabel setContentCompressionResistancePriority:forAxis:](self->_distanceLabel, "setContentCompressionResistancePriority:forAxis:", 1, v24);
  LODWORD(v25) = 1144750080;
  -[NavSignLabel setContentHuggingPriority:forAxis:](self->_distanceLabel, "setContentHuggingPriority:forAxis:", 0, v25);
  -[NavSignLabel setMaxNumberOfLinesWithPreferredFont:](self->_distanceLabel, "setMaxNumberOfLinesWithPreferredFont:", 1);
  -[NavSignLabel setMaxNumberOfLinesWithLongestAlternative:](self->_distanceLabel, "setMaxNumberOfLinesWithLongestAlternative:", 1);
  -[NavSignLabel setMaxNumberOfTotalLines:](self->_distanceLabel, "setMaxNumberOfTotalLines:", 1);
  -[NavSignLabel setPerferredFontAdjustsFontSizeToFitWidth:](self->_distanceLabel, "setPerferredFontAdjustsFontSizeToFitWidth:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](self->_distanceLabel, "font"));
  objc_msgSend(v26, "pointSize");
  v28 = self->_distanceLabel;
  if (10.0 / v27 > 1.0)
  {
    -[NavSignLabel setPreferredFontMinimumScaleFactor:](v28, "setPreferredFontMinimumScaleFactor:", 1.0);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](v28, "font"));
    objc_msgSend(v29, "pointSize");
    -[NavSignLabel setPreferredFontMinimumScaleFactor:](self->_distanceLabel, "setPreferredFontMinimumScaleFactor:", 10.0 / v30);

  }
  -[NavSignLabel setInlineShieldSize:](self->_distanceLabel, "setInlineShieldSize:", 4);
  -[NavSignLabel setDelegate:](self->_distanceLabel, "setDelegate:", self);
  -[CarManeuverView addSubview:](self, "addSubview:", self->_distanceLabel);
  v31 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  instructionsLabel = self->_instructionsLabel;
  self->_instructionsLabel = v31;

  -[NavSignLabel setAccessibilityIdentifier:](self->_instructionsLabel, "setAccessibilityIdentifier:", CFSTR("InstructionsLabel"));
  -[NavSignLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v33) = 1148846080;
  -[NavSignLabel setContentHuggingPriority:forAxis:](self->_instructionsLabel, "setContentHuggingPriority:forAxis:", 1, v33);
  LODWORD(v34) = 1132068864;
  -[NavSignLabel setContentCompressionResistancePriority:forAxis:](self->_instructionsLabel, "setContentCompressionResistancePriority:forAxis:", 0, v34);
  LODWORD(v35) = 1148846080;
  -[NavSignLabel setContentCompressionResistancePriority:forAxis:](self->_instructionsLabel, "setContentCompressionResistancePriority:forAxis:", 1, v35);
  if (self->_destination == 2)
  {
    -[NavSignLabel setMaxNumberOfLinesWithLongestAlternative:](self->_instructionsLabel, "setMaxNumberOfLinesWithLongestAlternative:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](self->_instructionsLabel, "font"));
    objc_msgSend(v36, "pointSize");
    v38 = self->_instructionsLabel;
    if (10.0 / v37 > 1.0)
    {
      -[NavSignLabel setPreferredFontMinimumScaleFactor:](v38, "setPreferredFontMinimumScaleFactor:", 1.0);
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](v38, "font"));
      objc_msgSend(v39, "pointSize");
      -[NavSignLabel setPreferredFontMinimumScaleFactor:](self->_instructionsLabel, "setPreferredFontMinimumScaleFactor:", 10.0 / v40);

    }
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  if (objc_msgSend(v41, "isSecondary"))
    v42 = 3;
  else
    v42 = 4;
  -[NavSignLabel setInlineShieldSize:](self->_instructionsLabel, "setInlineShieldSize:", v42);

  -[NavSignLabel setDelegate:](self->_instructionsLabel, "setDelegate:", self);
  -[CarManeuverView addSubview:](self, "addSubview:", self->_instructionsLabel);
  v43 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  shieldView = self->_shieldView;
  self->_shieldView = v43;

  -[UIImageView setAccessibilityIdentifier:](self->_shieldView, "setAccessibilityIdentifier:", CFSTR("ShieldView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_shieldView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_shieldView, "setContentMode:", 1);
  LODWORD(v45) = 1132068864;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_shieldView, "setContentCompressionResistancePriority:forAxis:", 1, v45);
  LODWORD(v46) = 1132068864;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_shieldView, "setContentCompressionResistancePriority:forAxis:", 0, v46);
  LODWORD(v47) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_shieldView, "setContentHuggingPriority:forAxis:", 0, v47);
  -[CarManeuverView addSubview:](self, "addSubview:", self->_shieldView);
}

- (void)_setupStyling
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[496];
  _BYTE __dst[496];
  _OWORD v19[31];
  _OWORD v20[31];
  _OWORD v21[31];
  _OWORD __src[31];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  self->_labelLineBreakMode = (int64_t)objc_msgSend(v3, "labelLineBreakMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
  objc_msgSend(v4, "dynamicPointScaleValue");
  v6 = v5;

  memset(__src, 0, sizeof(__src));
  if (v3)
  {
    objc_msgSend(v3, "arrowMetrics");
    MKGuidanceManeuverArrowMetricsApplyScale(v21, v6);
    memset(v20, 0, sizeof(v20));
    objc_msgSend(v3, "junctionArrowMetrics");
  }
  else
  {
    memset(v21, 0, sizeof(v21));
    MKGuidanceManeuverArrowMetricsApplyScale(v21, v6);
    memset(v20, 0, sizeof(v20));
    memset(v19, 0, sizeof(v19));
  }
  MKGuidanceManeuverArrowMetricsApplyScale(v19, v6);
  memcpy(__dst, __src, sizeof(__dst));
  -[GuidanceManeuverView setArrowMetrics:](self->_maneuverView, "setArrowMetrics:", __dst);
  memcpy(v17, v20, sizeof(v17));
  -[GuidanceManeuverView setJunctionArrowMetrics:](self->_maneuverView, "setJunctionArrowMetrics:", v17);
  -[GuidanceManeuverView setFraming:](self->_maneuverView, "setFraming:", objc_msgSend(v3, "desiredFraming"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrowMainColor"));
  -[GuidanceManeuverView setArrowColor:](self->_maneuverView, "setArrowColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrowAccentColor"));
  -[GuidanceManeuverView setAccentColor:](self->_maneuverView, "setAccentColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
  objc_msgSend(v9, "dynamicPointScaleValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionsPreferredFont"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_scaledFontForScaleFactor:", v11));
  -[NavSignLabel setPreferredFont:](self->_instructionsLabel, "setPreferredFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionsAlternateFont"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_scaledFontForScaleFactor:", v11));
  -[NavSignLabel setAlternateFont:](self->_instructionsLabel, "setAlternateFont:", v15);

  objc_msgSend(v3, "instructionsAlternateFontLineSpacing");
  -[NavSignLabel setAlternateFontLineSpacing:](self->_instructionsLabel, "setAlternateFontLineSpacing:");
  -[NavSignLabel setMaxNumberOfLinesWithPreferredFont:](self->_instructionsLabel, "setMaxNumberOfLinesWithPreferredFont:", objc_msgSend(v3, "instructionsMaxNumberOfLinesWithPreferredFont"));
  -[NavSignLabel setMaxNumberOfTotalLines:](self->_instructionsLabel, "setMaxNumberOfTotalLines:", objc_msgSend(v3, "instructionsMaxNumberOfTotalLines"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionsColor"));
  -[NavSignLabel setTextColor:](self->_instructionsLabel, "setTextColor:", v16);

  -[NavSignLabel setParagraphLineBreakMode:](self->_instructionsLabel, "setParagraphLineBreakMode:", -[CarManeuverView labelLineBreakMode](self, "labelLineBreakMode"));
  -[NavSignLabel updateLabelIfNeeded](self->_instructionsLabel, "updateLabelIfNeeded");
  -[CarManeuverView _updateStyling](self, "_updateStyling");

}

- (void)_setupConstraints
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _BOOL4 v118;
  void *v119;
  NSMutableArray *v120;
  void *v121;
  void *v122;
  double v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  BOOL v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  NSMutableArray *v208;
  NSMutableArray *v209;
  void *v210;
  _QWORD v211[4];
  _QWORD v212[2];
  _QWORD v213[2];
  _QWORD v214[2];
  _QWORD v215[2];
  _QWORD v216[10];
  _QWORD v217[3];
  _QWORD v218[4];
  _QWORD v219[4];
  _QWORD v220[3];
  _QWORD v221[3];
  _QWORD v222[7];
  _QWORD v223[7];
  _QWORD v224[4];
  uint8_t buf[32];
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  double v234;
  void *v235;

  v3 = sub_10043341C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, _setupConstraints", buf, 0x16u);

  }
  v7 = MKPlaceCollectionsLogicController_ptr;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView myConstraints](self, "myConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &stru_1011DC408);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
  objc_msgSend(v10, "removeAllObjects");

  v11 = objc_opt_new(NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_shieldView, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
  objc_msgSend(v13, "dynamicPointScaleValue");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintLessThanOrEqualToConstant:", v15 * 16.0));
  v235 = v16;
  v17 = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v235, 1));
  -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView laneGuidance](self, "laneGuidance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "midStepTitles"));
  if (!objc_msgSend(v20, "count"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "majorTextAlternatives"));
    v17 = objc_msgSend(v22, "count") != 0;

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v24 = objc_msgSend(v23, "variant");

  if (v24 == (id)2)
  {
    v202 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
    v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "maps_uniqueKey"));
    v214[0] = v197;
    v193 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
    v186 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    -[NavSignLabel inlineShieldFirstBaselineTopOffset](self->_instructionsLabel, "inlineShieldFirstBaselineTopOffset");
    v80 = 15.0;
    LODWORD(v80) = 1148846080;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "constraintEqualToAnchor:constant:priority:", v186, v81 + 15.0, v80));
    v215[0] = v82;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel lastBaselineAnchor](self->_instructionsLabel, "lastBaselineAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "maps_uniqueKey"));
    v214[1] = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel lastBaselineAnchor](self->_instructionsLabel, "lastBaselineAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView bottomAnchor](self, "bottomAnchor"));
    -[NavSignLabel inlineShieldLastBaselineBottomOffset](self->_instructionsLabel, "inlineShieldLastBaselineBottomOffset");
    v87 = -9.0;
    LODWORD(v87) = 1148846080;
    v209 = v11;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:priority:", v86, v88 + -9.0, v87));
    v215[1] = v89;
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v215, v214, 2));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    objc_msgSend(v91, "setObject:forKeyedSubscript:", v90, CFSTR("SecondaryLabelsBaselines"));

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("SecondaryLabelsBaselines")));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "allValues"));
    -[NSMutableArray addObjectsFromArray:](v209, "addObjectsFromArray:", v94);

    v203 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerXAnchor](self->_maneuverView, "centerXAnchor"));
    v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "maps_uniqueKey"));
    v212[0] = v198;
    v194 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView leadingAnchor](self->_maneuverView, "leadingAnchor"));
    v187 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView leadingAnchor](self, "leadingAnchor"));
    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "constraintEqualToAnchor:constant:", v187, 9.0));
    v213[0] = v180;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_instructionsLabel, "leadingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "maps_uniqueKey"));
    v212[1] = v96;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_instructionsLabel, "leadingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](self->_maneuverView, "trailingAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:constant:", v98, 9.0));
    v213[1] = v99;
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v213, v212, 2));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, CFSTR("SecondaryAligningConstraintsSmallScreen"));

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("SecondaryAligningConstraintsSmallScreen")));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "allValues"));
    -[NSMutableArray addObjectsFromArray:](v209, "addObjectsFromArray:", v104);

    v204 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](self->_maneuverView, "heightAnchor"));
    v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "constraintEqualToConstant:", 18.0));
    v211[0] = v199;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](self->_maneuverView, "widthAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintGreaterThanOrEqualToConstant:", 13.0));
    v211[1] = v106;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerYAnchor](self->_maneuverView, "centerYAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView centerYAnchor](self, "centerYAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v108));
    v211[2] = v109;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel trailingAnchor](self->_instructionsLabel, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](self, "trailingAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:", v111, -9.0));
    v211[3] = v112;
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v211, 4));
    -[NSMutableArray addObjectsFromArray:](v209, "addObjectsFromArray:", v113);

    v11 = v209;
    v7 = MKPlaceCollectionsLogicController_ptr;

    v114 = v204;
LABEL_16:

    goto LABEL_17;
  }
  if (v24 == (id)1)
  {
    v210 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView widthAnchor](self, "widthAnchor"));
    v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "constraintGreaterThanOrEqualToConstant:", 100.0));
    v216[0] = v207;
    v205 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView topAnchor](self->_maneuverView, "topAnchor"));
    v200 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "constraintEqualToAnchor:constant:", v200, 11.0));
    v216[1] = v195;
    v188 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView leadingAnchor](self->_maneuverView, "leadingAnchor"));
    v181 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView leadingAnchor](self, "leadingAnchor"));
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "constraintEqualToAnchor:constant:", v181, 7.5));
    v216[2] = v176;
    v172 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](self->_maneuverView, "trailingAnchor"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "constraintEqualToAnchor:constant:", v168, -7.0));
    v216[3] = v164;
    v160 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](self->_maneuverView, "heightAnchor"));
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "constraintEqualToConstant:", 23.0));
    v216[4] = v156;
    v152 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](self->_maneuverView, "widthAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](self->_maneuverView, "heightAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToAnchor:", v149));
    v216[5] = v146;
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView bottomAnchor](self->_maneuverView, "bottomAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView bottomAnchor](self, "bottomAnchor"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:constant:", v140, -11.0));
    v216[6] = v138;
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_distanceLabel, "firstBaselineAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:constant:", v134, 29.0));
    v216[7] = v115;
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel lastBaselineAnchor](self->_distanceLabel, "lastBaselineAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView bottomAnchor](self, "bottomAnchor"));
    v118 = v17;
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:constant:", v117, -16.0));
    v216[8] = v119;
    v120 = v11;
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel trailingAnchor](self->_distanceLabel, "trailingAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](self, "trailingAnchor"));
    v123 = -4.0;
    if (v118)
      v123 = -11.0;
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v122, v123));
    v216[9] = v124;
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v216, 10));
    -[NSMutableArray addObjectsFromArray:](v120, "addObjectsFromArray:", v125);

    v11 = v120;
    v7 = MKPlaceCollectionsLogicController_ptr;

    v114 = v210;
    goto LABEL_16;
  }
  if (!v24)
  {
    v234 = 0.0;
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    v228 = 0u;
    v229 = 0u;
    v226 = 0u;
    v227 = 0u;
    memset(buf, 0, sizeof(buf));
    -[CarManeuverView primaryMetrics](self, "primaryMetrics");
    v201 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView leadingAnchor](self->_laneGuidanceView, "leadingAnchor"));
    v189 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView leadingAnchor](self, "leadingAnchor"));
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "constraintEqualToAnchor:", v189));
    v224[0] = v182;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView trailingAnchor](self->_laneGuidanceView, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](self, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v224[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView topAnchor](self->_laneGuidanceView, "topAnchor"));
    v196 = v17;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    v208 = v11;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v234));
    v224[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceView heightAnchor](self->_laneGuidanceView, "heightAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToConstant:", *((double *)&v233 + 1)));
    v224[3] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v224, 4));
    -[NSMutableArray addObjectsFromArray:](v208, "addObjectsFromArray:", v33);

    v190 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_shieldView, "leadingAnchor"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "maps_uniqueKey"));
    v222[0] = v183;
    v177 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView _shieldViewPrimaryLeadingConstraint](self, "_shieldViewPrimaryLeadingConstraint"));
    v223[0] = v177;
    v173 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_shieldView, "trailingAnchor"));
    v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "maps_uniqueKey"));
    v222[1] = v169;
    v165 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_shieldView, "trailingAnchor"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](self, "trailingAnchor"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "constraintEqualToAnchor:constant:", v161, *(double *)&v231));
    v223[1] = v157;
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView topAnchor](self->_maneuverView, "topAnchor"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "maps_uniqueKey"));
    v222[2] = v150;
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView _maneuverVerticalPrimaryConstraint](self, "_maneuverVerticalPrimaryConstraint"));
    v223[2] = v147;
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView leadingAnchor](self->_maneuverView, "leadingAnchor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "maps_uniqueKey"));
    v222[3] = v141;
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView leadingAnchor](self->_maneuverView, "leadingAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView leadingAnchor](self, "leadingAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:constant:", v137, *(double *)&buf[16]));
    v223[3] = v135;
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](self->_maneuverView, "trailingAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "maps_uniqueKey"));
    v222[4] = v132;
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](self->_maneuverView, "trailingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:constant:", v130, *(double *)&buf[24]));
    v223[4] = v129;
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](self->_maneuverView, "heightAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "maps_uniqueKey"));
    v222[5] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView heightAnchor](self->_maneuverView, "heightAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", *(double *)&v226));
    v223[5] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](self->_maneuverView, "widthAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "maps_uniqueKey"));
    v222[6] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView widthAnchor](self->_maneuverView, "widthAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintGreaterThanOrEqualToConstant:", *((double *)&v226 + 1)));
    v223[6] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v223, v222, 7));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("PrimaryManeuverView"));

    v191 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_shieldView, "leadingAnchor"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "maps_uniqueKey"));
    v220[0] = v184;
    v174 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_shieldView, "leadingAnchor"));
    v178 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel textTrailingLayoutGuide](self->_distanceLabel, "textTrailingLayoutGuide"));
    v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "trailingAnchor"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "constraintGreaterThanOrEqualToAnchor:constant:", v170, *(double *)buf));
    v221[0] = v166;
    v162 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_shieldView, "trailingAnchor"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "maps_uniqueKey"));
    v220[1] = v158;
    v154 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_shieldView, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](self, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "constraintEqualToAnchor:constant:", v43, *(double *)&v231));
    v221[1] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "maps_uniqueKey"));
    v220[2] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView leadingAnchor](self, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, *(double *)&v227));
    v221[2] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v221, v220, 3));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("PrimaryNoManeuverView"));

    v192 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_shieldView, "topAnchor"));
    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "maps_uniqueKey"));
    v218[0] = v185;
    v206 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_shieldView, "topAnchor"));
    v179 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "constraintEqualToAnchor:constant:", v179, *((double *)&v227 + 1)));
    v219[0] = v175;
    v171 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_distanceLabel, "firstBaselineAnchor"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "maps_uniqueKey"));
    v218[1] = v167;
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_distanceLabel, "firstBaselineAnchor"));
    v159 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:constant:", v159, *((double *)&v228 + 1)));
    v219[1] = v155;
    v151 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "maps_uniqueKey"));
    v218[2] = v148;
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    v52 = *(double *)&v230;
    -[NavSignLabel inlineShieldFirstBaselineTopOffset](self->_instructionsLabel, "inlineShieldFirstBaselineTopOffset");
    LODWORD(v54) = 1148846080;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:constant:priority:", v142, v52 + v53, v54));
    v219[2] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel lastBaselineAnchor](self->_instructionsLabel, "lastBaselineAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "maps_uniqueKey"));
    v218[3] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel lastBaselineAnchor](self->_instructionsLabel, "lastBaselineAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView bottomAnchor](self, "bottomAnchor"));
    v60 = *((double *)&v232 + 1);
    -[NavSignLabel inlineShieldLastBaselineBottomOffset](self->_instructionsLabel, "inlineShieldLastBaselineBottomOffset");
    LODWORD(v62) = 1148846080;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:priority:", v59, v60 + v61, v62));
    v219[3] = v63;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v219, v218, 4));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, CFSTR("PrimaryLabelsBaselines"));

    v11 = v208;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "allValues"));
    -[NSMutableArray addObjectsFromArray:](v208, "addObjectsFromArray:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel trailingAnchor](self->_distanceLabel, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](self, "trailingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, *(double *)&v231));
    v217[0] = v71;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView _instructionHorizontalPrimaryConstraint](self, "_instructionHorizontalPrimaryConstraint"));
    v217[1] = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel trailingAnchor](self->_instructionsLabel, "trailingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView trailingAnchor](self, "trailingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, *(double *)&v232));
    v217[2] = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v217, 3));
    -[NSMutableArray addObjectsFromArray:](v208, "addObjectsFromArray:", v76);

    if (!v196 && -[CarManeuverView _usesLargeScreenLayout](self, "_usesLargeScreenLayout"))
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel centerYAnchor](self->_instructionsLabel, "centerYAnchor"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView centerYAnchor](self, "centerYAnchor"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v78));
      -[NSMutableArray addObject:](v208, "addObject:", v79);

    }
    v7 = MKPlaceCollectionsLogicController_ptr;
  }
LABEL_17:
  -[CarManeuverView setMyConstraints:](self, "setMyConstraints:", v11);
  v126 = v7[348];
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView myConstraints](self, "myConstraints"));
  objc_msgSend(v126, "activateConstraints:", v127);

}

- (void)alignSubviewsTo:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[8];
  _QWORD v38[2];
  _QWORD v39[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v6 = objc_msgSend(v5, "isSecondary");

  if ((v6 & 1) != 0)
  {
    if ((objc_msgSend(v4, "shouldShowLaneGuidance") & 1) == 0
      && -[CarManeuverView _usesLargeScreenLayout](self, "_usesLargeScreenLayout")
      && (v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverViewCenteringAnchor"))) != 0
      && (v8 = (void *)v7,
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructionsLabelLeadingAnchor")),
          v9,
          v8,
          v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SecondaryAligningConstraintsLargeScreen")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allValues"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SecondaryAligningConstraintsSmallScreen")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v15);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerXAnchor](self->_maneuverView, "centerXAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "maps_uniqueKey"));
      v38[0] = v35;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerXAnchor](self->_maneuverView, "centerXAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverViewCenteringAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
      v39[0] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_instructionsLabel, "leadingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maps_uniqueKey"));
      v38[1] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_instructionsLabel, "leadingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructionsLabelLeadingAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      v39[1] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("SecondaryAligningConstraintsLargeScreen"));

      v24 = objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v25 = v24;
      v26 = CFSTR("SecondaryAligningConstraintsLargeScreen");
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("SecondaryAligningConstraintsLargeScreen")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allValues"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v30);

      v24 = objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v25 = v24;
      v26 = CFSTR("SecondaryAligningConstraintsSmallScreen");
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v26));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allValues"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

  }
  else
  {
    v27 = sub_10043341C();
    v25 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Failed to align primary and secondary CarManeuverViews, reason: called on primary view.", buf, 2u);
    }
  }

}

- (BOOL)_isDisplayingStartManeuver
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "maneuverArtwork"));
  v4 = objc_msgSend(v3, "maneuver");

  return ((v4 - 17) & 0xFFFFFFF7) == 0;
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NavSignLabel *instructionsLabel;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[16];
  id v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView laneGuidance](self, "laneGuidance"));
  if ((objc_msgSend(v3, "isForMidStep") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    v5 = objc_msgSend(v4, "isSecondary");

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView laneGuidance](self, "laneGuidance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "midStepTitles"));
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView laneGuidance](self, "laneGuidance"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "midStepTitles"));
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "majorTextAlternatives"));
      }
      v34 = (void *)v10;
      -[NavSignLabel setTextAlternatives:](self->_distanceLabel, "setTextAlternatives:", v10);

      v36 = (id)objc_claimAutoreleasedReturnValue(-[CarManeuverView laneGuidance](self, "laneGuidance"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "textAlternatives"));
      -[NavSignLabel setTextAlternatives:](self->_instructionsLabel, "setTextAlternatives:", v35);

      return;
    }
  }
  else
  {

  }
  if (-[CarManeuverView _isDisplayingStartManeuver](self, "_isDisplayingStartManeuver"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    if (objc_msgSend(v11, "variant") == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "majorTextAlternatives"));
      v14 = objc_msgSend(v13, "count");

      if (!v14)
      {
        v15 = sub_10043356C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Shown 'Start' instruction in low guidance sign", buf, 2u);
        }

        v17 = objc_alloc((Class)MKServerFormattedString);
        v18 = objc_alloc((Class)GEOComposedString);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CarPlay_MiniSign_Start"), CFSTR("localized string not found"), 0));
        v21 = objc_msgSend(v18, "initWithString:", v20);
        v22 = objc_msgSend(v17, "initWithComposedString:", v21);
        v38 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
        -[NavSignLabel setTextAlternatives:](self->_distanceLabel, "setTextAlternatives:", v23);

        return;
      }
    }
    else
    {

    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "majorTextAlternatives"));
  -[NavSignLabel setTextAlternatives:](self->_distanceLabel, "setTextAlternatives:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "minorTextAlternatives"));
  -[NavSignLabel setTextAlternatives:](self->_instructionsLabel, "setTextAlternatives:", v27);

  if (self->_destination == 2)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel text](self->_distanceLabel, "text"));
    v29 = objc_msgSend(v28, "length");

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
      -[NavSignLabel setMaxNumberOfTotalLines:](self->_instructionsLabel, "setMaxNumberOfTotalLines:", objc_msgSend(v30, "instructionsMaxNumberOfTotalLines"));

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
      -[NavSignLabel setMaxNumberOfLinesWithPreferredFont:](self->_instructionsLabel, "setMaxNumberOfLinesWithPreferredFont:", objc_msgSend(v31, "instructionsMaxNumberOfLinesWithPreferredFont"));

      instructionsLabel = self->_instructionsLabel;
      v33 = 1;
    }
    else
    {
      -[NavSignLabel setMaxNumberOfTotalLines:](self->_instructionsLabel, "setMaxNumberOfTotalLines:", 2);
      -[NavSignLabel setMaxNumberOfLinesWithPreferredFont:](self->_instructionsLabel, "setMaxNumberOfLinesWithPreferredFont:", 2);
      instructionsLabel = self->_instructionsLabel;
      v33 = 2;
    }
    -[NavSignLabel setMaxNumberOfLinesWithLongestAlternative:](instructionsLabel, "setMaxNumberOfLinesWithLongestAlternative:", v33);
  }
}

- (void)_updateContents
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo lanes](self->_laneGuidance, "lanes"));
  -[NavSignLaneGuidanceView setLanes:](self->_laneGuidanceView, "setLanes:", v3);

  -[CarManeuverView _updateManeuverView](self, "_updateManeuverView");
  -[CarManeuverView _updateLabels](self, "_updateLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v5 = objc_msgSend(v4, "variant");

  if (v5 != (id)1)
    -[CarManeuverView _updateShield](self, "_updateShield");
}

- (void)_updateManeuverView
{
  void *v3;
  id v4;

  if (-[NavSignLaneGuidanceInfo isForMidStep](self->_laneGuidance, "isForMidStep"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarManeuverView _maneuverArtworkForDirection:](self, "_maneuverArtworkForDirection:", -[CarManeuverView _preferredDirectionForLaneGuidance](self, "_preferredDirectionForLaneGuidance")));
    -[GuidanceManeuverView setManeuverArtwork:](self->_maneuverView, "setManeuverArtwork:");
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverArtwork"));
    -[GuidanceManeuverView setManeuverArtwork:](self->_maneuverView, "setManeuverArtwork:", v3);

  }
}

- (void)_updateSubviews
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  NavSignLaneGuidanceView *laneGuidanceView;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v6 = objc_msgSend(v5, "variant");

  if (v6 == (id)2)
  {
    v9 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
    v11 = 1;
    -[NavSignLaneGuidanceView setHidden:](self->_laneGuidanceView, "setHidden:", 1);
    -[NavSignLabel setHidden:](self->_distanceLabel, "setHidden:", 1);
    v13 = 0;
    v10 = 0;
    v12 = &OBJC_IVAR___CarManeuverView__shieldView;
LABEL_19:
    -[GuidanceManeuverView setHidden:](self->_maneuverView, "setHidden:", v13);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "setHidden:", v10);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v12), "setHidden:", v11);
    return;
  }
  if (v6 == (id)1)
  {
    v9 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
    v10 = 1;
    -[NavSignLaneGuidanceView setHidden:](self->_laneGuidanceView, "setHidden:", 1);
    -[NavSignLabel setHidden:](self->_distanceLabel, "setHidden:", 0);
    -[NavSignLabel setTextAlignment:](self->_distanceLabel, "setTextAlignment:", 4);
    v13 = 0;
    v12 = &OBJC_IVAR___CarManeuverView__shieldView;
    v11 = 1;
    goto LABEL_19;
  }
  if (!v6)
  {
    v7 = -[CarManeuverView shouldShowLaneGuidance](self, "shouldShowLaneGuidance");
    laneGuidanceView = self->_laneGuidanceView;
    if (v7)
    {
      -[NavSignLaneGuidanceView setHidden:](laneGuidanceView, "setHidden:", 0);
      v9 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
      -[NavSignLabel setHidden:](self->_distanceLabel, "setHidden:", 0);
      -[NavSignLabel setTextAlignment:](self->_distanceLabel, "setTextAlignment:", 4);
      v10 = 0;
      v11 = 0;
      v12 = &OBJC_IVAR___CarManeuverView__shieldView;
      v13 = 1;
    }
    else
    {
      -[NavSignLaneGuidanceView setHidden:](laneGuidanceView, "setHidden:", 1);
      -[NavSignLabel setHidden:](self->_distanceLabel, "setHidden:", 0);
      if (-[CarManeuverView _usesLargeScreenLayout](self, "_usesLargeScreenLayout") && v4 == (id)1)
      {
        v14 = 2;
      }
      else
      {
        v15 = -[CarManeuverView _usesLargeScreenLayout](self, "_usesLargeScreenLayout");
        if (v4 == (id)1)
          v16 = 1;
        else
          v16 = v15;
        if (v16)
          v14 = 0;
        else
          v14 = 2;
      }
      -[NavSignLabel setTextAlignment:](self->_distanceLabel, "setTextAlignment:", v14);
      v13 = 0;
      v10 = 0;
      v11 = 0;
      v12 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
      v9 = &OBJC_IVAR___CarManeuverView__shieldView;
    }
    goto LABEL_19;
  }
}

- (void)_updateStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NavSignLabel *distanceLabel;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  int64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  CarManeuverView *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  int64_t v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  objc_msgSend(v3, "setHasLaneGuidance:", -[CarManeuverView shouldShowLaneGuidance](self, "shouldShowLaneGuidance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView _shieldImage](self, "_shieldImage"));
  objc_msgSend(v3, "setHasShield:", v4 != 0);

  objc_msgSend(v3, "setSecondarySignVisible:", -[CarManeuverView secondarySignVisible](self, "secondarySignVisible"));
  objc_msgSend(v3, "setCompressionStage:", -[CarManeuverView compressionStage](self, "compressionStage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invalidArrowColor"));

  -[GuidanceManeuverView setAccentColor:](self->_maneuverView, "setAccentColor:", v6);
  -[NavSignLaneGuidanceView setInvalidArrowColor:](self->_laneGuidanceView, "setInvalidArrowColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
  objc_msgSend(v7, "dynamicPointScaleValue");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "distanceFont"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_scaledFontForScaleFactor:", v9));
  -[NavSignLabel setPreferredFont:](self->_distanceLabel, "setPreferredFont:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](self->_distanceLabel, "font"));
  objc_msgSend(v12, "pointSize");
  distanceLabel = self->_distanceLabel;
  if (10.0 / v13 > 1.0)
  {
    -[NavSignLabel setPreferredFontMinimumScaleFactor:](distanceLabel, "setPreferredFontMinimumScaleFactor:", 1.0);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel font](distanceLabel, "font"));
    objc_msgSend(v15, "pointSize");
    -[NavSignLabel setPreferredFontMinimumScaleFactor:](self->_distanceLabel, "setPreferredFontMinimumScaleFactor:", 10.0 / v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "distanceColor"));
  -[NavSignLabel setTextColor:](self->_distanceLabel, "setTextColor:", v17);

  -[NavSignLabel updateLabelIfNeeded](self->_distanceLabel, "updateLabelIfNeeded");
  -[NavSignLabel setMaxNumberOfTotalLines:](self->_instructionsLabel, "setMaxNumberOfTotalLines:", objc_msgSend(v3, "instructionsMaxNumberOfTotalLines"));
  -[NavSignLabel setParagraphLineBreakMode:](self->_instructionsLabel, "setParagraphLineBreakMode:", -[CarManeuverView labelLineBreakMode](self, "labelLineBreakMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionsPreferredFont"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_maps_scaledFontForScaleFactor:", v9));
  -[NavSignLabel setPreferredFont:](self->_instructionsLabel, "setPreferredFont:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionsAlternateFont"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_maps_scaledFontForScaleFactor:", v9));
  -[NavSignLabel setAlternateFont:](self->_instructionsLabel, "setAlternateFont:", v21);

  -[NavSignLabel setShouldRemoveTextStartingAtFirstNewline:](self->_instructionsLabel, "setShouldRemoveTextStartingAtFirstNewline:", objc_msgSend(v3, "isSecondary"));
  -[NavSignLabel setPerferredFontAdjustsFontSizeToFitWidth:](self->_instructionsLabel, "setPerferredFontAdjustsFontSizeToFitWidth:", objc_msgSend(v3, "shouldScaleInstructionsPreferredFont"));
  -[NavSignLabel updateLabelIfNeeded](self->_instructionsLabel, "updateLabelIfNeeded");
  v22 = sub_10043341C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = -[CarManeuverView compressionStage](self, "compressionStage");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    v28 = objc_msgSend(v27, "variant");
    v29 = -[NavSignLabel maxNumberOfTotalLines](self->_instructionsLabel, "maxNumberOfTotalLines");
    v30 = 138413570;
    v31 = v25;
    v32 = 2048;
    v33 = self;
    v34 = 2048;
    v35 = v26;
    v36 = 2048;
    v37 = v28;
    v38 = 2048;
    v39 = v29;
    v40 = 2048;
    v41 = -[CarManeuverView labelLineBreakMode](self, "labelLineBreakMode");
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, _updateStyling. compressionStage: %lu, variant: %lu, instructionMaxLines: %ld, lineBreakMode: %ld", (uint8_t *)&v30, 0x3Eu);

  }
}

- ($3A6EDEE00D58024242533228B225C6E2)primaryMetrics
{
  void *v5;
  id v6;
  $3A6EDEE00D58024242533228B225C6E2 *result;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  double v15;
  int64x2_t v16;
  int64x2_t v17;
  float64x2_t v18;
  double v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v6 = objc_msgSend(v5, "layoutType");

  if (v6 == (id)2)
  {
    v8 = &xmmword_100E3C968;
LABEL_6:
    v9 = v8[9];
    *(_OWORD *)&retstr->var16 = v8[8];
    *(_OWORD *)&retstr->var18 = v9;
    retstr->var20 = *((double *)v8 + 20);
    v10 = v8[5];
    *(_OWORD *)&retstr->var8 = v8[4];
    *(_OWORD *)&retstr->var10 = v10;
    v11 = v8[7];
    *(_OWORD *)&retstr->var12 = v8[6];
    *(_OWORD *)&retstr->var14 = v11;
    v12 = v8[1];
    *(_OWORD *)&retstr->var0 = *v8;
    *(_OWORD *)&retstr->var2 = v12;
    v13 = v8[3];
    *(_OWORD *)&retstr->var4 = v8[2];
    *(_OWORD *)&retstr->var6 = v13;
    return result;
  }
  if (v6 != (id)1)
  {
    if (v6)
      return result;
    v8 = &xmmword_100E3C8C0;
    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
  objc_msgSend(v14, "dynamicPointScaleValue");
  v19 = v15;

  retstr->var0 = v19 * 12.0;
  v16 = (int64x2_t)vmulq_n_f64((float64x2_t)xmmword_100E3C870, v19);
  *(int64x2_t *)&retstr->var1 = vdupq_lane_s64(v16.i64[0], 0);
  v17 = (int64x2_t)vmulq_n_f64((float64x2_t)xmmword_100E3C860, v19);
  *(int64x2_t *)&retstr->var3 = v17;
  retstr->var5 = v19 * 28.0;
  *(_QWORD *)&retstr->var6 = v16.i64[0];
  *(int64x2_t *)&retstr->var7 = v16;
  v18 = vmulq_n_f64((float64x2_t)xmmword_100E3C880, v19);
  *(float64x2_t *)&retstr->var9 = v18;
  retstr->var11 = v18.f64[0];
  *(float64x2_t *)&retstr->var12 = vmulq_n_f64((float64x2_t)xmmword_100E3C890, v19);
  *(int64x2_t *)&retstr->var14 = vzip1q_s64(v17, v16);
  *(_QWORD *)&retstr->var16 = v17.i64[0];
  *(float64x2_t *)&retstr->var17 = vmulq_n_f64((float64x2_t)xmmword_100E3C8A0, v19);
  retstr->var19 = v19 * 29.0;
  retstr->var20 = v19 * 12.0;
  return result;
}

- (void)_updateConstraints
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  id v13;
  double v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  unint64_t v44;
  NavSignLabel *instructionsLabel;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
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
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _BYTE v94[22];
  __int16 v95;
  id v96;
  __int16 v97;
  __CFString *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;

  v3 = sub_10043341C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    v8 = objc_msgSend(v7, "variant");
    v9 = -[CarManeuverView shouldShowLaneGuidance](self, "shouldShowLaneGuidance");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v11 = v10;
    *(_DWORD *)v94 = 138413058;
    *(_QWORD *)&v94[4] = v6;
    *(_WORD *)&v94[12] = 2048;
    *(_QWORD *)&v94[14] = self;
    v95 = 2048;
    v96 = v8;
    v97 = 2112;
    v98 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, _updateConstraints. variant: %lu, shouldShowLaneGuidance: %@", v94, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v13 = objc_msgSend(v12, "variant");

  if (v13 == (id)2)
  {
    LODWORD(v14) = 1148829696;
    -[CarManeuverView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    v44 = -[NavSignLabel lineCount](self->_instructionsLabel, "lineCount");
    instructionsLabel = self->_instructionsLabel;
    if (v44 == 1)
    {
      v46 = 19.0;
      v47 = -11.0;
    }
    else
    {
      -[NavSignLabel inlineShieldFirstBaselineTopOffset](instructionsLabel, "inlineShieldFirstBaselineTopOffset");
      v46 = v48 + 15.0;
      instructionsLabel = self->_instructionsLabel;
      v47 = -9.0;
    }
    -[NavSignLabel inlineShieldLastBaselineBottomOffset](instructionsLabel, "inlineShieldLastBaselineBottomOffset");
    v50 = v47 + v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SecondaryLabelsBaselines")));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "maps_uniqueKey"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v54));
    objc_msgSend(v55, "setConstant:", v46);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("SecondaryLabelsBaselines")));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel lastBaselineAnchor](self->_instructionsLabel, "lastBaselineAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "maps_uniqueKey"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", v59));
    objc_msgSend(v60, "setConstant:", v50);

  }
  else if (v13 == (id)1)
  {
    LODWORD(v14) = 1148846080;
    -[CarManeuverView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  }
  else if (!v13)
  {
    LODWORD(v14) = 1148829696;
    -[CarManeuverView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    v106 = 0;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v99 = 0u;
    -[CarManeuverView primaryMetrics](self, "primaryMetrics", 0, 0, 0, 0, 0, 0, 0);
    v15 = -[CarManeuverView shouldShowLaneGuidance](self, "shouldShowLaneGuidance");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    v17 = v16;
    if (v15)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PrimaryManeuverView")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allValues"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PrimaryNoManeuverView")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allValues"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

      v23 = *(double *)&v100;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_shieldView, "topAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "maps_uniqueKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v27));
      objc_msgSend(v28, "setConstant:", v23);

      v29 = *(double *)&v101;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_distanceLabel, "firstBaselineAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "maps_uniqueKey"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v33));
      objc_msgSend(v34, "setConstant:", v29);

      v35 = *((double *)&v102 + 1);
      -[NavSignLabel inlineShieldFirstBaselineTopOffset](self->_instructionsLabel, "inlineShieldFirstBaselineTopOffset");
      v37 = v35 + v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "maps_uniqueKey"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v41));
      objc_msgSend(v42, "setConstant:", v37);

      v43 = *(double *)&v105;
    }
    else
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PrimaryNoManeuverView")));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "allValues"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v62);

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("PrimaryManeuverView")));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "allValues"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v65);

      v66 = *((double *)&v99 + 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_shieldView, "topAnchor"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "maps_uniqueKey"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", v70));
      objc_msgSend(v71, "setConstant:", v66);

      v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView _shieldImage](self, "_shieldImage"));
      v73 = (double *)&v101 + 1;
      if (!v72)
        v73 = (double *)&v100 + 1;
      v74 = *v73;
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_distanceLabel, "firstBaselineAnchor"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "maps_uniqueKey"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", v78));
      objc_msgSend(v79, "setConstant:", v74);

      -[NavSignLabel inlineShieldFirstBaselineTopOffset](self->_instructionsLabel, "inlineShieldFirstBaselineTopOffset");
      v81 = v80 + *(double *)&v102;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel firstBaselineAnchor](self->_instructionsLabel, "firstBaselineAnchor"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "maps_uniqueKey"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", v85));
      objc_msgSend(v86, "setConstant:", v81);

      v43 = *((double *)&v104 + 1);
    }
    -[NavSignLabel inlineShieldLastBaselineBottomOffset](self->_instructionsLabel, "inlineShieldLastBaselineBottomOffset");
    v88 = v43 + v87;
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView dynamicConstraints](self, "dynamicConstraints"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("PrimaryLabelsBaselines")));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel lastBaselineAnchor](self->_instructionsLabel, "lastBaselineAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "maps_uniqueKey"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", v92));
    objc_msgSend(v93, "setConstant:", v88);

  }
}

- (void)_updateShield
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarManeuverView _shieldImage](self, "_shieldImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_shieldView, "image"));
  v4 = +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v3, v5);

  if ((v4 & 1) == 0)
    -[UIImageView setImage:](self->_shieldView, "setImage:", v5);

}

- (id)_shieldImage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImage *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "signID"));

  if (!+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v4, self->_lastRenderedShieldSignID))
  {
    objc_storeStrong((id *)&self->_lastRenderedShieldSignID, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView _screen](self, "_screen"));
    objc_msgSend(v5, "scale");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeDataSource](self, "sizeDataSource"));
    objc_msgSend(v8, "dynamicPointScaleValue");
    v10 = v9;

    v11 = -[CarManeuverView destination](self, "destination");
    if (v11 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView traitCollection](self, "traitCollection"));
      v13 = objc_msgSend(v12, "userInterfaceStyle") == (id)2;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
      v13 = objc_msgSend(v12, "blurMode") == 3;
    }
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "shieldInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_car_shieldImageWithSize:scale:displayedInDashboard:nightMode:", 3, v11 == 1, v14, v7));

    if (v17)
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v17, "image"), 0, v7 / v10));
    else
      v18 = 0;
    objc_storeStrong((id *)&self->_shieldImage, v18);
    if (v17)

  }
  v19 = self->_shieldImage;

  return v19;
}

- (void)setLayoutType:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
  v6 = objc_msgSend(v5, "layoutType");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView configuredStyle](self, "configuredStyle"));
    objc_msgSend(v7, "setLayoutType:", a3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView lowGuidanceStyle](self, "lowGuidanceStyle"));
    objc_msgSend(v8, "setLayoutType:", a3);

    -[CarManeuverView resetCompressionSizes](self, "resetCompressionSizes");
    -[CarManeuverView _setupConstraints](self, "_setupConstraints");
    -[CarManeuverView _updateConstraints](self, "_updateConstraints");
    -[CarManeuverView _updateStyling](self, "_updateStyling");
    -[CarManeuverView _updateSubviews](self, "_updateSubviews");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSUUID *lastRenderedShieldSignID;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarManeuverView;
  v4 = a3;
  -[CarManeuverView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    lastRenderedShieldSignID = self->_lastRenderedShieldSignID;
    self->_lastRenderedShieldSignID = 0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView _shieldImage](self, "_shieldImage"));
    -[UIImageView setImage:](self->_shieldView, "setImage:", v9);

  }
}

- (id)_shieldViewPrimaryLeadingConstraint
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[CarManeuverView _usesLargeScreenLayout](self, "_usesLargeScreenLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_shieldView, "leadingAnchor"));
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel textTrailingLayoutGuide](self->_distanceLabel, "textTrailingLayoutGuide"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v6, 12.0));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView trailingAnchor](self->_maneuverView, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v5, 12.0));
  }

  return v7;
}

- (id)_maneuverVerticalPrimaryConstraint
{
  unsigned __int8 v3;
  GuidanceManeuverView *maneuverView;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = -[CarManeuverView _usesLargeScreenLayout](self, "_usesLargeScreenLayout");
  maneuverView = self->_maneuverView;
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView centerYAnchor](maneuverView, "centerYAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView centerYAnchor](self, "centerYAnchor"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView topAnchor](maneuverView, "topAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView topAnchor](self, "topAnchor"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 9.0));
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_instructionHorizontalPrimaryConstraint
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = -[CarManeuverView _usesLargeScreenLayout](self, "_usesLargeScreenLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_instructionsLabel, "leadingAnchor"));
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView leadingAnchor](self, "leadingAnchor"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 9.0));
  }
  v7 = (void *)v6;

  return v7;
}

- (id)maneuverViewCenteringAnchor
{
  return -[GuidanceManeuverView centerXAnchor](self->_maneuverView, "centerXAnchor");
}

- (id)instructionsLabelLeadingAnchor
{
  return -[NavSignLabel leadingAnchor](self->_instructionsLabel, "leadingAnchor");
}

- (BOOL)_usesLargeScreenLayout
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v3 = objc_msgSend(v2, "layoutType") == (id)1;

  return v3;
}

- (void)showLaneGuidance:(id)a3
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  CarManeuverView *v19;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
    v7 = objc_msgSend(v6, "isSecondary");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "laneInfoId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo laneInfoId](self->_laneGuidance, "laneInfoId"));
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
      {
        v11 = sub_10043341C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v16 = 138412546;
          v17 = v14;
          v18 = 2048;
          v19 = self;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, showLaneGuidance", (uint8_t *)&v16, 0x16u);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeByCompressionStage](self, "sizeByCompressionStage"));

        if (v15)
          -[CarManeuverView setSizeByCompressionStage:](self, "setSizeByCompressionStage:", 0);
        objc_storeStrong((id *)&self->_laneGuidance, a3);
        -[CarManeuverView _updateContents](self, "_updateContents");
      }
    }
  }

}

- (void)updateLaneGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidance, a3);
  -[CarManeuverView _updateLabels](self, "_updateLabels");
}

- (void)hideLaneGuidance
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NavSignLaneGuidanceInfo *laneGuidance;
  int v11;
  void *v12;
  __int16 v13;
  CarManeuverView *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView style](self, "style"));
  v4 = objc_msgSend(v3, "variant");

  if (v4 != (id)2 && self->_laneGuidance)
  {
    v5 = sub_10043341C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = sub_100ABF414(-[CarManeuverView variant](self, "variant"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v11 = 138412546;
      v12 = v8;
      v13 = 2048;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, hideLaneGuidance", (uint8_t *)&v11, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView sizeByCompressionStage](self, "sizeByCompressionStage"));

    if (v9)
      -[CarManeuverView setSizeByCompressionStage:](self, "setSizeByCompressionStage:", 0);
    laneGuidance = self->_laneGuidance;
    self->_laneGuidance = 0;

    -[CarManeuverView _updateContents](self, "_updateContents");
  }
}

- (void)showLaneGuidanceFromManeuver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "laneGuidance"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "laneGuidance"));
    -[CarManeuverView showLaneGuidance:](self, "showLaneGuidance:", v5);

  }
}

- (BOOL)shouldShowLaneGuidance
{
  if (-[CarManeuverView compressionStage](self, "compressionStage") <= 4)
    return -[CarManeuverView _shouldShowLaneGuidance](self, "_shouldShowLaneGuidance");
  else
    return 0;
}

- (BOOL)_shouldShowLaneGuidance
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView laneGuidance](self, "laneGuidance"));
  if (v3)
    v4 = !-[NavSignLaneGuidanceView highlightedLanesNotInVisibleRange](self->_laneGuidanceView, "highlightedLanesNotInVisibleRange");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (int)_preferredDirectionForLaneGuidance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo highlightedLanes](self->_laneGuidance, "highlightedLanes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignLaneGuidanceInfo highlightedLanes](self->_laneGuidance, "highlightedLanes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isPreferredLaneForManeuver"))
        {
          v11 = v10;

          v4 = v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directions"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    v16 = objc_msgSend(v15, "direction");

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_maneuverArtworkForDirection:(int)a3
{
  return +[GuidanceManeuverArtwork artworkWithManeuver:](GuidanceManeuverArtwork, "artworkWithManeuver:", -[CarManeuverView GEOManeuverTypeForGEOLaneDirection:](self, "GEOManeuverTypeForGEOLaneDirection:", *(_QWORD *)&a3));
}

- (int)GEOManeuverTypeForGEOLaneDirection:(int)a3
{
  int result;
  int v4;
  int v5;
  int v6;
  int v7;

  result = 3;
  if (a3 > 31)
  {
    if (a3 == 256)
      v4 = 4;
    else
      v4 = 3;
    if (a3 == 128)
      v5 = 62;
    else
      v5 = v4;
    if (a3 == 64)
      v6 = 1;
    else
      v6 = 3;
    if (a3 == 32)
      v7 = 60;
    else
      v7 = v6;
    if (a3 <= 127)
      return v7;
    else
      return v5;
  }
  else
  {
    switch(a3)
    {
      case 0:
        result = 0;
        break;
      case 1:
      case 3:
      case 5:
      case 6:
      case 7:
        return result;
      case 2:
        result = 63;
        break;
      case 4:
        result = 2;
        break;
      case 8:
        result = 61;
        break;
      default:
        if (a3 == 16)
          result = 4;
        else
          result = 3;
        break;
    }
  }
  return result;
}

- (void)navSignLabel:(id)a3 didSelectAlternate:(unint64_t)a4
{
  NavSignLabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CarManeuverView *v11;
  unint64_t v12;
  uint64_t v13;
  NavSignLabel *v14;

  v6 = (NavSignLabel *)a3;
  if (self->_distanceLabel == v6)
  {
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView analyticsDelegate](self, "analyticsDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "signID"));
    v10 = v7;
    v11 = self;
    v12 = a4;
    v13 = 1;
    goto LABEL_5;
  }
  if (self->_instructionsLabel == v6)
  {
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView analyticsDelegate](self, "analyticsDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarManeuverView guidance](self, "guidance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "signID"));
    v10 = v7;
    v11 = self;
    v12 = a4;
    v13 = 0;
LABEL_5:
    objc_msgSend(v10, "carManeuverView:didSelectAlternate:forPrimaryString:inSign:", v11, v12, v13, v9);

    v6 = v14;
  }

}

- (int64_t)displayedLightLevel
{
  return self->_displayedLightLevel;
}

- (void)setDisplayedLightLevel:(int64_t)a3
{
  self->_displayedLightLevel = a3;
}

- (NavSignManeuverGuidanceInfo)guidance
{
  return self->_guidance;
}

- (NavSignLaneGuidanceInfo)laneGuidance
{
  return self->_laneGuidance;
}

- (BOOL)secondarySignVisible
{
  return self->_secondarySignVisible;
}

- (BOOL)stopUpdatingCompressionStage
{
  return self->_stopUpdatingCompressionStage;
}

- (void)setStopUpdatingCompressionStage:(BOOL)a3
{
  self->_stopUpdatingCompressionStage = a3;
}

- (unint64_t)compressionStage
{
  return self->_compressionStage;
}

- (CarManeuverViewAnalyticsDelegate)analyticsDelegate
{
  return (CarManeuverViewAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (void)setSizeByCompressionStage:(id)a3
{
  objc_storeStrong((id *)&self->_sizeByCompressionStage, a3);
}

- (CarManeuverViewStyle)configuredStyle
{
  return self->_configuredStyle;
}

- (CarManeuverViewStyle)lowGuidanceStyle
{
  return self->_lowGuidanceStyle;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (NSMutableDictionary)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (NSArray)myConstraints
{
  return self->_myConstraints;
}

- (void)setMyConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_myConstraints, a3);
}

- (int64_t)labelLineBreakMode
{
  return self->_labelLineBreakMode;
}

- (void)setLabelLineBreakMode:(int64_t)a3
{
  self->_labelLineBreakMode = a3;
}

- (CarManeuverViewSizeDataSource)sizeDataSource
{
  return (CarManeuverViewSizeDataSource *)objc_loadWeakRetained((id *)&self->_sizeDataSource);
}

- (void)setSizeDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_sizeDataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sizeDataSource);
  objc_storeStrong((id *)&self->_myConstraints, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_lowGuidanceStyle, 0);
  objc_storeStrong((id *)&self->_configuredStyle, 0);
  objc_storeStrong((id *)&self->_sizeByCompressionStage, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_laneGuidance, 0);
  objc_storeStrong((id *)&self->_guidance, 0);
  objc_storeStrong((id *)&self->_lastRenderedShieldSignID, 0);
  objc_storeStrong((id *)&self->_shieldImage, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);
  objc_storeStrong((id *)&self->_laneGuidanceView, 0);
}

@end
