@implementation CNVCardTesting

+ (id)parseCardWithBodyLine:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "parseCardWithBodyLines:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)parseCardWithBodyLines:(id)a3
{
  return (id)objc_msgSend(a1, "parseCardWithBodyLines:version:encoding:", a3, CFSTR("3.0"), 4);
}

+ (id)parseCardWithBodyLines:(id)a3 version:(id)a4 encoding:(unint64_t)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "cardDataWithBodyLines:version:encoding:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parseCardWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)parseCardWithData:(id)a3
{
  void *v3;
  void *v4;

  +[CNVCardDictionarySerialization dictionariesWithData:error:](CNVCardDictionarySerialization, "dictionariesWithData:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)parseCardWithData:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[CNVCardDictionarySerialization dictionariesWithData:options:error:](CNVCardDictionarySerialization, "dictionariesWithData:options:error:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cardDataWithBodyLines:(id)a3 version:(id)a4 encoding:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", CFSTR("BEGIN:VCARD\r\n"));
  objc_msgSend(v9, "appendFormat:", CFSTR("VERSION:%@\r\n"), v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "appendFormat:", CFSTR("%@\r\n"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "appendString:", CFSTR("END:VCARD\r\n"));
  objc_msgSend(v9, "dataUsingEncoding:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)resultWithProperty:(id)a3 value:(id)a4 label:(id)a5 isPrimary:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  _QWORD v17[2];

  v6 = a6;
  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v10 = a3;
  objc_msgSend(a1, "complexValueWithValue:label:isPrimary:", a4, a5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)complexValueWithValue:(id)a3 label:(id)a4 isPrimary:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v5 = a5;
  v15[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14[0] = CFSTR("value");
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v14[1] = CFSTR("label");
  v10 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  v14[2] = CFSTR("isPrimary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {

    if (v7)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v7)
    goto LABEL_9;
LABEL_7:

  return v12;
}

+ (id)unknownPropertyWithName:(id)a3 line:(id)a4
{
  id v5;
  id v6;
  CNVCardUnknownPropertyDescription *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CNVCardUnknownPropertyDescription);
  -[CNVCardUnknownPropertyDescription setPropertyName:](v7, "setPropertyName:", v6);

  -[CNVCardUnknownPropertyDescription setOriginalLine:](v7, "setOriginalLine:", v5);
  return v7;
}

+ (id)linesUsingAdapter:(id)a3
{
  return (id)objc_msgSend(a1, "linesUsingAdapter:options:", a3, 0);
}

+ (id)linesUsingAdapter:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardWriting stringWithPeople:options:error:](CNVCardWriting, "stringWithPeople:options:error:", v8, v6, 0, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\r\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)version30DataUsingAdapter:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardWriting dataWithPeople:options:error:](CNVCardWriting, "dataWithPeople:options:error:", v5, 0, 0, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)version21DataUsingAdapter:(id)a3
{
  id v3;
  CNVCardWritingOptions *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CNVCardWritingOptions);
  -[CNVCardWritingOptions setOutputVersion:](v4, "setOutputVersion:", 1);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardWriting dataWithPeople:options:error:](CNVCardWriting, "dataWithPeople:options:error:", v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)version30CardForPerson:(id)a3 containsLine:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "linesUsingAdapter:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "containsObject:", v6);

  return (char)a1;
}

+ (BOOL)version30CardForPerson:(id)a3 containsString:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardWriting stringWithPeople:options:error:](CNVCardWriting, "stringWithPeople:options:error:", v8, 0, 0, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v9, "containsString:", v6);
  return (char)v7;
}

+ (BOOL)version30DataUsingAdapter:(id)a3 containsData:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "version30DataUsingAdapter:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "_cn_containsData:", v6);

  return (char)a1;
}

+ (BOOL)version21DataUsingAdapter:(id)a3 containsData:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "version21DataUsingAdapter:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "_cn_containsData:", v6);

  return (char)a1;
}

+ (id)itemWithValue:(id)a3 label:(id)a4
{
  return +[CNVCardPropertyItem itemWithValue:label:identifier:](CNVCardPropertyItem, "itemWithValue:label:identifier:", a3, a4, 0);
}

+ (id)instantMessagingItemWithUsername:(id)a3 service:(id)a4 label:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("username");
  v15[1] = CFSTR("service");
  v16[0] = a3;
  v16[1] = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "itemWithValue:label:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)gregorianDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v8, "setYear:", a3);
  objc_msgSend(v8, "setMonth:", a4);
  objc_msgSend(v8, "setDay:", a5);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCalendar:", v9);

  return v8;
}

+ (id)chineseDateWithEra:(int64_t)a3 year:(int64_t)a4 month:(int64_t)a5 day:(int64_t)a6
{
  id v10;
  void *v11;

  v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v10, "setEra:", a3);
  objc_msgSend(v10, "setYear:", a4);
  objc_msgSend(v10, "setMonth:", a5);
  objc_msgSend(v10, "setDay:", a6);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996A0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCalendar:", v11);

  return v10;
}

+ (id)activityAlertResultWithTypes:(id)a3 sounds:(id)a4 vibrations:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    v12 = *MEMORY[0x1E0D13830];
    v23 = CFSTR("sound");
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v14);

      if (v15)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v23);

      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v17);

      if (v18)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("vibration"));

      }
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v20);

      ++v11;
    }
    while (v11 < objc_msgSend(v7, "count"));
  }
  v24 = CFSTR("ActivityAlert");
  v25[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
