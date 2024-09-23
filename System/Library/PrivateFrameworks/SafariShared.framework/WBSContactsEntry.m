@implementation WBSContactsEntry

- (WBSContactsEntry)initWithContact:(id)a3
{
  id v5;
  WBSContactsEntry *v6;
  WBSContactsEntry *v7;
  WBSContactsEntry *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSContactsEntry;
  v6 = -[WBSContactsEntry init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)isWBSProxyProperty:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D89D80]);
}

+ (BOOL)_isContactsProperty:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _isContactsProperty__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isContactsProperty__onceToken, &__block_literal_global_24);
  v5 = objc_msgSend((id)_isContactsProperty__contactsPropertySet, "containsObject:", v4);

  return v5;
}

void __40__WBSContactsEntry__isContactsProperty___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[12];

  v9[11] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0C96670];
  v9[0] = *MEMORY[0x1E0C967F0];
  v9[1] = v1;
  v2 = *MEMORY[0x1E0C966D0];
  v9[2] = *MEMORY[0x1E0C966A8];
  v9[3] = v2;
  v3 = *MEMORY[0x1E0C96758];
  v9[4] = *MEMORY[0x1E0C96740];
  v9[5] = v3;
  v4 = *MEMORY[0x1E0C96780];
  v9[6] = *MEMORY[0x1E0C966C0];
  v9[7] = v4;
  v5 = *MEMORY[0x1E0C967C0];
  v9[8] = *MEMORY[0x1E0C967B8];
  v9[9] = v5;
  v9[10] = *MEMORY[0x1E0C968A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_isContactsProperty__contactsPropertySet;
  _isContactsProperty__contactsPropertySet = v7;

}

+ (BOOL)_isContactsLabel:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _isContactsLabel__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isContactsLabel__onceToken, &__block_literal_global_2);
  v5 = objc_msgSend((id)_isContactsLabel__contactsLabelSet, "containsObject:", v4);

  return v5;
}

void __37__WBSContactsEntry__isContactsLabel___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[12];

  v9[11] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0C97068];
  v9[0] = *MEMORY[0x1E0C96FF8];
  v9[1] = v1;
  v2 = *MEMORY[0x1E0C97000];
  v9[2] = *MEMORY[0x1E0C97070];
  v9[3] = v2;
  v3 = *MEMORY[0x1E0C97058];
  v9[4] = *MEMORY[0x1E0C97028];
  v9[5] = v3;
  v4 = *MEMORY[0x1E0C97010];
  v9[6] = *MEMORY[0x1E0C97020];
  v9[7] = v4;
  v5 = *MEMORY[0x1E0C97030];
  v9[8] = *MEMORY[0x1E0C97050];
  v9[9] = v5;
  v9[10] = *MEMORY[0x1E0C97038];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_isContactsLabel__contactsLabelSet;
  _isContactsLabel__contactsLabelSet = v7;

}

+ (id)localizedWBSPropertyOrLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89D80]))
    {
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[WBSContactsHelper CNContactKeyFromWBSABKey:](WBSContactsHelper, "CNContactKeyFromWBSABKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        if (objc_msgSend(a1, "_isContactsProperty:", v6))
        {
          objc_msgSend(MEMORY[0x1E0C97200], "localizedStringForKey:", v6);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(a1, "_isContactsLabel:", v6))
        {
          objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v6);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = v6;
        }
        v5 = v7;
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fullName
{
  CNContact *contact;
  void *v3;

  contact = self->_contact;
  if (contact)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", contact, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)valueForWBSProxyProperty:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D89D80]))
  {
    -[WBSContactsEntry fullName](self, "fullName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)valueStringForWBSProperty:(id)a3 wbsComponent:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v12;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length")
    && -[WBSContactsEntry _numberOfValuesForWBSProperty:](self, "_numberOfValuesForWBSProperty:", v8) > a5)
  {
    if (objc_msgSend((id)objc_opt_class(), "isWBSProxyProperty:", v8))
    {
      -[WBSContactsEntry valueForWBSProxyProperty:](self, "valueForWBSProxyProperty:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNContact safari_valueForWBSABProperty:](self->_contact, "safari_valueForWBSABProperty:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_valueStringForValue:wbsProperty:wbsComponent:atIndex:", v12, v8, v9, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_valueStringForWBSComponent:(id)a3 inInstantMessageAddress:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  +[WBSContactsHelper CNContactKeyFromWBSABKey:](WBSContactsHelper, "CNContactKeyFromWBSABKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C968F8]))
  {
    objc_msgSend(v6, "service");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C96900]))
  {
    objc_msgSend(v6, "username");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[WBSContactsEntry _valueStringForWBSComponent:inInstantMessageAddress:].cold.1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
  v9 = 0;
LABEL_9:

  return v9;
}

