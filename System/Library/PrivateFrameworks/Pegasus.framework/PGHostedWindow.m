@implementation PGHostedWindow

- (PGHostedWindow)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  v10.receiver = self;
  v10.super_class = (Class)PGHostedWindow;
  return -[_UIHostedWindow initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureApplication initWithProcessIdentifier:].cold.1(self);

  v4.receiver = self;
  v4.super_class = (Class)PGHostedWindow;
  -[_UIHostedWindow dealloc](&v4, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

@end
