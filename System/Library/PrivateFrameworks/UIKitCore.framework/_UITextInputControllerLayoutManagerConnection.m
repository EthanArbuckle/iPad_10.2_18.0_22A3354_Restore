@implementation _UITextInputControllerLayoutManagerConnection

- (UITextInputController)textInputController
{
  return self->_textInputController;
}

- (_UITextInputControllerLayoutManagerConnection)initWithTextInputController:(id)a3
{
  id v5;
  _UITextInputControllerLayoutManagerConnection *v6;
  _UITextInputControllerLayoutManagerConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITextInputControllerLayoutManagerConnection;
  v6 = -[_UITextInputControllerLayoutManagerConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textInputController, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputController, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UITextInputController _detachFromLayoutManager](self->_textInputController, "_detachFromLayoutManager");
  v3.receiver = self;
  v3.super_class = (Class)_UITextInputControllerLayoutManagerConnection;
  -[_UITextInputControllerLayoutManagerConnection dealloc](&v3, sel_dealloc);
}

- (void)setTextInputController:(id)a3
{
  objc_storeStrong((id *)&self->_textInputController, a3);
}

@end
