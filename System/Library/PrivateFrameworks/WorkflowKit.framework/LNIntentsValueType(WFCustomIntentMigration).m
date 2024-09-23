@implementation LNIntentsValueType(WFCustomIntentMigration)

- (id)wf_titleWithCustomIntentSerializedRepresentation:()WFCustomIntentMigration
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "typeIdentifier");
  if (v5 == 14)
  {
    WFINCurrencyAmountFromSerialization(v4, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43DF8]), "initWithKey:table:bundleURL:", v9, 0, 0);
    else
      v7 = 0;

    goto LABEL_12;
  }
  if (v5 == 13)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43DF8]), "initWithKey:table:bundleURL:", v6, 0, 0);
    else
      v7 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

@end
