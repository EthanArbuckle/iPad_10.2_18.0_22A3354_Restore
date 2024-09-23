@implementation VUIAppDocumentModifiedFavoritesEvent

- (VUIAppDocumentModifiedFavoritesEvent)initWithDescriptor:(id)a3
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

- (VUIAppDocumentModifiedFavoritesEvent)initWithAddedEntityIDs:(id)a3 removedEntityIDs:(id)a4 isBackground:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  VUIAppDocumentModifiedFavoritesEvent *v11;
  uint64_t v12;
  NSSet *addedEntityIDs;
  uint64_t v14;
  NSSet *removedEntityIDs;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
    +[VUIAppDocumentUpdateEventDescriptor favoritesInBackground](VUIAppDocumentUpdateEventDescriptor, "favoritesInBackground");
  else
    +[VUIAppDocumentUpdateEventDescriptor favorites](VUIAppDocumentUpdateEventDescriptor, "favorites");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  v11 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](&v17, sel_initWithDescriptor_, v10);

  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    addedEntityIDs = v11->_addedEntityIDs;
    v11->_addedEntityIDs = (NSSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    removedEntityIDs = v11->_removedEntityIDs;
    v11->_removedEntityIDs = (NSSet *)v14;

    v11->_isBackground = v5;
  }

  return v11;
}

- (VUIAppDocumentModifiedFavoritesEvent)initWithAction:(unint64_t)a3 entityID:(id)a4 isBackground:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  VUIAppDocumentModifiedFavoritesEvent *v12;

  v5 = a5;
  v8 = a4;
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
  }
  else
  {
    if (a3 == 1)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v8, 0);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (a3)
    {
      v9 = 0;
      v11 = 0;
      goto LABEL_9;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v8, 0);
    v10 = (void *)MEMORY[0x1E0C99E60];
  }
  objc_msgSend(v10, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v12 = -[VUIAppDocumentModifiedFavoritesEvent initWithAddedEntityIDs:removedEntityIDs:isBackground:](self, "initWithAddedEntityIDs:removedEntityIDs:isBackground:", v9, v11, v5);

  return v12;
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
  v11.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  -[VUIAppDocumentUpdateEvent dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[VUIAppDocumentModifiedFavoritesEvent addedEntityIDs](self, "addedEntityIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("added"));

  }
  -[VUIAppDocumentModifiedFavoritesEvent removedEntityIDs](self, "removedEntityIDs");
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
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VUIAppDocumentModifiedFavoritesEvent *v18;
  NSObject *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[VUIAppDocumentUpdateEvent descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");
  objc_msgSend(v4, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (v6 == v8)
  {
    v9 = v4;
    -[VUIAppDocumentModifiedFavoritesEvent addedEntityIDs](self, "addedEntityIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v9, "addedEntityIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionSet:", v12);

    -[VUIAppDocumentModifiedFavoritesEvent removedEntityIDs](self, "removedEntityIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v9, "removedEntityIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "unionSet:", v15);
    v16 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v16, "minusSet:", v14);
    v17 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v17, "minusSet:", v11);
    v18 = -[VUIAppDocumentModifiedFavoritesEvent initWithAddedEntityIDs:removedEntityIDs:isBackground:]([VUIAppDocumentModifiedFavoritesEvent alloc], "initWithAddedEntityIDs:removedEntityIDs:isBackground:", v16, v17, self->_isBackground);

  }
  else
  {
LABEL_4:
    VUIDefaultLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VUIAppDocumentModifiedFavoritesEvent coalescedEvent:].cold.1(self, v4, v19);

    v18 = 0;
  }

  return v18;
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
  v9.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  v3 = -[VUIAppDocumentUpdateEvent hash](&v9, sel_hash);
  -[VUIAppDocumentModifiedFavoritesEvent addedEntityIDs](self, "addedEntityIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VUIAppDocumentModifiedFavoritesEvent removedEntityIDs](self, "removedEntityIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppDocumentModifiedFavoritesEvent *v4;
  VUIAppDocumentModifiedFavoritesEvent *v5;
  VUIAppDocumentModifiedFavoritesEvent *v6;
  _BOOL4 isBackground;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v4 = (VUIAppDocumentModifiedFavoritesEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v19.receiver = self;
        v19.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
        if (!-[VUIAppDocumentUpdateEvent isEqual:](&v19, sel_isEqual_, v6))
          goto LABEL_10;
        isBackground = self->_isBackground;
        if (isBackground != -[VUIAppDocumentModifiedFavoritesEvent isBackground](v6, "isBackground"))
          goto LABEL_10;
        -[VUIAppDocumentModifiedFavoritesEvent addedEntityIDs](self, "addedEntityIDs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIAppDocumentModifiedFavoritesEvent addedEntityIDs](v6, "addedEntityIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        if (v10 == v11)
        {

        }
        else
        {
          v12 = v11;
          v13 = 0;
          if (!v10 || !v11)
          {
LABEL_19:

            goto LABEL_20;
          }
          v14 = objc_msgSend(v10, "isEqual:", v11);

          if ((v14 & 1) == 0)
          {
LABEL_10:
            v13 = 0;
LABEL_20:

            goto LABEL_21;
          }
        }
        -[VUIAppDocumentModifiedFavoritesEvent removedEntityIDs](self, "removedEntityIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIAppDocumentModifiedFavoritesEvent removedEntityIDs](v6, "removedEntityIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v15;
        v17 = v16;
        v12 = v17;
        if (v10 == v17)
        {
          v13 = 1;
        }
        else
        {
          v13 = 0;
          if (v10 && v17)
            v13 = objc_msgSend(v10, "isEqual:", v17);
        }
        goto LABEL_19;
      }
    }
    v13 = 0;
  }
LABEL_21:

  return v13;
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
  v15.super_class = (Class)VUIAppDocumentModifiedFavoritesEvent;
  -[VUIAppDocumentUpdateEvent description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentModifiedFavoritesEvent addedEntityIDs](self, "addedEntityIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("addedEntityIDs"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentModifiedFavoritesEvent removedEntityIDs](self, "removedEntityIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("removedEntityIDs"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSSet)addedEntityIDs
{
  return self->_addedEntityIDs;
}

- (void)setAddedEntityIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)removedEntityIDs
{
  return self->_removedEntityIDs;
}

- (void)setRemovedEntityIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->_isBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedEntityIDs, 0);
  objc_storeStrong((id *)&self->_addedEntityIDs, 0);
}

- (void)coalescedEvent:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1D96EE000, a3, OS_LOG_TYPE_ERROR, "VUIAppDocumentUpdateEvent: Can't coalesce events as the descriptors don't match. Events: %@, %@", (uint8_t *)&v7, 0x16u);

}

@end
