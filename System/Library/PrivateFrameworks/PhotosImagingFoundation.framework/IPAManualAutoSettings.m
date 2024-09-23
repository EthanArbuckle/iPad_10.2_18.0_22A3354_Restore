@implementation IPAManualAutoSettings

- (IPAManualAutoSettings)init
{
  IPAManualAutoSettings *v2;
  uint64_t v3;
  NSMutableDictionary *state;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAManualAutoSettings;
  v2 = -[IPAAutoSettings initWithIdentifier:](&v6, sel_initWithIdentifier_, CFSTR("manual"));
  if (v2)
  {
    v3 = objc_opt_new();
    state = v2->_state;
    v2->_state = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (IPAManualAutoSettings)initWithIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("unsupported method for manual settings"));

  return 0;
}

- (void)_archiveIntoDictionary:(id)a3
{
  objc_msgSend(a3, "addEntriesFromDictionary:", self->_state);
}

- (BOOL)_applyArchiveDictionary:(id)a3
{
  return 1;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id result;
  IPAManualAutoSettings *v8;
  SEL v9;
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = (IPAManualAutoSettings *)_PFAssertFailHandler();
    -[IPAManualAutoSettings setValue:forUndefinedKey:](v8, v9, v10, v11);
  }
  return result;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  void *v7;
  IPAManualAutoSettings *v8;
  SEL v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_state, "setObject:forKeyedSubscript:", v10, v6);

  }
  else
  {
    v8 = (IPAManualAutoSettings *)_PFAssertFailHandler();
    -[IPAManualAutoSettings .cxx_destruct](v8, v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
