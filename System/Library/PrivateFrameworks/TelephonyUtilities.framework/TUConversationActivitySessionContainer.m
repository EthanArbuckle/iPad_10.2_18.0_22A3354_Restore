@implementation TUConversationActivitySessionContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a3;
  -[TUConversationActivitySessionContainer UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationActivitySessionContainer groupUUID](self, "groupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_groupUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[TUConversationActivitySessionContainer state](self, "state");
  NSStringFromSelector(sel_state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[TUConversationActivitySessionContainer activitySessions](self, "activitySessions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activitySessions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUConversationActivitySessionContainer remoteMembers](self, "remoteMembers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteMembers);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUConversationActivitySessionContainer localMember](self, "localMember");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localMember);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUConversationActivitySessionContainer initiator](self, "initiator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiator);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  v19 = -[TUConversationActivitySessionContainer localParticipantIdentifier](self, "localParticipantIdentifier");
  NSStringFromSelector(sel_localParticipantIdentifier);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v19, v20);

  -[TUConversationActivitySessionContainer virtualParticipants](self, "virtualParticipants");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_virtualParticipants);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[TUConversationActivitySessionContainer virtualParticipantConfig](self, "virtualParticipantConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_virtualParticipantConfig);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[TUConversationActivitySessionContainer unreliableMessengerConfig](self, "unreliableMessengerConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_unreliableMessengerConfig);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[TUConversationActivitySessionContainer activeRemoteParticipants](self, "activeRemoteParticipants");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activeRemoteParticipants);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, v27);

}

