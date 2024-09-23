@implementation THNavigationBarController

- (THNavigationBarController)init
{
  THNavigationBarController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNavigationBarController;
  result = -[THNavigationBarController init](&v3, "init");
  if (result)
    result->_showHideDuration = 0.2;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[THNavigationBarController setBottomConstraint:](self, "setBottomConstraint:", 0);
  -[THNavigationBarController setTopConstraint:](self, "setTopConstraint:", 0);
  -[THNavigationBarController setNavigationBar:](self, "setNavigationBar:", 0);

  -[THNavigationBarController clearAutohideTimer](self, "clearAutohideTimer");
  v3.receiver = self;
  v3.super_class = (Class)THNavigationBarController;
  -[THNavigationBarController dealloc](&v3, "dealloc");
}

- (id)view
{
  return self->mNavigationBar;
}

- (void)setDelegate:(id)a3
{
  -[THNavigationBarController clearAutohideTimer](self, "clearAutohideTimer");
  self->mDelegate = (THNavigationBarControllerDelegate *)a3;
}

- (void)buildConstraintsFromParent:(id)a3 layoutGuide:(id)a4
{
  if (!self->mBottomConstraint && !self->mTopConstraint)
  {
    objc_msgSend(objc_msgSend(-[BCNavigationBar leftAnchor](self->mNavigationBar, "leftAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "leftAnchor")), "setActive:", 1);
    objc_msgSend(objc_msgSend(-[BCNavigationBar rightAnchor](self->mNavigationBar, "rightAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "rightAnchor")), "setActive:", 1);
    -[THNavigationBarController setTopConstraint:](self, "setTopConstraint:", objc_msgSend(-[BCNavigationBar topAnchor](self->mNavigationBar, "topAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(a4, "topAnchor"), 0.0));
    -[NSLayoutConstraint setActive:](-[THNavigationBarController topConstraint](self, "topConstraint"), "setActive:", 1);
    -[THNavigationBarController setBottomConstraint:](self, "setBottomConstraint:", objc_msgSend(-[BCNavigationBar bottomAnchor](self->mNavigationBar, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "topAnchor")));
    -[NSLayoutConstraint setActive:](-[THNavigationBarController bottomConstraint](self, "bottomConstraint"), "setActive:", 0);
  }
}

- (void)p_showNavigationBar
{
  -[BCNavigationBar setAlpha:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setAlpha:", 1.0);
  -[THNavigationBarController resetAutohideTimer](self, "resetAutohideTimer");
}

- (void)p_hideNavigationBar
{
  -[BCNavigationBar setAlpha:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setAlpha:", 0.0);
  -[THNavigationBarController clearAutohideTimer](self, "clearAutohideTimer");
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  _BOOL8 v8;
  _BOOL8 v9;
  _QWORD v11[6];
  BOOL v12;
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;
  BOOL v16;

  v8 = a4;
  v9 = a3;
  if (-[BCNavigationBar isHidden](-[THNavigationBarController navigationBar](self, "navigationBar"), "isHidden") != a3)
  {
    -[BCNavigationBar setHidden:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setHidden:", 0);
    -[THNavigationBarControllerDelegate willSetNavigationBarHidden:animated:](-[THNavigationBarController delegate](self, "delegate"), "willSetNavigationBarHidden:animated:", v9, v8);
    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_63078;
      v14[3] = &unk_427FB8;
      v14[4] = self;
      v15 = v9;
      v16 = v8;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_630C0;
      v11[3] = &unk_427FE0;
      v12 = v9;
      v11[4] = self;
      v11[5] = a6;
      v13 = v8;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v11, a5);
    }
    else
    {
      -[THNavigationBarControllerDelegate settingNavigationBarHidden:animated:](-[THNavigationBarController delegate](self, "delegate"), "settingNavigationBarHidden:animated:", v9, 0);
      if (v9)
        -[THNavigationBarController p_hideNavigationBar](self, "p_hideNavigationBar");
      else
        -[THNavigationBarController p_showNavigationBar](self, "p_showNavigationBar");
      -[BCNavigationBar setHidden:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setHidden:", v9);
      if (a6)
        (*((void (**)(id))a6 + 2))(a6);
      -[THNavigationBarControllerDelegate didSetNavigationBarHidden:animated:](-[THNavigationBarController delegate](self, "delegate"), "didSetNavigationBarHidden:animated:", v9, 0);
    }
  }
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  -[THNavigationBarController setNavigationBarHidden:animated:duration:completion:](self, "setNavigationBarHidden:animated:duration:completion:", a3, a4, 0, a5);
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  _BOOL8 v7;

  v6 = a4;
  v7 = a3;
  -[THNavigationBarController showHideDuration](self, "showHideDuration");
  -[THNavigationBarController setNavigationBarHidden:animated:duration:completion:](self, "setNavigationBarHidden:animated:duration:completion:", v7, v6, a5);
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[THNavigationBarController showHideDuration](self, "showHideDuration");
  -[THNavigationBarController setNavigationBarHidden:animated:duration:](self, "setNavigationBarHidden:animated:duration:", v5, v4);
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  -[THNavigationBarController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", a3, 0);
}

- (void)startNavigationBarFade
{
  -[BCNavigationBar setAlpha:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setAlpha:", 0.0);
}

- (void)completeNavigationBarFade
{
  -[THNavigationBarController p_hideNavigationBar](self, "p_hideNavigationBar");
  -[BCNavigationBar setAlpha:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setAlpha:", 1.0);
  -[BCNavigationBar setHidden:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setHidden:", 1);
}

- (void)p_autohideTimerAction
{
  if (-[THNavigationBarController delegate](self, "delegate")
    && -[THNavigationBarControllerDelegate shouldAutohideNavigationBar](-[THNavigationBarController delegate](self, "delegate"), "shouldAutohideNavigationBar"))
  {
    -[THNavigationBarController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, 1);
  }
  else
  {
    -[THNavigationBarController resetAutohideTimer](self, "resetAutohideTimer");
  }
}

- (void)clearAutohideTimer
{
  if (-[THNavigationBarController autohideTimer](self, "autohideTimer"))
  {
    -[NSTimer invalidate](-[THNavigationBarController autohideTimer](self, "autohideTimer"), "invalidate");
    -[THNavigationBarController setAutohideTimer:](self, "setAutohideTimer:", 0);
  }
}

- (void)resetAutohideTimer
{
  double v3;

  -[THNavigationBarController clearAutohideTimer](self, "clearAutohideTimer");
  -[THNavigationBarController autohideTimeout](self, "autohideTimeout");
  if (v3 > 0.0)
  {
    -[THNavigationBarController autohideTimeout](self, "autohideTimeout");
    -[THNavigationBarController setAutohideTimer:](self, "setAutohideTimer:", +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_autohideTimerAction", 0, 0));
  }
}

- (double)autohideTimeout
{
  return self->mAutohideTimeout;
}

- (void)setAutohideTimeout:(double)a3
{
  self->mAutohideTimeout = a3;
  -[THNavigationBarController resetAutohideTimer](self, "resetAutohideTimer");
}

- (void)setCenterTitle:(id)a3
{
  unsigned int v5;
  BCNavigationBar *v6;
  id v7;

  v5 = -[THNavigationBarControllerDelegate shouldShowChapterTitle](-[THNavigationBarController delegate](self, "delegate"), "shouldShowChapterTitle");
  v6 = -[THNavigationBarController navigationBar](self, "navigationBar");
  if (v5)
    v7 = a3;
  else
    v7 = 0;
  -[BCNavigationBar setTitle:](v6, "setTitle:", v7);
}

- (void)setLeftItems:(id)a3 rightItems:(id)a4
{
  id v7;

  v7 = -[BCNavigationBar isHidden](-[THNavigationBarController navigationBar](self, "navigationBar"), "isHidden");
  -[BCNavigationBar setHidden:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setHidden:", 0);
  -[BCNavigationBar setLeftItems:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setLeftItems:", a3);
  -[BCNavigationBar setRightItems:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setRightItems:", a4);
  -[BCNavigationBar setHidden:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setHidden:", v7);
}

- (void)updateViewStateWithThemeDelegate:(id)a3
{
  UIColor *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  UIColor *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  v5 = (UIColor *)objc_msgSend(a3, "titleColorForNavigationBar:", -[THNavigationBarController navigationBar](self, "navigationBar"));
  v6 = objc_msgSend(a3, "foregroundTintColorForNavigationBar:", -[THNavigationBarController navigationBar](self, "navigationBar"));
  v7 = objc_msgSend(a3, "backgroundColorForNavigationBar:", -[THNavigationBarController navigationBar](self, "navigationBar"));
  v8 = objc_msgSend(a3, "navigationBarIsTranslucent:", -[THNavigationBarController navigationBar](self, "navigationBar"));
  v9 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v9, "setParagraphStyle:", +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  objc_msgSend(v9, "setLineBreakMode:", 5);
  objc_msgSend(v9, "setAlignment:", 1);
  -[BCNavigationBar setTranslucent:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setTranslucent:", v8);
  v10 = v5;
  if (!v5)
    v10 = +[UIColor blackColor](UIColor, "blackColor");
  -[THNavigationBarController setCenterItemTextColor:](self, "setCenterItemTextColor:", v10);
  v11[0] = NSFontAttributeName;
  v12[0] = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0);
  v11[1] = NSForegroundColorAttributeName;
  v11[2] = NSParagraphStyleAttributeName;
  v12[1] = -[THNavigationBarController centerItemTextColor](self, "centerItemTextColor");
  v12[2] = v9;
  -[BCNavigationBar setTitleTextAttributes:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setTitleTextAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  -[THNavigationBarController setCenterItemTextColor:](self, "setCenterItemTextColor:", v5);
  -[BCNavigationBar setTintColor:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setTintColor:", v6);
  -[BCNavigationBar setBarTintColor:](-[THNavigationBarController navigationBar](self, "navigationBar"), "setBarTintColor:", v7);
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (BCNavigationBar)navigationBar
{
  return self->mNavigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSTimer)autohideTimer
{
  return self->mAutohideTimer;
}

- (void)setAutohideTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THNavigationBarControllerDelegate)delegate
{
  return self->mDelegate;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->mBottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSLayoutConstraint)topConstraint
{
  return self->mTopConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (UIColor)centerItemTextColor
{
  return self->_centerItemTextColor;
}

- (void)setCenterItemTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (double)showHideDuration
{
  return self->_showHideDuration;
}

- (void)setShowHideDuration:(double)a3
{
  self->_showHideDuration = a3;
}

@end
