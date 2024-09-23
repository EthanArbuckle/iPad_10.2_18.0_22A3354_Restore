@implementation MCDeleteInput

- (MCDeleteInput)init
{
  return -[MCDeleteInput initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:](self, "initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:", 0, 0, 0);
}

- (MCDeleteInput)initWithDeletedText:(id)a3 deleteBySyllable:(BOOL)a4 shouldDeleteAcceptCandidateInput:(BOOL)a5
{
  id v9;
  MCDeleteInput *v10;
  MCDeleteInput *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCDeleteInput;
  v10 = -[MCKeyboardInput init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_deletedText, a3);
    v11->_deleteBySyllable = a4;
    v11->_shouldDeleteAcceptCandidateInput = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDeleteInput;
  v5 = -[MCKeyboardInput copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_deletedText, "copyWithZone:", a3);
    v7 = (void *)v5[5];
    v5[5] = v6;

    *((_BYTE *)v5 + 32) = self->_deleteBySyllable;
    *((_BYTE *)v5 + 33) = self->_shouldDeleteAcceptCandidateInput;
  }
  return v5;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (NSString)deletedText
{
  return self->_deletedText;
}

- (BOOL)deleteBySyllable
{
  return self->_deleteBySyllable;
}

- (BOOL)shouldDeleteAcceptCandidateInput
{
  return self->_shouldDeleteAcceptCandidateInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedText, 0);
}

@end
