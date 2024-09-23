@implementation PPEventStreamHandler

+ (void)prepareToHandleNotificationWithName:(id)a3
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ABAddressBookMeCardChangeDistributedNotification")))
  {
    pp_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "instantiating contact store to deal with Me card change", v5, 2u);
    }

    v4 = +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
  }
}

@end
