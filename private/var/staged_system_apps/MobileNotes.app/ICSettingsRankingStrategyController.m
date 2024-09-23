@implementation ICSettingsRankingStrategyController

- (id)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier"));
  objc_msgSend(v4, "setProperty:forKey:", &__kCFBooleanTrue, PSIsRadioGroupKey);
  v5 = ICInternalSettingsDomain(objc_msgSend(v3, "addObject:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchRankingStrategySwitch ICSearchRankingStrategyDisplayNames](ICSearchRankingStrategySwitch, "ICSearchRankingStrategyDisplayNames"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    v10 = PSDefaultsKey;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchRankingStrategySwitch ICSearchRankingStrategyDisplayNames](ICSearchRankingStrategySwitch, "ICSearchRankingStrategyDisplayNames"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v9));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSettingsRankingStrategyController stateSpecifierNamed:state:group:](self, "stateSpecifierNamed:state:group:", v12, v9, v4));

      objc_msgSend(v13, "setProperty:forKey:", v6, v10);
      objc_msgSend(v3, "addObject:", v13);

      ++v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchRankingStrategySwitch ICSearchRankingStrategyDisplayNames](ICSearchRankingStrategySwitch, "ICSearchRankingStrategyDisplayNames"));
      v15 = objc_msgSend(v14, "count");

    }
    while (v9 < (unint64_t)v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier"));
  objc_msgSend(v16, "setProperty:forKey:", CFSTR("Bucket Boundaries:\n1\t9.36 minutes\n2\t20.36 minutes\n3\t44.30 minutes\n4\t1.61 hours\n5\t3.50 hours\n6\t7.61 hours\n7\t16.55 hours\n8\t1.50 days\n9\t3.27 days\n10\t1.02 weeks\n11\t2.21 weeks\n12\t1.11 months\n13\t2.41 months\n14\t5.24 months\n15\t0.95 years\n16\t2.07 years\n17\t4.50 years\n18\t9.79 years"), PSFooterTextGroupKey);
  objc_msgSend(v3, "addObject:", v16);
  -[ICSettingsRankingStrategyController setSpecifiers:](self, "setSpecifiers:", v3);

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICSettingsRankingStrategyController;
  v7 = a4;
  -[ICSettingsRankingStrategyController tableView:didSelectRowAtIndexPath:](&v19, "tableView:didSelectRowAtIndexPath:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSettingsRankingStrategyController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7, v19.receiver, v19.super_class));

  v9 = objc_opt_class(NSDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v11 = ICDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = objc_opt_class(NSNumber);
  v14 = kICSearchRankingCurrentStrategyKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kICSearchRankingCurrentStrategyKey));
  v16 = ICDynamicCast(v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v17)
  {
    +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", v17, v14);
  }
  else
  {
    v18 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100404CE8((uint64_t)self, a2, v18);

  }
  -[ICSettingsRankingStrategyController reloadSpecifiers](self, "reloadSpecifiers");

}

- (id)stateSpecifierNamed:(id)a3 state:(unint64_t)a4 group:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, self, 0, 0, 0, 3, 0));
  v10 = kICSearchRankingCurrentStrategyKey;
  v17 = kICSearchRankingCurrentStrategyKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v18 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  objc_msgSend(v9, "setUserInfo:", v12);

  v13 = +[ICSearchRankingStrategySwitch defaultStrategy](ICSearchRankingStrategySwitch, "defaultStrategy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", v10));
  v15 = v14;
  if (v14)
    v13 = objc_msgSend(v14, "unsignedIntegerValue");
  if (v13 == (id)a4)
    objc_msgSend(v8, "setProperty:forKey:", v9, PSRadioGroupCheckedSpecifierKey);

  return v9;
}

@end
