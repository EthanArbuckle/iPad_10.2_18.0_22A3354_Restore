@implementation MOPerson

- (MOPerson)initWithPersonMO:(id)a3
{
  id v4;
  NSMutableArray *v5;
  SEL v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  MOPersonRelationship *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  MOPerson *v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new(NSMutableArray);
    v6 = NSSelectorFromString(CFSTR("personRelationships"));
    if ((objc_opt_respondsToSelector(v4, v6) & 1) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personRelationships"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = -[MOPersonRelationship initWithPersonRelationshipMO:]([MOPersonRelationship alloc], "initWithPersonRelationshipMO:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i));
            -[NSMutableArray addObject:](v5, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v9);
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactIdentifier"));
    v16 = objc_msgSend(v4, "isPHPersonTypeImportant");
    v17 = objc_msgSend(v4, "isMePerson");
    v18 = objc_msgSend(v4, "mePersonIdentified");
    v19 = -[NSMutableArray copy](v5, "copy");
    objc_msgSend(v4, "priorityScore");
    v21 = v20;
    objc_msgSend(v4, "significanceScore");
    LOBYTE(v27) = v18;
    self = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v13, v14, v15, &stru_1002B68D0, v16, v17, v21, v22, v27, v19);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceEventIdentifier"));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceEventIdentifier"));
      -[MOPerson setSourceEventIdentifier:](self, "setSourceEventIdentifier:", v24);

    }
    if (objc_msgSend(v4, "sourceEventAccessType"))
      -[MOPerson setSourceEventAccessType:](self, "setSourceEventAccessType:", objc_msgSend(v4, "sourceEventAccessType"));

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6
{
  return -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:", a3, a4, a5, a6, 0.0, -1.0);
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7
{
  return -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:priorityScore:significanceScore:", a3, a4, a5, a6, a7, -1.0);
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7 significanceScore:(double)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", a3, a4, a5, a6, 0, 0, a7, a8, v9, 0);
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 isPHPersonTypeImportant:(BOOL)a7 isMePerson:(BOOL)a8 mePersonIdentified:(BOOL)a9 personRelationships:(id)a10 priorityScore:(double)a11 significanceScore:(double)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MOPerson *v25;
  NSString *v26;
  NSString *localIdentifier;
  NSString *v28;
  NSString *name;
  NSString *v30;
  NSString *contactIdentifier;
  NSString *v32;
  NSString *family;
  NSArray *v34;
  NSArray *personRelationships;
  objc_super v37;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a10;
  v37.receiver = self;
  v37.super_class = (Class)MOPerson;
  v25 = -[MOPerson init](&v37, "init");
  if (v25)
  {
    v26 = (NSString *)objc_msgSend(v20, "copy");
    localIdentifier = v25->_localIdentifier;
    v25->_localIdentifier = v26;

    v28 = (NSString *)objc_msgSend(v21, "copy");
    name = v25->_name;
    v25->_name = v28;

    v30 = (NSString *)objc_msgSend(v22, "copy");
    contactIdentifier = v25->_contactIdentifier;
    v25->_contactIdentifier = v30;

    v32 = (NSString *)objc_msgSend(v23, "copy");
    family = v25->_family;
    v25->_family = v32;

    v25->_isPHPersonTypeImportant = a7;
    v25->_isMePerson = a8;
    v25->_mePersonIdentified = a9;
    v34 = (NSArray *)objc_msgSend(v24, "copy");
    personRelationships = v25->_personRelationships;
    v25->_personRelationships = v34;

    v25->_priorityScore = a11;
    v25->_significanceScore = a12;
  }

  return v25;
}

- (MOPerson)initWithPersonDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  MOPerson *v20;
  uint64_t v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("localIdentifier")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("name")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("contactIdentifier")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("family")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("priorityScore")));
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("significanceScore")));
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("isPHPersonTypeImportant")));
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("isMePerson")));
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("mePersonIdentified")));
  LOBYTE(v4) = objc_msgSend(v19, "BOOLValue");

  LOBYTE(v22) = (_BYTE)v4;
  v20 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v5, v6, v7, v8, v16, v18, v11, v14, v22, 0);

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson localIdentifier](self, "localIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson contactIdentifier](self, "contactIdentifier"));
  v7 = -[MOPerson isPHPersonTypeImportant](self, "isPHPersonTypeImportant");
  v8 = -[MOPerson isMePerson](self, "isMePerson");
  v9 = -[MOPerson mePersonIdentified](self, "mePersonIdentified");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson personRelationships](self, "personRelationships"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson family](self, "family"));
  -[MOPerson significanceScore](self, "significanceScore");
  v13 = v12;
  -[MOPerson priorityScore](self, "priorityScore");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOPerson localIdentifier, %@, name, %@, contactIdentifier, %@, isPHPersonTypeImportant, %d, isMePerson, %d, mePersonIdentified, %d, peopleClassification, %@, family, %@, significanceScore, %.1f, priorityScore, %.1f>"), v3, v5, v6, v7, v8, v9, v10, v11, v13, v14));

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localIdentifier;
  id v5;

  localIdentifier = self->_localIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localIdentifier, CFSTR("localIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPHPersonTypeImportant, CFSTR("isPHPersonTypeImportant"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMePerson, CFSTR("isMePerson"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_mePersonIdentified, CFSTR("mePersonIdentified"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personRelationships, CFSTR("personRelationships"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("priorityScore"), self->_priorityScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("significanceScore"), self->_significanceScore);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (MOPerson)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSet *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  MOPerson *v29;
  id v30;
  void *v31;
  uint64_t v33;

  v3 = a3;
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v4), CFSTR("localIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v7), CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("contactIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v14 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v13), CFSTR("family"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isPHPersonTypeImportant"));
  v17 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isMePerson"));
  v18 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("mePersonIdentified"));
  v20 = objc_opt_class(NSArray, v19);
  v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, objc_opt_class(MOPersonRelationship, v21), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v23, CFSTR("personRelationships")));

  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("priorityScore"));
  v26 = v25;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("significanceScore"));
  LOBYTE(v33) = v18;
  v29 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](self, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v6, v9, v12, v15, v16, v17, v26, v27, v33, v24);
  if (v29)
  {
    v30 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v28), CFSTR("sourceEventIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    -[MOPerson setSourceEventIdentifier:](v29, "setSourceEventIdentifier:", v31);

    -[MOPerson setSourceEventAccessType:](v29, "setSourceEventAccessType:", objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  MOPerson *v4;
  MOPerson *v5;
  MOPerson *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  _BOOL4 v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  unsigned int v25;
  char v27;

  v4 = (MOPerson *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson localIdentifier](self, "localIdentifier"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson localIdentifier](v6, "localIdentifier"));
      LODWORD(v9) = v8 != 0;

    }
    else
    {
      LODWORD(v9) = 0;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson contactIdentifier](self, "contactIdentifier"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson contactIdentifier](v6, "contactIdentifier"));
      v13 = v12 != 0;

    }
    else
    {
      v13 = 0;
    }

    if ((_DWORD)v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson localIdentifier](self, "localIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson localIdentifier](v6, "localIdentifier"));
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson name](self, "name"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson name](v6, "name"));
      if (v18)
      {
        v27 = v9;
        v9 = objc_claimAutoreleasedReturnValue(-[MOPerson name](self, "name"));
        v19 = v16;
        v20 = v13;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson name](v6, "name"));
        v22 = objc_msgSend((id)v9, "isEqualToString:", v21);

        v13 = v20;
        v16 = v19;

        LOBYTE(v9) = v27;
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

    if (v13)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson contactIdentifier](self, "contactIdentifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson contactIdentifier](v6, "contactIdentifier"));
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

    }
    else
    {
      v25 = 0;
    }
    if (((v16 | v25) & 1) != 0)
      v10 = 1;
    else
      v10 = v22 & ~(v9 | v13);

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson localIdentifier](self, "localIdentifier"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson localIdentifier](self, "localIdentifier"));
    v5 = (unint64_t)objc_msgSend(v4, "hash");

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson name](self, "name"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson name](self, "name"));
    v8 = (unint64_t)objc_msgSend(v7, "hash");

  }
  else
  {
    v8 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson contactIdentifier](self, "contactIdentifier"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOPerson contactIdentifier](self, "contactIdentifier"));
    v11 = (unint64_t)objc_msgSend(v10, "hash");

  }
  else
  {
    v11 = 0;
  }

  return v8 ^ v5 ^ v11;
}

