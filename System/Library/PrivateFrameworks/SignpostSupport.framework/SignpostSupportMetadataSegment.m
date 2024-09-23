@implementation SignpostSupportMetadataSegment

- (NSString)typeNamespace
{
  return self->_typeNamespace;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)stringPrefix
{
  return self->_stringPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_stringPrefix, 0);
  objc_storeStrong((id *)&self->_placeholderTokens, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_typeNamespace, 0);
}

- (BOOL)isGenerator
{
  return self->_isGenerator;
}

- (NSArray)placeholderTokens
{
  return self->_placeholderTokens;
}

- (SignpostSupportMessageArgument)argument
{
  return self->_argument;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4 didRedactOut:(BOOL *)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;

  v6 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportMetadataSegment argument](self, "argument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "argumentObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v15 = 0;
    goto LABEL_24;
  }
  -[SignpostSupportMetadataSegment argument](self, "argument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v7)
  {
    if (!v6)
    {
      objc_msgSend(v12, "argumentObject");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      v25 = (void *)MEMORY[0x1E0CB37E8];
      -[SignpostSupportMetadataSegment argument](self, "argument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "numberWithUnsignedChar:", objc_msgSend(v19, "privacyLevel"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("Arg");
      goto LABEL_22;
    }
    v18 = objc_msgSend(v12, "type");

    switch(v18)
    {
      case 1:
        -[SignpostSupportMetadataSegment argument](self, "argument");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "argumentObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (_stringPassesAllowlist_onceToken != -1)
          dispatch_once(&_stringPassesAllowlist_onceToken, &__block_literal_global_389);
        v22 = StringPassesSignpostReporterStringAllowlist(v21, (void *)_stringPassesAllowlist_platform);

        if (!v22)
        {
          v24 = 1;
          v16 = CFSTR("<redacted>");
          goto LABEL_20;
        }
        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v24 = 1;
        goto LABEL_20;
      case 3:
        break;
      default:
        v16 = 0;
LABEL_17:
        v24 = 0;
LABEL_20:
        *a5 = v24;
        goto LABEL_21;
    }
    -[SignpostSupportMetadataSegment argument](self, "argument");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "argumentObject");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v14 = objc_msgSend(v12, "type");

  if (v14 != 2)
  {
    -[SignpostSupportMetadataSegment argument](self, "argument");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "argumentObject");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v17 = CFSTR("Argument");
LABEL_22:

    goto LABEL_23;
  }
  v15 = 0;
  v16 = CFSTR("NSData arguments not supported");
  v17 = CFSTR("Argument");
LABEL_23:
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v17);

LABEL_24:
  -[SignpostSupportMetadataSegment typeNamespace](self, "typeNamespace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SignpostSupportMetadataSegment typeNamespace](self, "typeNamespace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v28 = CFSTR("TypeNamespace");
    else
      v28 = CFSTR("TypeName");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, v28);

  }
  -[SignpostSupportMetadataSegment type](self, "type");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[SignpostSupportMetadataSegment type](self, "type");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("Type"));

  }
  -[SignpostSupportMetadataSegment placeholderTokens](self, "placeholderTokens");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[SignpostSupportMetadataSegment placeholderTokens](self, "placeholderTokens");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("Tokens"));

  }
  -[SignpostSupportMetadataSegment stringPrefix](self, "stringPrefix");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SignpostSupportMetadataSegment stringPrefix](self, "stringPrefix");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, CFSTR("Prefix"));

  }
  if (v15)
  {
    if (v7)
      v35 = CFSTR("Privacy");
    else
      v35 = CFSTR("Priv");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v35);
  }

  return v9;
}

