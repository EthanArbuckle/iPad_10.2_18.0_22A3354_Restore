@implementation TIKeyboardShortcut

- (TIKeyboardShortcut)initWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4
{
  id v6;
  TIKeyboardShortcut *v7;
  uint64_t v8;
  NSString *keyEquivalent;
  NSString *displayStringOverride;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardShortcut;
  v7 = -[TIKeyboardShortcut init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    keyEquivalent = v7->_keyEquivalent;
    v7->_keyEquivalent = (NSString *)v8;

    displayStringOverride = v7->_displayStringOverride;
    v7->_modifierFlags = a4;
    v7->_displayStringOverride = 0;

  }
  return v7;
}

- (TIKeyboardShortcut)initWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4 displayStringOverride:(id)a5
{
  id v8;
  id v9;
  TIKeyboardShortcut *v10;
  uint64_t v11;
  NSString *keyEquivalent;
  uint64_t v13;
  NSString *displayStringOverride;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardShortcut;
  v10 = -[TIKeyboardShortcut init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    keyEquivalent = v10->_keyEquivalent;
    v10->_keyEquivalent = (NSString *)v11;

    v10->_modifierFlags = a4;
    v13 = objc_msgSend(v9, "copy");
    displayStringOverride = v10->_displayStringOverride;
    v10->_displayStringOverride = (NSString *)v13;

  }
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v13;
  int v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if ((-[TIKeyboardShortcut modifierFlags](self, "modifierFlags") & 0x40000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("⌃ "));
  if ((-[TIKeyboardShortcut modifierFlags](self, "modifierFlags") & 0x80000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("⌥ "));
  if ((-[TIKeyboardShortcut modifierFlags](self, "modifierFlags") & 0x20000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("⇧ "));
  if ((-[TIKeyboardShortcut modifierFlags](self, "modifierFlags") & 0x100000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("⌘ "));
  -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR(" "));

  if (v5)
  {
    v6 = CFSTR("space");
    goto LABEL_17;
  }
  -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("\t"));

  if (v8)
  {
    v6 = CFSTR("↹");
    goto LABEL_17;
  }
  -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("\n")))
  {

LABEL_16:
    v6 = CFSTR("⏎");
    goto LABEL_17;
  }
  -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("\r"));

  if (v11)
    goto LABEL_16;
  -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("\b"));

  if (!v14)
  {
    -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v15);

    return v3;
  }
  v6 = CFSTR("⌫");
LABEL_17:
  objc_msgSend(v3, "appendString:", v6);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortcutWithKeyEquivalent:modifierFlags:", v5, -[TIKeyboardShortcut modifierFlags](self, "modifierFlags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TIKeyboardShortcut *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (TIKeyboardShortcut *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TIKeyboardShortcut keyEquivalent](self, "keyEquivalent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardShortcut keyEquivalent](v4, "keyEquivalent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        v7 = -[TIKeyboardShortcut modifierFlags](self, "modifierFlags");
        v8 = v7 == -[TIKeyboardShortcut modifierFlags](v4, "modifierFlags");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_modifierFlags + -[NSString hash](self->_keyEquivalent, "hash");
}

- (NSString)keyEquivalent
{
  return self->_keyEquivalent;
}

- (void)setKeyEquivalent:(id)a3
{
  objc_storeStrong((id *)&self->_keyEquivalent, a3);
}

- (unint64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(unint64_t)a3
{
  self->_modifierFlags = a3;
}

- (NSString)displayStringOverride
{
  return self->_displayStringOverride;
}

- (void)setDisplayStringOverride:(id)a3
{
  objc_storeStrong((id *)&self->_displayStringOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStringOverride, 0);
  objc_storeStrong((id *)&self->_keyEquivalent, 0);
}

+ (id)shortcutWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKeyEquivalent:modifierFlags:", v6, a4);

  return v7;
}

+ (id)shortcutWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4 displayStringOverride:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKeyEquivalent:modifierFlags:displayStringOverride:", v9, a4, v8);

  return v10;
}

