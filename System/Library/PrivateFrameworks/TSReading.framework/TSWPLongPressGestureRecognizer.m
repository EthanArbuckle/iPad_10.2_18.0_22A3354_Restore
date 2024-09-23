@implementation TSWPLongPressGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPLongPressGestureRecognizer;
  -[TSWPLongPressGestureRecognizer touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") >= 2)
    -[TSWPLongPressGestureRecognizer setState:](self, "setState:", 5);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPLongPressGestureRecognizer;
  -[TSWPLongPressGestureRecognizer reset](&v3, sel_reset);
  -[TSWPLongPressGestureRecognizer delegate](self, "delegate");
  objc_msgSend((id)TSUProtocolCast(), "didReset:", self);
}

@end
