@implementation NSNull(TSDColorFill_Additions)

- (void)paintPath:()TSDColorFill_Additions inContext:
{
  CGRect PathBoundingBox;

  PathBoundingBox = CGPathGetPathBoundingBox(path);
  TSDColorFill_DrawClearColorRepresentation(a4, PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
}

- (void)drawSwatchInRect:()TSDColorFill_Additions inContext:
{
  TSDColorFill_DrawClearColorRepresentation(a7, a1, a2, a3, a4);
}

@end
