@implementation PKPeerPaymentCounterpartHandleFormatter

+ (id)displayNameForCounterpartHandle:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "formatCounterpartHandle:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

+ (id)formatCounterpartHandle:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "hasPrefix:", CFSTR("+")))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pkFormattedStringValue");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

+ (id)requiredContactKeys
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C966A8];
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)redactedDisplayNameForCounterpartHandle:(id)a3 contact:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C97218]);
    objc_msgSend(v7, "setStyle:", 1000);
    objc_msgSend(v7, "stringFromContact:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(v6, "givenName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v6, "familyName");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      v8 = v12;
    }

  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "length"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v5);
    if (v13)
    {
      v14 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v13, "localPart");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      v17 = objc_msgSend(v5, "rangeOfString:", v16);
      v19 = v18;
      v20 = objc_msgSend(v16, "length");
      v21 = v20 - 2;
      if (v20 < 2)
        objc_msgSend(v16, "appendString:", CFSTR("***"), v21);
      else
        objc_msgSend(v16, "replaceCharactersInRange:withString:", 1, v21, CFSTR("***"));
      objc_msgSend(v14, "replaceCharactersInRange:withString:", v17, v19, v16);
      v22 = objc_msgSend(v14, "copy");

      v8 = (void *)v22;
    }

  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("***"));
      objc_msgSend(v23, "lastFourDigits");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendString:", v25);

      v26 = objc_msgSend(v24, "copy");
      v8 = (void *)v26;
    }

  }
  return v8;
}

@end
