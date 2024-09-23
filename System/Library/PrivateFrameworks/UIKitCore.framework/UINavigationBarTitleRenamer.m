@implementation UINavigationBarTitleRenamer

void __44___UINavigationBarTitleRenamer_renameServer__block_invoke(uint64_t a1)
{
  _UINavigationBarTitleRenamer *v2;
  void *v3;
  void *v4;

  if ((_UIApplicationProcessIsOverlayUI() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("_UINavigationBarTitleRenamer.m"), 36, CFSTR("A rename server is not available in this process."));

  }
  v2 = objc_alloc_init(_UINavigationBarTitleRenamer);
  v3 = (void *)_MergedGlobals_1188;
  _MergedGlobals_1188 = (uint64_t)v2;

  *(_BYTE *)(_MergedGlobals_1188 + 8) |= 1u;
}

uint64_t __54___UINavigationBarTitleRenamer_sessionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
