@implementation OITSUDateFormatCategoryEntry

- (OITSUDateFormatCategoryEntry)initWithSeparator:(unsigned __int16)a3
{
  OITSUDateFormatCategoryEntry *v4;
  OITSUDateFormatCategoryEntry *v5;
  NSMutableArray *v6;
  NSMutableArray *formatters;
  NSMutableSet *v8;
  NSMutableSet *formatStrings;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OITSUDateFormatCategoryEntry;
  v4 = -[OITSUDateFormatCategoryEntry init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_separator = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    formatters = v5->_formatters;
    v5->_formatters = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    formatStrings = v5->_formatStrings;
    v5->_formatStrings = v8;

  }
  return v5;
}

- (unsigned)separator
{
  return self->_separator;
}

- (id)formatStrings
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_formatters, "count"))
  {
    v4 = 0;
    do
    {
      CFDateFormatterGetFormat((CFDateFormatterRef)-[NSMutableArray objectAtIndex:](self->_formatters, "objectAtIndex:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_formatters, "count"));
  }
  return v3;
}

- (void)addFormat:(id)a3 locale:(id)a4
{
  id v6;
  __CFDateFormatter *ADateFormatter;
  __CFString *formatString;

  formatString = (__CFString *)a3;
  v6 = a4;
  if ((-[NSMutableSet containsObject:](self->_formatStrings, "containsObject:", formatString) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_formatStrings, "addObject:", formatString);
    ADateFormatter = p_createADateFormatter(v6);
    CFDateFormatterSetFormat(ADateFormatter, formatString);
    -[NSMutableArray addObject:](self->_formatters, "addObject:", ADateFormatter);

  }
}

- (id)newDateFromString:(id)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(id *)a5 perfect:(BOOL *)a6
{
  __CFString *v9;
  CFIndex v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  unint64_t v14;
  __CFDateFormatter *v15;
  CFDateRef v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFDate *v21;
  __CFString *StringWithDate;
  const __CFDate *v23;
  id v24;
  id v26;
  const __CFDate *v27;
  const __CFDate *v28;
  const __CFDate *v29;
  void *v31;
  BOOL *v32;
  const __CFDate *v33;
  unint64_t v34;
  OITSUDateFormatCategoryEntry *v35;
  _BOOL4 v36;
  CFRange rangep;

  v36 = a4;
  v9 = (__CFString *)a3;
  v10 = -[__CFString length](v9, "length");
  v35 = self;
  v11 = -[NSMutableArray count](self->_formatters, "count");
  v32 = a6;
  *a6 = 0;
  v34 = v11;
  if (!v11)
  {
    v27 = 0;
    v26 = 0;
    v16 = 0;
    goto LABEL_34;
  }
  v33 = 0;
  v31 = 0;
  v12 = (const __CFString *)*MEMORY[0x24BDBD2B8];
  v13 = (const __CFString *)*MEMORY[0x24BDBD2E8];
  v14 = 1;
  do
  {
    v15 = (__CFDateFormatter *)-[NSMutableArray objectAtIndex:](v35->_formatters, "objectAtIndex:", v14 - 1, v31);
    rangep.location = 0;
    rangep.length = v10;
    v16 = CFDateFormatterCreateDateFromString(0, v15, v9, &rangep);
    if (v16)
      v17 = 1;
    else
      v17 = !v36;
    if (!v17)
    {
      v18 = (void *)CFDateFormatterCopyProperty(v15, v12);
      v19 = (void *)CFDateFormatterCopyProperty(v15, v13);
      CFDateFormatterSetProperty(v15, v12, CFSTR("AM"));
      CFDateFormatterSetProperty(v15, v13, CFSTR("PM"));
      rangep.location = 0;
      rangep.length = v10;
      v16 = CFDateFormatterCreateDateFromString(0, v15, v9, &rangep);
      CFDateFormatterSetProperty(v15, v12, v18);
      CFDateFormatterSetProperty(v15, v13, v19);

    }
    if (v16)
    {
      CFDateFormatterGetFormat(v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (const __CFDate *)(id)TSUCreateDateWithGregorianUnitsSetToDefaultValue(v16, v20);

      if (a5)
        *a5 = objc_retainAutorelease(v20);
      StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v15, v21);
      if (!-[__CFString compare:options:](v9, "compare:options:", StringWithDate, 1))
      {
        *v32 = 1;
        v16 = v21;
LABEL_23:

        goto LABEL_24;
      }
      v23 = v33;
      if (!v33 && !rangep.location)
      {
        if (rangep.length == v10)
        {
          if (!a5)
          {
            v16 = 0;
            v33 = v21;
            goto LABEL_23;
          }
          v24 = *a5;

          v33 = v21;
          v31 = v24;
LABEL_20:
          v16 = 0;
          *a5 = 0;
          goto LABEL_23;
        }
        v23 = 0;
      }
      v33 = v23;

      if (!a5)
      {
        v16 = 0;
        goto LABEL_23;
      }
      goto LABEL_20;
    }
LABEL_24:
    if (v16)
      break;
  }
  while (v14++ < v34);
  if (v16)
  {
    v26 = v31;
    v27 = v33;
  }
  else
  {
    v26 = v31;
    v27 = v33;
    if (v33)
    {
      v28 = v33;
      if (a5)
      {
        v27 = v28;
        v26 = objc_retainAutorelease(v31);
        *a5 = v26;
        v16 = v27;
      }
      else
      {
        v16 = v28;
        v27 = v28;
      }
    }
  }
LABEL_34:
  v29 = v16;

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStrings, 0);
  objc_storeStrong((id *)&self->_formatters, 0);
}

@end
