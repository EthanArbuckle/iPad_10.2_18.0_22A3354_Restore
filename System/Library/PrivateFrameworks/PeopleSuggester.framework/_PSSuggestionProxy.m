@implementation _PSSuggestionProxy

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 groupName:(id)a9 image:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _PSSuggestionProxy *v25;
  uint64_t v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (v18)
  {
    v29[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = 0;
  v25 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v28, v16, v17, v23, v19, v20, v27, v21, v22, v24);

  if (v18)
  return v25;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 image:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _PSSuggestionProxy *v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v18)
  {
    v27[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = 0;
  v24 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v15, v16, v17, v22, v19, v20, v26, 0, v21, v23);

  if (v18)
  return v24;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 reason:(id)a6 reasonType:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _PSSuggestionProxy *v19;
  uint64_t v21;

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "numberWithDouble:", -1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  v19 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v17, v16, v15, 0, v14, v13, v21, 0, 0, v18);

  return v19;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 reason:(id)a6 reasonType:(id)a7 modelScore:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", a3, a4, a5, 0, a6, a7, v9, 0, 0, a8);
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _PSSuggestionProxy *v23;
  _PSSuggestionProxy *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _PSSuggestionProxy *v33;
  uint64_t v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v36 = a6;
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = a8;
    v16 = a7;
    v17 = a6;
    v18 = a5;
    v19 = a4;
    v20 = a3;
    objc_msgSend(v14, "arrayWithObjects:count:", &v36, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v35) = 0;
    v23 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v20, v19, v18, v21, v16, v15, v35, 0, 0, v22, v36, v37);

    v24 = v23;
  }
  else
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    v26 = a8;
    v27 = a7;
    v28 = 0;
    v29 = a5;
    v30 = a4;
    v31 = a3;
    objc_msgSend(v25, "numberWithDouble:", -1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v35) = 0;
    v33 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v31, v30, v29, 0, v27, v26, v35, 0, 0, v32);

    v24 = v33;
  }

  return v24;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 handles:(id)a5 reason:(id)a6 reasonType:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _PSSuggestionProxy *v19;
  uint64_t v21;

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "numberWithDouble:", -1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  v19 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v17, v16, 0, v15, v14, v13, v21, 0, 0, v18);

  return v19;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _PSSuggestionProxy *v24;
  _PSSuggestionProxy *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  _PSSuggestionProxy *v34;
  uint64_t v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v37 = a6;
    v15 = (void *)MEMORY[0x1E0C99D20];
    v16 = a8;
    v17 = a7;
    v18 = a6;
    v19 = a5;
    v20 = a4;
    v21 = a3;
    objc_msgSend(v15, "arrayWithObjects:count:", &v37, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v36) = a9;
    v24 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v21, v20, v19, v22, v17, v16, v36, 0, 0, v23, v37, v38);

    v25 = v24;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    v27 = a8;
    v28 = a7;
    v29 = 0;
    v30 = a5;
    v31 = a4;
    v32 = a3;
    objc_msgSend(v26, "numberWithDouble:", -1.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v36) = a9;
    v34 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v32, v31, v30, 0, v28, v27, v36, 0, 0, v33);

    v25 = v34;
  }

  return v25;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handles:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9 groupName:(id)a10 image:(id)a11
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _PSSuggestionProxy *v27;
  uint64_t v29;

  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = a11;
  v19 = a10;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v17, "numberWithDouble:", -1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = a9;
  v27 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v25, v24, v23, v22, v21, v20, v29, v19, v18, v26);

  return v27;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handles:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9 groupName:(id)a10 image:(id)a11 modelScore:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _PSSuggestionProxy *v25;
  uint64_t v26;
  NSString *bundleID;
  uint64_t v28;
  NSString *interactionRecipients;
  uint64_t v30;
  NSString *reason;
  uint64_t v32;
  NSString *reasonType;
  uint64_t v34;
  NSArray *handles;
  NSString *handle;
  uint64_t v37;
  NSString *v38;
  id v41;
  objc_super v42;

  v17 = a3;
  v18 = a4;
  v41 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v42.receiver = self;
  v42.super_class = (Class)_PSSuggestionProxy;
  v25 = -[_PSSuggestionProxy init](&v42, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    bundleID = v25->_bundleID;
    v25->_bundleID = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    interactionRecipients = v25->_interactionRecipients;
    v25->_interactionRecipients = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    reason = v25->_reason;
    v25->_reason = (NSString *)v30;

    v32 = objc_msgSend(v21, "copy");
    reasonType = v25->_reasonType;
    v25->_reasonType = (NSString *)v32;

    v25->_useGroupsWhenFindingRecipient = a9;
    v34 = objc_msgSend(v19, "copy");
    handles = v25->_handles;
    v25->_handles = (NSArray *)v34;

    handle = v25->_handle;
    v25->_handle = 0;

    objc_storeStrong((id *)&v25->_contactID, a5);
    objc_storeStrong((id *)&v25->_groupName, a10);
    if (v19 && objc_msgSend(v19, "count") == 1)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v25->_handle;
      v25->_handle = (NSString *)v37;

    }
    objc_storeStrong((id *)&v25->_image, a11);
    objc_storeStrong((id *)&v25->_modelScore, a12);
  }

  return v25;
}

