@implementation WiFiUsageLQMTriggerCriteria

- (NSDate)firstTriggered
{
  return self->_firstTriggered;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setMatched:(BOOL)a3
{
  self->_matched = a3;
}

- (void)setBssid:(id)a3
{
  objc_storeStrong((id *)&self->_bssid, a3);
}

- (NSDate)lastTriggered
{
  return self->_lastTriggered;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSPredicate)requiredFieldsValid
{
  return self->_requiredFieldsValid;
}

- (void)setCurrentSample:(id)a3
{
  objc_storeStrong((id *)&self->_currentSample, a3);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSDate)currentSample
{
  return self->_currentSample;
}

+ (void)initialize
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  objc_msgSend((id)_dateFormatter, "setDateFormat:", CFSTR("HH:mm:ss"));
}

+ (NSArray)dataTriggeredTypes
{
  return (NSArray *)&unk_1E8863FE0;
}

- (WiFiUsageLQMTriggerCriteria)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WiFiUsageLQMTriggerCriteria *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  const __CFString *v33;
  void *v34;
  NSPredicate *v35;
  WiFiUsageLQMTriggerCriteria *v36;
  void *v37;
  void *v38;
  NSPredicate *predicate;
  NSPredicate *v40;
  NSPredicate *requiredFieldsValid;
  NSPredicate *v42;
  NSDate *firstTriggered;
  NSDate *lastTriggered;
  NSDate *currentSample;
  NSString *bssid;
  NSPredicate *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  void *v54;
  objc_super v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v51 = a4;
  v52 = a5;
  v54 = v7;
  objc_msgSend(v7, "objectForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes](WiFiUsageLQMTriggerCriteria, "dataTriggeredTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "indexOfObject:", v10);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v50 = (void *)objc_opt_new();
      v13 = (void *)objc_opt_class();
      objc_msgSend(v7, "objectForKey:", CFSTR("type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:", v7, v50, v52, v51, v14, 0);
      v49 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v49;
      if (!v49)
      {
        v12 = 0;
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:");
      v48 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v18 = (void *)objc_opt_new();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v19 = v50;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v61 != v21)
                objc_enumerationMutation(v19);
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ != nil"), *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v23);

            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
          }
          while (v20);
        }

        objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v50, "anyObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) == 0)
        {
          v35 = 0;
          goto LABEL_29;
        }
        v27 = (void *)objc_opt_new();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v28 = v50;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v57;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v57 != v30)
                objc_enumerationMutation(v28);
              v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
              if (objc_msgSend(v27, "length"))
                v33 = CFSTR(" OR ");
              else
                v33 = &stru_1E881F240;
              objc_msgSend(v32, "fieldName");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "appendFormat:", CFSTR("%@$x.fieldName == \"%@\"), v33, v34);

            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
          }
          while (v29);
        }

        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SUBQUERY(SELF, $x, $x.median != nil AND (%@)).@count == %lu"), v27, objc_msgSend(v28, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v18);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v35 = (NSPredicate *)v24;

LABEL_29:
      v55.receiver = self;
      v55.super_class = (Class)WiFiUsageLQMTriggerCriteria;
      v36 = -[WiFiUsageLQMTriggerCriteria init](&v55, sel_init);
      +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes](WiFiUsageLQMTriggerCriteria, "dataTriggeredTypes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKey:", CFSTR("type"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v36->_type = objc_msgSend(v37, "indexOfObject:", v38);

      predicate = v36->_predicate;
      v36->_predicate = v48;
      v40 = v48;

      requiredFieldsValid = v36->_requiredFieldsValid;
      v36->_requiredFieldsValid = v35;
      v42 = v35;

      v36->_matched = 0;
      firstTriggered = v36->_firstTriggered;
      v36->_firstTriggered = 0;

      lastTriggered = v36->_lastTriggered;
      v36->_lastTriggered = 0;

      currentSample = v36->_currentSample;
      v36->_currentSample = 0;

      bssid = v36->_bssid;
      v36->_bssid = 0;

      self = v36;
      v12 = self;
      v15 = (void *)v49;
      goto LABEL_30;
    }
  }
  NSLog(CFSTR("%s -  Failed to parse (Criteria does not contain key 'type' or 'type' is not supported): %@"), "-[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]", v7);
  NSLog(CFSTR("%s -  Failed to parse: %@"), "-[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]", v7);
  v12 = 0;
