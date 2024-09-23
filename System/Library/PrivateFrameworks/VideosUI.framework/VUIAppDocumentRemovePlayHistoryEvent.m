@implementation VUIAppDocumentRemovePlayHistoryEvent

- (VUIAppDocumentRemovePlayHistoryEvent)initWithDescriptor:(id)a3
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

- (VUIAppDocumentRemovePlayHistoryEvent)initWithRemovedCanonicalIDs:(id)a3
{
  id v4;
  void *v5;
  VUIAppDocumentRemovePlayHistoryEvent *v6;
  uint64_t v7;
  NSSet *removedCanonicalIDs;
  VUIAppDocumentRemovePlayHistoryEvent *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    +[VUIAppDocumentUpdateEventDescriptor removeFromPlayHistory](VUIAppDocumentUpdateEventDescriptor, "removeFromPlayHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11.receiver = self;
    v11.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
    v6 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](&v11, sel_initWithDescriptor_, v5);

    if (v6)
    {
      v7 = objc_msgSend(v4, "copy");
      removedCanonicalIDs = v6->_removedCanonicalIDs;
      v6->_removedCanonicalIDs = (NSSet *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
  -[VUIAppDocumentUpdateEvent dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[VUIAppDocumentRemovePlayHistoryEvent removedCanonicalIDs](self, "removedCanonicalIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("removed"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
  v3 = -[VUIAppDocumentUpdateEvent hash](&v7, sel_hash);
  -[VUIAppDocumentRemovePlayHistoryEvent removedCanonicalIDs](self, "removedCanonicalIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppDocumentRemovePlayHistoryEvent *v4;
  VUIAppDocumentRemovePlayHistoryEvent *v5;
  VUIAppDocumentRemovePlayHistoryEvent *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (VUIAppDocumentRemovePlayHistoryEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
    if (-[VUIAppDocumentUpdateEvent isEqual:](&v14, sel_isEqual_, v6))
    {
      -[VUIAppDocumentRemovePlayHistoryEvent removedCanonicalIDs](self, "removedCanonicalIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAppDocumentRemovePlayHistoryEvent removedCanonicalIDs](v6, "removedCanonicalIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

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
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentRemovePlayHistoryEvent;
  -[VUIAppDocumentUpdateEvent description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentRemovePlayHistoryEvent removedCanonicalIDs](self, "removedCanonicalIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("removedCanonicalIDs"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSSet)removedCanonicalIDs
{
  return self->_removedCanonicalIDs;
}

- (void)setRemovedCanonicalIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedCanonicalIDs, 0);
}

@end
