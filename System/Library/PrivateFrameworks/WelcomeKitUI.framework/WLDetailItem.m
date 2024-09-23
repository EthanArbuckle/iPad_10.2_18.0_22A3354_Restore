@implementation WLDetailItem

- (WLDetailItem)initWithType:(int64_t)a3 count:(unint64_t)a4 secondaryText:(id)a5 alternativeTextUsed:(BOOL)a6 symbolFilled:(BOOL)a7 symbolTintColor:(id)a8
{
  _BOOL4 v9;
  id v12;
  id v13;
  WLDetailItem *v14;
  WLDetailItem *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v9 = a7;
  v12 = a5;
  v13 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WLDetailItem;
  v14 = -[WLDetailItem init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    -[WLDetailItem setSecondaryText:](v14, "setSecondaryText:", v12);
    -[WLDetailItem setSymbolTintColor:](v15, "setSymbolTintColor:", v13);
    switch(a3)
    {
      case 0:
        if (v9)
          v16 = CFSTR("message.fill");
        else
          v16 = CFSTR("message");
        goto LABEL_40;
      case 1:
        if (v9)
          v16 = CFSTR("person.2.fill");
        else
          v16 = CFSTR("person.2");
        goto LABEL_40;
      case 2:
        if (v9)
          v16 = CFSTR("person.2.fill");
        else
          v16 = CFSTR("person.2");
        goto LABEL_40;
      case 3:
        -[WLDetailItem setSymbol:](v15, "setSymbol:", CFSTR("calendar"));
        goto LABEL_48;
      case 4:
        if (v9)
          v16 = CFSTR("bookmark.fill");
        else
          v16 = CFSTR("bookmark");
        goto LABEL_40;
      case 5:
        if (v9)
          v16 = CFSTR("folder.fill");
        else
          v16 = CFSTR("folder");
        goto LABEL_40;
      case 6:
        if (v9)
          v16 = CFSTR("photo.fill");
        else
          v16 = CFSTR("photo");
        goto LABEL_40;
      case 7:
        if (v9)
          v16 = CFSTR("photo.fill");
        else
          v16 = CFSTR("photo");
        goto LABEL_40;
      case 8:
        if (v9)
          v16 = CFSTR("photo.fill.on.rectangle.fill");
        else
          v16 = CFSTR("photo.on.rectangle");
        goto LABEL_40;
      case 9:
        if (v9)
          v16 = CFSTR("waveform.circle.fill");
        else
          v16 = CFSTR("waveform.circle");
        goto LABEL_40;
      case 10:
        if (v9)
          v17 = CFSTR("app.badge.fill");
        else
          v17 = CFSTR("app.badge");
        goto LABEL_46;
      case 11:
        if (v9)
          v16 = CFSTR("envelope.fill");
        else
          v16 = CFSTR("envelope");
        goto LABEL_40;
      case 12:
        if (v9)
          v16 = CFSTR("app.badge.fill");
        else
          v16 = CFSTR("app.badge");
LABEL_40:
        -[WLDetailItem setSymbol:](v15, "setSymbol:", v16);
LABEL_48:
        WLLocalizedString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLDetailItem setText:](v15, "setText:", v19);

        break;
      case 14:
        -[WLDetailItem setSymbol:](v15, "setSymbol:", CFSTR("textformat.size"));
        goto LABEL_47;
      case 15:
        -[WLDetailItem setSymbol:](v15, "setSymbol:", CFSTR("dot.arrowtriangles.up.right.down.left.circle"));
        goto LABEL_47;
      case 16:
        if (v9)
          v17 = CFSTR("simcard.fill");
        else
          v17 = CFSTR("simcard");
LABEL_46:
        -[WLDetailItem setSymbol:](v15, "setSymbol:", v17);
LABEL_47:
        WLLocalizedString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLDetailItem setText:](v15, "setText:", v18);

        -[WLDetailItem setSecondaryText:](v15, "setSecondaryText:", 0);
        break;
      default:
        break;
    }
  }

  return v15;
}

- (WLDetailItem)initWithType:(int64_t)a3 secondaryText:(id)a4 detailText:(id)a5 showDetailDiscloureButton:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  WLDetailItem *v12;
  WLDetailItem *v13;
  void *v14;
  objc_super v16;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WLDetailItem;
  v12 = -[WLDetailItem init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    -[WLDetailItem setSecondaryText:](v12, "setSecondaryText:", v10);
    -[WLDetailItem setDetailText:](v13, "setDetailText:", v11);
    -[WLDetailItem setShowDetailDiscloureButton:](v13, "setShowDetailDiscloureButton:", v6);
    if ((unint64_t)a3 <= 0x10 && ((0x1DFFFu >> a3) & 1) != 0)
    {
      WLLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLDetailItem setText:](v13, "setText:", v14);

    }
  }

  return v13;
}

+ (id)order
{
  return &unk_24E1542E0;
}

