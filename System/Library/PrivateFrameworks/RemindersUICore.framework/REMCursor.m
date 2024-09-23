@implementation REMCursor

+ (id)REMCursorWithRoundRect:(CGRect)a3 andCornerRadius:(double)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

@end
