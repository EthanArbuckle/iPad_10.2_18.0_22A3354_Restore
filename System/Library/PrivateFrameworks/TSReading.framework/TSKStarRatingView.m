@implementation TSKStarRatingView

- (void)p_setupGestureRecognizers
{
  TSKHorizontalDragRecognizer *v3;
  void *v4;
  id v5;

  v3 = -[TSKHorizontalDragRecognizer initWithTarget:action:]([TSKHorizontalDragRecognizer alloc], "initWithTarget:action:", self, sel_p_horizontalDrag_);
  self->mDragGesture = v3;
  -[TSKStarRatingView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_p_horizontalDrag_);
  objc_msgSend(v4, "setMinimumPressDuration:", 0.2);
  -[TSKStarRatingView addGestureRecognizer:](self, "addGestureRecognizer:", v4);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_p_tapped_);
  -[TSKStarRatingView addGestureRecognizer:](self, "addGestureRecognizer:", v5);

}

- (TSKStarRatingView)initWithFrame:(CGRect)a3
{
  TSKStarRatingView *v3;
  TSKStarRatingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKStarRatingView;
  v3 = -[TSKStarRatingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TSKStarRatingView p_setupGestureRecognizers](v3, "p_setupGestureRecognizers");
    -[TSKStarRatingView setShowsDots:](v4, "setShowsDots:", 1);
    -[TSKStarRatingView setColor:](v4, "setColor:", objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"));
  }
  return v4;
}

- (TSKStarRatingView)initWithCoder:(id)a3
{
  TSKStarRatingView *v3;
  TSKStarRatingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKStarRatingView;
  v3 = -[TSKStarRatingView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[TSKStarRatingView p_setupGestureRecognizers](v3, "p_setupGestureRecognizers");
    -[TSKStarRatingView setShowsDots:](v4, "setShowsDots:", 1);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKStarRatingView;
  -[TSKStarRatingView dealloc](&v3, sel_dealloc);
}

- (int64_t)p_starRatingForLocation:(double)a3
{
  double v4;
  double v5;

  -[TSKStarRatingView bounds](self, "bounds");
  v5 = a3 / v4;
  if (a3 / v4 < 0.0500000007)
    return 0;
  if (v5 < 0.200000003)
    return 1;
  if (v5 < 0.400000006)
    return 2;
  if (v5 < 0.600000024)
    return 3;
  if (v5 >= 0.800000012)
    return 5;
  return 4;
}

- (int64_t)p_starRatingForGesture:(id)a3
{
  objc_msgSend(a3, "locationOfTouch:inView:", 0, self);
  return -[TSKStarRatingView p_starRatingForLocation:](self, "p_starRatingForLocation:");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", self);
  -[TSKStarRatingView setValue:](self, "setValue:", -[TSKStarRatingView p_starRatingForLocation:](self, "p_starRatingForLocation:"));
  -[TSKStarRatingView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4097);
}

- (void)p_tapped:(id)a3
{
  -[TSKStarRatingView setValue:](self, "setValue:", -[TSKStarRatingView p_starRatingForGesture:](self, "p_starRatingForGesture:", a3));
  -[TSKStarRatingView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (void)p_horizontalDrag:(id)a3
{
  uint64_t v5;
  int64_t mRatingOnFingerDown;

  v5 = 64;
  switch(objc_msgSend(a3, "state"))
  {
    case 1:
      self->mRatingOnFingerDown = self->mRating;
      mRatingOnFingerDown = -[TSKStarRatingView p_starRatingForGesture:](self, "p_starRatingForGesture:", a3);
      v5 = 1;
      goto LABEL_5;
    case 2:
      mRatingOnFingerDown = -[TSKStarRatingView p_starRatingForGesture:](self, "p_starRatingForGesture:", a3);
      v5 = 4096;
      goto LABEL_5;
    case 3:
      goto LABEL_6;
    case 4:
      mRatingOnFingerDown = self->mRatingOnFingerDown;
      v5 = 256;
LABEL_5:
      -[TSKStarRatingView setValue:](self, "setValue:", mRatingOnFingerDown);
LABEL_6:
      -[TSKStarRatingView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", v5);
      break;
    default:
      return;
  }
}

- (void)willMoveToSuperview:(id)a3
{
  uint64_t v5;

  while (1)
  {
    objc_opt_class();
    v5 = TSUDynamicCast();
    if (v5)
      break;
    a3 = (id)objc_msgSend(a3, "superview");
    if (!a3)
      return;
  }
  -[TSKHorizontalDragRecognizer setContainingScrollView:](self->mDragGesture, "setContainingScrollView:", v5);
}

- (void)setShowsDots:(BOOL)a3
{
  self->mShowsDots = a3;
  -[TSKStarRatingView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setValue:(int64_t)a3
{
  double v4;

  TSUClamp();
  self->mRating = (uint64_t)v4;
  -[TSKStarRatingView setNeedsDisplay](self, "setNeedsDisplay");
}

- (int64_t)value
{
  return self->mRating;
}

- (void)drawRect:(CGRect)a3
{
  -[objc_class renderRating:intoContext:rect:style:showDots:color:](-[TSKStarRatingView renderClass](self, "renderClass"), "renderRating:intoContext:rect:style:showDots:color:", self->mRating, UIGraphicsGetCurrentContext(), -[TSKStarRatingView style](self, "style"), -[TSKStarRatingView showsDots](self, "showsDots"), -[TSKStarRatingView color](self, "color"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (void)renderRating:(int64_t)a3 intoContext:(CGContext *)a4 rect:(CGRect)a5 style:(int)a6 showDots:(BOOL)a7
{
  +[TSKStarRatingViewRenderer renderRating:intoContext:rect:style:showDots:color:](TSKStarRatingViewRenderer, "renderRating:intoContext:rect:style:showDots:color:", a3, a4, *(_QWORD *)&a6, a7, objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (CGPath)newStarPath:(double)a3
{
  return +[TSKStarRatingViewRenderer newStarPath:](TSKStarRatingViewRenderer, "newStarPath:", a3);
}

- (Class)renderClass
{
  return (Class)objc_opt_class();
}

- (int)style
{
  return self->mStyle;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (BOOL)showsDots
{
  return self->mShowsDots;
}

- (TSUColor)color
{
  return self->mColor;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

@end
