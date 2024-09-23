@implementation STSetupConfiguration

- (STSetupConfiguration)initWithUser:(id)a3 screenTimeState:(int64_t)a4 passcode:(id)a5 contactManagementState:(int64_t)a6 userHasContacts:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  STSetupConfiguration *v16;

  v9 = a7;
  v14 = a3;
  v15 = a5;
  if (+[STSetupConfiguration _isContactManagementStateValid:pairedWithUserHasContacts:](STSetupConfiguration, "_isContactManagementStateValid:pairedWithUserHasContacts:", a6, v9))
  {
    self = (STSetupConfiguration *)-[STSetupConfiguration _initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:](self, "_initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:", v14, a4, v15, a6, v9);
    v16 = self;
  }
  else
  {
    v16 = 0;
    if (a8)
      *a8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 41, 0);
  }

  return v16;
}

- (id)_initWithUser:(id)a3 screenTimeState:(int64_t)a4 passcode:(id)a5 contactManagementState:(int64_t)a6 userHasContacts:(BOOL)a7
{
  id v11;
  id v12;
  STSetupConfiguration *v13;
  uint64_t v14;
  STUserID *associatedUser;
  uint64_t v16;
  STOpaquePasscode *passcode;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)STSetupConfiguration;
  v11 = a5;
  v12 = a3;
  v13 = -[STSetupConfiguration init](&v19, sel_init);
  v14 = objc_msgSend(v12, "copy", v19.receiver, v19.super_class);

  associatedUser = v13->_associatedUser;
  v13->_associatedUser = (STUserID *)v14;

  v13->_screenTimeState = a4;
  v16 = objc_msgSend(v11, "copy");

  passcode = v13->_passcode;
  v13->_passcode = (STOpaquePasscode *)v16;

  v13->_contactManagementState = a6;
  v13->_userHasContacts = a7;
  return v13;
}

+ (BOOL)_isScreenTimeStateValid:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)_isContactManagementStateValid:(int64_t)a3 pairedWithUserHasContacts:(BOOL)a4
{
  BOOL v4;

  v4 = a3 == 1 && a4;
  if (a3 == 2)
    v4 = 1;
  return !a3 || v4;
}

- (id)description
{
  __CFString *v2;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[STSetupConfiguration associatedUser](self, "associatedUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STSetupConfiguration screenTimeState](self, "screenTimeState");
  v7 = v6;
  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull STGetDescriptionForSetupConfigurationScreenTimeState(STSetupConfigurationScreenTimeState)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("STSetupConfiguration.h"), 32, CFSTR("Unexpected Screen Time state %ld"), v7);

  }
  else
  {
    v2 = off_1E9371C68[v6];
  }
  -[STSetupConfiguration availableScreenTimeStates](self, "availableScreenTimeStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSetupConfiguration _descriptionForScreenTimeStates:](self, "_descriptionForScreenTimeStates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSetupConfiguration passcode](self, "passcode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[STSetupConfiguration contactManagementState](self, "contactManagementState");
  v14 = v13;
  if (v13 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull STGetDescriptionForSetupConfigurationContactManagementState(STSetupConfigurationContactManagementState)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString handleFailureInFunction:file:lineNumber:description:](v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("STSetupConfiguration.h"), 53, CFSTR("Unexpected contact management state %ld"), v14);

  }
  else
  {
    v15 = off_1E9371C80[v13];
  }
  -[STSetupConfiguration availableContactManagementStates](self, "availableContactManagementStates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSetupConfiguration _descriptionForContactManagementStates:](self, "_descriptionForContactManagementStates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: { User: %@, ScreenTimeState: %@, AvailableScreenTimeStates: %@, Passcode: %d, ContactManagementState: %@, AvailableContactManagementStates: %@>"), v4, v5, v2, v11, v12 != 0, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_descriptionForScreenTimeStates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id result;
  unint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "integerValue");
        if (v10 >= 3)
        {
          v13 = v10;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull STGetDescriptionForSetupConfigurationScreenTimeState(STSetupConfigurationScreenTimeState)");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("STSetupConfiguration.h"), 32, CFSTR("Unexpected Screen Time state %ld"), v13);

          __break(1u);
          return result;
        }
        objc_msgSend(v4, "addObject:", off_1E9371C68[v10]);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)_descriptionForContactManagementStates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id result;
  unint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "integerValue");
        if (v10 >= 3)
        {
          v13 = v10;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull STGetDescriptionForSetupConfigurationContactManagementState(STSetupConfigurationContactManagementState)");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("STSetupConfiguration.h"), 53, CFSTR("Unexpected contact management state %ld"), v13);

          __break(1u);
          return result;
        }
        objc_msgSend(v4, "addObject:", off_1E9371C80[v10]);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (NSSet)availableScreenTimeStates
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[STSetupConfiguration screenTimeState](self, "screenTimeState");
  if (v4 == 2)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = &unk_1E938DA18;
