@implementation PBCameraButton

- (void)setEnabled:(BOOL)a3
{
  objc_super v3;

  if (!self->_lockEnabled)
  {
    v3.receiver = self;
    v3.super_class = (Class)PBCameraButton;
    -[PBCameraButton setEnabled:](&v3, "setEnabled:", a3);
  }
}

- (void)setLockEnabled:(BOOL)a3
{
  self->_lockEnabled = a3;
}

@end
