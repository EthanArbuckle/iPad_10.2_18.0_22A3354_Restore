@implementation MapsRecordAnIssuePanView

- (MapsRecordAnIssuePanView)initWithParent:(id)a3
{
  id v4;
  MapsRecordAnIssuePanView *v5;
  MapsRecordAnIssuePanView *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v53;
  _QWORD v54[4];
  MapsRecordAnIssuePanView *v55;
  double v56;
  double v57;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)MapsRecordAnIssuePanView;
  v5 = -[MapsRecordAnIssuePanView initWithFrame:](&v58, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    -[MapsRecordAnIssuePanView setParentController:](v5, "setParentController:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

    objc_msgSend(v8, "frame");
    v10 = v9 * 0.5;
    objc_msgSend(v8, "frame");
    v12 = v11 + -100.0;
    -[MapsRecordAnIssuePanView setFrame:](v6, "setFrame:", v10, v11 + -100.0, 40.0, 40.0);
    -[MapsRecordAnIssuePanView setCenter:](v6, "setCenter:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
    -[MapsRecordAnIssuePanView setEffect:](v6, "setEffect:", v13);

    -[MapsRecordAnIssuePanView setAlpha:](v6, "setAlpha:", 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView layer](v6, "layer"));
    objc_msgSend(v14, "setCornerRadius:", 20.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView layer](v6, "layer"));
    objc_msgSend(v15, "setMasksToBounds:", 1);

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPMapIcon")));
    v16 = objc_alloc((Class)UIImageView);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView convertImageToGrayScale:](v6, "convertImageToGrayScale:", v53));
    v18 = objc_msgSend(v16, "initWithImage:", v17);

    objc_msgSend(v18, "setContentMode:", 1);
    objc_msgSend(v18, "setFrame:", 20.0, 0.0, 25.0, 25.0);
    objc_msgSend(v18, "center");
    objc_msgSend(v18, "setCenter:");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v19, "setCornerRadius:", 8.0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v20, "setMasksToBounds:", 1);

    objc_msgSend(v18, "setAlpha:", 0.5);
    -[MapsRecordAnIssuePanView setMapIcon:](v6, "setMapIcon:", v18);
    -[MapsRecordAnIssuePanView addSubview:](v6, "addSubview:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.5));
    v22 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 60.0, 0.0, 125.0, 40.0);
    -[MapsRecordAnIssuePanView setEndLabel:](v6, "setEndLabel:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView endLabel](v6, "endLabel"));
    objc_msgSend(v23, "setText:", CFSTR("End Recording"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView endLabel](v6, "endLabel"));
    objc_msgSend(v25, "setTextColor:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView endLabel](v6, "endLabel"));
    objc_msgSend(v26, "setFont:", v21);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView endLabel](v6, "endLabel"));
    objc_msgSend(v27, "sizeToFit");

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView endLabel](v6, "endLabel"));
    objc_msgSend(v28, "center");
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView endLabel](v6, "endLabel"));
    objc_msgSend(v31, "setCenter:", v30, 20.0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView endLabel](v6, "endLabel"));
    -[MapsRecordAnIssuePanView addSubview:](v6, "addSubview:", v32);

    v33 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 12.0, 12.0);
    -[MapsRecordAnIssuePanView setRedView:](v6, "setRedView:", v33);

    objc_msgSend(v18, "center");
    v35 = v34;
    objc_msgSend(v18, "center");
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](v6, "redView"));
    objc_msgSend(v38, "setCenter:", v35, v37);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](v6, "redView"));
    objc_msgSend(v39, "frame");
    v41 = v40 * 0.5;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](v6, "redView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layer"));
    objc_msgSend(v43, "setCornerRadius:", v41);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](v6, "redView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
    objc_msgSend(v45, "setMasksToBounds:", 1);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](v6, "redView"));
    objc_msgSend(v47, "setBackgroundColor:", v46);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](v6, "redView"));
    -[MapsRecordAnIssuePanView addSubview:](v6, "addSubview:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](v6, "redView"));
    -[MapsRecordAnIssuePanView bringSubviewToFront:](v6, "bringSubviewToFront:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v6, "changeColor", 0, 1, 0.5));
    -[MapsRecordAnIssuePanView setRecordTimer:](v6, "setRecordTimer:", v50);

    -[MapsRecordAnIssuePanView setRed:](v6, "setRed:", 1);
    v51 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v6, "endRecording");
    -[MapsRecordAnIssuePanView addGestureRecognizer:](v6, "addGestureRecognizer:", v51);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10096AF38;
    v54[3] = &unk_1011AED30;
    v55 = v6;
    v56 = v10;
    v57 = v12;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v54, 0.3);

  }
  return v6;
}

