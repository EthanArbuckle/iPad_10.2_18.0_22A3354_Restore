@implementation UGCPhotoThumbnailCheckmarkCollectionViewCell

- (UGCPhotoThumbnailCheckmarkCollectionViewCell)initWithFrame:(CGRect)a3
{
  UGCPhotoThumbnailCheckmarkCollectionViewCell *v3;
  UGCPhotoThumbnailCheckmarkCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCPhotoThumbnailCheckmarkCollectionViewCell;
  v3 = -[UGCPhotoThumbnailCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UGCPhotoThumbnailCheckmarkCollectionViewCell _setupSubview](v3, "_setupSubview");
  return v4;
}

- (UGCARPPhotoCarouselViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_viewModel, a3);
  v5 = a3;
  -[UGCPhotoThumbnailCheckmarkCollectionViewCell setChecked:](self, "setChecked:", objc_msgSend(v5, "checked"));
  -[UGCPhotoThumbnailCheckmarkCollectionViewCell setEnabled:](self, "setEnabled:", objc_msgSend(v5, "enabled"));
  v6 = objc_msgSend(v5, "isLoading");

  -[UGCPhotoThumbnailCheckmarkCollectionViewCell setIsLoading:](self, "setIsLoading:", v6);
}

- (void)_setupSubview
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UIImageView *checkmarkImageView;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  MapsPieProgressView *v17;
  MapsPieProgressView *progressView;
  void *v19;
  UIView *v20;
  UIView *backgroundViewForProgressView;
  id v22;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[12];

  v3 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  checkmarkImageView = self->_checkmarkImageView;
  self->_checkmarkImageView = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setClipsToBounds:](self->_checkmarkImageView, "setClipsToBounds:", 1);
  -[UIImageView _setContinuousCornerRadius:](self->_checkmarkImageView, "_setContinuousCornerRadius:", 12.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "nativeScale");
  v11 = 1.5 / v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_checkmarkImageView, "layer"));
  objc_msgSend(v12, "setBorderWidth:", v11);

  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor")));
  v14 = objc_msgSend(v13, "CGColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_checkmarkImageView, "layer"));
  objc_msgSend(v15, "setBorderColor:", v14);

  -[UIImageView setContentMode:](self->_checkmarkImageView, "setContentMode:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 24.0));
  -[UIImageView setPreferredSymbolConfiguration:](self->_checkmarkImageView, "setPreferredSymbolConfiguration:", v16);

  v17 = -[MapsPieProgressView initWithFrame:]([MapsPieProgressView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  progressView = self->_progressView;
  self->_progressView = v17;

  -[MapsPieProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsPieProgressView setProgress:](self->_progressView, "setProgress:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[MapsPieProgressView setProgressColor:](self->_progressView, "setProgressColor:", v19);

  -[MapsPieProgressView setHidden:](self->_progressView, "setHidden:", 1);
  v20 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  backgroundViewForProgressView = self->_backgroundViewForProgressView;
  self->_backgroundViewForProgressView = v20;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundViewForProgressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = objc_msgSend(objc_alloc((Class)UIColor), "initWithWhite:alpha:", 0.0, 0.1);
  -[UIView setBackgroundColor:](self->_backgroundViewForProgressView, "setBackgroundColor:", v22);

  -[UIView setHidden:](self->_backgroundViewForProgressView, "setHidden:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layer"));
  objc_msgSend(v24, "setCornerRadius:", 15.0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  objc_msgSend(v25, "addSubview:", self->_backgroundViewForProgressView);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  objc_msgSend(v26, "addSubview:", self->_progressView);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  objc_msgSend(v27, "addSubview:", self->_checkmarkImageView);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_checkmarkImageView, "widthAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToConstant:", 24.0));
  v71[0] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_checkmarkImageView, "heightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_checkmarkImageView, "widthAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
  v71[1] = v66;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_checkmarkImageView, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, -8.0));
  v71[2] = v62;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_checkmarkImageView, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, -8.0));
  v71[3] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView widthAnchor](self->_progressView, "widthAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:", 24.0));
  v71[4] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView heightAnchor](self->_progressView, "heightAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView widthAnchor](self->_progressView, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v71[5] = v53;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView centerXAnchor](self->_progressView, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "centerXAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v71[6] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView centerYAnchor](self->_progressView, "centerYAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "centerYAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v71[7] = v45;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_backgroundViewForProgressView, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v71[8] = v41;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_backgroundViewForProgressView, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v71[9] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_backgroundViewForProgressView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
  v71[10] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_backgroundViewForProgressView, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));
  v71[11] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

}

- (void)prepareForReuse
{
  UGCARPPhotoCarouselViewModel *viewModel;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UGCPhotoThumbnailCheckmarkCollectionViewCell;
  -[UGCPhotoThumbnailCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  self->_checked = 0;
  self->_enabled = 1;
  self->_isLoading = 0;
  viewModel = self->_viewModel;
  self->_viewModel = 0;

  -[UGCPhotoThumbnailCheckmarkCollectionViewCell _updateCheckmarkImageView](self, "_updateCheckmarkImageView");
  -[UGCPhotoThumbnailCheckmarkCollectionViewCell _updateEnableStatus](self, "_updateEnableStatus");
  -[UGCPhotoThumbnailCheckmarkCollectionViewCell _updateLoadingState](self, "_updateLoadingState");
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    -[UGCPhotoThumbnailCheckmarkCollectionViewCell _updateCheckmarkImageView](self, "_updateCheckmarkImageView");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UGCPhotoThumbnailCheckmarkCollectionViewCell _updateEnableStatus](self, "_updateEnableStatus");
  }
}

- (void)setIsLoading:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    -[UGCPhotoThumbnailCheckmarkCollectionViewCell _updateLoadingState](self, "_updateLoadingState");
  }
}

- (void)setLoadingProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[MapsPieProgressView setProgress:animated:completion:](self->_progressView, "setProgress:animated:completion:", a4, a5, a3);
}

- (void)_updateLoadingState
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10036BCA8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateCheckmarkImageView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (self->_checked)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle.fill")));
    -[UIImageView setImage:](self->_checkmarkImageView, "setImage:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIImageView setTintColor:](self->_checkmarkImageView, "setTintColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  }
  else
  {
    -[UIImageView setImage:](self->_checkmarkImageView, "setImage:", 0);
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  v6 = (void *)v5;
  -[UIImageView setBackgroundColor:](self->_checkmarkImageView, "setBackgroundColor:", v5);

  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor")));
  v7 = objc_msgSend(v9, "CGColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_checkmarkImageView, "layer"));
  objc_msgSend(v8, "setBorderColor:", v7);

}

- (void)_updateEnableStatus
{
  _BOOL4 enabled;
  void *v3;
  double v4;
  id v5;

  enabled = self->_enabled;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v5 = v3;
  v4 = 1.0;
  if (!enabled)
    v4 = 0.5;
  objc_msgSend(v3, "setAlpha:", v4);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_backgroundViewForProgressView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end
