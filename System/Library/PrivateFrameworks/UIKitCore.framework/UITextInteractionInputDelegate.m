@implementation UITextInteractionInputDelegate

- (void)selectionWillChange:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionWillChange:", v6);

  }
}

- (void)selectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UITextInteractionInputDelegate rootInteraction](self, "rootInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionDidChange:", v9);

  }
  objc_msgSend(v4, "assistantDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionChanged");

}

- (void)textWillChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textWillChange:", v7);

  }
  else
  {
    -[UITextInteractionInputDelegate selectionWillChange:](self, "selectionWillChange:", v7);
  }

}

- (void)textDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textDidChange:", v7);

  }
  else
  {
    -[UITextInteractionInputDelegate selectionDidChange:](self, "selectionDidChange:", v7);
  }

}

- (UITextInteraction)rootInteraction
{
  return (UITextInteraction *)objc_loadWeakRetained((id *)&self->_rootInteraction);
}

- (void)setRootInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_rootInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootInteraction);
}

@end
