@implementation NSGetCircledImage

void ____NSGetCircledImage_block_invoke(uint64_t a1, CGContext *a2)
{
  CGRect v4;

  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(*(id *)(a1 + 32), "CGColor"));
  v4.size.width = *(CGFloat *)(a1 + 40);
  v4.size.height = *(CGFloat *)(a1 + 48);
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  CGContextAddEllipseInRect(a2, v4);
  CGContextFillPath(a2);
}

@end
