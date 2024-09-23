@implementation WFSiriPunchOutResponse

- (WFSiriPunchOutResponse)initWithShouldPunchOut:(BOOL)a3
{
  WFSiriPunchOutResponse *v4;
  WFSiriPunchOutResponse *v5;
  WFSiriPunchOutResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSiriPunchOutResponse;
  v4 = -[WFSiriActionResponse initWithError:](&v8, sel_initWithError_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_shouldPunchOut = a3;
    v6 = v4;
  }

  return v5;
}

- (WFSiriPunchOutResponse)initWithCoder:(id)a3
{
  id v4;
  WFSiriPunchOutResponse *v5;
  WFSiriPunchOutResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSiriPunchOutResponse;
  v5 = -[WFSiriActionResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_shouldPunchOut = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPunchOut"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSiriPunchOutResponse;
  v4 = a3;
  -[WFSiriActionResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriPunchOutResponse shouldPunchOut](self, "shouldPunchOut", v5.receiver, v5.super_class), CFSTR("shouldPunchOut"));

}

- (BOOL)shouldPunchOut
{
  return self->_shouldPunchOut;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
