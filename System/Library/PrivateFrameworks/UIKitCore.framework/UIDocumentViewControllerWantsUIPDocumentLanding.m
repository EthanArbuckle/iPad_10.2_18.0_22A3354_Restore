@implementation UIDocumentViewControllerWantsUIPDocumentLanding

void ___UIDocumentViewControllerWantsUIPDocumentLanding_block_invoke()
{
  void *v0;
  unint64_t v1;
  char v2;
  char v3;
  int v4;
  BOOL v5;
  BOOL v6;
  int v7;

  +[UITraitCollection _fallbackTraitCollection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  _MergedGlobals_21_4 = v1 < 2;
  v2 = _os_feature_enabled_impl();
  if (_MergedGlobals_21_4)
    v3 = v2;
  else
    v3 = 0;
  _MergedGlobals_21_4 = v3;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v4 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v7 = _UIInternalPreference_ForceDocumentViewControllerDocumentLanding,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ForceDocumentViewControllerDocumentLanding))
  {
    v5 = 0;
  }
  else
  {
    do
    {
      v5 = v4 < v7;
      if (v4 < v7)
        break;
      _UIInternalPreferenceSync(v4, &_UIInternalPreference_ForceDocumentViewControllerDocumentLanding, (uint64_t)CFSTR("ForceDocumentViewControllerDocumentLanding"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v7 = _UIInternalPreference_ForceDocumentViewControllerDocumentLanding;
    }
    while (v4 != _UIInternalPreference_ForceDocumentViewControllerDocumentLanding);
  }
  if (byte_1EDDA80E4)
    v6 = v5;
  else
    v6 = 0;
  _MergedGlobals_21_4 |= v6;
}

@end
