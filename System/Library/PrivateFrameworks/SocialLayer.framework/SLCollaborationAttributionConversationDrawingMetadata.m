@implementation SLCollaborationAttributionConversationDrawingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationAttributionConversationDrawingMetadata)initWithRecipientDrawingMetadata:(id)a3
{
  id v4;
  SLCollaborationAttributionConversationDrawingMetadata *v5;
  SLCollaborationAttributionConversationDrawingMetadata *v6;
  uint64_t v7;
  NSArray *recipientDrawingMetadata;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLCollaborationAttributionConversationDrawingMetadata;
  v5 = -[SLCollaborationAttributionConversationDrawingMetadata init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isGroupConversation = 0;
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    recipientDrawingMetadata = v6->_recipientDrawingMetadata;
    v6->_recipientDrawingMetadata = (NSArray *)v7;

  }
  return v6;
}

- (SLCollaborationAttributionConversationDrawingMetadata)initWithGroupPhotoFileURL:(id)a3 recipientDrawingMetadata:(id)a4 groupID:(id)a5
{
  id v9;
  id v10;
  id v11;
  SLCollaborationAttributionConversationDrawingMetadata *v12;
  SLCollaborationAttributionConversationDrawingMetadata *v13;
  id *p_isa;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v16.receiver = self;
    v16.super_class = (Class)SLCollaborationAttributionConversationDrawingMetadata;
    v13 = -[SLCollaborationAttributionConversationDrawingMetadata init](&v16, sel_init);
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      v13->_isGroupConversation = 1;
      objc_storeStrong((id *)&v13->_groupPhotoFileURL, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](self, "groupPhotoFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationAttributionConversationDrawingMetadata groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SLCollaborationAttributionConversationDrawingMetadata: %p> groupPhotoFileURL:[%@] groupID:[%@] recipientDrawingMetadata:[%@]"), self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SLCollaborationAttributionConversationDrawingMetadata)initWithCoder:(id)a3
{
  id v4;
  SLCollaborationAttributionConversationDrawingMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *recipientDrawingMetadata;
  uint64_t v11;
  NSURL *groupPhotoFileURL;
  uint64_t v13;
  NSString *groupID;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLCollaborationAttributionConversationDrawingMetadata;
  v5 = -[SLCollaborationAttributionConversationDrawingMetadata init](&v16, sel_init);
  if (v5)
  {
    v5->_isGroupConversation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGroupConversation"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recipientDrawingMetadata"));
    v9 = objc_claimAutoreleasedReturnValue();
    recipientDrawingMetadata = v5->_recipientDrawingMetadata;
    v5->_recipientDrawingMetadata = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupPhotoFileURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    groupPhotoFileURL = v5->_groupPhotoFileURL;
    v5->_groupPhotoFileURL = (NSURL *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v13 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SLCollaborationAttributionConversationDrawingMetadata isGroupConversation](self, "isGroupConversation"), CFSTR("isGroupConversation"));
  -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("recipientDrawingMetadata"));

  -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](self, "groupPhotoFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupPhotoFileURL"));

  -[SLCollaborationAttributionConversationDrawingMetadata groupID](self, "groupID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("groupID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[SLCollaborationAttributionConversationDrawingMetadata isGroupConversation](self, "isGroupConversation", a3);
  v5 = objc_alloc((Class)objc_opt_class());
  if (v4)
  {
    -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](self, "groupPhotoFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLCollaborationAttributionConversationDrawingMetadata groupID](self, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithGroupPhotoFileURL:recipientDrawingMetadata:groupID:", v6, v7, v8);

  }
  else
  {
    -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithRecipientDrawingMetadata:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  SLCollaborationAttributionConversationDrawingMetadata *v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SLCollaborationAttributionConversationDrawingMetadata *)v5;
    if (v6 == self)
    {
      v8 = 1;
      goto LABEL_26;
    }
    v7 = -[SLCollaborationAttributionConversationDrawingMetadata isGroupConversation](self, "isGroupConversation");
    if (v7 != -[SLCollaborationAttributionConversationDrawingMetadata isGroupConversation](v6, "isGroupConversation"))
    {
LABEL_4:
      v8 = 0;
LABEL_26:

      goto LABEL_27;
    }
    -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (-[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](v6, "recipientDrawingMetadata"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_23;
      v11 = (void *)v10;
      -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](v6, "recipientDrawingMetadata");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_22;
      v13 = (void *)v12;
      -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](v6, "recipientDrawingMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToArray:", v15);

      if (v9)
      {

        if (!v16)
          goto LABEL_4;
      }
      else
      {

        if ((v16 & 1) == 0)
          goto LABEL_4;
      }
    }
    -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](self, "groupPhotoFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](v6, "groupPhotoFileURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_29;
    }
    -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](self, "groupPhotoFileURL");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_23:
      v8 = 0;
      if (!v9)
        v9 = v3;
      goto LABEL_25;
    }
    v11 = (void *)v17;
    -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](v6, "groupPhotoFileURL");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](self, "groupPhotoFileURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](v6, "groupPhotoFileURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (v9)
      {

        if (!v22)
          goto LABEL_4;
      }
      else
      {

        if ((v22 & 1) == 0)
          goto LABEL_4;
      }
LABEL_29:
      -[SLCollaborationAttributionConversationDrawingMetadata groupID](self, "groupID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        -[SLCollaborationAttributionConversationDrawingMetadata groupID](v6, "groupID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v8 = 1;
LABEL_39:

          goto LABEL_25;
        }
      }
      -[SLCollaborationAttributionConversationDrawingMetadata groupID](self, "groupID");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        -[SLCollaborationAttributionConversationDrawingMetadata groupID](v6, "groupID");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          -[SLCollaborationAttributionConversationDrawingMetadata groupID](self, "groupID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLCollaborationAttributionConversationDrawingMetadata groupID](v6, "groupID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v28, "isEqualToString:", v29);

          if (!v9)
            goto LABEL_39;
LABEL_25:

          goto LABEL_26;
        }

      }
      v8 = 0;
      if (!v9)
        goto LABEL_39;
      goto LABEL_25;
    }
LABEL_22:

    goto LABEL_23;
  }
  v8 = 0;
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[SLCollaborationAttributionConversationDrawingMetadata isGroupConversation](self, "isGroupConversation");
  -[SLCollaborationAttributionConversationDrawingMetadata recipientDrawingMetadata](self, "recipientDrawingMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SLCollaborationAttributionConversationDrawingMetadata groupPhotoFileURL](self, "groupPhotoFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;
  -[SLCollaborationAttributionConversationDrawingMetadata groupID](self, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (NSURL)groupPhotoFileURL
{
  return self->_groupPhotoFileURL;
}

- (NSArray)recipientDrawingMetadata
{
  return self->_recipientDrawingMetadata;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_recipientDrawingMetadata, 0);
  objc_storeStrong((id *)&self->_groupPhotoFileURL, 0);
}

@end
