@implementation PUProgressIndicatorView

- (PUProgressIndicatorView)initWithFrame:(CGRect)a3
{
  return -[PUProgressIndicatorView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUProgressIndicatorView)initWithStyle:(int64_t)a3
{
  PUProgressIndicatorView *v4;
  PUProgressIndicatorView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUProgressIndicatorView;
  v4 = -[PUProgressIndicatorView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isDeterminate = 1;
    v4->_style = a3;
    -[PUProgressIndicatorView setOpaque:](v4, "setOpaque:", 0);
  }
  return v5;
}

- (PUProgressIndicatorView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUProgressIndicatorView.m"), 117, CFSTR("unsupported initializer"));

  return -[PUProgressIndicatorView initWithStyle:](self, "initWithStyle:", 0);
}

- (void)updateConstraints
{
  _BOOL4 v3;
  double v4;
  NSArray *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  NSArray *spinnerViewConstraints;
  NSArray *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  NSArray *pieProgressViewConstraints;
  NSArray *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  NSArray *messageLabelConstraints;
  NSArray *v35;
  double v36;
  void *v37;
  double v38;
  NSArray *labelAndSpinnerConstraints;
  NSArray *v40;
  double v41;
  void *v42;
  double v43;
  NSArray *labelAndPieProgressConstraints;
  UIVisualEffectView *visualEffectView;
  void *v46;
  NSArray *v47;
  void *v48;
  void *v49;
  NSArray *backgroundViewConstraints;
  objc_super v51;

  v3 = -[PUProgressIndicatorView isStyleCompactBackground](self, "isStyleCompactBackground");
  if (v3)
    v4 = 3.0;
  else
    v4 = 12.0;
  if (self->_spinnerView && !self->_spinnerViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (self->_showsBackground)
      v6 = v4;
    else
      v6 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinnerView, 5, 0, self, 5, 1.0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1148846080;
    objc_msgSend(v7, "setPriority:", v8);
    -[NSArray addObject:](v5, "addObject:", v7);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinnerView, 6, 0, self, 6, 1.0, -v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = 1144750080;
    objc_msgSend(v9, "setPriority:", v10);
    -[NSArray addObject:](v5, "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinnerView, 10, 0, self, 10, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = 1144750080;
    objc_msgSend(v11, "setPriority:", v12);
    -[NSArray addObject:](v5, "addObject:", v11);
    -[PUProgressIndicatorView addConstraints:](self, "addConstraints:", v5);
    spinnerViewConstraints = self->_spinnerViewConstraints;
    self->_spinnerViewConstraints = v5;

  }
  if (self->_pieProgressView && !self->_pieProgressViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (self->_showsBackground)
      v15 = v4;
    else
      v15 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pieProgressView, 5, 0, self, 5, 1.0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1148846080;
    objc_msgSend(v16, "setPriority:", v17);
    -[NSArray addObject:](v14, "addObject:", v16);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pieProgressView, 6, 0, self, 6, 1.0, -v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v19) = 1144750080;
    objc_msgSend(v18, "setPriority:", v19);
    -[NSArray addObject:](v14, "addObject:", v18);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pieProgressView, 10, 0, self, 10, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v21) = 1144750080;
    objc_msgSend(v20, "setPriority:", v21);
    -[NSArray addObject:](v14, "addObject:", v20);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pieProgressView, 7, 0, 0, 0, 1.0, 20.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v14, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pieProgressView, 8, 0, 0, 0, 1.0, 20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v14, "addObject:", v23);

    -[PUProgressIndicatorView addConstraints:](self, "addConstraints:", v14);
    pieProgressViewConstraints = self->_pieProgressViewConstraints;
    self->_pieProgressViewConstraints = v14;

  }
  if (self->_messageLabel)
  {
    if (self->_messageLabelConstraints)
      goto LABEL_42;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v26 = self->_showsBackground ? v4 : 0.0;
    v27 = v3 ? 6.0 : v26;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_messageLabel, 5, 0, self, 5, 1.0, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 1144750080;
    objc_msgSend(v28, "setPriority:", v29);
    -[NSArray addObject:](v25, "addObject:", v28);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_messageLabel, 6, 0, self, 6, 1.0, -v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v31) = 1148846080;
    objc_msgSend(v30, "setPriority:", v31);
    -[NSArray addObject:](v25, "addObject:", v30);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_messageLabel, 10, 0, self, 10, 1.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v33) = 1144750080;
    objc_msgSend(v32, "setPriority:", v33);
    -[NSArray addObject:](v25, "addObject:", v32);
    -[PUProgressIndicatorView addConstraints:](self, "addConstraints:", v25);
    messageLabelConstraints = self->_messageLabelConstraints;
    self->_messageLabelConstraints = v25;

    if (self->_messageLabel)
    {
LABEL_42:
      if (!self->_spinnerView || self->_labelAndSpinnerConstraints)
        goto LABEL_41;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v36 = 5.0;
      if (!v3)
        v36 = 8.0;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_messageLabel, 5, 0, self->_spinnerView, 6, 1.0, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = 1148846080;
      objc_msgSend(v37, "setPriority:", v38);
      -[NSArray addObject:](v35, "addObject:", v37);
      -[PUProgressIndicatorView addConstraints:](self, "addConstraints:", v35);
      labelAndSpinnerConstraints = self->_labelAndSpinnerConstraints;
      self->_labelAndSpinnerConstraints = v35;

      if (self->_messageLabel)
      {
LABEL_41:
        if (self->_pieProgressView && !self->_labelAndPieProgressConstraints)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v41 = 5.0;
          if (!v3)
            v41 = 8.0;
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_messageLabel, 5, 0, self->_pieProgressView, 6, 1.0, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v43) = 1148846080;
          objc_msgSend(v42, "setPriority:", v43);
          -[NSArray addObject:](v40, "addObject:", v42);
          -[PUProgressIndicatorView addConstraints:](self, "addConstraints:", v40);
          labelAndPieProgressConstraints = self->_labelAndPieProgressConstraints;
          self->_labelAndPieProgressConstraints = v40;

        }
      }
    }
  }
  visualEffectView = self->_visualEffectView;
  if (visualEffectView && !self->_backgroundViewConstraints)
  {
    _NSDictionaryOfVariableBindings(CFSTR("_visualEffectView"), visualEffectView, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_visualEffectView]|"), 0, 0, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v47, "addObjectsFromArray:", v48);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_visualEffectView]|"), 0, 0, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v47, "addObjectsFromArray:", v49);

    -[PUProgressIndicatorView addConstraints:](self, "addConstraints:", v47);
    backgroundViewConstraints = self->_backgroundViewConstraints;
    self->_backgroundViewConstraints = v47;

  }
  v51.receiver = self;
  v51.super_class = (Class)PUProgressIndicatorView;
  -[PUProgressIndicatorView updateConstraints](&v51, sel_updateConstraints);
}

