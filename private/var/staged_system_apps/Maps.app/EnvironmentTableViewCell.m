@implementation EnvironmentTableViewCell

- (void)_configureEnvironmentCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *errorButton;
  void *v9;
  UIActivityIndicatorView *v10;
  UIActivityIndicatorView *loadingView;
  void *v12;
  MapsPieProgressView *v13;
  void *v14;
  CGFloat v15;
  void *v16;
  MapsPieProgressView *v17;
  MapsPieProgressView *progressView;
  id v19;
  void *v20;
  UIImageView *v21;
  UIImageView *secureEnvironmentImageView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  CGRect v34;
  CGRect v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell imageView](self, "imageView"));
  objc_msgSend(v4, "setImage:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 118));
  errorButton = self->_errorButton;
  self->_errorButton = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UIButton setTintColor:](self->_errorButton, "setTintColor:", v9);

  v10 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  loadingView = self->_loadingView;
  self->_loadingView = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UIActivityIndicatorView setColor:](self->_loadingView, "setColor:", v12);

  v13 = [MapsPieProgressView alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell imageView](self, "imageView"));
  objc_msgSend(v14, "frame");
  v15 = CGRectGetMidX(v34) + -12.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell imageView](self, "imageView"));
  objc_msgSend(v16, "frame");
  v17 = -[MapsPieProgressView initWithFrame:](v13, "initWithFrame:", v15, CGRectGetMidY(v35) + -12.0, 24.0, 24.0);
  progressView = self->_progressView;
  self->_progressView = v17;

  -[MapsPieProgressView setHidden:](self->_progressView, "setHidden:", 1);
  -[EnvironmentTableViewCell addSubview:](self, "addSubview:", self->_progressView);
  v19 = objc_alloc((Class)UIImageView);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock.fill")));
  v21 = (UIImageView *)objc_msgSend(v19, "initWithImage:", v20);
  secureEnvironmentImageView = self->_secureEnvironmentImageView;
  self->_secureEnvironmentImageView = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UIImageView setTintColor:](self->_secureEnvironmentImageView, "setTintColor:", v23);

  -[UIImageView setHidden:](self->_secureEnvironmentImageView, "setHidden:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_secureEnvironmentImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EnvironmentTableViewCell addSubview:](self, "addSubview:", self->_secureEnvironmentImageView);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView firstBaselineAnchor](self->_secureEnvironmentImageView, "firstBaselineAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell textLabel](self, "textLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstBaselineAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v33[0] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_secureEnvironmentImageView, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell textLabel](self, "textLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v30, 1.0));
  v33[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

}

- (EnvironmentTableViewCell)initWithReuseIdentifier:(id)a3
{
  EnvironmentTableViewCell *v3;
  EnvironmentTableViewCell *v4;
  EnvironmentTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EnvironmentTableViewCell;
  v3 = -[EnvironmentTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 3, a3);
  v4 = v3;
  if (v3)
  {
    -[EnvironmentTableViewCell _configureEnvironmentCell](v3, "_configureEnvironmentCell");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[EnvironmentTableViewCell _stopObservingProgress](self, "_stopObservingProgress");
  -[EnvironmentTableViewCell _stopObservingEnvironment](self, "_stopObservingEnvironment");
  v3.receiver = self;
  v3.super_class = (Class)EnvironmentTableViewCell;
  -[EnvironmentTableViewCell dealloc](&v3, "dealloc");
}

- (void)prepareForReuse
{
  GEOEnvironmentInfo *environment;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EnvironmentTableViewCell;
  -[EnvironmentTableViewCell prepareForReuse](&v4, "prepareForReuse");
  -[EnvironmentTableViewCell _stopObservingProgress](self, "_stopObservingProgress");
  -[EnvironmentTableViewCell _stopObservingEnvironment](self, "_stopObservingEnvironment");
  environment = self->_environment;
  self->_environment = 0;

}

- (void)_startObservingEnvironment:(id)a3
{
  id v4;

  if (a3)
  {
    if (self->_environment != a3)
    {
      v4 = a3;
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 1, 0);
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("activationProgress"), 1, 0);

    }
  }
}

