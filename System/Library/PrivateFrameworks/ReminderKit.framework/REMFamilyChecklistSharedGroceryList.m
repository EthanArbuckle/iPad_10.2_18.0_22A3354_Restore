@implementation REMFamilyChecklistSharedGroceryList

- (REMFamilyChecklistSharedGroceryList)initWithListID:(id)a3 participants:(id)a4
{
  id v7;
  id v8;
  REMFamilyChecklistSharedGroceryList *v9;
  REMFamilyChecklistSharedGroceryList *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMFamilyChecklistSharedGroceryList;
  v9 = -[REMFamilyChecklistSharedGroceryList init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listID, a3);
    objc_storeStrong((id *)&v10->_participants, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMFamilyChecklistSharedGroceryList listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMFamilyChecklistSharedGroceryList participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMFamilyChecklistSharedGroceryList URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMFamilyChecklistSharedGroceryList itemProvider](self, "itemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p listID: %@, participants: %@, URL: %@ itemProvider: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  -[REMFamilyChecklistSharedGroceryList listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMFamilyChecklistSharedGroceryList listID](self, "listID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_12;
  }
  -[REMFamilyChecklistSharedGroceryList participants](self, "participants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMFamilyChecklistSharedGroceryList participants](self, "participants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  -[REMFamilyChecklistSharedGroceryList URL](self, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[REMFamilyChecklistSharedGroceryList URL](self, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
    {
LABEL_12:
      v23 = 0;
      goto LABEL_13;
    }
  }
  -[REMFamilyChecklistSharedGroceryList itemProvider](self, "itemProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemProvider");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v25 == (void *)v26)
  {
    v23 = 1;
    v27 = v25;
  }
  else
  {
    v27 = (void *)v26;
    -[REMFamilyChecklistSharedGroceryList itemProvider](self, "itemProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v28, "isEqual:", v29);

  }
LABEL_13:

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[REMFamilyChecklistSharedGroceryList listID](self, "listID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMFamilyChecklistSharedGroceryList participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[REMFamilyChecklistSharedGroceryList URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[REMFamilyChecklistSharedGroceryList itemProvider](self, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[REMFamilyChecklistSharedGroceryList listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMFamilyChecklistSharedGroceryList participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithListID:participants:", v5, v6);

  -[REMFamilyChecklistSharedGroceryList URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURL:", v8);

  -[REMFamilyChecklistSharedGroceryList itemProvider](self, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItemProvider:", v9);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistSharedGroceryList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  REMFamilyChecklistSharedGroceryList *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("participants"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[REMFamilyChecklistSharedGroceryList initWithListID:participants:](self, "initWithListID:participants:", v5, v9);
  -[REMFamilyChecklistSharedGroceryList setURL:](v12, "setURL:", v10);
  -[REMFamilyChecklistSharedGroceryList setItemProvider:](v12, "setItemProvider:", v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[REMFamilyChecklistSharedGroceryList listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("listID"));

  -[REMFamilyChecklistSharedGroceryList participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("participants"));

  -[REMFamilyChecklistSharedGroceryList URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("URL"));

  -[REMFamilyChecklistSharedGroceryList itemProvider](self, "itemProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("itemProvider"));

}

- (REMObjectID)listID
{
  return self->_listID;
}

- (NSSet)participants
{
  return self->_participants;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_listID, 0);
}

@end