- (CGSize)intrinsicContentSize
{
  UIActivityIndicatorView *spinnerView;
  double v4;
  double v5;
  double v6;
  double v7;
  PLRoundProgressView *pieProgressView;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  spinnerView = self->_spinnerView;
  if (spinnerView)
  {
    -[UIActivityIndicatorView intrinsicContentSize](spinnerView, "intrinsicContentSize");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    pieProgressView = self->_pieProgressView;
    if (pieProgressView)
      v7 = 20.0;
    else
      v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (pieProgressView)
      v5 = 20.0;
    else
      v5 = *MEMORY[0x1E0C9D820];
  }
  -[UILabel intrinsicContentSize](self->_messageLabel, "intrinsicContentSize");
  v10 = v5 + v9;
  if ((self->_spinnerView || self->_pieProgressView) && self->_messageLabel)
    v10 = v10 + 8.0;
  if (self->_visualEffectView)
  {
    v10 = v10 + 24.0;
    v11 = -[PUProgressIndicatorView isStyleCompactBackground](self, "isStyleCompactBackground");
    v12 = 12.0;
    if (v11)
      v12 = 2.0;
    v7 = v7 + v12 * 2.0;
  }
  v13 = v10;
  v14 = v7;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)_newVisualEffectBackgroundView
{
  _BOOL4 v2;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[PUProgressIndicatorView isStyleCompactBackground](self, "isStyleCompactBackground");
  if (v2)
    v3 = 7;
  else
    v3 = 8;
  if (v2)
    v4 = 12.0;
  else
    v4 = 7.0;
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 0);
  objc_msgSend(v7, "setCornerRadius:", v4);
  objc_msgSend(v6, "setClipsToBounds:", 1);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v6;
}

- (void)_updateProgressViewsAnimated:(BOOL)a3 completion:(id)a4
{
  -[PUProgressIndicatorView _updateProgressViewsWithAnimation:completion:](self, "_updateProgressViewsWithAnimation:completion:", a3, a4);
}

