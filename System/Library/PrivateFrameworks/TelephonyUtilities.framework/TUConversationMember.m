@implementation TUConversationMember

- (BOOL)needsContactLookupForDisplayName
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[TUConversationMember handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "destinationIdIsTemporary") & 1) != 0)
  {
    LOBYTE(v5) = 0;
LABEL_8:

    return v5;
  }
  -[TUConversationMember handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "destinationIdIsPseudonym");

  if ((v8 & 1) == 0)
  {
    -[TUConversationMember handle](self, "handle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "siriDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[TUConversationMember handle](self, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "shouldHideContact") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 1;
    }
    goto LABEL_8;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (TUConversationMember)initWithHandle:(id)a3
{
  return -[TUConversationMember initWithHandle:nickname:joinedFromLetMeIn:](self, "initWithHandle:nickname:joinedFromLetMeIn:", a3, 0, 0);
}

- (TUConversationMember)initWithHandle:(id)a3 nickname:(id)a4
{
  return -[TUConversationMember initWithHandle:nickname:joinedFromLetMeIn:](self, "initWithHandle:nickname:joinedFromLetMeIn:", a3, a4, 0);
}

- (TUConversationMember)initWithHandle:(id)a3 nickname:(id)a4 joinedFromLetMeIn:(BOOL)a5
{
  id v8;
  id v9;
  TUConversationMember *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  TUHandle *handle;
  uint64_t v23;
  NSString *nickname;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TUConversationMember;
  v10 = -[TUConversationMember init](&v27, sel_init);
  if (!v10)
    goto LABEL_16;
  v11 = v8;
  objc_msgSend(v11, "isoCountryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    TUNetworkCountryCode();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      TUHomeCountryCode();
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v17;

  }
  if (objc_msgSend(v11, "type") == 2)
  {
    objc_msgSend(v11, "canonicalHandleForISOCountryCode:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
LABEL_12:

    goto LABEL_13;
  }
  v18 = v11;
  if (objc_msgSend(v11, "type") == 3)
  {
    objc_msgSend(v11, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_13:
  TUNormalizedHandleForTUHandle(v18);
  v21 = objc_claimAutoreleasedReturnValue();
  handle = v10->_handle;
  v10->_handle = (TUHandle *)v21;

  if (objc_msgSend(v9, "length"))
  {
    v23 = objc_msgSend(v9, "copy");
    nickname = v10->_nickname;
    v10->_nickname = (NSString *)v23;

  }
  objc_msgSend(v11, "siriDisplayName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUHandle setSiriDisplayName:](v10->_handle, "setSiriDisplayName:", v25);

  v10->_joinedFromLetMeIn = a5;
  v10->_isOtherInvitedHandle = 0;

LABEL_16:
  return v10;
}

- (TUConversationMember)initWithHandles:(id)a3
{
  void *v4;
  TUConversationMember *v5;

  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUConversationMember initWithHandle:](self, "initWithHandle:", v4);

  return v5;
}

- (TUConversationMember)initWithContact:(id)a3 additionalHandles:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  TUHandle *v14;
  void *v15;
  void *v16;
  TUHandle *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  TUHandle *v24;
  void *v25;
  TUHandle *v26;
  TUConversationMember *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  if (objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C967C0]))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v6, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v13, "tuIsSuggested") & 1) == 0)
          {
            v14 = [TUHandle alloc];
            objc_msgSend(v13, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringValue");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[TUHandle initWithType:value:](v14, "initWithType:value:", 2, v16);

            objc_msgSend(v7, "addObject:", v17);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C966A8]))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "emailAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((objc_msgSend(v23, "tuIsSuggested") & 1) == 0)
          {
            v24 = [TUHandle alloc];
            objc_msgSend(v23, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[TUHandle initWithType:value:](v24, "initWithType:value:", 3, v25);

            objc_msgSend(v7, "addObject:", v26);
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

  }
  v27 = -[TUConversationMember initWithHandles:](self, "initWithHandles:", v7);

  return v27;
}

- (TUConversationMember)initWithContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  TUConversationMember *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUConversationMember initWithContact:additionalHandles:](self, "initWithContact:additionalHandles:", v5, v6);

  return v7;
}

- (TUConversationMember)initWithDestination:(id)a3
{
  void *v4;
  TUConversationMember *v5;

  +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUConversationMember initWithHandle:](self, "initWithHandle:", v4);

  return v5;
}

