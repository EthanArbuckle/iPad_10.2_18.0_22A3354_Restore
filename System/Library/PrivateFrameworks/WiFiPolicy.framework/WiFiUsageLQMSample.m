@implementation WiFiUsageLQMSample

- (id)numberForKeyPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[WiFiUsageLQMSample valueForKeyPath:](self, "valueForKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "unsignedLongValue") == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
    else
      v5 = v4;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)subtract:(int64_t)a3 From:(int64_t)a4
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a4 - a3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)objc_opt_class(), "allLQMProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@:%@,"), v9, v10, (_QWORD)v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)isPerSecond:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)WiFiUsageLQMFieldNameToRoundMethod;
  v4 = a3;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@PerSecond"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (id)asDictionaryInto:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    v4 = (id)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend((id)objc_opt_class(), "allLQMProperties");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = CFSTR("perCoreRssiInUse");
    do
    {
      v9 = 0;
      v25 = v6;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

        if (objc_msgSend((id)objc_opt_class(), "isPerSecond:", v10))
        {
          v12 = v7;
          v13 = v8;
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v17 = v16;
          -[WiFiUsageLQMSample numberForKeyPath:](self, "numberForKeyPath:", CFSTR("duration"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "numberWithLong:", (uint64_t)(v17 / (double)objc_msgSend(v18, "integerValue")));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@PerSecond"), v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v20);

          v8 = v13;
          v7 = v12;
          v6 = v25;

        }
        if (objc_msgSend(v10, "isEqualToString:", v8))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "unsignedIntValue");

          +[WiFiUsagePrivacyFilter getLabelForCoreRssiMode:](WiFiUsagePrivacyFilter, "getLabelForCoreRssiMode:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v10);

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)allLQMProperties
{
  void *v3;
  objc_property_t *v4;
  unint64_t i;
  const char *Attributes;
  const char *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  unsigned int outCount;

  outCount = 0;
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()))
  {
    while (1)
    {
      v4 = class_copyPropertyList((Class)a1, &outCount);
      if (outCount)
        break;
      a1 = (id)objc_msgSend(a1, "superclass");
      if (v4)
        goto LABEL_12;
LABEL_13:
      if ((objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
        goto LABEL_14;
    }
    for (i = 0; i < outCount; ++i)
    {
      Attributes = property_getAttributes(v4[i]);
      if (!Attributes)
        goto LABEL_8;
      v7 = Attributes;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Attributes);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("T@"));

      if ((v9 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("T#"));

        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("T:"));

          if ((v13 & 1) == 0)
          {
LABEL_8:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", property_getName(v4[i]), objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v14);

          }
        }
      }
    }
    a1 = (id)objc_msgSend(a1, "superclass");
LABEL_12:
    free(v4);
    goto LABEL_13;
  }
LABEL_14:
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;

  v2 = objc_opt_new();
  v3 = (void *)WiFiUsageLQMFieldNameToFeatureMethod;
  WiFiUsageLQMFieldNameToFeatureMethod = v2;

  defaultForPercentages = 2;
  v20 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 11);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 11);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 12);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v20, "initWithObjectsAndKeys:", v97, CFSTR("rssi"), v85, CFSTR("noise"), v94, CFSTR("snr"), v96, CFSTR("selfCca"), v95, CFSTR("otherCca"), v93, CFSTR("interference"), v82, CFSTR("totalReportedCca"), v91, CFSTR("decodingAttemptsPerSecond"), v90,
         CFSTR("rxStartOverDecodingAttemptsPercentage"),
         v92,
         CFSTR("rxCrsGlitchOverDecodingAttemptsPercentage"),
         v88,
         CFSTR("rxBadPlcpOverDecodingAttemptsPercentage"),
         v87,
         CFSTR("ofdmDesense"),
         v89,
         CFSTR("bPhyDesense"),
         v86,
         CFSTR("txLatencyP95"),
         v84,
         CFSTR("rxDecodingErrorsOverRxStart"),
         v72,
         CFSTR("rxUcastOverRxStart"),
         v83,
         CFSTR("rxBeaconOverRxStart"),
         v64,
         CFSTR("rxAnyErrOverDecodingErrors"),
         v81,
         CFSTR("rxBadFCSOverDecodingErrors"),
         v80,
         CFSTR("rxFifo0OvflOverDecodingErrors"),
         v56,
         CFSTR("rxFifo1OvflOverDecodingErrors"),
         v79,
         CFSTR("rxFrmTooLongOverDecodingErrors"),
         v78,
         CFSTR("rxFrmTooShrtOverDecodingErrors"),
         v77,
         CFSTR("rxNoDelimOverDecodingErrors"),
         v76,
         CFSTR("rxResponseTimeoutOverDecodingErrors"),
         v75,
         CFSTR("rxUcastCtrlPercentage"),
         v74,
         CFSTR("rxUcastMgmtPercentage"),
         v19,
         CFSTR("rxUcastDataPercentage"),
         v73,
         CFSTR("rxBACKOverRxCtrlFrmsPercentage"),
         v71,
         CFSTR("rxUcastACKOverRxCtrlFrmsPercentage"),
         v70);
  v10 = (void *)WiFiUsageLQMFieldNameToRoundMethod;
  WiFiUsageLQMFieldNameToRoundMethod = v9;

}