- (void)_updateProgressViewsWithAnimation:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  UIActivityIndicatorView *v8;
  NSArray *spinnerViewConstraints;
  void *v10;
  void *labelAndSpinnerConstraints;
  int64_t v12;
  uint64_t v13;
  PLRoundProgressView *v14;
  PLRoundProgressView *v15;
  NSArray *pieProgressViewConstraints;
  NSArray *labelAndPieProgressConstraints;
  uint64_t v18;
  PLRoundProgressView *v19;
  PLRoundProgressView *pieProgressView;
  void *v21;
  UILabel *messageLabel;
  _BOOL4 v23;
  UILabel *v24;
  UILabel *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  UILabel *v29;
  UILabel *v30;
  UILabel *v31;
  NSArray *messageLabelConstraints;
  NSArray *v33;
  NSArray *v34;
  NSString *localizedMessage;
  void *v36;
  int v37;
  UIVisualEffectView *v38;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v40;
  UIVisualEffectView *v41;
  NSArray *backgroundViewConstraints;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  double v46;
  double v47;
  double v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  uint64_t v59;
  UIActivityIndicatorView *v60;
  UIActivityIndicatorView *spinnerView;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD aBlock[4];
  id v72;
  PUProgressIndicatorView *v73;
  id v74;
  _QWORD v75[5];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PUProgressIndicatorView _currentState](self, "_currentState") == 2 && !self->_isDeterminate)
  {
    if (!self->_spinnerView)
    {
      switch(-[PUProgressIndicatorView style](self, "style"))
      {
        case 0:
          labelAndSpinnerConstraints = 0;
          goto LABEL_82;
        case 1:
        case 3:
        case 5:
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_81;
        case 2:
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          labelAndSpinnerConstraints = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 101;
          break;
        case 4:
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_81:
          labelAndSpinnerConstraints = (void *)v18;
LABEL_82:
          v59 = 100;
          break;
        default:
          labelAndSpinnerConstraints = 0;
          v59 = 0;
          break;
      }
      v60 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", v59);
      spinnerView = self->_spinnerView;
      self->_spinnerView = v60;

      -[UIActivityIndicatorView setColor:](self->_spinnerView, "setColor:", labelAndSpinnerConstraints);
      -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
      -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PUProgressIndicatorView addSubview:](self, "addSubview:", self->_spinnerView);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", self->_spinnerView);
      v7 = 0;
      goto LABEL_5;
    }
LABEL_7:
    v7 = 0;
    v10 = 0;
    goto LABEL_8;
  }
  if (!self->_spinnerView)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", self->_spinnerView);
  v8 = self->_spinnerView;
  self->_spinnerView = 0;

  spinnerViewConstraints = self->_spinnerViewConstraints;
  self->_spinnerViewConstraints = 0;

  v10 = 0;
  labelAndSpinnerConstraints = self->_labelAndSpinnerConstraints;
  self->_labelAndSpinnerConstraints = 0;
LABEL_5:

