@implementation THPageThumbnailViewTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THPageThumbnailViewTapGestureRecognizer;
  -[THPageThumbnailViewTapGestureRecognizer touchesBegan:withEvent:](&v6, "touchesBegan:withEvent:", a3, a4);
  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THPageThumbnailViewTapGestureDelegate, -[THPageThumbnailViewTapGestureRecognizer delegate](self, "delegate"));
  if (v5)
    objc_msgSend(v5, "touchesBeganFromTap:", self);
}

- (void)reset
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THPageThumbnailViewTapGestureRecognizer;
  -[THPageThumbnailViewTapGestureRecognizer reset](&v4, "reset");
  v3 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THPageThumbnailViewTapGestureDelegate, -[THPageThumbnailViewTapGestureRecognizer delegate](self, "delegate"));
  if (v3)
    objc_msgSend(v3, "gestureReset:", self);
}

@end
