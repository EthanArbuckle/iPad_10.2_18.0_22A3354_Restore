@implementation TIKeyboardSecureTouchManager

- (void)clearRegistrations
{
  -[NSMutableDictionary removeAllObjects](self->_slots, "removeAllObjects");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21178 != -1)
    dispatch_once(&sharedInstance_onceToken_21178, &__block_literal_global_21179);
  return (id)sharedInstance_manager;
}

- (TIKeyboardSecureTouchManager)init
{
  TIKeyboardSecureTouchManager *v2;
  uint64_t v3;
  NSMutableDictionary *slots;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardSecureTouchManager;
  v2 = -[TIKeyboardSecureTouchManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    slots = v2->_slots;
    v2->_slots = (NSMutableDictionary *)v3;

    v2->_lastVerifiedMessageTimestamp = mach_continuous_time();
  }
  return v2;
}

- (void)registerSlotID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  TIKeyboardSecureTouchSlot *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[TIKeyboardSecureTouchManager registerSlotID:]";
    v16 = 1024;
    v17 = v3;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Registering slotID %X", buf, 0x12u);
  }
  if ((_DWORD)v3)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__TIKeyboardSecureTouchManager_registerSlotID___block_invoke;
    v12[3] = &__block_descriptor_36_e52_v16__0__BKSMutableTouchAuthenticationSpecification_8l;
    v13 = v3;
    objc_msgSend(MEMORY[0x1E0D00DF8], "buildSpecification:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(TIKeyboardSecureTouchSlot);
    -[TIKeyboardSecureTouchSlot setSlotID:](v6, "setSlotID:", v3);
    if (!-[TIKeyboardSecureTouchManager bypassCommunication](self, "bypassCommunication"))
    {
      objc_msgSend(MEMORY[0x1E0D00E18], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAuthenticationSpecifications:forReason:", v8, CFSTR("kbd registration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardSecureTouchSlot setInvalidatable:](v6, "setInvalidatable:", v9);

    }
    -[TIKeyboardSecureTouchSlot setAuthenticationMessageContext:](v6, "setAuthenticationMessageContext:", 0x6779E7E572E4C6A7);
    -[TIKeyboardSecureTouchManager slots](self, "slots");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v6, v11);

  }
}

- (BOOL)verifySlotID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  double v17;
  BOOL v19;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[TIKeyboardSecureTouchManager verifySlotID:]";
    v23 = 1024;
    LODWORD(v24) = v3;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Verifying slotID %X", (uint8_t *)&v21, 0x12u);
  }
  -[TIKeyboardSecureTouchManager slots](self, "slots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardSecureTouchManager lastEventAuthenticationMessage](self, "lastEventAuthenticationMessage");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    if (objc_msgSend(v7, "slotID") == (_DWORD)v3
      && (-[TIKeyboardSecureTouchManager bypassCommunication](self, "bypassCommunication")
       || (objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance"),
           v11 = (void *)objc_claimAutoreleasedReturnValue(),
           v12 = objc_msgSend(v11, "authenticateMessage:", v9),
           v11,
           v12 == 2))
      && (v13 = objc_msgSend(v7, "authenticationMessageContext"), v13 == objc_msgSend(v9, "context")))
    {
      v14 = objc_msgSend(v9, "timestamp");
      v15 = v14 > -[TIKeyboardSecureTouchManager lastVerifiedMessageTimestamp](self, "lastVerifiedMessageTimestamp");
    }
    else
    {
      v15 = 0;
    }
    v16 = mach_continuous_time();
    v17 = (double)(v16 - objc_msgSend(v9, "timestamp"));
    if (_TIGetMachTimeScale_once != -1)
      dispatch_once(&_TIGetMachTimeScale_once, &__block_literal_global_74_21164);
    if (*(double *)&_TIGetMachTimeScale_scale * v17 < 2.0 && v15)
    {
      -[TIKeyboardSecureTouchManager setLastVerifiedMessageTimestamp:](self, "setLastVerifiedMessageTimestamp:", objc_msgSend(v9, "timestamp", *(double *)&_TIGetMachTimeScale_scale * v17));
LABEL_22:
      v19 = 1;
      goto LABEL_23;
    }
  }
  if (_AXSVoiceOverTouchEnabled() || _AXSFullKeyboardAccessEnabled())
    goto LABEL_22;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = 136315650;
    v22 = "-[TIKeyboardSecureTouchManager verifySlotID:]";
    v23 = 2112;
    v24 = v9;
    v25 = 1024;
    v26 = v3;
    _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Failed to authenticate message %@ for slotID %X", (uint8_t *)&v21, 0x1Cu);
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (unint64_t)authenticationMessageContextForSlotID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = *(_QWORD *)&a3;
  -[TIKeyboardSecureTouchManager slots](self, "slots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "authenticationMessageContext");

  return v7;
}

- (NSMutableDictionary)slots
{
  return self->_slots;
}

- (void)setSlots:(id)a3
{
  objc_storeStrong((id *)&self->_slots, a3);
}

- (BKSHIDEventAuthenticationMessage)lastEventAuthenticationMessage
{
  return self->_lastEventAuthenticationMessage;
}

- (void)setLastEventAuthenticationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lastEventAuthenticationMessage, a3);
}

- (unint64_t)lastVerifiedMessageTimestamp
{
  return self->_lastVerifiedMessageTimestamp;
}

- (void)setLastVerifiedMessageTimestamp:(unint64_t)a3
{
  self->_lastVerifiedMessageTimestamp = a3;
}

- (BOOL)bypassCommunication
{
  return self->_bypassCommunication;
}

- (void)setBypassCommunication:(BOOL)a3
{
  self->_bypassCommunication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEventAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_slots, 0);
}

void __47__TIKeyboardSecureTouchManager_registerSlotID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(unsigned int *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSlotID:", v2);
  objc_msgSend(v3, "setAuthenticationMessageContext:", 0x6779E7E572E4C6A7);

}

void __46__TIKeyboardSecureTouchManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = v0;

}

@end
