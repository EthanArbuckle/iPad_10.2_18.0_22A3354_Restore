@implementation WFSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WFSettingsClientErrorDomain"), 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

@end
