@implementation PKAccountPromotion

- (PKAccountPromotion)initWithDictionary:(id)a3
{
  id v4;
  PKAccountPromotion *v5;
  PKAccountPromotion *v6;
  PKAccountPromotion *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKAccountPromotion;
    v5 = -[PKAccountPromotion init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[PKAccountPromotion _initWithPromotionDictionary:](v5, "_initWithPromotionDictionary:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_initWithPromotionDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *programIdentifier;
  void *v7;
  NSDate *v8;
  NSDate *startDate;
  NSDate *v10;
  NSDate *endDate;
  NSString *v12;
  NSString *name;
  NSArray *v14;
  NSArray *completionSteps;
  NSDictionary *v16;
  NSDictionary *layoutDictionary;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("programIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  programIdentifier = self->_programIdentifier;
  self->_programIdentifier = v5;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_type = PKAccountPromotionTypeFromString(v7);

  objc_msgSend(v4, "PKDateForKey:", CFSTR("startDate"));
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v8;

  objc_msgSend(v4, "PKDateForKey:", CFSTR("endDate"));
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v10;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("name"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v12;

  objc_msgSend(v4, "PKArrayForKey:", CFSTR("completionSteps"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  +[PKAccountPromotionCompletionStep completionStepsFromDictionaries:](PKAccountPromotionCompletionStep, "completionStepsFromDictionaries:", v18);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  completionSteps = self->_completionSteps;
  self->_completionSteps = v14;

  self->_impressionCount = 0;
  -[PKAccountPromotion _updateState](self, "_updateState");
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("layout"));
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  layoutDictionary = self->_layoutDictionary;
  self->_layoutDictionary = v16;

  -[PKAccountPromotion _parseLayoutDictionary](self, "_parseLayoutDictionary");
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
  -[PKAccountPromotion _updateState](self, "_updateState");
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
  -[PKAccountPromotion _updateState](self, "_updateState");
}

- (void)setCompletionSteps:(id)a3
{
  objc_storeStrong((id *)&self->_completionSteps, a3);
  -[PKAccountPromotion _updateState](self, "_updateState");
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setLayoutDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDictionary, a3);
  -[PKAccountPromotion _parseLayoutDictionary](self, "_parseLayoutDictionary");
}

- (void)_parseLayoutDictionary
{
  PKDynamicTemplateLayout *v3;
  PKDynamicTemplateLayout *layout;
  NSString *v5;
  NSString *templateIdentifier;
  NSURL *v7;
  NSURL *termsURL;
  NSString *v9;
  PKDynamicTemplateLayout *v10;
  NSDictionary *layoutDictionary;
  NSURL *v12;
  void *v13;

  if (-[NSDictionary count](self->_layoutDictionary, "count"))
  {
    v3 = -[PKDynamicTemplateLayout initWithDictionary:]([PKDynamicTemplateLayout alloc], "initWithDictionary:", self->_layoutDictionary);
    layout = self->_layout;
    self->_layout = v3;

    -[PKDynamicTemplateLayout templateIdentifier](self->_layout, "templateIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    templateIdentifier = self->_templateIdentifier;
    self->_templateIdentifier = v5;

    -[PKDynamicTemplateLayout anyLayoutLinkNamed:](self->_layout, "anyLayoutLinkNamed:", CFSTR("disclosure"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
    termsURL = self->_termsURL;
    self->_termsURL = v7;

    v9 = (NSString *)v13;
  }
  else
  {
    v10 = self->_layout;
    self->_layout = 0;

    layoutDictionary = self->_layoutDictionary;
    self->_layoutDictionary = 0;

    v12 = self->_termsURL;
    self->_termsURL = 0;

    v9 = self->_templateIdentifier;
    self->_templateIdentifier = 0;
  }

}

- (id)layoutData
{
  NSDictionary *layoutDictionary;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  layoutDictionary = self->_layoutDictionary;
  if (layoutDictionary)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", layoutDictionary, 0, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v4)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error serializing promotion layout dictionary: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setLayoutDictionaryFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    -[PKAccountPromotion setLayoutDictionary:](self, "setLayoutDictionary:", v6);

  }
  else
  {
    -[PKAccountPromotion setLayoutDictionary:](self, "setLayoutDictionary:", 0);
  }

}

- (double)timeRemaining
{
  NSDate *endDate;
  double result;

  endDate = self->_endDate;
  if (!endDate)
    return 0.0;
  -[NSDate timeIntervalSinceNow](endDate, "timeIntervalSinceNow");
  return result;
}

- (BOOL)hideTimeRemaining
{
  NSDictionary *layoutDictionary;

  layoutDictionary = self->_layoutDictionary;
  if (layoutDictionary)
    LOBYTE(layoutDictionary) = -[NSDictionary PKBoolForKey:](layoutDictionary, "PKBoolForKey:", CFSTR("hideTimeRemaining"));
  return (char)layoutDictionary;
}

- (BOOL)expiringSoon
{
  double v2;

  -[PKAccountPromotion timeRemaining](self, "timeRemaining");
  return v2 < 432000.0;
}

- (BOOL)isInTerminalState
{
  return self->_state - 3 < 2;
}

- (void)incrementImpressionCount
{
  ++self->_impressionCount;
}

- (void)resetImpressionCount
{
  self->_impressionCount = 0;
}

- (void)_updateState
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  unint64_t v6;

  v3 = -[PKAccountPromotion _completed](self, "_completed");
  v4 = -[PKAccountPromotion _startDateHasPassed](self, "_startDateHasPassed");
  v5 = -[PKAccountPromotion _endDateHasPassed](self, "_endDateHasPassed");
  v6 = 2;
  if (v3)
    v6 = 3;
  if (v4)
  {
    if (!v3 && v5)
    {
      if (-[PKAccountPromotion _isOngoing](self, "_isOngoing")
        && -[PKAccountPromotion _hasNonZeroProgress](self, "_hasNonZeroProgress"))
      {
        v6 = 3;
      }
      else
      {
        v6 = 4;
      }
    }
  }
  else
  {
    v6 = 1;
  }
  self->_state = v6;
}

- (BOOL)_startDateHasPassed
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "compare:", self->_startDate) == 1;

  return (char)self;
}

- (BOOL)_endDateHasPassed
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "compare:", self->_endDate) == 1;

  return (char)self;
}

- (BOOL)_isOngoing
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PKAccountPromotion completionSteps](self, "completionSteps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "endValue", (_QWORD)v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)_hasNonZeroProgress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKAccountPromotion completionSteps](self, "completionSteps", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "currentValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "compare:", v7);

        if (v8 == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_completed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_completionSteps, "count"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKAccountPromotion completionSteps](self, "completionSteps", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "completed"))
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_programIdentifier;
}

