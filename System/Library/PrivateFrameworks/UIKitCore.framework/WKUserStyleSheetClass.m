@implementation WKUserStyleSheetClass

void __get_WKUserStyleSheetClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WebKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_WKUserStyleSheet");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_5_5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_WKUserStyleSheetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIReferenceLibraryViewController.m"), 49, CFSTR("Unable to find class %s"), "_WKUserStyleSheet");

    __break(1u);
  }
}

@end
