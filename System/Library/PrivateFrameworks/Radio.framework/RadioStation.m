@implementation RadioStation

- (RadioStation)initWithModel:(id)a3 managedObject:(id)a4
{
  id v7;
  id v8;
  RadioStation *v9;
  RadioStation *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RadioStation;
  v9 = -[RadioStation init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_databaseBacked = 1;
    objc_storeStrong((id *)&v9->_managedObject, a4);
    objc_storeStrong((id *)&v10->_model, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__radioModelWasDeletedNotification_, CFSTR("RadioModelWasDeletedNotification"), v10->_model);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_databaseBacked)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("RadioModelWasDeletedNotification"), self->_model);

  }
  v4.receiver = self;
  v4.super_class = (Class)RadioStation;
  -[RadioStation dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  if (self->_databaseBacked)
  {
    -[NSManagedObject objectID](self->_managedObject, "objectID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hash");
  }
  else
  {
    -[RadioStation stationHash](self, "stationHash");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "hash");
    v4 = -[RadioStation stationID](self, "stationID") ^ v5;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RadioStation *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;

  v4 = (RadioStation *)a3;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  if (!self->_databaseBacked)
  {
    -[RadioStation stationHash](self, "stationHash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RadioStation stationHash](v4, "stationHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {

LABEL_8:
      v11 = -[RadioStation stationID](self, "stationID");
      v8 = v11 == -[RadioStation stationID](v4, "stationID");
      goto LABEL_13;
    }
    -[RadioStation stationHash](self, "stationHash");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      -[RadioStation stationHash](v4, "stationHash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_8;
    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  -[NSManagedObject objectID](self->_managedObject, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioStation managedObject](v4, "managedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

LABEL_13:
  return v8;
}

- (void)_radioModelWasDeletedNotification:(id)a3
{
  NSManagedObject *managedObject;

  managedObject = self->_managedObject;
  self->_managedObject = 0;

}

- (int64_t)adamID
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_adamID;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __22__RadioStation_adamID__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setAdamID:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setAdamID:", a3);
    }

  }
  else
  {
    self->_adamID = a3;
  }
}

- (NSData)adData
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_adData;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __22__RadioStation_adData__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSData *)v6;
}

- (void)setAdData:(id)a3
{
  void *v4;
  void *v5;
  NSData *adData;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  _QWORD v10[4];
  id v11;
  NSData *v12;

  v9 = (NSData *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __26__RadioStation_setAdData___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    adData = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_adData != v9)
  {
    v8 = (NSData *)-[NSData copy](v9, "copy");
    adData = self->_adData;
    self->_adData = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSURL)artworkURL
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_artworkURL;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__RadioStation_artworkURL__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSURL *)v6;
}

- (void)setArtworkURL:(id)a3
{
  void *artworkURL;
  uint64_t v5;
  void *v6;
  char v7;
  NSURL *v8;
  id v9;

  v9 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    artworkURL = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(artworkURL, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(artworkURL, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(artworkURL, "setArtworkURL:", v9);
    }
  }
  else
  {
    v8 = (NSURL *)v9;
    artworkURL = self->_artworkURL;
    self->_artworkURL = v8;
  }

}

- (NSData)artworkURLData
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_artworkURLData;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__RadioStation_artworkURLData__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSData *)v6;
}

- (void)setArtworkURLData:(id)a3
{
  void *v4;
  void *v5;
  NSData *artworkURLData;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  _QWORD v10[4];
  id v11;
  NSData *v12;

  v9 = (NSData *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setArtworkURLData___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    artworkURLData = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_artworkURLData != v9)
  {
    v8 = (NSData *)-[NSData copy](v9, "copy");
    artworkURLData = self->_artworkURLData;
    self->_artworkURLData = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSString)coreSeedName
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_coreSeedName;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__RadioStation_coreSeedName__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (void)setCoreSeedName:(id)a3
{
  void *v4;
  void *v5;
  NSString *coreSeedName;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v10[4];
  id v11;
  NSString *v12;

  v9 = (NSString *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __32__RadioStation_setCoreSeedName___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    coreSeedName = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_coreSeedName != v9)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    coreSeedName = self->_coreSeedName;
    self->_coreSeedName = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSDictionary)debugDictionary
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_debugDictionary;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__RadioStation_debugDictionary__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDictionary *)v6;
}

