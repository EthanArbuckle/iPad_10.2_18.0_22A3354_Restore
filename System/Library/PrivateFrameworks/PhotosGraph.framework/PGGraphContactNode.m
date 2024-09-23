@implementation PGGraphContactNode

- (PGGraphContactNode)initWithName:(id)a3 contactIdentifier:(id)a4 birthdayDate:(id)a5 potentialBirthdayDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGGraphContactNode *v15;
  PGGraphContactNode *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGGraphContactNode;
  v15 = -[PGGraphNode init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_contactIdentifier, a4);
    objc_storeStrong((id *)&v16->_birthdayDate, a5);
    objc_storeStrong((id *)&v16->_potentialBirthdayDate, a6);
  }

  return v16;
}

- (PGGraphContactNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGGraphContactNode *v17;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cnid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bday"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pbday"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = -[PGGraphContactNode initWithName:contactIdentifier:birthdayDate:potentialBirthdayDate:](self, "initWithName:contactIdentifier:birthdayDate:potentialBirthdayDate:", v7, v8, v12, v16);

  return v17;
}

- (void)setLocalProperties:(id)a3
{
  NSString *v4;
  NSString *name;
  NSString *v6;
  NSString *contactIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("cnid"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v6;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bday"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong((id *)&self->_birthdayDate, v11);
  if (v9)

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("pbday"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_storeStrong((id *)&self->_potentialBirthdayDate, v15);
  if (v13)

}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_name))
      goto LABEL_11;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cnid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (!objc_msgSend(v8, "isEqual:", self->_contactIdentifier))
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bday"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
      -[NSDate timeIntervalSince1970](self->_birthdayDate, "timeIntervalSince1970");
      if (v11 != v12)
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pbday"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (!v13
      || (objc_msgSend(v13, "doubleValue"),
          v15 = v14,
          -[NSDate timeIntervalSince1970](self->_potentialBirthdayDate, "timeIntervalSince1970"),
          v15 == v16))
    {
      v17 = 1;
    }
    else
    {
LABEL_11:
      v17 = 0;
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (id)propertyDictionary
{
  id v3;
  NSDate *birthdayDate;
  void *v5;
  void *v6;
  NSDate *potentialBirthdayDate;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_contactIdentifier, CFSTR("cnid"));
  birthdayDate = self->_birthdayDate;
  if (birthdayDate)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](birthdayDate, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bday"));

  }
  potentialBirthdayDate = self->_potentialBirthdayDate;
  if (potentialBirthdayDate)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](potentialBirthdayDate, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pbday"));

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphContactNode;
  -[PGGraphOptimizedNode description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, self->_contactIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Contact");
  return CFSTR("Contact");
}

- (unsigned)domain
{
  return 303;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)birthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)potentialBirthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_potentialBirthdayDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Contact"), 303);
}

+ (id)filterWithContactIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("cnid");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