- (TUConversationMember)initWithDestinations:(id)a3
{
  void *v4;
  void *v5;
  TUConversationMember *v6;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[TUConversationMember initWithHandle:](self, "initWithHandle:", v5);
  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
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
  void *v25;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_handle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_nickname);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember nickname](self, "nickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isLightweightMember);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%d"), v8, -[TUConversationMember isLightweightMember](self, "isLightweightMember"));

  if (-[TUConversationMember isLightweightMember](self, "isLightweightMember"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(", "));
    NSStringFromSelector(sel_isValidated);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TUConversationMember isValidated](self, "isValidated");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v9, v11);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_lightweightPrimary);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember lightweightPrimary](self, "lightweightPrimary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v12, v13);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_lightweightPrimaryParticipantIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%llu"), v14, -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_joinedFromLetMeIn);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%d"), v15, -[TUConversationMember joinedFromLetMeIn](self, "joinedFromLetMeIn"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_dateReceivedLetMeIn);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember dateReceivedLetMeIn](self, "dateReceivedLetMeIn");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v16, v17);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_dateInitiatedLetMeIn);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember dateInitiatedLetMeIn](self, "dateInitiatedLetMeIn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v18, v19);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isOtherInvitedHandle);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%d"), v20, -[TUConversationMember isOtherInvitedHandle](self, "isOtherInvitedHandle"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_association);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember association](self, "association");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v21, v22);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_associationVoucher);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember associationVoucher](self, "associationVoucher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v23, v24);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v25 = (void *)objc_msgSend(v3, "copy");

  return v25;
}

- (NSSet)handles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[TUConversationMember handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSString)idsFromID
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[TUConversationMember handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TUCopyIDSFromIDForHandle(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[TUConversationMember handle](self, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Could not convert %@ to IDS fromID", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v7;
}

- (NSString)idsDestination
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[TUConversationMember handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TUCopyIDSCanonicalAddressForHandle(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[TUConversationMember handle](self, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Could not convert %@ to IDS destination", (uint8_t *)&v9, 0xCu);

    }
  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v7;
}

- (NSArray)idsDestinations
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[TUConversationMember idsDestination](self, "idsDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)representsSameMemberAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUConversationMember handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToHandle:", v6);
  return (char)v4;
}

- (BOOL)pseudonym
{
  void *v2;
  void *v3;
  char v4;

  -[TUConversationMember handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "destinationIdIsPseudonym");

  return v4;
}

- (void)setValidationSource:(int64_t)a3
{
  if (a3 != 1 || self->_validationSource != 2)
    self->_validationSource = a3;
}

- (BOOL)isValidated
{
  return !-[TUConversationMember isLightweightMember](self, "isLightweightMember")
      || (unint64_t)(-[TUConversationMember validationSource](self, "validationSource") - 1) < 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUConversationMember isEqualToMember:](self, "isEqualToMember:", v4);

  return v5;
}

- (BOOL)isEqualToMember:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  char v11;
  void *v13;
  void *v14;

  v4 = a3;
  -[TUConversationMember handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToHandle:", v6))
  {
    -[TUConversationMember lightweightPrimary](self, "lightweightPrimary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lightweightPrimary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8)
      && (v9 = -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier"), v9 == objc_msgSend(v4, "lightweightPrimaryParticipantIdentifier"))&& (v10 = -[TUConversationMember isLightweightMember](self, "isLightweightMember"), v10 == objc_msgSend(v4, "isLightweightMember")))
    {
      -[TUConversationMember association](self, "association");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "association");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[TUConversationMember handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationMember lightweightPrimary](self, "lightweightPrimary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier");
  if (-[TUConversationMember isLightweightMember](self, "isLightweightMember"))
    v8 = 1231;
  else
    v8 = 1237;
  -[TUConversationMember association](self, "association");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationMember handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationMember nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHandle:nickname:joinedFromLetMeIn:", v5, v6, -[TUConversationMember joinedFromLetMeIn](self, "joinedFromLetMeIn"));

  -[TUConversationMember lightweightPrimary](self, "lightweightPrimary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLightweightPrimary:", v8);

  objc_msgSend(v7, "setIsLightweightMember:", -[TUConversationMember isLightweightMember](self, "isLightweightMember"));
  objc_msgSend(v7, "setIsOtherInvitedHandle:", -[TUConversationMember isOtherInvitedHandle](self, "isOtherInvitedHandle"));
  -[TUConversationMember dateReceivedLetMeIn](self, "dateReceivedLetMeIn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateReceivedLetMeIn:", v9);

  -[TUConversationMember dateInitiatedLetMeIn](self, "dateInitiatedLetMeIn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateInitiatedLetMeIn:", v10);

  objc_msgSend(v7, "setLightweightPrimaryParticipantIdentifier:", -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier"));
  objc_msgSend(v7, "setValidationSource:", -[TUConversationMember validationSource](self, "validationSource"));
  -[TUConversationMember association](self, "association");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v7, "setAssociation:", v12);

  -[TUConversationMember associationVoucher](self, "associationVoucher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v7, "setAssociationVoucher:", v14);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationMember)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TUConversationMember *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  TUHandle *lightweightPrimary;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  TUConversationMemberAssociation *association;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  TUVoucher *associationVoucher;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_nickname);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_joinedFromLetMeIn);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeBoolForKey:", v11);

  v13 = objc_opt_class();
  NSStringFromSelector(sel_dateReceivedLetMeIn);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_dateInitiatedLetMeIn);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[TUConversationMember initWithHandle:nickname:joinedFromLetMeIn:](self, "initWithHandle:nickname:joinedFromLetMeIn:", v7, v10, v12);
  if (v19)
  {
    v20 = objc_opt_class();
    NSStringFromSelector(sel_lightweightPrimary);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    lightweightPrimary = v19->_lightweightPrimary;
    v19->_lightweightPrimary = (TUHandle *)v22;

    NSStringFromSelector(sel_lightweightPrimaryParticipantIdentifier);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_lightweightPrimaryParticipantIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", v24);

    NSStringFromSelector(sel_isLightweightMember);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_isLightweightMember = objc_msgSend(v4, "decodeBoolForKey:", v25);

    NSStringFromSelector(sel_isOtherInvitedHandle);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_isOtherInvitedHandle = objc_msgSend(v4, "decodeBoolForKey:", v26);

    objc_storeStrong((id *)&v19->_dateReceivedLetMeIn, v15);
    objc_storeStrong((id *)&v19->_dateInitiatedLetMeIn, v18);
    NSStringFromSelector(sel_validationSource);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_validationSource = objc_msgSend(v4, "decodeIntegerForKey:", v27);

    v28 = objc_opt_class();
    NSStringFromSelector(sel_association);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    association = v19->_association;
    v19->_association = (TUConversationMemberAssociation *)v30;

    v32 = objc_opt_class();
    NSStringFromSelector(sel_associationVoucher);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    associationVoucher = v19->_associationVoucher;
    v19->_associationVoucher = (TUVoucher *)v34;

  }
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a3;
  -[TUConversationMember handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationMember nickname](self, "nickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_nickname);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationMember lightweightPrimary](self, "lightweightPrimary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lightweightPrimary);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier");
  NSStringFromSelector(sel_lightweightPrimaryParticipantIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v11, v12);

  v13 = -[TUConversationMember isLightweightMember](self, "isLightweightMember");
  NSStringFromSelector(sel_isLightweightMember);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[TUConversationMember joinedFromLetMeIn](self, "joinedFromLetMeIn");
  NSStringFromSelector(sel_joinedFromLetMeIn);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUConversationMember isOtherInvitedHandle](self, "isOtherInvitedHandle");
  NSStringFromSelector(sel_isOtherInvitedHandle);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  -[TUConversationMember dateReceivedLetMeIn](self, "dateReceivedLetMeIn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateReceivedLetMeIn);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[TUConversationMember dateInitiatedLetMeIn](self, "dateInitiatedLetMeIn");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateInitiatedLetMeIn);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  v23 = -[TUConversationMember validationSource](self, "validationSource");
  NSStringFromSelector(sel_validationSource);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v23, v24);

  -[TUConversationMember association](self, "association");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_association);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[TUConversationMember associationVoucher](self, "associationVoucher");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_associationVoucher);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, v27);

}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)validationSource
{
  return self->_validationSource;
}

