@implementation PPXPCServer

+ (void)_registerNamedEntityReadOnlyListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerNamedEntityReadOnlyListener_delegate;
  _registerNamedEntityReadOnlyListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.NamedEntity.readOnly"));
  v5 = (void *)_registerNamedEntityReadOnlyListener_listener;
  _registerNamedEntityReadOnlyListener_listener = v4;

  objc_msgSend((id)_registerNamedEntityReadOnlyListener_listener, "setDelegate:", _registerNamedEntityReadOnlyListener_delegate);
  objc_msgSend((id)_registerNamedEntityReadOnlyListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Named Entity Read Only XPC service", v7, 2u);
  }

}

+ (void)_registerNamedEntityReadWriteListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerNamedEntityReadWriteListener_delegate;
  _registerNamedEntityReadWriteListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite"));
  v5 = (void *)_registerNamedEntityReadWriteListener_listener;
  _registerNamedEntityReadWriteListener_listener = v4;

  objc_msgSend((id)_registerNamedEntityReadWriteListener_listener, "setDelegate:", _registerNamedEntityReadWriteListener_delegate);
  objc_msgSend((id)_registerNamedEntityReadWriteListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Named Entity Read/Write XPC service", v7, 2u);
  }

}

+ (void)_registerTopicReadOnlyListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerTopicReadOnlyListener_delegate;
  _registerTopicReadOnlyListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readOnly"));
  v5 = (void *)_registerTopicReadOnlyListener_listener;
  _registerTopicReadOnlyListener_listener = v4;

  objc_msgSend((id)_registerTopicReadOnlyListener_listener, "setDelegate:", _registerTopicReadOnlyListener_delegate);
  objc_msgSend((id)_registerTopicReadOnlyListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Topic Read Only XPC service", v7, 2u);
  }

}

+ (void)_registerTopicReadWriteListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerTopicReadWriteListener_delegate;
  _registerTopicReadWriteListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Topic.readWrite"));
  v5 = (void *)_registerTopicReadWriteListener_listener;
  _registerTopicReadWriteListener_listener = v4;

  objc_msgSend((id)_registerTopicReadWriteListener_listener, "setDelegate:", _registerTopicReadWriteListener_delegate);
  objc_msgSend((id)_registerTopicReadWriteListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Topic Read/Write XPC service", v7, 2u);
  }

}

+ (void)_registerLocationReadOnlyListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerLocationReadOnlyListener_delegate;
  _registerLocationReadOnlyListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Location.readOnly"));
  v5 = (void *)_registerLocationReadOnlyListener_listener;
  _registerLocationReadOnlyListener_listener = v4;

  objc_msgSend((id)_registerLocationReadOnlyListener_listener, "setDelegate:", _registerLocationReadOnlyListener_delegate);
  objc_msgSend((id)_registerLocationReadOnlyListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Location Read Only XPC service", v7, 2u);
  }

}

+ (void)_registerLocationReadWriteListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerLocationReadWriteListener_delegate;
  _registerLocationReadWriteListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Location.readWrite"));
  v5 = (void *)_registerLocationReadWriteListener_listener;
  _registerLocationReadWriteListener_listener = v4;

  objc_msgSend((id)_registerLocationReadWriteListener_listener, "setDelegate:", _registerLocationReadWriteListener_delegate);
  objc_msgSend((id)_registerLocationReadWriteListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Location Read/Write XPC service", v7, 2u);
  }

}

+ (void)_registerQuickTypeListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerQuickTypeListener_delegate;
  _registerQuickTypeListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.QuickType"));
  v5 = (void *)_registerQuickTypeListener_listener;
  _registerQuickTypeListener_listener = v4;

  objc_msgSend((id)_registerQuickTypeListener_listener, "setDelegate:", _registerQuickTypeListener_delegate);
  objc_msgSend((id)_registerQuickTypeListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for QuickType XPC service", v7, 2u);
  }

}

+ (void)_registerContactListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerContactListener_delegate;
  _registerContactListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Contact"));
  v5 = (void *)_registerContactListener_listener;
  _registerContactListener_listener = v4;

  objc_msgSend((id)_registerContactListener_listener, "setDelegate:", _registerContactListener_delegate);
  objc_msgSend((id)_registerContactListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Contact XPC service", v7, 2u);
  }

}