- (int64_t)comparePersons:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[MOPerson isMePerson](self, "isMePerson"))
  {
LABEL_5:
    v5 = -1;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "isMePerson") & 1) == 0)
  {
    if (!-[MOPerson isPHPersonTypeImportant](self, "isPHPersonTypeImportant"))
    {
      v5 = objc_msgSend(v4, "isPHPersonTypeImportant");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localIdentifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSString)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  objc_storeStrong((id *)&self->_family, a3);
}

- (BOOL)isPHPersonTypeImportant
{
  return self->_isPHPersonTypeImportant;
}

- (void)setIsPHPersonTypeImportant:(BOOL)a3
{
  self->_isPHPersonTypeImportant = a3;
}

- (BOOL)isMePerson
{
  return self->_isMePerson;
}

- (void)setIsMePerson:(BOOL)a3
{
  self->_isMePerson = a3;
}

- (BOOL)mePersonIdentified
{
  return self->_mePersonIdentified;
}

- (void)setMePersonIdentified:(BOOL)a3
{
  self->_mePersonIdentified = a3;
}

- (NSArray)personRelationships
{
  return self->_personRelationships;
}

- (void)setPersonRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_personRelationships, a3);
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (double)significanceScore
{
  return self->_significanceScore;
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_personRelationships, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
