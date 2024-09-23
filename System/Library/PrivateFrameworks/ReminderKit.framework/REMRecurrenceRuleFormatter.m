@implementation REMRecurrenceRuleFormatter

+ (id)naturalLanguageDescriptionForRecurrenceRule:(id)a3 withStartDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v5 = a4;
  v6 = a3;
  v17 = objc_msgSend(v6, "frequency");
  v7 = objc_msgSend(v6, "interval");
  objc_msgSend(v6, "daysOfTheWeek");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daysOfTheMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "monthsOfTheYear");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weeksOfTheYear");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daysOfTheYear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPositions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recurrenceEnd");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "naturalLanguageDescriptionForFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:withStartDate:", v17, v7, v8, v9, v10, v11, v12, v13, v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)naturalLanguageDescriptionForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11 withStartDate:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  __objc2_prot_list **p_prots;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int64_t v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int64_t v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int64_t v80;
  int64_t v81;
  void *v82;
  const __CFString *v83;
  const __CFString *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  void *v90;
  uint64_t v91;
  int64_t v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  uint64_t v96;
  int64_t v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  unint64_t v101;
  unint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  int v106;
  int v107;
  __objc2_prot_list **v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  const __CFString *v118;
  const __CFString *v119;
  int64_t v120;
  int64_t v121;
  int64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  unint64_t v136;
  id v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;

  v17 = a5;
  v144 = a6;
  v18 = a7;
  v138 = a8;
  v19 = a9;
  v143 = a10;
  v140 = a11;
  v20 = a12;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v20;
  objc_msgSend(v21, "components:fromDate:", 536, v20);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  p_prots = &OBJC_PROTOCOL___TTMergeableStringIDTracker.prots;
  if (!naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableWeekDayArray)
  {
    objc_msgSend(a1, "_readableWeekDays");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableWeekDayArray;
    naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableWeekDayArray = v23;

  }
  if (!naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray)
  {
    objc_msgSend(a1, "_readableMonths");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray;
    naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray = v25;

  }
  v27 = v143;
  v145 = v18;
  switch(a3)
  {
    case 0:
      v28 = (void *)MEMORY[0x1E0CB3940];
      v29 = a4;
      if (a4 == 1)
      {
        v30 = CFSTR("Event will occur every day.");
        goto LABEL_21;
      }
      v63 = CFSTR("Event will occur every %lu days.");
      goto LABEL_72;
    case 1:
      if (!v17
        || objc_msgSend(v17, "count") == 1
        && (objc_msgSend(v17, "objectAtIndex:", 0),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = objc_msgSend(v31, "dayOfTheWeek"),
            v33 = objc_msgSend(v141, "weekday"),
            v31,
            v32 == v33))
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = a4;
        if (a4 == 1)
        {
          v30 = CFSTR("Event will occur every week.");
          goto LABEL_21;
        }
        v63 = CFSTR("Event will occur every %lu weeks.");
        goto LABEL_72;
      }
      if (a4 != 1)
      {
        v81 = a4;
        v82 = (void *)MEMORY[0x1E0CB3940];
        v83 = CFSTR("Event will occur every %lu weeks on %@.");
        v84 = &stru_1E67FB1F0;
        v38 = v142;
        v85 = v142;
        goto LABEL_80;
      }
      switch(objc_msgSend((id)objc_opt_class(), "daysTypeForDayArray:", v17))
      {
        case 0:
        case 3:
          v64 = (void *)MEMORY[0x1E0CB3940];
          v38 = v142;
          objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every week on %@."), &stru_1E67FB1F0, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v17);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "stringWithFormat:", v39, v65);
          v66 = objc_claimAutoreleasedReturnValue();
          goto LABEL_82;
        case 1:
          v119 = CFSTR("Event will occur every day.");
          break;
        case 2:
          v119 = CFSTR("Event will occur every weekday.");
          break;
        default:
          v36 = 0;
          goto LABEL_18;
      }
      v38 = v142;
      objc_msgSend(v142, "localizedStringForKey:value:table:", v119, &stru_1E67FB1F0, 0);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_75;
    case 2:
      if (objc_msgSend(v18, "count"))
      {
        if (objc_msgSend(v18, "count"))
        {
LABEL_15:
          if (objc_msgSend(v18, "count") == 1)
          {
            objc_msgSend(v18, "objectAtIndex:", 0);
            a3 = objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend((id)a3, "integerValue");
            v35 = v34 == objc_msgSend(v141, "month");

          }
          else
          {
            v35 = 0;
          }
          if (!objc_msgSend(v17, "count") && (!objc_msgSend(v18, "count") || v35))
          {
            v41 = (void *)MEMORY[0x1E0CB3940];
            v38 = v142;
            if (a4 == 1)
            {
              objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every year."), &stru_1E67FB1F0, 0);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every %lu years."), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = a4;
            }
            objc_msgSend(v41, "localizedStringWithFormat:", v42, v123);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v37 = v138;
            v27 = v143;
            goto LABEL_152;
          }
          v128 = v19;
          v130 = v17;
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v18, "count");
          if (v43)
          {
            v44 = v43;
            v45 = 0;
            while (1)
            {
              objc_msgSend(v18, "objectAtIndex:", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v46;
              if (v45)
                break;
              if (objc_msgSend(v46, "integerValue") < 1 || objc_msgSend(v47, "integerValue") >= 13)
              {
                objc_msgSend(v146, "appendString:", CFSTR("???"));
              }
              else
              {
                objc_msgSend((id)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray, "objectAtIndex:", objc_msgSend(v47, "integerValue") - 1);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v146, "appendString:", v53);

              }
LABEL_53:

              if (v44 == ++v45)
                goto LABEL_54;
            }
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            if (v45 + 1 >= v44)
            {
              if (v44 == 2)
              {
                objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format for a list with two terms.  The last part of a list: X and Y. Here %@ is 'Y'"), CFSTR(" and %@"), 0);
                v50 = objc_claimAutoreleasedReturnValue();
                v52 = 0;
                v51 = 1;
                v134 = v49;
                v135 = (void *)v50;
              }
              else
              {
                objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format for a list with three or more items.  The last part of a list: X, Y, and Z. Here %@ is 'Z'"), CFSTR(", and %@"), 0);
                v50 = objc_claimAutoreleasedReturnValue();
                v51 = 0;
                v52 = 1;
                v132 = v49;
                v133 = (void *)v50;
              }
            }
            else
            {
              objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR(", %@"), &stru_1E67FB1F0, 0);
              v50 = objc_claimAutoreleasedReturnValue();
              v51 = 0;
              v52 = 0;
              v27 = v49;
              a3 = v50;
            }
            if (objc_msgSend(v47, "integerValue") < 1 || objc_msgSend(v47, "integerValue") >= 13)
            {
              objc_msgSend(v146, "appendFormat:", v50, CFSTR("???"));
              if (!v52)
              {
LABEL_48:
                if (v51)
                {

                }
                if (v45 + 1 < v44)
                {

                }
                v18 = v145;
                goto LABEL_53;
              }
            }
            else
            {
              objc_msgSend((id)naturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_withStartDate__readableMonthArray, "objectAtIndex:", objc_msgSend(v47, "integerValue") - 1);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v146, "appendFormat:", v50, v54);

              if (!v52)
                goto LABEL_48;
            }

            goto LABEL_48;
          }
LABEL_54:
          v27 = v143;
          if (objc_msgSend(v143, "count"))
          {
            v55 = (void *)objc_opt_class();
            objc_msgSend(v143, "objectAtIndex:", 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "_weekDayPositionAsString:", objc_msgSend(v56, "integerValue"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v58 = objc_msgSend(v18, "count");
            v59 = (void *)MEMORY[0x1E0CB3940];
            if (v58)
            {
              v19 = v128;
              if (a4 != 1)
              {
                objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every %lu years on the %@ %@ of %@."), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v130);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "localizedStringWithFormat:", v60, a4, v57, v62, v146);
                goto LABEL_95;
              }
              objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every year on the %@ %@ of %@."), &stru_1E67FB1F0, 0);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v130);
              v61 = objc_claimAutoreleasedReturnValue();
              v62 = (void *)v61;
              v125 = v146;
            }
            else
            {
              v19 = v128;
              if (a4 != 1)
              {
                objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every %lu years on the %@ %@."), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v130);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "localizedStringWithFormat:", v60, a4, v57, v62, v126);
                goto LABEL_95;
              }
              objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every year on the %@ %@."), &stru_1E67FB1F0, 0);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v130);
              v61 = objc_claimAutoreleasedReturnValue();
              v62 = (void *)v61;
            }
            objc_msgSend(v59, "localizedStringWithFormat:", v60, v57, v61, v125, v126);
LABEL_95:
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_149:
LABEL_150:
            v37 = v138;

            v17 = v130;
            goto LABEL_151;
          }
          objc_msgSend(v130, "objectAtIndex:", 0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "weekNumber");

          if (v68)
          {
            v18 = v145;
            v69 = objc_msgSend(v145, "count");
            v70 = (void *)MEMORY[0x1E0CB3940];
            v19 = v128;
            if (v69)
            {
              v71 = a4;
              v72 = v142;
              if (a4 == 1)
              {
                v73 = CFSTR("Event will occur every year on the %@ of %@.");
LABEL_88:
                objc_msgSend(v72, "localizedStringForKey:value:table:", v73, &stru_1E67FB1F0, 0);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v130);
                v87 = objc_claimAutoreleasedReturnValue();
                v60 = (void *)v87;
                v124 = v146;
LABEL_134:
                objc_msgSend(v70, "localizedStringWithFormat:", v57, v87, v124, v125);
LABEL_148:
                v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                goto LABEL_149;
              }
              v100 = CFSTR("Event will occur every %lu years on the %@ of %@.");
              goto LABEL_137;
            }
            v92 = a4;
            v93 = v142;
            if (a4 == 1)
            {
              v94 = CFSTR("Event will occur every year on the %@.");
LABEL_133:
              objc_msgSend(v93, "localizedStringForKey:value:table:", v94, &stru_1E67FB1F0, 0);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v130);
              v87 = objc_claimAutoreleasedReturnValue();
              v60 = (void *)v87;
              goto LABEL_134;
            }
            v118 = CFSTR("Event will occur every %lu years on the %@.");
          }
          else
          {
            v19 = v128;
            if (!objc_msgSend(v130, "count"))
            {
              v117 = (void *)MEMORY[0x1E0CB3940];
              if (a4 == 1)
              {
                objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every year in %@."), &stru_1E67FB1F0, 0);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "localizedStringWithFormat:", v57, v146, v124);
              }
              else
              {
                objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every %lu years in %@."), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "localizedStringWithFormat:", v57, a4, v146);
              }
              v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v18 = v145;
              goto LABEL_150;
            }
            v18 = v145;
            v86 = objc_msgSend(v145, "count");
            v70 = (void *)MEMORY[0x1E0CB3940];
            if (v86)
            {
              v71 = a4;
              v72 = v142;
              if (a4 == 1)
              {
                v73 = CFSTR("Event will occur every year on every %@ in %@.");
                goto LABEL_88;
              }
              v100 = CFSTR("Event will occur every %lu years on every %@ in %@.");
LABEL_137:
              v120 = v71;
              objc_msgSend(v72, "localizedStringForKey:value:table:", v100, &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v130);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "localizedStringWithFormat:", v57, v120, v60, v146);
              goto LABEL_148;
            }
            v92 = a4;
            v93 = v142;
            if (a4 == 1)
            {
              v94 = CFSTR("Event will occur every year on every %@.");
              goto LABEL_133;
            }
            v118 = CFSTR("Event will occur every %lu years on every %@.");
          }
          v121 = v92;
          objc_msgSend(v93, "localizedStringForKey:value:table:", v118, &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v130);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "localizedStringWithFormat:", v57, v121, v60, v125);
          goto LABEL_148;
        }
