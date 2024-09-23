@implementation SCDAMaxNoOperationDelay

void __SCDAMaxNoOperationDelay_block_invoke()
{
  uint64_t v0;
  id v1;

  SCDAMaxNoOperationDelay_noopDelay = 0x3F747AE147AE147BLL;
  +[SCDAAssistantPreferences sharedPreferences](SCDAAssistantPreferences, "sharedPreferences");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "myriadMaxNoOperationDelay");
  SCDAMaxNoOperationDelay_noopDelay = v0;

}

@end