LABEL_7:
    objc_msgSend(v7, "setWithObject:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSSet *)v6;
  }
  v5 = v4;
  if (v4 == 1)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = &unk_1E938DA00;
    goto LABEL_7;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STSetupConfiguration.m"), 111, CFSTR("Unexpected Screen Time state %ld"), v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E938DA00, &unk_1E938DA18, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

- (NSSet)availableContactManagementStates
{
  int64_t v4;
  int64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[STSetupConfiguration contactManagementState](self, "contactManagementState");
  if (v4 == 2 || (v5 = v4, v4 == 1))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = &unk_1E938DA30;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STSetupConfiguration.m"), 128, CFSTR("Unexpected contact management state %ld"), v5);

      return (NSSet *)v9;
    }
    v6 = -[STSetupConfiguration userHasContacts](self, "userHasContacts");
    v7 = (void *)MEMORY[0x1E0C99E60];
    if (v6)
      v8 = &unk_1E938DA18;
    else
      v8 = &unk_1E938DA00;
  }
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSSet *)v9;
}

- (STSetupConfiguration)configurationWithUpdatedScreenTimeState:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  char v9;
  STSetupConfiguration *v10;
  void *v11;
  void *v12;
  id v13;

  -[STSetupConfiguration availableScreenTimeStates](self, "availableScreenTimeStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = [STSetupConfiguration alloc];
    -[STSetupConfiguration associatedUser](self, "associatedUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSetupConfiguration passcode](self, "passcode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[STSetupConfiguration _initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:](v10, "_initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:", v11, a3, v12, -[STSetupConfiguration contactManagementState](self, "contactManagementState"), -[STSetupConfiguration userHasContacts](self, "userHasContacts"));

    return (STSetupConfiguration *)v13;
  }
  else
  {
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 42, 0);
    return (STSetupConfiguration *)0;
  }
}

- (STSetupConfiguration)configurationWithUpdatedContactManagementState:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  char v9;
  STSetupConfiguration *v10;
  void *v11;
  int64_t v12;
  void *v13;
  id v14;

  -[STSetupConfiguration availableContactManagementStates](self, "availableContactManagementStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = [STSetupConfiguration alloc];
    -[STSetupConfiguration associatedUser](self, "associatedUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[STSetupConfiguration screenTimeState](self, "screenTimeState");
    -[STSetupConfiguration passcode](self, "passcode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[STSetupConfiguration _initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:](v10, "_initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:", v11, v12, v13, a3, -[STSetupConfiguration userHasContacts](self, "userHasContacts"));

    return (STSetupConfiguration *)v14;
  }
  else
  {
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 43, 0);
    return (STSetupConfiguration *)0;
  }
}

