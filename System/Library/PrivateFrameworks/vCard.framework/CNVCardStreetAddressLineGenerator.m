@implementation CNVCardStreetAddressLineGenerator

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("postOfficeBox"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v12, &stru_1E95708D8);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extendedStreet"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v13, &stru_1E95708D8);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("street"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v14, &stru_1E95708D8);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("city"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v15, &stru_1E95708D8);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("state"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v16, &stru_1E95708D8);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("postalCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v17, &stru_1E95708D8);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("country"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_addObject:orPlaceholder:", v18, &stru_1E95708D8);

  v24.receiver = self;
  v24.super_class = (Class)CNVCardStreetAddressLineGenerator;
  -[CNVCardLineGenerator lineWithValue:label:](&v24, sel_lineWithValue_label_, v11, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ISOCountryCode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardStreetAddressLineGenerator addGroupedLineWithName:value:toLine:](self, "addGroupedLineWithName:value:toLine:", CFSTR("X-ABADR"), v20, v19);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subLocality"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardStreetAddressLineGenerator addGroupedLineWithName:value:toLine:](self, "addGroupedLineWithName:value:toLine:", CFSTR("X-APPLE-SUBLOCALITY"), v21, v19);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subAdministrativeArea"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardStreetAddressLineGenerator addGroupedLineWithName:value:toLine:](self, "addGroupedLineWithName:value:toLine:", CFSTR("X-APPLE-SUBADMINISTRATIVEAREA"), v22, v19);

  return v19;
}

- (void)addGroupedLineWithName:(id)a3 value:(id)a4 toLine:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    -[CNVCardLineFactory stringLineWithName:value:](self->super._lineFactory, "stringLineWithName:value:", v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGroupedLine:withCounter:", v10, self->super._groupingCount);

  }
}

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  return -[CNVCardLineFactory arrayLineWithName:value:](self->super._lineFactory, "arrayLineWithName:value:", a3, a4);
}

- (id)standardLabelsForLabel:(id)a3
{
  id v3;
  const __CFString **v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Work>!$_")))
  {
    v9 = CFSTR("WORK");
    v4 = &v9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
  {
    v8 = CFSTR("HOME");
    v4 = &v8;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Other>!$_")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v7 = CFSTR("OTHER");
    v4 = &v7;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1, v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v5;
}

@end
