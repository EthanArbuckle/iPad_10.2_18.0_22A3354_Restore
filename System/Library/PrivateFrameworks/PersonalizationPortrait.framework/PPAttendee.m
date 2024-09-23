@implementation PPAttendee

- (PPAttendee)initWithName:(id)a3 emailAddress:(id)a4 url:(id)a5 isCurrentUser:(BOOL)a6 status:(unsigned __int8)a7
{
  uint64_t v7;
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  PPAttendee *v15;

  v7 = a7;
  v8 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a5, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPAttendee initWithName:emailAddress:urlString:isCurrentUser:status:](self, "initWithName:emailAddress:urlString:isCurrentUser:status:", v13, v12, v14, v8, v7);

  return v15;
}

- (PPAttendee)initWithName:(id)a3 emailAddress:(id)a4 urlString:(id)a5 isCurrentUser:(BOOL)a6 status:(unsigned __int8)a7
{
  uint64_t v7;
  _BOOL8 v8;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PPAttendee *v30;
  uint64_t i;
  uint64_t j;
  id v34;
  id v35[128];
  _QWORD v36[128];
  _QWORD v37[3];

  v7 = a7;
  v8 = a6;
  v37[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v34 = a5;
  bzero(v36, 0x400uLL);
  bzero(v35, 0x400uLL);
  if (v12)
  {
    v36[0] = CFSTR("nam");
    v35[0] = v12;
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  if (v13)
  {
    v15 = (void *)v36[v14];
    v36[v14] = CFSTR("eml");

    objc_storeStrong(&v35[v14++], a4);
  }
  v16 = v14;
  v17 = (void *)v36[v14];
  v36[v14] = CFSTR("url");

  objc_storeStrong(&v35[v14], a5);
  v18 = (void *)v36[v14 + 1];
  v36[v16 + 1] = CFSTR("icu");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v35[v14 + 1];
  v35[v16 + 1] = (id)v19;

  v21 = 8 * v14 + 16;
  v22 = *(void **)((char *)v36 + v21);
  v36[v16 + 2] = CFSTR("sta");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(id *)((char *)v35 + v21);
  *(id *)((char *)v35 + v21) = (id)v23;

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v35, v36, v14 + 3);
  v26 = v25;
  if (self)
  {
    v37[0] = v25;
    v27 = (void *)MEMORY[0x1E0C99D20];
    v28 = v25;
    objc_msgSend(v27, "arrayWithObjects:count:", v37, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[PPAttendee initWithIndex:inBackingPlists:]((id *)&self->super.isa, 0, v29);
  }
  v30 = self;

  for (i = 127; i != -1; --i)
  for (j = 127; j != -1; --j)

  return v30;
}

- (PPAttendee)initWithEKParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PPAttendee *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPAttendee initWithName:emailAddress:url:isCurrentUser:status:](self, "initWithName:emailAddress:url:isCurrentUser:status:", v6, v8, v9, objc_msgSend(v4, "isCurrentUser"), objc_msgSend(v4, "participantStatus"));

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)emailAddress
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eml"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)url
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v4 = objc_alloc(MEMORY[0x1E0C99E98]);
  -[PPAttendee _plist]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithString:", v6);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEvent.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  return (NSURL *)v7;
}

- (BOOL)isCurrentUser
{
  void *v2;
  void *v3;
  char v4;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("icu"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (unsigned)status
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sta"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedCharValue");

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPAttendee name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPAttendee emailAddress](self, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPAttendee n:'%@' e:'%@'>"), v4, v5);

  return v6;
}

- (PPAttendee)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PPAttendee *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D7805AC]();
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  v8 = (void *)MEMORY[0x18D7805AC]();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("nam"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("eml"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PPAttendee initWithName:emailAddress:url:isCurrentUser:status:](self, "initWithName:emailAddress:url:isCurrentUser:status:", v11, v12, v10, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("icu")), objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sta")));

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PPAttendee name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("nam"));

  -[PPAttendee emailAddress](self, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("eml"));

  -[PPAttendee url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("url"));

  objc_msgSend(v7, "encodeBool:forKey:", -[PPAttendee isCurrentUser](self, "isCurrentUser"), CFSTR("icu"));
  objc_msgSend(v7, "encodeInt32:forKey:", -[PPAttendee status](self, "status"), CFSTR("sta"));

}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eml"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("icu"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sta"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  PPAttendee *v4;
  PPAttendee *v5;
  id *v6;
  void *v7;
  void *v8;

  v4 = (PPAttendee *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      -[NSArray objectAtIndexedSubscript:](self->_backingPlists, "objectAtIndexedSubscript:", self->_indexInBackingPlists);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6[1], "objectAtIndexedSubscript:", v6[2]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingPlists, 0);
}

- (id)_plist
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 16));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)initWithIndex:(void *)a3 inBackingPlists:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PPAttendee;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[2] = a2;
      objc_storeStrong(v7 + 1, a3);
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
