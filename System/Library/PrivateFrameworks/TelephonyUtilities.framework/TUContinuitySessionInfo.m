@implementation TUContinuitySessionInfo

- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 recentCalls:(id)a6 recentCallsContacts:(id)a7 isDedicatedSession:(BOOL)a8 favorites:(id)a9 recentCallsInfos:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  TUContinuitySessionInfo *v22;
  uint64_t v23;
  TUNearbyDeviceHandle *device;
  uint64_t v25;
  NSArray *calls;
  uint64_t v27;
  NSArray *activeConversations;
  uint64_t v29;
  NSArray *recentCalls;
  uint64_t v31;
  NSDictionary *recentCallsContacts;
  uint64_t v33;
  NSArray *favorites;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)TUContinuitySessionInfo;
  v22 = -[TUContinuitySessionInfo init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    device = v22->_device;
    v22->_device = (TUNearbyDeviceHandle *)v23;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v17);
    v25 = objc_claimAutoreleasedReturnValue();
    calls = v22->_calls;
    v22->_calls = (NSArray *)v25;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v18);
    v27 = objc_claimAutoreleasedReturnValue();
    activeConversations = v22->_activeConversations;
    v22->_activeConversations = (NSArray *)v27;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v19);
    v29 = objc_claimAutoreleasedReturnValue();
    recentCalls = v22->_recentCalls;
    v22->_recentCalls = (NSArray *)v29;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v20);
    v31 = objc_claimAutoreleasedReturnValue();
    recentCallsContacts = v22->_recentCallsContacts;
    v22->_recentCallsContacts = (NSDictionary *)v31;

    v22->_isDedicatedSession = a8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v21);
    v33 = objc_claimAutoreleasedReturnValue();
    favorites = v22->_favorites;
    v22->_favorites = (NSArray *)v33;

  }
  return v22;
}

- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 recentCalls:(id)a6 recentCallsContacts:(id)a7
{
  return -[TUContinuitySessionInfo initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:](self, "initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:", a3, a4, a5, a6, a7, 0, MEMORY[0x1E0C9AA60], 0);
}

- (TUContinuitySessionInfo)initWithDevice:(id)a3 calls:(id)a4 activeConversations:(id)a5 favorites:(id)a6
{
  return -[TUContinuitySessionInfo initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:](self, "initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:", a3, a4, a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], 1, a6, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" device=%@"), self->_device);
  objc_msgSend(v6, "appendFormat:", CFSTR(" callsCount=%zd"), -[NSArray count](self->_calls, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" activeConversationsCount=%zd"), -[NSArray count](self->_activeConversations, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" recentCallsCount=%zd"), -[NSArray count](self->_recentCalls, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" recentCallsContactsCount=%zd"), -[NSDictionary count](self->_recentCallsContacts, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" isDedicatedSession=%d"), self->_isDedicatedSession);
  objc_msgSend(v6, "appendFormat:", CFSTR(" favoritesCount=%zd"), -[NSArray count](self->_favorites, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUContinuitySessionInfo *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 isDedicatedSession;
  void *v12;
  TUContinuitySessionInfo *v13;

  v5 = +[TUContinuitySessionInfo allocWithZone:](TUContinuitySessionInfo, "allocWithZone:");
  v6 = -[TUNearbyDeviceHandle copyWithZone:](self->_device, "copyWithZone:", a3);
  v7 = (void *)-[NSArray copyWithZone:](self->_calls, "copyWithZone:", a3);
  v8 = (void *)-[NSArray copyWithZone:](self->_activeConversations, "copyWithZone:", a3);
  v9 = (void *)-[NSArray copyWithZone:](self->_recentCalls, "copyWithZone:", a3);
  v10 = (void *)-[NSDictionary copyWithZone:](self->_recentCallsContacts, "copyWithZone:", a3);
  isDedicatedSession = self->_isDedicatedSession;
  v12 = (void *)-[NSArray copyWithZone:](self->_favorites, "copyWithZone:", a3);
  v13 = -[TUContinuitySessionInfo initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:](v5, "initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:", v6, v7, v8, v9, v10, isDedicatedSession, v12, 0);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuitySessionInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  TUContinuitySessionInfo *v26;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_device);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_calls);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_activeConversations);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_recentCalls);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_opt_class();
  v18 = objc_opt_class();
  NSStringFromSelector(sel_recentCallsContacts);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isDedicatedSession);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "decodeBoolForKey:", v21);

  v23 = objc_opt_class();
  NSStringFromSelector(sel_favorites);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[TUContinuitySessionInfo initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:](self, "initWithDevice:calls:activeConversations:recentCalls:recentCallsContacts:isDedicatedSession:favorites:recentCallsInfos:", v7, v10, v13, v16, v20, v22, v25, 0);
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  TUNearbyDeviceHandle *device;
  id v5;
  void *v6;
  NSArray *calls;
  void *v8;
  NSArray *activeConversations;
  void *v10;
  NSArray *recentCalls;
  void *v12;
  NSDictionary *recentCallsContacts;
  void *v14;
  _BOOL8 isDedicatedSession;
  void *v16;
  NSArray *favorites;
  id v18;

  device = self->_device;
  v5 = a3;
  NSStringFromSelector(sel_device);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", device, v6);

  calls = self->_calls;
  NSStringFromSelector(sel_calls);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", calls, v8);

  activeConversations = self->_activeConversations;
  NSStringFromSelector(sel_activeConversations);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", activeConversations, v10);

  recentCalls = self->_recentCalls;
  NSStringFromSelector(sel_recentCalls);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", recentCalls, v12);

  recentCallsContacts = self->_recentCallsContacts;
  NSStringFromSelector(sel_recentCallsContacts);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", recentCallsContacts, v14);

  isDedicatedSession = self->_isDedicatedSession;
  NSStringFromSelector(sel_isDedicatedSession);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", isDedicatedSession, v16);

  favorites = self->_favorites;
  NSStringFromSelector(sel_favorites);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", favorites, v18);

}

- (TUNearbyDeviceHandle)device
{
  return self->_device;
}

- (NSArray)calls
{
  return self->_calls;
}

- (NSArray)activeConversations
{
  return self->_activeConversations;
}

- (NSArray)recentCalls
{
  return self->_recentCalls;
}

- (NSDictionary)recentCallsContacts
{
  return self->_recentCallsContacts;
}

- (BOOL)isDedicatedSession
{
  return self->_isDedicatedSession;
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_recentCallsContacts, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_activeConversations, 0);
  objc_storeStrong((id *)&self->_calls, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