LABEL_31:

  return v12;
}

- (id)typeAsString
{
  void *v3;
  void *v4;

  +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes](WiFiUsageLQMTriggerCriteria, "dataTriggeredTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)shortPredicate
{
  void *v2;
  id v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;

  v2 = self;
  -[NSPredicate predicateFormat](self->_predicate, "predicateFormat");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB38E8];
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR("SUBQUERY(SELF, $x, $x.fieldName == \"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regularExpressionWithPattern:options:error:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_1E881F240);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB38E8];
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR("\" AND $x."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "regularExpressionWithPattern:options:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB38E8];
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR(").@count > 0"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "regularExpressionWithPattern:options:error:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v11, 0, 0, objc_msgSend(v11, "length"), &stru_1E881F240);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\w+)_(\\w+)"), 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), CFSTR("$2_$1"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "filterCriteria");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "filterCriteria");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR(" (where %@)"), v2);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &stru_1E881F240;
  }
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@%@"), v17, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {

  }
  return v22;
}

- (id)shortPredicateNoSpaces
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WiFiUsageLQMTriggerCriteria shortPredicate](self, "shortPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB38E8];
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regularExpressionWithPattern:options:error:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1E881F240);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateNoQuotes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "predicateFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB38E8];
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR("\"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regularExpressionWithPattern:options:error:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_1E881F240);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  NSString *bssid;
  void *v8;
  NSDate *firstTriggered;
  uint64_t v10;
  __CFString *v11;
  NSDate *lastTriggered;
  void *v13;
  _BOOL4 v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v19;
  _BOOL4 v20;
  void *v21;

  v3 = (void *)0x1E0CB3000;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageLQMTriggerCriteria shortPredicate](self, "shortPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  if (self->_valid)
  {
    if (self->_matched)
      v6 = CFSTR("True");
    else
      v6 = CFSTR("False");
  }
  else
  {
    v6 = CFSTR("N/A");
  }
  bssid = self->_bssid;
  v8 = (void *)MEMORY[0x1E0CB3940];
  firstTriggered = self->_firstTriggered;
  if (firstTriggered)
  {
    v20 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      objc_msgSend((id)_dateFormatter, "stringFromDate:", firstTriggered);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (uint64_t)self->_firstTriggered;
    }
    v19 = (void *)v10;
    objc_msgSend(v8, "stringWithFormat:", CFSTR("triggering since %@"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    v11 = &stru_1E881F240;
  }
  lastTriggered = self->_lastTriggered;
  if (lastTriggered)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      objc_msgSend((id)_dateFormatter, "stringFromDate:", lastTriggered);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = lastTriggered;
    }
    objc_msgSend(v13, "stringWithFormat:", CFSTR("until %@"), v3);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    v15 = &stru_1E881F240;
  }
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ on %@ matched:%@ %@"), v5, bssid, v6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (lastTriggered)
  if (v14)

  if (firstTriggered)
  if (v20)

  return v17;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  NSDate *firstTriggered;
  uint64_t v9;
  __CFString *v10;
  NSDate *lastTriggered;
  void *v12;
  _BOOL4 v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v18;
  _BOOL4 v19;

  v3 = (void *)0x1E0CB3000;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageLQMTriggerCriteria shortPredicate](self, "shortPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_valid)
  {
    if (self->_matched)
      v6 = CFSTR("True");
    else
      v6 = CFSTR("False");
  }
  else
  {
    v6 = CFSTR("N/A");
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  firstTriggered = self->_firstTriggered;
  if (firstTriggered)
  {
    v19 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      objc_msgSend((id)_dateFormatter, "stringFromDate:", firstTriggered);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (uint64_t)self->_firstTriggered;
    }
    v18 = (void *)v9;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("triggering since %@"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
    v10 = &stru_1E881F240;
  }
  lastTriggered = self->_lastTriggered;
  if (lastTriggered)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      objc_msgSend((id)_dateFormatter, "stringFromDate:", lastTriggered);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = lastTriggered;
    }
    objc_msgSend(v12, "stringWithFormat:", CFSTR("until %@"), v3);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v14 = &stru_1E881F240;
  }
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ on <redacted> matched:%@ %@"), v5, v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (lastTriggered)
  if (v13)

  if (firstTriggered)
  if (v19)

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setPredicate:", self->_predicate);
  objc_msgSend(v4, "setRequiredFieldsValid:", self->_requiredFieldsValid);
  objc_msgSend(v4, "setValid:", self->_valid);
  objc_msgSend(v4, "setMatched:", self->_matched);
  objc_msgSend(v4, "setFirstTriggered:", self->_firstTriggered);
  objc_msgSend(v4, "setLastTriggered:", self->_lastTriggered);
  objc_msgSend(v4, "setCurrentSample:", self->_currentSample);
  objc_msgSend(v4, "setBssid:", self->_bssid);
  objc_msgSend(v4, "setFilterCriteria:", self->_filterCriteria);
  return v4;
}

