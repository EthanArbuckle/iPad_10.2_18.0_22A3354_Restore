@implementation SCRCWebDateTimeParser

+ (SCRCWebDateTimeParser)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  return (SCRCWebDateTimeParser *)(id)sharedInstance_Parser;
}

void __39__SCRCWebDateTimeParser_sharedInstance__block_invoke()
{
  SCRCWebDateTimeParser *v0;
  void *v1;

  v0 = objc_alloc_init(SCRCWebDateTimeParser);
  v1 = (void *)sharedInstance_Parser;
  sharedInstance_Parser = (uint64_t)v0;

}

- (SCRCWebDateTimeParser)init
{
  SCRCWebDateTimeParser *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *expressions;
  NSMutableDictionary *v5;
  NSMutableDictionary *dateFormats;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCRCWebDateTimeParser;
  v2 = -[SCRCWebDateTimeParser init](&v8, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  expressions = v2->_expressions;
  v2->_expressions = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  dateFormats = v2->_dateFormats;
  v2->_dateFormats = v5;

  return v2;
}

- (id)_cachedDateFormatterForFormat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dateFormats, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v6 = (void *)MEMORY[0x24BDD1500];
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v4, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setDateFormat:", v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dateFormats, "setObject:forKeyedSubscript:", v5, v4);

  }
  return v5;
}

- (id)_expressionForRule:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_t v9;
  void *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_expressions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v4, 1, &v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v7)
    {
      v8 = SCRParserLog;
      if (!SCRParserLog)
      {
        v9 = os_log_create("com.apple.Accessibility", "SCRCParser");
        v10 = (void *)SCRParserLog;
        SCRParserLog = (uint64_t)v9;

        v8 = SCRParserLog;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_210FEB000, v8, OS_LOG_TYPE_INFO, "Could not create rule: %@ %@", buf, 0x16u);
      }
    }
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_expressions, "setObject:forKeyedSubscript:", v6, v4);
      v11 = v6;
    }

  }
  return v6;
}

- (id)_handleDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("P")))
  {
    -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("([\\d]+[DHMS])"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v24 = v6;
      v25 = v5;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        v11 = 0.0;
        while (1)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v13 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "range", v24, v25, (_QWORD)v26);
            objc_msgSend(v4, "substringWithRange:", v13, v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "hasSuffix:", CFSTR("S")))
            {
              objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("S"), &stru_24CB26880);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "integerValue");
LABEL_17:
              v11 = v11 + (double)v17;

              goto LABEL_18;
            }
            if (objc_msgSend(v15, "hasSuffix:", CFSTR("M")))
            {
              objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("H"), &stru_24CB26880);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = 60 * objc_msgSend(v16, "integerValue");
              goto LABEL_17;
            }
            if (objc_msgSend(v15, "hasSuffix:", CFSTR("H")))
            {
              objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("H"), &stru_24CB26880);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "integerValue");
              v19 = 3600;
LABEL_16:
              v17 = v18 * v19;
              goto LABEL_17;
            }
            if (objc_msgSend(v15, "hasSuffix:", CFSTR("D")))
            {
              objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("D"), &stru_24CB26880);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "integerValue");
              v19 = 86400;
              goto LABEL_16;
            }
LABEL_18:

            ++v12;
          }
          while (v9 != v12);
          v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          v9 = v20;
          if (!v20)
            goto LABEL_26;
        }
      }
      v11 = 0.0;
