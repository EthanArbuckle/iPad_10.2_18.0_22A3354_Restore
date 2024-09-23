@implementation BKPictureBookScrollView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_touchInProgress = 1;
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookScrollView;
  -[BKPictureBookScrollView touchesBegan:withEvent:](&v4, "touchesBegan:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_touchInProgress = 0;
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookScrollView;
  -[BKPictureBookScrollView touchesEnded:withEvent:](&v4, "touchesEnded:withEvent:", a3, a4);
}

- (BOOL)touchInProgress
{
  return self->_touchInProgress;
}

- (void)setTouchInProgress:(BOOL)a3
{
  self->_touchInProgress = a3;
}

@end
