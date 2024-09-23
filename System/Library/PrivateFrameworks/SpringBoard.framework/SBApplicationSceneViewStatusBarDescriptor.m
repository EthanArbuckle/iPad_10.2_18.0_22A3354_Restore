@implementation SBApplicationSceneViewStatusBarDescriptor

- (BOOL)isForcedHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

- (SBApplicationSceneViewStatusBarDescriptor)initWithForceHidden:(BOOL)a3
{
  SBApplicationSceneViewStatusBarDescriptor *result;

  result = -[SBApplicationSceneViewStatusBarDescriptor init](self, "init");
  if (result)
    result->_forceHidden = a3;
  return result;
}

+ (id)statusBarDescriptorWithForceHidden:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithForceHidden:", a3);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: forceHidden: %d"), self, -[SBApplicationSceneViewStatusBarDescriptor isForcedHidden](self, "isForcedHidden"));
}

@end