+ (id)binLabelfromFieldName:(id)a3 value:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;

  v5 = a3;
  objc_msgSend((id)WiFiUsageLQMFieldNameToRoundMethod, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7)
    goto LABEL_5;
  if ((objc_msgSend(v5, "hasSuffix:", CFSTR("Perc")) & 1) != 0
    || objc_msgSend(v5, "hasSuffix:", CFSTR("Percentage")))
  {
    v7 = defaultForPercentages;
LABEL_5:
    switch(v7)
    {
      case 0:
        break;
      case 1:
        v10 = a4;
        v11 = 0;
        goto LABEL_22;
      case 2:
        v12 = a4;
        v13 = 0;
        goto LABEL_24;
      case 3:
        v14 = a4;
        v15 = 0;
        goto LABEL_26;
      case 4:
        v16 = a4;
        v17 = 0;
        goto LABEL_28;
      case 5:
        v18 = a4;
        v19 = 0;
        goto LABEL_30;
      case 6:
        v20 = a4;
        v21 = 0;
        goto LABEL_32;
      case 7:
        v22 = a4;
        v23 = 0;
        goto LABEL_34;
      case 8:
        v24 = a4;
        v25 = 0;
        goto LABEL_36;
      case 9:
        v26 = a4;
        v27 = 0;
        goto LABEL_38;
      case 10:
        v28 = a4;
        v29 = 0;
        goto LABEL_40;
      case 11:
        v30 = a4;
        v31 = 0;
        goto LABEL_42;
      case 12:
        v32 = a4;
        v33 = 0;
        goto LABEL_44;
      case 13:
        v34 = a4;
        v35 = 0;
        goto LABEL_46;
      case 14:
        v10 = a4;
        v11 = 2;
LABEL_22:
        +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", v10, v11);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 15:
        v12 = a4;
        v13 = 2;
LABEL_24:
        +[WiFiUsageLQMTransformations getBinEvery10thOverRatioScale:As:](WiFiUsageLQMTransformations, "getBinEvery10thOverRatioScale:As:", v12, v13);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 16:
        v14 = a4;
        v15 = 2;
LABEL_26:
        +[WiFiUsageLQMTransformations getBinRssi:As:](WiFiUsageLQMTransformations, "getBinRssi:As:", v14, v15);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 17:
        v16 = a4;
        v17 = 2;
LABEL_28:
        +[WiFiUsageLQMTransformations getBinNoise:As:](WiFiUsageLQMTransformations, "getBinNoise:As:", v16, v17);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 18:
        v18 = a4;
        v19 = 2;
LABEL_30:
        +[WiFiUsageLQMTransformations getBinSnr:As:](WiFiUsageLQMTransformations, "getBinSnr:As:", v18, v19);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 19:
        v20 = a4;
        v21 = 2;
LABEL_32:
        +[WiFiUsageLQMTransformations getBinDecodingAttempts:As:](WiFiUsageLQMTransformations, "getBinDecodingAttempts:As:", v20, v21);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 20:
        v22 = a4;
        v23 = 2;
LABEL_34:
        +[WiFiUsageLQMTransformations getBinBytesPerFrame:As:](WiFiUsageLQMTransformations, "getBinBytesPerFrame:As:", v22, v23);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 21:
        v24 = a4;
        v25 = 2;
LABEL_36:
        +[WiFiUsageLQMTransformations getBinBytesPerPacket:As:](WiFiUsageLQMTransformations, "getBinBytesPerPacket:As:", v24, v25);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 22:
        v26 = a4;
        v27 = 2;
LABEL_38:
        +[WiFiUsageLQMTransformations getBinFrames:As:](WiFiUsageLQMTransformations, "getBinFrames:As:", v26, v27);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 23:
        v28 = a4;
        v29 = 2;
LABEL_40:
        +[WiFiUsageLQMTransformations getBinRetries:As:](WiFiUsageLQMTransformations, "getBinRetries:As:", v28, v29);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 24:
        v30 = a4;
        v31 = 2;
LABEL_42:
        +[WiFiUsageLQMTransformations getBinMpduDensity:As:](WiFiUsageLQMTransformations, "getBinMpduDensity:As:", v30, v31);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 25:
        v32 = a4;
        v33 = 2;
LABEL_44:
        +[WiFiUsageLQMTransformations getBinQueuedAmpdu:As:](WiFiUsageLQMTransformations, "getBinQueuedAmpdu:As:", v32, v33);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 26:
        v34 = a4;
        v35 = 2;
LABEL_46:
        +[WiFiUsageLQMTransformations getBinDesense:As:](WiFiUsageLQMTransformations, "getBinDesense:As:", v34, v35);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 27:
        +[WiFiUsageLQMTransformations getLabelTrafficState:](WiFiUsageLQMTransformations, "getLabelTrafficState:", a4);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      default:
        v9 = 0;
        goto LABEL_49;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_48:
  v9 = (void *)v8;
LABEL_49:

  return v9;
}

+ (id)featureFromFieldName:(id)a3
{
  return CFSTR("median");
}

@end
