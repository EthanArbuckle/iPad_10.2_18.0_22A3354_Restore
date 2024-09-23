@implementation BSUIProgressSingleDayController

- (BSUIProgressSingleDayController)initWithProgressView:(id)a3 frame:(CGRect)a4 progress:(double)a5 label:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  BSUIProgressSingleDayController *v16;
  BSUIProgressSingleDayController *v17;
  uint64_t v18;
  BSUIWeeklyProgressMetrics *metrics;
  objc_super v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)BSUIProgressSingleDayController;
  v16 = -[BSUIProgressSingleDayController init](&v21, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_progressView, a3);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metrics"));
    metrics = v17->_metrics;
    v17->_metrics = (BSUIWeeklyProgressMetrics *)v18;

    v17->_frame.origin.x = x;
    v17->_frame.origin.y = y;
    v17->_frame.size.width = width;
    v17->_frame.size.height = height;
    v17->_progress = a5;
    v17->_lastSeenProgress = 0.0;
    objc_storeStrong((id *)&v17->_label, a6);
  }

  return v17;
}

- (void)dealloc
{
  UILabel *titleLabel;
  CALayer *backgroundLayer;
  objc_super v5;

  -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  -[CALayer removeFromSuperlayer](self->_backgroundLayer, "removeFromSuperlayer");
  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = 0;

  v5.receiver = self;
  v5.super_class = (Class)BSUIProgressSingleDayController;
  -[BSUIProgressSingleDayController dealloc](&v5, "dealloc");
}

- (void)updateProgress:(double)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  double lastSeenProgress;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  self->_progress = a3;
  lastSeenProgress = self->_lastSeenProgress;
  -[BSUIProgressSingleDayController _setupDayWithProgress:dayType:](self, "_setupDayWithProgress:dayType:", self->_layoutType);
  self->_lastSeenProgress = a3;
  if (v4 && self->_layoutType == 1)
  {
    if (a3 >= 1.0 && lastSeenProgress < 1.0)
    {
      -[BSUIProgressSingleDayController _animatePop](self, "_animatePop");
    }
    else if (a3 < 1.0 && lastSeenProgress < 1.0)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
      objc_msgSend(v13, "setMass:", 1.0);
      objc_msgSend(v13, "setStiffness:", 55.0);
      objc_msgSend(v13, "setDamping:", 15.0);
      objc_msgSend(v13, "setInitialVelocity:", 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", lastSeenProgress));
      objc_msgSend(v13, "setFromValue:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
      objc_msgSend(v13, "setToValue:", v11);

      objc_msgSend(v13, "settlingDuration");
      objc_msgSend(v13, "setDuration:");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressRingLayer](self, "progressRingLayer"));
      objc_msgSend(v12, "addAnimation:forKey:", v13, CFSTR("progress"));

    }
  }
}

+ (double)_ringWidthThickness
{
  return 2.0;
}

- (void)configureWithType:(int64_t)a3
{
  CGFloat Width;
  CGFloat Height;
  CGRect v7;
  CGRect v8;

  -[BSUIProgressSingleDayController frame](self, "frame");
  Width = CGRectGetWidth(v7);
  -[BSUIProgressSingleDayController frame](self, "frame");
  Height = CGRectGetHeight(v8);
  self->_bounds.origin.x = 0.0;
  self->_bounds.origin.y = 0.0;
  self->_bounds.size.width = Width;
  self->_bounds.size.height = Height;
  self->_layoutType = a3;
  -[BSUIProgressSingleDayController _setupBackgroundLayer](self, "_setupBackgroundLayer");
  -[BSUIProgressSingleDayController progress](self, "progress");
  -[BSUIProgressSingleDayController _setupDayWithProgress:dayType:](self, "_setupDayWithProgress:dayType:", a3);
}

- (void)_setupBackgroundLayer
{
  void *v3;
  CALayer *v4;
  CALayer *backgroundLayer;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController backgroundLayer](self, "backgroundLayer"));

  if (!v3)
  {
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v4;

    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

    if (self->_debugBounds)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.25)));
      -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    }
    -[CALayer setMasksToBounds:](self->_backgroundLayer, "setMasksToBounds:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentationLayer"));
    objc_msgSend(v10, "addSublayer:", self->_backgroundLayer);

  }
  -[BSUIProgressSingleDayController frame](self, "frame");
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:");
}

