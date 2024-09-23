@implementation SFShareSheetRemoteActivity

- (SFShareSheetRemoteActivity)initWithActivitySourceType:(int64_t)a3 identifier:(id)a4 uuid:(id)a5
{
  id v9;
  id v10;
  SFShareSheetRemoteActivity *v11;
  SFShareSheetRemoteActivity *v12;
  uint64_t v13;
  NSUUID *uuid;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SFShareSheetRemoteActivity;
  v11 = -[SFShareSheetRemoteActivity init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_activitySourceType = a3;
    objc_storeStrong((id *)&v11->_identifier, a4);
    v13 = objc_msgSend(v10, "copy");
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v13;

  }
  return v12;
}

+ (id)sharingServiceWithIdentifier:(id)a3
{
  id v3;
  SFShareSheetRemoteActivity *v4;

  v3 = a3;
  v4 = -[SFShareSheetRemoteActivity initWithActivitySourceType:identifier:uuid:]([SFShareSheetRemoteActivity alloc], "initWithActivitySourceType:identifier:uuid:", 0, v3, 0);

  return v4;
}

+ (id)builtinActivityWithUUID:(id)a3
{
  id v3;
  SFShareSheetRemoteActivity *v4;

  v3 = a3;
  v4 = -[SFShareSheetRemoteActivity initWithActivitySourceType:identifier:uuid:]([SFShareSheetRemoteActivity alloc], "initWithActivitySourceType:identifier:uuid:", 1, 0, v3);

  return v4;
}

+ (id)activitySourceTypeToString:(int64_t)a3
{
  if (a3)
    return CFSTR("SFShareSheetActivitySourceTypeBuiltin");
  else
    return CFSTR("SFShareSheetActivitySourceTypeSharingService");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)SFShareSheetRemoteActivity;
  -[SFShareSheetRemoteActivity description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFShareSheetRemoteActivity activitySourceTypeToString:](SFShareSheetRemoteActivity, "activitySourceTypeToString:", -[SFShareSheetRemoteActivity activitySourceType](self, "activitySourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetRemoteActivity identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetRemoteActivity uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetRemoteActivity title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFShareSheetRemoteActivity isRTS](self, "isRTS");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("< %@ activitySourceType:%@, identifier:%@, uuid:%@, title:%@, isRTS:%@>"), v4, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SFShareSheetRemoteActivity)initWithCoder:(id)a3
{
  id v4;
  SFShareSheetRemoteActivity *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUUID *uuid;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *title;
  void *v20;

  v4 = a3;
  v5 = -[SFShareSheetRemoteActivity init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_activitySourceType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activitySourceType = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_uuid);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_title);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v18;

    NSStringFromSelector(sel_isRTS);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRTS = objc_msgSend(v4, "decodeBoolForKey:", v20);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t activitySourceType;
  id v5;
  void *v6;
  NSString *identifier;
  void *v8;
  NSUUID *uuid;
  void *v10;
  NSString *title;
  void *v12;
  _BOOL8 isRTS;
  id v14;

  activitySourceType = self->_activitySourceType;
  v5 = a3;
  NSStringFromSelector(sel_activitySourceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", activitySourceType, v6);

  identifier = self->_identifier;
  NSStringFromSelector(sel_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v8);

  uuid = self->_uuid;
  NSStringFromSelector(sel_uuid);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uuid, v10);

  title = self->_title;
  NSStringFromSelector(sel_title);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", title, v12);

  isRTS = self->_isRTS;
  NSStringFromSelector(sel_isRTS);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", isRTS, v14);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)activitySourceType
{
  return self->_activitySourceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isRTS
{
  return self->_isRTS;
}

- (void)setIsRTS:(BOOL)a3
{
  self->_isRTS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
