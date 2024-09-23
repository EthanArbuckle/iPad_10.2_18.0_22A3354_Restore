@implementation TUContactsDataProviderAppleCareHandles

- (TUContactsDataProviderAppleCareHandles)init
{
  TUContactsDataProviderAppleCareHandles *v2;
  TUContactsDataProviderAppleCareHandles *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUContactsDataProviderAppleCareHandles;
  v2 = -[TUContactsDataProviderAppleCareHandles init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TUContactsDataProviderAppleCareHandles loadHandles](v2, "loadHandles");
  return v3;
}

- (void)loadHandles
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSSet *v15;
  NSSet *appleCareHandles;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("appleCareHandles"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("appleCareHandles"));
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
      v4 = (__CFString *)v6;
    else
      v4 = CFSTR("+18006927753,+18006927753,+558007610867,+864006272273,+864006668800,+448000391010,+85221120099, +852800908988,+3618830300,+82267126700,+82803334000,+82803308877,+74959612426,+74959612427,+886800095988,+886800020021");
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[__CFString componentsSeparatedByString:](v4, "componentsSeparatedByString:", CFSTR(","), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "length"))
        {
          +[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = (NSSet *)objc_msgSend(v7, "copy");
  appleCareHandles = self->_appleCareHandles;
  self->_appleCareHandles = v15;

}

- (BOOL)contains:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TUContactsDataProviderAppleCareHandles appleCareHandles](self, "appleCareHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)appleCareHandles
{
  return self->_appleCareHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleCareHandles, 0);
}

@end