- (void)_stopObservingEnvironment
{
  GEOEnvironmentInfo *environment;

  environment = self->_environment;
  if (environment)
  {
    -[GEOEnvironmentInfo removeObserver:forKeyPath:](environment, "removeObserver:forKeyPath:", self, CFSTR("state"));
    -[GEOEnvironmentInfo removeObserver:forKeyPath:](self->_environment, "removeObserver:forKeyPath:", self, CFSTR("activationProgress"));
  }
}

- (void)_startObservingProgressForEnvironment:(id)a3
{
  NSProgress *v4;
  NSProgress *observedProgress;
  NSProgress *v6;
  NSProgress *v7;
  NSProgress *v8;
  double v9;
  id v10;

  v10 = a3;
  v4 = (NSProgress *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activationProgress"));
  observedProgress = self->_observedProgress;

  if (v4 != observedProgress)
  {
    if (self->_observedProgress)
      -[EnvironmentTableViewCell _stopObservingProgress](self, "_stopObservingProgress");
    v6 = (NSProgress *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activationProgress"));
    v7 = self->_observedProgress;
    self->_observedProgress = v6;

    v8 = self->_observedProgress;
    if (v8)
    {
      -[NSProgress fractionCompleted](v8, "fractionCompleted");
      *(float *)&v9 = v9;
      -[MapsPieProgressView setProgress:](self->_progressView, "setProgress:", *(float *)&v9);
      -[NSProgress addObserver:forKeyPath:options:context:](self->_observedProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, 0);
      -[NSProgress addObserver:forKeyPath:options:context:](self->_observedProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 1, 0);
      -[NSProgress addObserver:forKeyPath:options:context:](self->_observedProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("isCancelled"), 1, 0);
    }
  }

}

- (void)_stopObservingProgress
{
  NSProgress *observedProgress;
  NSProgress *v4;

  observedProgress = self->_observedProgress;
  if (observedProgress)
  {
    -[NSProgress removeObserver:forKeyPath:](observedProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
    -[NSProgress removeObserver:forKeyPath:](self->_observedProgress, "removeObserver:forKeyPath:", self, CFSTR("isFinished"));
    -[NSProgress removeObserver:forKeyPath:](self->_observedProgress, "removeObserver:forKeyPath:", self, CFSTR("isCancelled"));
    v4 = self->_observedProgress;
    self->_observedProgress = 0;

  }
}

- (void)configureFromEnvironment:(id)a3
{
  GEOEnvironmentInfo *v5;
  GEOEnvironmentInfo **p_environment;
  unsigned int v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  UIActivityIndicatorView *loadingView;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *errorButton;
  EnvironmentTableViewCell *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v5 = (GEOEnvironmentInfo *)a3;
  p_environment = &self->_environment;
  if (self->_environment != v5)
  {
    -[EnvironmentTableViewCell _stopObservingEnvironment](self, "_stopObservingEnvironment");
    -[EnvironmentTableViewCell _startObservingEnvironment:](self, "_startObservingEnvironment:", v5);
  }
  objc_storeStrong((id *)&self->_environment, a3);
  v7 = -[GEOEnvironmentInfo isActive](v5, "isActive");
  if (v7)
  {
    p_environment = (GEOEnvironmentInfo **)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentInfo activationProgress](v5, "activationProgress"));
    v8 = p_environment != 0;
  }
  else
  {
    v8 = 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell imageView](self, "imageView"));
  objc_msgSend(v9, "setHidden:", v8);

  if (v7)
  v10 = -[GEOEnvironmentInfo state](v5, "state");
  loadingView = self->_loadingView;
  if (v10 == (id)1)
    -[UIActivityIndicatorView startAnimating](loadingView, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](loadingView, "stopAnimating");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentInfo activationProgress](v5, "activationProgress"));

  if (v12)
  {
    -[EnvironmentTableViewCell _startObservingProgressForEnvironment:](self, "_startObservingProgressForEnvironment:", v5);
    -[MapsPieProgressView setHidden:](self->_progressView, "setHidden:", 0);
  }
  else
  {
    -[MapsPieProgressView setHidden:](self->_progressView, "setHidden:", 1);
    -[EnvironmentTableViewCell _stopObservingProgress](self, "_stopObservingProgress");
  }
  -[UIImageView setHidden:](self->_secureEnvironmentImageView, "setHidden:", 1);
  v13 = -[GEOEnvironmentInfo state](v5, "state");
  if (v13 == (id)1)
  {
    -[EnvironmentTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
    errorButton = self->_loadingView;
LABEL_36:
    v37 = self;
    goto LABEL_38;
  }
  if (v13 == (id)3)
  {
    -[EnvironmentTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
    errorButton = self->_errorButton;
    goto LABEL_36;
  }
  if (v13 == (id)2)
  {
    -[EnvironmentTableViewCell setAccessoryType:](self, "setAccessoryType:", 2);
    -[EnvironmentTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
    -[EnvironmentTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v15, "setTextColor:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOEnvironmentInfo resourceManifest](v5, "resourceManifest"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resources"));
    if (!v17)
    {
      v35 = 0;
      goto LABEL_43;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeTileGroup"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataSet"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "preferedURLSetFor:", v20));

    if (!objc_msgSend(v21, "hasAuthProxyURL"))
    {
      v35 = 0;
LABEL_42:

LABEL_43:
      -[UIImageView setHidden:](self->_secureEnvironmentImageView, "setHidden:", v35 ^ 1u);

      goto LABEL_44;
    }
    v40 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "data"));
    v23 = GEOGetProxyAuthFromResourceManifest();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allValues"));
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v42;
LABEL_21:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v29), "BOOLValue") & 1) != 0)
          break;
        if (v27 == (id)++v29)
        {
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v27)
            goto LABEL_21;
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tileGroups"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));

      if (!v25 || !objc_msgSend(v25, "tileSetsCount"))
      {
LABEL_33:
        v35 = 0;
LABEL_41:

        v16 = v40;
        goto LABEL_42;
      }
      v31 = 0;
      while (1)
      {
        v32 = (unint64_t)objc_msgSend(v25, "tileSetAtIndex:", v31);
        if ((unint64_t)objc_msgSend(v17, "tileSetsCount") > HIDWORD(v32))
        {
          v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tileSets"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v33, "objectAtIndexedSubscript:", HIDWORD(v32)));

          LOBYTE(v33) = objc_msgSend(v34, "useAuthProxy");
          if ((v33 & 1) != 0)
            break;
        }
        if (++v31 >= (unint64_t)objc_msgSend(v25, "tileSetsCount"))
          goto LABEL_33;
      }
    }
    v35 = 1;
    goto LABEL_41;
  }
  -[EnvironmentTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
  v37 = self;
  errorButton = 0;
LABEL_38:
  -[EnvironmentTableViewCell setAccessoryView:](v37, "setAccessoryView:", errorButton);
  -[EnvironmentTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v39, "setTextColor:", v38);

LABEL_44:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSProgress *v11;
  id v12;
  objc_super v13;
  _QWORD block[5];

  v10 = a3;
  v11 = (NSProgress *)a4;
  v12 = a5;
  if ((NSProgress *)self->_environment == v11)
  {
    -[EnvironmentTableViewCell configureFromEnvironment:](self, "configureFromEnvironment:", v11);
  }
  else if (self->_observedProgress == v11)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BED484;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)EnvironmentTableViewCell;
    -[EnvironmentTableViewCell observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)layoutSubviews
{
  void *v3;
  double MidX;
  double v5;
  void *v6;
  double MidY;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v11.receiver = self;
  v11.super_class = (Class)EnvironmentTableViewCell;
  -[EnvironmentTableViewCell layoutSubviews](&v11, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell imageView](self, "imageView"));
  objc_msgSend(v3, "frame");
  MidX = CGRectGetMidX(v12);
  -[MapsPieProgressView bounds](self->_progressView, "bounds");
  v5 = MidX - CGRectGetWidth(v13) * 0.5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EnvironmentTableViewCell imageView](self, "imageView"));
  objc_msgSend(v6, "frame");
  MidY = CGRectGetMidY(v14);
  -[MapsPieProgressView bounds](self->_progressView, "bounds");
  v8 = MidY - CGRectGetHeight(v15) * 0.5;
  -[MapsPieProgressView bounds](self->_progressView, "bounds");
  v10 = v9;
  -[MapsPieProgressView bounds](self->_progressView, "bounds");
  -[MapsPieProgressView setFrame:](self->_progressView, "setFrame:", v5, v8, v10);

}

- (UIButton)errorButton
{
  return self->_errorButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureEnvironmentImageView, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorButton, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
