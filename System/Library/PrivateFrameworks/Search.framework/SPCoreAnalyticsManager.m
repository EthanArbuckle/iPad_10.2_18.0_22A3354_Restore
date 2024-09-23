@implementation SPCoreAnalyticsManager

+ (void)logEngagementWithBundleIdentifier:(id)a3 forEvent:(unint64_t)a4
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = CFSTR("com.apple.searchd.eng.SEARCH_IN_APP.");
  }
  else
  {
    if (a4 != 2)
      goto LABEL_7;
    v6 = CFSTR("com.apple.searchd.eng.SHOW_MORE.");
  }
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    AnalyticsSendEventLazy();

  }
LABEL_7:

}

+ (id)aggdLogIdentifierFromItem:(id)a3 type:(int)a4 baseType:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v25;
  __CFString *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  int v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;

  v7 = a3;
  SPGetDisabledDomainSet();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("DOMAIN_PARSEC"));

  v10 = objc_msgSend(v7, "type") == 36 || objc_msgSend(v7, "type") == 37;
  v11 = CFSTR("com.apple.searchd.eng.shortcut");
  switch(a4)
  {
    case 0:
      v12 = CFSTR("com.apple.searchd.eng.enabled.");
      if (v9)
        v12 = CFSTR("com.apple.searchd.eng.disabled.");
      v13 = v12;
      goto LABEL_13;
    case 1:
      v13 = CFSTR("com.apple.searchd.eng.orbpreview.");
      goto LABEL_13;
    case 2:
      v13 = CFSTR("com.apple.searchd.eng.correction.static.");
      goto LABEL_13;
    case 3:
      v13 = CFSTR("com.apple.searchd.eng.correction.dynamic.");
      goto LABEL_13;
    case 4:
      v13 = CFSTR("com.apple.searchd.eng.topHit.");
      goto LABEL_13;
    case 5:
      v25 = objc_msgSend(v7, "type") == 2 || v10;
      v26 = CFSTR("com.apple.searchd.eng.distance.local");
      if ((v25 & 1) == 0 && objc_msgSend(v7, "type") != 4)
        v26 = CFSTR("com.apple.searchd.eng.distance.parsec");
      v11 = v26;
      goto LABEL_22;
    case 6:
      goto LABEL_22;
    default:
      v13 = 0;
LABEL_13:
      objc_msgSend(v7, "sectionBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.searchd.zkw.apps"));

      if (v15)
      {
        -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("zkw.application."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "applicationBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingString:", v17);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
        goto LABEL_21;
      }
      objc_msgSend(v7, "sectionBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0)
      {

LABEL_19:
        -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("application"));
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v20;
        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "applicationBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR(".%@"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingString:", v23);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        goto LABEL_21;
      }
      v19 = objc_msgSend(v7, "isLocalApplicationResult");

      if ((v19 & 1) != 0)
        goto LABEL_19;
      objc_msgSend(v7, "sectionBundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(CFSTR("com.apple.searchd.zkw.siriactions"), "isEqualToString:", v27);

      if (v28)
      {
        -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("com.apple.searchd.zkw.siriactions"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "sectionBundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(CFSTR("com.apple.spotlightui.search-through"), "isEqualToString:", v29);

        if (v30)
        {
          objc_msgSend(v7, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v16);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        objc_msgSend(v7, "applicationBundleIdentifier");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (v20
          || (objc_msgSend(v7, "sectionBundleIdentifier"), (v20 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v31 = objc_msgSend(v7, "type");
          v11 = CFSTR("com.apple.searchd.eng.suggestion.parsec");
          switch(v31)
          {
            case 1:
              -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("parsec"));
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v32 = CFSTR("parsec.");
              goto LABEL_53;
            case 2:
              v35 = CFSTR("localCoreSpotlight");
              goto LABEL_44;
            case 3:
            case 5:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 18:
            case 19:
LABEL_50:
              v11 = CFSTR("com.apple.searchd.eng.correction.unknown");
              goto LABEL_20;
            case 4:
              v35 = CFSTR("userActivity");
LABEL_44:
              -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v35);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v32 = CFSTR("local.");
LABEL_53:
              -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v32);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringByAppendingString:", v20);
              v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

              break;
            case 6:
              v11 = CFSTR("com.apple.searchd.eng.calculator");
              break;
            case 7:
              v11 = CFSTR("com.apple.searchd.eng.conversion");
              break;
            case 8:
              v11 = CFSTR("com.apple.searchd.eng.definition");
              break;
            case 16:
LABEL_39:
              objc_msgSend(v7, "contactIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                v34 = CFSTR("suggestion.contact");
LABEL_55:
                -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v34);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
              v11 = CFSTR("com.apple.searchd.eng.suggestion.local");
              break;
            case 17:
              goto LABEL_20;
            case 20:
              v11 = CFSTR("com.apple.searchd.eng.siri.action");
              break;
            case 21:
              v11 = CFSTR("com.apple.searchd.eng.siri.suggestion");
              break;
            default:
              switch(v31)
              {
                case ' ':
                  goto LABEL_39;
                case '$':
                  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("localCoreSpotlight"));
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                  v32 = CFSTR("local.contact.");
                  goto LABEL_53;
                case '%':
                  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("localCoreSpotlight"));
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                  v32 = CFSTR("local.people.");
                  goto LABEL_53;
                case '&':
                  v34 = CFSTR("suggestion.person");
                  goto LABEL_55;
                default:
                  goto LABEL_50;
              }
          }
          goto LABEL_20;
        }
        v11 = 0;
      }
