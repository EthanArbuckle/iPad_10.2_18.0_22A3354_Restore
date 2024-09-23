@implementation WFRemoteQuarantineDecision

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("policy");
  v3[1] = CFSTR("errorTitle");
  v4[0] = CFSTR("policy");
  v4[1] = CFSTR("errorTitle");
  v3[2] = CFSTR("errorMessage");
  v4[2] = CFSTR("errorMessage");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)policy
{
  return self->_policy;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
}

@end