+ (id)_valueStringForWBSComponent:(id)a3 inAddress:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  +[WBSContactsHelper CNContactKeyFromWBSABKey:](WBSContactsHelper, "CNContactKeyFromWBSABKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C970C8]))
  {
    objc_msgSend(v6, "street");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v9 = (void *)v8;
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C97098]))
  {
    objc_msgSend(v6, "city");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C970C0]))
  {
    objc_msgSend(v6, "state");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C970A0]))
  {
    objc_msgSend(v6, "country");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C970B0]))
  {
    objc_msgSend(v6, "postalCode");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C970A8]))
  {
    objc_msgSend(v6, "ISOCountryCode");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[WBSContactsEntry _valueStringForWBSComponent:inAddress:].cold.1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
  v9 = 0;
LABEL_14:

  return v9;
}

+ (BOOL)_isValueAStringForContactsProperty:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966C0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96780]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967B8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96758]);
  }

  return v4;
}

+ (id)_valueStringForValue:(id)a3 wbsProperty:(id)a4 wbsComponent:(id)a5 atIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectAtIndex:", a6);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v13;
  }
  objc_msgSend(a1, "_valueStringForValue:wbsProperty:wbsComponent:", v12, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_valueStringForValue:(id)a3 wbsProperty:(id)a4 wbsComponent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[WBSContactsHelper CNContactKeyFromWBSABKey:](WBSContactsHelper, "CNContactKeyFromWBSABKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    v12 = v8;
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_valueStringForWBSComponent:inAddress:", v10, v13);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0C973B0];
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromPostalAddress:style:", v13, 0);
    }
LABEL_4:
    v14 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v14;
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  if (objc_msgSend(a1, "_isValueAStringForContactsProperty:", v11))
  {
    v15 = v8;
LABEL_7:
    v18 = v15;
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C96670]))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v16, "setLocalizedDateFormatFromTemplate:", CFSTR("dMy"));
    objc_msgSend(v16, "stringFromDate:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    objc_msgSend(v8, "value");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C966A8])
    || objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C968A0]))
  {
    objc_msgSend(v8, "value");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C96740]))
  {
    v12 = v8;
    v20 = objc_msgSend(v10, "length");
    objc_msgSend(v12, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    if (v20)
      objc_msgSend(a1, "_valueStringForWBSComponent:inInstantMessageAddress:", v10, v21);
    else
      objc_msgSend(v21, "username");
    goto LABEL_4;
  }
  v22 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    +[WBSContactsEntry _valueStringForValue:wbsProperty:wbsComponent:].cold.1((uint64_t)v9, v22, v23, v24, v25, v26, v27, v28);
  v18 = 0;
LABEL_13:

  return v18;
}

- (unint64_t)_numberOfValuesForWBSProperty:(id)a3
{
  return -[WBSContactsEntry _numberOfValuesForWBSProperty:andContact:](self, "_numberOfValuesForWBSProperty:andContact:", a3, self->_contact);
}

- (unint64_t)_numberOfValuesForWBSProperty:(id)a3 andContact:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isWBSProxyProperty:", v5) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "safari_valueForWBSABProperty:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = objc_msgSend(v8, "count");
        else
          v7 = 1;
      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (void)_valueStringForWBSComponent:(uint64_t)a3 inInstantMessageAddress:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Instant Message Address component is not supported: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_valueStringForWBSComponent:(uint64_t)a3 inAddress:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Address component is not supported: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_valueStringForValue:(uint64_t)a3 wbsProperty:(uint64_t)a4 wbsComponent:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Failed to find value for %@ property in Contacts", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
