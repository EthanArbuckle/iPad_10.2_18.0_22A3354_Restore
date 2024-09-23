@implementation TTKKeyboardLayout

- (TTKKeyboardLayout)initWithUIKBTree:(id)a3
{
  id v5;
  TTKKeyboardLayout *v6;
  TTKKeyboardLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTKKeyboardLayout;
  v6 = -[TTKKeyboardLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layout, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