LABEL_17:
        v36 = &stru_1E67FB1F0;
LABEL_18:
        v37 = v138;
LABEL_151:
        v38 = v142;
        goto LABEL_152;
      }
      if (!objc_msgSend(v17, "count"))
      {
        v88 = objc_msgSend(v144, "count");
        if (!v144
          || (v89 = v88, v88 == 1)
          && (objc_msgSend(v144, "objectAtIndex:", 0),
              v90 = (void *)objc_claimAutoreleasedReturnValue(),
              p_prots = (__objc2_prot_list **)objc_msgSend(v90, "integerValue"),
              v91 = objc_msgSend(v141, "day"),
              v90,
              p_prots == (__objc2_prot_list **)v91))
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          v29 = a4;
          if (a4 == 1)
          {
            v30 = CFSTR("Event will occur every month.");
            goto LABEL_21;
          }
          v63 = CFSTR("Event will occur every %lu months.");
LABEL_72:
          v38 = v142;
          v80 = v29;
          objc_msgSend(v142, "localizedStringForKey:value:table:", v63, &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = v80;
LABEL_73:
          objc_msgSend(v28, "localizedStringWithFormat:", v39, v123);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_74;
        }
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v89)
        {
LABEL_122:
          v114 = (void *)MEMORY[0x1E0CB3940];
          if (a4 == 1)
          {
            objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every month on the %@."), &stru_1E67FB1F0, 0);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = v147;
            objc_msgSend(v114, "localizedStringWithFormat:", v115, v147, v124);
          }
          else
          {
            objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every %lu months on the %@."), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = v147;
            objc_msgSend(v114, "localizedStringWithFormat:", v115, a4, v147);
          }
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v37 = v138;
          v27 = v143;

          goto LABEL_151;
        }
        v101 = 0;
        v136 = v89;
        v129 = v19;
        v131 = v17;
        while (1)
        {
          if (v101)
          {
            v102 = v101 + 1;
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v103;
            if (v101 + 1 >= v89)
            {
              if (v89 == 2)
              {
                objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format for a list with two terms.  The last part of a list: X and Y. Here %@ is 'Y'"), CFSTR(" and %@"), 0);
                v105 = objc_claimAutoreleasedReturnValue();
                v107 = 0;
                v106 = 1;
                v108 = p_prots;
                v109 = v27;
                v133 = (void *)v105;
                v134 = v104;
              }
              else
              {
                objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format for a list with three or more items.  The last part of a list: X, Y, and Z. Here %@ is 'Z'"), CFSTR(", and %@"), 0);
                v105 = objc_claimAutoreleasedReturnValue();
                v106 = 0;
                v107 = 1;
                v108 = p_prots;
                v109 = v27;
                v132 = v104;
                v127 = (void *)v105;
              }
            }
            else
            {
              objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR(", %@"), &stru_1E67FB1F0, 0);
              v105 = objc_claimAutoreleasedReturnValue();
              v106 = 0;
              v107 = 0;
              v108 = (__objc2_prot_list **)v104;
              v109 = (void *)v105;
            }
            v111 = (void *)objc_opt_class();
            objc_msgSend(v144, "objectAtIndex:", v101);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "_dayOfMonthAsString:", objc_msgSend(v112, "integerValue"));
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "appendFormat:", v105, v113);

            if (v107)
            {

            }
            v18 = v145;
            v19 = v129;
            if (v106)
            {

            }
            p_prots = v108;
            v27 = v109;
            v89 = v136;
            v17 = v131;
            if (v102 >= v136)
              goto LABEL_121;
          }
          else
          {
            v110 = (void *)objc_opt_class();
            objc_msgSend(v144, "objectAtIndex:", 0);
            v108 = (__objc2_prot_list **)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "_dayOfMonthAsString:", objc_msgSend(v108, "integerValue"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "appendString:", v109);
            v102 = 1;
          }

          v108 = p_prots;
          v109 = v27;
LABEL_121:
          v27 = v109;
          p_prots = v108;
          v101 = v102;
          if (v102 == v89)
            goto LABEL_122;
        }
      }
      if (objc_msgSend(v143, "count"))
      {
        v74 = (void *)objc_opt_class();
        objc_msgSend(v143, "objectAtIndex:", 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "_weekDayPositionAsString:", objc_msgSend(v75, "integerValue"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = (void *)MEMORY[0x1E0CB3940];
        if (a4 == 1)
        {
          objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every month on the %@ %@."), &stru_1E67FB1F0, 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v17);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "localizedStringWithFormat:", v78, v76, v79, v125);
        }
        else
        {
          objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Event will occur every %lu months on the %@ %@."), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v17);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "localizedStringWithFormat:", v78, a4, v76, v79);
        }
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      objc_msgSend(v17, "objectAtIndex:", 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "weekNumber");

      v82 = (void *)MEMORY[0x1E0CB3940];
      if (!v96)
      {
        v97 = a4;
        v38 = v142;
        if (a4 == 1)
        {
          v98 = CFSTR("Event will occur every month on %@.");
          v99 = &stru_1E67FB1F0;
          goto LABEL_140;
        }
        v83 = CFSTR("Event will occur every %lu months on %@.");
        v84 = &stru_1E67FB1F0;
LABEL_154:
        v85 = v38;
        v81 = v97;
LABEL_80:
        objc_msgSend(v85, "localizedStringForKey:value:table:", v83, v84, CFSTR("PluralLocalizable"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v17);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "localizedStringWithFormat:", v39, v81, v65);
        goto LABEL_81;
      }
      v97 = a4;
      if (a4 != 1)
      {
        v83 = CFSTR("Event will occur every %lu months on the %@-XX01.");
        v84 = CFSTR("Event will occur every %lu months on the %@.");
        v38 = v142;
        goto LABEL_154;
      }
      v98 = CFSTR("Event will occur every month on the %@-XX01.");
      v99 = CFSTR("Event will occur every month on the %@.");
      v38 = v142;
LABEL_140:
      objc_msgSend(v38, "localizedStringForKey:value:table:", v98, v99, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v17);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "localizedStringWithFormat:", v39, v65, v124);
LABEL_81:
      v66 = objc_claimAutoreleasedReturnValue();
LABEL_82:
      v36 = (__CFString *)v66;

LABEL_74:
LABEL_75:
      v37 = v138;
LABEL_152:

      return v36;
    case 3:
      goto LABEL_15;
    case 4:
      v28 = (void *)MEMORY[0x1E0CB3940];
      v29 = a4;
      if (a4 != 1)
      {
        v63 = CFSTR("Event will occur every %lu hours.");
        goto LABEL_72;
      }
      v30 = CFSTR("Event will occur every hour.");
LABEL_21:
      v38 = v142;
      objc_msgSend(v142, "localizedStringForKey:value:table:", v30, &stru_1E67FB1F0, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_73;
    default:
      goto LABEL_17;
  }
}

+ (id)_readableWeekDays
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "standaloneWeekdaySymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (objc_msgSend(v4, "count") != 7)
  {
    NSLog(CFSTR("-[NSDateFormatter weekdaySymbols] invalid, reverting to US dates"));
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("Sunday"), CFSTR("Monday"), CFSTR("Tuesday"), CFSTR("Wednesday"), CFSTR("Thursday"), CFSTR("Friday"), CFSTR("Saturday"), 0);

    v4 = (void *)v5;
  }

  return v4;
}

+ (id)_readableMonths
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "standaloneMonthSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (objc_msgSend(v4, "count") != 12)
  {
    NSLog(CFSTR("-[NSDateFormatter monthSymbols] invalid, reverting to US dates"));
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("January"), CFSTR("February"), CFSTR("March"), CFSTR("April"), CFSTR("May"), CFSTR("June"), CFSTR("July"), CFSTR("August"), CFSTR("September"), CFSTR("October"), CFSTR("November"), CFSTR("December"), 0);

    v4 = (void *)v5;
  }

  return v4;
}

