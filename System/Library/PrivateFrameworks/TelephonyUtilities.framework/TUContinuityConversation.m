@implementation TUContinuityConversation

- (TUContinuityConversation)initWithUUID:(id)a3 displayName:(id)a4 state:(id)a5 avMode:(unint64_t)a6 remoteMemberCount:(int64_t)a7 remoteMemberContactIdentifiers:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  TUContinuityConversation *v18;
  uint64_t v19;
  NSUUID *uuid;
  uint64_t v21;
  NSString *displayName;
  uint64_t v23;
  NSNumber *state;
  uint64_t v25;
  NSArray *remoteMemberContactIdentifiers;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)TUContinuityConversation;
  v18 = -[TUContinuityConversation init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    uuid = v18->_uuid;
    v18->_uuid = (NSUUID *)v19;

    v21 = objc_msgSend(v15, "copy");
    displayName = v18->_displayName;
    v18->_displayName = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    state = v18->_state;
    v18->_state = (NSNumber *)v23;

    v18->_avMode = a6;
    v18->_remoteMemberCount = a7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v17);
    v25 = objc_claimAutoreleasedReturnValue();
    remoteMemberContactIdentifiers = v18->_remoteMemberContactIdentifiers;
    v18->_remoteMemberContactIdentifiers = (NSArray *)v25;

  }
  return v18;
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

  objc_msgSend(v6, "appendFormat:", CFSTR(" uuid=%@"), self->_uuid);
  objc_msgSend(v6, "appendFormat:", CFSTR(" displayName=%@"), self->_displayName);
  objc_msgSend(v6, "appendFormat:", CFSTR(" state=%@"), self->_state);
  objc_msgSend(v6, "appendFormat:", CFSTR(" avMode=%zd"), self->_avMode);
  objc_msgSend(v6, "appendFormat:", CFSTR(" remoteMemberCount=%zd"), self->_remoteMemberCount);
  objc_msgSend(v6, "appendFormat:", CFSTR(" remoteMemberContactIdentifiersCount=%zd"), -[NSArray count](self->_remoteMemberContactIdentifiers, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityConversation)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  TUContinuityConversation *v17;
  void *v19;
  void *v20;
  void *v22;

  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_uuid);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(sel_displayName);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  NSStringFromSelector(sel_state);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", v10);
  NSStringFromSelector(sel_remoteMemberCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", v12);
  v14 = objc_opt_class();
  NSStringFromSelector(sel_remoteMemberContactIdentifiers);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[TUContinuityConversation initWithUUID:displayName:state:avMode:remoteMemberCount:remoteMemberContactIdentifiers:](self, "initWithUUID:displayName:state:avMode:remoteMemberCount:remoteMemberContactIdentifiers:", v19, v6, v9, v11, v13, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;
  void *v6;
  NSString *displayName;
  void *v8;
  NSNumber *state;
  void *v10;
  unint64_t avMode;
  void *v12;
  int64_t remoteMemberCount;
  void *v14;
  NSArray *remoteMemberContactIdentifiers;
  id v16;

  uuid = self->_uuid;
  v5 = a3;
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uuid, v6);

  displayName = self->_displayName;
  NSStringFromSelector(sel_displayName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", displayName, v8);

  state = self->_state;
  NSStringFromSelector(sel_state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", state, v10);

  avMode = self->_avMode;
  NSStringFromSelector(sel_avMode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", avMode, v12);

  remoteMemberCount = self->_remoteMemberCount;
  NSStringFromSelector(sel_remoteMemberCount);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", remoteMemberCount, v14);

  remoteMemberContactIdentifiers = self->_remoteMemberContactIdentifiers;
  NSStringFromSelector(sel_remoteMemberContactIdentifiers);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", remoteMemberContactIdentifiers, v16);

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (NSNumber)state
{
  return self->_state;
}

- (int64_t)remoteMemberCount
{
  return self->_remoteMemberCount;
}

- (NSArray)remoteMemberContactIdentifiers
{
  return self->_remoteMemberContactIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMemberContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
