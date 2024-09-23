@implementation SEKeySyncService

+ (id)transcodeTLKShares:(id)a3 fromCurrentIdentifier:(id)a4 toIdentity:(id)a5 outError:(id *)a6
{
  void *v7;

  if (a6)
  {
    SESDefaultLogObject();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (void)recoveryDidComplete:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced.shared"));
  objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("keysync.recovery.required"));
  notify_post("com.apple.seservice.keysync.recoverydidcomplete");

}

@end
