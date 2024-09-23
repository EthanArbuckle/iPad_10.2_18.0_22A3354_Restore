@implementation UISheetDetent

void __31___UISheetDetent__mediumDetent__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UISheetPresentationControllerDetent mediumDetent](_UISheetDetent, "mediumDetent");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1000;
  _MergedGlobals_1000 = v0;

}

void __30___UISheetDetent__largeDetent__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UISheetPresentationControllerDetent largeDetent](_UISheetDetent, "largeDetent");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7D440;
  qword_1ECD7D440 = v0;

}

@end
