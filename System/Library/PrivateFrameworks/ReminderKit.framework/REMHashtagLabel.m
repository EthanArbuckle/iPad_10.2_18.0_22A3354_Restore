@implementation REMHashtagLabel

- (REMHashtagLabel)initWithName:(id)a3
{
  id v5;
  REMHashtagLabel *v6;
  REMHashtagLabel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMHashtagLabel;
  v6 = -[REMHashtagLabel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (REMHashtagLabel)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  REMHashtagLabel *v17;
  REMHashtagLabel *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)REMHashtagLabel;
  v17 = -[REMHashtagLabel init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_canonicalName, a4);
    objc_storeStrong((id *)&v18->_firstOccurrenceCreationDate, a5);
    objc_storeStrong((id *)&v18->_recencyDate, a6);
    objc_storeStrong((id *)&v18->_uuidForChangeTracking, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMHashtagLabel)initWithCoder:(id)a3
{
  id v4;
  REMHashtagLabel *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *canonicalName;
  uint64_t v10;
  NSDate *firstOccurrenceCreationDate;
  uint64_t v12;
  NSDate *recencyDate;
  uint64_t v14;
  NSUUID *uuidForChangeTracking;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)REMHashtagLabel;
  v5 = -[REMHashtagLabel init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canonicalName"));
    v8 = objc_claimAutoreleasedReturnValue();
    canonicalName = v5->_canonicalName;
    v5->_canonicalName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstOccurrenceCreationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstOccurrenceCreationDate = v5->_firstOccurrenceCreationDate;
    v5->_firstOccurrenceCreationDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recencyDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    recencyDate = v5->_recencyDate;
    v5->_recencyDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuidForChangeTracking"));
    v14 = objc_claimAutoreleasedReturnValue();
    uuidForChangeTracking = v5->_uuidForChangeTracking;
    v5->_uuidForChangeTracking = (NSUUID *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[REMHashtagLabel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[REMHashtagLabel canonicalName](self, "canonicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("canonicalName"));

  -[REMHashtagLabel firstOccurrenceCreationDate](self, "firstOccurrenceCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("firstOccurrenceCreationDate"));

  -[REMHashtagLabel recencyDate](self, "recencyDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("recencyDate"));

  -[REMHashtagLabel uuidForChangeTracking](self, "uuidForChangeTracking");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("uuidForChangeTracking"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[REMHashtagLabel isEqualToHashtagLabel:](self, "isEqualToHashtagLabel:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToHashtagLabel:(id)a3
{
  REMHashtagLabel *v4;
  REMHashtagLabel *v5;
  REMHashtagLabel *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = (REMHashtagLabel *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMHashtagLabel name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtagLabel name](v6, "name");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMHashtagLabel name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMHashtagLabel name](v6, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_18;
      }
      -[REMHashtagLabel canonicalName](self, "canonicalName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtagLabel canonicalName](v6, "canonicalName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMHashtagLabel canonicalName](self, "canonicalName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMHashtagLabel canonicalName](v6, "canonicalName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_18;
      }
      -[REMHashtagLabel firstOccurrenceCreationDate](self, "firstOccurrenceCreationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtagLabel firstOccurrenceCreationDate](v6, "firstOccurrenceCreationDate");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMHashtagLabel firstOccurrenceCreationDate](self, "firstOccurrenceCreationDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMHashtagLabel firstOccurrenceCreationDate](v6, "firstOccurrenceCreationDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_18;
      }
      -[REMHashtagLabel recencyDate](self, "recencyDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtagLabel recencyDate](v6, "recencyDate");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMHashtagLabel recencyDate](self, "recencyDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMHashtagLabel recencyDate](v6, "recencyDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_18;
      }
      -[REMHashtagLabel uuidForChangeTracking](self, "uuidForChangeTracking");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMHashtagLabel uuidForChangeTracking](v6, "uuidForChangeTracking");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v33 == (void *)v34)
      {
        v13 = 1;
        v35 = v33;
      }
      else
      {
        v35 = (void *)v34;
        -[REMHashtagLabel uuidForChangeTracking](self, "uuidForChangeTracking");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMHashtagLabel uuidForChangeTracking](v6, "uuidForChangeTracking");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v36, "isEqual:", v37);

      }
      goto LABEL_19;
    }
LABEL_18:
    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v13 = 1;
LABEL_20:

  return v13;
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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMHashtagLabel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMHashtagLabel canonicalName](self, "canonicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMHashtagLabel firstOccurrenceCreationDate](self, "firstOccurrenceCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMHashtagLabel recencyDate](self, "recencyDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMHashtagLabel uuidForChangeTracking](self, "uuidForChangeTracking");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name: %@, canonicalName: %@, firstOccurrenceCreationDate: %@, recencyDate: %@, uuidForChangeTracking: %@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)canonicalName
{
  return self->_canonicalName;
}

- (NSDate)firstOccurrenceCreationDate
{
  return self->_firstOccurrenceCreationDate;
}

- (NSDate)recencyDate
{
  return self->_recencyDate;
}

- (NSUUID)uuidForChangeTracking
{
  return self->_uuidForChangeTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidForChangeTracking, 0);
  objc_storeStrong((id *)&self->_recencyDate, 0);
  objc_storeStrong((id *)&self->_firstOccurrenceCreationDate, 0);
  objc_storeStrong((id *)&self->_canonicalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
