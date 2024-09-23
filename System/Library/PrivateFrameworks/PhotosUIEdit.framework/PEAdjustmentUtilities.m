@implementation PEAdjustmentUtilities

+ (id)semanticStyleCastDisplayName:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71ED0]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_ORIGINAL");
LABEL_33:
    +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "useEngPlaceholderNames");

    if (v6)
    {
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PHOTOEDIT_STYLE_CAST_"), &stru_24C619BD0);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
    }
    else
    {
      PELocalizedString(v4);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71ED8]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_STANDARD");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EE8]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_TAN_WARM");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71E80]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_BLUSH_WARM");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EC0]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_NEUTRAL");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71E98]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_COOL");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EC8]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_NO_FILTER");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EF8]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_WARM_AUTHENTIC");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EE0]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_STARK_BLACK_WHITE");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71E90]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_COLORFUL");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EA0]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_DREAMY_HUES");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EF0]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_URBAN_COOL");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EA8]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_EARTHY");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71E88]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_CLOUD_COVER");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EB0]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_GOLD_WARM");
    goto LABEL_33;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE71EB8]) & 1) != 0)
  {
    v4 = CFSTR("PHOTOEDIT_STYLE_CAST_LONG_GRAY");
    goto LABEL_33;
  }
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_ERROR, "PEAdjustmentUtilities: semanticStyleCastDisplayName - Unsupported cast %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = 0;
LABEL_37:

  return v7;
}

+ (id)semanticStyleCastForPHAdjustmentStyleCast:(signed __int16)a3
{
  int v3;
  id *v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 0x10)
  {
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_20D13D000, v5, OS_LOG_TYPE_ERROR, "PEAdjustmentUtilities: semanticStyleCastForPHAdjustmentStyleCast - Unsupported cast %hd", (uint8_t *)v7, 8u);
    }

    v4 = (id *)MEMORY[0x24BE71ED0];
  }
  else
  {
    v4 = (id *)qword_24C618580[(unsigned __int16)a3];
  }
  return *v4;
}

+ (id)adjustmentStyleCastDisplayName:(signed __int16)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "semanticStyleCastForPHAdjustmentStyleCast:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "semanticStyleCastDisplayName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
