@implementation UIViewShouldUpdateTraitCollectionOnlyWhenProcessingChanges

void ___UIViewShouldUpdateTraitCollectionOnlyWhenProcessingChanges_block_invoke()
{
  int v0;
  uint64_t v1;
  char v2;
  void *v3;

  v0 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ViewTraitCollectionUpdateMode, (uint64_t)CFSTR("ViewTraitCollectionUpdateMode"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  v1 = qword_1ECD76AE0;
  if (v0)
    v1 = 0;
  if (v1 == -1)
    goto LABEL_9;
  if (v1 == 1)
  {
    v2 = 1;
    goto LABEL_12;
  }
  if (!dyld_program_sdk_at_least())
  {
LABEL_9:
    v2 = 0;
    goto LABEL_12;
  }
  _UIMainBundleIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilecal")) ^ 1;

LABEL_12:
  byte_1EDDCA61D = v2;
}

@end
