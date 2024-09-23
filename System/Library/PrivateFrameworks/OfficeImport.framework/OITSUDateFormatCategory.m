@implementation OITSUDateFormatCategory

- (OITSUDateFormatCategory)initWithInitialPattern:(id)a3 locale:(id)a4
{
  __CFString *v6;
  id v7;
  OITSUDateFormatCategory *v8;
  __CFDateFormatter *ADateFormatter;
  NSMutableArray *v10;
  NSMutableArray *entries;
  objc_super v13;

  v6 = (__CFString *)a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OITSUDateFormatCategory;
  v8 = -[OITSUDateFormatCategory init](&v13, sel_init);
  if (v8)
  {
    ADateFormatter = p_createADateFormatter(v7);
    v8->_initialFormatter = ADateFormatter;
    CFDateFormatterSetFormat(ADateFormatter, v6);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    entries = v8->_entries;
    v8->_entries = v10;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_initialFormatter);
  v3.receiver = self;
  v3.super_class = (Class)OITSUDateFormatCategory;
  -[OITSUDateFormatCategory dealloc](&v3, sel_dealloc);
}

- (id)initialPattern
{
  return (id)-[__CFString copy]((id)CFDateFormatterGetFormat(self->_initialFormatter), "copy");
}

- (id)formatStringsDictionary
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_entries;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v15 = 0;
        v15 = objc_msgSend(v10, "separator");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v15, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_msgSend(v10, "formatStrings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  v20[0] = CFSTR("keys");
  v20[1] = CFSTR("values");
  v21[0] = v3;
  v21[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)addSeparator:(unsigned __int16)a3 format:(id)a4 locale:(id)a5
{
  uint64_t v6;
  id v8;
  OITSUDateFormatCategoryEntry *v9;
  id v10;

  v6 = a3;
  v10 = a4;
  v8 = a5;
  -[OITSUDateFormatCategory entryForSeparator:](self, "entryForSeparator:", v6);
  v9 = (OITSUDateFormatCategoryEntry *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[OITSUDateFormatCategoryEntry initWithSeparator:]([OITSUDateFormatCategoryEntry alloc], "initWithSeparator:", v6);
    -[NSMutableArray addObject:](self->_entries, "addObject:", v9);
  }
  -[OITSUDateFormatCategoryEntry addFormat:locale:](v9, "addFormat:locale:", v10, v8);

}

- (id)entryForSeparator:(unsigned __int16)a3
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = -[NSMutableArray count](self->_entries, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_entries, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "separator") == v3)
        break;

      if (v6 == ++v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = 0;
  }
  return v8;
}

- (id)newDateFromString:(id)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(id *)a5 perfect:(BOOL *)a6
{
  _BOOL8 v8;
  __CFString *v10;
  CFIndex v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  void *v16;
  void *v17;
  CFRange v19;

  v8 = a4;
  v10 = (__CFString *)a3;
  v11 = -[__CFString length](v10, "length");
  v19.location = 0;
  v19.length = v11;
  v12 = 0;
  if (CFDateFormatterGetAbsoluteTimeFromString(self->_initialFormatter, v10, &v19, 0))
    v13 = v19.location == 0;
  else
    v13 = 0;
  if (v13 && v19.length >= 1)
  {
    if (v19.length >= v11)
      v15 = 0;
    else
      v15 = -[__CFString characterAtIndex:](v10, "characterAtIndex:", v19.length);
    -[OITSUDateFormatCategory entryForSeparator:](self, "entryForSeparator:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v12 = (void *)objc_msgSend(v16, "newDateFromString:forceAllowAMPM:successfulFormatString:perfect:", v10, v8, a5, a6);
    else
      v12 = 0;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