- (void)setDebugDictionary:(id)a3
{
  void *v4;
  void *v5;
  NSDictionary *debugDictionary;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  _QWORD v10[4];
  id v11;
  NSDictionary *v12;

  v9 = (NSDictionary *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__RadioStation_setDebugDictionary___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    debugDictionary = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_debugDictionary != v9)
  {
    v8 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
    debugDictionary = self->_debugDictionary;
    self->_debugDictionary = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSArray)editableFields
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_editableFields;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__RadioStation_editableFields__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v6;
}

- (void)setEditableFields:(id)a3
{
  void *v4;
  void *v5;
  NSArray *editableFields;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v10[4];
  id v11;
  NSArray *v12;

  v9 = (NSArray *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setEditableFields___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    editableFields = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_editableFields != v9)
  {
    v8 = (NSArray *)-[NSArray copy](v9, "copy");
    editableFields = self->_editableFields;
    self->_editableFields = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)editEnabled
{
  void *v3;
  void *v4;
  id v5;
  int editEnabled;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __27__RadioStation_editEnabled__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    editEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    editEnabled = self->_editEnabled;
  }
  return editEnabled != 0;
}

- (void)setEditEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setEditEnabled:", v3);
    }

  }
  else
  {
    self->_editEnabled = v3;
  }
}

- (unint64_t)impressionThreshold
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_impressionThreshold;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__RadioStation_impressionThreshold__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setImpressionThreshold:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setImpressionThreshold:", a3);
    }

  }
  else
  {
    self->_impressionThreshold = a3;
  }
}

- (BOOL)isExplicit
{
  void *v3;
  void *v4;
  id v5;
  int isExplicit;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __26__RadioStation_isExplicit__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    isExplicit = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    isExplicit = self->_isExplicit;
  }
  return isExplicit != 0;
}

- (void)setIsExplicit:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setIsExplicit:", v3);
    }

  }
  else
  {
    self->_isExplicit = v3;
  }
}

- (BOOL)isFeatured
{
  void *v3;
  void *v4;
  id v5;
  int featured;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __26__RadioStation_isFeatured__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    featured = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    featured = self->_featured;
  }
  return featured != 0;
}

- (void)setFeatured:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setFeatured:", v3);
    }

  }
  else
  {
    self->_featured = v3;
  }
}

- (BOOL)isGatewayVideoAdEnabled
{
  void *v3;
  void *v4;
  id v5;
  int gatewayVideoAdEnabled;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__RadioStation_isGatewayVideoAdEnabled__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    gatewayVideoAdEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    gatewayVideoAdEnabled = self->_gatewayVideoAdEnabled;
  }
  return gatewayVideoAdEnabled != 0;
}

- (void)setGatewayVideoAdEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setGatewayVideoAdEnabled:", v3);
    }

  }
  else
  {
    self->_gatewayVideoAdEnabled = v3;
  }
}

- (BOOL)isPremiumPlacement
{
  void *v3;
  void *v4;
  id v5;
  int premiumPlacement;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__RadioStation_isPremiumPlacement__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    premiumPlacement = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    premiumPlacement = self->_premiumPlacement;
  }
  return premiumPlacement != 0;
}

- (void)setPremiumPlacement:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setPremiumPlacement:", v3);
    }

  }
  else
  {
    self->_premiumPlacement = v3;
  }
}

- (BOOL)isShared
{
  void *v3;
  void *v4;
  id v5;
  int shared;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __24__RadioStation_isShared__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    shared = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    shared = self->_shared;
  }
  return shared != 0;
}

