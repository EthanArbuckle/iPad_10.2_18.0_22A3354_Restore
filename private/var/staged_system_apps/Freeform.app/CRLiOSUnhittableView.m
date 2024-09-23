@implementation CRLiOSUnhittableView

- (CRLiOSUnhittableView)init
{
  CRLiOSUnhittableView *v2;
  CRLiOSUnhittableView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSUnhittableView;
  v2 = -[CRLiOSUnhittableView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLiOSUnhittableView p_commonInit](v2, "p_commonInit");
  return v3;
}

- (CRLiOSUnhittableView)initWithCoder:(id)a3
{
  CRLiOSUnhittableView *v3;
  CRLiOSUnhittableView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSUnhittableView;
  v3 = -[CRLiOSUnhittableView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLiOSUnhittableView p_commonInit](v3, "p_commonInit");
  return v4;
}

- (CRLiOSUnhittableView)initWithFrame:(CGRect)a3
{
  CRLiOSUnhittableView *v3;
  CRLiOSUnhittableView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSUnhittableView;
  v3 = -[CRLiOSUnhittableView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CRLiOSUnhittableView p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)p_commonInit
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CRLiOSUnhittableView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[CRLiOSUnhittableView setOpaque:](self, "setOpaque:", 0);
  -[CRLiOSUnhittableView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  CRLiOSUnhittableView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLiOSUnhittableView;
  v5 = -[CRLiOSUnhittableView hitTest:withEvent:](&v8, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (CRLiOSUnhittableView *)objc_claimAutoreleasedReturnValue(v5);
  if (v6 == self)
  {

    v6 = 0;
  }
  return v6;
}

@end
