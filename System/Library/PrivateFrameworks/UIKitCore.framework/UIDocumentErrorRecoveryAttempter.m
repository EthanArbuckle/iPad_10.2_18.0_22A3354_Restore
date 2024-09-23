@implementation UIDocumentErrorRecoveryAttempter

- (UIDocumentErrorRecoveryAttempter)initWithDocument:(id)a3 wrappedRecoveryAttempter:(id)a4
{
  id v7;
  id v8;
  UIDocumentErrorRecoveryAttempter *v9;
  UIDocumentErrorRecoveryAttempter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIDocumentErrorRecoveryAttempter;
  v9 = -[UIDocumentErrorRecoveryAttempter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong(&v10->_wrappedRecoveryAttempter, a4);
  }

  return v10;
}

- (UIDocumentErrorRecoveryAttempter)initWithDocument:(id)a3 silentRecoveryOptionIndex:(unint64_t)a4 appModalRecoveryAttempter:(id)a5 recoveryCanceler:(id)a6
{
  id v11;
  id v12;
  id v13;
  UIDocumentErrorRecoveryAttempter *v14;
  UIDocumentErrorRecoveryAttempter *v15;
  uint64_t v16;
  id appModalRecoveryAttempter;
  uint64_t v18;
  id recoveryCancelerOrNil;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UIDocumentErrorRecoveryAttempter;
  v14 = -[UIDocumentErrorRecoveryAttempter init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_document, a3);
    v15->_silentRecoveryOptionIndex = a4;
    v16 = objc_msgSend(v12, "copy");
    appModalRecoveryAttempter = v15->_appModalRecoveryAttempter;
    v15->_appModalRecoveryAttempter = (id)v16;

    v18 = objc_msgSend(v13, "copy");
    recoveryCancelerOrNil = v15->_recoveryCancelerOrNil;
    v15->_recoveryCancelerOrNil = (id)v18;

  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  if ((*(_BYTE *)&self->_errorRecoveryAttempterFlags & 1) == 0)
    -[UIDocumentErrorRecoveryAttempter cancelRecovery](self, "cancelRecovery");
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentErrorRecoveryAttempter;
  -[UIDocumentErrorRecoveryAttempter dealloc](&v3, sel_dealloc);
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v6;
  id wrappedRecoveryAttempter;
  void (**continuerOrNil)(void);
  char v9;

  v6 = a3;
  *(_BYTE *)&self->_errorRecoveryAttempterFlags |= 1u;
  wrappedRecoveryAttempter = self->_wrappedRecoveryAttempter;
  if (wrappedRecoveryAttempter)
  {
    if (objc_msgSend(wrappedRecoveryAttempter, "attemptRecoveryFromError:optionIndex:", v6, a4))
    {
      continuerOrNil = (void (**)(void))self->_continuerOrNil;
      if (continuerOrNil)
        continuerOrNil[2]();
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = (*((uint64_t (**)(void))self->_appModalRecoveryAttempter + 2))();
  }

  return v9;
}

- (BOOL)attemptSilentRecoveryFromError:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v6 = a3;
  v7 = v6;
  *(_BYTE *)&self->_errorRecoveryAttempterFlags |= 1u;
  if (self->_wrappedRecoveryAttempter)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(self->_wrappedRecoveryAttempter, "attemptSilentRecoveryFromError:error:", v7, a4);
LABEL_9:
      v9 = v8;
      goto LABEL_10;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_10;
  }
  if (self->_silentRecoveryOptionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (*((uint64_t (**)(void))self->_appModalRecoveryAttempter + 2))();
    goto LABEL_9;
  }
  if (!a4)
    goto LABEL_7;
  v9 = 0;
  *a4 = objc_retainAutorelease(v6);
LABEL_10:

  return v9;
}

- (void)cancelRecovery
{
  void (**recoveryCancelerOrNil)(void);

  if (self->_wrappedRecoveryAttempter)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(self->_wrappedRecoveryAttempter, "cancelRecovery");
  }
  else
  {
    recoveryCancelerOrNil = (void (**)(void))self->_recoveryCancelerOrNil;
    if (recoveryCancelerOrNil)
      recoveryCancelerOrNil[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recoveryCancelerOrNil, 0);
  objc_storeStrong(&self->_appModalRecoveryAttempter, 0);
  objc_storeStrong(&self->_continuerOrNil, 0);
  objc_storeStrong(&self->_wrappedRecoveryAttempter, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
