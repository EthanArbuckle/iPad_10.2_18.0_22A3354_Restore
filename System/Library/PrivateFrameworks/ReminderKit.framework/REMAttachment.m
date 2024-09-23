@implementation REMAttachment

- (REMAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 UTI:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REMAttachment *v15;
  REMAttachment *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)REMAttachment;
  v15 = -[REMAttachment init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objectID, a3);
    objc_storeStrong((id *)&v16->_accountID, a4);
    objc_storeStrong((id *)&v16->_reminderID, a5);
    objc_storeStrong((id *)&v16->_uti, a6);
  }

  return v16;
}

- (REMAttachment)initWithAttachment:(id)a3 objectID:(id)a4 accountID:(id)a5 reminderID:(id)a6
{
  REMObjectID *v10;
  REMObjectID *v11;
  REMObjectID *v12;
  REMAttachment *v13;
  REMObjectID *objectID;
  REMObjectID *v15;
  REMObjectID *accountID;
  REMObjectID *v17;
  REMObjectID *reminderID;

  v10 = (REMObjectID *)a4;
  v11 = (REMObjectID *)a5;
  v12 = (REMObjectID *)a6;
  objc_msgSend(a3, "_deepCopy");
  v13 = (REMAttachment *)objc_claimAutoreleasedReturnValue();

  objectID = v13->_objectID;
  v13->_objectID = v10;
  v15 = v10;

  accountID = v13->_accountID;
  v13->_accountID = v11;
  v17 = v11;

  reminderID = v13->_reminderID;
  v13->_reminderID = v12;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAttachment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  REMAttachment *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reminderID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uti"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMAttachment initWithObjectID:accountID:reminderID:UTI:](self, "initWithObjectID:accountID:reminderID:UTI:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[REMAttachment objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  -[REMAttachment accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountID"));

  -[REMAttachment reminderID](self, "reminderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("reminderID"));

  -[REMAttachment uti](self, "uti");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("uti"));

}

- (id)_deepCopy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc((Class)objc_opt_class());
  -[REMAttachment objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAttachment accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAttachment reminderID](self, "reminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAttachment uti](self, "uti");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithObjectID:accountID:reminderID:UTI:", v4, v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  REMAttachment *v4;
  REMAttachment *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = (REMAttachment *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[REMAttachment objectID](v5, "objectID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAttachment objectID](self, "objectID");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[REMAttachment objectID](v5, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAttachment objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_15;
      }
      -[REMAttachment accountID](v5, "accountID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAttachment accountID](self, "accountID");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[REMAttachment accountID](v5, "accountID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAttachment accountID](self, "accountID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
          goto LABEL_15;
      }
      -[REMAttachment reminderID](v5, "reminderID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAttachment reminderID](self, "reminderID");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

      }
      else
      {
        v21 = (void *)v20;
        -[REMAttachment reminderID](v5, "reminderID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAttachment reminderID](self, "reminderID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqual:", v23);

        if (!v24)
        {
LABEL_15:
          v12 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      -[REMAttachment uti](v5, "uti");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAttachment uti](self, "uti");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 == v26)
      {
        v12 = 1;
      }
      else
      {
        -[REMAttachment uti](v5, "uti");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAttachment uti](self, "uti");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v27, "isEqual:", v28);

      }
      goto LABEL_21;
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAttachment objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMAttachment objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAttachment uti](self, "uti");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, uti: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDAttachment");
}

- (NSString)uti
{
  return self->_uti;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_uti, 0);
}

@end
