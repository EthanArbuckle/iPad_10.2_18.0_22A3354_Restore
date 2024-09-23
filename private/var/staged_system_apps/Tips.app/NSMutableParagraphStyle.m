@implementation NSMutableParagraphStyle

- (NSMutableParagraphStyle)initWithAlignment:(int64_t)a3
{
  NSMutableParagraphStyle *v4;

  v4 = -[NSMutableParagraphStyle init](self, "init");
  -[NSMutableParagraphStyle setAlignment:](v4, "setAlignment:", a3);
  return v4;
}

@end