- (TUConversationActivitySessionContainer)initWithCoder:(id)a3
{
  id v4;
  TUConversationActivitySessionContainer *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *UUID;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSUUID *groupUUID;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *activitySessions;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSSet *remoteMembers;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  TUConversationMember *localMember;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  TUHandle *initiator;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSSet *virtualParticipants;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  TUConversationVirtualParticipantConfig *virtualParticipantConfig;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  TUConversationUnreliableMessengerConfig *unreliableMessengerConfig;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSSet *activeRemoteParticipants;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)TUConversationActivitySessionContainer;
  v5 = -[TUConversationActivitySessionContainer init](&v57, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_groupUUID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    groupUUID = v5->_groupUUID;
    v5->_groupUUID = (NSUUID *)v12;

    NSStringFromSelector(sel_state);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", v14);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activitySessions);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    activitySessions = v5->_activitySessions;
    v5->_activitySessions = (NSSet *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_remoteMembers);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    remoteMembers = v5->_remoteMembers;
    v5->_remoteMembers = (NSSet *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_localMember);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    localMember = v5->_localMember;
    v5->_localMember = (TUConversationMember *)v29;

    v31 = objc_opt_class();
    NSStringFromSelector(sel_initiator);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    initiator = v5->_initiator;
    v5->_initiator = (TUHandle *)v33;

    NSStringFromSelector(sel_localParticipantIdentifier);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localParticipantIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", v35);

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_virtualParticipants);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    virtualParticipants = v5->_virtualParticipants;
    v5->_virtualParticipants = (NSSet *)v40;

    v42 = objc_opt_class();
    NSStringFromSelector(sel_virtualParticipantConfig);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    virtualParticipantConfig = v5->_virtualParticipantConfig;
    v5->_virtualParticipantConfig = (TUConversationVirtualParticipantConfig *)v44;

    v46 = objc_opt_class();
    NSStringFromSelector(sel_unreliableMessengerConfig);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    unreliableMessengerConfig = v5->_unreliableMessengerConfig;
    v5->_unreliableMessengerConfig = (TUConversationUnreliableMessengerConfig *)v48;

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activeRemoteParticipants);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    activeRemoteParticipants = v5->_activeRemoteParticipants;
    v5->_activeRemoteParticipants = (NSSet *)v54;

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySessionContainer UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUConversationActivitySessionContainer groupUUID](self, "groupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" groupUUID=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" state=%ld"), -[TUConversationActivitySessionContainer state](self, "state"));
  -[TUConversationActivitySessionContainer activitySessions](self, "activitySessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" activitySessions=%@"), v6);

  -[TUConversationActivitySessionContainer remoteMembers](self, "remoteMembers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteMembers=%@"), v7);

  -[TUConversationActivitySessionContainer localMember](self, "localMember");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localMember=%@"), v8);

  -[TUConversationActivitySessionContainer initiator](self, "initiator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" initiator=%@"), v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[TUConversationActivitySessionContainer localParticipantIdentifier](self, "localParticipantIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localParticipantIdentifier=%@"), v10);

  -[TUConversationActivitySessionContainer virtualParticipants](self, "virtualParticipants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" virtualParticipants=%@"), v11);

  -[TUConversationActivitySessionContainer virtualParticipantConfig](self, "virtualParticipantConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" virtualParticipantConfig=%@"), v12);

  -[TUConversationActivitySessionContainer unreliableMessengerConfig](self, "unreliableMessengerConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" unreliableMessengerConfig=%@"), v13);

  -[TUConversationActivitySessionContainer activeRemoteParticipants](self, "activeRemoteParticipants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" activeRemoteParticipants=%@"), v14);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUConversationActivitySessionContainer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = objc_alloc_init(TUConversationActivitySessionContainer);
  -[TUConversationActivitySessionContainer UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[TUConversationActivitySessionContainer setUUID:](v4, "setUUID:", v6);

  -[TUConversationActivitySessionContainer groupUUID](self, "groupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[TUConversationActivitySessionContainer setGroupUUID:](v4, "setGroupUUID:", v8);

  -[TUConversationActivitySessionContainer setState:](v4, "setState:", -[TUConversationActivitySessionContainer state](self, "state"));
  -[TUConversationActivitySessionContainer activitySessions](self, "activitySessions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[TUConversationActivitySessionContainer setActivitySessions:](v4, "setActivitySessions:", v10);

  -[TUConversationActivitySessionContainer remoteMembers](self, "remoteMembers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[TUConversationActivitySessionContainer setRemoteMembers:](v4, "setRemoteMembers:", v12);

  -[TUConversationActivitySessionContainer localMember](self, "localMember");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[TUConversationActivitySessionContainer setLocalMember:](v4, "setLocalMember:", v14);

  -[TUConversationActivitySessionContainer initiator](self, "initiator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[TUConversationActivitySessionContainer setInitiator:](v4, "setInitiator:", v16);

  -[TUConversationActivitySessionContainer setLocalParticipantIdentifier:](v4, "setLocalParticipantIdentifier:", -[TUConversationActivitySessionContainer localParticipantIdentifier](self, "localParticipantIdentifier"));
  -[TUConversationActivitySessionContainer virtualParticipants](self, "virtualParticipants");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[TUConversationActivitySessionContainer setVirtualParticipants:](v4, "setVirtualParticipants:", v18);

  -[TUConversationActivitySessionContainer virtualParticipantConfig](self, "virtualParticipantConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[TUConversationActivitySessionContainer setVirtualParticipantConfig:](v4, "setVirtualParticipantConfig:", v20);

  -[TUConversationActivitySessionContainer unreliableMessengerConfig](self, "unreliableMessengerConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[TUConversationActivitySessionContainer setUnreliableMessengerConfig:](v4, "setUnreliableMessengerConfig:", v22);

  -[TUConversationActivitySessionContainer activeRemoteParticipants](self, "activeRemoteParticipants");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[TUConversationActivitySessionContainer setActiveRemoteParticipants:](v4, "setActiveRemoteParticipants:", v24);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationActivitySessionContainer *v4;
  BOOL v5;

  v4 = (TUConversationActivitySessionContainer *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationActivitySessionContainer isEqualToContainer:](self, "isEqualToContainer:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v24;
  void *v25;

  -[TUConversationActivitySessionContainer activeRemoteParticipants](self, "activeRemoteParticipants");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[TUConversationActivitySessionContainer activitySessions](self, "activitySessions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash") ^ v3;
  -[TUConversationActivitySessionContainer groupUUID](self, "groupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[TUConversationActivitySessionContainer initiator](self, "initiator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash");
  v9 = -[TUConversationActivitySessionContainer localParticipantIdentifier](self, "localParticipantIdentifier");
  -[TUConversationActivitySessionContainer localMember](self, "localMember");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[TUConversationActivitySessionContainer remoteMembers](self, "remoteMembers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v11 ^ objc_msgSend(v12, "hash");
  v14 = -[TUConversationActivitySessionContainer state](self, "state");
  -[TUConversationActivitySessionContainer UUID](self, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[TUConversationActivitySessionContainer virtualParticipants](self, "virtualParticipants");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[TUConversationActivitySessionContainer virtualParticipantConfig](self, "virtualParticipantConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13 ^ v18 ^ objc_msgSend(v19, "hash");
  -[TUConversationActivitySessionContainer unreliableMessengerConfig](self, "unreliableMessengerConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");

  return v22;
}

- (BOOL)isEqualToContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  -[TUConversationActivitySessionContainer activeRemoteParticipants](self, "activeRemoteParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeRemoteParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[TUConversationActivitySessionContainer activitySessions](self, "activitySessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activitySessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUConversationActivitySessionContainer groupUUID](self, "groupUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "groupUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[TUConversationActivitySessionContainer initiator](self, "initiator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "initiator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          v33 = v11;
          v13 = -[TUConversationActivitySessionContainer localParticipantIdentifier](self, "localParticipantIdentifier");
          if (v13 == objc_msgSend(v4, "localParticipantIdentifier"))
          {
            -[TUConversationActivitySessionContainer localMember](self, "localMember");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "localMember");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)v14;
            if (TUObjectsAreEqualOrNil(v14, (uint64_t)v31))
            {
              -[TUConversationActivitySessionContainer remoteMembers](self, "remoteMembers");
              v15 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "remoteMembers");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)v15;
              if (TUObjectsAreEqualOrNil(v15, (uint64_t)v29)
                && (v16 = -[TUConversationActivitySessionContainer state](self, "state"),
                    v16 == objc_msgSend(v4, "state")))
              {
                -[TUConversationActivitySessionContainer UUID](self, "UUID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "UUID");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v17;
                v18 = objc_msgSend(v17, "isEqual:");
                v11 = v33;
                if (v18)
                {
                  -[TUConversationActivitySessionContainer virtualParticipants](self, "virtualParticipants");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "virtualParticipants");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (TUObjectsAreEqualOrNil((unint64_t)v26, (uint64_t)v25))
                  {
                    -[TUConversationActivitySessionContainer virtualParticipantConfig](self, "virtualParticipantConfig");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "virtualParticipantConfig");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    if (TUObjectsAreEqualOrNil((unint64_t)v24, (uint64_t)v23))
                    {
                      -[TUConversationActivitySessionContainer unreliableMessengerConfig](self, "unreliableMessengerConfig");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "unreliableMessengerConfig");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      v20 = TUObjectsAreEqualOrNil((unint64_t)v22, (uint64_t)v19);

                      v11 = v33;
                    }
                    else
                    {
                      v20 = 0;
                    }

                  }
                  else
                  {
                    v20 = 0;
                  }

                }
                else
                {
                  v20 = 0;
                }

              }
              else
              {
                v20 = 0;
                v11 = v33;
              }

            }
            else
            {
              v20 = 0;
              v11 = v33;
            }

          }
          else
          {
            v20 = 0;
            v11 = v33;
          }
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_groupUUID, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSSet)activitySessions
{
  return self->_activitySessions;
}

- (void)setActivitySessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (void)setLocalMember:(id)a3
{
  objc_storeStrong((id *)&self->_localMember, a3);
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (unint64_t)localParticipantIdentifier
{
  return self->_localParticipantIdentifier;
}

- (void)setLocalParticipantIdentifier:(unint64_t)a3
{
  self->_localParticipantIdentifier = a3;
}

- (NSSet)virtualParticipants
{
  return self->_virtualParticipants;
}

- (void)setVirtualParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TUConversationVirtualParticipantConfig)virtualParticipantConfig
{
  return self->_virtualParticipantConfig;
}

- (void)setVirtualParticipantConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (TUConversationUnreliableMessengerConfig)unreliableMessengerConfig
{
  return self->_unreliableMessengerConfig;
}

- (void)setUnreliableMessengerConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_storeStrong((id *)&self->_unreliableMessengerConfig, 0);
  objc_storeStrong((id *)&self->_virtualParticipantConfig, 0);
  objc_storeStrong((id *)&self->_virtualParticipants, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_activitySessions, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