- (NSString)suggestionKey
{
  void *v3;
  void *v4;
  void *v5;

  -[_PSSuggestionProxy bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestionProxy interactionRecipients](self, "interactionRecipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _PSSuggestionKey(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)-[_PSSuggestionProxy descriptionRedacted:](self, "descriptionRedacted:", 0);
}

- (id)redactedDescription
{
  return -[_PSSuggestionProxy descriptionRedacted:](self, "descriptionRedacted:", 1);
}

- (id)descriptionRedacted:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
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

  v3 = a3;
  -[_PSSuggestionProxy bundleID](self, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[_PSSuggestionProxy interactionRecipients](self, "interactionRecipients"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[_PSSuggestionProxy bundleID](self, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D158F0];
    -[_PSSuggestionProxy interactionRecipients](self, "interactionRecipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptionOfObject:redacted:", v11, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("bundleID: %@, interactionRecipients: %@"), v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_PSSuggestionProxy contactID](self, "contactID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = (void *)MEMORY[0x1E0D158F0];
      -[_PSSuggestionProxy contactID](self, "contactID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "descriptionOfObject:redacted:", v9, v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("contactID: %@"), v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[_PSSuggestionProxy handles](self, "handles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v13 = 0;
        goto LABEL_9;
      }
      v19 = (void *)MEMORY[0x1E0D158F0];
      -[_PSSuggestionProxy handles](self, "handles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "descriptionOfArray:redacted:", v9, v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@"), objc_opt_class(), self, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSUInteger v10;
  NSUInteger v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_PSSuggestionProxy handles](self, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[_PSSuggestionProxy handles](self, "handles", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v4);
          v7 ^= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hash");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  v10 = -[NSString hash](self->_bundleID, "hash");
  v11 = -[NSString hash](self->_interactionRecipients, "hash");
  return v10 ^ v7 ^ v11 ^ -[NSString hash](self->_contactID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  _PSSuggestionProxy *v5;
  _PSSuggestionProxy *v6;
  _PSSuggestionProxy *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;

  v5 = (_PSSuggestionProxy *)a3;
  v6 = v5;
  if (self == v5)
  {
    v18 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[_PSSuggestionProxy bundleID](self, "bundleID");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_14;
        v9 = (void *)v8;
        -[_PSSuggestionProxy interactionRecipients](self, "interactionRecipients");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v3 = (void *)v10;
          -[_PSSuggestionProxy bundleID](v7, "bundleID");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            -[_PSSuggestionProxy interactionRecipients](v7, "interactionRecipients");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[_PSSuggestionProxy bundleID](self, "bundleID");
              v14 = (id)objc_claimAutoreleasedReturnValue();
              -[_PSSuggestionProxy bundleID](v7, "bundleID");
              v15 = (id)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "isEqualToString:", v15))
              {
                -[_PSSuggestionProxy interactionRecipients](self, "interactionRecipients");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSSuggestionProxy interactionRecipients](v7, "interactionRecipients");
                v17 = objc_claimAutoreleasedReturnValue();
LABEL_43:
                v45 = (void *)v17;
                v18 = objc_msgSend(v16, "isEqualToString:", v17);

LABEL_45:
                goto LABEL_46;
              }
              goto LABEL_44;
            }
LABEL_14:
            -[_PSSuggestionProxy contactID](self, "contactID");
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;
              -[_PSSuggestionProxy contactID](v7, "contactID");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v3 = (void *)v21;
                -[_PSSuggestionProxy contactID](self, "contactID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSSuggestionProxy contactID](v7, "contactID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v22, "isEqualToString:", v23);

                if (!v24)
                {
LABEL_26:
                  v18 = 0;
LABEL_47:

                  goto LABEL_48;
                }
              }
              else
              {

              }
            }
            -[_PSSuggestionProxy contactID](self, "contactID");
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              -[_PSSuggestionProxy contactID](v7, "contactID");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v3)
              {
                v18 = 0;
LABEL_46:

                goto LABEL_47;
              }
            }
            -[_PSSuggestionProxy contactID](v7, "contactID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              -[_PSSuggestionProxy contactID](self, "contactID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
              {

              }
              if (!v26)
                goto LABEL_26;
            }
            else
            {

              if (v14)
              {

              }
            }
            v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            -[_PSSuggestionProxy handles](self, "handles");
            v27 = objc_claimAutoreleasedReturnValue();
            if (!v27)
              goto LABEL_51;
            v28 = (void *)v27;
            -[_PSSuggestionProxy handles](v7, "handles");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
              goto LABEL_51;
            -[_PSSuggestionProxy handles](self, "handles");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "count");

            if (v31)
            {
              v32 = 0;
              do
              {
                -[_PSSuggestionProxy handles](self, "handles");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectAtIndexedSubscript:", v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v34);

                ++v32;
                -[_PSSuggestionProxy handles](self, "handles");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "count");

              }
              while (v36 > v32);
            }
            -[_PSSuggestionProxy handles](v7, "handles");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

            if (v38)
            {
              v39 = 0;
              do
              {
                -[_PSSuggestionProxy handles](v7, "handles");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectAtIndexedSubscript:", v39);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v41);

                ++v39;
                -[_PSSuggestionProxy handles](v7, "handles");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "count");

              }
              while (v43 > v39);
            }
            v44 = objc_msgSend(v14, "count");
            if (v44 == objc_msgSend(v15, "count"))
            {
              if (objc_msgSend(v14, "isEqualToSet:", v15))
              {
LABEL_51:
                if (objc_msgSend(v14, "count")
                  && objc_msgSend(v15, "count")
                  && objc_msgSend(v14, "isEqualToSet:", v15))
                {
                  -[_PSSuggestionProxy bundleID](self, "bundleID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSSuggestionProxy bundleID](v7, "bundleID");
                  v17 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_43;
                }
              }
            }
LABEL_44:
            v18 = 0;
            goto LABEL_45;
          }

        }
        goto LABEL_14;
      }
    }
    v18 = 0;
  }
