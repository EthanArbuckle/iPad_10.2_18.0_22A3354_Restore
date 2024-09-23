@implementation WFContextualCallDescriptor

- (WFContextualCallDescriptor)initWithHandle:(id)a3 callType:(unint64_t)a4 person:(id)a5 callTypeSerializedRepresentation:(id)a6 personSerializedRepresentation:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFContextualCallDescriptor *v17;
  uint64_t v18;
  NSString *handle;
  uint64_t v20;
  INPerson *person;
  WFContextualCallDescriptor *v22;
  void *v24;
  objc_super v25;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualCallDescriptor.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

  }
  v25.receiver = self;
  v25.super_class = (Class)WFContextualCallDescriptor;
  v17 = -[WFContextualCallDescriptor init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    handle = v17->_handle;
    v17->_handle = (NSString *)v18;

    v17->_callType = a4;
    objc_storeStrong((id *)&v17->_callTypeSerializedRepresentation, a6);
    v20 = objc_msgSend(v14, "copy");
    person = v17->_person;
    v17->_person = (INPerson *)v20;

    objc_storeStrong((id *)&v17->_personSerializedRepresentation, a7);
    v22 = v17;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  WFContextualCallDescriptor *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;

  v4 = (WFContextualCallDescriptor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFContextualCallDescriptor handle](self, "handle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContextualCallDescriptor handle](v4, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        v10 = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
          goto LABEL_35;
        v13 = objc_msgSend(v7, "isEqualToString:", v8);

        if (!v13)
          goto LABEL_17;
      }
      v14 = -[WFContextualCallDescriptor callType](self, "callType");
      if (v14 != -[WFContextualCallDescriptor callType](v4, "callType"))
      {
LABEL_17:
        v10 = 0;
LABEL_36:

        goto LABEL_37;
      }
      -[WFContextualCallDescriptor callTypeSerializedRepresentation](self, "callTypeSerializedRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContextualCallDescriptor callTypeSerializedRepresentation](v4, "callTypeSerializedRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v17 = v16;
      v11 = v17;
      if (v12 == v17)
      {

      }
      else
      {
        v10 = 0;
        v18 = v17;
        v19 = v12;
        if (!v12 || !v17)
          goto LABEL_34;
        v20 = objc_msgSend(v12, "isEqual:", v17);

        if (!v20)
        {
          v10 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      -[WFContextualCallDescriptor person](self, "person");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContextualCallDescriptor person](v4, "person");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      v23 = v22;
      v31 = v23;
      if (v19 != v23)
      {
        v10 = 0;
        if (v19)
        {
          v24 = v23;
          v25 = v19;
          if (v23)
          {
            v26 = objc_msgSend(v19, "isEqual:", v23);

            if (!v26)
            {
              v10 = 0;
LABEL_33:
              v18 = v31;
LABEL_34:

              goto LABEL_35;
            }
            goto LABEL_25;
          }
        }
        else
        {
          v24 = v23;
          v25 = 0;
        }
LABEL_32:

        goto LABEL_33;
      }

LABEL_25:
      -[WFContextualCallDescriptor personSerializedRepresentation](self, "personSerializedRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContextualCallDescriptor personSerializedRepresentation](v4, "personSerializedRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v27;
      v29 = v28;
      v24 = v29;
      if (v25 == v29)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (v25 && v29)
          v10 = objc_msgSend(v25, "isEqual:", v29);
      }

      goto LABEL_32;
    }
    v10 = 0;
  }
LABEL_37:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;

  v3 = (void *)objc_opt_new();
  -[WFContextualCallDescriptor handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v4);

  v6 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualCallDescriptor callType](self, "callType"));
  -[WFContextualCallDescriptor callTypeSerializedRepresentation](self, "callTypeSerializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  -[WFContextualCallDescriptor person](self, "person");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v9);

  -[WFContextualCallDescriptor personSerializedRepresentation](self, "personSerializedRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v11);

  v13 = objc_msgSend(v3, "finalize");
  return v13;
}

- (WFContextualCallDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  WFContextualCallDescriptor *v22;
  void *v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("callTypeSerializedRepresentation"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("person"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("personSerializedRepresentation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[WFContextualCallDescriptor initWithHandle:callType:person:callTypeSerializedRepresentation:personSerializedRepresentation:](self, "initWithHandle:callType:person:callTypeSerializedRepresentation:personSerializedRepresentation:", v5, v25, v13, v24, v21);
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFContextualCallDescriptor handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("handle"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFContextualCallDescriptor callType](self, "callType"), CFSTR("callType"));
  -[WFContextualCallDescriptor callTypeSerializedRepresentation](self, "callTypeSerializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("callTypeSerializedRepresentation"));

  -[WFContextualCallDescriptor person](self, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("person"));

  -[WFContextualCallDescriptor personSerializedRepresentation](self, "personSerializedRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("personSerializedRepresentation"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[WFContextualCallDescriptor handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFContextualCallDescriptor callType](self, "callType");
  -[WFContextualCallDescriptor person](self, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualCallDescriptor callTypeSerializedRepresentation](self, "callTypeSerializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualCallDescriptor personSerializedRepresentation](self, "personSerializedRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithHandle:callType:person:callTypeSerializedRepresentation:personSerializedRepresentation:", v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)handle
{
  return self->_handle;
}

- (unint64_t)callType
{
  return self->_callType;
}

- (WFPropertyListObject)callTypeSerializedRepresentation
{
  return self->_callTypeSerializedRepresentation;
}

- (INPerson)person
{
  return self->_person;
}

- (WFPropertyListObject)personSerializedRepresentation
{
  return self->_personSerializedRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_callTypeSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
