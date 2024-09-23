@implementation UIUScreenShot

- (UIUScreenShot)initWithContents:(id)a3
{
  ScreenShotCompat *v4;
  UIUScreenShot *v5;
  ScreenShotCompat *underlyingObject;
  objc_super v8;

  v4 = (ScreenShotCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIUScreenShot;
  v5 = -[UIUScreenShot init](&v8, sel_init);
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (ScreenShotCompat)underlyingObject
{
  return (ScreenShotCompat *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
