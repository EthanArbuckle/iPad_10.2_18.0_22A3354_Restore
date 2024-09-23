@implementation WFChronoControlDialogRequest

- (WFChronoControlDialogRequest)initWithControlType:(unint64_t)a3 identity:(id)a4 attribution:(id)a5
{
  id v9;
  WFChronoControlDialogRequest *v10;
  WFChronoControlDialogRequest *v11;
  WFChronoControlDialogRequest *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFChronoControlDialogRequest;
  v10 = -[WFDialogRequest initWithAttribution:prompt:](&v14, sel_initWithAttribution_prompt_, a5, 0);
  v11 = v10;
  if (v10)
  {
    v10->_controlType = a3;
    objc_storeStrong((id *)&v10->_controlIdentity, a4);
    v12 = v11;
  }

  return v11;
}

- (WFChronoControlDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFChronoControlDialogRequest *v5;
  uint64_t v6;
  CHSControlIdentity *controlIdentity;
  WFChronoControlDialogRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFChronoControlDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_controlType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("controlType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("controlIdentity"));
    v6 = objc_claimAutoreleasedReturnValue();
    controlIdentity = v5->_controlIdentity;
    v5->_controlIdentity = (CHSControlIdentity *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFChronoControlDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFChronoControlDialogRequest controlType](self, "controlType", v6.receiver, v6.super_class), CFSTR("controlType"));
  -[WFChronoControlDialogRequest controlIdentity](self, "controlIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("controlIdentity"));

}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (CHSControlIdentity)controlIdentity
{
  return self->_controlIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlIdentity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
