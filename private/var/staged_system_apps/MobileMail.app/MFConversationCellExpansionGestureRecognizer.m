@implementation MFConversationCellExpansionGestureRecognizer

- (MFConversationCellExpansionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  MFConversationCellExpansionGestureRecognizer *v7;
  MFConversationCellExpansionGestureRecognizer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFConversationCellExpansionGestureRecognizer;
  v7 = -[MFConversationCellExpansionGestureRecognizer initWithTarget:action:](&v10, "initWithTarget:action:", v6, a4);
  v8 = v7;
  if (v7)
    -[MFConversationCellExpansionGestureRecognizer setCancelsTouchesInView:](v7, "setCancelsTouchesInView:", 0);

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[MFConversationCellExpansionGestureRecognizer setState:](self, "setState:", 1, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[MFConversationCellExpansionGestureRecognizer setState:](self, "setState:", 2, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[MFConversationCellExpansionGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[MFConversationCellExpansionGestureRecognizer setState:](self, "setState:", 4, a4);
}

- (void)cancel
{
  -[MFConversationCellExpansionGestureRecognizer setEnabled:](self, "setEnabled:", 0);
  -[MFConversationCellExpansionGestureRecognizer setEnabled:](self, "setEnabled:", 1);
}

@end
