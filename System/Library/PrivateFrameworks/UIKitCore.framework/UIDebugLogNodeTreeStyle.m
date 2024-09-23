@implementation UIDebugLogNodeTreeStyle

void __40___UIDebugLogNodeTreeStyle_defaultStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_UIDebugLogNodeTreeStyle styleWithNode:lastNode:intermediate:trailing:](_UIDebugLogNodeTreeStyle, "styleWithNode:lastNode:intermediate:trailing:", CFSTR(" ├ "), CFSTR(" └ "), CFSTR(" │ "), CFSTR("   "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1_17;
  _MergedGlobals_1_17 = v0;

}

@end