+ (id)_andDaysOfWeekString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (v6 == objc_msgSend(v3, "count") - 1)
        {
          if (objc_msgSend(v3, "count") == 2)
          {
            v8 = v5;
            v9 = CFSTR("the last part of a list of two items: X and Y. Here %@ is 'Y'");
            v10 = CFSTR(" and %@");
          }
          else
          {
            v8 = v5;
            v9 = CFSTR("the last part of a list of three or more items: X, Y, and Z. Here %@ is 'Z'");
            v10 = CFSTR(", and %@");
          }
        }
        else
        {
          v8 = v5;
          v9 = CFSTR(", %@-XX01");
          v10 = CFSTR(", %@");
        }
        objc_msgSend(v8, "localizedStringForKey:value:table:", v9, v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", v11, v12);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v11);
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }

  return v4;
}

+ (id)_numberedWeekDayString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_daysOfWeek");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "dayOfTheWeek"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "weekNumber"))
  {
    objc_msgSend((id)objc_opt_class(), "_weekDayPositionAsString:", objc_msgSend(v3, "weekNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ %@"), &stru_1E67FB1F0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v6, v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (id)_daysOfWeek
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)_daysOfWeek_sDaysOfWeek;
  if (!_daysOfWeek_sDaysOfWeek)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v5, "standaloneWeekdaySymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (objc_msgSend(v7, "count") == 7)
    {
      objc_msgSend(v7, "insertObject:atIndex:", &stru_1E67FB1F0, 0);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("-[NSDateFormatter weekdaySymbols] invalid, reverting to US dates"));
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &stru_1E67FB1F0, CFSTR("Sunday"), CFSTR("Monday"), CFSTR("Tuesday"), CFSTR("Wednesday"), CFSTR("Thursday"), CFSTR("Friday"), CFSTR("Saturday"), 0);
    }
    v9 = (void *)_daysOfWeek_sDaysOfWeek;
    _daysOfWeek_sDaysOfWeek = v8;

    objc_sync_exit(v4);
    v3 = (void *)_daysOfWeek_sDaysOfWeek;
  }
  return v3;
}

+ (id)_dayOfMonthAsString:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = &stru_1E67FB1F0;
  switch(a3)
  {
    case -1:
      v7 = CFSTR("last day");
      v8 = &stru_1E67FB1F0;
      goto LABEL_34;
    case 1:
      v7 = CFSTR("1st-XX01");
      v8 = CFSTR("1st");
      goto LABEL_34;
    case 2:
      v7 = CFSTR("2nd-XX01");
      v8 = CFSTR("2nd");
      goto LABEL_34;
    case 3:
      v7 = CFSTR("3rd-XX01");
      v8 = CFSTR("3rd");
      goto LABEL_34;
    case 4:
      v7 = CFSTR("4th-XX01");
      v8 = CFSTR("4th");
      goto LABEL_34;
    case 5:
      v7 = CFSTR("5th-XX01");
      v8 = CFSTR("5th");
      goto LABEL_34;
    case 6:
      v7 = CFSTR("6th-XX01");
      v8 = CFSTR("6th");
      goto LABEL_34;
    case 7:
      v7 = CFSTR("7th-XX01");
      v8 = CFSTR("7th");
      goto LABEL_34;
    case 8:
      v7 = CFSTR("8th-XX01");
      v8 = CFSTR("8th");
      goto LABEL_34;
    case 9:
      v7 = CFSTR("9th-XX01");
      v8 = CFSTR("9th");
      goto LABEL_34;
    case 10:
      v7 = CFSTR("10th-XX01");
      v8 = CFSTR("10th");
      goto LABEL_34;
    case 11:
      v7 = CFSTR("11th-XX01");
      v8 = CFSTR("11th");
      goto LABEL_34;
    case 12:
      v7 = CFSTR("12th-XX01");
      v8 = CFSTR("12th");
      goto LABEL_34;
    case 13:
      v7 = CFSTR("13th-XX01");
      v8 = CFSTR("13th");
      goto LABEL_34;
    case 14:
      v7 = CFSTR("14th-XX01");
      v8 = CFSTR("14th");
      goto LABEL_34;
    case 15:
      v7 = CFSTR("15th-XX01");
      v8 = CFSTR("15th");
      goto LABEL_34;
    case 16:
      v7 = CFSTR("16th-XX01");
      v8 = CFSTR("16th");
      goto LABEL_34;
    case 17:
      v7 = CFSTR("17th-XX01");
      v8 = CFSTR("17th");
      goto LABEL_34;
    case 18:
      v7 = CFSTR("18th-XX01");
      v8 = CFSTR("18th");
      goto LABEL_34;
    case 19:
      v7 = CFSTR("19th-XX01");
      v8 = CFSTR("19th");
      goto LABEL_34;
    case 20:
      v7 = CFSTR("20th-XX01");
      v8 = CFSTR("20th");
      goto LABEL_34;
    case 21:
      v7 = CFSTR("21st-XX01");
      v8 = CFSTR("21st");
      goto LABEL_34;
    case 22:
      v7 = CFSTR("22nd-XX01");
      v8 = CFSTR("22nd");
      goto LABEL_34;
    case 23:
      v7 = CFSTR("23rd-XX01");
      v8 = CFSTR("23rd");
      goto LABEL_34;
    case 24:
      v7 = CFSTR("24th-XX01");
      v8 = CFSTR("24th");
      goto LABEL_34;
    case 25:
      v7 = CFSTR("25th-XX01");
      v8 = CFSTR("25th");
      goto LABEL_34;
    case 26:
      v7 = CFSTR("26th-XX01");
      v8 = CFSTR("26th");
      goto LABEL_34;
    case 27:
      v7 = CFSTR("27th-XX01");
      v8 = CFSTR("27th");
      goto LABEL_34;
    case 28:
      v7 = CFSTR("28th-XX01");
      v8 = CFSTR("28th");
      goto LABEL_34;
    case 29:
      v7 = CFSTR("29th-XX01");
      v8 = CFSTR("29th");
      goto LABEL_34;
    case 30:
      v7 = CFSTR("30th-XX01");
      v8 = CFSTR("30th");
      goto LABEL_34;
    case 31:
      v7 = CFSTR("31st-XX01");
      v8 = CFSTR("31st");
LABEL_34:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v7, v8, 0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_weekDayPositionAsString:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = &stru_1E67FB1F0;
  switch(a3)
  {
    case -1:
      v7 = CFSTR("last");
      v8 = &stru_1E67FB1F0;
      goto LABEL_56;
    case 1:
      v7 = CFSTR("1st-XX02");
      v8 = CFSTR("1st");
      goto LABEL_56;
    case 2:
      v7 = CFSTR("2nd-XX02");
      v8 = CFSTR("2nd");
      goto LABEL_56;
    case 3:
      v7 = CFSTR("3rd-XX02");
      v8 = CFSTR("3rd");
      goto LABEL_56;
    case 4:
      v7 = CFSTR("4th-XX02");
      v8 = CFSTR("4th");
      goto LABEL_56;
    case 5:
      v7 = CFSTR("5th-XX02");
      v8 = CFSTR("5th");
      goto LABEL_56;
    case 6:
      v7 = CFSTR("6th-XX02");
      v8 = CFSTR("6th");
      goto LABEL_56;
    case 7:
      v7 = CFSTR("7th-XX02");
      v8 = CFSTR("7th");
      goto LABEL_56;
    case 8:
      v7 = CFSTR("8th-XX02");
      v8 = CFSTR("8th");
      goto LABEL_56;
    case 9:
      v7 = CFSTR("9th-XX02");
      v8 = CFSTR("9th");
      goto LABEL_56;
    case 10:
      v7 = CFSTR("10th-XX02");
      v8 = CFSTR("10th");
      goto LABEL_56;
    case 11:
      v7 = CFSTR("11th-XX02");
      v8 = CFSTR("11th");
      goto LABEL_56;
    case 12:
      v7 = CFSTR("12th-XX02");
      v8 = CFSTR("12th");
      goto LABEL_56;
    case 13:
      v7 = CFSTR("13th-XX02");
      v8 = CFSTR("13th");
      goto LABEL_56;
    case 14:
      v7 = CFSTR("14th-XX02");
      v8 = CFSTR("14th");
      goto LABEL_56;
    case 15:
      v7 = CFSTR("15th-XX02");
      v8 = CFSTR("15th");
      goto LABEL_56;
    case 16:
      v7 = CFSTR("16th-XX02");
      v8 = CFSTR("16th");
      goto LABEL_56;
    case 17:
      v7 = CFSTR("17th-XX02");
      v8 = CFSTR("17th");
      goto LABEL_56;
    case 18:
      v7 = CFSTR("18th-XX02");
      v8 = CFSTR("18th");
      goto LABEL_56;
    case 19:
      v7 = CFSTR("19th-XX02");
      v8 = CFSTR("19th");
      goto LABEL_56;
    case 20:
      v7 = CFSTR("20th-XX02");
      v8 = CFSTR("20th");
      goto LABEL_56;
    case 21:
      v7 = CFSTR("21st-XX02");
      v8 = CFSTR("21st");
      goto LABEL_56;
    case 22:
      v7 = CFSTR("22nd-XX02");
      v8 = CFSTR("22nd");
      goto LABEL_56;
    case 23:
      v7 = CFSTR("23rd-XX02");
      v8 = CFSTR("23rd");
      goto LABEL_56;
    case 24:
      v7 = CFSTR("24th-XX02");
      v8 = CFSTR("24th");
      goto LABEL_56;
    case 25:
      v7 = CFSTR("25th-XX02");
      v8 = CFSTR("25th");
      goto LABEL_56;
    case 26:
      v7 = CFSTR("26th-XX02");
      v8 = CFSTR("26th");
      goto LABEL_56;
    case 27:
      v7 = CFSTR("27th-XX02");
      v8 = CFSTR("27th");
      goto LABEL_56;
    case 28:
      v7 = CFSTR("28th-XX02");
      v8 = CFSTR("28th");
      goto LABEL_56;
    case 29:
      v7 = CFSTR("29th-XX02");
      v8 = CFSTR("29th");
      goto LABEL_56;
    case 30:
      v7 = CFSTR("30th-XX02");
      v8 = CFSTR("30th");
      goto LABEL_56;
    case 31:
      v7 = CFSTR("31st-XX02");
      v8 = CFSTR("31st");
      goto LABEL_56;
    case 32:
      v7 = CFSTR("32nd-XX02");
      v8 = CFSTR("32nd");
      goto LABEL_56;
    case 33:
      v7 = CFSTR("33rd-XX02");
      v8 = CFSTR("33rd");
      goto LABEL_56;
    case 34:
      v7 = CFSTR("34th-XX02");
      v8 = CFSTR("34th");
      goto LABEL_56;
    case 35:
      v7 = CFSTR("35th-XX02");
      v8 = CFSTR("35th");
      goto LABEL_56;
    case 36:
      v7 = CFSTR("36th-XX02");
      v8 = CFSTR("36th");
      goto LABEL_56;
    case 37:
      v7 = CFSTR("37th-XX02");
      v8 = CFSTR("37th");
      goto LABEL_56;
    case 38:
      v7 = CFSTR("38th-XX02");
      v8 = CFSTR("38th");
      goto LABEL_56;
    case 39:
      v7 = CFSTR("39th-XX02");
      v8 = CFSTR("39th");
      goto LABEL_56;
    case 40:
      v7 = CFSTR("40th-XX02");
      v8 = CFSTR("40th");
      goto LABEL_56;
    case 41:
      v7 = CFSTR("41st-XX02");
      v8 = CFSTR("41st");
      goto LABEL_56;
    case 42:
      v7 = CFSTR("42nd-XX02");
      v8 = CFSTR("42nd");
      goto LABEL_56;
    case 43:
      v7 = CFSTR("43rd-XX02");
      v8 = CFSTR("43rd");
      goto LABEL_56;
    case 44:
      v7 = CFSTR("44th-XX02");
      v8 = CFSTR("44th");
      goto LABEL_56;
    case 45:
      v7 = CFSTR("45th-XX02");
      v8 = CFSTR("45th");
      goto LABEL_56;
    case 46:
      v7 = CFSTR("46th-XX02");
      v8 = CFSTR("46th");
      goto LABEL_56;
    case 47:
      v7 = CFSTR("47th-XX02");
      v8 = CFSTR("47th");
      goto LABEL_56;
    case 48:
      v7 = CFSTR("48th-XX02");
      v8 = CFSTR("48th");
      goto LABEL_56;
    case 49:
      v7 = CFSTR("49th-XX02");
      v8 = CFSTR("49th");
      goto LABEL_56;
    case 50:
      v7 = CFSTR("50th-XX02");
      v8 = CFSTR("50th");
      goto LABEL_56;
    case 51:
      v7 = CFSTR("51st-XX02");
      v8 = CFSTR("51st");
      goto LABEL_56;
    case 52:
      v7 = CFSTR("52nd-XX02");
      v8 = CFSTR("52nd");
      goto LABEL_56;
    case 53:
      v7 = CFSTR("53rd-XX02");
      v8 = CFSTR("53rd");
LABEL_56:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v7, v8, 0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_orDaysOfWeekString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_customDayCombinationDescription:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (v8 == objc_msgSend(v3, "count") - 1)
          {
            v10 = CFSTR(" or %@");
            v11 = &stru_1E67FB1F0;
          }
          else
          {
            v10 = CFSTR(", %@-XX02");
            v11 = CFSTR(", %@");
          }
          objc_msgSend(v4, "localizedStringForKey:value:table:", v10, v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", v12, v13);

        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v12);
        }

        ++v8;
      }
      while (v8 < objc_msgSend(v3, "count"));
    }
  }

  return v7;
}

