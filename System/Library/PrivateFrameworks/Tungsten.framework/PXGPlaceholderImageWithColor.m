@implementation PXGPlaceholderImageWithColor

void __PXGPlaceholderImageWithColor_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  __int128 v11;
  CGColorSpace *v12;
  CGColor *v13;
  _OWORD v14[2];
  uint64_t v15;
  CGRect v16;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = *(_OWORD *)(a1 + 48);
  v14[0] = *(_OWORD *)(a1 + 32);
  v14[1] = v11;
  v12 = (CGColorSpace *)PXGetColorSpace();
  v13 = CGColorCreate(v12, (const CGFloat *)v14);
  CGContextSetFillColorWithColor(a2, v13);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  CGContextFillRect(a2, v16);
  CGColorRelease(v13);
}

@end
