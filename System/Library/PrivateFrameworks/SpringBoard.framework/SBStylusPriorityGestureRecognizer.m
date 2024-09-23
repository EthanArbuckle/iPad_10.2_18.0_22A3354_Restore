@implementation SBStylusPriorityGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBStylusPriorityGestureRecognizer;
  -[SBStylusPriorityGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[SBStylusPriorityGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBStylusPriorityGestureRecognizer;
  -[SBStylusPriorityGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[SBStylusPriorityGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBStylusPriorityGestureRecognizer;
  -[SBStylusPriorityGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[SBStylusPriorityGestureRecognizer setState:](self, "setState:", 5);
}

@end
