@implementation AFClockTimer(SVXSpeechSynthesis)

- (id)svx_speakableDurationStringWithLanguageCode:()SVXSpeechSynthesis gender:
{
  id v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  void *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;

  v6 = a3;
  objc_msgSend(a1, "duration");
  v8 = (unint64_t)v7;
  v9 = (unint64_t)v7 / 0x3C;
  v10 = (unint64_t)(v7 / 60.0) % 0x3C;
  v11 = (unint64_t)(v7 / 3600.0);
  objc_msgSend(a1, "_getBundleUtils");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getSiriVOXFramework");
  v13 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v13;
  v56 = v12;
  if (v11)
  {
    v14 = v13;
    v52 = v9;
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
    v53 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_UNIT_HOUR_%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v14;
    v19 = v6;
    v20 = a4;
    objc_msgSend(v12, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v18, CFSTR("Clock"), v17, v6, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v21, v23);
    v54 = objc_claimAutoreleasedReturnValue();

    v10 = v53;
    v9 = v52;
  }
  else
  {
    v20 = a4;
    v19 = v6;
    v54 = 0;
  }
  v24 = v8 - 60 * v9;
  if (v10)
  {
    v25 = v10;
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_UNIT_MINUTE_%@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v55, CFSTR("Clock"), v28, v19, v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v29, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    if (v24)
      goto LABEL_12;
  }
  else
  {
    v32 = 0;
    if (v24)
      goto LABEL_12;
  }
  v33 = v32 != 0;
  if (v54 | v32)
  {
    v34 = (void *)v54;
    if (v54 && v32)
    {
      v35 = 0;
LABEL_18:
      v43 = v55;
      v44 = v56;
      objc_msgSend(v56, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v55, CFSTR("Clock"), CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_HOURS_MINUTES"), v19, v20);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_19;
    }
    v35 = 0;
    if (v54)
    {
      v43 = v55;
      v44 = v56;
LABEL_32:
      v49 = v34;
LABEL_37:
      v47 = v49;
      goto LABEL_22;
    }
    v43 = v55;
    v44 = v56;
LABEL_34:
    if (v33)
    {
      v49 = (id)v32;
    }
    else
    {
      v49 = v35;
      v35 = v49;
    }
    goto LABEL_37;
  }
LABEL_12:
  v36 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_UNIT_SECOND_%@"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v55, CFSTR("Clock"), v38, v19, v20);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", v39, v41);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)v54;
  v42 = v54 != 0;
  v33 = v32 != 0;
  if (!v32)
    v42 = 0;
  if (!v42 || !v35)
  {
    if (v42)
      goto LABEL_18;
    v43 = v55;
    v44 = v56;
    if (v54 && v35)
    {
      objc_msgSend(v56, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v55, CFSTR("Clock"), CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_HOURS_SECONDS"), v19, v20);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x24BDD17C8];
      v50 = v35;
      goto LABEL_20;
    }
    if (v32 && v35)
    {
      objc_msgSend(v56, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v55, CFSTR("Clock"), CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_MINUTES_SECONDS"), v19, v20);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v45, v32, v35, v51);
      goto LABEL_21;
    }
    if (v54)
      goto LABEL_32;
    goto LABEL_34;
  }
  v43 = v55;
  v44 = v56;
  objc_msgSend(v56, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v55, CFSTR("Clock"), CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_DURATION_HOURS_MINUTES_SECONDS"), v19, v20);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x24BDD17C8];
  v51 = v35;
LABEL_19:
  v50 = (void *)v32;
LABEL_20:
  objc_msgSend(v46, "stringWithFormat:", v45, v34, v50, v51);
LABEL_21:
  v47 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v47;
}

- (SVXBundleUtils)_getBundleUtils
{
  return +[SVXBundleUtils sharedInstance](SVXBundleUtils, "sharedInstance");
}

@end
