@implementation _TUITextFieldViewState

- (_TUITextFieldViewState)initWithText:(id)a3
{
  id v5;
  _TUITextFieldViewState *v6;
  _TUITextFieldViewState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITextFieldViewState;
  v6 = -[_TUITextFieldViewState init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_text, a3);

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
