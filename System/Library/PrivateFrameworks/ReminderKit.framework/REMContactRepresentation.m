@implementation REMContactRepresentation

- (REMContactRepresentation)initWithPhones:(id)a3 emails:(id)a4
{
  id v6;
  id v7;
  REMContactRepresentation *v8;
  uint64_t v9;
  NSArray *phones;
  uint64_t v11;
  NSArray *emails;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMContactRepresentation;
  v8 = -[REMContactRepresentation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    phones = v8->_phones;
    v8->_phones = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    emails = v8->_emails;
    v8->_emails = (NSArray *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  REMContactRepresentation *v4;
  REMContactRepresentation *v5;
  REMContactRepresentation *v6;
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

  v4 = (REMContactRepresentation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMContactRepresentation phones](self, "phones");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMContactRepresentation phones](v6, "phones");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMContactRepresentation phones](self, "phones");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMContactRepresentation phones](v6, "phones");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[REMContactRepresentation emails](self, "emails");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMContactRepresentation emails](v6, "emails");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        -[REMContactRepresentation emails](self, "emails");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMContactRepresentation emails](v6, "emails");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isEqual:", v18);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (BOOL)matchesContactRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  char v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[REMContactRepresentation phones](self, "phones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "phones");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "intersectsSet:", v10) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    -[REMContactRepresentation emails](self, "emails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "emails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "intersectsSet:", v17) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v18 = v7;
      v31 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v31)
      {
        v19 = *(_QWORD *)v41;
        v34 = v17;
        v35 = v7;
        v33 = v18;
        v30 = *(_QWORD *)v41;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v41 != v19)
              objc_enumerationMutation(v18);
            v32 = v20;
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v20));
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v22 = v10;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v37;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v37 != v25)
                    objc_enumerationMutation(v22);
                  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
                  v28 = objc_msgSend(v21, "isLikePhoneNumber:", v27);

                  if ((v28 & 1) != 0)
                  {

                    v11 = 1;
                    v17 = v34;
                    v7 = v35;
                    v18 = v33;
                    goto LABEL_23;
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
                if (v24)
                  continue;
                break;
              }
            }

            v20 = v32 + 1;
            v17 = v34;
            v7 = v35;
            v18 = v33;
            v19 = v30;
          }
          while (v32 + 1 != v31);
          v11 = 0;
          v31 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v31);
      }
      else
      {
        v11 = 0;
      }
LABEL_23:

    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[REMContactRepresentation phones](self, "phones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMContactRepresentation emails](self, "emails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMContactRepresentation phones](self, "phones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[REMContactRepresentation emails](self, "emails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p phones.count=%ld emails.count=%ld>"), v4, self, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMContactRepresentation phones](self, "phones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phones"));

  -[REMContactRepresentation emails](self, "emails");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("emails"));

}

- (REMContactRepresentation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  REMContactRepresentation *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("phones"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("emails"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[REMContactRepresentation initWithPhones:emails:](self, "initWithPhones:emails:", v8, v9);
  return v10;
}

- (id)archivedData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

+ (id)representationFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v10 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v6)
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[REMContactRepresentation representationFromData:].cold.1(v6, v7);

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NSArray)phones
{
  return self->_phones;
}

- (void)setPhones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_phones, 0);
}

+ (void)representationFromData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Unable to unarchive data to create REMContactRepresentation: %@", (uint8_t *)&v4, 0xCu);

}

@end
