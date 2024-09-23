@implementation WFLinkConfirmationDialogResponse

- (WFLinkConfirmationDialogResponse)initWithConfirmationResponseCode:(unint64_t)a3
{
  WFLinkConfirmationDialogResponse *v4;
  WFLinkConfirmationDialogResponse *v5;
  WFLinkConfirmationDialogResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFLinkConfirmationDialogResponse;
  v4 = -[WFLinkSnippetDialogResponse initWithCancelled:](&v8, sel_initWithCancelled_, a3 == 0);
  v5 = v4;
  if (v4)
  {
    v4->_requestResponseCode = a3;
    v6 = v4;
  }

  return v5;
}

- (WFLinkConfirmationDialogResponse)initWithRequestedOpenURL:(id)a3
{
  WFLinkConfirmationDialogResponse *v3;
  WFLinkConfirmationDialogResponse *v4;
  WFLinkConfirmationDialogResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLinkConfirmationDialogResponse;
  v3 = -[WFLinkSnippetDialogResponse initWithRequestedOpenURL:](&v7, sel_initWithRequestedOpenURL_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requestResponseCode = 2;
    v5 = v3;
  }

  return v4;
}

- (BOOL)shouldDismissDialogInTransientMode
{
  return 0;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, requestResponseCode: %lu>"), v5, self, -[WFLinkConfirmationDialogResponse requestResponseCode](self, "requestResponseCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFLinkConfirmationDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFLinkConfirmationDialogResponse *v5;
  WFLinkConfirmationDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFLinkConfirmationDialogResponse;
  v5 = -[WFLinkSnippetDialogResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
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
  v5.super_class = (Class)WFLinkConfirmationDialogResponse;
  v4 = a3;
  -[WFLinkSnippetDialogResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFLinkConfirmationDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), CFSTR("requestResponseCode"));

}

- (WFLinkConfirmationDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFLinkConfirmationDialogResponse *v5;
  WFLinkConfirmationDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFLinkConfirmationDialogResponse;
  v5 = -[WFLinkSnippetDialogResponse initWithBSXPCCoder:](&v8, sel_initWithBSXPCCoder_, v4);
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
  v5.super_class = (Class)WFLinkConfirmationDialogResponse;
  v4 = a3;
  -[WFLinkSnippetDialogResponse encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFLinkConfirmationDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), CFSTR("requestResponseCode"));

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
