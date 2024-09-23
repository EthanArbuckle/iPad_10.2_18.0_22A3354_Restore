@implementation UIScrollViewSkipIsEnabled

void ____UIScrollViewSkipIsEnabled_block_invoke()
{
  double v0;
  id v1;

  if (((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_EnableUIScrollViewFrameSkip, (uint64_t)CFSTR("EnableUIScrollViewFrameSkip"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD769D4)&& !_UIVariableFrameDurationEnabled())
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_refreshRate");
    _MergedGlobals_118 = v0 < 0.01;

  }
  else
  {
    _MergedGlobals_118 = 0;
  }
}

@end
