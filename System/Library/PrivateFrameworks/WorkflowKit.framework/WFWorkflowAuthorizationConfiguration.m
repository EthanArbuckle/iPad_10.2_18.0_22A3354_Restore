@implementation WFWorkflowAuthorizationConfiguration

- (id)authorizationDialogRequestWithAttribution:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+[WFWorkflowAuthorizationConfiguration authorizationDialogRequest] must be overridden"));
  __break(1u);
  return result;
}

- (id)siriDialogAlertWithCompletionHandler:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+[WFWorkflowAuthorizationConfiguration siriDialogAlert] must be overridden"));
  __break(1u);
  return result;
}

- (WFWorkflowAuthorizationConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFWorkflowAuthorizationConfiguration;
  return -[WFWorkflowAuthorizationConfiguration init](&v3, sel_init);
}

- (WFWorkflowAuthorizationConfiguration)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWorkflowAuthorizationConfiguration;
  return -[WFWorkflowAuthorizationConfiguration init](&v4, sel_init, a3);
}

- (NSString)localizedPrompt
{
  return self->_localizedPrompt;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end
