@implementation VSITMLCredentialEntryField

- (void)setAssociatedTextFieldElement:(id)a3
{
  IKTextFieldElement *v5;
  IKTextFieldElement *associatedTextFieldElement;
  void *v7;
  void *v8;
  IKTextFieldElement *v9;

  v5 = (IKTextFieldElement *)a3;
  associatedTextFieldElement = self->_associatedTextFieldElement;
  v9 = v5;
  if (associatedTextFieldElement != v5)
  {
    -[IKTextFieldElement keyboard](associatedTextFieldElement, "keyboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    objc_storeStrong((id *)&self->_associatedTextFieldElement, a3);
    -[IKTextFieldElement keyboard](v9, "keyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);
    -[VSITMLCredentialEntryField textDidChangeForKeyboard:](self, "textDidChangeForKeyboard:", v8);

  }
}

- (void)textDidChangeForKeyboard:(id)a3
{
  id v4;
  uint64_t v5;
  const __CFString *v6;
  __CFString *v7;

  v4 = a3;
  VSRequireMainThread();
  objc_msgSend(v4, "text");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_24FE1B848;
  v7 = (__CFString *)v6;
  -[VSCredentialEntryField setText:](self, "setText:");

}

- (IKTextFieldElement)associatedTextFieldElement
{
  return self->_associatedTextFieldElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedTextFieldElement, 0);
}

@end
