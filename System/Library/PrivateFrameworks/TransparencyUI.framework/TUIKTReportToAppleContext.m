@implementation TUIKTReportToAppleContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUIKTReportToAppleContext)initWithCoder:(id)a3
{
  id v4;
  TUIKTReportToAppleContext *v5;
  uint64_t v6;
  NSUUID *failingValidation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIKTReportToAppleContext;
  v5 = -[TUIKTReportToAppleContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_failingValidation"));
    v6 = objc_claimAutoreleasedReturnValue();
    failingValidation = v5->_failingValidation;
    v5->_failingValidation = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_failingValidation, CFSTR("_failingValidation"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUIKTReportToAppleContext *v4;
  uint64_t v5;
  NSUUID *failingValidation;

  v4 = -[TUIKTReportToAppleContext init](+[TUIKTReportToAppleContext allocWithZone:](TUIKTReportToAppleContext, "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_failingValidation, "copy");
  failingValidation = v4->_failingValidation;
  v4->_failingValidation = (NSUUID *)v5;

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Notification Context with failing validation UUID: %@"), self->_failingValidation);
}

- (NSUUID)failingValidation
{
  return self->_failingValidation;
}

- (void)setFailingValidation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failingValidation, 0);
}

@end
