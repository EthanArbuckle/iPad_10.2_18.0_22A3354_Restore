@implementation WFFileAccessDialogResponse

- (WFFileAccessDialogResponse)initWithFileResponseCode:(unint64_t)a3 error:(id)a4
{
  id v7;
  WFFileAccessDialogResponse *v8;
  WFFileAccessDialogResponse *v9;
  WFFileAccessDialogResponse *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFFileAccessDialogResponse;
  v8 = -[WFDialogResponse initWithCancelled:](&v12, sel_initWithCancelled_, a3 == 0);
  v9 = v8;
  if (v8)
  {
    v8->_fileResponseCode = a3;
    objc_storeStrong((id *)&v8->_error, a4);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, responseCode: %tu>"), v5, self, -[WFFileAccessDialogResponse fileResponseCode](self, "fileResponseCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFFileAccessDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFFileAccessDialogResponse *v5;
  uint64_t v6;
  NSError *error;
  WFFileAccessDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFileAccessDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_fileResponseCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fileResponseCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFileAccessDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFFileAccessDialogResponse fileResponseCode](self, "fileResponseCode", v7.receiver, v7.super_class), CFSTR("fileResponseCode"));
  -[WFFileAccessDialogResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFEncodableError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

}

- (WFFileAccessDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFFileAccessDialogResponse *v5;
  uint64_t v6;
  NSError *error;
  WFFileAccessDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFileAccessDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v10, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_fileResponseCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fileResponseCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFileAccessDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v7, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFFileAccessDialogResponse fileResponseCode](self, "fileResponseCode", v7.receiver, v7.super_class), CFSTR("fileResponseCode"));
  -[WFFileAccessDialogResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFEncodableError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

}

- (unint64_t)fileResponseCode
{
  return self->_fileResponseCode;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
