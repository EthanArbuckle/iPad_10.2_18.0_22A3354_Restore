@implementation WFRequestAuthorizationDialogResponse

- (WFRequestAuthorizationDialogResponse)initWithResult:(unint64_t)a3
{
  return -[WFRequestAuthorizationDialogResponse initWithResult:cancelled:](self, "initWithResult:cancelled:", a3, 0);
}

- (WFRequestAuthorizationDialogResponse)initWithResult:(unint64_t)a3 cancelled:(BOOL)a4
{
  WFRequestAuthorizationDialogResponse *v5;
  WFRequestAuthorizationDialogResponse *v6;
  WFRequestAuthorizationDialogResponse *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFRequestAuthorizationDialogResponse;
  v5 = -[WFDialogResponse initWithCancelled:](&v9, sel_initWithCancelled_, a4);
  v6 = v5;
  if (v5)
  {
    v5->_result = a3;
    v7 = v5;
  }

  return v6;
}

- (WFRequestAuthorizationDialogResponse)initWithResponseCode:(int64_t)a3
{
  WFRequestAuthorizationDialogResponse *v3;
  WFRequestAuthorizationDialogResponse *v4;
  WFRequestAuthorizationDialogResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFRequestAuthorizationDialogResponse;
  v3 = -[WFDialogResponse initWithResponseCode:](&v7, sel_initWithResponseCode_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_result = 0;
    v5 = v3;
  }

  return v4;
}

- (WFRequestAuthorizationDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFRequestAuthorizationDialogResponse *v5;
  WFRequestAuthorizationDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFRequestAuthorizationDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_result = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("result"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRequestAuthorizationDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFRequestAuthorizationDialogResponse result](self, "result", v5.receiver, v5.super_class), CFSTR("result"));

}

- (WFRequestAuthorizationDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFRequestAuthorizationDialogResponse *v5;
  WFRequestAuthorizationDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFRequestAuthorizationDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v8, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_result = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("result"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRequestAuthorizationDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFRequestAuthorizationDialogResponse result](self, "result", v5.receiver, v5.super_class), CFSTR("result"));

}

- (unint64_t)result
{
  return self->_result;
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