+ (id)parseCriteria:(id)a3 intoRequiredFields:(id)a4 andFeatures:(id)a5 forFields:(id)a6 withType:(id)a7 isFilter:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  WiFiUsageLQMFeature *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _BOOL4 v54;
  uint64_t v56;
  id v57;

  v8 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v57 = a6;
  v16 = (__CFString *)a7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AND"), CFSTR("&&"), CFSTR("OR"), CFSTR("||"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("NOT"), CFSTR("!"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("="), CFSTR("=="), CFSTR(">="), CFSTR("=>"), CFSTR("<="), CFSTR("=<"), CFSTR(">"), CFSTR("<"), CFSTR("!="), CFSTR("<>"), CFSTR("contains"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("test"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("test"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v8;
    if ((objc_msgSend(v18, "containsObject:", v21) & 1) == 0
      && !objc_msgSend(v17, "containsObject:", v21))
    {
      v30 = v14;
      if (objc_msgSend(v19, "containsObject:", v21)
        && (objc_msgSend(v13, "objectForKey:", CFSTR("field")),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            v33,
            v33))
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("threshold"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("field"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "hasSuffix:", CFSTR("PerSecond")))
        {
          objc_msgSend(v34, "substringToIndex:", objc_msgSend(v34, "length") - objc_msgSend(CFSTR("PerSecond"), "length"));
          v35 = objc_claimAutoreleasedReturnValue();

          v34 = (void *)v35;
        }
        if ((objc_msgSend(v57, "containsObject:", v34) & 1) != 0)
        {
          v53 = v15;
          v49 = v34;
          if (v54)
          {

            v16 = CFSTR("value");
          }
          v22 = v17;
          +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes](WiFiUsageLQMTriggerCriteria, "dataTriggeredTypes");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "indexOfObject:", v16);

          v23 = v19;
          if (!v37)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v47 = CFSTR("%@ %@ '%@'");
            else
              v47 = CFSTR("%@ %@ %@");
            v39 = v49;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v47, v49, v21, v51);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v53;
            if (v30)
              objc_msgSend(v30, "addObject:", v49);
            goto LABEL_43;
          }
          v15 = v53;
          if (v37 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SUBQUERY(SELF,$x,$x.fieldName == \"%@\" AND $x.median %@ %@).@count > 0"), v49, v21, v51);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = -[WiFiUsageLQMFeature initWithField:andPerSecond:]([WiFiUsageLQMFeature alloc], "initWithField:andPerSecond:", v49, +[WiFiUsageLQMSample isPerSecond:](WiFiUsageLQMSample, "isPerSecond:", v49));
            if (v53)
              objc_msgSend(v53, "addObject:", v38);
            if (v30)
              objc_msgSend(v30, "addObject:", v38);

            v39 = v49;
            goto LABEL_43;
          }
          NSLog(CFSTR("%s -  Failed to parse (Comparison criteria has wrong type): %@"), "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
          v45 = v49;
          v46 = v51;
        }
        else
        {
          v22 = v17;
          v23 = v19;
          NSLog(CFSTR("%s -  Failed to parse (Comparison criteria on non-existing field '%@'): %@"), "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v34, v13);
          v45 = v34;
          v46 = v51;
        }

      }
      else
      {
        v22 = v17;
        v23 = v19;
        NSLog(CFSTR("%s -  Failed to parse (Comparison criteria has wrong format): %@"), "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
      }
LABEL_47:
      v32 = 0;
      goto LABEL_48;
    }
    v22 = v17;
    v23 = v19;
    objc_msgSend(v13, "objectForKey:", CFSTR("conditions"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_11;
    v25 = (void *)v24;
    objc_msgSend(v13, "objectForKey:", CFSTR("conditions"));
    v52 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v15 = v52;
    if ((isKindOfClass & 1) == 0)
    {
LABEL_11:
      NSLog(CFSTR("%s -  Failed to parse (compound condition does not contain key 'conditions'): %@"), "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
      v32 = 0;
      v30 = v14;
LABEL_48:

      goto LABEL_49;
    }
    objc_msgSend(v13, "objectForKey:", CFSTR("conditions"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "containsObject:", v21))
    {
      if (objc_msgSend(v28, "count") == 1)
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v14;
        objc_msgSend(a1, "parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:", v29, v14, v52, v57, v16, v54);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v52;
        if (v31)
        {
          v51 = v28;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v21, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
      }
      else
      {
        NSLog(CFSTR("%s -  Failed to parse (Unary criteria %@ contains %lu conditions): %@"), "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v21, objc_msgSend(v28, "count"), v13);
        v30 = v14;
      }
LABEL_37:

      goto LABEL_47;
    }
    v51 = v28;
    v32 = 0;
    v30 = v14;
LABEL_28:
    if (!objc_msgSend(v22, "containsObject:", v21))
    {
LABEL_44:

      goto LABEL_48;
    }
    if (objc_msgSend(v51, "count") == 2)
    {
      objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v15;
      v42 = (void *)v40;
      objc_msgSend(a1, "parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:", v40, v30, v41, v57, v16, v54);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:", v43, v30, v52, v57, v16, v54);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50 && v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("( %@) %@(%@)"), v50, v21, v44);
        v56 = objc_claimAutoreleasedReturnValue();

        v39 = v50;
        v32 = (void *)v56;
        v15 = v52;
LABEL_43:

        goto LABEL_44;
      }

      v28 = v51;
      v15 = v52;
    }
    else
    {
      NSLog(CFSTR("%s - Failed to parse (Binary criteria %@ contains %lu conditions)"), "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v21, objc_msgSend(v51, "count"));

      v28 = v51;
    }
    goto LABEL_37;
  }
  v22 = v17;
  v23 = v19;
  NSLog(CFSTR("%s -  Failed to parse (criteria does not contain key 'test'): %@"), "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]", v13);
  v32 = 0;
  v30 = v14;
LABEL_49:

  return v32;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void)setRequiredFieldsValid:(id)a3
{
  objc_storeStrong((id *)&self->_requiredFieldsValid, a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (BOOL)matched
{
  return self->_matched;
}

- (void)setFirstTriggered:(id)a3
{
  objc_storeStrong((id *)&self->_firstTriggered, a3);
}

- (void)setLastTriggered:(id)a3
{
  objc_storeStrong((id *)&self->_lastTriggered, a3);
}

- (NSString)bssid
{
  return self->_bssid;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_filterCriteria, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_currentSample, 0);
  objc_storeStrong((id *)&self->_lastTriggered, 0);
  objc_storeStrong((id *)&self->_firstTriggered, 0);
  objc_storeStrong((id *)&self->_requiredFieldsValid, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