+ (id)_customDayCombinationDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "daysTypeForDayArray:", v4);

  if (v6 == 3)
  {
    v7 = CFSTR("weekend day");
LABEL_7:
    v8 = &stru_1E67FB1F0;
    goto LABEL_8;
  }
  if (v6 == 2)
  {
    v7 = CFSTR("weekday");
    goto LABEL_7;
  }
  if (v6 != 1)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v7 = CFSTR("day-XX02");
  v8 = CFSTR("day");
LABEL_8:
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v9;
}

+ (int64_t)daysTypeForDayArray:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 != 2)
  {
    if (v4 == 7)
    {
      v5 = 1;
      v17 = 1;
      while (1)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v18 = v3;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (!v19)
          break;
        v20 = v19;
        v21 = *(_QWORD *)v29;
LABEL_25:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v22), "dayOfTheWeek") == v17)
            break;
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            if (v20)
              goto LABEL_25;
            goto LABEL_35;
          }
        }

        v12 = v17++ >= 7;
        if (v12)
          goto LABEL_37;
      }
    }
    else
    {
      if (v4 != 5)
      {
LABEL_36:
        v5 = 0;
        goto LABEL_37;
      }
      v5 = 2;
      v6 = 2;
      while (1)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v7 = v3;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (!v8)
          break;
        v9 = v8;
        v10 = *(_QWORD *)v25;
LABEL_7:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "dayOfTheWeek") == v6)
            break;
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v9)
              goto LABEL_7;
            goto LABEL_35;
          }
        }

        v12 = v6++ >= 6;
        if (v12)
          goto LABEL_37;
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  objc_msgSend(v3, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dayOfTheWeek");

  objc_msgSend(v3, "objectAtIndex:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "dayOfTheWeek");

  if ((v14 != 7 || v16 != 1) && (v14 != 1 || v16 != 7))
    goto LABEL_36;
  v5 = 3;
LABEL_37:

  return v5;
}

+ (id)shortNaturalLanguageDescriptionForRecurrenceRule:(id)a3 date:(id)a4 timeZone:(id)a5 lowercase:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(v11, "frequency");
  v13 = objc_msgSend(v11, "interval");
  objc_msgSend(v11, "daysOfTheWeek");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "daysOfTheMonth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "monthsOfTheYear");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPositions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v20) = a6;
  objc_msgSend(a1, "shortNaturalLanguageDescriptionForFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:setPositions:date:timeZone:lowercase:", v12, v13, v14, v15, v16, v17, v10, v9, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)shortNaturalLanguageDescriptionForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 setPositions:(id)a8 date:(id)a9 timeZone:(id)a10 lowercase:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  unint64_t v55;
  int v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  int v68;
  id v69;
  const __CFString *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t i;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  int v97;
  const __CFString *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  id v106;
  unint64_t v107;
  void *v108;
  void *v109;
  int v110;
  BOOL v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  id v123;
  void *v124;
  int v125;
  void *v126;
  int v127;
  uint64_t v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  uint64_t v134;
  int v135;
  int v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  const __CFString *v167;
  const __CFString *v168;
  const __CFString *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  const __CFString *v175;
  const __CFString *v176;
  id v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  uint64_t v187;
  void *v188;
  id v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  id v197;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  id v212;
  id v213;
  id v214;
  void *v215;
  id v216;
  id v217;
  id v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  id v223;
  id v224;
  void *v225;
  void *v226;
  void *v227;
  id v229;
  uint64_t v230;
  id v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  id v237;
  void *v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  _BYTE v243[128];
  _QWORD v244[3];

  v244[1] = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v229 = a6;
  v17 = a7;
  v18 = a8;
  v231 = a9;
  v19 = a10;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v230 = objc_claimAutoreleasedReturnValue();
  v237 = a1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR(", and %@"), &stru_1E67FB1F0, 0);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR(" and %@"), &stru_1E67FB1F0, 0);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Monthly"), &stru_1E67FB1F0, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v232 = v20;
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Custom Repeat"), &stru_1E67FB1F0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase__onceToken != -1)
    dispatch_once(&shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase__onceToken, &__block_literal_global_5);
  v23 = v17;
  v227 = v18;
  v226 = (void *)v21;
  v24 = a11;
  switch(a3)
  {
    case 0:
      if (a4 >= 2)
      {
        v223 = v17;
        v25 = v22;
        v26 = v16;
        v27 = v19;
        v28 = CFSTR("Every %u days");
        goto LABEL_28;
      }
      v26 = v16;
      v54 = CFSTR("Daily");
      goto LABEL_54;
    case 1:
      v219 = v22;
      v32 = v16;
      v33 = objc_msgSend(v32, "count");
      v224 = v17;
      if (!v33
        || (v34 = v33, v35 = v33 - 1, v33 == 1)
        && recurrenceDateMatchesAnyDaySpecifiedInByDayList(v32, v231, v19))
      {
        v26 = v16;
        if (a4 == 1)
        {
          v30 = (void *)v230;
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("SINGULAR_WEEKLY_RECURRENCE"), CFSTR("Weekly"), 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v36;
          v37 = v22;
          v29 = v229;
          if (!a11)
          {
            v23 = v224;
            v24 = (uint64_t)v226;
            goto LABEL_166;
          }
          objc_msgSend(v36, "lowercaseStringWithLocale:", v230);
          v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u weeks"), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
          v31 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v31, a4);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v99;
          v37 = v22;
          v30 = (void *)v230;
          if (a11)
          {
            objc_msgSend(v99, "lowercaseStringWithLocale:");
            v100 = objc_claimAutoreleasedReturnValue();

            v38 = (id)v100;
          }
          v29 = v229;
        }
        v22 = v37;
        v23 = v224;
        v24 = (uint64_t)v226;
LABEL_165:

        v31 = v38;
LABEL_166:

        goto LABEL_320;
      }
      v212 = v16;
      v31 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v55 = 0;
      v56 = 0;
      v57 = 0;
      do
      {
        objc_msgSend(v32, "objectAtIndex:", v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v237, "_stringForDayOfWeek:", objc_msgSend(v58, "dayOfTheWeek") - 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)v59;
        if (v55)
        {
          if (v55 >= v35)
          {
            if (v34 < 3)
              objc_msgSend(v31, "appendFormat:", v233, v59);
            else
              objc_msgSend(v31, "appendFormat:", v234, v59);
          }
          else
          {
            objc_msgSend(v31, "appendFormat:", CFSTR(", %@"), v59);
          }
        }
        else
        {
          objc_msgSend(v31, "appendString:", v59);
        }
        if (objc_msgSend(v58, "dayOfTheWeek") == 1 || objc_msgSend(v58, "dayOfTheWeek") == 7)
        {
          ++v57;
        }
        else if (objc_msgSend(v58, "dayOfTheWeek") > 1)
        {
          ++v56;
        }

        ++v55;
      }
      while (v34 != v55);
      if (a4 == 1 && !v57 && v56 == 5)
      {
        objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Weekdays"), &stru_1E67FB1F0, 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v61;
        if (a11)
        {
          v30 = (void *)v230;
          objc_msgSend(v61, "lowercaseStringWithLocale:");
          v62 = objc_claimAutoreleasedReturnValue();
          v26 = v212;
          v29 = v229;
        }
        else
        {
          v38 = v61;
          v62 = (uint64_t)v38;
          v26 = v212;
          v29 = v229;
          v30 = (void *)v230;
        }
        v23 = v224;
      }
      else
      {
        if (a4 == 1 && v57 == 2 && !v56)
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Weekends"), &stru_1E67FB1F0, 0);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v101;
          v24 = (uint64_t)v226;
          if (a11)
          {
            v30 = (void *)v230;
            objc_msgSend(v101, "lowercaseStringWithLocale:");
            v62 = objc_claimAutoreleasedReturnValue();
            v26 = v212;
            v29 = v229;
          }
          else
          {
            v38 = v101;
            v62 = (uint64_t)v38;
            v26 = v212;
            v29 = v229;
            v30 = (void *)v230;
          }
          v23 = v224;
          goto LABEL_163;
        }
        if (a4 == 1)
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every week on %@"), &stru_1E67FB1F0, 0);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v122, v31, v199);
        }
        else
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u weeks on %@"), &stru_1E67FB1F0, CFSTR("PluralLocalizable"));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v122, a4, v31);
        }
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v26 = v212;
        v29 = v229;
        v30 = (void *)v230;
        v23 = v224;

        if (!a11)
        {
          v24 = (uint64_t)v226;
          goto LABEL_164;
        }
        objc_msgSend(v38, "lowercaseStringWithLocale:", v230);
        v62 = objc_claimAutoreleasedReturnValue();
      }
      v24 = (uint64_t)v226;