- (void)_setupDayWithProgress:(double)a3 dayType:(int64_t)a4
{
  void *v7;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
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
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    -[BSUIProgressSingleDayController setControlRingLayer:](self, "setControlRingLayer:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    -[BSUIProgressSingleDayController setControlBackgroundLayer:](self, "setControlBackgroundLayer:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressRingLayer](self, "progressRingLayer"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    -[BSUIProgressSingleDayController setProgressRingLayer:](self, "setProgressRingLayer:", v12);

  }
  if (a4 == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "futureDayTextColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "traitCollection"));
    v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resolvedColorWithTraitCollection:", v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "controlColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "traitCollection"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resolvedColorWithTraitCollection:", v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));
    -[BSUIProgressSingleDayController bounds](self, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "rightToLeft"));
    +[BSUIProgressSingleDayController _updateArcLayer:withPercent:frame:color:fill:rtl:](BSUIProgressSingleDayController, "_updateArcLayer:withPercent:frame:color:fill:rtl:", v22, v21, 0, objc_msgSend(v32, "BOOLValue"), 1.0, v24, v26, v28, v30);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController backgroundLayer](self, "backgroundLayer"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));
    objc_msgSend(v33, "addSublayer:", v34);

    goto LABEL_18;
  }
  if (a3 >= 1.0)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "completedTextColor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "traitCollection"));
    v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "resolvedColorWithTraitCollection:", v79));

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "progressColor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "traitCollection"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "resolvedColorWithTraitCollection:", v83));

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));
    -[BSUIProgressSingleDayController bounds](self, "bounds");
    v86 = v85;
    v88 = v87;
    v90 = v89;
    v92 = v91;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "rightToLeft"));
    +[BSUIProgressSingleDayController _updateArcLayer:withPercent:frame:color:fill:rtl:](BSUIProgressSingleDayController, "_updateArcLayer:withPercent:frame:color:fill:rtl:", v84, v33, 1, objc_msgSend(v94, "BOOLValue"), 0.0, v86, v88, v90, v92);

    v95 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController backgroundLayer](self, "backgroundLayer"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));
    objc_msgSend(v95, "addSublayer:", v96);

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));
    -[BSUIProgressSingleDayController bounds](self, "bounds");
    v99 = v98;
    v101 = v100;
    v103 = v102;
    v105 = v104;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "rightToLeft"));
    +[BSUIProgressSingleDayController _updateArcLayer:withPercent:frame:color:fill:rtl:](BSUIProgressSingleDayController, "_updateArcLayer:withPercent:frame:color:fill:rtl:", v97, v33, 0, objc_msgSend(v107, "BOOLValue"), a3, v99, v101, v103, v105);

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));
    v109 = objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));
