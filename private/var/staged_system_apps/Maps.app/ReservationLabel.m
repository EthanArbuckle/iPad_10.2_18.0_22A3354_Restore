@implementation ReservationLabel

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ReservationLabel;
  -[ReservationLabel layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabel delegate](self, "delegate"));
  objc_msgSend(v3, "reservationLabelDidLayout:", self);

}

- (BOOL)textFits
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double Width;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double Height;
  void *v18;
  double v19;
  uint64_t v20;
  BOOL v21;
  NSAttributedStringKey v23;
  void *v24;
  CGRect v25;
  CGRect v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabel text](self, "text"));
  if (!objc_msgSend(v3, "length"))
  {

    return 1;
  }
  v4 = -[ReservationLabel numberOfLines](self, "numberOfLines");

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabel font](self, "font"));
  v23 = NSFontAttributeName;
  v24 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  -[ReservationLabel bounds](self, "bounds");
  Width = CGRectGetWidth(v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabel text](self, "text"));
  objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 3, v6, 0, Width, 1.79769313e308);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  Height = CGRectGetHeight(v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabel font](self, "font"));
  objc_msgSend(v18, "lineHeight");
  v20 = vcvtmd_s64_f64(Height / v19);

  v21 = (uint64_t)-[ReservationLabel numberOfLines](self, "numberOfLines") >= v20;
  return v21;
}

- (ReservationLabelLayoutDelegate)delegate
{
  return (ReservationLabelLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
