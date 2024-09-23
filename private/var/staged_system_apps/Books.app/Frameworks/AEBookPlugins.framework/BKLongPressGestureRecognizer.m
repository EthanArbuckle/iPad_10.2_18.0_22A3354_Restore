@implementation BKLongPressGestureRecognizer

- (void)reset
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKLongPressGestureRecognizer;
  -[BKLongPressGestureRecognizer reset](&v2, "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKLongPressGestureRecognizer;
  -[BKLongPressGestureRecognizer touchesBegan:withEvent:](&v9, "touchesBegan:withEvent:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLongPressGestureRecognizer delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "bkLongPressGestureCanTransitionToRecognizedState:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLongPressGestureRecognizer delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "bkLongPressGestureCanTransitionToRecognizedState:", self);

    if ((v8 & 1) == 0)
      -[BKLongPressGestureRecognizer setState:](self, "setState:", 5);
  }
}

@end
