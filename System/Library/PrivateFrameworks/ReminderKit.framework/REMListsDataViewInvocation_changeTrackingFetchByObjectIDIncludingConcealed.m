@implementation REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed)initWithObjectIDs:(id)a3
{
  id v5;
  REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *v6;
  REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_objectIDs, a3);
    v7->_includeMarkedForDeletionOnly = 0;
  }

  return v7;
}

- (REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *v10;
  REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("objectIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("includeMarkedForDeletionOnly"));
  if (v8)
  {
    v10 = -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed initWithObjectIDs:](self, "initWithObjectIDs:", v8);
    -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed setIncludeMarkedForDeletionOnly:](v10, "setIncludeMarkedForDeletionOnly:", v9);
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed objectIDs](self, "objectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("objectIDs"));

  objc_msgSend(v5, "encodeBool:forKey:", -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed includeMarkedForDeletionOnly](self, "includeMarkedForDeletionOnly"), CFSTR("includeMarkedForDeletionOnly"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed objectIDs](self, "objectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  v7 = (void *)v6;
  -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed objectIDs](self, "objectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
LABEL_6:
    v12 = -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed includeMarkedForDeletionOnly](self, "includeMarkedForDeletionOnly");
    v11 = v12 ^ objc_msgSend(v4, "includeMarkedForDeletionOnly") ^ 1;
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v11) = 0;
LABEL_7:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed objectIDs](self, "objectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4
     + -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed includeMarkedForDeletionOnly](self, "includeMarkedForDeletionOnly");

  return v5;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (BOOL)includeMarkedForDeletionOnly
{
  return self->_includeMarkedForDeletionOnly;
}

- (void)setIncludeMarkedForDeletionOnly:(BOOL)a3
{
  self->_includeMarkedForDeletionOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end
