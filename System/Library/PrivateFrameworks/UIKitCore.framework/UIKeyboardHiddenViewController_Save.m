@implementation UIKeyboardHiddenViewController_Save

- (void)setAutofillVC:(id)a3
{
  _SFPasswordViewController **p_autofillVC;
  id v6;

  p_autofillVC = &self->super._autofillVC;
  objc_storeStrong((id *)&self->super._autofillVC, a3);
  v6 = a3;
  -[_SFPasswordViewController setDelegate:](*p_autofillVC, "setDelegate:", self);

}

@end