LABEL_21:

LABEL_22:
      return v11;
  }
}

+ (void)computeEngagementMatrixForEngagedItem:(id)a3 topAnalyticsItemsPerSection:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  id (*v52)(uint64_t);
  void *v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sectionBundleIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "type");
  v8 = objc_msgSend(v5, "type");
  if (v7 == 36)
    goto LABEL_2;
  v25 = v8;
  v26 = objc_msgSend(v5, "type");
  v9 = 1;
  if (v26 != 2 && v25 != 37)
  {
    if (objc_msgSend(v5, "type") == 4
      || objc_msgSend(v5, "type") == 6
      || objc_msgSend(v5, "type") == 7)
    {
LABEL_2:
      v9 = 1;
      goto LABEL_3;
    }
    v9 = objc_msgSend(v5, "type") == 8;
  }
LABEL_3:
  v41 = v9;
  v40 = v5;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v11)
  {
    v12 = v11;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v47;
    v15 = 1;
    v16 = 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        v18 = v13;
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v10);
        v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v19, "sectionBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.searchd.suggestions")) & 1) == 0
          && (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.searchd.zkw.apps")) & 1) == 0
          && (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.spotlightui.search-through")) & 1) == 0)
        {
          if ((v16 & 1) != 0)
          {
            v20 = v19;

            v44 = v20;
          }
          if (objc_msgSend(v13, "isEqualToString:", v45))
            v21 = (int)v15 <= 10;
          else
            v21 = 0;
          if (v21)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.searchd.eng.any.engaged.top.%d.bundle"), v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v50 = MEMORY[0x24BDAC760];
              v51 = 3221225472;
              v52 = __AnalyticsAddValueIfNonNull_block_invoke;
              v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
              v54 = 1;
              AnalyticsSendEventLazy();
            }

            if (v41)
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.searchd.eng.local.engaged.top.%d.bundle"), v15);
            else
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.searchd.eng.parsec.engaged.top.%d.bundle"), v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v50 = MEMORY[0x24BDAC760];
              v51 = 3221225472;
              v52 = __AnalyticsAddValueIfNonNull_block_invoke;
              v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
              v54 = 1;
              AnalyticsSendEventLazy();
            }

          }
          if (objc_msgSend(v19, "type") == 1)
          {
            v24 = v42;
            if (!v42)
            {
              v24 = (void *)objc_opt_new();
              v42 = v24;
            }
          }
          else
          {
            v24 = v43;
            if (!v43)
            {
              v24 = (void *)objc_opt_new();
              v43 = v24;
            }
          }
          objc_msgSend(v24, "addObject:", v19);
          v16 = 0;
          v15 = (v15 + 1);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v12);
  }
  else
  {
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v13 = 0;
  }

  if (v41)
    v27 = v43;
  else
    v27 = v42;
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionBundleIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "isEqualToString:", v29))
  {
    v30 = MEMORY[0x24BDAC760];
    v50 = MEMORY[0x24BDAC760];
    v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v54 = 1;
    AnalyticsSendEventLazy();
    v31 = v40;
    if (v41)
    {
      v50 = v30;
      v51 = 3221225472;
      v52 = __AnalyticsAddValueIfNonNull_block_invoke;
      v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      v54 = 1;
LABEL_55:
      AnalyticsSendEventLazy();
      goto LABEL_56;
    }
    v50 = v30;
    v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v54 = 1;
    AnalyticsSendEventLazy();
  }
  else
  {
    v31 = v40;
    if (v41)
      goto LABEL_56;
  }
  objc_msgSend(v28, "sectionBundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v45, "isEqualToString:", v32);

  if (v33)
  {
    v50 = MEMORY[0x24BDAC760];
    v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v54 = 1;
    AnalyticsSendEventLazy();
  }
  if (objc_msgSend(v45, "isEqualToString:", v29))
  {
    v50 = MEMORY[0x24BDAC760];
    v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v54 = 1;
    goto LABEL_55;
  }
LABEL_56:
  objc_msgSend(v28, "sectionBundleIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "isEqualToString:", v34))
  {

  }
  else
  {
    objc_msgSend(v28, "sectionBundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

    if (!v36)
      goto LABEL_61;
  }
  objc_msgSend(v28, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "isEqualToString:", v38);

  if (v39)
  {
    v50 = MEMORY[0x24BDAC760];
    v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v54 = 1;
    AnalyticsSendEventLazy();
  }
LABEL_61:

}

+ (void)logEngagementWithItem:(id)a3 atPosition:(unint64_t)a4 forEvent:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id (*v30)(uint64_t);
  void *v31;
  unint64_t v32;

  v8 = a3;
  v9 = v8;
  if (a5 == 5)
  {
    v27 = 0;
    objc_msgSend(a1, "aggdLogIdentifierFromItem:type:baseType:", v8, 1, &v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v27;
    if (v10)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __AnalyticsAddValueIfNonNull_block_invoke;
      v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      v32 = 1;
      AnalyticsSendEventLazy();
    }

    if (v11)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __AnalyticsAddValueIfNonNull_block_invoke;
      v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      v32 = 1;
      AnalyticsSendEventLazy();
    }
  }
  else
  {
    v12 = objc_msgSend(v8, "isStaticCorrection");
    v13 = MEMORY[0x24BDAC760];
    if (v12)
    {
      v26 = 0;
      objc_msgSend(a1, "aggdLogIdentifierFromItem:type:baseType:", v9, 2, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;
      if (v14)
      {
        v28 = v13;
        v29 = 3221225472;
        v30 = __AnalyticsAddValueIfNonNull_block_invoke;
        v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        v32 = 1;
        AnalyticsSendEventLazy();
      }

      if (v15)
      {
        v28 = v13;
        v29 = 3221225472;
        v30 = __AnalyticsAddValueIfNonNull_block_invoke;
        v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        v32 = 1;
        AnalyticsSendEventLazy();
      }
    }
    else
    {
      v15 = 0;
    }
    if (objc_msgSend(v9, "isDisplayNameCorrectionsMatch"))
    {
      v25 = v15;
      objc_msgSend(a1, "aggdLogIdentifierFromItem:type:baseType:", v9, 3, &v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v25;

      if (v16)
      {
        v28 = v13;
        v29 = 3221225472;
        v30 = __AnalyticsAddValueIfNonNull_block_invoke;
        v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        v32 = 1;
        AnalyticsSendEventLazy();
      }

      if (v17)
      {
        v28 = v13;
        v29 = 3221225472;
        v30 = __AnalyticsAddValueIfNonNull_block_invoke;
        v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        v32 = 1;
        AnalyticsSendEventLazy();
      }
    }
    else
    {
      v17 = v15;
    }
    v24 = v17;
    objc_msgSend(a1, "aggdLogIdentifierFromItem:type:baseType:", v9, 0, &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;

    if (v18)
    {
      v28 = v13;
      v29 = 3221225472;
      v30 = __AnalyticsAddValueIfNonNull_block_invoke;
      v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      v32 = 1;
      AnalyticsSendEventLazy();
    }

    if (v11)
    {
      v28 = v13;
      v29 = 3221225472;
      v30 = __AnalyticsAddValueIfNonNull_block_invoke;
      v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      v32 = 1;
      AnalyticsSendEventLazy();
    }
    if (objc_msgSend(v9, "topHit"))
    {
      if (objc_msgSend(v9, "isLocalShortcut"))
      {
        objc_msgSend(a1, "aggdLogIdentifierFromItem:type:baseType:", v9, 6, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v28 = v13;
          v29 = 3221225472;
          v30 = __AnalyticsAddValueIfNonNull_block_invoke;
          v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
          v32 = 1;
          AnalyticsSendEventLazy();
        }

      }
      v23 = v11;
      objc_msgSend(a1, "aggdLogIdentifierFromItem:type:baseType:", v9, 4, &v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;

      if (v20)
      {
        v28 = v13;
        v29 = 3221225472;
        v30 = __AnalyticsAddValueIfNonNull_block_invoke;
        v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        v32 = 1;
        AnalyticsSendEventLazy();
      }

      v11 = v21;
    }
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "aggdLogIdentifierFromItem:type:baseType:", v9, 5, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v28 = v13;
        v29 = 3221225472;
        v30 = __AnalyticsAddValueIfNonNull_block_invoke;
        v31 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        v32 = a4;
        AnalyticsSendEventLazy();
      }

    }
  }

}

@end
