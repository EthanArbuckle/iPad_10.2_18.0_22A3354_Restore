@implementation PLSearchSuggestionSceneUtility

+ (id)supportedSceneIdentifiers
{
  id v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 1; i != 53; ++i)
  {
    +[PLSearchSuggestionSceneUtility sceneIdentifierForSceneTemplateType:](PLSearchSuggestionSceneUtility, "sceneIdentifierForSceneTemplateType:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

+ (id)sceneIdentifierForSceneTemplateType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  switch(a3)
  {
    case 1uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 176;
      goto LABEL_57;
    case 2uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 178;
      goto LABEL_57;
    case 3uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 248;
      goto LABEL_57;
    case 4uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 292;
      goto LABEL_57;
    case 5uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 12031;
      goto LABEL_57;
    case 6uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 436;
      goto LABEL_57;
    case 7uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 454;
      goto LABEL_57;
    case 8uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 348;
      goto LABEL_57;
    case 9uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 462;
      goto LABEL_57;
    case 0xAuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 488;
      goto LABEL_57;
    case 0xBuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 547;
      goto LABEL_57;
    case 0xCuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 574;
      goto LABEL_57;
    case 0xDuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 575;
      goto LABEL_57;
    case 0xEuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 597;
      goto LABEL_57;
    case 0xFuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 624;
      goto LABEL_57;
    case 0x10uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1768;
      goto LABEL_57;
    case 0x11uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 683;
      goto LABEL_57;
    case 0x12uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 715;
      goto LABEL_57;
    case 0x13uLL:
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = 5;
      goto LABEL_32;
    case 0x14uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 14164;
      goto LABEL_57;
    case 0x15uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 14170;
      goto LABEL_57;
    case 0x16uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 14298;
      goto LABEL_57;
    case 0x17uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 15051;
      goto LABEL_57;
    case 0x18uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 14933;
      goto LABEL_57;
    case 0x19uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 15060;
      goto LABEL_57;
    case 0x1AuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 953;
      goto LABEL_57;
    case 0x1BuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 15510;
      goto LABEL_57;
    case 0x1CuLL:
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = 25;
LABEL_32:
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%u"), CFSTR("humanAction"), v9, v3, v4);
      goto LABEL_58;
    case 0x1DuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1058;
      goto LABEL_57;
    case 0x1EuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1069;
      goto LABEL_57;
    case 0x1FuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1118;
      goto LABEL_57;
    case 0x20uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1111;
      goto LABEL_57;
    case 0x21uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 16461;
      goto LABEL_57;
    case 0x22uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 16491;
      goto LABEL_57;
    case 0x23uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 16532;
      goto LABEL_57;
    case 0x24uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1215;
      goto LABEL_57;
    case 0x25uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1219;
      goto LABEL_57;
    case 0x26uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 16949;
      goto LABEL_57;
    case 0x27uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1223;
      goto LABEL_57;
    case 0x28uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1767;
      goto LABEL_57;
    case 0x29uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1241;
      goto LABEL_57;
    case 0x2AuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1249;
      goto LABEL_57;
    case 0x2BuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1276;
      goto LABEL_57;
    case 0x2CuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1334;
      goto LABEL_57;
    case 0x2DuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1328;
      goto LABEL_57;
    case 0x2EuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1366;
      goto LABEL_57;
    case 0x2FuLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1460;
      goto LABEL_57;
    case 0x30uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1500;
      goto LABEL_57;
    case 0x31uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 12775;
      goto LABEL_57;
    case 0x32uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 12;
      goto LABEL_57;
    case 0x33uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 2;
      goto LABEL_57;
    case 0x34uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 12875;
LABEL_57:
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%llu"), CFSTR("scene"), v6, v3, v4);
LABEL_58:
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)generateSceneBasedTemplateWithSceneTemplateType:(unint64_t)a3 sceneTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  PLSearchSuggestionTemplate *v21;
  NSObject *v22;
  void *v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v24 = v11;
  switch(a4)
  {
    case 1uLL:
      +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:](PLSearchSuggestionSceneUtility, "_templateKeyPrefixForSceneTemplateType:", a3);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v16 = 11;
      v17 = 1300;
      v18 = CFSTR("_WITH_PERSON");
      break;
    case 2uLL:
      +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:](PLSearchSuggestionSceneUtility, "_templateKeyPrefixForSceneTemplateType:", a3);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v16 = 9;
      v15 = 2;
      v18 = CFSTR("_LAST_WEEK");
      break;
    case 3uLL:
      +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:](PLSearchSuggestionSceneUtility, "_templateKeyPrefixForSceneTemplateType:", a3);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v16 = 9;
      v15 = 3;
      v18 = CFSTR("_LAST_MONTH");
      break;
    case 4uLL:
      +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:](PLSearchSuggestionSceneUtility, "_templateKeyPrefixForSceneTemplateType:", a3);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v16 = 9;
      v15 = 4;
      v18 = CFSTR("_LAST_YEAR");
      break;
    case 5uLL:
      +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:](PLSearchSuggestionSceneUtility, "_templateKeyPrefixForSceneTemplateType:", a3);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v16 = 11;
      v17 = 5;
      v18 = CFSTR("_IN_CITY");
      break;
    case 6uLL:
      +[PLSearchSuggestionSceneUtility _templateKeyPrefixForSceneTemplateType:](PLSearchSuggestionSceneUtility, "_templateKeyPrefixForSceneTemplateType:", a3);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v15 = 0;
      v16 = 9;
      v14 = CFSTR("AT_THE_");
      break;
    default:
      v17 = 0;
      v15 = 0;
      v16 = 0;
      v18 = 0;
      v14 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchSuggestionSceneUtility sceneIdentifierForSceneTemplateType:](PLSearchSuggestionSceneUtility, "sceneIdentifierForSceneTemplateType:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v14, "length") && -[__CFString length](v18, "length") && objc_msgSend(v20, "length"))
  {
    v21 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:]([PLSearchSuggestionTemplate alloc], "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v19, 1500, v17, v16, 8, v15, 0, v20, v12, v13);
  }
  else
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2048;
      v28 = a3;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unable to generate scene template for key: %@, scene template type: %tu", buf, 0x16u);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)_templateKeyPrefixForSceneTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 0x33)
    return 0;
  else
    return off_1E366D080[a3 - 1];
}

@end
