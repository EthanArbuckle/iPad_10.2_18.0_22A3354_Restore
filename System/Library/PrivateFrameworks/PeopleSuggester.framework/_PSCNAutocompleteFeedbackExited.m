@implementation _PSCNAutocompleteFeedbackExited

- (_PSCNAutocompleteFeedbackExited)initWithExitStatus:(int64_t)a3
{
  _PSCNAutocompleteFeedbackExited *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PSCNAutocompleteFeedbackExited;
  result = -[_PSCNAutocompleteFeedbackExited init](&v5, sel_init);
  if (result)
    result->_exitStatus = a3;
  return result;
}

- (_PSCNAutocompleteFeedbackExited)initWithCoder:(id)a3
{
  id v4;
  _PSCNAutocompleteFeedbackExited *v5;
  _PSCNAutocompleteFeedbackExited *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSCNAutocompleteFeedbackExited;
  v5 = -[_PSCNAutocompleteFeedbackExited init](&v8, sel_init);
  if (v5)
  {
    v5->_exitStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("exitStatus"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_exitStatus, CFSTR("exitStatus"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)exitStatus
{
  return self->_exitStatus;
}

@end
