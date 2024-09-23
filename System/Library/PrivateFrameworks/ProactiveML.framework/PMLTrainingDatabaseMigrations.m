@implementation PMLTrainingDatabaseMigrations

- (PMLTrainingDatabaseMigrations)initWithMigrations:(id)a3
{
  id v5;
  PMLTrainingDatabaseMigrations *v6;
  PMLTrainingDatabaseMigrations *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLTrainingDatabaseMigrations;
  v6 = -[PMLTrainingDatabaseMigrations init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_migrations, a3);

  return v7;
}

- (PMLTrainingDatabaseMigrations)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PMLTrainingDatabaseMigrations *v8;
  void *v10;
  _QWORD v11[26];
  _QWORD v12[27];

  v12[26] = *MEMORY[0x24BDAC8D0];
  v11[0] = &unk_24D3EAA60;
  v11[1] = &unk_24D3EAA78;
  v12[0] = &unk_24D3EB188;
  v12[1] = &unk_24D3EB1A0;
  v11[2] = &unk_24D3EAA90;
  v11[3] = &unk_24D3EAAA8;
  v12[2] = &unk_24D3EB1B8;
  v12[3] = &unk_24D3EB1D0;
  v11[4] = &unk_24D3EAAC0;
  v11[5] = &unk_24D3EAAD8;
  v12[4] = &unk_24D3EB1E8;
  v12[5] = &unk_24D3EB200;
  v11[6] = &unk_24D3EAAF0;
  v11[7] = &unk_24D3EAB08;
  v12[6] = &unk_24D3EB218;
  v12[7] = &unk_24D3EB230;
  v11[8] = &unk_24D3EAB20;
  v11[9] = &unk_24D3EAB38;
  v12[8] = &unk_24D3EB248;
  v12[9] = &unk_24D3EB260;
  v12[10] = &unk_24D3EB278;
  v11[10] = &unk_24D3EAB50;
  v11[11] = &unk_24D3EAB68;
  v3 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", migrateSessionsToFloats);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("migrationFunction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[11] = v6;
  v12[12] = &unk_24D3EB290;
  v11[12] = &unk_24D3EAB80;
  v11[13] = &unk_24D3EAB98;
  v12[13] = &unk_24D3EB2A8;
  v12[14] = &unk_24D3EB2C0;
  v11[14] = &unk_24D3EABB0;
  v11[15] = &unk_24D3EABC8;
  v12[15] = &unk_24D3EB2D8;
  v12[16] = &unk_24D3EB2F0;
  v11[16] = &unk_24D3EABE0;
  v11[17] = &unk_24D3EABF8;
  v12[17] = &unk_24D3EB308;
  v12[18] = &unk_24D3EB320;
  v11[18] = &unk_24D3EAC10;
  v11[19] = &unk_24D3EAC28;
  v12[19] = &unk_24D3EB338;
  v12[20] = &unk_24D3EB350;
  v11[20] = &unk_24D3EAC40;
  v11[21] = &unk_24D3EAC58;
  v12[21] = &unk_24D3EB368;
  v12[22] = &unk_24D3EB380;
  v11[22] = &unk_24D3EAC70;
  v11[23] = &unk_24D3EAC88;
  v12[23] = &unk_24D3EB398;
  v12[24] = &unk_24D3EB3B0;
  v11[24] = &unk_24D3EACA0;
  v11[25] = &unk_24D3EACB8;
  v12[25] = &unk_24D3EB3C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PMLTrainingDatabaseMigrations initWithMigrations:](self, "initWithMigrations:", v7);

  return v8;
}

- (unsigned)maxVersion
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  -[PMLTrainingDatabaseMigrations migrations](self, "migrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@max.unsignedIntValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  return v5;
}

- (NSDictionary)migrations
{
  return self->_migrations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrations, 0);
}

+ (id)mockMigrationsByAddingQueries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "migrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "maxVersion") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v8);

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMigrations:", v7);
  return v9;
}

+ (id)skipFromZeroSchema:(unsigned int *)a3
{
  *a3 = 26;
  return &unk_24D3EB3E0;
}

@end
