@implementation _UIHostedTextServiceSession

+ (id)showServiceForType:(int64_t)a3 withContext:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", a3);
}

+ (id)showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", a4);
}

+ (id)showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", a5);
}

- (void)dismissTextServiceAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[_UIHostedTextServiceSession delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissHostedTextServiceSession:animated:", self, v3);

}

- (_UIHostedTextServiceSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIHostedTextServiceSessionDelegate *)a3;
}

@end
