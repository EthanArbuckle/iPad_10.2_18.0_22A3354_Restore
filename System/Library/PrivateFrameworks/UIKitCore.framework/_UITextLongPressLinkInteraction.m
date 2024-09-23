@implementation _UITextLongPressLinkInteraction

- (_UITextLongPressLinkInteraction)initWithShouldProxyContextMenuDelegate:(BOOL)a3
{
  _UITextLongPressLinkInteraction *v3;
  UILongPressGestureRecognizer *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextLongPressLinkInteraction;
  v3 = -[_UITextSimpleLinkInteraction initWithShouldProxyContextMenuDelegate:](&v7, sel_initWithShouldProxyContextMenuDelegate_, a3);
  if (v3)
  {
    v4 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v3, sel_longDelayRecognizer_);
    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v4, "setNumberOfTouchesRequired:", 1);
    -[UILongPressGestureRecognizer setDelay:](v4, "setDelay:", 0.75);
    -[UILongPressGestureRecognizer setAllowableMovement:](v4, "setAllowableMovement:", 10.0);
    -[UILongPressGestureRecognizer set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:](v4, "set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:", 1);
    -[UIGestureRecognizer _pairedGestureIdentifiers](v4, "_pairedGestureIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", 0x1E1778860);

    -[UITextInteraction addGestureRecognizer:withName:](v3, "addGestureRecognizer:withName:", v4, 0x1E1778860);
  }
  return v3;
}

@end
