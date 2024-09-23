@implementation PXAngleNumberFilter

- (double)updatedOutput
{
  double v3;
  double v4;
  double v5;
  double i;

  -[PXNumberFilter input](self, "input");
  v4 = v3;
  -[PXNumberFilter output](self, "output");
  for (i = v4 - v5; v4 - v5 > 3.14159265; i = v4 - v5)
    v4 = v4 + -6.28318531;
  if (i < -3.14159265)
  {
    do
      v4 = v4 + 6.28318531;
    while (v4 - v5 < -3.14159265);
  }
  return v4;
}

@end
