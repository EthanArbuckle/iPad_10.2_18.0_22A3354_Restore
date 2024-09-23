@implementation SFAppAutoFillPasswordViewControllerClass

void __get_SFAppAutoFillPasswordViewControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SafariServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_SFAppAutoFillPasswordViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_SFAppAutoFillPasswordViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_SFAppAutoFillPasswordViewControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIKeyboardVCPresenter.m"), 45, CFSTR("Unable to find class %s"), "_SFAppAutoFillPasswordViewController");

    __break(1u);
  }
}

@end
