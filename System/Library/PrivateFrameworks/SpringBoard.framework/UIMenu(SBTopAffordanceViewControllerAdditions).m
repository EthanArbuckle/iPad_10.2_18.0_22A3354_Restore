@implementation UIMenu(SBTopAffordanceViewControllerAdditions)

- (uint64_t)_sb_setSurfacesSelectionState:()SBTopAffordanceViewControllerAdditions
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_supportsSurfacingSelectionState");
  if ((_DWORD)result)
    return objc_msgSend(a1, "_setSurfacesSelectionState:", a3);
  return result;
}

+ (uint64_t)_supportsSurfacingSelectionState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__UIMenu_SBTopAffordanceViewControllerAdditions___supportsSurfacingSelectionState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_supportsSurfacingSelectionState_once != -1)
    dispatch_once(&_supportsSurfacingSelectionState_once, block);
  return _supportsSurfacingSelectionState_supportsSurfacingSelectionState;
}

@end
