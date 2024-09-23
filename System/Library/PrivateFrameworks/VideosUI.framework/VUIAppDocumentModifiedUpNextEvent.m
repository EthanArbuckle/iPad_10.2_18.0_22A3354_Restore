@implementation VUIAppDocumentModifiedUpNextEvent

- (VUIAppDocumentModifiedUpNextEvent)initWithDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (VUIAppDocumentModifiedUpNextEvent)initWithAddedCanonicalIDs:(id)a3 removedCanonicalIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VUIAppDocumentModifiedUpNextEvent *v9;
  uint64_t v10;
  NSSet *addedCanonicalIDs;
  uint64_t v12;
  NSSet *removedCanonicalIDs;
  VUIAppDocumentModifiedUpNextEvent *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    +[VUIAppDocumentUpdateEventDescriptor upNext](VUIAppDocumentUpdateEventDescriptor, "upNext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
    v9 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](&v16, sel_initWithDescriptor_, v8);

    if (v9)
    {
      v10 = objc_msgSend(v6, "copy");
      addedCanonicalIDs = v9->_addedCanonicalIDs;
      v9->_addedCanonicalIDs = (NSSet *)v10;

      v12 = objc_msgSend(v7, "copy");
      removedCanonicalIDs = v9->_removedCanonicalIDs;
      v9->_removedCanonicalIDs = (NSSet *)v12;

    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VUIAppDocumentModifiedUpNextEvent)initWithAction:(unint64_t)a3 canonicalID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  VUIAppDocumentModifiedUpNextEvent *v9;

  v6 = a4;
  if (a3 == 1)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v6, 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v6, 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[VUIAppDocumentModifiedUpNextEvent initWithAddedCanonicalIDs:removedCanonicalIDs:](self, "initWithAddedCanonicalIDs:removedCanonicalIDs:", v7, v8);

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
  -[VUIAppDocumentUpdateEvent dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[VUIAppDocumentModifiedUpNextEvent addedCanonicalIDs](self, "addedCanonicalIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("added"));

  }
  -[VUIAppDocumentModifiedUpNextEvent removedCanonicalIDs](self, "removedCanonicalIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("removed"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (id)coalescedEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUIAppDocumentModifiedUpNextEvent *v14;
  NSObject *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VUIAppDocumentModifiedUpNextEvent addedCanonicalIDs](self, "addedCanonicalIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v5, "addedCanonicalIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v8);

    -[VUIAppDocumentModifiedUpNextEvent removedCanonicalIDs](self, "removedCanonicalIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v5, "removedCanonicalIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "unionSet:", v11);
    v12 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v12, "minusSet:", v10);
    v13 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v13, "minusSet:", v7);
    v14 = -[VUIAppDocumentModifiedUpNextEvent initWithAddedCanonicalIDs:removedCanonicalIDs:]([VUIAppDocumentModifiedUpNextEvent alloc], "initWithAddedCanonicalIDs:removedCanonicalIDs:", v12, v13);

  }
  else
  {
    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[VUIAppDocumentModifiedFavoritesEvent coalescedEvent:].cold.1(self, v4, v15);

    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
  v3 = -[VUIAppDocumentUpdateEvent hash](&v9, sel_hash);
  -[VUIAppDocumentModifiedUpNextEvent addedCanonicalIDs](self, "addedCanonicalIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VUIAppDocumentModifiedUpNextEvent removedCanonicalIDs](self, "removedCanonicalIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppDocumentModifiedUpNextEvent *v4;
  VUIAppDocumentModifiedUpNextEvent *v5;
  VUIAppDocumentModifiedUpNextEvent *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v4 = (VUIAppDocumentModifiedUpNextEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v18.receiver = self;
        v18.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
        if (!-[VUIAppDocumentUpdateEvent isEqual:](&v18, sel_isEqual_, v6))
        {
LABEL_9:
          v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        -[VUIAppDocumentModifiedUpNextEvent addedCanonicalIDs](self, "addedCanonicalIDs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIAppDocumentModifiedUpNextEvent addedCanonicalIDs](v6, "addedCanonicalIDs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
          {
LABEL_18:

            goto LABEL_19;
          }
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_9;
        }
        -[VUIAppDocumentModifiedUpNextEvent removedCanonicalIDs](self, "removedCanonicalIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIAppDocumentModifiedUpNextEvent removedCanonicalIDs](v6, "removedCanonicalIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        v11 = v16;
        if (v9 == v16)
        {
          v12 = 1;
        }
        else
        {
          v12 = 0;
          if (v9 && v16)
            v12 = objc_msgSend(v9, "isEqual:", v16);
        }
        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_20:

  return v12;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUIAppDocumentModifiedUpNextEvent;
  -[VUIAppDocumentUpdateEvent description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentModifiedUpNextEvent addedCanonicalIDs](self, "addedCanonicalIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("addedCanonicalIDs"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentModifiedUpNextEvent removedCanonicalIDs](self, "removedCanonicalIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("removedCanonicalIDs"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSSet)addedCanonicalIDs
{
  return self->_addedCanonicalIDs;
}

- (void)setAddedCanonicalIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)removedCanonicalIDs
{
  return self->_removedCanonicalIDs;
}

- (void)setRemovedCanonicalIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedCanonicalIDs, 0);
  objc_storeStrong((id *)&self->_addedCanonicalIDs, 0);
}

@end