LABEL_163:

      v38 = (id)v62;
LABEL_164:
      v22 = v219;
      goto LABEL_165;
    case 2:
      v39 = v16;
      v40 = objc_msgSend(v39, "count");
      v210 = v39;
      if (objc_msgSend(v17, "count"))
      {
        LOBYTE(v200) = a11;
        objc_msgSend(v237, "shortNaturalLanguageDescriptionForFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:setPositions:date:timeZone:lowercase:", 3, a4, v39, v229, v17, v18, v231, v19, v200);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (v40)
      {
        if (v40 == 7)
        {
          if (objc_msgSend(v18, "count"))
          {
            v66 = v22;
            objc_msgSend(v18, "objectAtIndex:", 0);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "intValue");

            if (v68 != 1)
            {
              v22 = v66;
              if (v68 == -1)
              {
                if (a4 >= 2)
                {
                  v69 = v19;
                  v70 = CFSTR("Every %u months on the last day");
LABEL_265:
                  objc_msgSend(v232, "localizedStringForKey:value:table:", v70, &stru_1E67FB1F0, 0);
                  v178 = (void *)objc_claimAutoreleasedReturnValue();
                  v179 = v178;
                  v180 = (void *)MEMORY[0x1E0CB3940];
                  v181 = v178;
                  if (a11)
                  {
                    objc_msgSend(v178, "lowercaseStringWithLocale:", v230);
                    v181 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  objc_msgSend(v180, "localizedStringWithFormat:", v181, a4);
                  v31 = (id)objc_claimAutoreleasedReturnValue();
                  if (a11)

                  v41 = 0;
                  v19 = v69;
                  goto LABEL_270;
                }
                v168 = CFSTR("Every month on the last day");
                goto LABEL_282;
              }
              goto LABEL_155;
            }
            if (a4 >= 2)
            {
              v69 = v19;
              v70 = CFSTR("Every %u months on the first day");
              goto LABEL_265;
            }
            v169 = CFSTR("Every month on the first day");
LABEL_287:
            objc_msgSend(v232, "localizedStringForKey:value:table:", v169, &stru_1E67FB1F0, 0);
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            v183 = v185;
            if (a11)
            {
              objc_msgSend(v185, "lowercaseStringWithLocale:", v230);
              v186 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v186 = v185;
            }
            v31 = v186;
            v22 = v66;
            goto LABEL_291;
          }
          goto LABEL_155;
        }
        if (objc_msgSend(v39, "isEqualToArray:", shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray))
        {
          if (objc_msgSend(v18, "count"))
          {
            v66 = v22;
            objc_msgSend(v18, "objectAtIndex:", 0);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v120, "intValue");

            if (v121 == 1)
            {
              if (a4 >= 2)
              {
                v69 = v19;
                v70 = CFSTR("Every %u months on the first weekday");
                goto LABEL_265;
              }
              v169 = CFSTR("Every month on the first weekday");
              goto LABEL_287;
            }
            v22 = v66;
            if (v121 == -1)
            {
              if (a4 >= 2)
              {
                v69 = v19;
                v70 = CFSTR("Every %u months on the last weekday");
                goto LABEL_265;
              }
              v168 = CFSTR("Every month on the last weekday");
              goto LABEL_282;
            }
          }
          goto LABEL_155;
        }
        if (objc_msgSend(v39, "isEqualToArray:", shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray))
        {
          if (objc_msgSend(v18, "count"))
          {
            v66 = v22;
            objc_msgSend(v18, "objectAtIndex:", 0);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = objc_msgSend(v126, "intValue");

            if (v127 != 1)
            {
              v22 = v66;
              if (v127 == -1)
              {
                if (a4 >= 2)
                {
                  v69 = v19;
                  v70 = CFSTR("Every %u months on the last weekend day");
                  goto LABEL_265;
                }
                v168 = CFSTR("Every month on the last weekend day");
LABEL_282:
                objc_msgSend(v232, "localizedStringForKey:value:table:", v168, &stru_1E67FB1F0, 0);
                v182 = (void *)objc_claimAutoreleasedReturnValue();
                v183 = v182;
                if (a11)
                {
                  objc_msgSend(v182, "lowercaseStringWithLocale:", v230);
                  v184 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v184 = v182;
                }
                v31 = v184;
LABEL_291:

                v41 = 0;
                goto LABEL_16;
              }
              goto LABEL_155;
            }
            if (a4 >= 2)
            {
              v69 = v19;
              v70 = CFSTR("Every %u months on the first weekend day");
              goto LABEL_265;
            }
            v169 = CFSTR("Every month on the first weekend day");
            goto LABEL_287;
          }
LABEL_155:
          v123 = v22;
LABEL_156:
          v31 = v123;
          goto LABEL_157;
        }
        v150 = v39;
        v66 = v22;
        objc_msgSend(v150, "objectAtIndex:", 0);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v237, "_stringForByDayOfWeek:setPositions:", v151, v18);
        v152 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v152)
        {
          v31 = 0;
LABEL_251:

          v41 = 1;
LABEL_270:
          v22 = v66;
          goto LABEL_16;
        }
        v218 = v19;
        if (a4 < 2)
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every month on the %@"), &stru_1E67FB1F0, 0);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = v171;
          v172 = (void *)MEMORY[0x1E0CB3940];
          v156 = v171;
          if (a11)
          {
            objc_msgSend(v171, "lowercaseStringWithLocale:", v230);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v172, "localizedStringWithFormat:", v156, v152);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          if (!a11)
            goto LABEL_250;
        }
        else
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u months on the %@"), &stru_1E67FB1F0, 0);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = v153;
          v155 = (void *)MEMORY[0x1E0CB3940];
          v156 = v153;
          if (a11)
          {
            objc_msgSend(v153, "lowercaseStringWithLocale:", v230);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v155, "localizedStringWithFormat:", v156, a4, v152);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          if (!a11)
            goto LABEL_250;
        }

