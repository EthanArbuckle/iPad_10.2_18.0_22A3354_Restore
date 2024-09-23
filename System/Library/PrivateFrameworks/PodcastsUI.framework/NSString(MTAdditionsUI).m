@implementation NSString(MTAdditionsUI)

+ (uint64_t)localizedStringWithNumber:()MTAdditionsUI
{
  return IMAccessibilityLocalizedNumber();
}

+ (id)prettyStringWithDuration:()MTAdditionsUI
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v1 = (uint64_t)a1;
  v2 = (uint64_t)a1 / 3600;
  v3 = (uint64_t)a1 / 60;
  v4 = v3 % 60;
  if ((uint64_t)a1 < 7200 || v4 != 1)
  {
    if (v1 >= 7200)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@ hours %@ min"), &stru_1EA0D7620, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IMAccessibilityLocalizedNumber();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IMAccessibilityLocalizedNumber();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v6, v13, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    if ((unint64_t)(v1 - 3600) <= 0xE0F && v4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v17;
      v18 = CFSTR("1 hour 1 min");
LABEL_12:
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_1EA0D7620, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if ((unint64_t)(v1 - 3600) > 0xE0F)
    {
      v2 = v1 - 60 * v3;
      if (v4 < 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v17;
        if (v2 != 1)
        {
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("%@ seconds"), &stru_1EA0D7620, 0);
          v30 = objc_claimAutoreleasedReturnValue();

          v31 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          IMAccessibilityLocalizedNumber();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", v30, v33);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = (void *)v30;
          goto LABEL_8;
        }
        v18 = CFSTR("1 second");
        goto LABEL_12;
      }
      if (v2 <= 0 && v4 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v17;
        v18 = CFSTR("1 min");
        goto LABEL_12;
      }
      if (v2 == 1 && v4 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v17;
        v18 = CFSTR("1 min 1 sec");
        goto LABEL_12;
      }
      if (v2 >= 1 && (unint64_t)v4 < 0xA)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v4 != 1)
        {
          objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("%@ min %@ sec"), &stru_1EA0D7620, 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          IMAccessibilityLocalizedNumber();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          IMAccessibilityLocalizedNumber();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", v6, v38, v40);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_8;
        }
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("1 min %@ sec"), &stru_1EA0D7620, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_4;
      }
      if (v2 > 29)
        ++v4;
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("%@ minutes"), &stru_1EA0D7620, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      IMAccessibilityLocalizedNumber();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v6, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("%@ hour %@ min"), &stru_1EA0D7620, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      IMAccessibilityLocalizedNumber();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      IMAccessibilityLocalizedNumber();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v6, v22, v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ hours 1 min"), &stru_1EA0D7620, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMAccessibilityLocalizedNumber();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
LABEL_8:

  return v10;
}

@end
