@implementation WFHandleInteractionDialogResponse

- (WFHandleInteractionDialogResponse)initWithInteractionResponseCode:(unint64_t)a3
{
  WFHandleInteractionDialogResponse *v4;
  WFHandleInteractionDialogResponse *v5;
  WFHandleInteractionDialogResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFHandleInteractionDialogResponse;
  v4 = -[WFDialogResponse initWithCancelled:](&v8, sel_initWithCancelled_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_interactionResponseCode = a3;
    v6 = v4;
  }

  return v5;
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
  v7 = CFSTR("ContinueInApp");
  if (!v6)
    v7 = CFSTR("Dismissed");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, responseCode: %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (WFHandleInteractionDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFHandleInteractionDialogResponse *v5;
  WFHandleInteractionDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFHandleInteractionDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_interactionResponseCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interactionResponseCode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFHandleInteractionDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFHandleInteractionDialogResponse interactionResponseCode](self, "interactionResponseCode", v5.receiver, v5.super_class), CFSTR("interactionResponseCode"));

}

- (WFHandleInteractionDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFHandleInteractionDialogResponse *v5;
  WFHandleInteractionDialogResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFHandleInteractionDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v8, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_interactionResponseCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("interactionResponseCode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFHandleInteractionDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFHandleInteractionDialogResponse interactionResponseCode](self, "interactionResponseCode", v5.receiver, v5.super_class), CFSTR("interactionResponseCode"));

}

- (unint64_t)interactionResponseCode
{
  return self->_interactionResponseCode;
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
