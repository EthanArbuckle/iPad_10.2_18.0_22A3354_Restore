@implementation TUCollaborationNotice

- (TUCollaborationNotice)initWithUUID:(id)a3
{
  id v5;
  TUCollaborationNotice *v6;
  TUCollaborationNotice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUCollaborationNotice;
  v6 = -[TUCollaborationNotice init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_UUID, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCollaborationNotice UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" sessionEventType=%ld"), -[TUCollaborationNotice sessionEventType](self, "sessionEventType"));
  -[TUCollaborationNotice collaboration](self, "collaboration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" collaboration=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUCollaborationNotice isEqualToCollaborationNotice:](self, "isEqualToCollaborationNotice:", v4);

  return v5;
}

- (BOOL)isEqualToCollaborationNotice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[TUCollaborationNotice UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6)
    && (v7 = -[TUCollaborationNotice sessionEventType](self, "sessionEventType"),
        v7 == objc_msgSend(v4, "sessionEventType")))
  {
    -[TUCollaborationNotice collaboration](self, "collaboration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collaboration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[TUCollaborationNotice sessionEventType](self, "sessionEventType");
  -[TUCollaborationNotice collaboration](self, "collaboration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCollaborationNotice)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUCollaborationNotice *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  SWCollaborationHighlight *collaboration;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TUCollaborationNotice initWithUUID:](self, "initWithUUID:", v7);
  if (v8)
  {
    NSStringFromSelector(sel_sessionEventType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_sessionEventType = objc_msgSend(v4, "decodeIntegerForKey:", v9);

    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v10 = (void *)getSWCollaborationHighlightClass_softClass_0;
    v21 = getSWCollaborationHighlightClass_softClass_0;
    if (!getSWCollaborationHighlightClass_softClass_0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getSWCollaborationHighlightClass_block_invoke_0;
      v17[3] = &unk_1E38A1710;
      v17[4] = &v18;
      __getSWCollaborationHighlightClass_block_invoke_0((uint64_t)v17);
      v10 = (void *)v19[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v18, 8);
    v12 = objc_opt_class();
    NSStringFromSelector(sel_collaboration);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    collaboration = v8->_collaboration;
    v8->_collaboration = (SWCollaborationHighlight *)v14;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[TUCollaborationNotice sessionEventType](self, "sessionEventType");
  NSStringFromSelector(sel_sessionEventType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[TUCollaborationNotice UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUCollaborationNotice collaboration](self, "collaboration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaboration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (int64_t)sessionEventType
{
  return self->_sessionEventType;
}

- (void)setSessionEventType:(int64_t)a3
{
  self->_sessionEventType = a3;
}

- (SWCollaborationHighlight)collaboration
{
  return self->_collaboration;
}

- (void)setCollaboration:(id)a3
{
  objc_storeStrong((id *)&self->_collaboration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaboration, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
