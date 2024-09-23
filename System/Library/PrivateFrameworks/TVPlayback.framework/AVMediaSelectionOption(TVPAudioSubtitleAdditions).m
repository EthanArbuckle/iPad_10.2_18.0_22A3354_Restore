@implementation AVMediaSelectionOption(TVPAudioSubtitleAdditions)

- (id)tvp_localizedDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDB2588];
  objc_msgSend(a1, "commonMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataItemsFromArray:withKey:keySpace:", v4, *MEMORY[0x24BDB1DA0], *MEMORY[0x24BDB1E38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:withLocale:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(v2, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("_"));
    v11 = objc_msgSend(v9, "rangeOfString:", CFSTR("-"));
    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = v11;
      else
        v13 = v10;
      if (v10 == 0x7FFFFFFFFFFFFFFFLL && v11 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_25;
    }
    else if (v10 >= v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = v10;
    }
    objc_msgSend(v9, "substringToIndex:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:withLocale:", v5, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(a1, "displayNameWithLocale:", v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

LABEL_28:
      if (v7)
        goto LABEL_4;
      goto LABEL_3;
    }
LABEL_25:
    v7 = 0;
    goto LABEL_28;
  }
  objc_msgSend(a1, "displayNameWithLocale:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_3:
    objc_msgSend(a1, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:

  return v7;
}

- (id)tvp_languageCodeFromLocale
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(a1, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "mediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB1CF8]);

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("en");
LABEL_5:

    v3 = (void *)v6;
    return v3;
  }
  objc_msgSend(a1, "mediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB1D38]);

  if (v8)
  {
    objc_msgSend(a1, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tvp_subtitleLanguageCode");
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v3 = v9;
    goto LABEL_5;
  }
  return v3;
}

- (uint64_t)tvp_isSDHSubtitle
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "mediaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB1D38]))
  {
    if ((objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CA8]) & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CE0]);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