+ (void)_registerEventListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerEventListener_delegate;
  _registerEventListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Event"));
  v5 = (void *)_registerEventListener_listener;
  _registerEventListener_listener = v4;

  objc_msgSend((id)_registerEventListener_listener, "setDelegate:", _registerEventListener_delegate);
  objc_msgSend((id)_registerEventListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Event XPC service", v7, 2u);
  }

}

+ (void)_registerConnectionsListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerConnectionsListener_delegate;
  _registerConnectionsListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Connections"));
  v5 = (void *)_registerConnectionsListener_listener;
  _registerConnectionsListener_listener = v4;

  objc_msgSend((id)_registerConnectionsListener_listener, "setDelegate:", _registerConnectionsListener_delegate);
  objc_msgSend((id)_registerConnectionsListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Connections XPC service", v7, 2u);
  }

}

+ (void)_registerConfigListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerConfigListener_delegate;
  _registerConfigListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Config"));
  v5 = (void *)_registerConfigListener_listener;
  _registerConfigListener_listener = v4;

  objc_msgSend((id)_registerConfigListener_listener, "setDelegate:", _registerConfigListener_delegate);
  objc_msgSend((id)_registerConfigListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Config XPC service", v7, 2u);
  }

}

+ (void)_registerInternalListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerInternalListener_delegate;
  _registerInternalListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.Internal"));
  v5 = (void *)_registerInternalListener_listener;
  _registerInternalListener_listener = v4;

  objc_msgSend((id)_registerInternalListener_listener, "setDelegate:", _registerInternalListener_delegate);
  objc_msgSend((id)_registerInternalListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Internal XPC service", v7, 2u);
  }

}

+ (void)_registerStringDonationListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerStringDonationListener_delegate;
  _registerStringDonationListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.suggestd.PersonalizationPortrait.StringDonation"));
  v5 = (void *)_registerStringDonationListener_listener;
  _registerStringDonationListener_listener = v4;

  objc_msgSend((id)_registerStringDonationListener_listener, "setDelegate:", _registerStringDonationListener_delegate);
  objc_msgSend((id)_registerStringDonationListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for String Donation", v7, 2u);
  }

}

+ (void)_registerSocialHighlightListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerSocialHighlightListener_delegate;
  _registerSocialHighlightListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlight"));
  v5 = (void *)_registerSocialHighlightListener_listener;
  _registerSocialHighlightListener_listener = v4;

  objc_msgSend((id)_registerSocialHighlightListener_listener, "setDelegate:", _registerSocialHighlightListener_delegate);
  objc_msgSend((id)_registerSocialHighlightListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for Social Highlight XPC service", v7, 2u);
  }

}

+ (void)_registerTemporalClusterListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerTemporalClusterListener_delegate;
  _registerTemporalClusterListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.PersonalizationPortrait.TemporalCluster"));
  v5 = (void *)_registerTemporalClusterListener_listener;
  _registerTemporalClusterListener_listener = v4;

  objc_msgSend((id)_registerTemporalClusterListener_listener, "setDelegate:", _registerTemporalClusterListener_delegate);
  objc_msgSend((id)_registerTemporalClusterListener_listener, "resume");
  pp_xpc_server_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Registered for TemporalCluster XPC service", v7, 2u);
  }

}

+ (void)registerXPCListeners
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PPXPCServer_registerXPCListeners__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_B8__0l;
  aBlock[4] = a1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PPXPCServer_registerXPCListeners__block_invoke_53;
  v6[3] = &unk_1E7E1B2B0;
  v7 = _Block_copy(aBlock);
  v2 = registerXPCListeners__pasOnceToken18;
  v3 = v7;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&registerXPCListeners__pasOnceToken18, v6);
    v5 = v7;
  }

}

uint64_t __35__PPXPCServer_registerXPCListeners__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  pp_xpc_server_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "Registering for Portrait XPC services", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_registerNamedEntityReadOnlyListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerNamedEntityReadWriteListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerTopicReadOnlyListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerTopicReadWriteListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerLocationReadOnlyListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerLocationReadWriteListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerQuickTypeListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerContactListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerEventListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerConnectionsListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerConfigListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerInternalListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerStringDonationListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerSocialHighlightListener");
  objc_msgSend(*(id *)(a1 + 32), "_registerTemporalClusterListener");
  return 1;
}

void __35__PPXPCServer_registerXPCListeners__block_invoke_53(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
