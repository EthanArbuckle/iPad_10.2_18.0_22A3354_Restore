@implementation WAKResponder

- (void)_forwardEvent:(id)a3
{
  objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "handleEvent:", a3);
}

- (id)nextResponder
{
  return 0;
}

- (BOOL)acceptsFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  return 1;
}

- (BOOL)tryToPerform:(SEL)a3 with:(id)a4
{
  char v7;

  v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0)
    -[WAKResponder performSelector:withObject:](self, "performSelector:withObject:", a3, a4);
  return v7 & 1;
}

@end