- (void)setShared:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setShared:", v3);
    }

  }
  else
  {
    self->_shared = v3;
  }
}

- (BOOL)isSharingEnabled
{
  void *v3;
  void *v4;
  id v5;
  int sharingEnabled;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__RadioStation_isSharingEnabled__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    sharingEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    sharingEnabled = self->_sharingEnabled;
  }
  return sharingEnabled != 0;
}

- (void)setSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSharingEnabled:", v3);
    }

  }
  else
  {
    self->_sharingEnabled = v3;
  }
}

- (BOOL)isSponsored
{
  void *v3;
  void *v4;
  id v5;
  int sponsored;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __27__RadioStation_isSponsored__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    sponsored = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    sponsored = self->_sponsored;
  }
  return sponsored != 0;
}

- (void)setSponsored:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSponsored:", v3);
    }

  }
  else
  {
    self->_sponsored = v3;
  }
}

- (BOOL)isSubscribed
{
  void *v3;
  void *v4;
  id v5;
  int subscribed;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_isSubscribed__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    subscribed = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    subscribed = self->_subscribed;
  }
  return subscribed != 0;
}

- (void)setSubscribed:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSubscribed:", v3);
    }

  }
  else
  {
    self->_subscribed = v3;
  }
}

- (BOOL)hasSkipRules
{
  void *v3;
  void *v4;
  id v5;
  int hasSkipRules;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_hasSkipRules__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    hasSkipRules = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    hasSkipRules = self->_hasSkipRules;
  }
  return hasSkipRules != 0;
}

- (void)setHasSkipRules:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setHasSkipRules:", v3);
    }

  }
  else
  {
    self->_hasSkipRules = v3;
  }
}

- (BOOL)likesEnabled
{
  void *v3;
  void *v4;
  id v5;
  int likesEnabled;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__RadioStation_likesEnabled__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    likesEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    likesEnabled = self->_likesEnabled;
  }
  return likesEnabled != 0;
}

- (void)setLikesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setLikesEnabled:", v3);
    }

  }
  else
  {
    self->_likesEnabled = v3;
  }
}

- (BOOL)requiresSubscription
{
  void *v3;
  void *v4;
  id v5;
  int requiresSubscription;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__RadioStation_requiresSubscription__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    requiresSubscription = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    requiresSubscription = self->_requiresSubscription;
  }
  return requiresSubscription != 0;
}

- (void)setRequiresSubscription:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setRequiresSubscription:", v3);
    }

  }
  else
  {
    self->_requiresSubscription = v3;
  }
}

- (NSString)name
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_name;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __20__RadioStation_name__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (void)setName:(id)a3
{
  void *v4;
  void *v5;
  NSString *name;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v10[4];
  id v11;
  NSString *v12;

  v9 = (NSString *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __24__RadioStation_setName___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    name = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_name != v9)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    name = self->_name;
    self->_name = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (int64_t)persistentID
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_persistentID;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__RadioStation_persistentID__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setPersistentID:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setPersistentID:", a3);
    }

  }
  else
  {
    self->_persistentID = a3;
  }
}

- (BOOL)isPreviewOnly
{
  void *v3;
  void *v4;
  id v5;
  int previewOnly;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29__RadioStation_isPreviewOnly__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    previewOnly = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    previewOnly = self->_previewOnly;
  }
  return previewOnly != 0;
}

- (void)setPreviewOnly:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setPreviewOnly:", v3);
    }

  }
  else
  {
    self->_previewOnly = v3;
  }
}

- (id)seedTracks
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_seedTracks;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__RadioStation_seedTracks__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setSeedTracks:(id)a3
{
  void *seedTracks;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    seedTracks = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(seedTracks, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(seedTracks, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(seedTracks, "setSeedTracks:", v9);
    }
  }
  else
  {
    v8 = v9;
    seedTracks = self->_seedTracks;
    self->_seedTracks = v8;
  }

}

