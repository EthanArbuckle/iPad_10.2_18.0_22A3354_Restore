@implementation SiriAnalyticsError

- (SiriAnalyticsError)init
{

  return 0;
}

- (SiriAnalyticsError)initWithErrorType:(unint64_t)a3 message:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  SiriAnalyticsError *v10;
  SiriAnalyticsError *v11;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v14 = CFSTR("message");
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)SiriAnalyticsError;
  v10 = -[SiriAnalyticsError initWithDomain:code:userInfo:](&v13, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.siri.analytics"), a3, v9);
  v11 = v10;
  if (v10)
  {
    v10->_errorType = a3;
    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v11;
}

- (unint64_t)errorType
{
  return self->_errorType;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
