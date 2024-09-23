@implementation PKPaymentPreferenceCard

- (PKPaymentPreferenceCard)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferenceCard;
  return -[PKPaymentPreference initWithTitle:preferences:selectedIndex:readOnly:](&v7, sel_initWithTitle_preferences_selectedIndex_readOnly_, a3, a4, a5, a6);
}

- (BOOL)supportsDeletion
{
  return 0;
}

- (void)setErrors:(id)a3 forPreference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v16 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v6, "pass");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[PKPaymentPreference errors](self, "errors", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__PKPaymentPreferenceCard_setErrors_forPreference___block_invoke;
  v18[3] = &unk_1E2AC3358;
  v10 = v8;
  v19 = v10;
  objc_msgSend(v9, "keysOfEntriesPassingTest:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPreference errors](self, "errors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "setObject:forKey:", v17, v12);
  }
  else
  {
    objc_msgSend(v10, "serialNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, v15);

  }
}

uint64_t __51__PKPaymentPreferenceCard_setErrors_forPreference___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  return v5;
}

- (id)errorsForPreference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PKPaymentPreference errors](self, "errors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__PKPaymentPreferenceCard_errorsForPreference___block_invoke;
  v12[3] = &unk_1E2AC3358;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "keysOfEntriesPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKPaymentPreference errors](self, "errors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __47__PKPaymentPreferenceCard_errorsForPreference___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "pass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serialNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v3);

    v3 = v7;
  }
  else
  {
    objc_msgSend(v5, "serialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v3);
  }

  return v8;
}

- (BOOL)supportsNullSelection
{
  return self->_supportsNullSelection;
}

- (void)setSupportsNullSelection:(BOOL)a3
{
  self->_supportsNullSelection = a3;
}

@end
