@implementation ICMovieCollectionViewCell

- (ICMovieCollectionViewCell)initWithFrame:(CGRect)a3
{
  ICMovieCollectionViewCell *v3;
  id v4;
  double y;
  double width;
  double height;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
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
  objc_super v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[2];

  v63.receiver = self;
  v63.super_class = (Class)ICMovieCollectionViewCell;
  v3 = -[ICImageCollectionViewCell initWithFrame:](&v63, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[ICMovieCollectionViewCell setBottomView:](v3, "setBottomView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    -[ICMovieCollectionViewCell addSubview:](v3, "addSubview:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](CAGradientLayer, "layer"));
    -[ICMovieCollectionViewCell setBottomGradient:](v3, "setBottomGradient:", v11);

    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v66[0] = objc_msgSend(v12, "CGColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v66[1] = objc_msgSend(v13, "CGColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomGradient](v3, "bottomGradient"));
    objc_msgSend(v15, "setColors:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomGradient](v3, "bottomGradient"));
    objc_msgSend(v16, "setStartPoint:", 0.0, 1.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomGradient](v3, "bottomGradient"));
    objc_msgSend(v17, "setEndPoint:", 0.0, 0.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomGradient](v3, "bottomGradient"));
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomGradient](v3, "bottomGradient"));
    objc_msgSend(v30, "addSublayer:", v31);

    v32 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("VideoCamera")));
    objc_msgSend(v32, "setImage:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    objc_msgSend(v34, "addSubview:", v32);

    v35 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[ICMovieCollectionViewCell setTimeLabel:](v3, "setTimeLabel:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell timeLabel](v3, "timeLabel"));
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 10.0));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "ic_fontWithSingleLineA"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell timeLabel](v3, "timeLabel"));
    objc_msgSend(v39, "setFont:", v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell timeLabel](v3, "timeLabel"));
    objc_msgSend(v41, "setTextColor:", v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell timeLabel](v3, "timeLabel"));
    objc_msgSend(v42, "addSubview:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v64[0] = CFSTR("bottomView");
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v65[0] = v45;
    v65[1] = v32;
    v64[1] = CFSTR("cameraIcon");
    v64[2] = CFSTR("timeLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell timeLabel](v3, "timeLabel"));
    v65[2] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 3));

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 8, 0, 0, 0, 1.0, 30.0));
    objc_msgSend(v44, "addObject:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, v50, 4, 1.0, 0.0));
    objc_msgSend(v44, "addObject:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](v3, "thumbnailView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v52, 5, 0, v53, 5, 1.0, 0.0));
    objc_msgSend(v44, "addObject:", v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](v3, "thumbnailView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](v3, "bottomView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 6, 0, v56, 6, 1.0, 0.0));
    objc_msgSend(v44, "addObject:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-8-[cameraIcon(18)]"), 0, 0, v47));
    objc_msgSend(v44, "addObjectsFromArray:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[cameraIcon(11)]-9-|"), 0, 0, v47));
    objc_msgSend(v44, "addObjectsFromArray:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[timeLabel]-10-|"), 0, 0, v47));
    objc_msgSend(v44, "addObjectsFromArray:", v60);

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[timeLabel]-8-|"), 0, 0, v47));
    objc_msgSend(v44, "addObjectsFromArray:", v61);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICMovieCollectionViewCell;
  -[ICImageCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomView](self, "bottomView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell bottomGradient](self, "bottomGradient"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)setAttachment:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICMovieCollectionViewCell;
  v4 = a3;
  -[ICImageCollectionViewCell setAttachment:](&v10, "setAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICMediaTimeFormatter timecodeFormatter](ICMediaTimeFormatter, "timecodeFormatter", v10.receiver, v10.super_class));
  objc_msgSend(v4, "duration");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromTimeInterval:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICMovieCollectionViewCell timeLabel](self, "timeLabel"));
  objc_msgSend(v9, "setText:", v8);

}

- (void)updateConstraints
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICMovieCollectionViewCell;
  -[ICImagesAndMoviesBaseCell updateConstraints](&v2, "updateConstraints");
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomView, a3);
}

- (CAGradientLayer)bottomGradient
{
  return self->_bottomGradient;
}

- (void)setBottomGradient:(id)a3
{
  objc_storeStrong((id *)&self->_bottomGradient, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_bottomGradient, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("movie"), &stru_1005704B8, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell itemNumberAccessibilityString](self, "itemNumberAccessibilityString"));
  v5 = __ICAccessibilityStringForVariables(1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieDurationForSpeaking"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "movieDurationForSpeaking"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modificationDateForSpeaking"));
  }
  v11 = (void *)v10;
  v12 = __ICAccessibilityStringForVariables(1, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

@end
