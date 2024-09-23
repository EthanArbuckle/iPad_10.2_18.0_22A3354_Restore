@implementation SXDebugComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  double v4;

  -[SXComponentSizer suggestedSize](self, "suggestedSize", a4, a3);
  return v4;
}

@end