- (id)convertImageToGrayScale:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGColorSpace *DeviceGray;
  double v9;
  size_t v10;
  double v11;
  CGContext *v12;
  id v13;
  CGImage *v14;
  CGImageRef Image;
  void *v16;
  CGRect v18;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "size");
  v7 = v6;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  objc_msgSend(v3, "size");
  v10 = (unint64_t)v9;
  objc_msgSend(v3, "size");
  v12 = CGBitmapContextCreate(0, v10, (unint64_t)v11, 8uLL, 0, DeviceGray, 0);
  v13 = objc_retainAutorelease(v3);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v5;
  v18.size.height = v7;
  CGContextDrawImage(v12, v18, v14);
  Image = CGBitmapContextCreateImage(v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", Image));
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v12);
  CFRelease(Image);
  return v16;
}

- (void)changeColor
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[MapsRecordAnIssuePanView red](self, "red"))
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRecordAnIssuePanView redView](self, "redView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[MapsRecordAnIssuePanView setRed:](self, "setRed:", -[MapsRecordAnIssuePanView red](self, "red") ^ 1);
}

- (void)mapsRecordAnIssueEndViewPan:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v29;
  id v30;

  v30 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  objc_msgSend(v6, "frame");
  v8 = v7;
  objc_msgSend(v6, "frame");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  objc_msgSend(v11, "frame");
  v15 = v14;
  objc_msgSend(v30, "translationInView:", v6);
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "center");
  v21 = v17 + v20;
  objc_msgSend(v11, "center");
  v23 = v19 + v22;
  v24 = v13 * 0.5 + v21;
  if (v21 - v13 * 0.5 < 0.0 || v24 > v8)
  {
    objc_msgSend(v11, "center", v24);
    v21 = v26;
  }
  v27 = v15 * 0.5 + v23;
  if (v23 - v15 * 0.5 < 0.0 || v27 > v10)
  {
    objc_msgSend(v11, "center", v27);
    v23 = v29;
  }
  objc_msgSend(v11, "setCenter:", v21, v23);
  objc_msgSend(v30, "setTranslation:inView:", v11, CGPointZero.x, CGPointZero.y);
  objc_msgSend(v6, "bringSubviewToFront:", v11);

}

- (void)endRecording
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  v6 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  objc_msgSend(v6, "setColor:", v7);

  objc_msgSend(v5, "frame");
  v9 = v8 * 0.5;
  objc_msgSend(v5, "frame");
  objc_msgSend(v6, "setCenter:", v9, v10 * 0.5);
  objc_msgSend(v5, "addSubview:", v6);
  objc_msgSend(v6, "startAnimating");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10096B3CC;
  v13[3] = &unk_1011AD238;
  v13[4] = self;
  v14 = v6;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[MapsEventRecorder defaultRecorder](MapsEventRecorder, "defaultRecorder"));
  v11 = v15;
  v12 = v6;
  objc_msgSend(v11, "endRecordingWithCompletion:", v13);

}

- (MapsRecordAnIssueDebugController)parentController
{
  return (MapsRecordAnIssueDebugController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (UILabel)endLabel
{
  return self->_endLabel;
}

- (void)setEndLabel:(id)a3
{
  objc_storeStrong((id *)&self->_endLabel, a3);
}

- (NSTimer)recordTimer
{
  return self->_recordTimer;
}

- (void)setRecordTimer:(id)a3
{
  objc_storeStrong((id *)&self->_recordTimer, a3);
}

- (UIView)redView
{
  return self->_redView;
}

- (void)setRedView:(id)a3
{
  objc_storeStrong((id *)&self->_redView, a3);
}

- (UIImageView)mapIcon
{
  return self->_mapIcon;
}

- (void)setMapIcon:(id)a3
{
  objc_storeStrong((id *)&self->_mapIcon, a3);
}

- (BOOL)red
{
  return self->_red;
}

- (void)setRed:(BOOL)a3
{
  self->_red = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapIcon, 0);
  objc_storeStrong((id *)&self->_redView, 0);
  objc_storeStrong((id *)&self->_recordTimer, 0);
  objc_storeStrong((id *)&self->_endLabel, 0);
  objc_destroyWeak((id *)&self->_parentController);
}

@end
