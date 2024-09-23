@implementation UIAccessibilityStartCapturingStringDrawingText

void __UIAccessibilityStartCapturingStringDrawingText_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CF3A08], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_219, &__block_literal_global_227_0, &__block_literal_global_231, &__block_literal_global_233_0);

}

uint64_t __UIAccessibilityStartCapturingStringDrawingText_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSString"), CFSTR("drawAtPoint: withAttributes:"), "v", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSAttributedString"), CFSTR("drawAtPoint:"), "v", "{CGPoint=dd}", 0);

  return 1;
}

uint64_t __UIAccessibilityStartCapturingStringDrawingText_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("NSString AX Extras"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("NSString AX Extras"));

  return 1;
}

void __UIAccessibilityStartCapturingStringDrawingText_block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSString__UIKitStringObserver__Foundation"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSAttributedString__UIKitStringObserver__Foundation"), 1);

}

@end
