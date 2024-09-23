@implementation SXSolidBorderView

- (SXSolidBorderView)initWithStrokeStyle:(id)a3
{
  id v5;
  SXSolidBorderView *v6;
  SXSolidBorderView *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXSolidBorderView;
  v6 = -[SXSolidBorderView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_strokeStyle, a3);
    objc_msgSend(v5, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXSolidBorderView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  }
  return v7;
}

- (SXStrokeStyle)strokeStyle
{
  return self->_strokeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeStyle, 0);
}

@end