- (BOOL)isLightweightMember
{
  return self->_isLightweightMember;
}

- (void)setIsLightweightMember:(BOOL)a3
{
  self->_isLightweightMember = a3;
}

- (NSDate)dateReceivedLetMeIn
{
  return self->_dateReceivedLetMeIn;
}

- (void)setDateReceivedLetMeIn:(id)a3
{
  objc_storeStrong((id *)&self->_dateReceivedLetMeIn, a3);
}

- (NSDate)dateInitiatedLetMeIn
{
  return self->_dateInitiatedLetMeIn;
}

- (void)setDateInitiatedLetMeIn:(id)a3
{
  objc_storeStrong((id *)&self->_dateInitiatedLetMeIn, a3);
}

- (TUHandle)lightweightPrimary
{
  return self->_lightweightPrimary;
}

- (void)setLightweightPrimary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)lightweightPrimaryParticipantIdentifier
{
  return self->_lightweightPrimaryParticipantIdentifier;
}

- (void)setLightweightPrimaryParticipantIdentifier:(unint64_t)a3
{
  self->_lightweightPrimaryParticipantIdentifier = a3;
}

- (TUConversationMemberAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)joinedFromLetMeIn
{
  return self->_joinedFromLetMeIn;
}

- (void)setJoinedFromLetMeIn:(BOOL)a3
{
  self->_joinedFromLetMeIn = a3;
}

- (BOOL)isOtherInvitedHandle
{
  return self->_isOtherInvitedHandle;
}

- (void)setIsOtherInvitedHandle:(BOOL)a3
{
  self->_isOtherInvitedHandle = a3;
}

- (TUVoucher)associationVoucher
{
  return self->_associationVoucher;
}

- (void)setAssociationVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_associationVoucher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationVoucher, 0);
  objc_storeStrong((id *)&self->_association, 0);
  objc_storeStrong((id *)&self->_lightweightPrimary, 0);
  objc_storeStrong((id *)&self->_dateInitiatedLetMeIn, 0);
  objc_storeStrong((id *)&self->_dateReceivedLetMeIn, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