- (NSString)shareToken
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_shareToken;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__RadioStation_shareToken__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (void)setShareToken:(id)a3
{
  void *v4;
  void *v5;
  NSString *shareToken;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v10[4];
  id v11;
  NSString *v12;

  v9 = (NSString *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __30__RadioStation_setShareToken___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    shareToken = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_shareToken != v9)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    shareToken = self->_shareToken;
    self->_shareToken = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)skipEnabled
{
  void *v3;
  void *v4;
  id v5;
  int skipEnabled;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __27__RadioStation_skipEnabled__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    skipEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    skipEnabled = self->_skipEnabled;
  }
  return skipEnabled != 0;
}

- (void)setSkipEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSkipEnabled:", v3);
    }

  }
  else
  {
    self->_skipEnabled = v3;
  }
}

- (int)skipFrequency
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_skipFrequency;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__RadioStation_skipFrequency__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setSkipFrequency:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSkipFrequency:", v3);
    }

  }
  else
  {
    self->_skipFrequency = v3;
  }
}

- (NSString)skipIdentifier
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_skipIdentifier;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__RadioStation_skipIdentifier__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (void)setSkipIdentifier:(id)a3
{
  void *v4;
  void *v5;
  NSString *skipIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v10[4];
  id v11;
  NSString *v12;

  v9 = (NSString *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setSkipIdentifier___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    skipIdentifier = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_skipIdentifier != v9)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    skipIdentifier = self->_skipIdentifier;
    self->_skipIdentifier = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (double)skipInterval
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_skipInterval;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__RadioStation_skipInterval__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setSkipInterval:(double)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSkipInterval:", a3);
    }

  }
  else
  {
    self->_skipInterval = a3;
  }
}

- (NSArray)skipTimestamps
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_skipTimestamps;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__RadioStation_skipTimestamps__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v6;
}

- (void)setSkipTimestamps:(id)a3
{
  void *v4;
  void *v5;
  NSArray *skipTimestamps;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v10[4];
  id v11;
  NSArray *v12;

  v9 = (NSArray *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __34__RadioStation_setSkipTimestamps___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    skipTimestamps = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_skipTimestamps != v9)
  {
    v8 = (NSArray *)-[NSArray copy](v9, "copy");
    skipTimestamps = self->_skipTimestamps;
    self->_skipTimestamps = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (int64_t)songMixType
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_songMixType;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __27__RadioStation_songMixType__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setSongMixType:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSongMixType:", a3);
    }

  }
  else
  {
    self->_songMixType = a3;
  }
}

- (int)sortOrder
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_sortOrder;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__RadioStation_sortOrder__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSortOrder:", v3);
    }

  }
  else
  {
    self->_sortOrder = v3;
  }
}

- (NSString)stationDescription
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_stationDescription;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__RadioStation_stationDescription__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (void)setStationDescription:(id)a3
{
  void *v4;
  void *v5;
  NSString *stationDescription;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v10[4];
  id v11;
  NSString *v12;

  v9 = (NSString *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __38__RadioStation_setStationDescription___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    stationDescription = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_stationDescription != v9)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    stationDescription = self->_stationDescription;
    self->_stationDescription = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSString)stationHash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_stationHash;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __27__RadioStation_stationHash__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (void)setStationHash:(id)a3
{
  void *v4;
  void *v5;
  NSString *stationHash;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v10[4];
  id v11;
  NSString *v12;

  v9 = (NSString *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __31__RadioStation_setStationHash___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    stationHash = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_stationHash != v9)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    stationHash = self->_stationHash;
    self->_stationHash = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSString)stationStringID
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_stationStringID;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__RadioStation_stationStringID__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (void)setStationStringID:(id)a3
{
  void *v4;
  void *v5;
  NSString *stationStringID;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v10[4];
  id v11;
  NSString *v12;

  v9 = (NSString *)a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__RadioStation_setStationStringID___block_invoke;
    v10[3] = &unk_24CA2E640;
    v11 = v4;
    v12 = v9;
    stationStringID = v4;
    objc_msgSend(v5, "performBlockAndWait:", v10);

LABEL_5:
    v7 = v9;
    goto LABEL_6;
  }
  v7 = v9;
  if (self->_stationStringID != v9)
  {
    v8 = (NSString *)-[NSString copy](v9, "copy");
    stationStringID = self->_stationStringID;
    self->_stationStringID = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (int64_t)stationID
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_stationID;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__RadioStation_stationID__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setStationID:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setStationID:", a3);
    }

  }
  else
  {
    self->_stationID = a3;
  }
}