- (NSString)description
{
  void *v3;
  unint64_t type;
  const __CFString *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("programIdentifier: '%@'; "), self->_programIdentifier);
  type = self->_type;
  if (type > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD80B8[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  PKLongDateString(self->_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: '%@'; "), v6);

  PKLongDateString(self->_endDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("name: '%@'; "), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("terms: '%@'; "), self->_termsURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("templateID: '%@'; "), self->_templateIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("completionSteps: \n"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_completionSteps;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("- %@\n"), v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("layout: %@\n"), self->_layoutDictionary);
  objc_msgSend(v3, "appendFormat:", CFSTR("impressionCount: %ld\n"), self->_impressionCount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountPromotion *v4;
  PKAccountPromotion *v5;
  BOOL v6;

  v4 = (PKAccountPromotion *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountPromotion isEqualToAccountPromotion:](self, "isEqualToAccountPromotion:", v5);

  return v6;
}

- (BOOL)isEqualToAccountPromotion:(id)a3
{
  id *v4;
  _BOOL4 v5;
  NSDictionary *layoutDictionary;
  NSDictionary *v7;
  int v8;
  id v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  NSDate *startDate;
  NSDate *v15;
  NSDate *endDate;
  NSDate *v17;
  id v18;
  NSString *v19;
  _BOOL4 v20;
  BOOL v21;
  NSArray *completionSteps;
  NSArray *v24;
  NSURL *termsURL;
  NSURL *v26;
  int v27;
  NSString *templateIdentifier;
  NSString *v29;
  int v30;

  v4 = (id *)a3;
  if (!v4)
    goto LABEL_32;
  if (-[NSDictionary count](self->_layoutDictionary, "count"))
    v5 = 0;
  else
    v5 = objc_msgSend(v4[12], "count") == 0;
  layoutDictionary = self->_layoutDictionary;
  v7 = (NSDictionary *)v4[12];
  if (layoutDictionary && v7)
    v8 = -[NSDictionary isEqual:](layoutDictionary, "isEqual:");
  else
    v8 = layoutDictionary == v7;
  v9 = v4[2];
  v10 = self->_programIdentifier;
  v11 = (NSString *)v9;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    if (!v10 || !v11)
      goto LABEL_31;
    v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_32;
  }
  if ((id)self->_type != v4[3])
    goto LABEL_32;
  startDate = self->_startDate;
  v15 = (NSDate *)v4[4];
  if (startDate && v15)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (startDate != v15)
  {
    goto LABEL_32;
  }
  endDate = self->_endDate;
  v17 = (NSDate *)v4[5];
  if (endDate && v17)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (endDate != v17)
  {
    goto LABEL_32;
  }
  v18 = v4[6];
  v10 = self->_name;
  v19 = (NSString *)v18;
  if (v10 != v19)
  {
    v12 = v19;
    if (v10 && v19)
    {
      v20 = -[NSString isEqualToString:](v10, "isEqualToString:", v19);

      if (!v20)
        goto LABEL_32;
      goto LABEL_35;
    }
LABEL_31:

    goto LABEL_32;
  }

LABEL_35:
  completionSteps = self->_completionSteps;
  v24 = (NSArray *)v4[7];
  if (completionSteps && v24)
  {
    if ((-[NSArray isEqual:](completionSteps, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (completionSteps != v24)
  {
    goto LABEL_32;
  }
  termsURL = self->_termsURL;
  v26 = (NSURL *)v4[9];
  if (termsURL && v26)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (termsURL != v26)
  {
    goto LABEL_32;
  }
  v27 = v8 | v5;
  templateIdentifier = self->_templateIdentifier;
  v29 = (NSString *)v4[10];
  if (templateIdentifier && v29)
    v30 = -[NSString isEqual:](templateIdentifier, "isEqual:");
  else
    v30 = templateIdentifier == v29;
  if ((v30 & v27) == 1)
  {
    v21 = self->_impressionCount == (_QWORD)v4[8];
    goto LABEL_33;
  }
LABEL_32:
  v21 = 0;
LABEL_33:

  return v21;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_programIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_completionSteps);
  objc_msgSend(v3, "safelyAddObject:", self->_termsURL);
  objc_msgSend(v3, "safelyAddObject:", self->_templateIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_layoutDictionary);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_impressionCount - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPromotion)initWithCoder:(id)a3
{
  id v4;
  PKAccountPromotion *v5;
  uint64_t v6;
  NSString *programIdentifier;
  void *v8;
  uint64_t v9;
  NSDate *startDate;
  uint64_t v11;
  NSDate *endDate;
  uint64_t v13;
  NSString *name;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *completionSteps;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKAccountPromotion;
  v5 = -[PKAccountPromotion init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKAccountPromotionTypeFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v13 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("completionSteps"));
    v19 = objc_claimAutoreleasedReturnValue();
    completionSteps = v5->_completionSteps;
    v5->_completionSteps = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layout"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPromotion setLayoutDictionaryFromData:](v5, "setLayoutDictionaryFromData:", v21);
    v5->_impressionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("impressionCount"));
    -[PKAccountPromotion _updateState](v5, "_updateState");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *programIdentifier;
  unint64_t type;
  const __CFString *v6;
  void *v7;
  id v8;

  programIdentifier = self->_programIdentifier;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", programIdentifier, CFSTR("programIdentifier"));
  type = self->_type;
  if (type > 5)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD80B8[type];
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("type"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_completionSteps, CFSTR("completionSteps"));
  -[PKAccountPromotion layoutData](self, "layoutData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("layout"));

  objc_msgSend(v8, "encodeInteger:forKey:", self->_impressionCount, CFSTR("impressionCount"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSArray *completionSteps;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_programIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = self->_type;
  v8 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  completionSteps = self->_completionSteps;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __35__PKAccountPromotion_copyWithZone___block_invoke;
  v20[3] = &__block_descriptor_40_e42__16__0__PKAccountPromotionCompletionStep_8l;
  v20[4] = a3;
  -[NSArray pk_arrayBySafelyApplyingBlock:](completionSteps, "pk_arrayBySafelyApplyingBlock:", v20);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v5[7];
  v5[7] = v15;

  -[PKAccountPromotion layoutData](self, "layoutData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copyWithZone:", a3);
  objc_msgSend(v5, "setLayoutDictionaryFromData:", v18);
  v5[8] = self->_impressionCount;
  objc_msgSend(v5, "_updateState");

  return v5;
}

id __35__PKAccountPromotion_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_programIdentifier, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)completionSteps
{
  return self->_completionSteps;
}

- (int64_t)impressionCount
{
  return self->_impressionCount;
}

- (void)setImpressionCount:(int64_t)a3
{
  self->_impressionCount = a3;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_storeStrong((id *)&self->_termsURL, a3);
}

- (NSString)templateIdentifier
{
  return self->_templateIdentifier;
}

- (void)setTemplateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_templateIdentifier, a3);
}

- (PKDynamicTemplateLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (NSDictionary)layoutDictionary
{
  return self->_layoutDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDictionary, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_templateIdentifier, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_completionSteps, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_programIdentifier, 0);
}

@end
