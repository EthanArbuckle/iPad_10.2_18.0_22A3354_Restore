@implementation SignpostSupportGraceTimeOverrideEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGraceTime, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (NSMutableDictionary)overrides
{
  return self->_overrides;
}

- (SignpostSupportGraceTimeOverrideEntry)initWithEntryLevel:(unint64_t)a3
{
  SignpostSupportGraceTimeOverrideEntry *v4;
  uint64_t v5;
  NSMutableDictionary *overrides;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SignpostSupportGraceTimeOverrideEntry;
  v4 = -[SignpostSupportGraceTimeOverrideEntry init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    overrides = v4->_overrides;
    v4->_overrides = (NSMutableDictionary *)v5;

    v4->_entryLevel = a3;
  }
  return v4;
}

- (void)setDefaultGraceTime:(id)a3
{
  objc_storeStrong((id *)&self->_defaultGraceTime, a3);
}

- (SignpostSupportAnimationGraceTime)defaultGraceTime
{
  return self->_defaultGraceTime;
}

- (id)debugDescription
{
  return -[SignpostSupportGraceTimeOverrideEntry debugDescriptionWithWhitespacePrefix:](self, "debugDescriptionWithWhitespacePrefix:", &stru_1E4610268);
}

- (id)debugDescriptionWithWhitespacePrefix:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  v5 = -[SignpostSupportGraceTimeOverrideEntry entryLevel](self, "entryLevel");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_1E4600F98[v5];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("  "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportGraceTimeOverrideEntry overrides](self, "overrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__SignpostSupportGraceTimeOverrideEntry_debugDescriptionWithWhitespacePrefix___block_invoke;
  v17[3] = &unk_1E4600F50;
  v10 = v7;
  v18 = v10;
  v11 = v8;
  v19 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v17);

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("{")))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("None"));
    v12 = v10;
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@}"), v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v12);
  }

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostSupportGraceTimeOverrideEntry defaultGraceTime](self, "defaultGraceTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@Grace Time Ms: %llu \n%@%@ overrides : %@"), v4, objc_msgSend(v14, "firstFrameGraceTimeMs"), v4, v6, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __78__SignpostSupportGraceTimeOverrideEntry_debugDescriptionWithWhitespacePrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("  "));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescriptionWithWhitespacePrefix:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("\n%@%@: \n%@"), v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", v10);
}

- (unint64_t)entryLevel
{
  return self->_entryLevel;
}

@end