LABEL_250:
        v19 = v218;
        goto LABEL_251;
      }
      v106 = v229;
      v107 = objc_msgSend(v106, "count");
      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v18, "objectAtIndex:", 0);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v22;
        v110 = objc_msgSend(v108, "intValue");

        v111 = v110 == -1;
        v22 = v109;
        if (v111)
        {
          LODWORD(v24) = a11;
          if (recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v106, v231, v19))
          {
            if (a4 < 2)
            {
              if (a11)
              {
                objc_msgSend(v226, "lowercaseStringWithLocale:", v230);
                v177 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v177 = v226;
              }
              v31 = v177;
            }
            else
            {
              v157 = v19;
              objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u months"), &stru_1E67FB1F0, 0);
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              v159 = v158;
              v160 = (void *)MEMORY[0x1E0CB3940];
              v161 = v158;
              if (a11)
              {
                objc_msgSend(v158, "lowercaseStringWithLocale:", v230);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v160, "localizedStringWithFormat:", v161, a4);
              v31 = (id)objc_claimAutoreleasedReturnValue();
              if (a11)

              v19 = v157;
              v22 = v109;
            }
          }
          else
          {
            v31 = 0;
          }
          goto LABEL_244;
        }
      }
      if (!v107 || v107 == 1 && (recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v106, v231, v19) & 1) != 0)
      {
        v112 = v22;
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v19;
        objc_msgSend(v113, "setTimeZone:", v19);
        objc_msgSend(v113, "components:fromDate:", 16, v231);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "day");

        LODWORD(v24) = a11;
        if ((unint64_t)(v116 - 29) > 2)
        {
          v31 = 0;
          v19 = v114;
          v22 = v112;
LABEL_243:

          goto LABEL_244;
        }
        v221 = v112;
        if (a4 < 2)
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every month that has %u days"), &stru_1E67FB1F0, 0);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v170;
          v24 = MEMORY[0x1E0CB3940];
          v119 = v170;
          if (a11)
          {
            objc_msgSend(v170, "lowercaseStringWithLocale:", v230);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend((id)v24, "localizedStringWithFormat:", v119, v116);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = a11;
          if (!a11)
            goto LABEL_242;
        }
        else
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u months that have %u days"), &stru_1E67FB1F0, 0);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v117;
          v24 = MEMORY[0x1E0CB3940];
          v119 = v117;
          if (a11)
          {
            objc_msgSend(v117, "lowercaseStringWithLocale:", v230);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend((id)v24, "localizedStringWithFormat:", v119, a4, v116);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = a11;
          if (!a11)
            goto LABEL_242;
        }

LABEL_242:
        v19 = v114;
        v22 = v221;
        goto LABEL_243;
      }
      v236 = 0;
      v128 = 0;
      v214 = v16;
      v217 = v19;
      v222 = v22;
      v225 = v23;
      v209 = v106;
      do
      {
        v129 = v22;
        objc_msgSend(v106, "objectAtIndex:", v128);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = objc_msgSend(v130, "intValue");

        if (v131 < 1)
        {
          v22 = v129;
          goto LABEL_186;
        }
        if (!v236)
        {
          v22 = v129;
          v137 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v237, "_dayOfMonthAsString:", v131);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v236 = v137;
          objc_msgSend(v137, "appendString:", v138);
LABEL_184:

          goto LABEL_186;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v132;
        if (v128 + 1 >= v107)
        {
          if (v107 == 2)
          {
            objc_msgSend(v132, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format for a list with two terms.  The last part of a list: X and Y. Here %@ is 'Y'"), CFSTR(" and %@"), 0);
            v134 = objc_claimAutoreleasedReturnValue();
            v136 = 0;
            v135 = 1;
            v203 = v133;
            v204 = (void *)v134;
          }
          else
          {
            objc_msgSend(v132, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format for a list with three or more items.  The last part of a list: X, Y, and Z. Here %@ is 'Z'"), CFSTR(", and %@"), 0);
            v134 = objc_claimAutoreleasedReturnValue();
            v135 = 0;
            v136 = 1;
            v201 = v133;
            v202 = (void *)v134;
          }
        }
        else
        {
          objc_msgSend(v132, "localizedStringForKey:value:table:", CFSTR(", %@"), &stru_1E67FB1F0, 0);
          v134 = objc_claimAutoreleasedReturnValue();
          v135 = 0;
          v136 = 0;
          v205 = v133;
          v206 = (void *)v134;
        }
        objc_msgSend(v237, "_dayOfMonthAsString:", v131);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v236, "appendFormat:", v134, v139);

        v16 = v214;
        if (v136)
        {

        }
        if (v135)
        {

        }
        v23 = v225;
        if (v128 + 1 < v107)
        {

          v138 = v205;
          v19 = v217;
          v22 = v222;
          v106 = v209;
          goto LABEL_184;
        }
        v19 = v217;
        v22 = v222;
        v106 = v209;
LABEL_186:
        ++v128;
      }
      while (v107 != v128);
      if (v236)
      {
        v140 = v22;
        v141 = v19;
        LODWORD(v24) = a11;
        if (a4 >= 2)
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u months, each %@"), &stru_1E67FB1F0, 0);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = v142;
          v144 = (void *)MEMORY[0x1E0CB3940];
          v145 = v142;
          if (a11)
          {
            objc_msgSend(v142, "lowercaseStringWithLocale:", v230);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v144, "localizedStringWithFormat:", v145, a4, v236);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          if (!a11)
            goto LABEL_229;
LABEL_228:

          goto LABEL_229;
        }
        objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every month, each %@"), &stru_1E67FB1F0, 0);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = v165;
        v166 = (void *)MEMORY[0x1E0CB3940];
        v145 = v165;
        if (a11)
        {
          objc_msgSend(v165, "lowercaseStringWithLocale:", v230);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v166, "localizedStringWithFormat:", v145, v236);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (a11)
          goto LABEL_228;
LABEL_229:

        v19 = v141;
        v22 = v140;
      }
      else
      {
        v31 = 0;
        LODWORD(v24) = a11;
      }

LABEL_244:
LABEL_15:
      v41 = 1;
LABEL_16:
      if (v31)
        goto LABEL_157;
      if (!v41)
        goto LABEL_155;
      if (a4 < 2)
      {
        if ((v24 & 1) != 0)
        {
          objc_msgSend(v226, "lowercaseStringWithLocale:", v230);
          v123 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v123 = v226;
        }
        goto LABEL_156;
      }
      v42 = v22;
      v43 = v19;
      objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u months"), &stru_1E67FB1F0, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v46 = (void *)MEMORY[0x1E0CB3940];
      v47 = v44;
      if ((_DWORD)v24)
      {
        objc_msgSend(v44, "lowercaseStringWithLocale:", v230);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v46, "localizedStringWithFormat:", v47, a4);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v24)

      v19 = v43;
      v22 = v42;
LABEL_157:
      v26 = v16;
      v30 = (void *)v230;

      v29 = v229;
LABEL_158:
      v24 = (uint64_t)v226;
LABEL_320:
      v197 = v31;

      return v197;
    case 3:
      v48 = v16;
      v211 = v48;
      if (objc_msgSend(v48, "count"))
      {
        objc_msgSend(v48, "objectAtIndex:", 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v237, "_stringForByDayOfWeek:setPositions:", v49, v18);
        v235 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v235 = 0;
      }
      v220 = v22;
      v71 = v17;
      v216 = v19;
      if (!objc_msgSend(v71, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setTimeZone:", v19);
        v73 = v71;
        v74 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v72, "components:fromDate:", 8, v231);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "numberWithInteger:", objc_msgSend(v75, "month"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v244[0] = v76;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v244, 1);
        v24 = objc_claimAutoreleasedReturnValue();

        v71 = (id)v24;
        LODWORD(v24) = a11;
      }
      v26 = v16;
      v30 = (void *)v230;
      v208 = v71;
      if (!v235
        && (unint64_t)objc_msgSend(v71, "count") <= 1
        && (recurrenceMonthMatchesAnyMonthSpecifiedInByMonthList(v71, v231, v19) & 1) != 0)
      {
        goto LABEL_93;
      }
      v77 = objc_msgSend(v71, "count");
      v239 = 0u;
      v240 = 0u;
      v241 = 0u;
      v242 = 0u;
      v78 = v71;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v239, v243, 16);
      if (!v79)
      {

LABEL_93:
        v81 = 0;
        v22 = v220;
        goto LABEL_306;
      }
      v80 = v79;
      v213 = v16;
      v81 = 0;
      v82 = *(_QWORD *)v240;
      do
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v240 != v82)
            objc_enumerationMutation(v78);
          objc_msgSend(v237, "_stringForMonthNumber:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v239 + 1) + 8 * i), "intValue"));
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = (void *)v84;
          if (v81)
          {
            if (v77 - 1 == i)
            {
              if (objc_msgSend(v78, "count") == 2)
                objc_msgSend(v81, "appendFormat:", v233, v85);
              else
                objc_msgSend(v81, "appendFormat:", v234, v85);
            }
            else
            {
              objc_msgSend(v81, "appendFormat:", CFSTR(", %@"), v84);
            }
          }
          else
          {
            v86 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v81 = v86;
            if (!v235)
              objc_msgSend(v86, "appendString:", v85);
          }

        }
        v77 -= v80;
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v239, v243, 16);
      }
      while (v80);

      if (v81 && !v235)
      {
        v87 = v213;
        v22 = v220;
        v88 = (void *)v230;
        if (a4 < 2)
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every year in %@"), &stru_1E67FB1F0, 0);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v102;
          v104 = (void *)MEMORY[0x1E0CB3940];
          v92 = v102;
          if ((_DWORD)v24)
          {
            objc_msgSend(v102, "lowercaseStringWithLocale:", v230);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v238 = v103;
          objc_msgSend(v104, "localizedStringWithFormat:", v92, v81, v199);
        }
        else
        {
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u years in %@"), &stru_1E67FB1F0, 0);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v89;
          v91 = (void *)MEMORY[0x1E0CB3940];
          v92 = v89;
          if ((_DWORD)v24)
          {
            objc_msgSend(v89, "lowercaseStringWithLocale:", v230);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v238 = v90;
          objc_msgSend(v91, "localizedStringWithFormat:", v92, a4, v81);
        }
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v105 = 1;
        if ((v24 & 1) == 0)
          goto LABEL_303;
        goto LABEL_302;
      }
      v87 = v213;
      v22 = v220;
      v88 = (void *)v230;
      if (!v235 || !v81)
      {
        v26 = v213;
        v30 = (void *)v230;
        goto LABEL_306;
      }
      objc_msgSend(v78, "objectAtIndexedSubscript:", 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "_localizedOfMonthStringForMonth:", v93);
      v94 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v94, v81);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = (void *)v94;
      if (objc_msgSend(v211, "count") == 7)
      {
        if (!objc_msgSend(v227, "count"))
          goto LABEL_202;
        v95 = v220;
        objc_msgSend(v227, "objectAtIndex:", 0);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "intValue");

        if (v97 != 1)
        {
          v22 = v220;
          if (v97 == -1)
          {
            if (a4 >= 2)
            {
              v98 = CFSTR("Every %u years on the last day %@");
              goto LABEL_200;
            }
            v175 = CFSTR("Every year on the last day %@");
LABEL_293:
            objc_msgSend(v232, "localizedStringForKey:value:table:", v175, &stru_1E67FB1F0, 0);
            v187 = objc_claimAutoreleasedReturnValue();
            v188 = (void *)MEMORY[0x1E0CB3940];
            v207 = (void *)v187;
            if (!(_DWORD)v24)
              goto LABEL_298;
            goto LABEL_297;
          }
LABEL_202:
          v105 = 0;
          v31 = 0;
LABEL_302:

LABEL_303:
          v26 = v87;

          v30 = v88;
          if (v31)
          {
            v19 = v216;
LABEL_317:
            v29 = v229;
            goto LABEL_318;
          }
          v19 = v216;
          if (!v105)
          {
            v31 = v22;
            goto LABEL_317;
          }
LABEL_306:
          if (a4 >= 2)
          {
            v215 = v26;
            v189 = v19;
            objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u years"), &stru_1E67FB1F0, 0);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            v191 = v190;
            v192 = (void *)MEMORY[0x1E0CB3940];
            v193 = v190;
            if ((_DWORD)v24)
            {
              objc_msgSend(v190, "lowercaseStringWithLocale:", v30);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v192, "localizedStringWithFormat:", v193, a4);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            if ((_DWORD)v24)

            v19 = v189;
            v24 = (uint64_t)v226;
            v22 = v220;
            v26 = v215;
            v29 = v229;
LABEL_319:

            goto LABEL_320;
          }
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Yearly"), &stru_1E67FB1F0, 0);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v195 = v194;
          if ((v24 & 1) != 0)
          {
            objc_msgSend(v194, "lowercaseStringWithLocale:", v30);
            v196 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v196 = v194;
          }
          v31 = v196;
          v29 = v229;

LABEL_318:
          v24 = (uint64_t)v226;
          goto LABEL_319;
        }
        if (a4 >= 2)
        {
          v167 = CFSTR("Every %u years on the first day %@");
          goto LABEL_275;
        }
        v176 = CFSTR("Every year on the first day %@");
