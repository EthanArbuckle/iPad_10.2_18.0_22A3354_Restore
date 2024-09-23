@implementation UIStatusBarThermalItem

void __42___UIStatusBarThermalItem_imageForUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD *ContextStack;
  CGContext *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "set");
  if (objc_msgSend(*(id *)(a1 + 40), "sunlightMode"))
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v6 = 0;
    else
      v6 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSetLineWidth(v6, 3.0);
    objc_msgSend(v4, "format");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v4, "strokeRect:");
  }
  else
  {
    objc_msgSend(v4, "format");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v4, "fillRect:");
  }

}

@end
