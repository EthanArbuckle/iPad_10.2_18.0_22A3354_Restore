@implementation UIScrollViewVFDGetSettings

uint64_t ___UIScrollViewVFDGetSettings_block_invoke()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v0 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
  if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_918, (uint64_t)CFSTR("ScrollViewVFDStaticTable"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId))v1 = 0;
  else
    v1 = (_QWORD *)qword_1ECD768B8;
  v2 = _UIScrollViewVFDTableFromString(v1);
  if (v0 == 1)
    v3 = &_UIScrollViewVFDDefaultConfig_iPad;
  else
    v3 = &_UIScrollViewVFDDefaultConfig_iPhone;
  if (v0 == 1)
    v4 = &unk_1E16E3A08;
  else
    v4 = &unk_1E16E3A30;
  if (v2)
    v3 = v2;
  qword_1EDDB0C70 = (uint64_t)v3;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD768C0, (uint64_t)CFSTR("ScrollViewVFDDynamicTable"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId))v5 = 0;
  else
    v5 = (_QWORD *)qword_1ECD768C8;
  v6 = _UIScrollViewVFDTableFromString(v5);
  if (v6)
    v7 = (uint64_t)v6;
  else
    v7 = (uint64_t)v4;
  qword_1EDDB0C78 = v7;
  result = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD768D0, (uint64_t)CFSTR("ScrollViewVFDStaticRateRangeMinFrames"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  v9 = qword_1ECD768D8;
  if ((_DWORD)result)
    v9 = -1;
  if (v9 < 0)
    LODWORD(v9) = 5;
  _MergedGlobals_34 = v9;
  return result;
}

@end
