@implementation SFAppPasswordSavingViewControllerClass

Class __get_SFAppPasswordSavingViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECD7F2D8)
    qword_1ECD7F2D8 = _sl_dlopen();
  if (!qword_1ECD7F2D8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SafariServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UIKBAutofillController.m"), 136, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("_SFAppPasswordSavingViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_SFAppPasswordSavingViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UIKBAutofillController.m"), 137, CFSTR("Unable to find class %s"), "_SFAppPasswordSavingViewController");

LABEL_8:
    __break(1u);
  }
  qword_1ECD7F2D0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SFAppPasswordSavingViewControllerClass_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;

  SafariServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_SFAppPasswordSavingViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_SFAppPasswordSavingViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_SFAppPasswordSavingViewControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIKeyboardVCPresenter.m"), 46, CFSTR("Unable to find class %s"), "_SFAppPasswordSavingViewController");

    __break(1u);
  }
}

@end
