@implementation UIViewPropertyAnimatorTrackingState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (UIViewPropertyAnimatorTrackingState)init
{
  UIViewPropertyAnimatorTrackingState *v2;
  NSUUID *v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIViewPropertyAnimatorTrackingState;
  v2 = -[UIViewPropertyAnimatorTrackingState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

    *(_DWORD *)&v2->_startPaused = 0x1000000;
    v2->_shouldLayoutSubviews = 1;
  }
  return v2;
}

- (BOOL)optimizationsEnabled
{
  return self->_optimizationsEnabled;
}

- (BOOL)startPaused
{
  return self->_startPaused;
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)scrubsLinearly
{
  return self->_scrubsLinearly;
}

- (void)setStartPaused:(BOOL)a3
{
  self->_startPaused = a3;
}

- (void)setScrubsLinearly:(BOOL)a3
{
  self->_scrubsLinearly = a3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (void)setOptimizationsEnabled:(BOOL)a3
{
  self->_optimizationsEnabled = a3;
}

- (BOOL)shouldLayoutSubviews
{
  return self->_shouldLayoutSubviews;
}

- (void)setShouldLayoutSubviews:(BOOL)a3
{
  self->_shouldLayoutSubviews = a3;
}

@end
