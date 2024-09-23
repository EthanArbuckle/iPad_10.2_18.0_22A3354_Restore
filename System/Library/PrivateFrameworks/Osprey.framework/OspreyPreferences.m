@implementation OspreyPreferences

- (OspreyPreferences)initWithKeychain:(id)a3
{
  id v5;
  OspreyPreferences *v6;
  OspreyPreferences *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyPreferences;
  v6 = -[OspreyPreferences init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keychain, a3);

  return v7;
}

- (void)synchronize
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.osprey"));
}

- (id)connectionPreferencesForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OspreyConnectionPreferences *v9;
  OspreyKeychain *keychain;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("Connections"), CFSTR("com.apple.osprey"));
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [OspreyConnectionPreferences alloc];
    keychain = self->_keychain;
    if (v8)
      v11 = -[OspreyConnectionPreferences initWithDictionary:keychain:](v9, "initWithDictionary:keychain:", v8, keychain);
    else
      v11 = -[OspreyConnectionPreferences initWithConnectionHost:keychain:](v9, "initWithConnectionHost:keychain:", v5, keychain);
    v12 = (void *)v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)deleteConnectionPreferencesForHost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  OspreyConnectionPreferences *v8;
  id v9;

  v9 = a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("Connections"), CFSTR("com.apple.osprey"));
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    objc_msgSend(v9, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[OspreyConnectionPreferences initWithDictionary:keychain:]([OspreyConnectionPreferences alloc], "initWithDictionary:keychain:", v7, self->_keychain);
      -[OspreyConnectionPreferences deleteAll](v8, "deleteAll");

      objc_msgSend(v5, "removeObjectForKey:", v6);
      CFPreferencesSetAppValue(CFSTR("Connections"), v5, CFSTR("com.apple.osprey"));
    }

  }
}

- (void)setConnectionPreferences:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "connectionHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (v3)
  {
    objc_msgSend(v10, "connectionHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("Connections"), CFSTR("com.apple.osprey"));
    v8 = (id)objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "setValue:forKey:", v9, v6);
    else
      objc_msgSend(v8, "removeObjectForKey:", v6);
    CFPreferencesSetAppValue(CFSTR("Connections"), v8, CFSTR("com.apple.osprey"));

    v4 = v10;
  }

}

- (id)connections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OspreyConnectionPreferences *v11;
  void *v12;
  OspreyConnectionPreferences *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Connections"), CFSTR("com.apple.osprey"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [OspreyConnectionPreferences alloc];
        objc_msgSend(v3, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[OspreyConnectionPreferences initWithDictionary:keychain:](v11, "initWithDictionary:keychain:", v12, self->_keychain);

        objc_msgSend(v4, "addObject:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychain, 0);
}

@end
