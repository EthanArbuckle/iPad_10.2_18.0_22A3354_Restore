@implementation TUConversationActivityCreateSessionRequest

- (TUConversationActivityCreateSessionRequest)initWithMetadata:(id)a3 applicationContext:(id)a4 activityIdentifier:(id)a5 uuid:(id)a6
{
  return -[TUConversationActivityCreateSessionRequest initWithMetadata:applicationContext:activityIdentifier:uuid:staticIdentifier:](self, "initWithMetadata:applicationContext:activityIdentifier:uuid:staticIdentifier:", a3, a4, a5, a6, 0);
}

- (TUConversationActivityCreateSessionRequest)initWithMetadata:(id)a3 applicationContext:(id)a4 activityIdentifier:(id)a5 uuid:(id)a6 staticIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TUConversationActivityCreateSessionRequest *v17;
  TUConversationActivityCreateSessionRequest *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TUConversationActivityCreateSessionRequest;
  v17 = -[TUConversationActivityCreateSessionRequest init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_metadata, a3);
    objc_storeStrong((id *)&v18->_applicationContext, a4);
    objc_storeStrong((id *)&v18->_activityIdentifier, a5);
    objc_storeStrong((id *)&v18->_UUID, a6);
    objc_storeStrong((id *)&v18->_staticIdentifier, a7);
  }

  return v18;
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
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest activityIdentifier](self, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUConversationActivityCreateSessionRequest activityIdentifier](self, "activityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" activityIdentifier=%@"), v5);

  }
  -[TUConversationActivityCreateSessionRequest applicationContext](self, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUConversationActivityCreateSessionRequest applicationContext](self, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" applicationContext=%@"), v7);

  }
  -[TUConversationActivityCreateSessionRequest metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUConversationActivityCreateSessionRequest metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" metadata=%@"), v9);

  }
  -[TUConversationActivityCreateSessionRequest UUID](self, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TUConversationActivityCreateSessionRequest UUID](self, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v11);

  }
  -[TUConversationActivityCreateSessionRequest share](self, "share");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TUConversationActivityCreateSessionRequest share](self, "share");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" share=%@"), v13);

  }
  -[TUConversationActivityCreateSessionRequest staticIdentifier](self, "staticIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TUConversationActivityCreateSessionRequest staticIdentifier](self, "staticIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" staticIdentifier=%@"), v15);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationActivityCreateSessionRequest isEqualToConversationActivitySessionCreationRequest:](self, "isEqualToConversationActivitySessionCreationRequest:", v4);

  return v5;
}

- (BOOL)isEqualToConversationActivitySessionCreationRequest:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[TUConversationActivityCreateSessionRequest activityIdentifier](self, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUConversationActivityCreateSessionRequest applicationContext](self, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TUConversationActivityCreateSessionRequest metadata](self, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[TUConversationActivityCreateSessionRequest UUID](self, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          v21 = v11;
          -[TUConversationActivityCreateSessionRequest share](self, "share");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "share");
          v14 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v13;
          v15 = v13;
          v16 = (void *)v14;
          if (TUObjectsAreEqualOrNil(v15, v14))
          {
            -[TUConversationActivityCreateSessionRequest staticIdentifier](self, "staticIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "staticIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = TUObjectsAreEqualOrNil((unint64_t)v20, (uint64_t)v19);

          }
          else
          {
            v17 = 0;
          }

          v11 = v21;
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[TUConversationActivityCreateSessionRequest activityIdentifier](self, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationActivityCreateSessionRequest applicationContext](self, "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TUConversationActivityCreateSessionRequest metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[TUConversationActivityCreateSessionRequest UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[TUConversationActivityCreateSessionRequest share](self, "share");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[TUConversationActivityCreateSessionRequest staticIdentifier](self, "staticIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
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

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivityCreateSessionRequest metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest applicationContext](self, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest activityIdentifier](self, "activityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest staticIdentifier](self, "staticIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithMetadata:applicationContext:activityIdentifier:uuid:staticIdentifier:", v5, v6, v7, v8, v9);

  -[TUConversationActivityCreateSessionRequest share](self, "share");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShare:", v11);

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TUMutableConversationActivityCreateSessionRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TUMutableConversationActivityCreateSessionRequest *v10;
  void *v11;

  v4 = [TUMutableConversationActivityCreateSessionRequest alloc];
  -[TUConversationActivityCreateSessionRequest metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest applicationContext](self, "applicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest activityIdentifier](self, "activityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest staticIdentifier](self, "staticIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TUConversationActivityCreateSessionRequest initWithMetadata:applicationContext:activityIdentifier:uuid:staticIdentifier:](v4, "initWithMetadata:applicationContext:activityIdentifier:uuid:staticIdentifier:", v5, v6, v7, v8, v9);

  -[TUConversationActivityCreateSessionRequest share](self, "share");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityCreateSessionRequest setShare:](v10, "setShare:", v11);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivityCreateSessionRequest)initWithCoder:(id)a3
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
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  TUConversationActivityCreateSessionRequest *v26;
  TUConversationActivityCreateSessionRequest *v27;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_activityIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_opt_class();
    NSStringFromSelector(sel_applicationContext);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_opt_class();
      NSStringFromSelector(sel_metadata);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_opt_class();
        NSStringFromSelector(sel_UUID);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_opt_class();
          NSStringFromSelector(sel_staticIdentifier);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          NSStringFromSelector(sel_share);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v4, "containsValueForKey:", v20);

          if (v21)
          {
            v30 = 0;
            v31 = &v30;
            v32 = 0x2050000000;
            v22 = (void *)getCKShareClass_softClass;
            v33 = getCKShareClass_softClass;
            if (!getCKShareClass_softClass)
            {
              v29[0] = MEMORY[0x1E0C809B0];
              v29[1] = 3221225472;
              v29[2] = __getCKShareClass_block_invoke;
              v29[3] = &unk_1E38A1710;
              v29[4] = &v30;
              __getCKShareClass_block_invoke((uint64_t)v29);
              v22 = (void *)v31[3];
            }
            v23 = objc_retainAutorelease(v22);
            _Block_object_dispose(&v30, 8);
            NSStringFromSelector(sel_share);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v25 = 0;
          }
          v27 = -[TUConversationActivityCreateSessionRequest initWithMetadata:applicationContext:activityIdentifier:uuid:staticIdentifier:](self, "initWithMetadata:applicationContext:activityIdentifier:uuid:staticIdentifier:", v13, v10, v7, v16, v19);
          -[TUConversationActivityCreateSessionRequest setShare:](v27, "setShare:", v25);
          self = v27;

          v26 = self;
        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[TUConversationActivityCreateSessionRequest activityIdentifier](self, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationActivityCreateSessionRequest applicationContext](self, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationActivityCreateSessionRequest metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUConversationActivityCreateSessionRequest UUID](self, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUConversationActivityCreateSessionRequest share](self, "share");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_share);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUConversationActivityCreateSessionRequest staticIdentifier](self, "staticIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_staticIdentifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUConversationActivityMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)staticIdentifier
{
  return self->_staticIdentifier;
}

- (void)setStaticIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticIdentifier, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
