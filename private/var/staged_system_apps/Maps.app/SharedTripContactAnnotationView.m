@implementation SharedTripContactAnnotationView

- (SharedTripContactAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 imageSideLength:(double)a5
{
  SharedTripContactAnnotationView *v6;
  SharedTripContactAnnotationView *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  UIImageView *v12;
  UIImageView *imageView;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SharedTripContactAnnotationView;
  v6 = -[SharedTripContactAnnotationView initWithAnnotation:reuseIdentifier:](&v27, "initWithAnnotation:reuseIdentifier:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_desiredImageSideLength = a5;
    v6->_insetImageSideLength = a5 + -4.0;
    v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v6->_desiredImageSideLength, v6->_desiredImageSideLength);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(v8, "setClipsToBounds:", 1);
    v10 = v7->_desiredImageSideLength * 0.5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v11, "setCornerRadius:", v10);

    -[SharedTripContactAnnotationView addSubview:](v7, "addSubview:", v8);
    v12 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 2.0, 2.0, v7->_insetImageSideLength, v7->_insetImageSideLength);
    imageView = v7->_imageView;
    v7->_imageView = v12;

    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v7->_imageView, "setClipsToBounds:", 1);
    v14 = v7->_insetImageSideLength * 0.5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v7->_imageView, "layer"));
    objc_msgSend(v15, "setCornerRadius:", v14);

    -[SharedTripContactAnnotationView addSubview:](v7, "addSubview:", v7->_imageView);
    -[SharedTripContactAnnotationView setCanShowCallout:](v7, "setCanShowCallout:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[SharedTripContactAnnotationView setBackgroundColor:](v7, "setBackgroundColor:", v16);

    v17 = v7->_desiredImageSideLength * 0.5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView layer](v7, "layer"));
    objc_msgSend(v18, "setCornerRadius:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView layer](v7, "layer"));
    objc_msgSend(v19, "setShadowRadius:", 4.0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView layer](v7, "layer"));
    objc_msgSend(v20, "setShadowOffset:", 0.0, 0.0);

    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor")));
    v22 = objc_msgSend(v21, "CGColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView layer](v7, "layer"));
    objc_msgSend(v23, "setShadowColor:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView layer](v7, "layer"));
    LODWORD(v25) = 0.25;
    objc_msgSend(v24, "setShadowOpacity:", v25);

    -[SharedTripContactAnnotationView loadImage](v7, "loadImage");
  }
  return v7;
}

- (void)setAnnotation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SharedTripContactAnnotationView;
  -[SharedTripContactAnnotationView setAnnotation:](&v4, "setAnnotation:", a3);
  -[SharedTripContactAnnotationView loadImage](self, "loadImage");
}

- (void)prepareForReuse
{
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
}

- (id)state
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView annotation](self, "annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "state"));

  return v3;
}

- (id)contact
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "senderInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localContactIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "senderInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localContactIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactForCNContactIdentifier:", v7));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadImage
{
  void *v3;
  void *v4;
  double insetImageSideLength;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView contact](self, "contact"));
  objc_initWeak(&location, self);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    insetImageSideLength = self->_insetImageSideLength;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100259C40;
    v7[3] = &unk_1011ADDF0;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "getImageForContact:size:completion:", v3, v7, insetImageSideLength);

    objc_destroyWeak(&v8);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("SharedTrip")));
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);

  }
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