LABEL_296:
        objc_msgSend(v232, "localizedStringForKey:value:table:", v176, &stru_1E67FB1F0, 0);
        v187 = objc_claimAutoreleasedReturnValue();
        v207 = (void *)v187;
        v188 = (void *)MEMORY[0x1E0CB3940];
        v22 = v95;
        if (!(_DWORD)v24)
        {
LABEL_298:
          v164 = (void *)v187;
          objc_msgSend(v188, "localizedStringWithFormat:", v187, v92, v199);
LABEL_299:
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v105 = 0;
          if ((v24 & 1) == 0)
          {
LABEL_301:

            goto LABEL_302;
          }
LABEL_300:

          goto LABEL_301;
        }
LABEL_297:
        objc_msgSend(v207, "lowercaseStringWithLocale:", v230);
        v187 = objc_claimAutoreleasedReturnValue();
        goto LABEL_298;
      }
      if (objc_msgSend(v211, "isEqualToArray:", shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray))
      {
        if (!objc_msgSend(v227, "count"))
          goto LABEL_202;
        v95 = v220;
        objc_msgSend(v227, "objectAtIndex:", 0);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend(v124, "intValue");

        if (v125 != 1)
        {
          v22 = v220;
          if (v125 != -1)
            goto LABEL_202;
          if (a4 < 2)
          {
            v175 = CFSTR("Every year on the last weekday %@");
            goto LABEL_293;
          }
          v98 = CFSTR("Every %u years on the last weekday %@");
LABEL_200:
          objc_msgSend(v232, "localizedStringForKey:value:table:", v98, &stru_1E67FB1F0, 0);
          v148 = objc_claimAutoreleasedReturnValue();
          v149 = (void *)MEMORY[0x1E0CB3940];
          v207 = (void *)v148;
          if (!(_DWORD)v24)
            goto LABEL_277;
          goto LABEL_276;
        }
        if (a4 < 2)
        {
          v176 = CFSTR("Every year on the first weekday %@");
          goto LABEL_296;
        }
        v167 = CFSTR("Every %u years on the first weekday %@");
      }
      else
      {
        if (!objc_msgSend(v211, "isEqualToArray:", shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray))
        {
          if (a4 < 2)
          {
            objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every year on the %@ %@"), &stru_1E67FB1F0, 0);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = (void *)MEMORY[0x1E0CB3940];
            v207 = v173;
            if ((_DWORD)v24)
            {
              objc_msgSend(v173, "lowercaseStringWithLocale:", v230);
              v173 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v164 = v173;
            objc_msgSend(v174, "localizedStringWithFormat:", v173, v235, v92);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v105 = 1;
            if (!(_DWORD)v24)
              goto LABEL_301;
          }
          else
          {
            objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("Every %u years on the %@ %@"), &stru_1E67FB1F0, 0);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            v163 = (void *)MEMORY[0x1E0CB3940];
            v207 = v162;
            if ((_DWORD)v24)
            {
              objc_msgSend(v162, "lowercaseStringWithLocale:", v230);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v164 = v162;
            objc_msgSend(v163, "localizedStringWithFormat:", v162, a4, v235, v92);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v105 = 1;
            if ((v24 & 1) == 0)
              goto LABEL_301;
          }
          goto LABEL_300;
        }
        if (!objc_msgSend(v227, "count"))
          goto LABEL_202;
        v95 = v220;
        objc_msgSend(v227, "objectAtIndex:", 0);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = objc_msgSend(v146, "intValue");

        if (v147 != 1)
        {
          v22 = v220;
          if (v147 != -1)
            goto LABEL_202;
          if (a4 < 2)
          {
            v175 = CFSTR("Every year on the last weekend day %@");
            goto LABEL_293;
          }
          v98 = CFSTR("Every %u years on the last weekend day %@");
          goto LABEL_200;
        }
        if (a4 < 2)
        {
          v176 = CFSTR("Every year on the first weekend day %@");
          goto LABEL_296;
        }
        v167 = CFSTR("Every %u years on the first weekend day %@");
      }
LABEL_275:
      objc_msgSend(v232, "localizedStringForKey:value:table:", v167, &stru_1E67FB1F0, 0);
      v148 = objc_claimAutoreleasedReturnValue();
      v207 = (void *)v148;
      v149 = (void *)MEMORY[0x1E0CB3940];
      v22 = v95;
      if (!(_DWORD)v24)
      {
LABEL_277:
        v164 = (void *)v148;
        objc_msgSend(v149, "localizedStringWithFormat:", v148, a4, v92);
        goto LABEL_299;
      }
LABEL_276:
      objc_msgSend(v207, "lowercaseStringWithLocale:", v230);
      v148 = objc_claimAutoreleasedReturnValue();
      goto LABEL_277;
    case 4:
      if (a4 >= 2)
      {
        v223 = v17;
        v25 = v22;
        v26 = v16;
        v27 = v19;
        v28 = CFSTR("Every %u hours");
LABEL_28:
        objc_msgSend(v232, "localizedStringForKey:value:table:", v28, &stru_1E67FB1F0, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        v52 = (void *)MEMORY[0x1E0CB3940];
        v53 = v50;
        if (a11)
        {
          objc_msgSend(v50, "lowercaseStringWithLocale:", v230);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v30 = (void *)v230;
        objc_msgSend(v52, "localizedStringWithFormat:", v53, a4);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (a11)

        v19 = v27;
        v29 = v229;
        v22 = v25;
        v23 = v223;
        v24 = (uint64_t)v226;
        goto LABEL_320;
      }
      v26 = v16;
      v54 = CFSTR("Hourly");
LABEL_54:
      objc_msgSend(v232, "localizedStringForKey:value:table:", v54, &stru_1E67FB1F0, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v63;
      v30 = (void *)v230;
      if (a11)
      {
        objc_msgSend(v63, "lowercaseStringWithLocale:");
        v65 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v65 = v63;
      }
      v31 = v65;
      v29 = v229;

      goto LABEL_158;
    default:
      v26 = v16;
      v29 = v229;
      v30 = (void *)v230;
      v31 = 0;
      goto LABEL_320;
  }
}

void __165__REMRecurrenceRuleFormatter_shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = (void *)MEMORY[0x1E0C99D20];
  +[REMRecurrenceDayOfWeek dayOfWeek:](REMRecurrenceDayOfWeek, "dayOfWeek:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRecurrenceDayOfWeek dayOfWeek:](REMRecurrenceDayOfWeek, "dayOfWeek:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRecurrenceDayOfWeek dayOfWeek:](REMRecurrenceDayOfWeek, "dayOfWeek:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRecurrenceDayOfWeek dayOfWeek:](REMRecurrenceDayOfWeek, "dayOfWeek:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRecurrenceDayOfWeek dayOfWeek:](REMRecurrenceDayOfWeek, "dayOfWeek:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithObjects:", v1, v2, v3, v4, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray;
  shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekdaysByDayArray = v6;

  v8 = (void *)MEMORY[0x1E0C99D20];
  +[REMRecurrenceDayOfWeek dayOfWeek:](REMRecurrenceDayOfWeek, "dayOfWeek:", 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[REMRecurrenceDayOfWeek dayOfWeek:](REMRecurrenceDayOfWeek, "dayOfWeek:", 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObjects:", v12, v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray;
  shortNaturalLanguageDescriptionForFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_setPositions_date_timeZone_lowercase____WeekendsByDayArray = v10;

}

+ (id)_stringForDayOfWeek:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(a1, "_readableWeekDays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 < 0 || objc_msgSend(v4, "count") <= a3)
  {
    v6 = CFSTR("???");
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_stringForMonthNumber:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(a1, "_readableMonths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 >= 1 && objc_msgSend(v4, "count") >= a3)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3 - 1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("???");
  }

  return v6;
}

+ (id)_byDayOfWeekOrdinalStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("last"), &stru_1E67FB1F0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("first"), &stru_1E67FB1F0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("second"), &stru_1E67FB1F0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("third"), &stru_1E67FB1F0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("fourth"), &stru_1E67FB1F0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("fifth"), &stru_1E67FB1F0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_customByDayItemFormatLocalizedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Custom by-day item format"), CFSTR("%@ %@"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_stringForByDayOfWeek:(id)a3 setPositions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_byDayOfWeekOrdinalStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "weekNumber"))
  {
    if (objc_msgSend(v6, "weekNumber") != -1)
    {
      if (objc_msgSend(v6, "weekNumber") > 5)
        goto LABEL_11;
      if (objc_msgSend(v6, "weekNumber") <= 0)
        goto LABEL_11;
      v9 = objc_msgSend(v6, "weekNumber");
      if (v9 < 0)
        goto LABEL_11;
LABEL_13:
      objc_msgSend(v8, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v11 == -1)
      goto LABEL_12;
    if (v11 - 1 < 5)
    {
      v9 = v11;
      goto LABEL_13;
    }
  }
LABEL_11:
  v12 = 0;
LABEL_14:
  objc_msgSend(a1, "_stringForDayOfWeek:", objc_msgSend(v6, "dayOfTheWeek", v9) - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_customByDayItemFormatLocalizedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v15, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_localizedOfMonthStringForMonth:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intValue");

  if ((v6 - 1) > 0xB)
  {
    v7 = &stru_1E67FB1F0;
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", off_1E67F8F80[v6 - 1], &stru_1E67FB1F0, 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (int64_t)repeatTypeForRecurrenceRules:(id)a3 recurrenceDate:(id)a4 recurrenceTimeZone:(id)a5 getRepeatEnd:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id *v28;
  id v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "count");
  v14 = v13;
  if (!v13)
  {
    v21 = 0;
    if (!a6)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v13 == 1)
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v27 = a1;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v15, "frequency");
    v25 = objc_msgSend(v15, "interval");
    objc_msgSend(v15, "daysOfTheWeek");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "daysOfTheMonth");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "monthsOfTheYear");
    v29 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "weeksOfTheYear");
    v28 = a6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "daysOfTheYear");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPositions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recurrenceEnd");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v14 = objc_msgSend(v27, "repeatTypeForFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:recurrenceDate:recurrenceTimeZone:getRepeatEnd:", v26, v25, v24, v23, v16, v17, v18, v19, v20, v11, v29, &v30);
    v21 = v30;

    a6 = v28;
    v12 = v29;

    if (!v28)
      goto LABEL_9;
    goto LABEL_8;
  }
  v21 = 0;
  v14 = 11;
  if (a6)
LABEL_8:
    *a6 = objc_retainAutorelease(v21);
LABEL_9:

  return v14;
}

