@implementation MOEngagementAndSuggestionAnalyticsParams

+ (id)bundleSubTypeToAnalyticsSuggestionTypeMap
{
  NSMutableDictionary *v2;

  v2 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC7E8, &off_1002D9BD8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC800, &off_1002D9C08);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC818, &off_1002D9C80);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC830, &off_1002D9CF8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC848, &off_1002D9D58);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC860, &off_1002D9E00);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC878, &off_1002D9E78);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC890, &off_1002D9ED8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC8A8, &off_1002DA088);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC8C0, &off_1002DA190);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC8D8, &off_1002DA1D8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC8F0, &off_1002DA2E0);
  return v2;
}

+ (id)updateOnboardingStatusDictionaryKeys:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  _QWORD v9[4];
  id v10;
  NSMutableDictionary *v11;
  _QWORD v12[11];
  _QWORD v13[11];

  v12[0] = CFSTR("onboardingStatus");
  v12[1] = CFSTR("onboardingDurationBin");
  v13[0] = CFSTR("onboardingCompletion");
  v13[1] = CFSTR("onboardingDurationBin");
  v12[2] = CFSTR("settingSwitchActivity");
  v12[3] = CFSTR("settingSwitchCommunication");
  v13[2] = CFSTR("isActivitySettingsSwitchEnabled");
  v13[3] = CFSTR("isCommunicationSettingsSwitchEnabled");
  v12[4] = CFSTR("settingSwitchLocation");
  v12[5] = CFSTR("settingSwitchMedia");
  v13[4] = CFSTR("isSignificantLocationSettingsSwitchEnabled");
  v13[5] = CFSTR("isMediaSettingsSwitchEnabled");
  v12[6] = CFSTR("settingSwitchPeople");
  v12[7] = CFSTR("settingSwitchPhoto");
  v13[6] = CFSTR("isNearbyPeopleSettingsSwitchEnabled");
  v13[7] = CFSTR("isPhotoSettingsSwitchEnabled");
  v12[8] = CFSTR("settingSwitchStateOfMind");
  v12[9] = CFSTR("settingSwitchReflection");
  v13[8] = CFSTR("isStateOfMindSettingsSwitchEnabled");
  v13[9] = CFSTR("isReflectionSettingsSwitchEnabled");
  v12[10] = CFSTR("settingBroaderSwitchLocation");
  v13[10] = CFSTR("isBroadSystemLocationSettingsSwitchEnabled");
  v3 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __81__MOEngagementAndSuggestionAnalyticsParams_updateOnboardingStatusDictionaryKeys___block_invoke;
  v9[3] = &unk_1002B38B0;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 11));
  v4 = objc_opt_new(NSMutableDictionary);
  v11 = v4;
  v5 = v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = v11;
  v7 = v4;

  return v7;
}

void __81__MOEngagementAndSuggestionAnalyticsParams_updateOnboardingStatusDictionaryKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2));
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);

}

+ (id)aggregationWindowMap
{
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = &off_1002DA2F8;
  v3[1] = &off_1002D9BD8;
  v4[0] = &off_1002DA310;
  v4[1] = &off_1002DA328;
  v3[2] = &off_1002D9C08;
  v4[2] = &off_1002DA340;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3));
}

+ (id)suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap
{
  NSMutableDictionary *v2;

  v2 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC908, &off_1002DA2F8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC920, &off_1002D9BD8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC938, &off_1002D9C08);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC950, &off_1002D9D58);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC968, &off_1002D9C80);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_1002DC980, &off_1002D9CF8);
  return v2;
}

+ (unint64_t)getCharacterCountBin:(float)a3
{
  if (a3 == 0.0)
    return 1;
  if (a3 > 0.0 && a3 <= 10.0)
    return 2;
  if (a3 <= 10.0 || a3 > 200.0)
    return 4 * (a3 > 200.0);
  else
    return 3;
}

@end
