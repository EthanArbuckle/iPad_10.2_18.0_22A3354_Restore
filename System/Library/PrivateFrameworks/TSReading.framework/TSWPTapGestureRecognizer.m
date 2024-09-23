@implementation TSWPTapGestureRecognizer

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTapGestureRecognizer;
  -[TSWPTapGestureRecognizer reset](&v3, sel_reset);
  -[TSWPTapGestureRecognizer delegate](self, "delegate");
  objc_msgSend((id)TSUProtocolCast(), "didReset:", self);
}

@end
