@implementation PKPassRelevancyModel

- (PKPassRelevancyModel)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassRelevancyModel;
  return -[PKPassRelevancyModel init](&v3, sel_init);
}

- (PKPassRelevancyModel)initWithRelevancyActive:(BOOL)a3
{
  PKPassRelevancyModel *result;

  result = -[PKPassRelevancyModel _init](self, "_init");
  if (result)
    result->_relevancyActive = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_relevancyActive)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("relevancy active: %@"), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassRelevancyModel)initWithCoder:(id)a3
{
  id v4;
  PKPassRelevancyModel *v5;

  v4 = a3;
  v5 = -[PKPassRelevancyModel _init](self, "_init");
  if (v5)
    v5->_relevancyActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("relevancyActive"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_relevancyActive, CFSTR("relevancyActive"));
}

- (BOOL)relevancyActive
{
  return self->_relevancyActive;
}

- (void)setRelevancyActive:(BOOL)a3
{
  self->_relevancyActive = a3;
}

@end
