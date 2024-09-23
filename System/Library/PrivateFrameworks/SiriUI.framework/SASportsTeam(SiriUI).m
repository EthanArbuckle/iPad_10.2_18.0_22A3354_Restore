@implementation SASportsTeam(SiriUI)

- (id)siriui_displayName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "league");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "displayTeamLocationOverName") & 1) != 0)
    objc_msgSend(a1, "location");
  else
    objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)siriui_displayNameAndLocation
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "league");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayTeamLocationOverName");

  if (v4)
  {
    v5 = v2;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "siriUILocalizedStringForKey:", CFSTR("ROSTER_NAME_AND_LOCATION_FORMAT %@ %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "initWithFormat:", v8, v2, v9);

  }
  return v5;
}

- (void)siriui_enumerateEntitiesWithGroupHandler:()SiriUI teamHandler:athleteHandler:
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
    v9[2](v9, a1);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "athletes", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "siriui_enumerateEntitiesWithGroupHandler:teamHandler:athleteHandler:", v8, v9, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (id)siriui_localizedSnippetColumnHeader:()SiriUI
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825C0]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("W");
LABEL_26:
    objc_msgSend(v5, "siriUILocalizedStringForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82580]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("L");
    goto LABEL_26;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825B0]))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82590]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("OTL");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825A8]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PTS");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82570]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("GB");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825A0]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("GF");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82598]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("GA");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825B8]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PCT");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82578]))
      {
        v14 = 0;
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("LOC");
    }
    goto LABEL_26;
  }
  objc_msgSend(a1, "league");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE825E8]) & 1) == 0)
  {

    goto LABEL_12;
  }
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("mls"));

  if ((v10 & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("T");
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = CFSTR("D");
LABEL_13:
  objc_msgSend(v11, "siriUILocalizedStringForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
LABEL_28:

  return v14;
}

- (id)_siriui_sportsValueForStandingsSnippetColumn:()SiriUI
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82588]))
  {
    objc_msgSend(a1, "name");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82578]))
  {
    objc_msgSend(a1, "location");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825C0]))
  {
    objc_msgSend(a1, "wins");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82580]))
  {
    objc_msgSend(a1, "losses");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825B0]))
  {
    objc_msgSend(a1, "ties");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82590]))
  {
    objc_msgSend(a1, "overtimeLosses");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825A8]))
  {
    objc_msgSend(a1, "points");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82570]))
  {
    objc_msgSend(a1, "gamesBehind");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825A0]))
  {
    objc_msgSend(a1, "pointsFor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82598]))
  {
    objc_msgSend(a1, "pointsAgainst");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE825B8]))
    {
      v6 = 0;
      goto LABEL_24;
    }
    objc_msgSend(a1, "winPercentage");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_24:

  return v6;
}

- (id)siriui_textForSnippetColumn:()SiriUI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!v4
    || (objc_msgSend(a1, "_siriui_sportsValueForStandingsSnippetColumn:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "statistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)siriui_localizedQualificationPositionFormatString
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(a1, "qualificationPosition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE825D8]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("QUALIFICATION_POSITION_FORMAT_PLAYOFFS");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE825D0]))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("QUALIFICATION_POSITION_FORMAT_DIVISION");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE825C8]))
    {
      v5 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("QUALIFICATION_POSITION_FORMAT_CONFERENCE");
  }
  objc_msgSend(v2, "siriUILocalizedStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v5;
}

@end
