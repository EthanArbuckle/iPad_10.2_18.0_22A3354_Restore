@implementation MapsRippleAnnotationView

- (MapsRippleAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  MapsRippleAnnotationView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsRippleAnnotationView;
  v7 = -[MapsRippleAnnotationView initWithAnnotation:reuseIdentifier:](&v11, "initWithAnnotation:reuseIdentifier:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rippleView"));
    objc_msgSend(v8, "frame");
    -[MapsRippleAnnotationView setFrame:](v7, "setFrame:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rippleView"));
    -[MapsRippleAnnotationView addSubview:](v7, "addSubview:", v9);

  }
  return v7;
}

@end
