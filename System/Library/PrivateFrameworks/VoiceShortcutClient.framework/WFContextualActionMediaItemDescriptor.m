@implementation WFContextualActionMediaItemDescriptor

- (WFContextualActionMediaItemDescriptor)initWithPlaybackStoreId:(id)a3 name:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFContextualActionMediaItemDescriptor *v11;
  WFContextualActionMediaItemDescriptor *v12;
  uint64_t v13;
  NSString *name;
  WFContextualActionMediaItemDescriptor *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionMediaItemDescriptor.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playbackStoreId"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionMediaItemDescriptor.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFContextualActionMediaItemDescriptor;
  v11 = -[WFContextualActionMediaItemDescriptor init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playbackStoreId, a3);
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionMediaItemDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionMediaItemDescriptor playbackStoreId](self, "playbackStoreId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> Name: %@, Playback Store ID: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  v3 = (void *)objc_opt_new();
  -[WFContextualActionMediaItemDescriptor playbackStoreId](self, "playbackStoreId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v4);

  -[WFContextualActionMediaItemDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v6);

  v8 = objc_msgSend(v3, "finalize");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFContextualActionMediaItemDescriptor *v4;
  WFContextualActionMediaItemDescriptor *v5;
  WFContextualActionMediaItemDescriptor *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (WFContextualActionMediaItemDescriptor *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[WFContextualActionMediaItemDescriptor playbackStoreId](v6, "playbackStoreId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionMediaItemDescriptor playbackStoreId](self, "playbackStoreId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[WFContextualActionMediaItemDescriptor name](v6, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionMediaItemDescriptor name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (WFContextualActionMediaItemDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  WFContextualActionMediaItemDescriptor *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackStoreId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[WFContextualActionMediaItemDescriptor initWithPlaybackStoreId:name:](self, "initWithPlaybackStoreId:name:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *playbackStoreId;
  id v5;

  playbackStoreId = self->_playbackStoreId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", playbackStoreId, CFSTR("playbackStoreId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (NSNumber)playbackStoreId
{
  return self->_playbackStoreId;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_playbackStoreId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
