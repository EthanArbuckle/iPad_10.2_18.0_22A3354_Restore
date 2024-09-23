@implementation ECStrings

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  if ((id)objc_opt_class() == a1)
  {
    TCBundle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("h"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sDurationHourShortString;
    sDurationHourShortString = v2;

    TCBundle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("hours"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sDurationHourLongString;
    sDurationHourLongString = v4;

    TCBundle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("m"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)sDurationMinuteShortString;
    sDurationMinuteShortString = v6;

    TCBundle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("minutes"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)sDurationMinuteLongString;
    sDurationMinuteLongString = v8;

    TCBundle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("s"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)sDurationSecondShortString;
    sDurationSecondShortString = v10;

    TCBundle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("seconds"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)sDurationSecondLongString;
    sDurationSecondLongString = v12;

  }
}

@end