- (SignpostSupportMetadataSegment)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SignpostSupportMetadataSegment *v11;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Arg"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TypeName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Tokens"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Prefix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Priv"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[SignpostSupportMetadataSegment initWithArgumentObject:typeNamespace:type:tokens:stringPrefix:privacy:](self, "initWithArgumentObject:typeNamespace:type:tokens:stringPrefix:privacy:", v5, v6, v7, v8, v9, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (SignpostSupportMetadataSegment)initWithArgumentObject:(id)a3 typeNamespace:(id)a4 type:(id)a5 tokens:(id)a6 stringPrefix:(id)a7 privacy:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SignpostSupportMetadataSegment *v19;
  SignpostSupportMessageArgument *v20;
  SignpostSupportMessageArgument *argument;
  id v23;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v23 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SignpostSupportMetadataSegment;
  v19 = -[SignpostSupportMetadataSegment init](&v24, sel_init);
  if (v19)
  {
    v20 = -[SignpostSupportMessageArgument initWithArgumentObject:privacy:]([SignpostSupportMessageArgument alloc], "initWithArgumentObject:privacy:", v14, v18);
    argument = v19->_argument;
    v19->_argument = v20;

    objc_storeStrong((id *)&v19->_typeNamespace, a4);
    objc_storeStrong((id *)&v19->_type, a5);
    objc_storeStrong((id *)&v19->_placeholderTokens, a6);
    objc_storeStrong((id *)&v19->_stringPrefix, a7);
    if (objc_msgSend(CFSTR("signpost.generator"), "isEqualToString:", v15))
      v19->_isGenerator = 1;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SignpostSupportMetadataSegment *v5;
  SignpostSupportMetadataSegment *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;

  v5 = (SignpostSupportMetadataSegment *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SignpostSupportMetadataSegment argument](self, "argument");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[SignpostSupportMetadataSegment argument](v6, "argument"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SignpostSupportMetadataSegment argument](self, "argument");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostSupportMetadataSegment argument](v6, "argument");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v8 == v9)
        {

          if (v7)
            v15 = v7;
          else
            v15 = v3;

        }
        else
        {
          -[SignpostSupportMetadataSegment argument](self, "argument");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostSupportMetadataSegment argument](v6, "argument");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v7)
          {

            if (!v13)
              goto LABEL_53;
          }
          else
          {

            if ((v13 & 1) == 0)
              goto LABEL_53;
          }
        }
      }
      -[SignpostSupportMetadataSegment typeNamespace](self, "typeNamespace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16
        || (-[SignpostSupportMetadataSegment typeNamespace](v6, "typeNamespace"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SignpostSupportMetadataSegment typeNamespace](self, "typeNamespace");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostSupportMetadataSegment typeNamespace](v6, "typeNamespace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17 == v18)
        {

          if (v16)
            v23 = v16;
          else
            v23 = v3;

        }
        else
        {
          -[SignpostSupportMetadataSegment typeNamespace](self, "typeNamespace");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostSupportMetadataSegment typeNamespace](v6, "typeNamespace");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if (v16)
          {

            if (!v22)
              goto LABEL_53;
          }
          else
          {

            if ((v22 & 1) == 0)
              goto LABEL_53;
          }
        }
      }
      -[SignpostSupportMetadataSegment type](self, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24
        || (-[SignpostSupportMetadataSegment type](v6, "type"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SignpostSupportMetadataSegment type](self, "type");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostSupportMetadataSegment type](v6, "type");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v25 == v26)
        {

          if (v24)
            v31 = v24;
          else
            v31 = v3;

        }
        else
        {
          -[SignpostSupportMetadataSegment type](self, "type");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostSupportMetadataSegment type](v6, "type");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqual:", v29);

          if (v24)
          {

            if (!v30)
              goto LABEL_53;
          }
          else
          {

            if ((v30 & 1) == 0)
              goto LABEL_53;
          }
        }
      }
      -[SignpostSupportMetadataSegment stringPrefix](self, "stringPrefix");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        -[SignpostSupportMetadataSegment stringPrefix](v6, "stringPrefix");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
          goto LABEL_49;
      }
      -[SignpostSupportMetadataSegment stringPrefix](self, "stringPrefix");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostSupportMetadataSegment stringPrefix](v6, "stringPrefix");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v33 == v34)
      {

        if (v32)
          v39 = v32;
        else
          v39 = v3;

        goto LABEL_49;
      }
      -[SignpostSupportMetadataSegment stringPrefix](self, "stringPrefix");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostSupportMetadataSegment stringPrefix](v6, "stringPrefix");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (v32)
      {

        if (!v38)
          goto LABEL_53;
LABEL_49:
        -[SignpostSupportMetadataSegment placeholderTokens](self, "placeholderTokens");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostSupportMetadataSegment placeholderTokens](v6, "placeholderTokens");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v40;
        v43 = v41;
        v44 = v43;
        if (v42)
        {
          if (v42 == v43)
          {
            v14 = 1;
          }
          else if (v43)
          {
            v14 = objc_msgSend(v42, "isEqualToArray:", v43);
          }
          else
          {
            v14 = 0;
          }
        }
        else
        {
          v14 = v43 == 0;
        }

        goto LABEL_58;
      }

      if ((v38 & 1) != 0)
        goto LABEL_49;
LABEL_53:
      v14 = 0;
LABEL_58:

      goto LABEL_59;
    }
    v14 = 0;
  }
LABEL_59:

  return v14;
}

- (BOOL)matchesPlaceholderTokenKey:(id)a3 value:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@=%@"), v8, v7);

  LOBYTE(v8) = -[SignpostSupportMetadataSegment hasPlaceholderToken:](self, "hasPlaceholderToken:", v9);
  return (char)v8;
}

- (BOOL)hasPlaceholderToken:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SignpostSupportMetadataSegment placeholderTokens](self, "placeholderTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)placeholderTokensForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@="), v4);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SignpostSupportMetadataSegment placeholderTokens](self, "placeholderTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasPrefix:", v5))
          {
            objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v5, "length"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
      v14 = v6;
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
