@implementation OITSUCustomFormat

- (OITSUCustomFormat)initWithName:(id)a3 formatType:(int)a4 data:(id)a5 conditionList:(id)a6
{
  id v10;
  id v11;
  id v12;
  OITSUCustomFormat *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *formatName;
  uint64_t v20;
  OITSUCustomFormatData *defaultFormatData;
  void *v22;
  void *v23;
  objc_super v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)OITSUCustomFormat;
  v13 = -[OITSUCustomFormat init](&v25, sel_init);
  if (v13)
  {
    if ((a4 - 270) >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat initWithName:formatType:data:conditionList:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 234, 0, "Creating a custom format without a correct custom format type.");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat initWithName:formatType:data:conditionList:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 235, 0, "invalid nil value for '%{public}s'", "customFormatData");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    v18 = objc_msgSend(v10, "copy");
    formatName = v13->_formatName;
    v13->_formatName = (NSString *)v18;

    v13->_formatType = a4;
    v20 = objc_msgSend(v11, "copy");
    defaultFormatData = v13->_defaultFormatData;
    v13->_defaultFormatData = (OITSUCustomFormatData *)v20;

    -[OITSUCustomFormatData setIsConditional:](v13->_defaultFormatData, "setIsConditional:", 0);
    if (v12)
    {
      if (a4 != 270)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat initWithName:formatType:data:conditionList:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 244, 0, "Conditions are only allowed for number custom formats.");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      objc_storeStrong((id *)&v13->_conditionList, a6);
    }
  }

  return v13;
}