- (STSetupConfiguration)configurationWithUpdatedPasscode:(id)a3
{
  id v4;
  STSetupConfiguration *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = [STSetupConfiguration alloc];
  -[STSetupConfiguration associatedUser](self, "associatedUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STSetupConfiguration _initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:](v5, "_initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:", v6, -[STSetupConfiguration screenTimeState](self, "screenTimeState"), v4, -[STSetupConfiguration contactManagementState](self, "contactManagementState"), -[STSetupConfiguration userHasContacts](self, "userHasContacts"));

  return (STSetupConfiguration *)v7;
}

- (STSetupConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  STSetupConfiguration *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("screenTimeState"));
  if (!+[STSetupConfiguration _isScreenTimeStateValid:](STSetupConfiguration, "_isScreenTimeStateValid:", v6))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 42, 0);
    objc_msgSend(v4, "failWithError:", v7);
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contactManagementState"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userHasContacts"));
  if (!+[STSetupConfiguration _isContactManagementStateValid:pairedWithUserHasContacts:](STSetupConfiguration, "_isContactManagementStateValid:pairedWithUserHasContacts:", v8, v9))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 43, 0);
    objc_msgSend(v4, "failWithError:", v11);

    goto LABEL_6;
  }
  self = (STSetupConfiguration *)-[STSetupConfiguration _initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:](self, "_initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:", v5, v6, v7, v8, v9);
  v10 = self;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  STUserID *associatedUser;
  id v5;

  associatedUser = self->_associatedUser;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associatedUser, CFSTR("associatedUser"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_screenTimeState, CFSTR("screenTimeState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passcode, CFSTR("passcode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contactManagementState, CFSTR("contactManagementState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userHasContacts, CFSTR("userHasContacts"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithUser:screenTimeState:passcode:contactManagementState:userHasContacts:", self->_associatedUser, self->_screenTimeState, self->_passcode, self->_contactManagementState, self->_userHasContacts);
}

- (BOOL)isEqual:(id)a3
{
  STSetupConfiguration *v4;
  BOOL v5;

  v4 = (STSetupConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[STSetupConfiguration isEqualToSetupConfiguration:](self, "isEqualToSetupConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSetupConfiguration:(id)a3
{
  void *v3;
  void *v4;
  STSetupConfiguration *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  int64_t v13;
  _BOOL4 v14;

  v6 = (STSetupConfiguration *)a3;
  if (v6 != self)
  {
    -[STSetupConfiguration associatedUser](self, "associatedUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSetupConfiguration associatedUser](v6, "associatedUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToUserID:", v8)
      || (v9 = -[STSetupConfiguration screenTimeState](self, "screenTimeState"),
          v9 != -[STSetupConfiguration screenTimeState](v6, "screenTimeState")))
    {
      LOBYTE(v12) = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[STSetupConfiguration passcode](self, "passcode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSetupConfiguration passcode](v6, "passcode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11
      || (-[STSetupConfiguration passcode](self, "passcode"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[STSetupConfiguration passcode](v6, "passcode"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToOpaquePasscode:", v4)))
    {
      v13 = -[STSetupConfiguration contactManagementState](self, "contactManagementState");
      if (v13 == -[STSetupConfiguration contactManagementState](v6, "contactManagementState"))
      {
        v14 = -[STSetupConfiguration userHasContacts](self, "userHasContacts");
        v12 = v14 ^ -[STSetupConfiguration userHasContacts](v6, "userHasContacts") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
      if (v10 == v11)
        goto LABEL_14;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

LABEL_14:
    goto LABEL_15;
  }
  LOBYTE(v12) = 1;
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;

  -[STSetupConfiguration associatedUser](self, "associatedUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[STSetupConfiguration screenTimeState](self, "screenTimeState") ^ v4;
  -[STSetupConfiguration passcode](self, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[STSetupConfiguration contactManagementState](self, "contactManagementState");
  v9 = v8 ^ -[STSetupConfiguration userHasContacts](self, "userHasContacts");

  return v9;
}

- (STUserID)associatedUser
{
  return (STUserID *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)screenTimeState
{
  return self->_screenTimeState;
}

- (STOpaquePasscode)passcode
{
  return (STOpaquePasscode *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)contactManagementState
{
  return self->_contactManagementState;
}

- (BOOL)userHasContacts
{
  return self->_userHasContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_associatedUser, 0);
}

@end
