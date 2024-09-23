@implementation SpotlightSenderState

- (BOOL)clientDisabled:(int64_t)a3
{
  char v3;
  SpotlightSenderState *v4;
  unsigned int v5;
  int check;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  check = 0;
  notify_check(-[CSReceiverServerPreferences notifyToken](v4->_serverPreferences, "notifyToken"), &check);
  if (check == 1)
    -[SpotlightSenderState _updateFromPreferences](v4, "_updateFromPreferences");
  v5 = sClintServiceDisabledBitMap >> v3;
  objc_sync_exit(v4);

  return v5 & 1;
}

- (SpotlightSenderState)init
{
  SpotlightSenderState *v2;
  CSReceiverServerPreferences *v3;
  CSReceiverServerPreferences *serverPreferences;
  int check;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SpotlightSenderState;
  v2 = -[SpotlightSenderState init](&v7, sel_init);
  if (v2)
  {
    v3 = (CSReceiverServerPreferences *)objc_alloc_init(MEMORY[0x24BDC2450]);
    serverPreferences = v2->_serverPreferences;
    v2->_serverPreferences = v3;

    if (-[CSReceiverServerPreferences notifyStart](v2->_serverPreferences, "notifyStart"))
    {
      check = 0;
      notify_check(-[CSReceiverServerPreferences notifyToken](v2->_serverPreferences, "notifyToken"), &check);
      -[SpotlightSenderState _updateFromPreferences](v2, "_updateFromPreferences");
    }
  }
  return v2;
}

- (void)_updateFromPreferences
{
  void *v2;
  NSObject *v3;
  int v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CSReceiverServerPreferences disabledServices](self->_serverPreferences, "disabledServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__SpotlightSenderState__updateFromPreferences__block_invoke;
  v5[3] = &unk_24D0EA8E8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  if (*((_DWORD *)v7 + 6) != sClintServiceDisabledBitMap)
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *((_DWORD *)v7 + 6);
      *(_DWORD *)buf = 67109376;
      v11 = sClintServiceDisabledBitMap;
      v12 = 1024;
      v13 = v4;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Enabled client state changed from 0x%x to 0x%x", buf, 0xEu);
    }

    sClintServiceDisabledBitMap = *((_DWORD *)v7 + 6);
  }
  _Block_object_dispose(&v6, 8);
}

void __46__SpotlightSenderState__updateFromPreferences__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  char v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "length");
  if (v3 == objc_msgSend(CFSTR("com.apple.corespotlight.receiver.coreduet"), "length")
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.corespotlight.receiver.coreduet")) & 1) != 0)
  {
    v4 = 1;
LABEL_10:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 1 << v4;
    goto LABEL_11;
  }
  if (v3 == objc_msgSend(CFSTR("com.apple.corespotlight.receiver.suggestions"), "length")
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.corespotlight.receiver.suggestions")) & 1) != 0)
  {
    v4 = 2;
    goto LABEL_10;
  }
  if (v3 == objc_msgSend(CFSTR("com.apple.corespotlight.receiver.corespotlight"), "length")
    && objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.corespotlight.receiver.corespotlight")))
  {
    v4 = 0;
    goto LABEL_10;
  }
LABEL_11:

}

- (CSReceiverServerPreferences)serverPreferences
{
  return self->_serverPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverPreferences, 0);
}

@end
