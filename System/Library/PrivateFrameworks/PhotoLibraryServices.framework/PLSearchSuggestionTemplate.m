@implementation PLSearchSuggestionTemplate

- (PLSearchSuggestionTemplate)initWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  PLSearchSuggestionTemplate *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = a8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("todayDate"));

    a8 = v22;
  }
  if (v20)
  {
    if (a9)
    {
LABEL_5:
      self = (PLSearchSuggestionTemplate *)-[PLSearchSuggestionTemplate _initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](self, "_initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v17, a4, a5, a6, a7, a8, a9, v18, v19, v20);
      v21 = self;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = a8;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

    a8 = v29;
    if (a9)
      goto LABEL_5;
  }
  v30 = a8;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  PLServicesLocalizedFrameworkString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length") && !objc_msgSend(v25, "isEqualToString:", v17))
  {

    a8 = v30;
    goto LABEL_5;
  }
  PLSearchBackendInitialSuggestionsGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v17;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "Template for key %@ is not available in the current locale", buf, 0xCu);
  }

  v21 = 0;
LABEL_14:

  return v21;
}

- (id)_initWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12
{
  id v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  PLSearchSuggestionTemplate *v21;
  PLSearchSuggestionTemplate *v22;
  uint64_t v23;
  NSString *suggestionTemplateKey;
  void *v25;
  void *v26;
  uint64_t v27;
  NSCalendar *calendar;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v37;
  objc_super v38;

  v16 = a3;
  v17 = a10;
  v37 = a11;
  v18 = a12;
  if (!a4 && (a5 || !a8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondIndexCategory == PLSearchIndexCategoryNone && templateDateType != PLSearchSuggestionDateTemplateCategoryTypeNone"));

  }
  if (a5 | a4 | a8)
  {
    v19 = a4 != 0;
    if (a4 && a5 && a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("templateDateType == PLSearchSuggestionDateTemplateCategoryTypeNone"));

      objc_msgSend(v17, "length");
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstIndexCategory != PLSearchIndexCategoryNone || templateDateType != PLSearchSuggestionDateTemplateCategoryTypeNone"));

    v19 = a4 != 0;
  }
  v20 = objc_msgSend(v17, "length");
  if (!v19 && v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstIndexCategory != PLSearchIndexCategoryNone"));

  }
LABEL_11:
  v38.receiver = self;
  v38.super_class = (Class)PLSearchSuggestionTemplate;
  v21 = -[PLSearchSuggestionTemplate init](&v38, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_templateStyleType = a9;
    v23 = objc_msgSend(v16, "copy");
    suggestionTemplateKey = v22->_suggestionTemplateKey;
    v22->_suggestionTemplateKey = (NSString *)v23;

    v22->_firstIndexCategory = a4;
    v22->_secondIndexCategory = a5;
    v22->_templateDateType = a8;
    v22->_templateType = a6;
    v22->_templateContentType = a7;
    objc_storeStrong((id *)&v22->_identifier, a10);
    v22->_localeSupportType = +[PLSearchSuggestionTemplateProvider localeSupportTypeForTemplateWithKey:locale:](PLSearchSuggestionTemplateProvider, "localeSupportTypeForTemplateWithKey:locale:", v16, v18);
    v25 = (void *)MEMORY[0x1E0C99D48];
    objc_msgSend(v18, "calendarIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "calendarWithIdentifier:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    calendar = v22->_calendar;
    v22->_calendar = (NSCalendar *)v27;

    objc_storeStrong((id *)&v22->_todayDate, a11);
  }

  return v22;
}

- (PSIDateFilter)dateFilter
{
  PSIDateFilter *dateFilter;
  unint64_t v4;
  void *v5;
  void *v6;
  PSIDateFilter *v7;
  PSIDateFilter *v8;

  dateFilter = self->_dateFilter;
  if (!dateFilter)
  {
    v4 = -[PLSearchSuggestionTemplate templateDateType](self, "templateDateType");
    -[PLSearchSuggestionTemplate calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplate todayDate](self, "todayDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSearchSuggestionDateUtility dateFilterForSearchSuggestionTemplateDateType:calendar:relativeDate:](PLSearchSuggestionDateUtility, "dateFilterForSearchSuggestionTemplateDateType:calendar:relativeDate:", v4, v5, v6);
    v7 = (PSIDateFilter *)objc_claimAutoreleasedReturnValue();
    v8 = self->_dateFilter;
    self->_dateFilter = v7;

    dateFilter = self->_dateFilter;
  }
  return dateFilter;
}

- (BOOL)isMeTemplate
{
  return (-[PLSearchSuggestionTemplate templateType](self, "templateType") >> 4) & 1;
}

- (BOOL)isDateOnlyTemplate
{
  char v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;

  v3 = -[PLSearchSuggestionTemplate templateType](self, "templateType");
  v4 = -[PLSearchSuggestionTemplate templateType](self, "templateType") & 2 | v3 & 1;
  v5 = -[PLSearchSuggestionTemplate templateDateType](self, "templateDateType");
  if (v4)
    v6 = 1;
  else
    v6 = v5 == 0;
  return !v6;
}

- (BOOL)isEqual:(id)a3
{
  PLSearchSuggestionTemplate *v4;
  PLSearchSuggestionTemplate *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v4 = (PLSearchSuggestionTemplate *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PLSearchSuggestionTemplate suggestionTemplateKey](self, "suggestionTemplateKey");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplate suggestionTemplateKey](v5, "suggestionTemplateKey");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if ((v9 & 1) == 0)
          goto LABEL_16;
      }
      v11 = -[PLSearchSuggestionTemplate firstIndexCategory](self, "firstIndexCategory");
      if (v11 == -[PLSearchSuggestionTemplate firstIndexCategory](v5, "firstIndexCategory"))
      {
        v12 = -[PLSearchSuggestionTemplate secondIndexCategory](self, "secondIndexCategory");
        if (v12 == -[PLSearchSuggestionTemplate secondIndexCategory](v5, "secondIndexCategory"))
        {
          v13 = -[PLSearchSuggestionTemplate templateType](self, "templateType");
          if (v13 == -[PLSearchSuggestionTemplate templateType](v5, "templateType"))
          {
            v14 = -[PLSearchSuggestionTemplate templateContentType](self, "templateContentType");
            if (v14 == -[PLSearchSuggestionTemplate templateContentType](v5, "templateContentType"))
            {
              v15 = -[PLSearchSuggestionTemplate templateDateType](self, "templateDateType");
              if (v15 == -[PLSearchSuggestionTemplate templateDateType](v5, "templateDateType"))
              {
                -[PLSearchSuggestionTemplate identifier](self, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLSearchSuggestionTemplate identifier](v5, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16 == v17)
                  v10 = 1;
                else
                  v10 = objc_msgSend(v16, "isEqualToString:", v17);

                goto LABEL_17;
              }
            }
          }
        }
      }
LABEL_16:
      v10 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;

  -[PLSearchSuggestionTemplate suggestionTemplateKey](self, "suggestionTemplateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[PLSearchSuggestionTemplate firstIndexCategory](self, "firstIndexCategory");
  v6 = v5 ^ -[PLSearchSuggestionTemplate secondIndexCategory](self, "secondIndexCategory") ^ v4;
  v7 = -[PLSearchSuggestionTemplate templateType](self, "templateType");
  v8 = v7 ^ -[PLSearchSuggestionTemplate templateDateType](self, "templateDateType");
  -[PLSearchSuggestionTemplate identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[PLSearchSuggestionTemplate templateContentType](self, "templateContentType");
  -[PLSearchSuggestionTemplate dateFilter](self, "dateFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (id)description
{
  void *v3;
  unint64_t templateType;
  NSString *suggestionTemplateKey;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  PSIDateFilter *dateFilter;
  NSString *identifier;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  templateType = self->_templateType;
  suggestionTemplateKey = self->_suggestionTemplateKey;
  PLDebugStringForSearchIndexCategory(self->_firstIndexCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLDebugStringForSearchIndexCategory(self->_secondIndexCategory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_templateContentType - 1;
  if (v8 > 8)
    v9 = CFSTR("PLSearchSuggestionTemplateContentTypeNone");
  else
    v9 = off_1E3673A68[v8];
  v10 = self->_templateDateType - 1;
  if (v10 > 8)
    v11 = CFSTR("PLSearchSuggestionDateTemplateCategoryTypeNone");
  else
    v11 = off_1E36600C8[v10];
  v12 = v11;
  dateFilter = self->_dateFilter;
  identifier = self->_identifier;
  v15 = -[PLSearchSuggestionTemplate isMeTemplate](self, "isMeTemplate");
  v16 = CFSTR("NO");
  if (v15)
    v16 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Key: %@, templateType: %tu, firstCategory: %@, secondCategory: %@, contentType:%@, dateType: %@, date filter: %@, identifier: %@, isMeTemplate: %@"), suggestionTemplateKey, templateType, v6, v7, v9, v12, dateFilter, identifier, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (PLSearchSuggestionTemplate)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  PLSearchSuggestionTemplate *v20;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplatePropertyKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplateFirstIndexCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplateSecondIndexCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplateTemplateType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplateTemplateContentType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplateDateType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplateStyleType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionTemplateIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](self, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v4, v6, v8, v10, v12, v14, v16, v17, v18, v19);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *suggestionTemplateKey;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  suggestionTemplateKey = self->_suggestionTemplateKey;
  v11 = a3;
  objc_msgSend(v11, "encodeObject:forKey:", suggestionTemplateKey, CFSTR("PLSearchSuggestionTemplatePropertyKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_firstIndexCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("PLSearchSuggestionTemplateFirstIndexCategory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_secondIndexCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("PLSearchSuggestionTemplateSecondIndexCategory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_templateType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("PLSearchSuggestionTemplateTemplateType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_templateContentType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("PLSearchSuggestionTemplateTemplateContentType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_templateDateType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("PLSearchSuggestionTemplateDateType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_templateStyleType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("PLSearchSuggestionTemplateStyleType"));

  objc_msgSend(v11, "encodeObject:forKey:", self->_identifier, CFSTR("PLSearchSuggestionTemplateIdentifier"));
}

- (id)initForTestingWithSuggestionTemplateKey:(id)a3 firstIndexCategory:(unint64_t)a4 secondIndexCategory:(unint64_t)a5 templateType:(unint64_t)a6 templateContentType:(unint64_t)a7 templateDateType:(unint64_t)a8 styleType:(unint64_t)a9 identifier:(id)a10 todayDate:(id)a11 locale:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;

  v17 = a3;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  if (v17)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("todayDate"));

LABEL_3:
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplate.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

  }
  v21 = -[PLSearchSuggestionTemplate _initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](self, "_initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v17, a4, a5, a6, a7, a8, a9, v18, v19, v20);

  return v21;
}

- (NSString)suggestionTemplateKey
{
  return self->_suggestionTemplateKey;
}

- (unint64_t)firstIndexCategory
{
  return self->_firstIndexCategory;
}

- (unint64_t)secondIndexCategory
{
  return self->_secondIndexCategory;
}

- (void)setDateFilter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFilter, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)templateContentType
{
  return self->_templateContentType;
}

- (unint64_t)templateDateType
{
  return self->_templateDateType;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (unint64_t)templateStyleType
{
  return self->_templateStyleType;
}

- (unint64_t)localeSupportType
{
  return self->_localeSupportType;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)todayDate
{
  return self->_todayDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateFilter, 0);
  objc_storeStrong((id *)&self->_suggestionTemplateKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
