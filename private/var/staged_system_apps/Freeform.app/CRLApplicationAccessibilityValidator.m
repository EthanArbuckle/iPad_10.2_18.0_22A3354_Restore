@implementation CRLApplicationAccessibilityValidator

+ (void)performValidations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLUndoManager"), CFSTR("undo"), "v", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLUndoManager"), CFSTR("redo"), "v", v7, v8, v9, v10, v11, 0);
}

+ (void)performPlatformSpecificValidations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("UIApplication"), CFSTR("_localizedApplicationName"), "@", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLiOSDocumentModeController"), CFSTR("resetToDefaultModeAnimated:"), "v", v7, v8, v9, v10, v11, "B");
  __CRLAccessibilityValidateClass(CFSTR("Freeform.CRLBoardItemFactory"));
}

@end