LABEL_17:
    v129 = (void *)v109;
    objc_msgSend(v108, "addSublayer:", v109);

    v21 = 0;
    goto LABEL_18;
  }
  if (!a4)
  {
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "previousDayTextColor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "traitCollection"));
    v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "resolvedColorWithTraitCollection:", v113));

    v114 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "previousDayBackgroundColor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "traitCollection"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "resolvedColorWithTraitCollection:", v117));

    v118 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));
    -[BSUIProgressSingleDayController bounds](self, "bounds");
    v120 = v119;
    v122 = v121;
    v124 = v123;
    v126 = v125;
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "rightToLeft"));
    +[BSUIProgressSingleDayController _updateArcLayer:withPercent:frame:color:fill:rtl:](BSUIProgressSingleDayController, "_updateArcLayer:withPercent:frame:color:fill:rtl:", v118, v33, 1, objc_msgSend(v128, "BOOLValue"), 0.0, v120, v122, v124, v126);

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController backgroundLayer](self, "backgroundLayer"));
    v109 = objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));
    goto LABEL_17;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "superlayer"));

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlBackgroundLayer](self, "controlBackgroundLayer"));
    objc_msgSend(v37, "removeFromSuperlayer");

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "textColor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "traitCollection"));
  v132 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "resolvedColorWithTraitCollection:", v41));

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "controlColor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "traitCollection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "resolvedColorWithTraitCollection:", v45));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));
  -[BSUIProgressSingleDayController bounds](self, "bounds");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "rightToLeft"));
  +[BSUIProgressSingleDayController _updateArcLayer:withPercent:frame:color:fill:rtl:](BSUIProgressSingleDayController, "_updateArcLayer:withPercent:frame:color:fill:rtl:", v46, v21, 0, objc_msgSend(v56, "BOOLValue"), 1.0, v48, v50, v52, v54);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController backgroundLayer](self, "backgroundLayer"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));
  objc_msgSend(v57, "addSublayer:", v58);

  if (a3 <= 0.0)
  {
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressRingLayer](self, "progressRingLayer"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "superlayer"));

    if (!v131)
      goto LABEL_19;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressRingLayer](self, "progressRingLayer"));
    objc_msgSend(v33, "removeFromSuperlayer");
  }
  else
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "progressColor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "traitCollection"));
    v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "resolvedColorWithTraitCollection:", v62));

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressRingLayer](self, "progressRingLayer"));
    -[BSUIProgressSingleDayController bounds](self, "bounds");
    v66 = v65;
    v68 = v67;
    v70 = v69;
    v72 = v71;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "rightToLeft"));
    +[BSUIProgressSingleDayController _updateArcLayer:withPercent:frame:color:fill:rtl:](BSUIProgressSingleDayController, "_updateArcLayer:withPercent:frame:color:fill:rtl:", v64, v63, 0, objc_msgSend(v74, "BOOLValue"), a3, v66, v68, v70, v72);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController controlRingLayer](self, "controlRingLayer"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressRingLayer](self, "progressRingLayer"));
    objc_msgSend(v33, "addSublayer:", v75);

    v21 = (void *)v63;
  }
LABEL_18:

LABEL_19:
  -[BSUIProgressSingleDayController _setupNumberText:](self, "_setupNumberText:", v132);

}

+ (void)_updateArcLayer:(id)a3 withPercent:(double)a4 frame:(CGRect)a5 color:(id)a6 fill:(BOOL)a7 rtl:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  double height;
  double width;
  double y;
  double x;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  double v28;
  id v29;
  id v30;
  CGRect v31;

  v8 = a8;
  v9 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v30 = a3;
  v16 = a6;
  +[BSUIProgressSingleDayController _ringWidthThickness](BSUIProgressSingleDayController, "_ringWidthThickness");
  v18 = v17;
  if (v9)
  {
    v19 = height;
    v20 = width;
    v21 = y;
    v22 = x;
  }
  else
  {
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    *(CGRect *)&v22 = CGRectInset(v31, v18 * 0.5, v18 * 0.5);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v22, v21, v20, v19, width * 0.5 + v18 * -2.0));
  v24 = v23;
  if (v8)
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bezierPathByReversingPath"));

    v24 = (void *)v25;
  }
  v26 = objc_retainAutorelease(v16);
  objc_msgSend(v30, "setStrokeColor:", objc_msgSend(v26, "CGColor"));
  if (v9)
  {
    objc_msgSend(v30, "setFillColor:", objc_msgSend(objc_retainAutorelease(v26), "CGColor"));
  }
  else
  {
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    objc_msgSend(v30, "setFillColor:", objc_msgSend(v27, "CGColor"));

  }
  objc_msgSend(v30, "setFrame:", x, y, width, height);
  v28 = 0.0;
  if (a4 != 0.0)
    v28 = v18;
  objc_msgSend(v30, "setLineWidth:", v28);
  objc_msgSend(v30, "setLineCap:", kCALineCapRound);
  objc_msgSend(v30, "setStrokeStart:", 0.0);
  objc_msgSend(v30, "setStrokeEnd:", a4);
  objc_msgSend(v30, "setZPosition:", 1.0);
  v29 = objc_retainAutorelease(v24);
  objc_msgSend(v30, "setPath:", objc_msgSend(v29, "CGPath"));

}

