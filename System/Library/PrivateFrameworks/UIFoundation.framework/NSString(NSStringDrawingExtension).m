@implementation NSString(NSStringDrawingExtension)

- (double)_sizeWithSize:()NSStringDrawingExtension attributes:
{
  double v5;

  if (a2 <= 0.0 || a3 <= 0.0)
    return *MEMORY[0x1E0CB3440];
  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, a5, 0);
  return v5;
}

@end