- (OITSUCustomFormat)initWithName:(id)a3 formatType:(int)a4 data:(id)a5
{
  return -[OITSUCustomFormat initWithName:formatType:data:conditionList:](self, "initWithName:formatType:data:conditionList:", a3, *(_QWORD *)&a4, a5, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  OITSUMutableCustomFormat *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  OITSUMutableCustomFormat *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = +[OITSUMutableCustomFormat allocWithZone:](OITSUMutableCustomFormat, "allocWithZone:", a3);
  -[OITSUCustomFormat formatName](self, "formatName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OITSUCustomFormat formatType](self, "formatType");
  -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OITSUCustomFormat initWithName:formatType:data:](v4, "initWithName:formatType:data:", v5, v6, v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[OITSUCustomFormat conditionList](self, "conditionList", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "conditionType");
        objc_msgSend(v14, "conditionValue");
        v17 = v16;
        objc_msgSend(v14, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[OITSUCustomFormat p_addConditionOfType:value:data:](v8, "p_addConditionOfType:value:data:", v15, v18, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

- (OITSUCustomFormat)customFormatWithNewName:(id)a3
{
  id v4;
  OITSUCustomFormat *v5;
  uint64_t v6;
  void *v7;
  OITSUCustomFormat *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [OITSUCustomFormat alloc];
  v6 = -[OITSUCustomFormat formatType](self, "formatType");
  -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OITSUCustomFormat initWithName:formatType:data:](v5, "initWithName:formatType:data:", v4, v6, v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[OITSUCustomFormat conditionList](self, "conditionList", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "conditionType");
        objc_msgSend(v14, "conditionValue");
        v17 = v16;
        objc_msgSend(v14, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[OITSUCustomFormat p_addConditionOfType:value:data:](v8, "p_addConditionOfType:value:data:", v15, v18, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

- (unint64_t)conditionCount
{
  void *v2;
  unint64_t v3;

  -[OITSUCustomFormat conditionList](self, "conditionList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)p_addConditionOfType:(int)a3 value:(double)a4 data:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *conditionList;
  void *v16;
  OITSUCustomFormatCondition *v17;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  if (-[OITSUCustomFormat formatType](self, "formatType") != 270)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat p_addConditionOfType:value:data:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 284, 0, "Adding conditions is only allowed for Custom Numbers.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat p_addConditionOfType:value:data:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 285, 0, "invalid nil value for '%{public}s'", "data");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[OITSUCustomFormat conditionList](self, "conditionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    conditionList = self->_conditionList;
    self->_conditionList = v14;

  }
  v17 = -[OITSUCustomFormatCondition initWithType:value:data:]([OITSUCustomFormatCondition alloc], "initWithType:value:data:", v6, v8, a4);

  -[OITSUCustomFormat conditionList](self, "conditionList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[OITSUCustomFormat formatType](self, "formatType");

  return v6;
}

- (void)p_makeFormatNameStemAndTag
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *formatNameStem;
  NSString *v9;
  void *v10;
  NSString *v11;
  NSString *formatNameTag;
  id v13;

  -[OITSUCustomFormat formatName](self, "formatName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OITSUCustomFormat formatName](self, "formatName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSULocale currentLocale](OITSULocale, "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    TSUNumberFormatterExtractBaseStemFromString(v4, v6, &v13);
    v7 = (NSString *)v13;

    formatNameStem = self->_formatNameStem;
    self->_formatNameStem = v7;
    v9 = v7;

    -[OITSUCustomFormat formatName](self, "formatName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringFromIndex:", -[NSString length](v9, "length"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    formatNameTag = self->_formatNameTag;
    self->_formatNameTag = v11;

  }
}

- (NSString)formatNameStem
{
  NSString *formatNameStem;

  formatNameStem = self->_formatNameStem;
  if (!formatNameStem)
  {
    -[OITSUCustomFormat p_makeFormatNameStemAndTag](self, "p_makeFormatNameStemAndTag");
    formatNameStem = self->_formatNameStem;
  }
  return formatNameStem;
}

- (NSString)formatNameTag
{
  NSString *formatNameTag;

  formatNameTag = self->_formatNameTag;
  if (!formatNameTag)
  {
    -[OITSUCustomFormat p_makeFormatNameStemAndTag](self, "p_makeFormatNameStemAndTag");
    formatNameTag = self->_formatNameTag;
  }
  return formatNameTag;
}

- (BOOL)p_isEqual:(id)a3 matchingFullName:(BOOL)a4
{
  _BOOL4 v4;
  OITSUCustomFormat *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a4;
  v6 = (OITSUCustomFormat *)a3;
  if (self != v6)
  {
    v7 = objc_opt_class();
    TSUDynamicCast(v7, (uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_20;
    v9 = -[OITSUCustomFormat formatType](self, "formatType");
    if (v9 != objc_msgSend(v8, "formatType"))
      goto LABEL_20;
    -[OITSUCustomFormat conditionList](self, "conditionList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(v8, "conditionList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 != v13)
      goto LABEL_20;
    if (v4)
    {
      objc_msgSend(v8, "formatName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[OITSUCustomFormat formatName](self, "formatName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v16 & 1) == 0)
        goto LABEL_20;
    }
    else
    {
      -[OITSUCustomFormat formatNameStem](self, "formatNameStem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "formatNameStem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_20;
    }
    -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultFormatData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (v23)
    {
      -[OITSUCustomFormat conditionList](self, "conditionList");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (!v25)
      {
        v17 = 1;
        goto LABEL_21;
      }
      v26 = 0;
      while (1)
      {
        -[OITSUCustomFormat conditionList](self, "conditionList");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndex:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "conditionList");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndex:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          if (v30)
            goto LABEL_15;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat p_isEqual:matchingFullName:]");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 366, 0, "invalid nil value for '%{public}s'", "thisCondition");

          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
          if (v30)
            goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat p_isEqual:matchingFullName:]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 367, 0, "invalid nil value for '%{public}s'", "otherCondition");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_15:
        v17 = objc_msgSend(v28, "isEqual:", v30);

        if ((v17 & 1) != 0)
        {
          ++v26;
          -[OITSUCustomFormat conditionList](self, "conditionList");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

          if (v26 < v32)
            continue;
        }
        goto LABEL_21;
      }
    }
LABEL_20:
    v17 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v17 = 1;
LABEL_22:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  return -[OITSUCustomFormat p_isEqual:matchingFullName:](self, "p_isEqual:matchingFullName:", a3, 1);
}

- (BOOL)isEqualWithStemNameMatching:(id)a3
{
  return -[OITSUCustomFormat p_isEqual:matchingFullName:](self, "p_isEqual:matchingFullName:", a3, 0);
}

- (id)conditionalFormatDataForValue:(double)a3
{
  return -[OITSUCustomFormat conditionalFormatDataForValue:outKey:](self, "conditionalFormatDataForValue:outKey:", 0, a3);
}

- (id)conditionalFormatDataForValue:(double)a3 outKey:(unint64_t *)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;

  if (-[OITSUCustomFormat formatType](self, "formatType") == 270)
  {
    v7 = -[OITSUCustomFormat conditionCount](self, "conditionCount");
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      while (2)
      {
        -[OITSUCustomFormat conditionList](self, "conditionList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "conditionValue");
        v13 = v12;
        switch(objc_msgSend(v11, "conditionType"))
        {
          case 0u:
            if (vabdd_f64(a3, v13) >= 1.0e-14)
              goto LABEL_13;
            goto LABEL_15;
          case 1u:
            if (v13 > a3)
              goto LABEL_15;
            goto LABEL_13;
          case 2u:
            if (v13 >= a3)
              goto LABEL_15;
            goto LABEL_13;
          case 3u:
            if (v13 >= a3)
              goto LABEL_13;
            goto LABEL_15;
          case 4u:
            if (v13 > a3)
              goto LABEL_13;
LABEL_15:
            objc_msgSend(v11, "data");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
              goto LABEL_16;
            v17 = v9 + 1;
            if (!a4)
              return v16;
            goto LABEL_18;
          default:
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormat conditionalFormatDataForValue:outKey:]");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 424, 0, "Unexpected condition type in conditional number format!");

            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_13:

LABEL_16:
            if (v8 == ++v9)
              break;
            continue;
        }
        break;
      }
    }
  }
  -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a4)
LABEL_18:
    *a4 = v17;
  return v16;
}

- (id)conditionalFormatAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[OITSUCustomFormat conditionList](self, "conditionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)conditionalFormatDataForKey:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    -[OITSUCustomFormat conditionList](self, "conditionList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)currencyCode
{
  void *v3;
  unsigned __int16 v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  unsigned __int16 v10;
  int v11;
  NSString *v12;
  NSString *currencyCode;

  if (!self->_currencyCodeComputed)
  {
    -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "currencyCodeIndex");

    if (-[OITSUCustomFormat conditionCount](self, "conditionCount"))
    {
      v5 = 0;
      v6 = 0;
      while (1)
      {
        -[OITSUCustomFormat conditionalFormatAtIndex:](self, "conditionalFormatAtIndex:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "currencyCodeIndex");

        if (v4)
        {
          if (v9 && v9 != v4)
            break;
        }
        if (v9 == (unsigned __int16)v6)
          v10 = v9;
        else
          v10 = 0;
        if (v5 != 1)
          v10 = 0;
        if (v5)
        {
          v11 = v6;
        }
        else
        {
          v10 = 0;
          v11 = v9;
        }
        if (!v4)
        {
          v4 = v10;
          v6 = v11;
        }
        if (++v5 >= -[OITSUCustomFormat conditionCount](self, "conditionCount"))
          goto LABEL_20;
      }
      v4 = 0;
    }
LABEL_20:
    TSUCurrencyCodeForIndex(v4);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    currencyCode = self->_currencyCode;
    self->_currencyCode = v12;

    self->_currencyCodeComputed = 1;
  }
  return self->_currencyCode;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[OITSUCustomFormat formatName](self, "formatName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUCustomFormat defaultFormatData](self, "defaultFormatData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formatString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TSUCustomFormat:%@, %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)formatType
{
  return self->_formatType;
}

- (OITSUCustomFormatData)defaultFormatData
{
  return self->_defaultFormatData;
}

- (NSString)formatName
{
  return self->_formatName;
}

- (NSMutableArray)conditionList
{
  return self->_conditionList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionList, 0);
  objc_storeStrong((id *)&self->_formatName, 0);
  objc_storeStrong((id *)&self->_defaultFormatData, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_formatNameTag, 0);
  objc_storeStrong((id *)&self->_formatNameStem, 0);
}

@end