- (void)_setupNumberText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v21;
  CGFloat v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController titleLabel](self, "titleLabel"));

  if (!v5)
  {
    v6 = objc_alloc((Class)UILabel);
    -[BSUIProgressSingleDayController frame](self, "frame");
    v7 = objc_msgSend(v6, "initWithFrame:");
    -[BSUIProgressSingleDayController setTitleLabel:](self, "setTitleLabel:", v7);

  }
  -[BSUIProgressSingleDayController frame](self, "frame");
  v8 = -[BSUIProgressSingleDayController label](self, "label", CGRectGetHeight(v24));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[UILabel setText:](self->_titleLabel, "setText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController metrics](self, "metrics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontSpec"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "font"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v12);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel setClipsToBounds:](self->_titleLabel, "setClipsToBounds:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v13);

  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v15 = v14;
  -[BSUIProgressSingleDayController frame](self, "frame");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v21 = MidX - CGRectGetWidth(v26) * 0.5;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v22 = CGRectGetMidY(v27) - v15 * 0.5;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v21, v22, CGRectGetWidth(v28), v15);
  v23 = (id)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController progressView](self, "progressView"));
  objc_msgSend(v23, "addSubview:", self->_titleLabel);

}

- (void)_animatePop
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale")));
  objc_msgSend(v3, "setFromValue:", &off_2FBA48);
  objc_msgSend(v3, "setToValue:", &off_2FBA58);
  objc_msgSend(v3, "setDuration:", 0.15);
  LODWORD(v4) = 1051260355;
  LODWORD(v5) = 1045220557;
  LODWORD(v6) = 0;
  LODWORD(v7) = 1.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v4, v6, v5, v7));
  objc_msgSend(v3, "setTimingFunction:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.scale")));
  objc_msgSend(v9, "setMass:", 1.0);
  objc_msgSend(v9, "setStiffness:", 200.0);
  objc_msgSend(v9, "setDamping:", 22.0);
  objc_msgSend(v9, "setInitialVelocity:", 0.0);
  objc_msgSend(v9, "setFromValue:", &off_2FBA58);
  objc_msgSend(v9, "setToValue:", &off_2FBA48);
  objc_msgSend(v9, "setBeginTime:", 0.15);
  objc_msgSend(v9, "settlingDuration");
  objc_msgSend(v9, "setDuration:");
  v10 = objc_alloc_init((Class)CAAnimationGroup);
  v14[0] = v3;
  v14[1] = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  objc_msgSend(v10, "setAnimations:", v11);

  objc_msgSend(v9, "settlingDuration");
  objc_msgSend(v10, "setDuration:", v12 + 0.15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController backgroundLayer](self, "backgroundLayer"));
  objc_msgSend(v13, "addAnimation:forKey:", v10, CFSTR("bounce"));

}

- (id)description
{
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGRect v13;

  v3 = objc_opt_class(self, a2);
  -[BSUIProgressSingleDayController frame](self, "frame");
  v4 = NSStringFromCGRect(v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[BSUIProgressSingleDayController progress](self, "progress");
  v7 = v6;
  -[BSUIProgressSingleDayController lastSeenProgress](self, "lastSeenProgress");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIProgressSingleDayController label](self, "label"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %p frame=%@, progress=%.2f, lastProgress=%.2f, label=%@"), v3, self, v5, v7, v9, v10));

  return v11;
}

- (BSUIWeeklyProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)lastSeenProgress
{
  return self->_lastSeenProgress;
}

- (void)setLastSeenProgress:(double)a3
{
  self->_lastSeenProgress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BSUIWeeklyProgressMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (CAShapeLayer)controlBackgroundLayer
{
  return self->_controlBackgroundLayer;
}

- (void)setControlBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_controlBackgroundLayer, a3);
}

- (CAShapeLayer)controlRingLayer
{
  return self->_controlRingLayer;
}

- (void)setControlRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_controlRingLayer, a3);
}

- (CAShapeLayer)progressRingLayer
{
  return self->_progressRingLayer;
}

- (void)setProgressRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressRingLayer, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressRingLayer, 0);
  objc_storeStrong((id *)&self->_controlRingLayer, 0);
  objc_storeStrong((id *)&self->_controlBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
