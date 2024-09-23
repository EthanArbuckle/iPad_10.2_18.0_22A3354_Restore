@implementation PKHostDefaults

- (PKHostDefaults)initWithPlugIn:(id)a3
{
  id v4;
  PKHostDefaults *v5;
  PKHostDefaults *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKHostDefaults;
  v5 = -[PKHostDefaults init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKHostDefaults setPlugin:](v5, "setPlugin:", v4);

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1AF26E45C;
  v16 = sub_1AF26E46C;
  v17 = 0;
  -[PKHostDefaults plugin](self, "plugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHostDefaults plugin](self, "plugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1AF26E474;
  v11[3] = &unk_1E5F40EB0;
  v11[4] = &v12;
  objc_msgSend(v6, "prefsObjectForKey:inPlugIn:result:", v4, v8, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[PKHostDefaults plugin](self, "plugin");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syncService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHostDefaults plugin](self, "plugin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prefsSetObject:forKey:inPlugIn:result:", v7, v6, v10, &unk_1E5F40538);

}

- (BOOL)synchronize
{
  return 1;
}

- (PKHostPlugIn)plugin
{
  return (PKHostPlugIn *)objc_loadWeakRetained((id *)&self->_plugin);
}

- (void)setPlugin:(id)a3
{
  objc_storeWeak((id *)&self->_plugin, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_plugin);
}

@end
