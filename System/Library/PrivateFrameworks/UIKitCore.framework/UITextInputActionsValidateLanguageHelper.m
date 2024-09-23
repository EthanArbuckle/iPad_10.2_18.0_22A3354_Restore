@implementation UITextInputActionsValidateLanguageHelper

void ___UITextInputActionsValidateLanguageHelper_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^[a-z]{2,3}([_-][A-Z][a-z]{3})?$"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1289;
  _MergedGlobals_1289 = v0;

}

@end
