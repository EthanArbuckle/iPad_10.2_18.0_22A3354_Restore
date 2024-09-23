@implementation RTEventLocationIdentifier

- (RTEventLocationIdentifier)initWithName:(id)a3 source:(unint64_t)a4 calendarIdentifier:(id)a5
{
  id v8;
  id v9;
  RTEventLocationIdentifier *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *calendarIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RTEventLocationIdentifier;
  v10 = -[RTEventLocationIdentifier init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_source = a4;
    v13 = objc_msgSend(v9, "copy");
    calendarIdentifier = v10->_calendarIdentifier;
    v10->_calendarIdentifier = (NSString *)v13;

  }
  return v10;
}

- (RTEventLocationIdentifier)initWithEvent:(id)a3 source:(unint64_t)a4 useCalendarIdentifier:(BOOL)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  RTEventLocationIdentifier *v11;
  void *v12;
  void *v13;
  void *v14;
  RTEventLocationIdentifier *v15;
  void *v16;
  uint64_t v17;
  RTEventLocationIdentifier *v18;
  void *v19;
  uint64_t v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  switch(a4)
  {
    case 2uLL:
      objc_msgSend(v8, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        objc_msgSend(v9, "calendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "calendarIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = self;
        v16 = v12;
        v17 = 2;
LABEL_12:
        self = -[RTEventLocationIdentifier initWithName:source:calendarIdentifier:](v15, "initWithName:source:calendarIdentifier:", v16, v17, v14);

LABEL_16:
        v11 = self;
        goto LABEL_17;
      }
      v18 = self;
      v19 = v12;
      v20 = 2;
LABEL_15:
      self = -[RTEventLocationIdentifier initWithName:source:calendarIdentifier:](v18, "initWithName:source:calendarIdentifier:", v19, v20, 0);
      goto LABEL_16;
    case 1uLL:
      objc_msgSend(v8, "locationWithoutPrediction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        objc_msgSend(v9, "calendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "calendarIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = self;
        v16 = v12;
        v17 = 1;
        goto LABEL_12;
      }
      v18 = self;
      v19 = v12;
      v20 = 1;
      goto LABEL_15;
    case 0uLL:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315394;
        v23 = "-[RTEventLocationIdentifier initWithEvent:source:useCalendarIdentifier:]";
        v24 = 1024;
        v25 = 95;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: source != RTEventLocationIdentifierSourceUnknown (in %s:%d)", (uint8_t *)&v22, 0x12u);
      }

      break;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTEventLocationIdentifier name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTEventLocationIdentifier source](self, "source");
  -[RTEventLocationIdentifier calendarIdentifier](self, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithName:source:calendarIdentifier:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[RTEventLocationIdentifier source](self, "source");
    if (v6 == objc_msgSend(v5, "source"))
    {
      -[RTEventLocationIdentifier name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[RTEventLocationIdentifier calendarIdentifier](self, "calendarIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "calendarIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
        {
          v13 = 1;
        }
        else
        {
          -[RTEventLocationIdentifier calendarIdentifier](self, "calendarIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "calendarIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

        }
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[RTEventLocationIdentifier name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[RTEventLocationIdentifier source](self, "source") + v4;
  -[RTEventLocationIdentifier calendarIdentifier](self, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isSuitableForFuzzyMatch
{
  void *v2;
  BOOL v3;

  -[RTEventLocationIdentifier name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "length") > 2;

  return v3;
}

- (int64_t)levenshteinDistanceToIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[RTEventLocationIdentifier name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "levenshteinDistanceFromString:withMaxCutOffDistance:", v6, 3);
  return v7;
}

- (id)normalize
{
  void *v3;
  void *v4;
  void *v5;

  -[RTEventLocationIdentifier name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByRemovingAllWhitespaceAndPunctuation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTEventLocationIdentifier setName:](self, "setName:", v5);

  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTEventLocationIdentifier name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTEventLocationIdentifier source](self, "source");
  -[RTEventLocationIdentifier calendarIdentifier](self, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name, %@, source, %lu, calendarIdentifier, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
