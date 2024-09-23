@implementation _UIImmutableCustomViewMenuElement

- (void)setMenuElementRepresentation:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICustomViewMenuElement.m"), 174, CFSTR("Menu element is immutable because it is a child of a menu"));

}

- (void)setPrimaryActionHandler:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICustomViewMenuElement.m"), 179, CFSTR("Menu element is immutable because it is a child of a menu"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UICustomViewMenuElement initWithMenuElement:]([UICustomViewMenuElement alloc], "initWithMenuElement:", self);
}

@end