LABEL_48:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSSuggestionProxy)initWithCoder:(id)a3
{
  id v4;
  _PSSuggestionProxy *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *interactionRecipients;
  uint64_t v10;
  NSString *contactID;
  uint64_t v12;
  NSString *handle;
  uint64_t v14;
  NSString *reason;
  uint64_t v16;
  NSString *reasonType;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *handles;
  uint64_t v23;
  NSNumber *modelScore;
  _PSSuggestionProxy *v25;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_PSSuggestionProxy;
  v5 = -[_PSSuggestionProxy init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionRecipients"));
    v8 = objc_claimAutoreleasedReturnValue();
    interactionRecipients = v5->_interactionRecipients;
    v5->_interactionRecipients = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactID"));
    v10 = objc_claimAutoreleasedReturnValue();
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v12 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v14 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reasonType"));
    v16 = objc_claimAutoreleasedReturnValue();
    reasonType = v5->_reasonType;
    v5->_reasonType = (NSString *)v16;

    v5->_useGroupsWhenFindingRecipient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useGroupsWhenFindingRecipient"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("handles"));
    v21 = objc_claimAutoreleasedReturnValue();
    handles = v5->_handles;
    v5->_handles = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelScore"));
    v23 = objc_claimAutoreleasedReturnValue();
    modelScore = v5->_modelScore;
    v5->_modelScore = (NSNumber *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionRecipients, CFSTR("interactionRecipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactID, CFSTR("contactID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reasonType, CFSTR("reasonType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useGroupsWhenFindingRecipient, CFSTR("useGroupsWhenFindingRecipient"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handles, CFSTR("handles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelScore, CFSTR("modelScore"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (INImage)image
{
  return self->_image;
}

- (NSString)interactionRecipients
{
  return self->_interactionRecipients;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSArray)handles
{
  return self->_handles;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (NSNumber)modelScore
{
  return self->_modelScore;
}

- (BOOL)useGroupsWhenFindingRecipient
{
  return self->_useGroupsWhenFindingRecipient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelScore, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_interactionRecipients, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
