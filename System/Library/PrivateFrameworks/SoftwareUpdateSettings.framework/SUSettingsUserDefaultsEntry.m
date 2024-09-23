@implementation SUSettingsUserDefaultsEntry

- (SUSettingsUserDefaultsEntry)initWithType:(int64_t)a3 key:(id)a4 description:(id)a5
{
  SUSettingsUserDefaultsEntry *v5;
  SUSettingsUserDefaultsEntry *v7;
  SUSettingsUserDefaultsEntry *v9;
  objc_super v10;
  id v11;
  id location;
  int64_t v13;
  SEL v14;
  SUSettingsUserDefaultsEntry *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v5 = v15;
  v15 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)SUSettingsUserDefaultsEntry;
  v9 = -[SUSettingsUserDefaultsEntry init](&v10, sel_init);
  v15 = v9;
  objc_storeStrong((id *)&v15, v9);
  if (v9)
  {
    v15->_type = v13;
    objc_storeStrong((id *)&v15->_key, location);
    objc_storeStrong((id *)&v15->_entryDescription, v11);
  }
  v7 = v15;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)initBoolEntryWithKey:(id)a3 description:(id)a4
{
  SUSettingsUserDefaultsEntry *v4;
  SUSettingsUserDefaultsEntry *v7;
  id v8;
  id location[2];
  SUSettingsUserDefaultsEntry *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0;
  v10 = -[SUSettingsUserDefaultsEntry initWithType:key:description:](v4, "initWithType:key:description:", 0, location[0], v8);
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (id)initNumberEntryWithKey:(id)a3 description:(id)a4
{
  SUSettingsUserDefaultsEntry *v4;
  SUSettingsUserDefaultsEntry *v7;
  id v8;
  id location[2];
  SUSettingsUserDefaultsEntry *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0;
  v10 = -[SUSettingsUserDefaultsEntry initWithType:key:description:](v4, "initWithType:key:description:", 1, location[0], v8);
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (id)initStringEntryWithKey:(id)a3 description:(id)a4
{
  SUSettingsUserDefaultsEntry *v4;
  SUSettingsUserDefaultsEntry *v7;
  id v8;
  id location[2];
  SUSettingsUserDefaultsEntry *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0;
  v10 = -[SUSettingsUserDefaultsEntry initWithType:key:description:](v4, "initWithType:key:description:", 2, location[0], v8);
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)entryDescription
{
  return self->_entryDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryDescription, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
