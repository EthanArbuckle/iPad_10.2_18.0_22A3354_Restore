@implementation NSConcreteNotifyingMutableAttributedString

- (void)endEditing
{
  objc_msgSend(self->_delegate, "endEditing");
}

- (void)beginEditing
{
  objc_msgSend(self->_delegate, "beginEditing");
}

+ (Class)_mutableStringClass
{
  return (Class)objc_opt_class();
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  objc_msgSend(self->_delegate, "edited:range:changeInLength:", a3, a4.location, a4.length, a5);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)delegate
{
  return self->_delegate;
}

@end
