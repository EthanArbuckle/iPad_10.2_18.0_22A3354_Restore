@implementation SMConversationDeletedNotification

- (SMConversationDeletedNotification)init
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SMConversationDeletedNotification init]";
    v7 = 1024;
    v8 = 113;
    _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "default initializer not supported for SMConversationDeletedNotification (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (SMConversationDeletedNotification)initWithConversation:(id)a3
{
  id v6;
  SMConversationDeletedNotification *v7;
  SMConversationDeletedNotification *v8;
  NSObject *v9;
  SMConversationDeletedNotification *v10;
  NSObject *v11;
  objc_class *v13;
  void *v14;
  void *v15;
  SMConversation *conversation;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  SMConversation *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v17.receiver = self;
    v17.super_class = (Class)SMConversationDeletedNotification;
    v7 = -[RTNotification init](&v17, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_conversation, a3);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        conversation = v8->_conversation;
        *(_DWORD *)buf = 138412802;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = conversation;
        _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,conversation,%@", buf, 0x20u);

      }
    }
    self = v8;
    v10 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
