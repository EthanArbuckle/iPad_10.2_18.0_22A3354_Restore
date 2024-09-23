@implementation WASevereWeatherStringBuilder

+ (id)headlineForEvents:(id)a3
{
  return (id)objc_msgSend(a1, "headlineForEvents:shouldUppercase:", a3, 1);
}

+ (id)headlineForEvents:(id)a3 shouldUppercase:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "eventDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "eventDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v4)
          {
            objc_msgSend(v14, "localizedUppercaseString");
            v16 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v16;
          }
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  v17 = objc_msgSend(v6, "count");
  objc_msgSend(v6, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("%2$@ & %1$li more");
  if (v4)
    v19 = CFSTR("%2$@ & %1$li MORE");
  v20 = (void *)MEMORY[0x24BDD17C8];
  v21 = (void *)MEMORY[0x24BDD1488];
  v22 = v19;
  objc_msgSend(v21, "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", v22, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "stringWithFormat:", v24, v17 - 1, v18, (_QWORD)v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)descriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4
{
  return (id)objc_msgSend(a1, "descriptionForEvents:includeLearnMore:useSentenceCase:", a3, a4, 1);
}

+ (id)descriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4 useSentenceCase:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
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
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v42 = a5;
  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v15, "eventDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 && (objc_msgSend(v7, "containsObject:", v16) & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v15);
          objc_msgSend(v7, "addObject:", v16);
        }
        if (!v12)
        {
          objc_msgSend(v15, "source");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v17 = objc_msgSend(v9, "count");
  v18 = objc_msgSend(v8, "count");
  if (v18 == 2)
  {
    objc_msgSend(v8, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_displayDescriptionForEvent:useSentenceCase:isFirstEvent:", v27, v42, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_displayDescriptionForEvent:useSentenceCase:isFirstEvent:", v28, v42, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v30;
    if (v12)
    {
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_TWO_EVENTS_WITH_SOURCE_WITH_DESCRIPTIONS"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v31, v12, v20, v21);
    }
    else
    {
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_TWO_EVENTS_WITHOUT_SOURCE_WITH_DESCRIPTIONS"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v31, v20, v21, v41);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_45;
  }
  v19 = v18 - 1;
  if (v18 == 1)
  {
    objc_msgSend(v8, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "areaName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_displayDescriptionForEvent:useSentenceCase:isFirstEvent:", v20, v42, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v17 == 1 && v21)
      {
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITH_SOURCE_WITH_DESCRIPTION_WITH_AREA_NAME"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v26, v12, v22, v21);
      }
      else
      {
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITH_SOURCE_WITH_DESCRIPTION_WITHOUT_AREA_NAME"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v26, v12, v22, v41);
      }
    }
    else
    {
      v37 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITHOUT_SOURCE_WITH_DESCRIPTION_WITHOUT_AREA_NAME"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", v26, v22, v40, v41);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_44:
LABEL_45:

    goto LABEL_46;
  }
  if (v18 >= 3)
  {
    objc_msgSend(v8, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_displayDescriptionForEvent:useSentenceCase:isFirstEvent:", v32, v42, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v34;
    if (v12)
    {
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("%2$@: %3$@ and %1$li other alert/alerts."), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringWithFormat:", v22, v19, v12, v20);
    }
    else
    {
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Severe weather alerts: %2$@ and %1$li other alert/alerts."), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringWithFormat:", v22, v19, v20, v41);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  if (v17)
  {
    objc_msgSend(v9, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "areaName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v36;
    if (v17 == 1 && v21)
    {
      if (v12)
      {
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITH_SOURCE_WITHOUT_DESCRIPTION_WITH_AREA_NAME"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", v25, v12, v21);
      }
      else
      {
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_ONE_EVENT_WITHOUT_SOURCE_WITHOUT_DESCRIPTION_WITH_AREA_NAME"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", v25, v21, v40);
      }
    }
    else if (v12)
    {
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("%2$@: %1$li severe weather alert/alerts."), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringWithFormat:", v25, v17, v12);
    }
    else
    {
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("There are %li severe weather alert/alerts."), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringWithFormat:", v25, v17, v40);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v38 = 0;
LABEL_46:

  return v38;
}

+ (id)attributedImportantHeadlineForEvents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "_hasImportantEvent:", v4))
  {
    objc_msgSend(a1, "atttributedHeadlineForEvents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)importantHeadlineForEvents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "_hasImportantEvent:", v4))
  {
    objc_msgSend(a1, "headlineForEvents:shouldUppercase:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_hasImportantEvent:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "description", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          LOBYTE(v4) = objc_msgSend(v7, "importance") == 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)atttributedHeadlineForEvents:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "headlineForEvents:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", *MEMORY[0x24BDF7810], 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6768], "textAttachmentWithImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD1688]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertAttributedString:atIndex:", v10, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)atttributedDescriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4
{
  return (id)objc_msgSend(a1, "atttributedDescriptionForEvents:includeLearnMore:useSentenceCase:", a3, a4, 1);
}

+ (id)atttributedDescriptionForEvents:(id)a3 includeLearnMore:(BOOL)a4 useSentenceCase:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a4;
  objc_msgSend(a1, "descriptionForEvents:includeLearnMore:useSentenceCase:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v6);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", *MEMORY[0x24BDF7810], 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6768], "textAttachmentWithImage:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = IsUIRTL();
      v12 = objc_alloc(MEMORY[0x24BDD1458]);
      v13 = v12;
      if (v11)
      {
        v14 = (void *)objc_msgSend(v12, "initWithString:", CFSTR("\n"));
        objc_msgSend(v7, "appendAttributedString:", v14);

        objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendAttributedString:", v15);

        v16 = objc_alloc(MEMORY[0x24BDD1458]);
        v17 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_LEARN_MORE"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR(" %@"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v16, "initWithString:", v20);
        objc_msgSend(v7, "appendAttributedString:", v21);

      }
      else
      {
        v22 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SEVERE_WEATHER_DESCRIPTION_LEARN_MORE"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR(" %@ "), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v13, "initWithString:", v25);
        objc_msgSend(v7, "appendAttributedString:", v26);

        objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendAttributedString:", v18);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_displayDescriptionForEvent:(id)a3 useSentenceCase:(BOOL)a4 isFirstEvent:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "eventDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    objc_msgSend(v9, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "_capitalizeFirstWordOfString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }

    v10 = v11;
  }

  return v10;
}

+ (id)_capitalizeFirstWordOfString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3010000000;
  v15 = 0;
  v16 = 0;
  v14 = "";
  v5 = objc_msgSend(v3, "length");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__WASevereWeatherStringBuilder__capitalizeFirstWordOfString___block_invoke;
  v10[3] = &unk_24DD9DD28;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 1027, v10);
  v6 = (void *)v18[5];
  if (v6)
  {
    v7 = v12;
    objc_msgSend(v6, "localizedCapitalizedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceCharactersInRange:withString:", v7[4], v7[5], v8);

  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v4;
}

void __61__WASevereWeatherStringBuilder__capitalizeFirstWordOfString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v12;
  uint64_t v13;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v12 = a2;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v13 + 32) = a3;
  *(_QWORD *)(v13 + 40) = a4;

  *a7 = 1;
}

@end
