@implementation _PSCNAutocompleteFeedbackEntered

- (_PSCNAutocompleteFeedbackEntered)initWithEnterStatus:(int64_t)a3
{
  _PSCNAutocompleteFeedbackEntered *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PSCNAutocompleteFeedbackEntered;
  result = -[_PSCNAutocompleteFeedbackEntered init](&v5, sel_init);
  if (result)
    result->_enterStatus = a3;
  return result;
}

- (_PSCNAutocompleteFeedbackEntered)initWithCoder:(id)a3
{
  id v4;
  _PSCNAutocompleteFeedbackEntered *v5;
  _PSCNAutocompleteFeedbackEntered *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSCNAutocompleteFeedbackEntered;
  v5 = -[_PSCNAutocompleteFeedbackEntered init](&v8, sel_init);
  if (v5)
  {
    v5->_enterStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("enterStatus"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_enterStatus, CFSTR("enterStatus"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)enterStatus
{
  return self->_enterStatus;
}

@end
