@implementation KeyboardObserver

- (KeyboardObserver)init
{
  KeyboardObserver *v2;
  KeyboardObserver *v3;
  CGSize size;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KeyboardObserver;
  v2 = -[KeyboardObserver init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    size = CGRectNull.size;
    v2->_keyboardFrame.origin = CGRectNull.origin;
    v2->_keyboardFrame.size = size;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "keyboardWillOrDidChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "keyboardWillOrDidChangeFrame:", UIKeyboardDidChangeFrameNotification, 0);

  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1014D36B8 != -1)
    dispatch_once(&qword_1014D36B8, &stru_1011D9AB0);
  return (id)qword_1014D36C0;
}

- (void)keyboardWillOrDidChangeFrame:(id)a3
{
  void *v4;
  double x;
  double y;
  double width;
  double height;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));

  if (v9)
  {
    objc_msgSend(v9, "CGRectValue");
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  -[KeyboardObserver setKeyboardFrame:](self, "setKeyboardFrame:", x, y, width, height);

}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

@end