- (NSURL)streamURL
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_streamURL;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__RadioStation_streamURL__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSURL *)v6;
}

- (void)setStreamURL:(id)a3
{
  void *streamURL;
  uint64_t v5;
  void *v6;
  char v7;
  NSURL *v8;
  id v9;

  v9 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    streamURL = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(streamURL, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(streamURL, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(streamURL, "setStreamURL:", v9);
    }
  }
  else
  {
    v8 = (NSURL *)v9;
    streamURL = self->_streamURL;
    self->_streamURL = v8;
  }

}

- (NSURL)streamCertificateURL
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_streamCertificateURL;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__RadioStation_streamCertificateURL__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSURL *)v6;
}

- (void)setStreamCertificateURL:(id)a3
{
  void *streamCertificateURL;
  uint64_t v5;
  void *v6;
  char v7;
  NSURL *v8;
  id v9;

  v9 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    streamCertificateURL = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(streamCertificateURL, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(streamCertificateURL, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(streamCertificateURL, "setStreamCertificateURL:", v9);
    }
  }
  else
  {
    v8 = (NSURL *)v9;
    streamCertificateURL = self->_streamCertificateURL;
    self->_streamCertificateURL = v8;
  }

}

- (NSURL)streamKeyURL
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_streamKeyURL;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__RadioStation_streamKeyURL__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSURL *)v6;
}

- (void)setStreamKeyURL:(id)a3
{
  void *streamKeyURL;
  uint64_t v5;
  void *v6;
  char v7;
  NSURL *v8;
  id v9;

  v9 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    streamKeyURL = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(streamKeyURL, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(streamKeyURL, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(streamKeyURL, "setStreamKeyURL:", v9);
    }
  }
  else
  {
    v8 = (NSURL *)v9;
    streamKeyURL = self->_streamKeyURL;
    self->_streamKeyURL = v8;
  }

}

- (int)subscriberCount
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  if (!-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
    return self->_subscriberCount;
  -[RadioStation managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__RadioStation_subscriberCount__block_invoke;
  v8[3] = &unk_24CA2EB50;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)setSubscriberCount:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setSubscriberCount:", v3);
    }

  }
  else
  {
    self->_subscriberCount = v3;
  }
}

- (BOOL)virtualPlayEnabled
{
  void *v3;
  void *v4;
  id v5;
  int virtualPlayEnabled;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__RadioStation_virtualPlayEnabled__block_invoke;
    v8[3] = &unk_24CA2EB50;
    v5 = v3;
    v9 = v5;
    v10 = &v11;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    virtualPlayEnabled = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    virtualPlayEnabled = self->_virtualPlayEnabled;
  }
  return virtualPlayEnabled != 0;
}

- (void)setVirtualPlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  if (-[RadioStation isDatabaseBacked](self, "isDatabaseBacked"))
  {
    -[RadioStation managedObject](self, "managedObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v8, "isDeleted");

      if ((v7 & 1) == 0)
        objc_msgSend(v8, "setVirtualPlayEnabled:", v3);
    }

  }
  else
  {
    self->_virtualPlayEnabled = v3;
  }
}

