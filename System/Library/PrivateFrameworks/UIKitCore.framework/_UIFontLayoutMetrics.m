@implementation _UIFontLayoutMetrics

- (double)readableWidthForFont:(id)a3
{
  double result;

  if (a3)
    objc_msgSend(a3, "readableWidth");
  else
    objc_msgSend(off_1E167A828, "_readableWidth");
  return result;
}

@end
