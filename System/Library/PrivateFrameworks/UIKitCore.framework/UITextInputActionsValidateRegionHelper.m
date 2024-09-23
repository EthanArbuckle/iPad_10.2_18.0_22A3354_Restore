@implementation UITextInputActionsValidateRegionHelper

void ___UITextInputActionsValidateRegionHelper_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(([A-Z]{2})|([0-9]{3})|([A-Z][a-z]{3}))$"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD81FE0;
  qword_1ECD81FE0 = v0;

}

@end
