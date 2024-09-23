@implementation PGGraphPartOfDayNode

- (PGGraphPartOfDayNode)initWithPartOfDay:(unint64_t)a3
{
  PGGraphPartOfDayNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPartOfDayNode;
  result = -[PGGraphNode init](&v5, sel_init);
  if (result)
    result->_partOfDay = a3;
  return result;
}

- (PGGraphPartOfDayNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  PGGraphPartOfDayNode *v7;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("name"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphPartOfDayNode initWithPartOfDay:](self, "initWithPartOfDay:", objc_msgSend((id)objc_opt_class(), "partOfDayForPartOfDayName:", v6));

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "partOfDayNameForPartOfDay:", self->_partOfDay);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = !v7 || objc_msgSend(v7, "isEqual:", v6);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)propertyDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "partOfDayNameForPartOfDay:", self->_partOfDay);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("name");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "partOfDayNameForPartOfDay:", self->_partOfDay);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphPartOfDayNode (%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PartOfDay");
  return CFSTR("PartOfDay");
}

- (unsigned)domain
{
  return 400;
}

- (NSString)name
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "partOfDayNameForPartOfDay:", self->_partOfDay);
}

- (unint64_t)partOfDay
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[PGGraphPartOfDayNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "partOfDayForPartOfDayName:", v4);

  return v5;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("PartOfDay"), 400);
}

+ (id)filterWithPartOfDay:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "partOfDayNameForPartOfDay:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("name");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)stringValueForPartOfDay:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("Unknown"));
  if ((v3 & 2) != 0)
  {
    +[PGPhotosGraphProfile partOfDayMorning](PGPhotosGraphProfile, "partOfDayMorning");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    if ((v3 & 4) == 0)
    {
LABEL_5:
      if ((v3 & 8) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_5;
  }
  +[PGPhotosGraphProfile partOfDayNoon](PGPhotosGraphProfile, "partOfDayNoon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
LABEL_13:
    +[PGPhotosGraphProfile partOfDayEvening](PGPhotosGraphProfile, "partOfDayEvening");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    if ((v3 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  +[PGPhotosGraphProfile partOfDayAfternoon](PGPhotosGraphProfile, "partOfDayAfternoon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  if ((v3 & 0x10) != 0)
    goto LABEL_13;
LABEL_7:
  if ((v3 & 0x20) != 0)
  {
LABEL_8:
    +[PGPhotosGraphProfile partOfDayNight](PGPhotosGraphProfile, "partOfDayNight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
LABEL_9:
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)partOfDayForPartOfDayName:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B060]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B070]) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B050]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B058]) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B068]) & 1) != 0)
  {
    v4 = 32;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Unknown part of day name %@", (uint8_t *)&v8, 0xCu);
    }

    v4 = 1;
  }

  return v4;
}

+ (id)partOfDayNameForPartOfDay:(unint64_t)a3
{
  int v3;
  id *v4;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if ((uint64_t)a3 <= 7)
  {
    if (a3 == 2)
    {
      v4 = (id *)MEMORY[0x1E0D4B060];
      return *v4;
    }
    if (a3 == 4)
    {
      v4 = (id *)MEMORY[0x1E0D4B070];
      return *v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 8uLL:
        v4 = (id *)MEMORY[0x1E0D4B050];
        return *v4;
      case 0x10uLL:
        v4 = (id *)MEMORY[0x1E0D4B058];
        return *v4;
      case 0x20uLL:
        v4 = (id *)MEMORY[0x1E0D4B068];
        return *v4;
    }
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Unknown part of day %d", (uint8_t *)v8, 8u);
  }

  return CFSTR("Unknown");
}

@end