+ (id)contexts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[17];
  _QWORD v24[19];

  v24[17] = *MEMORY[0x24BDAC8D0];
  v23[0] = &unk_24E1535E0;
  v3 = a3;
  objc_msgSend(v3, "message");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = &unk_24E1535F8;
  objc_msgSend(v3, "contact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = &unk_24E153610;
  objc_msgSend(v3, "callHistory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = &unk_24E153628;
  objc_msgSend(v3, "calendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = &unk_24E153640;
  objc_msgSend(v3, "bookmark");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = &unk_24E153658;
  objc_msgSend(v3, "file");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  v23[6] = &unk_24E153670;
  objc_msgSend(v3, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = &unk_24E153688;
  objc_msgSend(v3, "video");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = &unk_24E1536A0;
  objc_msgSend(v3, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v4;
  v23[9] = &unk_24E1536B8;
  objc_msgSend(v3, "voiceMemo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v5;
  v23[10] = &unk_24E1536D0;
  objc_msgSend(v3, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v6;
  v23[11] = &unk_24E1536E8;
  objc_msgSend(v3, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v7;
  v23[12] = &unk_24E153700;
  objc_msgSend(v3, "placeholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v8;
  v23[13] = &unk_24E153730;
  objc_msgSend(v3, "accessibilitySetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v9;
  v23[14] = &unk_24E153748;
  objc_msgSend(v3, "displaySetting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v10;
  v23[15] = &unk_24E153760;
  objc_msgSend(v3, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v11;
  v23[16] = &unk_24E153718;
  objc_msgSend(v3, "sim");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[16] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)items:(id)a3 size:(unint64_t *)a4
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  WLDetailItem *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  WLDetailItem *v19;
  uint64_t v20;
  void *v21;
  WLDetailItem *v22;
  unint64_t *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id obj;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v24 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[WLDetailItem order](WLDetailItem, "order");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  +[WLDetailItem contexts:](WLDetailItem, "contexts:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v6, "setNumberStyle:", 1);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v33)
  {
    v32 = 0;
    goto LABEL_30;
  }
  v32 = 0;
  v30 = *(_QWORD *)v35;
  v7 = 0x24BDD1000uLL;
  do
  {
    for (i = 0; i != v33; ++i)
    {
      if (*(_QWORD *)v35 != v30)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      v10 = objc_msgSend(v9, "integerValue", v24);
      objc_msgSend(v31, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "importCount") || objc_msgSend(v11, "importErrorCount"))
      {
        objc_msgSend(*(id *)(v7 + 1760), "numberWithUnsignedLongLong:", objc_msgSend(v11, "importCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringFromNumber:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == 12 && !objc_msgSend(v11, "importCount") && objc_msgSend(v11, "importErrorCount"))
        {

          v13 = 0;
        }
        if (objc_msgSend(v11, "importCount"))
          v14 = 1;
        else
          v14 = (unint64_t)(v10 - 14) >= 3;
        if (v14)
        {
          v15 = -[WLDetailItem initWithType:count:secondaryText:alternativeTextUsed:symbolFilled:symbolTintColor:]([WLDetailItem alloc], "initWithType:count:secondaryText:alternativeTextUsed:symbolFilled:symbolTintColor:", v10, objc_msgSend(v11, "importCount"), v13, 0, 1, 0);
          objc_msgSend(v28, "addObject:", v15);
        }
        else
        {
          v15 = 0;
        }
        if (objc_msgSend(v11, "importErrorCount"))
        {
          v16 = v7;
          objc_msgSend(*(id *)(v7 + 1760), "numberWithUnsignedLongLong:", objc_msgSend(v11, "importErrorCount"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringFromNumber:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = [WLDetailItem alloc];
          v20 = objc_msgSend(v11, "importErrorCount");
          objc_msgSend(MEMORY[0x24BDF6950], "tertiaryLabelColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[WLDetailItem initWithType:count:secondaryText:alternativeTextUsed:symbolFilled:symbolTintColor:](v19, "initWithType:count:secondaryText:alternativeTextUsed:symbolFilled:symbolTintColor:", v10, v20, v18, 1, 0, v21);

          if (v10 == 10 || v10 == 12)
          {
            v7 = v16;
LABEL_25:

            goto LABEL_26;
          }
          objc_msgSend(v27, "addObject:", v22);
          v7 = v16;
        }
        else
        {
          v18 = v13;
          v22 = v15;
        }
        v32 += objc_msgSend(v11, "size");
        goto LABEL_25;
      }
LABEL_26:

    }
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  }
  while (v33);
LABEL_30:

  objc_msgSend(v25, "addObject:", v28);
  if (objc_msgSend(v27, "count"))
    objc_msgSend(v25, "addObject:", v27);
  if (v24)
    *v24 = v32;

  return v25;
}

+ (id)items:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WLDetailItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  id obj;
  id v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[WLDetailItem order](WLDetailItem, "order");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v3;
  +[WLDetailItem contexts:](WLDetailItem, "contexts:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24E1536E8, &unk_24E153760, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24E153730, &unk_24E153748, &unk_24E153718, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24E153670, &unk_24E153688, &unk_24E1536B8, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v37, "setNumberStyle:", 1);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v7)
  {
    v8 = v7;
    v49 = *(_QWORD *)v51;
    v40 = v6;
    v41 = v5;
    do
    {
      v9 = 0;
      v45 = v8;
      do
      {
        if (*(_QWORD *)v51 != v49)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "integerValue");
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "importCount") || objc_msgSend(v12, "importErrorCount"))
        {
          if (objc_msgSend(v48, "containsObject:", v10))
          {
            if (v11 == 16 && objc_msgSend(v12, "importErrorCount"))
            {
              WLLocalizedString();
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DETAIL_ITEM_WARNING_DESCRIPTION_FOR_SIM"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              WLLocalizedString();
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = -[WLDetailItem initWithType:secondaryText:detailText:showDetailDiscloureButton:]([WLDetailItem alloc], "initWithType:secondaryText:detailText:showDetailDiscloureButton:", 16, v13, v15, 1);
              objc_msgSend(v44, "addObject:", v16);

LABEL_17:
              goto LABEL_18;
            }
            WLLocalizedString();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (objc_msgSend(v12, "importErrorCount") && (objc_msgSend(v6, "containsObject:", v10) & 1) == 0)
            {
              v20 = (void *)MEMORY[0x24BDD17C8];
              WLLocalizedString();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v12, "importErrorCount") + objc_msgSend(v12, "importCount"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = objc_alloc_init(MEMORY[0x24BDD16A8]);
              +[WLDetailItem importDescriptionForType:import:total:](WLDetailItem, "importDescriptionForType:import:total:", v11, objc_msgSend(v12, "importCount"), objc_msgSend(v12, "importErrorCount") + objc_msgSend(v12, "importCount"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v23;
              if (objc_msgSend(v23, "length"))
              {
                objc_msgSend(v22, "appendString:", v23);
              }
              else
              {
                v39 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DETAIL_ITEM_WARNING_DESCRIPTION_TRANFERRED_%lld_%lld"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                WLLocalizedString();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "localizedStringWithFormat:", v25, objc_msgSend(v12, "importCount"), objc_msgSend(v12, "importErrorCount") + objc_msgSend(v12, "importCount"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "appendString:", v26);

              }
              objc_msgSend(v22, "appendString:", CFSTR("\n\n"));
              if (objc_msgSend(v42, "containsObject:", v10))
              {
                v27 = (void *)MEMORY[0x24BDD17C8];
                WLLocalizedString();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "localizedStringWithFormat:", v28, objc_msgSend(v12, "importErrorCount"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "appendString:", v29);
              }
              else
              {
                v30 = (void *)MEMORY[0x24BDD17C8];
                if (v11 == 8)
                  v31 = CFSTR("DETAIL_ITEM_WARNING_DESCRITPION_IMPORTED_PHOTO_ALBUM_%lld");
                else
                  v31 = CFSTR("DETAIL_ITEM_WARNING_DESCRITPION_IMPORTED_%lld");
                objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", v31);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                WLLocalizedString();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "localizedStringWithFormat:", v29, objc_msgSend(v12, "importErrorCount"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "appendString:", v32);

              }
              v6 = v40;
              v5 = v41;

              objc_msgSend(v22, "appendString:", CFSTR(" "));
              WLLocalizedString();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "appendString:", v33);

              v16 = -[WLDetailItem initWithType:secondaryText:detailText:showDetailDiscloureButton:]([WLDetailItem alloc], "initWithType:secondaryText:detailText:showDetailDiscloureButton:", v11, v13, v22, 1);
              objc_msgSend(v44, "addObject:", v16);

              v8 = v45;
              goto LABEL_17;
            }
            v17 = (void *)MEMORY[0x24BDD17C8];
            WLLocalizedString();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v12, "importCount");
            v19 = v17;
            v8 = v45;
            objc_msgSend(v19, "localizedStringWithFormat:", v18, v36);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v16 = -[WLDetailItem initWithType:secondaryText:detailText:showDetailDiscloureButton:]([WLDetailItem alloc], "initWithType:secondaryText:detailText:showDetailDiscloureButton:", v11, v13, 0, 0);
          objc_msgSend(v47, "addObject:", v16);
          goto LABEL_17;
        }
LABEL_18:

        ++v9;
      }
      while (v8 != v9);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      v8 = v34;
    }
    while (v34);
  }

  objc_msgSend(v44, "addObjectsFromArray:", v47);
  return v44;
}

+ (id)importDescriptionForType:(int64_t)a3 import:(unint64_t)a4 total:(unint64_t)a5
{
  void *v5;
  void *v8;
  void *v9;

  v5 = 0;
  switch(a3)
  {
    case 0:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 1:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 2:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 3:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 4:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 5:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 6:
    case 7:
    case 8:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 9:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 10:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 11:
      v8 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    case 14:
    case 15:
      v8 = (void *)MEMORY[0x24BDD17C8];
LABEL_13:
      WLLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, a4, a5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v5;
  }
  return v5;
}

- (BOOL)showDetailDiscloureButton
{
  return self->_showDetailDiscloureButton;
}

- (void)setShowDetailDiscloureButton:(BOOL)a3
{
  self->_showDetailDiscloureButton = a3;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)symbolTintColor
{
  return self->_symbolTintColor;
}

- (void)setSymbolTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_symbolTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolTintColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
}

@end