- (RadioArtworkCollection)artworkCollection
{
  void *v3;
  void *v4;
  RadioArtworkCollection *v5;
  void *v6;
  RadioArtwork *v7;
  RadioArtworkCollection *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[RadioStation artworkURLData](self, "artworkURLData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[RadioArtworkCollection initWithArtworkVariants:]([RadioArtworkCollection alloc], "initWithArtworkVariants:", v4);

      if (v5)
        goto LABEL_13;
    }
    else
    {

    }
  }
  -[RadioStation artworkURL](self, "artworkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[RadioArtwork initWithArtworkURL:pixelSize:]([RadioArtwork alloc], "initWithArtworkURL:pixelSize:", v6, 0.0, 0.0);
    if (v7)
    {
      v8 = [RadioArtworkCollection alloc];
      v11[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[RadioArtworkCollection initWithArtworks:](v8, "initWithArtworks:", v9);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

LABEL_13:
  return v5;
}

- (id)artworkURLForSize:(CGSize)a3 expectedSize:(CGSize *)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  -[RadioStation artworkCollection](self, "artworkCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bestArtworkForPointSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_5;
  if (a4)
  {
    objc_msgSend(v9, "pointSize");
    a4->width = v11;
    a4->height = v12;
  }
  objc_msgSend(v10, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_5:
    -[RadioStation artworkURL](self, "artworkURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isFileURL"))
    {

      v13 = 0;
    }
  }

  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (-[RadioStation stationID](self, "stationID"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[RadioStation stationID](self, "stationID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("station-id"));

  }
  -[RadioStation stationHash](self, "stationHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RadioStation stationHash](self, "stationHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("station-hash"));

  }
  -[RadioStation stationDescription](self, "stationDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RadioStation stationDescription](self, "stationDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("description"));

  }
  -[RadioStation name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RadioStation name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("name"));

  }
  if (-[RadioStation adamID](self, "adamID"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[RadioStation adamID](self, "adamID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("adam-id"));

  }
  if (-[RadioStation songMixType](self, "songMixType"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[RadioStation songMixType](self, "songMixType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("mix-type"));

  }
  -[RadioStation seedTracks](self, "seedTracks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[RadioStation seedTracks](self, "seedTracks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("seeds"));

  }
  return (NSDictionary *)v3;
}

- (NSDictionary)feedbackDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RadioStation dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[RadioStation debugDictionary](self, "debugDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("debug-dict"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v6;
}

- (BOOL)isPreview
{
  return -[RadioStation stationID](self, "stationID") == 0;
}

- (BOOL)isDatabaseBacked
{
  return self->_databaseBacked;
}

- (NSManagedObject)managedObject
{
  return self->_managedObject;
}

- (RadioModel)model
{
  return self->_model;
}

- (NSArray)trackPlaybackDescriptorQueue
{
  return self->_trackPlaybackDescriptorQueue;
}

- (void)setTrackPlaybackDescriptorQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamKeyURL, 0);
  objc_storeStrong((id *)&self->_streamCertificateURL, 0);
  objc_storeStrong((id *)&self->_streamURL, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_stationDescription, 0);
  objc_storeStrong((id *)&self->_skipTimestamps, 0);
  objc_storeStrong((id *)&self->_skipIdentifier, 0);
  objc_storeStrong((id *)&self->_shareToken, 0);
  objc_storeStrong(&self->_seedTracks, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_editableFields, 0);
  objc_storeStrong((id *)&self->_debugDictionary, 0);
  objc_storeStrong((id *)&self->_coreSeedName, 0);
  objc_storeStrong((id *)&self->_artworkURLData, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_adData, 0);
  objc_storeStrong((id *)&self->_trackPlaybackDescriptorQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_managedObject, 0);
}

uint64_t __34__RadioStation_virtualPlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "virtualPlayEnabled");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __31__RadioStation_subscriberCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "subscriberCount");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void __28__RadioStation_streamKeyURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamKeyURL");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __36__RadioStation_streamCertificateURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamCertificateURL");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __25__RadioStation_streamURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamURL");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __25__RadioStation_stationID__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "stationID");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __35__RadioStation_setStationStringID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setStationStringID:", *(_QWORD *)(a1 + 40));
  return result;
}

