@implementation CNVCardLineGenerator

+ (id)generatorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:groupingCount:", v6, a4);

  return v7;
}

+ (id)dateComponentsGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardDateComponentsLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)alternateDateComponentsGeneratorWithName:(id)a3 groupingcount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardAlternateDateComponentsLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)instantMessagingGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardInstantMessagingLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)legacyInstantMessagingGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardLegacyInstantMessagingLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)socialProfileGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardSocialProfileLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)emailGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardEmailLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)phoneGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardPhoneLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)streetAddressGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardStreetAddressLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

+ (id)activityAlertGeneratorWithName:(id)a3 groupingCount:(int64_t *)a4
{
  return +[CNVCardLineGenerator generatorWithName:groupingCount:](CNVCardActivityAlertLineGenerator, "generatorWithName:groupingCount:", a3, a4);
}

- (CNVCardLineGenerator)initWithName:(id)a3 groupingCount:(int64_t *)a4
{
  id v6;
  CNVCardLineGenerator *v7;
  uint64_t v8;
  NSString *lineName;
  uint64_t v10;
  CNVCardLineFactory *lineFactory;
  CNVCardLineGenerator *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNVCardLineGenerator;
  v7 = -[CNVCardLineGenerator init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    lineName = v7->_lineName;
    v7->_lineName = (NSString *)v8;

    v7->_groupingCount = a4;
    +[CNVCardLineFactory version30LineFactory](CNVCardLineFactory, "version30LineFactory");
    v10 = objc_claimAutoreleasedReturnValue();
    lineFactory = v7->_lineFactory;
    v7->_lineFactory = (CNVCardLineFactory *)v10;

    v12 = v7;
  }

  return v7;
}

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    -[CNVCardLineGenerator makeLineWithName:value:](self, "makeLineWithName:value:", self->_lineName, a3);
    a3 = (id)objc_claimAutoreleasedReturnValue();
    -[CNVCardLineGenerator standardLabelsForLabel:](self, "standardLabelsForLabel:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            -[CNVCardLineGenerator addStandardLabel:toLine:](self, "addStandardLabel:toLine:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), a3, (_QWORD)v14);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

    }
    else if (v6)
    {
      -[CNVCardLineGenerator addCustomLabel:toLine:](self, "addCustomLabel:toLine:", v6, a3);
    }

  }
  return a3;
}

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[CNVCardLineFactory stringLineWithName:value:](self->_lineFactory, "stringLineWithName:value:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)standardLabelsForLabel:(id)a3
{
  id v3;
  const __CFString **v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Work>!$_")))
  {
    v8[0] = CFSTR("WORK");
    v4 = (const __CFString **)v8;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v7 = CFSTR("HOME");
    v4 = &v7;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

- (void)addStandardLabel:(id)a3 toLine:(id)a4
{
  objc_msgSend(a4, "addParameterWithName:value:", CFSTR("type"), a3);
}

- (void)addCustomLabel:(id)a3 toLine:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6 && (objc_msgSend(v8, "isEqualToString:", &stru_1E95708D8) & 1) == 0)
  {
    -[CNVCardLineFactory stringLineWithName:value:](self->_lineFactory, "stringLineWithName:value:", CFSTR("X-ABLabel"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGroupedLine:withCounter:", v7, self->_groupingCount);

  }
}

- (void)addPrimaryValueMarkerToLine:(id)a3
{
  objc_msgSend(a3, "addParameterWithName:value:", CFSTR("type"), CFSTR("pref"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineFactory, 0);
  objc_storeStrong((id *)&self->_lineName, 0);
}

@end