LABEL_26:

      if ((*(_QWORD *)&v11 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        v21 = 0;
      }
      else
      {
        v22 = (void *)objc_opt_new();
        objc_msgSend(v22, "setZeroFormattingBehavior:", 1);
        objc_msgSend(v22, "setUnitsStyle:", 4);
        objc_msgSend(v22, "setAllowedUnits:", 240);
        objc_msgSend(v22, "stringFromTimeInterval:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v6 = v24;
      v5 = v25;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_handleTimes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;

  v4 = a3;
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{2}:[\\d]{2})$"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
    goto LABEL_3;
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{2}:[\\d]{2})([+-])([\\d]{2}:[\\d]{2})$"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  v10 = 0;
  v6 = v8;
  v5 = v7;
  if (v9 == 1)
  {
LABEL_3:
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeAtIndex:", 1);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v43 = 0;
      v44 = 0;
    }
    else
    {
      objc_msgSend(v4, "substringWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v16, "integerValue");

      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v18, "integerValue");

    }
    if ((unint64_t)objc_msgSend(v11, "numberOfRanges") < 3
      || objc_msgSend(v11, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = 0;
    }
    else
    {
      v20 = objc_msgSend(v11, "rangeAtIndex:", 2);
      objc_msgSend(v4, "substringWithRange:", v20, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45 = v5;
    if ((unint64_t)objc_msgSend(v11, "numberOfRanges") < 4
      || objc_msgSend(v11, "rangeAtIndex:", 3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
    }
    else
    {
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("-")))
        v25 = -1;
      else
        v25 = 1;
      v26 = objc_msgSend(v11, "rangeAtIndex:", 3);
      objc_msgSend(v4, "substringWithRange:", v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(":"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v30, "integerValue");

      objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(":"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "integerValue");

      v23 = 3600 * v25 * v42;
      v24 = 60 * v25 * v33;

      v22 = v28 != 0;
    }
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar", v42);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && v22)
    {
      v35 = objc_alloc(MEMORY[0x24BDBCE48]);
      v36 = objc_msgSend(v35, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);

      -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", CFSTR("jjmmazzz"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", v24 + v23);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setTimeZone:", v38);
      v34 = (void *)v36;
    }
    else
    {
      -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", CFSTR("jjmma"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
    }
    v39 = (void *)objc_opt_new();
    objc_msgSend(v39, "setHour:", v44);
    objc_msgSend(v39, "setTimeZone:", v38);
    objc_msgSend(v39, "setMinute:", v43);
    objc_msgSend(v34, "dateFromComponents:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringFromDate:", v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v45;
  }

  return v10;
}

- (id)_handleDatesAndTimes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v61;
  uint64_t v62;
  const __CFString *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{4})$"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", CFSTR("yyyy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setYear:", objc_msgSend(v4, "integerValue"));
LABEL_3:
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{4})[-]([\\d]{2})$"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numberOfRanges");

    if (v15 == 3)
    {
      -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", CFSTR("MMMMyyyy"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rangeAtIndex:", 1);
      objc_msgSend(v4, "substringWithRange:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setYear:", objc_msgSend(v19, "integerValue"));

      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "rangeAtIndex:", 2);
      objc_msgSend(v4, "substringWithRange:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMonth:", objc_msgSend(v23, "integerValue"));