LABEL_8:
  if (-[PUProgressIndicatorView _currentState](self, "_currentState") == 2 && self->_isDeterminate)
  {
    if (!self->_pieProgressView)
    {
      v12 = -[PUProgressIndicatorView style](self, "style");
      if ((unint64_t)(v12 - 1) > 3)
        v13 = 1;
      else
        v13 = qword_1AB0EFFE8[v12 - 1];
      v19 = (PLRoundProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D714B8]), "initWithFrame:style:", v13, 0.0, 0.0, 20.0, 20.0);
      pieProgressView = self->_pieProgressView;
      self->_pieProgressView = v19;

      -[PLRoundProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_pieProgressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (-[PUProgressIndicatorView isStyleCompactBackground](self, "isStyleCompactBackground"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLRoundProgressView setManualColor:](self->_pieProgressView, "setManualColor:", v21);

      }
      -[PUProgressIndicatorView addSubview:](self, "addSubview:", self->_pieProgressView);
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "addObject:", self->_pieProgressView);
    }
  }
  else
  {
    v14 = self->_pieProgressView;
    if (v14)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = self->_pieProgressView;
      }
      objc_msgSend(v7, "addObject:", v14);
      v15 = self->_pieProgressView;
      self->_pieProgressView = 0;

      pieProgressViewConstraints = self->_pieProgressViewConstraints;
      self->_pieProgressViewConstraints = 0;

      labelAndPieProgressConstraints = self->_labelAndPieProgressConstraints;
      self->_labelAndPieProgressConstraints = 0;

    }
  }
  -[PUProgressIndicatorView _updatePieProgress](self, "_updatePieProgress");
  if (-[PUProgressIndicatorView _currentState](self, "_currentState") == 2
    && -[NSString length](self->_localizedMessage, "length"))
  {
    messageLabel = self->_messageLabel;
    v23 = messageLabel != 0;
    if (!messageLabel)
    {
      v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v25 = self->_messageLabel;
      self->_messageLabel = v24;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v26 = -[PUProgressIndicatorView isStyleCompactBackground](self, "isStyleCompactBackground");
      +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = self->_messageLabel;
      if (v26)
        objc_msgSend(v27, "configureCompactProgressIndicatorMessageLabel:", v29);
      else
        objc_msgSend(v27, "configureProgressIndicatorMessageLabel:", v29);

      -[PUProgressIndicatorView addSubview:](self, "addSubview:", self->_messageLabel);
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "addObject:", self->_messageLabel);
      messageLabel = self->_messageLabel;
    }
    localizedMessage = self->_localizedMessage;
    -[UILabel text](messageLabel, "text");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(localizedMessage) = -[NSString isEqualToString:](localizedMessage, "isEqualToString:", v36);

    if ((localizedMessage & 1) == 0)
    {
      -[UILabel setText:](self->_messageLabel, "setText:", self->_localizedMessage);
      v37 = 1;
      goto LABEL_40;
    }
  }
  else
  {
    v30 = self->_messageLabel;
    if (v30)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self->_messageLabel;
      }
      objc_msgSend(v7, "addObject:", v30);
      v31 = self->_messageLabel;
      self->_messageLabel = 0;

      messageLabelConstraints = self->_messageLabelConstraints;
      self->_messageLabelConstraints = 0;

      v33 = self->_labelAndSpinnerConstraints;
      self->_labelAndSpinnerConstraints = 0;

      v34 = self->_labelAndPieProgressConstraints;
      self->_labelAndPieProgressConstraints = 0;

    }
  }
  v37 = 0;
  v23 = 0;
