@implementation _SBStatusBarLocalDataOverridesWrapper

- (void)dealloc
{
  $FD1E8FE3C53903254DEBF6763FC8E170 *overrides;
  objc_super v4;

  overrides = self->_overrides;
  if (overrides)
    free(overrides);
  v4.receiver = self;
  v4.super_class = (Class)_SBStatusBarLocalDataOverridesWrapper;
  -[_SBStatusBarLocalDataOverridesWrapper dealloc](&v4, sel_dealloc);
}

- (void)setOverrides:(id *)a3
{
  $FD1E8FE3C53903254DEBF6763FC8E170 *overrides;

  overrides = self->_overrides;
  if (overrides != a3)
  {
    if (a3)
    {
      if (!overrides)
      {
        overrides = ($FD1E8FE3C53903254DEBF6763FC8E170 *)malloc_type_malloc(0xF68uLL, 0x100004064C31AF5uLL);
        self->_overrides = overrides;
      }
      memcpy(overrides, a3, sizeof($FD1E8FE3C53903254DEBF6763FC8E170));
    }
    else if (overrides)
    {
      free(overrides);
      self->_overrides = 0;
    }
  }
}

- ($FD1E8FE3C53903254DEBF6763FC8E170)overrides
{
  return self->_overrides;
}

@end