+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  TIGetKeyboardShortcutOverridesForKeyboardLayout(a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count")
    || (v8 = (void *)objc_opt_class(),
        objc_msgSend(v6, "keyEquivalent"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "findLocalizationForKeyboardShortcut:withModifiers:inApplicableOverrides:usingKeyboardType:", v9, objc_msgSend(v6, "modifierFlags"), v7, 0), v10 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    v11 = objc_alloc((Class)a1);
    objc_msgSend(v6, "keyEquivalent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithKeyEquivalent:modifierFlags:", v12, objc_msgSend(v6, "modifierFlags"));

  }
  return v10;
}

+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4 usingKeyboardType:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  TIGetKeyboardShortcutOverridesForKeyboardLayout(a4, v5 == 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count")
    || (v10 = (void *)objc_opt_class(),
        objc_msgSend(v8, "keyEquivalent"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "findLocalizationForKeyboardShortcut:withModifiers:inApplicableOverrides:usingKeyboardType:", v11, objc_msgSend(v8, "modifierFlags"), v9, v5), v12 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v12))
  {
    v13 = objc_alloc((Class)a1);
    objc_msgSend(v8, "keyEquivalent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithKeyEquivalent:modifierFlags:", v14, objc_msgSend(v8, "modifierFlags"));

  }
  return v12;
}

+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = a4;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isRTL"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v12 = objc_msgSend(v11, "BOOLValue") ^ 1;
    else
      v12 = 1;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (shouldOptOutForSelector___onceToken != -1)
      dispatch_once(&shouldOptOutForSelector___onceToken, &__block_literal_global_11657);
    v14 = objc_msgSend((id)shouldOptOutForSelector___knownSelectors, "containsObject:", v13);

    v15 = objc_msgSend(v8, "modifierFlags");
    v16 = v8;
    v17 = v16;
    if (((v12 | v14) & 1) == 0 && (v15 & 0x100000) != 0)
    {
      objc_msgSend(v16, "keyEquivalent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_ti_keyEquivalentMirroring");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = objc_msgSend(objc_alloc((Class)a1), "initWithKeyEquivalent:modifierFlags:", v19, objc_msgSend(v17, "modifierFlags"));

        v17 = (void *)v20;
      }

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("keyboardType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIKeyboardShortcut localizedKeyboardShortcut:forKeyboardLayout:usingKeyboardType:](TIKeyboardShortcut, "localizedKeyboardShortcut:forKeyboardLayout:usingKeyboardType:", v17, v10, objc_msgSend(v21, "unsignedIntValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = a4;
    +[TIKeyboardShortcut localizedKeyboardShortcut:forKeyboardLayout:](TIKeyboardShortcut, "localizedKeyboardShortcut:forKeyboardLayout:", v8, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

+ (id)findLocalizationForKeyboardShortcut:(id)a3 withModifiers:(unint64_t)a4 inApplicableOverrides:(id)a5 usingKeyboardType:(unsigned int)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = 0;
  if (v8 && a5)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = a5;
    objc_msgSend(v10, "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v14 = v13;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("key"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("display"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = 0;
LABEL_24:
      if (v16)
        v28 = v16;
      else
        v28 = v8;
      if (v23)
        v29 = v23;
      else
        v29 = v12;
      +[TIKeyboardShortcut shortcutWithKeyEquivalent:modifierFlags:displayStringOverride:](TIKeyboardShortcut, "shortcutWithKeyEquivalent:modifierFlags:displayStringOverride:", v28, objc_msgSend(v29, "unsignedIntegerValue"), v35);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    }
    v33 = v18;
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("key"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v19;

      v16 = v20;
    }
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("modifiers"), v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v21;
LABEL_17:
      v23 = v22;
LABEL_21:
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("display"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = v25;

        v35 = v27;
      }

      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = objc_msgSend(v21, "integerValue");
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "+[TIKeyboardShortcut findLocalizationForKeyboardShortcut:withModifiers:inApplicableOverrides:usingKeyboardType:]";
        v38 = 2112;
        v39 = v8;
        _os_log_fault_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: malformatted plist, modifier not convertible to number, key %@", buf, 0x16u);
      }
    }
    v23 = 0;
    goto LABEL_21;
  }
LABEL_32:

  return v9;
}

+ (BOOL)isMirroringCandidate:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
    v5 = objc_msgSend(v4, "_ti_isKeyEquivalentMirroringCandidate");
  else
    v5 = 0;

  return v5;
}

@end
