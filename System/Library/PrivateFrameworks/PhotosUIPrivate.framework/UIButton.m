@implementation UIButton

uint64_t __72__UIButton_PhotosUI__pu_sendActionForControlEventsWithHighlightTimeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
}

void __78__UIButton_PhotosUI__pu_setTitle_andAccessibilityTitle_withFallback_forState___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  pu_setTitle_andAccessibilityTitle_withFallback_forState__forceFallback = objc_msgSend(v0, "BOOLForKey:", CFSTR("NSDoubleLocalizedStrings"));

}

@end