void __31__RadioStation_stationStringID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stationStringID");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __31__RadioStation_setStationHash___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setStationHash:", *(_QWORD *)(a1 + 40));
  return result;
}

void __27__RadioStation_stationHash__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stationHash");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __38__RadioStation_setStationDescription___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setStationDescription:", *(_QWORD *)(a1 + 40));
  return result;
}

void __34__RadioStation_stationDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stationDescription");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __25__RadioStation_sortOrder__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "sortOrder");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __27__RadioStation_songMixType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "songMixType");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __34__RadioStation_setSkipTimestamps___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setSkipTimestamps:", *(_QWORD *)(a1 + 40));
  return result;
}

void __30__RadioStation_skipTimestamps__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "skipTimestamps");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __28__RadioStation_skipInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "skipInterval");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  }
  return result;
}

uint64_t __34__RadioStation_setSkipIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setSkipIdentifier:", *(_QWORD *)(a1 + 40));
  return result;
}

void __30__RadioStation_skipIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "skipIdentifier");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __29__RadioStation_skipFrequency__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "skipFrequency");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __27__RadioStation_skipEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "skipEnabled");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __30__RadioStation_setShareToken___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setShareToken:", *(_QWORD *)(a1 + 40));
  return result;
}

void __26__RadioStation_shareToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "shareToken");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __26__RadioStation_seedTracks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "seedTracks");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __29__RadioStation_isPreviewOnly__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isPreviewOnly");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __28__RadioStation_persistentID__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "persistentID");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __24__RadioStation_setName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setName:", *(_QWORD *)(a1 + 40));
  return result;
}

void __20__RadioStation_name__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __36__RadioStation_requiresSubscription__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "requiresSubscription");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __28__RadioStation_likesEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "likesEnabled");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __28__RadioStation_hasSkipRules__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "hasSkipRules");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __28__RadioStation_isSubscribed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isSubscribed");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __27__RadioStation_isSponsored__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isSponsored");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __32__RadioStation_isSharingEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isSharingEnabled");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __24__RadioStation_isShared__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isShared");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __34__RadioStation_isPremiumPlacement__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isPremiumPlacement");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __39__RadioStation_isGatewayVideoAdEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isGatewayVideoAdEnabled");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __26__RadioStation_isFeatured__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isFeatured");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __26__RadioStation_isExplicit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isExplicit");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __35__RadioStation_impressionThreshold__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "impressionThreshold");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __27__RadioStation_editEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "editEnabled");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __34__RadioStation_setEditableFields___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setEditableFields:", *(_QWORD *)(a1 + 40));
  return result;
}

void __30__RadioStation_editableFields__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "editableFields");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __35__RadioStation_setDebugDictionary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setDebugDictionary:", *(_QWORD *)(a1 + 40));
  return result;
}

void __31__RadioStation_debugDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "debugDictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __32__RadioStation_setCoreSeedName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setCoreSeedName:", *(_QWORD *)(a1 + 40));
  return result;
}

void __28__RadioStation_coreSeedName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "coreSeedName");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __34__RadioStation_setArtworkURLData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setArtworkURLData:", *(_QWORD *)(a1 + 40));
  return result;
}

void __30__RadioStation_artworkURLData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "artworkURLData");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __26__RadioStation_artworkURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "artworkURL");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __26__RadioStation_setAdData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setAdData:", *(_QWORD *)(a1 + 40));
  return result;
}

void __22__RadioStation_adData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "adData");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __22__RadioStation_adamID__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "adamID");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

@end
