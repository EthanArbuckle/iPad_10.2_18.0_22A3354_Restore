@implementation SASportsMatchup(SiriUI)

- (uint64_t)siriui_isInTheFuture
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "status");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE82568]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE82560]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE82550]);
  }

  return v2;
}

- (id)siriui_localizedScheduleStatusForLeague:()SiriUI sport:showTimeIfToday:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;

  v7 = a4;
  objc_msgSend(a1, "status");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assistantUILocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82558]))
  {
    objc_msgSend(a1, "timeRemaining");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "periodDescription");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE825E0]) & 1) == 0 && objc_msgSend(v11, "length"))
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "siriUILocalizedStringForKey:", CFSTR("PERIOD_TIME_REMAINING_PAIR %@, %@"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@, %@"), 0, v12, v11);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v17 = v16;

LABEL_10:
LABEL_27:

      v12 = (id)v17;
      goto LABEL_28;
    }
    v24 = v12;
    v12 = v24;
LABEL_12:
    v17 = (uint64_t)v24;
    goto LABEL_27;
  }
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82568]))
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82548]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("FINAL_SCHEDULE_FORMAT");
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82540]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("CANCELED_SCHEDULE_FORMAT");
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82560]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("POSTPONED_SCHEDULE_FORMAT");
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82550]))
        goto LABEL_30;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("DELAYED_SCHEDULE_FORMAT");
    }
    objc_msgSend(v25, "siriUILocalizedStringForKey:", v27);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v12, "setLocale:", v10);
      objc_msgSend(v12, "setDoesRelativeDateFormatting:", 1);
      objc_msgSend(v12, "setTimeStyle:", 0);
      objc_msgSend(v12, "setDateStyle:", 2);
      objc_msgSend(v12, "setFormattingContext:", 2);
      v34 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(a1, "startTime");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromDate:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v34, "initWithFormat:", v11, v36);

      goto LABEL_27;
    }
LABEL_30:
    v12 = 0;
    goto LABEL_29;
  }
  v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v11, "setFormattingContext:", 2);
  objc_msgSend(a1, "timeTBD");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(a1, "startTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "sruif_isToday");

  if ((a5 & v21) == 1 && (v19 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "siriUILocalizedStringForKey:", CFSTR("SCHEDULE_DATE_FORMAT_TEMPLATE"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", v12, 0, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDateFormat:", v23);

    objc_msgSend(a1, "startTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((a5 & v21 & v19) == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "siriUILocalizedStringForKey:", CFSTR("TO_BE_DETERMINED"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v28 = v21 | v19;
  objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("EEE MMM d y"), 0, v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDateFormat:", v29);

  objc_msgSend(a1, "startTime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v30);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if ((v28 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "siriUILocalizedStringForKey:", CFSTR("SCHEDULE_DATE_FORMAT_TEMPLATE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", v14, 0, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDateFormat:", v32);

    objc_msgSend(a1, "startTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v12, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_28:

LABEL_29:
  return v12;
}

- (id)siriui_venueLocation
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "locationName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && objc_msgSend(v2, "length"))
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriUILocalizedStringForKey:", CFSTR("VENUE_LOCATION_FORMAT %@ %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "initWithFormat:", v6, v2, v3);

    v2 = v5;
LABEL_7:

    v2 = v7;
    goto LABEL_8;
  }
  if (!objc_msgSend(v2, "length") && objc_msgSend(v3, "length"))
  {
    v7 = v3;
    goto LABEL_7;
  }
LABEL_8:

  return v2;
}

- (id)siriui_channelsString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "tvChannels");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "siriUILocalizedStringForKey:", CFSTR("TV_SCHEDULE_LIST_JOINER"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsJoinedByString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriUILocalizedStringForKey:", CFSTR("TV_SCHEDULE_FORMAT %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v6, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)siriui_homeIsFirst
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "matchupOrder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE82538]);

  return v2;
}

- (id)siriui_firstEntity
{
  if ((objc_msgSend(a1, "siriui_homeIsFirst") & 1) != 0)
    objc_msgSend(a1, "homeEntity");
  else
    objc_msgSend(a1, "awayEntity");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)siriui_firstLineScores
{
  if ((objc_msgSend(a1, "siriui_homeIsFirst") & 1) != 0)
    objc_msgSend(a1, "homeLineScores");
  else
    objc_msgSend(a1, "awayLineScores");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)siriui_firstScore
{
  if ((objc_msgSend(a1, "siriui_homeIsFirst") & 1) != 0)
    objc_msgSend(a1, "homeScore");
  else
    objc_msgSend(a1, "awayScore");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)siriui_secondEntity
{
  if ((objc_msgSend(a1, "siriui_homeIsFirst") & 1) != 0)
    objc_msgSend(a1, "awayEntity");
  else
    objc_msgSend(a1, "homeEntity");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)siriui_secondLineScores
{
  if ((objc_msgSend(a1, "siriui_homeIsFirst") & 1) != 0)
    objc_msgSend(a1, "awayLineScores");
  else
    objc_msgSend(a1, "homeLineScores");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)siriui_secondScore
{
  if ((objc_msgSend(a1, "siriui_homeIsFirst") & 1) != 0)
    objc_msgSend(a1, "awayScore");
  else
    objc_msgSend(a1, "homeScore");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)siriui_teamVsTeam
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "homeEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriui_displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "awayEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriui_displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "siriui_homeIsFirst");
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v8, "siriUILocalizedStringForKey:", CFSTR("MATCHUP_VS_TITLE_FORMAT %1$@ %2$@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%1$@ %2$@"), 0, v3, v5);
  }
  else
  {
    objc_msgSend(v8, "siriUILocalizedStringForKey:", CFSTR("MATCHUP_AT_TITLE_FORMAT %1$@ %2$@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%1$@ %2$@"), 0, v5, v3);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
