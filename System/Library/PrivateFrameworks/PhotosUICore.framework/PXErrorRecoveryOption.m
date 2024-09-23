@implementation PXErrorRecoveryOption

- (PXErrorRecoveryOption)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  PXErrorRecoveryOption *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  id handler;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXErrorRecoveryOption;
  v10 = -[PXErrorRecoveryOption init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v10->_style = a4;
    v13 = objc_msgSend(v9, "copy");
    handler = v10->_handler;
    v10->_handler = (id)v13;

  }
  return v10;
}

- (void)_attemptRecoveryFromError:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXErrorRecovery.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PXErrorRecoveryOption handler](self, "handler");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, id, void (**)(id, uint64_t)))(v8 + 16))(v8, v11, v7);
  else
    v7[2](v7, 1);

}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)recoveryOptionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:style:handler:", v9, a4, v8);

  return v10;
}

@end
