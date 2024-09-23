@implementation UIMenu

Class __82__UIMenu_SBTopAffordanceViewControllerAdditions___supportsSurfacingSelectionState__block_invoke(uint64_t a1)
{
  char v1;
  Class result;
  char v3;

  v1 = objc_msgSend(*(id *)(a1 + 32), "instancesRespondToSelector:", sel__setSurfacesSelectionState_);
  result = NSClassFromString(CFSTR("XCTestCase"));
  if (result)
    v3 = 0;
  else
    v3 = v1;
  _supportsSurfacingSelectionState_supportsSurfacingSelectionState = v3;
  return result;
}

@end
