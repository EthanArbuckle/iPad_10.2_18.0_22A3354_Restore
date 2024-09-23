@implementation PKEventTicketFaceBucketsFactory

+ (id)headerFieldsForPass:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSDate *v9;
  NSDate *v10;
  void *v11;
  void *v12;
  NSTimeZone *v13;
  NSTimeZone *v14;
  NSDate *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D66F00]);
  objc_msgSend(v4, "setType:", 0);
  v5 = (id)*MEMORY[0x1E0D6A840];
  objc_msgSend(v3, "eventDateInfoForSemanticKey:", *MEMORY[0x1E0D6A8A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v3, "dateForSemanticKey:", v5);
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v6, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v13 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v3, "dateForSemanticKey:", *MEMORY[0x1E0D6A838]);
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKey:", v5);
  if (v10)
  {
    PKMediumDayAndMonthStringFromDate(v10, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v25 = v5;
      objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTimeZone:", v14);
      v18 = objc_msgSend(v17, "component:fromDate:", 4, v10);
      if (v18 == objc_msgSend(v17, "component:fromDate:", 4, v15))
      {
        PKDateRangeStringFromDateToDate(v10, v15, 0, 0, 0, v14);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PKMediumDayAndMonthStringFromDate(v15, v14);
        v20 = objc_claimAutoreleasedReturnValue();
        PKLocalizedTicketingString(CFSTR("LOCALIZED_DATE_RANGE_FORMAT"), CFSTR("%@%@"), v16, v20);
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v20;
      }

      v16 = (void *)v19;
      v5 = v25;
    }
    if ((objc_msgSend(v6, "ignoreTimeComponents") & 1) == 0)
    {
      PKTimeStringFromDate(v10, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLabel:", v21);

    }
    objc_msgSend(v16, "pk_uppercaseStringForPreferredLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnformattedValue:", v22);

  }
  v26[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)primaryFieldsForPass:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PKEventTicketFaceBucketsFactory secondaryFieldsForPass:](PKEventTicketFaceBucketsFactory, "secondaryFieldsForPass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 1)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D66F00]);
    objc_msgSend(v7, "setType:", 1);
    v8 = (id)*MEMORY[0x1E0D6A910];
    objc_msgSend(v3, "stringForSemanticKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v16 = (id)*MEMORY[0x1E0D6A928];

      objc_msgSend(v3, "stringForSemanticKey:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v10 = (void *)v17;
        v8 = v16;
        goto LABEL_13;
      }
      v8 = (id)*MEMORY[0x1E0D6A9E8];

      objc_msgSend(v3, "stringForSemanticKey:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
LABEL_13:
    objc_msgSend(v7, "setKey:", v8);
    objc_msgSend(v7, "setUnformattedValue:", v10);
    v21 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  if ((unint64_t)v5 <= 3)
  {
    v7 = (id)*MEMORY[0x1E0D6A900];
    objc_msgSend(v3, "seatingInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstSeat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && (objc_msgSend(v11, "type"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (id)v13;
    }
    else
    {
      v14 = (id)*MEMORY[0x1E0D6AA88];

      objc_msgSend(v3, "stringForSemanticKey:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v8 = (id)v15;
        v7 = v14;
      }
      else
      {
        v7 = (id)*MEMORY[0x1E0D6A918];

        objc_msgSend(v3, "stringForSemanticKey:", v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (!v8 && (unint64_t)v5 <= 2)
        {
          v18 = (id)*MEMORY[0x1E0D6A9E8];

          objc_msgSend(v3, "stringForSemanticKey:", v18);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          v7 = v18;
        }
        if (!v8)
          goto LABEL_20;
      }
    }
    v19 = objc_alloc_init(MEMORY[0x1E0D66F00]);
    objc_msgSend(v19, "setType:", 1);
    objc_msgSend(v19, "setKey:", v7);
    objc_msgSend(v19, "setUnformattedValue:", v8);
    if (v19)
    {
      v22[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      goto LABEL_22;
    }
LABEL_20:
    v6 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_21;
  }
  v6 = (void *)MEMORY[0x1E0C9AA60];
LABEL_23:

  return v6;
}

+ (id)secondaryFieldsForPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;

  v3 = a3;
  objc_msgSend(v3, "seatingInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstSeat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "intersectsAttributes:", 31))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "designation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *MEMORY[0x1E0D6A8E8];
      v9 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v9, "setType:", 2);
      objc_msgSend(v9, "setTextAlignment:", 1);
      objc_msgSend(v9, "setKey:", v8);
      PKLocalizedTicketingString(CFSTR("LABEL_SEAT_NUMBER"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLabel:", v10);

      objc_msgSend(v7, "pk_uppercaseStringForPreferredLocale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUnformattedValue:", v11);

      objc_msgSend(v6, "addObject:", v9);
    }
    objc_msgSend(v5, "row");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *MEMORY[0x1E0D6A8F0];
      v14 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v14, "setType:", 2);
      objc_msgSend(v14, "setTextAlignment:", 1);
      objc_msgSend(v14, "setKey:", v13);
      PKLocalizedTicketingString(CFSTR("LABEL_SEAT_ROW"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLabel:", v15);

      objc_msgSend(v12, "pk_uppercaseStringForPreferredLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUnformattedValue:", v16);

      objc_msgSend(v6, "addObject:", v14);
    }
    objc_msgSend(v5, "section");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = *MEMORY[0x1E0D6A8F8];
      v19 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v19, "setType:", 2);
      objc_msgSend(v19, "setTextAlignment:", 1);
      objc_msgSend(v19, "setKey:", v18);
      PKLocalizedTicketingString(CFSTR("LABEL_SEAT_SECTION"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLabel:", v20);

      objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setUnformattedValue:", v21);

      objc_msgSend(v6, "addObject:", v19);
    }
    objc_msgSend(v5, "aisle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = *MEMORY[0x1E0D6A8D8];
      v24 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v24, "setType:", 2);
      objc_msgSend(v24, "setTextAlignment:", 1);
      objc_msgSend(v24, "setKey:", v23);
      PKLocalizedTicketingString(CFSTR("LABEL_SEAT_AISLE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setLabel:", v25);

      objc_msgSend(v22, "pk_uppercaseStringForPreferredLocale");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setUnformattedValue:", v26);

      objc_msgSend(v6, "addObject:", v24);
    }
    objc_msgSend(v5, "level");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = *MEMORY[0x1E0D6A8E0];
      v29 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v29, "setType:", 2);
      objc_msgSend(v29, "setTextAlignment:", 1);
      objc_msgSend(v29, "setKey:", v28);
      PKLocalizedTicketingString(CFSTR("LABEL_SEAT_LEVEL"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLabel:", v30);

      objc_msgSend(v27, "pk_uppercaseStringForPreferredLocale");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setUnformattedValue:", v31);

      objc_msgSend(v6, "addObject:", v29);
    }
    v32 = *MEMORY[0x1E0D6AAA0];
    objc_msgSend(v3, "stringForSemanticKey:", *MEMORY[0x1E0D6AAA0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v34, "setType:", 2);
      objc_msgSend(v34, "setTextAlignment:", 1);
      objc_msgSend(v34, "setKey:", v32);
      PKLocalizedTicketingString(CFSTR("LABEL_ENTRANCE_PORTAL"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setLabel:", v35);

      objc_msgSend(v33, "pk_uppercaseStringForPreferredLocale");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setUnformattedValue:", v36);

      objc_msgSend(v6, "addObject:", v34);
    }
    v37 = *MEMORY[0x1E0D6AA90];
    objc_msgSend(v3, "stringForSemanticKey:", *MEMORY[0x1E0D6AA90]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v39, "setType:", 2);
      objc_msgSend(v39, "setTextAlignment:", 1);
      objc_msgSend(v39, "setKey:", v37);
      PKLocalizedTicketingString(CFSTR("LABEL_ENTRANCE_DOOR"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setLabel:", v40);

      objc_msgSend(v38, "pk_uppercaseStringForPreferredLocale");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setUnformattedValue:", v41);

      objc_msgSend(v6, "addObject:", v39);
    }
    v42 = *MEMORY[0x1E0D6AA98];
    objc_msgSend(v3, "stringForSemanticKey:", *MEMORY[0x1E0D6AA98]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = objc_alloc_init(MEMORY[0x1E0D66F00]);
      objc_msgSend(v44, "setType:", 2);
      objc_msgSend(v44, "setTextAlignment:", 1);
      objc_msgSend(v44, "setKey:", v42);
      PKLocalizedTicketingString(CFSTR("LABEL_ENTRANCE_GATE"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setLabel:", v45);

      objc_msgSend(v43, "pk_uppercaseStringForPreferredLocale");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setUnformattedValue:", v46);

      objc_msgSend(v6, "addObject:", v44);
    }
    v47 = objc_msgSend(v6, "count");
    if (v47 >= 5)
      objc_msgSend(v6, "removeObjectsInRange:", 4, v47 - 4);

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

+ (id)auxiliaryFieldsForPass:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D66F00]);
  objc_msgSend(v4, "setType:", 3);
  v5 = (id)*MEMORY[0x1E0D6AAA8];
  objc_msgSend(v3, "stringForSemanticKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_2;
  v8 = (id)*MEMORY[0x1E0D6AAB8];

  objc_msgSend(v3, "stringForSemanticKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v5 = (id)*MEMORY[0x1E0D6AAC0];

    objc_msgSend(v3, "stringForSemanticKey:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_2:
    v7 = (void *)v6;
    goto LABEL_5;
  }
  v7 = (void *)v9;
  v5 = v8;
LABEL_5:
  objc_msgSend(v4, "setKey:", v5);
  objc_msgSend(v4, "setUnformattedValue:", v7);
  objc_msgSend(v3, "stringForSemanticKey:", *MEMORY[0x1E0D6A908]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "pk_capitalizedStringForPreferredLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setLabel:", v12);
  }
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
