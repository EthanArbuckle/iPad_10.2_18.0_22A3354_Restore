@implementation CNVCardParsedDictionaryResultBuilder

+ (id)factory
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__CNVCardParsedDictionaryResultBuilder_factory__block_invoke;
  v3[3] = &__block_descriptor_40_e35____CNVCardParsedResultBuilder__8__0l;
  v3[4] = a1;
  +[CNVCardParsedResultBuilderFactory factoryWithBlock:](CNVCardParsedResultBuilderFactory, "factoryWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __47__CNVCardParsedDictionaryResultBuilder_factory__block_invoke(uint64_t a1)
{
  return objc_alloc_init(*(Class *)(a1 + 32));
}

- (CNVCardParsedDictionaryResultBuilder)init
{
  CNVCardParsedDictionaryResultBuilder *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionaryRep;
  CNVCardParsedDictionaryResultBuilder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNVCardParsedDictionaryResultBuilder;
  v2 = -[CNVCardParsedDictionaryResultBuilder init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionaryRep = v2->_dictionaryRep;
    v2->_dictionaryRep = v3;

    v5 = v2;
  }

  return v2;
}

- (id)build
{
  return (id)-[NSMutableDictionary copy](self->_dictionaryRep, "copy");
}

- (BOOL)canSetValueForProperty:(id)a3
{
  return 1;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  if (a3)
    -[NSMutableDictionary setObject:forKey:](self->_dictionaryRep, "setObject:forKey:", a3, a4);
  return a3 != 0;
}

- (BOOL)setValues:(id)a3 labels:(id)a4 isPrimaries:(id)a5 forProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CNVCardParsedDictionaryResultBuilder *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v21 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v15 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = CFSTR("value");
        v22[1] = CFSTR("label");
        v23[0] = v16;
        v23[1] = v17;
        v22[2] = CFSTR("isPrimary");
        v23[2] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

        ++v15;
      }
      while (v15 < objc_msgSend(v10, "count"));
    }
    -[NSMutableDictionary setObject:forKey:](v21->_dictionaryRep, "setObject:forKey:", v14, v13);

  }
  return 1;
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionaryRep, "objectForKey:", a3);
}

- (BOOL)setImageData:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionaryRep, "setObject:forKeyedSubscript:", a3, CFSTR("com.apple.image.thumbnail"));
  return 1;
}

- (void)setUnknownProperties:(id)a3
{
  NSMutableDictionary *dictionaryRep;
  id v4;

  dictionaryRep = self->_dictionaryRep;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](dictionaryRep, "setObject:forKey:", v4, CFSTR("_unknownProperties"));

}

- (id)validCountryCodes
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRep, 0);
}

@end
