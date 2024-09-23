@implementation SBSnapshotWindow

- (SBSnapshotWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  SBSnapshotWindow *v10;
  SBSnapshotWindow *v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SBSnapshotWindow;
  v10 = -[SBSnapshotWindow initWithWindowScene:](&v13, sel_initWithWindowScene_, a3);
  v11 = v10;
  if (v10)
  {
    -[SBSnapshotWindow setFrame:](v10, "setFrame:", x, y, width, height);
    v11->_orientation = a5;
  }
  return v11;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (int64_t)interfaceOrientation
{
  return self->_orientation;
}

@end
