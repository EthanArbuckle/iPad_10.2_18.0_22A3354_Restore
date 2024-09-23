@implementation THWTransportControlLayout

- (THWTransportControlLayout)init
{
  THWTransportControlLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWTransportControlLayout;
  v2 = -[THWTransportControlLayout initWithInfo:](&v4, "initWithInfo:", 0);
  if (v2)
  {
    v2->_restartButtonLayout = -[THWControlLayout initWithTag:]([THWButtonControlLayout alloc], "initWithTag:", 0);
    v2->_previousButtonLayout = -[THWControlLayout initWithTag:]([THWButtonControlLayout alloc], "initWithTag:", 1);
    v2->_nextButtonLayout = -[THWControlLayout initWithTag:]([THWButtonControlLayout alloc], "initWithTag:", 2);
    v2->_labelLayout = -[THWControlLayout initWithTag:]([THWLabelControlLayout alloc], "initWithTag:", 3);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWTransportControlRep, a2);
}

- (id)dependentLayouts
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_restartButtonLayout, self->_previousButtonLayout, self->_nextButtonLayout, self->_labelLayout, 0);
}

- (id)additionalLayouts
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_restartButtonLayout, self->_previousButtonLayout, self->_nextButtonLayout, self->_labelLayout, 0);
}

- (id)layoutGeometryForLayout:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v9;
  double v10;
  id v12;
  double v13;
  double v14;
  id v15;
  double MidX;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v22.origin.x = TSDRectWithSize(-[THWTransportControlLayout frame](self, "frame"));
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v9 = (CGRectGetHeight(v22) - v22.size.height) * 0.5;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v10 = CGRectGetHeight(v23);
  if (self->_restartButtonLayout == a3)
  {
    v12 = objc_alloc((Class)TSDLayoutGeometry);
    v13 = 35.0;
    v14 = 0.0;
LABEL_10:
    v18 = v9;
    v19 = height;
    return objc_msgSend(v12, "initWithFrame:", v14, v18, v13, v19);
  }
  if (self->_previousButtonLayout == a3)
  {
    v15 = objc_alloc((Class)TSDLayoutGeometry);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MidX = CGRectGetMidX(v24) + -40.0;
    v17 = -35.0;
LABEL_9:
    v14 = MidX + v17;
    v13 = 35.0;
    v12 = v15;
    goto LABEL_10;
  }
  if (self->_nextButtonLayout == a3)
  {
    v15 = objc_alloc((Class)TSDLayoutGeometry);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MidX = CGRectGetMidX(v25);
    v17 = 40.0;
    goto LABEL_9;
  }
  if (self->_labelLayout != a3)
    return 0;
  v20 = (v10 - height) * 0.5;
  v21 = objc_alloc((Class)TSDLayoutGeometry);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27.origin.x = CGRectGetMidX(v26) + -40.0;
  v27.size.width = 80.0;
  v27.origin.y = v20;
  v27.size.height = height;
  *(CGRect *)&v14 = CGRectIntegral(v27);
  v12 = v21;
  return objc_msgSend(v12, "initWithFrame:", v14, v18, v13, v19);
}

- (THWButtonControlLayout)restartButtonLayout
{
  return self->_restartButtonLayout;
}

- (void)setRestartButtonLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (THWButtonControlLayout)previousButtonLayout
{
  return self->_previousButtonLayout;
}

- (void)setPreviousButtonLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (THWButtonControlLayout)nextButtonLayout
{
  return self->_nextButtonLayout;
}

- (void)setNextButtonLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (THWLabelControlLayout)labelLayout
{
  return self->_labelLayout;
}

- (void)setLabelLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

@end
