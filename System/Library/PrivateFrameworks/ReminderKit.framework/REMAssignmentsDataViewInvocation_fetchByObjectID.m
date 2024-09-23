@implementation REMAssignmentsDataViewInvocation_fetchByObjectID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAssignmentsDataViewInvocation_fetchByObjectID)initWithObjectIDs:(id)a3
{
  id v5;
  REMAssignmentsDataViewInvocation_fetchByObjectID *v6;
  REMAssignmentsDataViewInvocation_fetchByObjectID *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAssignmentsDataViewInvocation_fetchByObjectID;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_objectIDs, a3);
    v7->_allowConcealedObjects = 0;
  }

  return v7;
}

- (REMAssignmentsDataViewInvocation_fetchByObjectID)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  REMAssignmentsDataViewInvocation_fetchByObjectID *v10;
  REMAssignmentsDataViewInvocation_fetchByObjectID *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("objectIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("allowConcealedObjects"));
  if (v8)
  {
    v10 = -[REMAssignmentsDataViewInvocation_fetchByObjectID initWithObjectIDs:](self, "initWithObjectIDs:", v8);
    -[REMAssignmentsDataViewInvocation_fetchByObjectID setAllowConcealedObjects:](v10, "setAllowConcealedObjects:", v9);
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
  -[REMAssignmentsDataViewInvocation_fetchByObjectID objectIDs](self, "objectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("objectIDs"));

  objc_msgSend(v5, "encodeBool:forKey:", -[REMAssignmentsDataViewInvocation_fetchByObjectID allowConcealedObjects](self, "allowConcealedObjects"), CFSTR("allowConcealedObjects"));
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
  -[REMAssignmentsDataViewInvocation_fetchByObjectID objectIDs](self, "objectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  v7 = (void *)v6;
  -[REMAssignmentsDataViewInvocation_fetchByObjectID objectIDs](self, "objectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
LABEL_6:
    v12 = -[REMAssignmentsDataViewInvocation_fetchByObjectID allowConcealedObjects](self, "allowConcealedObjects");
    v11 = v12 ^ objc_msgSend(v4, "allowConcealedObjects") ^ 1;
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v11) = 0;
LABEL_7:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAssignmentsDataViewInvocation_fetchByObjectID objectIDs](self, "objectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (BOOL)allowConcealedObjects
{
  return self->_allowConcealedObjects;
}

- (void)setAllowConcealedObjects:(BOOL)a3
{
  self->_allowConcealedObjects = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end
