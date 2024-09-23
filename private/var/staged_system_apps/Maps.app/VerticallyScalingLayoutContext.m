@implementation VerticallyScalingLayoutContext

- (VerticallyScalingLayoutContext)initWithContainer:(id)a3
{
  id v5;
  VerticallyScalingLayoutContext *v6;
  VerticallyScalingLayoutContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VerticallyScalingLayoutContext;
  v6 = -[MapsAutoLayoutContext init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_container, a3);

  return v7;
}

- (id)verticallyScaleView:(id)a3 attribute:(int64_t)a4 withRatio:(double)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, 0, self->_container, 4, a5, 0.0));
  -[MapsAutoLayoutContext addConstraint:](self, "addConstraint:", v6);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
