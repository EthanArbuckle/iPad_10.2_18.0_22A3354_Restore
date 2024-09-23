@implementation SDPommesFeature

+ (BOOL)isSearchCLIBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.search"));
}

+ (BOOL)isMailBundle:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.pommesctl"));

  return v4;
}

+ (BOOL)isPhotosBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
}

+ (BOOL)isSafariBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
}

+ (BOOL)isCalendarBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobilecal"));
}

+ (BOOL)isMessagesBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MobileSMS"));
}

+ (BOOL)isRemindersBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.reminders"));
}

+ (BOOL)isEventsBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.spotlight.events"));
}

+ (BOOL)usingPommesRankingForClientBundle:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.pommesctl")) & 1) != 0)
  {
    goto LABEL_3;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.argos.BlendABApp2")) & 1) != 0)
  {
LABEL_7:
    v4 = _os_feature_enabled_impl();
    goto LABEL_4;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.reminders")))
    {
      v4 = 0;
      goto LABEL_4;
    }
    goto LABEL_7;
  }
LABEL_3:
  v4 = 1;
LABEL_4:

  return v4;
}

+ (BOOL)usingRewritesForContextBundleIDs:(id)a3 clientBundleID:(id)a4 userQuery:(id)a5 indexSupportsRewrites:(BOOL)a6 isCounting:(BOOL)a7 embeddingsEnabled:(BOOL)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  int v21;

  v9 = a7;
  v10 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = v15;
  if (a8 || (unint64_t)objc_msgSend(v15, "length") > 0x1D)
  {
    v18 = 0;
  }
  else if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
    {
      v18 = 0;
LABEL_16:

      goto LABEL_7;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

    v18 = 0;
    if (!v21 && !v9 && v10)
    {
LABEL_14:
      if (!+[SDPommesFeature isMailBundle:](SDPommesFeature, "isMailBundle:", v14))
      {
        v18 = 1;
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "rangeOfCharacterFromSet:", v17) == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = 0;
    if (!v9 && v10)
      goto LABEL_14;
  }
LABEL_7:

  return v18;
}

+ (BOOL)purePommesL2RankingAllowedWithSectionBundle:(id)a3 clientBundle:(id)a4
{
  return 0;
}

+ (id)allBundleIDsUsingPommesRanking
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("com.apple.mobilemail"), CFSTR("com.apple.pommesctl"), CFSTR("com.apple.mobilecal"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilesafari"));
    objc_msgSend(v2, "addObject:", CFSTR("com.argos.BlendABApp2"));
  }
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilenotes"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.MobileSMS"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
  if (_os_feature_enabled_impl())
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.reminders"));
  if (_os_feature_enabled_impl())
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.spotlight.events"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

@end