LABEL_40:
  if (-[PUProgressIndicatorView _currentState](self, "_currentState") == 2 && self->_showsBackground)
  {
    if (!self->_visualEffectView)
    {
      v38 = -[PUProgressIndicatorView _newVisualEffectBackgroundView](self, "_newVisualEffectBackgroundView");
      visualEffectView = self->_visualEffectView;
      self->_visualEffectView = v38;

      -[PUProgressIndicatorView addSubview:](self, "addSubview:", self->_visualEffectView);
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "addObject:", self->_visualEffectView);
    }
  }
  else
  {
    v40 = self->_visualEffectView;
    if (v40)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = self->_visualEffectView;
      }
      objc_msgSend(v7, "addObject:", v40);
      v41 = self->_visualEffectView;
      self->_visualEffectView = 0;

      backgroundViewConstraints = self->_backgroundViewConstraints;
      self->_backgroundViewConstraints = 0;

    }
  }
  v43 = objc_msgSend(v10, "count");
  v44 = MEMORY[0x1E0C809B0];
  if (v43)
  {
    -[PUProgressIndicatorView _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
    v45 = a3 != 0;
    v46 = 0.4;
    if (a3 != 1)
      v46 = 0.0;
    if (a3 == 2)
      v47 = 0.2;
    else
      v47 = v46;
LABEL_62:
    if (v23 && v45)
    {
      -[PUProgressIndicatorView layoutIfNeeded](self, "layoutIfNeeded");
      -[PUProgressIndicatorView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[PUProgressIndicatorView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[PUProgressIndicatorView setNeedsLayout](self, "setNeedsLayout");
      v75[0] = v44;
      v75[1] = 3221225472;
      v75[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke;
      v75[3] = &unk_1E58ABD10;
      v75[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v75, v47);
      v45 = 1;
    }
    else
    {
      -[PUProgressIndicatorView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[PUProgressIndicatorView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
    goto LABEL_65;
  }
  v45 = a3 != 0;
  v48 = 0.4;
  if (a3 != 1)
    v48 = 0.0;
  if (a3 == 2)
    v47 = 0.2;
  else
    v47 = v48;
  if (v37)
    goto LABEL_62;
LABEL_65:
  aBlock[0] = v44;
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_2;
  aBlock[3] = &unk_1E58ABAF0;
  v49 = v7;
  v72 = v49;
  v73 = self;
  v50 = v6;
  v74 = v50;
  v51 = _Block_copy(aBlock);
  v52 = v51;
  if (v45)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v53 = v10;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v68 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "setAlpha:", 0.0);
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v55);
    }

    v58 = (void *)MEMORY[0x1E0DC3F10];
    v64[0] = v44;
    v64[1] = 3221225472;
    v64[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_3;
    v64[3] = &unk_1E58ABCA8;
    v65 = v53;
    v66 = v49;
    v62[0] = v44;
    v62[1] = 3221225472;
    v62[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_4;
    v62[3] = &unk_1E58AA518;
    v63 = v52;
    objc_msgSend(v58, "animateWithDuration:animations:completion:", v64, v62, v47);

  }
  else
  {
    (*((void (**)(void *))v51 + 2))(v51);
  }

}

- (void)_updatePieProgress
{
  -[PLRoundProgressView setProgress:](self->_pieProgressView, "setProgress:", self->_currentProgress);
}

- (void)_updateSubviewsOrdering
{
  -[PUProgressIndicatorView sendSubviewToBack:](self, "sendSubviewToBack:", self->_visualEffectView);
  -[PUProgressIndicatorView bringSubviewToFront:](self, "bringSubviewToFront:", self->_spinnerView);
  -[PUProgressIndicatorView bringSubviewToFront:](self, "bringSubviewToFront:", self->_messageLabel);
}

- (void)setCurrentProgress:(double)a3
{
  if (self->_currentProgress != a3)
  {
    self->_currentProgress = a3;
    -[PUProgressIndicatorView _updatePieProgress](self, "_updatePieProgress");
  }
}

- (void)setLocalizedMessage:(id)a3
{
  NSString *localizedMessage;
  id v5;
  _BOOL8 v6;
  NSString *v7;
  NSString *v8;

  localizedMessage = self->_localizedMessage;
  if (localizedMessage != a3)
  {
    v5 = a3;
    v6 = -[NSString length](localizedMessage, "length") != 0;
    v7 = (NSString *)objc_msgSend(v5, "copy");

    v8 = self->_localizedMessage;
    self->_localizedMessage = v7;

    -[PUProgressIndicatorView _updateProgressViewsAnimated:completion:](self, "_updateProgressViewsAnimated:completion:", v6, 0);
  }
}

- (void)setDeterminate:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_isDeterminate != a3)
  {
    self->_isDeterminate = a3;
    if (self->_spinnerView)
      v3 = 1;
    else
      v3 = self->_pieProgressView != 0;
    -[PUProgressIndicatorView _updateProgressViewsAnimated:completion:](self, "_updateProgressViewsAnimated:completion:", v3, 0);
  }
}

- (void)setShowsBackground:(BOOL)a3
{
  if (self->_showsBackground != a3)
  {
    self->_showsBackground = a3;
    -[PUProgressIndicatorView _updateProgressViewsAnimated:completion:](self, "_updateProgressViewsAnimated:completion:", 0, 0);
  }
}

- (BOOL)isShowingProgress
{
  return (unint64_t)(-[PUProgressIndicatorView _currentState](self, "_currentState") - 1) < 2;
}

- (double)defaultProgressIndicatorDelay
{
  return 1.25;
}

- (void)beginShowingProgressImmediately:(BOOL)a3 animated:(BOOL)a4
{
  double v4;

  v4 = 1.25;
  if (a3)
    v4 = 0.0;
  -[PUProgressIndicatorView beginShowingProgressWithDelay:animated:](self, "beginShowingProgressWithDelay:animated:", a4, v4);
}

- (void)beginShowingProgressWithDelay:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  BOOL v10;
  id location;

  v4 = a4;
  -[PUProgressIndicatorView _setCurrentState:](self, "_setCurrentState:", 1);
  if (a3 <= 0.0)
  {
    -[PUProgressIndicatorView _handleBeginShowingAnimated:wasImmediate:](self, "_handleBeginShowingAnimated:wasImmediate:", v4, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PUProgressIndicatorView_beginShowingProgressWithDelay_animated___block_invoke;
    block[3] = &unk_1E58AA4A0;
    objc_copyWeak(&v9, &location);
    v10 = v4;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_handleBeginShowingAnimated:(BOOL)a3 wasImmediate:(BOOL)a4
{
  _BOOL8 v5;
  double v7;

  v5 = a3;
  if (-[PUProgressIndicatorView _currentState](self, "_currentState") == 1)
  {
    if (a4 || (-[PUProgressIndicatorView currentProgress](self, "currentProgress"), v7 < 0.833))
    {
      -[PUProgressIndicatorView _setCurrentState:](self, "_setCurrentState:", 2);
      -[PUProgressIndicatorView _updateProgressViewsAnimated:completion:](self, "_updateProgressViewsAnimated:completion:", v5, 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[PUProgressIndicatorView _setTimestampBeganShowing:](self, "_setTimestampBeganShowing:");
    }
    else
    {
      -[PUProgressIndicatorView endShowingProgressImmediately:animated:withCompletionHandler:](self, "endShowingProgressImmediately:animated:withCompletionHandler:", 1, v5, 0);
    }
  }
}

- (void)endShowingProgressImmediately:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  void *v9;
  id completionHandler;

  v8 = a5;
  -[PUProgressIndicatorView _setCurrentState:](self, "_setCurrentState:", 3);
  self->_wantsImmediateHide = a3;
  self->_wantsAnimatedHide = a4;
  v9 = (void *)objc_msgSend(v8, "copy");

  completionHandler = self->_completionHandler;
  self->_completionHandler = v9;

  -[PUProgressIndicatorView _endShowingProgressIfReady](self, "_endShowingProgressIfReady");
}

- (void)_endShowingProgressIfReady
{
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  uint64_t v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__endShowingProgressIfReady, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[PUProgressIndicatorView _timestampBeganShowing](self, "_timestampBeganShowing");
  if (v5 - v4 + 1.0 <= 0.0 || self->_wantsImmediateHide)
  {
    -[PUProgressIndicatorView _setCurrentState:](self, "_setCurrentState:", 4);
    v6 = !self->_wantsImmediateHide && self->_wantsAnimatedHide;
    if (self->_wantsAnimatedHide && self->_wantsImmediateHide)
      v7 = 2;
    else
      v7 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__PUProgressIndicatorView__endShowingProgressIfReady__block_invoke;
    v8[3] = &unk_1E58ABD10;
    v8[4] = self;
    -[PUProgressIndicatorView _updateProgressViewsWithAnimation:completion:](self, "_updateProgressViewsWithAnimation:completion:", v7, v8);
  }
  else
  {
    -[PUProgressIndicatorView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__endShowingProgressIfReady, 0);
  }
}

- (void)_setCurrentState:(int64_t)a3
{
  void *v6;

  switch(self->__currentState)
  {
    case 0:
      if (a3 != 1)
        goto LABEL_9;
      break;
    case 1:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
        goto LABEL_9;
      break;
    case 2:
      if (a3 != 3)
        goto LABEL_9;
      break;
    case 3:
      if (a3 != 4)
        goto LABEL_9;
      break;
    default:
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUProgressIndicatorView.m"), 703, CFSTR("Invalid transition %ld %ld"), self->__currentState, a3);

      break;
  }
  self->__currentState = a3;
}

- (BOOL)isStyleCompactBackground
{
  return -[PUProgressIndicatorView style](self, "style") == 4 || -[PUProgressIndicatorView style](self, "style") == 5;
}

- (BOOL)isStyleDark
{
  return !-[PUProgressIndicatorView style](self, "style") || -[PUProgressIndicatorView style](self, "style") == 5;
}

- (int64_t)style
{
  return self->_style;
}

- (double)currentProgress
{
  return self->_currentProgress;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (BOOL)isDeterminate
{
  return self->_isDeterminate;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (int64_t)_currentState
{
  return self->__currentState;
}

- (double)_timestampBeganShowing
{
  return self->__timestampBeganShowing;
}

- (void)_setTimestampBeganShowing:(double)a3
{
  self->__timestampBeganShowing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_labelAndPieProgressConstraints, 0);
  objc_storeStrong((id *)&self->_labelAndSpinnerConstraints, 0);
  objc_storeStrong((id *)&self->_messageLabelConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundViewConstraints, 0);
  objc_storeStrong((id *)&self->_pieProgressViewConstraints, 0);
  objc_storeStrong((id *)&self->_spinnerViewConstraints, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_pieProgressView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

void __53__PUProgressIndicatorView__endShowingProgressIfReady__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 504);
    *(_QWORD *)(v3 + 504) = 0;

  }
}

void __66__PUProgressIndicatorView_beginShowingProgressWithDelay_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleBeginShowingAnimated:wasImmediate:", *(unsigned __int8 *)(a1 + 40), 0);

}

uint64_t __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "removeFromSuperview", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 40), "invalidateIntrinsicContentSize");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "setAlpha:", 1.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setAlpha:", 0.0, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

uint64_t __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
