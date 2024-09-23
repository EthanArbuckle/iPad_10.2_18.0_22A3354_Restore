@implementation TUCallUpdate

- (TUCallUpdate)init
{
  TUCallUpdate *v2;
  void *v3;
  id contactsCountBlock;
  id clarityEnabledBlock;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUCallUpdate;
  v2 = -[TUCallUpdate init](&v10, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __20__TUCallUpdate_init__block_invoke;
    v7[3] = &unk_1E38A1868;
    objc_copyWeak(&v8, &location);
    v3 = _Block_copy(v7);
    contactsCountBlock = v2->_contactsCountBlock;
    v2->_contactsCountBlock = v3;

    clarityEnabledBlock = v2->_clarityEnabledBlock;
    v2->_clarityEnabledBlock = &__block_literal_global_3;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __20__TUCallUpdate_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C97298], "tu_contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tu_contactsForHandles:keyDescriptors:error:", v4, MEMORY[0x1E0C9AA60], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

- (TUCallUpdate)initWithProvider:(id)a3
{
  id v4;
  TUCallUpdate *v5;
  uint64_t v6;
  TUCallProvider *provider;
  void *v8;
  uint64_t v9;
  TUCallServicesInterface *callServicesInterface;

  v4 = a3;
  v5 = -[TUCallUpdate init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    provider = v5->_provider;
    v5->_provider = (TUCallProvider *)v6;

    +[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "callServicesInterface");
    v9 = objc_claimAutoreleasedReturnValue();
    callServicesInterface = v5->_callServicesInterface;
    v5->_callServicesInterface = (TUCallServicesInterface *)v9;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallUpdate UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUCallUpdate callUUID](self, "callUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callUUID=%@"), v5);

  -[TUCallUpdate provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" provider=%@"), v7);

  -[TUCallUpdate handle](self, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handle=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(" priority=%ld"), -[TUCallUpdate priority](self, "priority"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" junkConfidence=%ld"), -[TUCallUpdate junkConfidence](self, "junkConfidence"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteParticipantCount=%ld"), -[TUCallUpdate remoteParticipantCount](self, "remoteParticipantCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hasVideo=%d"), -[TUCallUpdate hasVideo](self, "hasVideo"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isConversation=%d"), -[TUCallUpdate isConversation](self, "isConversation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isAnsweringMachineAvailable=%d"), -[TUCallUpdate isAnsweringMachineAvailable](self, "isAnsweringMachineAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEligibleForScreening
{
  void *v3;
  int v4;
  uint64_t (**v5)(void);
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  const __CFString *v17;
  int v19;
  const __CFString *v20;
  __int16 v21;
  TUCallUpdate *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[TUCallUpdate featureFlags](self, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = TUCallScreeningEnabled(v3, 0);

  if (v4)
  {
    -[TUCallUpdate clarityEnabledBlock](self, "clarityEnabledBlock");
    v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v6 = v5[2]();

    if (v6)
    {
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: NO because ClarityUI is enabled", (uint8_t *)&v19, 2u);
      }
      LOBYTE(v4) = 0;
      goto LABEL_29;
    }
    if (-[TUCallUpdate priority](self, "priority") == 2)
    {
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: High Priority call, not screenable", (uint8_t *)&v19, 2u);
      }

      goto LABEL_21;
    }
    -[TUCallUpdate provider](self, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isTelephonyProvider") & 1) != 0)
    {
      v10 = -[TUCallUpdate junkConfidence](self, "junkConfidence");

      if (v10 < 2)
        goto LABEL_12;
    }
    else
    {

    }
    -[TUCallUpdate provider](self, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isFaceTimeProvider");

    if (!v12
      || (-[TUCallUpdate handle](self, "handle"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "normalizedValue"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          !v14)
      || -[TUCallUpdate remoteParticipantCount](self, "remoteParticipantCount") > 1
      || -[TUCallUpdate hasVideo](self, "hasVideo")
      || !-[TUCallUpdate isConversation](self, "isConversation")
      || !(*((uint64_t (**)(void))self->_contactsCountBlock + 2))())
    {
LABEL_21:
      TUDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

        v4 = 0;
        goto LABEL_25;
      }
      LOWORD(v19) = 0;
      v16 = "isEligibleForScreening: NO, either telephony Junk Call or Emergency or not a U+1 audio call from a contact";
LABEL_23:
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 2u);
      goto LABEL_24;
    }
LABEL_12:
    if (-[TUCallUpdate isAnsweringMachineAvailable](self, "isAnsweringMachineAvailable"))
    {
      v4 = 1;
      goto LABEL_25;
    }
    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    LOWORD(v19) = 0;
    v16 = "isEligibleForScreening: NO, Answering Machine is not currently available";
    goto LABEL_23;
  }
LABEL_25:
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = CFSTR("NO");
    if (v4)
      v17 = CFSTR("YES");
    v19 = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: %@ for call: %@", (uint8_t *)&v19, 0x16u);
  }
LABEL_29:

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callUUID, CFSTR("callUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_junkConfidence, CFSTR("junkConfidence"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remoteParticipantCount, CFSTR("remoteParticipantCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_conversation, CFSTR("conversation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasVideo, CFSTR("hasVideo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_answeringMachineAvailable, CFSTR("answeringMachineAvailable"));

}

- (TUCallUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TUCallUpdate *v7;
  void *v8;
  uint64_t v9;
  NSUUID *UUID;
  void *v11;
  uint64_t v12;
  NSUUID *callUUID;
  void *v14;
  uint64_t v15;
  TUHandle *handle;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = -[TUCallUpdate initWithProvider:](self, "initWithProvider:", v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    callUUID = v7->_callUUID;
    v7->_callUUID = (NSUUID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    handle = v7->_handle;
    v7->_handle = (TUHandle *)v15;

    v7->_priority = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("priority"));
    v7->_junkConfidence = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("junkConfidence"));
    v7->_remoteParticipantCount = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("remoteParticipantCount"));
    v7->_conversation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("conversation"));
    v7->_hasVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasVideo"));
    v7->_answeringMachineAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("answeringMachineAvailable"));
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUCallUpdate *v4;
  void *v5;
  TUCallUpdate *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = +[TUCallUpdate allocWithZone:](TUCallUpdate, "allocWithZone:", a3);
  -[TUCallUpdate provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUCallUpdate initWithProvider:](v4, "initWithProvider:", v5);

  -[TUCallUpdate UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[TUCallUpdate setUUID:](v6, "setUUID:", v8);

  -[TUCallUpdate callUUID](self, "callUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[TUCallUpdate setCallUUID:](v6, "setCallUUID:", v10);

  -[TUCallUpdate handle](self, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[TUCallUpdate setHandle:](v6, "setHandle:", v12);

  -[TUCallUpdate setPriority:](v6, "setPriority:", -[TUCallUpdate priority](self, "priority"));
  -[TUCallUpdate setJunkConfidence:](v6, "setJunkConfidence:", -[TUCallUpdate junkConfidence](self, "junkConfidence"));
  -[TUCallUpdate setRemoteParticipantCount:](v6, "setRemoteParticipantCount:", -[TUCallUpdate remoteParticipantCount](self, "remoteParticipantCount"));
  -[TUCallUpdate setConversation:](v6, "setConversation:", -[TUCallUpdate isConversation](self, "isConversation"));
  -[TUCallUpdate setHasVideo:](v6, "setHasVideo:", -[TUCallUpdate hasVideo](self, "hasVideo"));
  -[TUCallUpdate setAnsweringMachineAvailable:](v6, "setAnsweringMachineAvailable:", -[TUCallUpdate isAnsweringMachineAvailable](self, "isAnsweringMachineAvailable"));
  return v6;
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (unint64_t)remoteParticipantCount
{
  return self->_remoteParticipantCount;
}

- (void)setRemoteParticipantCount:(unint64_t)a3
{
  self->_remoteParticipantCount = a3;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
  objc_storeStrong((id *)&self->_callUUID, a3);
}

- (BOOL)isAnsweringMachineAvailable
{
  return self->_answeringMachineAvailable;
}

- (void)setAnsweringMachineAvailable:(BOOL)a3
{
  self->_answeringMachineAvailable = a3;
}

- (void)setEligibleForScreening:(BOOL)a3
{
  self->_eligibleForScreening = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (TUCallServicesInterface)callServicesInterface
{
  return self->_callServicesInterface;
}

- (void)setCallServicesInterface:(id)a3
{
  objc_storeStrong((id *)&self->_callServicesInterface, a3);
}

- (id)contactsCountBlock
{
  return self->_contactsCountBlock;
}

- (void)setContactsCountBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)clarityEnabledBlock
{
  return self->_clarityEnabledBlock;
}

- (void)setClarityEnabledBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

- (void)setJunkConfidence:(int64_t)a3
{
  self->_junkConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clarityEnabledBlock, 0);
  objc_storeStrong(&self->_contactsCountBlock, 0);
  objc_storeStrong((id *)&self->_callServicesInterface, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
