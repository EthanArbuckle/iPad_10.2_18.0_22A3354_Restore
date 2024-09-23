@implementation WFAppProtectionDialogResponse

- (WFAppProtectionDialogResponse)initWithResponseCode:(unint64_t)a3
{
  WFAppProtectionDialogResponse *v4;
  WFAppProtectionDialogResponse *v5;
  WFAppProtectionDialogResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAppProtectionDialogResponse;
  v4 = -[WFDialogResponse initWithCancelled:](&v8, sel_initWithCancelled_, a3 == 0);
  v5 = v4;
  if (v4)
  {
    v4->_requestResponseCode = a3;
    v6 = v4;
  }

  return v5;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, requestResponseCode: %lu>"), v5, self, -[WFAppProtectionDialogResponse requestResponseCode](self, "requestResponseCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFAppProtectionDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFAppProtectionDialogResponse *v5;
  WFAppProtectionDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFAppProtectionDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_requestResponseCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestResponseCode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAppProtectionDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAppProtectionDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), CFSTR("requestResponseCode"));

}

- (WFAppProtectionDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFAppProtectionDialogResponse *v5;
  WFAppProtectionDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFAppProtectionDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v8, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_requestResponseCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestResponseCode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAppProtectionDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFAppProtectionDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), CFSTR("requestResponseCode"));

}

- (unint64_t)requestResponseCode
{
  return self->_requestResponseCode;
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
