@implementation WFINSpeakableStringContentItem

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D14128];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Speakable String"), CFSTR("Speakable String"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Speakable Strings"), CFSTR("Speakable Strings"));
}

- (INSpeakableString)speakableString
{
  return (INSpeakableString *)-[WFINSpeakableStringContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() != a3)
    return 0;
  v7 = (void *)MEMORY[0x1E0D14018];
  -[WFINSpeakableStringContentItem speakableString](self, "speakableString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spokenPhrase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
