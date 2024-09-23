@implementation _PSMessagesPinningUtilities

+ (id)actionTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1E44004F8[a3];
}

+ (id)interactionMethodToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1E4400520[a3];
}

+ (id)startOfDayForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)chatGuidsFromSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "chatGuid", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (id)suggestionsToString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "chatGuidsFromSuggestions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dateToString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("EE, d LLLL yyyy HH:mm"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)intersectionsOfActualPinnings:(id)a3 fromTopN:(unint64_t)a4 suggestions:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v8, "count");
  if (v9 >= a4)
    v10 = a4;
  else
    v10 = v9;
  objc_msgSend(v8, "subarrayWithRange:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v12);
        v15 += objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
