@implementation NSString

void __58__NSString_TUI_NSStringExtras__tui_optimizedSizeWithFont___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)tui_optimizedSizeWithFont__cache;
  tui_optimizedSizeWithFont__cache = (uint64_t)v0;

}

void __67__NSString_TUI_NSStringExtras__tui_excessiveLineHeightCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)tui_excessiveLineHeightCharacterSet___tui_excessiveLineCharacterSet;
  tui_excessiveLineHeightCharacterSet___tui_excessiveLineCharacterSet = v0;

}

@end