+ (int64_t)repeatTypeForFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11 recurrenceDate:(id)a12 recurrenceTimeZone:(id)a13 getRepeatEnd:(id *)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  int64_t v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  id v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  id v40;
  void *v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  id v59;
  id v60;
  id v61;
  id v62;

  v17 = a5;
  v62 = a6;
  v18 = a7;
  v19 = a8;
  v60 = a9;
  v61 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = objc_msgSend(v20, "occurrenceCount");
  v24 = v18;
  if (v23)
  {
    v25 = 11;
    v26 = v17;
    v27 = v19;
    v28 = a14;
    if (v20)
      goto LABEL_3;
LABEL_60:
    v29 = 0;
    if (!v28)
      goto LABEL_7;
    goto LABEL_6;
  }
  v31 = v17;
  v32 = objc_msgSend(v31, "count");
  v54 = v31;
  v33 = v32;
  switch(a3)
  {
    case 0:
      v25 = 11;
      v27 = v19;
      v26 = v17;
      if (a4 != 1)
        goto LABEL_55;
      v28 = a14;
      if (!v32)
      {
        if (objc_msgSend(v24, "count"))
          goto LABEL_54;
        if (objc_msgSend(v62, "count"))
          v25 = 11;
        else
          v25 = 2;
      }
      goto LABEL_59;
    case 1:
      v27 = v19;
      if ((unint64_t)(a4 - 1) > 1)
      {
        v25 = 11;
LABEL_57:
        v28 = a14;
      }
      else
      {
        v28 = a14;
        if (objc_msgSend(v24, "count") || objc_msgSend(v61, "count"))
          goto LABEL_19;
        if (!v33 || v33 == 1 && recurrenceDateMatchesAnyDaySpecifiedInByDayList(v31, v21, v22))
        {
          if (a4 == 1)
            v25 = 5;
          else
            v25 = 6;
        }
        else
        {
          if (a4 != 1)
          {
LABEL_19:
            v25 = 11;
            goto LABEL_58;
          }
          v50 = objc_msgSend((id)objc_opt_class(), "daysTypeForDayArray:", v31);
          v51 = 11;
          if (v50 == 2)
            v51 = 3;
          if (v50 == 3)
            v25 = 4;
          else
            v25 = v51;
        }
      }
LABEL_58:
      v26 = v17;
      goto LABEL_59;
    case 2:
      v34 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a4 == 6;
      v25 = 11;
      v27 = v19;
      v26 = v17;
      if (!v34)
        goto LABEL_55;
      v28 = a14;
      if (v32)
        goto LABEL_59;
      if (objc_msgSend(v24, "count"))
        goto LABEL_54;
      v35 = v62;
      v36 = objc_msgSend(v35, "count");
      v59 = v35;
      v37 = recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v35, v21, v22);
      v38 = v37;
      v56 = v36;
      if (v36 == 1)
        v39 = v37;
      else
        v39 = 0;
      v40 = v61;
      if (!objc_msgSend(v40, "count"))
        goto LABEL_33;
      v52 = v38;
      v53 = v39;
      objc_msgSend(v40, "objectAtIndex:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "integerValue");

      if (v42 == -1)
      {
        if (v52)
          goto LABEL_72;
LABEL_38:
        v25 = 11;
        goto LABEL_77;
      }
      v39 = v53;
      if (v42)
        goto LABEL_38;
LABEL_33:
      if (v56)
        v43 = v39;
      else
        v43 = 1;
      if (v43 != 1)
        goto LABEL_38;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTimeZone:", v22);
      objc_msgSend(v44, "components:fromDate:", 16, v21);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v45, "day");

      if ((unint64_t)(v57 - 29) < 3)
        goto LABEL_38;
LABEL_72:
      v49 = 7;
      if (a4 == 6)
        v49 = 9;
      if (a4 == 3)
        v25 = 8;
      else
        v25 = v49;
LABEL_77:
      v47 = v59;

LABEL_78:
LABEL_59:

      if (!v20)
        goto LABEL_60;
LABEL_3:
      objc_msgSend(v20, "endDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v20, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v28)
LABEL_6:
        *v28 = objc_retainAutorelease(v29);
LABEL_7:

      return v25;
    case 3:
      v46 = objc_msgSend(v24, "count");
      v25 = 11;
      v27 = v19;
      v26 = v17;
      if (a4 != 1)
        goto LABEL_55;
      v28 = a14;
      if (v33)
        goto LABEL_59;
      if (v46 && (v46 != 1 || !recurrenceMonthMatchesAnyMonthSpecifiedInByMonthList(v24, v21, v22))
        || objc_msgSend(v60, "count")
        || objc_msgSend(v61, "count")
        || objc_msgSend(v27, "count"))
      {
        goto LABEL_54;
      }
      v47 = v62;
      v48 = objc_msgSend(v47, "count");
      if (!v48 || v48 == 1 && recurrenceDateMatchesAnyDaySpecifiedInByMonthDayList(v47, v21, v22))
        v25 = 10;
      else
        v25 = 11;
      goto LABEL_78;
    case 4:
      v25 = 11;
      v27 = v19;
      v26 = v17;
      if (a4 == 1)
      {
        v28 = a14;
        if (!v32)
        {
          if (objc_msgSend(v24, "count"))
          {
LABEL_54:
            v25 = 11;
          }
          else if (objc_msgSend(v62, "count"))
          {
            v25 = 11;
          }
          else
          {
            v25 = 1;
          }
        }
      }
      else
      {
LABEL_55:
        v28 = a14;
      }
      goto LABEL_59;
    default:
      v25 = 11;
      v27 = v19;
      goto LABEL_57;
  }
}

+ (id)localizedDescriptionForRepeatType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  switch(a3)
  {
    case 0:
      v6 = CFSTR("Never");
      goto LABEL_13;
    case 1:
      v6 = CFSTR("Hourly");
      goto LABEL_13;
    case 2:
      v6 = CFSTR("Daily");
      goto LABEL_13;
    case 3:
      v6 = CFSTR("Weekdays");
      goto LABEL_13;
    case 4:
      v6 = CFSTR("Weekends");
      goto LABEL_13;
    case 5:
      v6 = CFSTR("Weekly");
      goto LABEL_13;
    case 6:
      v6 = CFSTR("Biweekly");
      goto LABEL_13;
    case 7:
      v6 = CFSTR("Monthly");
      goto LABEL_13;
    case 8:
      v6 = CFSTR("Every 3 Months");
      goto LABEL_13;
    case 9:
      v6 = CFSTR("Every 6 Months");
      goto LABEL_13;
    case 10:
      v6 = CFSTR("Yearly");
LABEL_13:
      v7 = &stru_1E67FB1F0;
      goto LABEL_14;
    case 11:
      v6 = CFSTR("LOCALIZED_CUSTOM_REPEAT_TYPE_DESCRIPTION");
      v7 = CFSTR("Custom");
LABEL_14:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

@end