LABEL_16:
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateFromComponents:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v13;
      v6 = v12;
      goto LABEL_17;
    }
  }
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{4})[-]([\\d]{2})[-]([\\d]{2})$"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "numberOfRanges");

    if (v25 == 4)
    {
      -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", CFSTR("MMMMdyyyy"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "rangeAtIndex:", 1);
      objc_msgSend(v4, "substringWithRange:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setYear:", objc_msgSend(v29, "integerValue"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "rangeAtIndex:", 2);
      objc_msgSend(v4, "substringWithRange:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMonth:", objc_msgSend(v33, "integerValue"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "rangeAtIndex:", 3);
      objc_msgSend(v4, "substringWithRange:", v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDay:", objc_msgSend(v37, "integerValue"));

      goto LABEL_3;
    }
  }
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{2})[-]([\\d]{2})$"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v39, "count") == 1)
  {
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "numberOfRanges");

    if (v41 == 3)
    {
      -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", CFSTR("MMMMd"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "rangeAtIndex:", 1);
      objc_msgSend(v4, "substringWithRange:", v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMonth:", objc_msgSend(v45, "integerValue"));

      objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "rangeAtIndex:", 2);
      objc_msgSend(v4, "substringWithRange:", v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDay:", objc_msgSend(v49, "integerValue"));

      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateFromComponents:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v39;
      v6 = v38;
      goto LABEL_17;
    }
  }
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{4})[-][W]([\\d]{2})$"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "firstObject");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "numberOfRanges");

    if (v51 == 3)
    {
      -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", CFSTR("MMMMdyyyy"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "rangeAtIndex:", 1);
      objc_msgSend(v4, "substringWithRange:", v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setYear:", objc_msgSend(v55, "integerValue"));

      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "rangeAtIndex:", 2);
      objc_msgSend(v4, "substringWithRange:", v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWeekOfYear:", objc_msgSend(v59, "integerValue"));

      objc_msgSend(v5, "setWeekday:", 1);
      goto LABEL_16;
    }
  }
  -[SCRCWebDateTimeParser _expressionForRule:](self, "_expressionForRule:", CFSTR("^([\\d]{4})[-]([\\d]{2})[-]([\\d]{2})([T]|\\s{1})([\\d]{2}):([\\d]{2})(:([\\d]{2})(\\.[\\d]+)?)?$"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") != 1
    || (objc_msgSend(v7, "firstObject"),
        v61 = (void *)objc_claimAutoreleasedReturnValue(),
        v62 = objc_msgSend(v61, "numberOfRanges"),
        v61,
        v62 != 10))
  {
    v11 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "rangeAtIndex:", 7) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v63 = CFSTR("MMMMdyyyyjjmm");
  }
  else if (objc_msgSend(v9, "rangeAtIndex:", 9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v63 = CFSTR("MMMMdyyyyjjmmss");
  }
  else
  {
    v63 = CFSTR("MMMMdyyyyjjmmssSSS");
  }
  -[SCRCWebDateTimeParser _cachedDateFormatterForFormat:](self, "_cachedDateFormatterForFormat:", v63);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "rangeAtIndex:", 1);
  objc_msgSend(v4, "substringWithRange:", v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setYear:", objc_msgSend(v67, "integerValue"));

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "rangeAtIndex:", 2);
  objc_msgSend(v4, "substringWithRange:", v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMonth:", objc_msgSend(v71, "integerValue"));

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "rangeAtIndex:", 3);
  objc_msgSend(v4, "substringWithRange:", v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDay:", objc_msgSend(v75, "integerValue"));

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "rangeAtIndex:", 5);
  objc_msgSend(v4, "substringWithRange:", v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHour:", objc_msgSend(v79, "integerValue"));

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "rangeAtIndex:", 6);
  objc_msgSend(v4, "substringWithRange:", v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinute:", objc_msgSend(v83, "integerValue"));

  if (objc_msgSend(v9, "rangeAtIndex:", 7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "rangeAtIndex:", 8);
    objc_msgSend(v4, "substringWithRange:", v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecond:", objc_msgSend(v87, "integerValue"));

    if (objc_msgSend(v9, "rangeAtIndex:", 9) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "rangeAtIndex:", 9);
      objc_msgSend(v4, "substringWithRange:", v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v91, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_24CB26880);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "rangeAtIndex:", 9);
      objc_msgSend(v5, "setNanosecond:", (uint64_t)(1000000000.0 / __exp10((double)(unint64_t)(v94 - 1)) * (double)objc_msgSend(v92, "integerValue")));

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:", v5);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v95);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

  return v11;
}

- (id)spokenStringForDateTimeAttribute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  if (v4)
  {
    -[SCRCWebDateTimeParser _handleDuration:](self, "_handleDuration:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {
      -[SCRCWebDateTimeParser _handleTimes:](self, "_handleTimes:", v4);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    if (!objc_msgSend(v5, "length"))
    {
      -[SCRCWebDateTimeParser _handleDatesAndTimes:](self, "_handleDatesAndTimes:", v4);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormats, 0);
  objc_storeStrong((id *)&self->_expressions, 0);
}

@end
