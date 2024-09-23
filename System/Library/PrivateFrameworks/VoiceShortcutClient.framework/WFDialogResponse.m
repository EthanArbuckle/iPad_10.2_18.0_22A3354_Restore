@implementation WFDialogResponse

- (WFDialogResponse)initWithCancelled:(BOOL)a3
{
  _BOOL4 v3;
  WFDialogResponse *v4;
  WFDialogResponse *v5;
  uint64_t v6;
  WFDialogResponse *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFDialogResponse;
  v4 = -[WFDialogResponse init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = 2;
    if (!v3)
      v6 = 0;
    v4->_responseCode = v6;
    v7 = v4;
  }

  return v5;
}

- (WFDialogResponse)initWithResponseCode:(int64_t)a3
{
  WFDialogResponse *v4;
  WFDialogResponse *v5;
  WFDialogResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFDialogResponse;
  v4 = -[WFDialogResponse init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_responseCode = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)isCancelled
{
  return -[WFDialogResponse responseCode](self, "responseCode") == 2;
}

- (BOOL)shouldDismissDialogInTransientMode
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFDialogResponse responseCode](self, "responseCode");
  if ((unint64_t)(v6 - 1) > 4)
    v7 = CFSTR("Success");
  else
    v7 = off_1E5FC6C50[v6 - 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, responseCode: %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (WFDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFDialogResponse *v5;
  WFDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFDialogResponse;
  v5 = -[WFDialogResponse init](&v8, sel_init);
  if (v5)
  {
    v5->_responseCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("responseCode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFDialogResponse responseCode](self, "responseCode"), CFSTR("responseCode"));

}

- (WFDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFDialogResponse *v5;
  WFDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFDialogResponse;
  v5 = -[WFDialogResponse init](&v8, sel_init);
  if (v5)
  {
    v5->_responseCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("responseCode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFDialogResponse responseCode](self, "responseCode"), CFSTR("responseCode"));

}

- (int64_t)responseCode
{
  return self->_responseCode;
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
