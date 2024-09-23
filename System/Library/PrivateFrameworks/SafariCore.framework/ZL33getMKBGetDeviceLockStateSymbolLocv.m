@implementation ZL33getMKBGetDeviceLockStateSymbolLocv

void *___ZL33getMKBGetDeviceLockStateSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!MobileKeyBagLibraryCore(char **)::frameworkLibrary)
    MobileKeyBagLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)MobileKeyBagLibraryCore(char **)::frameworkLibrary;
  if (!MobileKeyBagLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileKeyBagLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WBSKeyBagLockStatusManager.mm"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
