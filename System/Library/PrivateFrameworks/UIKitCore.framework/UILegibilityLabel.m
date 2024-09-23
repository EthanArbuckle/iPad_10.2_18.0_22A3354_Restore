@implementation UILegibilityLabel

uint64_t __33___UILegibilityLabel_updateImage__block_invoke(uint64_t a1)
{
  _QWORD *ContextStack;
  CGContext *v3;
  double MinX;
  CGFloat v5;
  double MinY;
  CGFloat v7;
  void *v8;
  CGRect v10;
  CGRect v11;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v3 = 0;
  else
    v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  MinX = CGRectGetMinX(v10);
  v5 = MinX - CGRectGetMinX(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  MinY = CGRectGetMinY(v11);
  v7 = CGRectGetMinY(*(CGRect *)(a1 + 48));
  CGContextTranslateCTM(v3, v5, MinY - v7);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(v8, "drawInRect:");
}

@end
