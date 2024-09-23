@implementation UIFocusDebugWindow

void __56___UIFocusDebugWindow_ModuleRegistration__moduleClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  int v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_opt_new();
  v5 = (id)v0;
  if (qword_1ECD7EB90 == -1)
  {
    v1 = (void *)v0;
  }
  else
  {
    dispatch_once(&qword_1ECD7EB90, &__block_literal_global_3_10);
    v1 = v5;
  }
  if (_MergedGlobals_1111)
  {
    objc_msgSend(v5, "addObject:", objc_opt_class());
    v2 = dyld_program_sdk_at_least();
    v1 = v5;
    if (v2)
    {
      objc_msgSend(v5, "addObject:", objc_opt_class());
      v1 = v5;
    }
  }
  v3 = objc_msgSend(v1, "copy");
  v4 = (void *)qword_1ECD7EB80;
  qword_1ECD7EB80 = v3;

}

@end
