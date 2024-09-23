@implementation RCMigration

- (unint64_t)migrationFlags
{
  void *v2;
  unint64_t v3;

  -[RCMigration flags](self, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (void)setMigrationFlags:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RCMigration setFlags:](self, "setFlags:", v4);

}

+ (id)createEncryptedFieldsMigration:(int)a3 context:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;

  if ((a3 - 1) > 2)
    v4 = 1;
  else
    v4 = qword_1BD873FF0[a3 - 1];
  v5 = a4;
  v6 = -[RCMigration _initWithFlags:context:]([RCMigration alloc], "_initWithFlags:context:", v4, v5);

  return v6;
}

- (id)_initWithFlags:(unint64_t)a3 context:(id)a4
{
  RCMigration *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCMigration;
  v5 = -[RCMigration initWithContext:](&v8, sel_initWithContext_, a4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCMigration setDate:](v5, "setDate:", v6);

    -[RCMigration setMigrationFlags:](v5, "setMigrationFlags:", a3);
  }
  return v5;
}

- (BOOL)hasEncryptedFields
{
  return -[RCMigration migrationFlags](self, "migrationFlags") & 1;
}

- (void)setHasEncryptedFields:(BOOL)a3
{
  -[RCMigration setMigrationFlags:](self, "setMigrationFlags:", -[RCMigration migrationFlags](self, "migrationFlags") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (int)migrationReason
{
  char v2;
  int v3;
  int v4;

  v2 = -[RCMigration migrationFlags](self, "migrationFlags");
  if ((v2 & 8) != 0)
    v3 = 3;
  else
    v3 = 0;
  if ((v2 & 4) != 0)
    v4 = 2;
  else
    v4 = v3;
  if ((v2 & 2) != 0)
    return 1;
  else
    return v4;
}

- (id)_descriptionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("objectID");
  -[RCMigration objectID](self, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v5;
  v17[1] = CFSTR("date");
  -[RCMigration date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v8;
  v17[2] = CFSTR("hasEncryptedFields");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RCMigration hasEncryptedFields](self, "hasEncryptedFields"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  v17[3] = CFSTR("reason");
  v10 = -[RCMigration migrationReason](self, "migrationReason") - 1;
  if (v10 > 2)
    v11 = CFSTR("Unknown");
  else
    v11 = off_1E769CDC0[v10];
  v18[3] = v11;
  v17[4] = CFSTR("flags");
  -[RCMigration flags](self, "flags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v7)
  if (!v4)

  return v14;
}

- (id)description
{
  void *v2;
  void *v3;

  -[RCMigration _descriptionDictionary](self, "_descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)jsonDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[RCMigration _descriptionDictionary](self, "_descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[RCMigration jsonDescription].cold.1((uint64_t)v5, v7);

    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)jsonDescription
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[RCMigration jsonDescription]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- dataWithJSONObject failed with %@", (uint8_t *)&v2, 0x16u);
}

@end
