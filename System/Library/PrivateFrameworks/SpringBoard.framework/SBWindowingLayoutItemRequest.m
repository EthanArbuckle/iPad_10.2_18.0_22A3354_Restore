@implementation SBWindowingLayoutItemRequest

- (SBWindowingLayoutItemRequest)init
{
  SBWindowingLayoutItemRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBWindowingLayoutItemRequest;
  result = -[SBWindowingLayoutItemRequest init](&v3, sel_init);
  if (result)
  {
    result->_layoutRole = 0;
    *(_OWORD *)&result->_size = xmmword_1D0E88E70;
    result->_wantsFocus = 0;
  }
  return result;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)wantsFocus
{
  return self->_wantsFocus;
}

- (void)setWantsFocus:(BOOL)a3
{
  self->_wantsFocus = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
