@implementation _UIMenuLeafValidation

- (_UIMenuLeafValidation)init
{
  _UIMenuLeafValidation *v2;
  _UIValidatableCommand *v3;
  _UIValidatableCommand *validatedCommand;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIMenuLeafValidation;
  v2 = -[_UIMenuLeafValidation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_UIValidatableCommand);
    validatedCommand = v2->_validatedCommand;
    v2->_validatedCommand = v3;

  }
  return v2;
}

- (id)validatedActionForTarget:(id)a3 action:(id)a4
{
  return a4;
}

- (id)validatedCommandForTarget:(id)a3 command:(id)a4 alternate:(id)a5 sender:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _UIValidatableCommand *validatedCommand;
  _UIValidatableCommand *v15;
  _QWORD v17[4];
  id v18;
  _UIMenuLeafValidation *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_UIValidatableCommand useCommand:alternate:](self->_validatedCommand, "useCommand:alternate:", v11, v12);
      validatedCommand = self->_validatedCommand;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76___UIMenuLeafValidation_validatedCommandForTarget_command_alternate_sender___block_invoke;
      v17[3] = &unk_1E16B1B50;
      v18 = v10;
      v19 = self;
      -[UICommand _performWithSender:handler:](validatedCommand, "_performWithSender:handler:", v13, v17);
      v15 = self->_validatedCommand;

    }
    else
    {
      v15 = (_UIValidatableCommand *)v11;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedCommand, 0);
}

@end
