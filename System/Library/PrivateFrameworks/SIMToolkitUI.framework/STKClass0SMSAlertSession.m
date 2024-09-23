@implementation STKClass0SMSAlertSession

- (STKClass0SMSAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  STKClass0SMSAlertSession *v17;

  v11 = (void *)MEMORY[0x24BDD1448];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v11, "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKAlertSession.m"), 365, CFSTR("Initializer is unavailable"));

  v17 = -[STKClass0SMSAlertSession initWithLogger:responseProvider:options:sound:slot:](self, "initWithLogger:responseProvider:options:sound:slot:", v15, v14, v13, v12, 1);
  return v17;
}

- (STKClass0SMSAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6 slot:(int64_t)a7
{
  STKClass0SMSAlertSession *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STKClass0SMSAlertSession;
  result = -[STKAlertSession initWithLogger:responseProvider:options:sound:](&v9, sel_initWithLogger_responseProvider_options_sound_, a3, a4, a5, a6);
  if (result)
    result->_slot = a7;
  return result;
}

+ (BOOL)_requiresResponseProvider
{
  return 0;
}

- (int64_t)slot
{
  return self->_slot;
}

@end
