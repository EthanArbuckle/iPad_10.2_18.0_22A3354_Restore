@implementation TPSBlockValidation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validationBlock, 0);
}

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[TPSBlockValidation validationBlock](self, "validationBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TPSBlockValidation validationBlock](self, "validationBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (id)validationBlock
{
  return self->_validationBlock;
}

+ (id)blockValidationWithBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValidationBlock:", v3);

  return v4;
}

- (TPSBlockValidation)initWithValidationBlock:(id)a3
{
  id v4;
  TPSBlockValidation *v5;
  void *v6;
  id validationBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSBlockValidation;
  v5 = -[TPSBlockValidation init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    validationBlock = v5->_validationBlock;
    v5->_validationBlock = v6;

  }
  return v5;
}

- (void)setValidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
