@implementation WFTTSSpokenVariant

- (WFTTSSpokenVariant)initWithDisplayString:(id)a3 spokenString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFTTSSpokenVariant *v10;
  uint64_t v11;
  NSString *displayString;
  uint64_t v13;
  NSString *spokenString;
  WFTTSSpokenVariant *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTTSString.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayString"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTTSString.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spokenString"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFTTSSpokenVariant;
  v10 = -[WFTTSSpokenVariant init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    displayString = v10->_displayString;
    v10->_displayString = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    spokenString = v10->_spokenString;
    v10->_spokenString = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFTTSSpokenVariant displayString](self, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[WFTTSSpokenVariant spokenString](self, "spokenString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "spokenString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFTTSSpokenVariant;
  -[WFTTSSpokenVariant description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTTSSpokenVariant displayString](self, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTTSSpokenVariant spokenString](self, "spokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": show \"%@\", say \"%@\"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)spokenString
{
  return self->_spokenString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

+ (id)parseAnnotationString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  id v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0CB3900];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (objc_msgSend(v6, "scanString:intoString:", CFSTR("show:\"), 0))
  {
    v14 = 0;
    v10 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("\" say:\"), &v14);
    v7 = v14;
    if (v10 && objc_msgSend(v6, "scanString:intoString:", CFSTR("\" say:\"), 0))
    {
      v13 = 0;
      v11 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("\"), &v13);
      v8 = v13;
      if (v11
        && objc_msgSend(v6, "scanString:intoString:", CFSTR("\"), 0)
        && objc_msgSend(v6, "isAtEnd"))
      {
        v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisplayString:spokenString:", v7, v8);
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = 0;
  }
LABEL_10:

  return v9;
}

@end
