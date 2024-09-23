@implementation PGTimeTitleUtility

+ (id)timeTitleWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  void *v34;
  id v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  BOOL v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  id v50;
  void *v51;
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  int v62;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  unint64_t v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122[2];

  v4 = a3;
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "allowedFormats");
  objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "locationNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_locationNodesForTimeTitleFromLocationNodes:", v7);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v4, "filterDates");
    objc_msgSend(v4, "featuredYearNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0;
    v122[0] = 0;
    v105 = a1;
    v10 = v5;
    objc_msgSend(a1, "_dateNodesFromMomentNodes:featuredYearNodes:momentsLocalStartDate:momentsLocalEndDate:", v5, v9, v122, &v121);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v122[0];
    v13 = v121;

    v119 = 0;
    v120 = 0;
    v104 = (void *)v11;
    +[PGCommonTitleUtility startAndEndDateNodeFromDateNodes:startDateNode:endDateNode:](PGCommonTitleUtility, "startAndEndDateNodeFromDateNodes:startDateNode:endDateNode:", v11, &v120, &v119);
    v14 = v120;
    v15 = v119;
    objc_msgSend(v14, "monthNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v14;
    v110 = v16;
    v97 = v8;
    v17 = v4;
    if (objc_msgSend(v14, "isSameNodeAsNode:", v15))
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v15, "monthNode");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v18;
    objc_msgSend(v14, "yearNode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v21;
    if (objc_msgSend(v14, "isSameNodeAsNode:", v15))
    {
      v22 = v21;
    }
    else
    {
      objc_msgSend(v15, "yearNode");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v107 = v22;
    v5 = v10;
    v101 = objc_msgSend(v105, "numberOfYearsFromDate:toDate:", v12, v116);
    v95 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v116);
    v23 = objc_msgSend(v110, "calendarUnitValue");
    v114 = v12;
    v4 = v17;
    v103 = v20;
    v93 = v23;
    if (v110 != v20)
      v23 = objc_msgSend(v20, "calendarUnitValue");
    v99 = v23;
    v24 = v107;
    v108 = v13;
    v25 = objc_msgSend(v105, "numberOfYearsFromDate:toDate:", v13, v116);
    v26 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v116);
    v106 = objc_msgSend(v111, "calendarUnitValue");
    v113 = v106;
    if (v111 != v107)
      v113 = objc_msgSend(v107, "calendarUnitValue");
    v109 = v15;
    if (objc_msgSend(v112, "count"))
    {
      v27 = 0;
      if (objc_msgSend(v10, "count") && v12)
      {
        objc_msgSend(v115, "localDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "localDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v28);
        v31 = vcvtpd_u64_f64(v30 / 86400.0) + 1;
        if (v31 >= 2 && ((v6 & 2) != 0 || (v6 & 4) != 0 || (v6 & 8) != 0))
        {
          v60 = objc_msgSend(v105, "_hasReachedNumberVisitsPerMonth:inEvents:withLocationNodes:startDateNode:endDateNode:", 3, v10, v112, v115, v109);
          if (v31 > 9 || (v27 = v6 & 1, (v60 & 1) == 0))
          {
            v61 = 2;
            if ((v6 & 2) == 0)
              v61 = v6 & 1;
            if ((v6 & 8) != 0)
              v27 = 6;
            else
              v27 = v61;
            if ((v6 & 4) != 0
              && v31 >= 5
              && (objc_msgSend(v105, "_hasReachedNumberVisitsPerYear:inEvents:withLocationNodes:startDateNode:endDateNode:", 3, v10, v112, v115, v109) & 1) == 0)
            {
              v62 = objc_msgSend(v115, "isEqual:", v109);
              if (!(v106 == v113 ? v62 : 1))
                v27 = 3;
            }
          }
        }
        else
        {
          v27 = v6 & 1;
        }

        v5 = v10;
        v24 = v107;
      }
    }
    else
    {
      v27 = 0;
    }
    if ((v6 & 0x40) != 0)
      v32 = 4;
    else
      v32 = v27;
    if (!v32)
      v32 = objc_msgSend(v105, "_dateIntervalFormatterTypeWithEventNodes:allowedFormats:", v5, v6);
    v33 = objc_msgSend(v105, "_canUseOverTheYearsForStartYear:endYear:", v106, v113);
    if ((v6 & 0x10) != 0 && (!v32 || v32 == 3 && v33))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = CFSTR("PGTimeTitleFormatOverTheYears");
      goto LABEL_40;
    }
    if ((v6 & 0x20) != 0 && v25 == v101 && (unint64_t)(v25 - 1) <= 0x31)
    {
      if (v101 != 1 || v95 == v99)
      {
        v44 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("Localizable"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringWithFormat:", v45, v101);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_59;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = CFSTR("PGRelativeDateLastYear");
LABEL_40:
      objc_msgSend(v34, "localizedStringForKey:value:table:", v36, v36, CFSTR("Localizable"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_59:
      v38 = v109;
      v46 = v110;
      goto LABEL_60;
    }
    v38 = v109;
    if (v12)
    {
      if (v32 == 1)
        goto LABEL_65;
      v40 = (v6 & 1) != 0 && v95 == v99 && v26 == v113;
      v41 = v40;
      if (!v40 && (v6 & 2) != 0 && v26 == v113)
      {
        v32 = 2;
        goto LABEL_65;
      }
      if (v41)
        v32 = 1;
      if (v32)
      {
LABEL_65:
        v49 = 0x1E0D71000;
        v102 = v32;
        if (!v97)
          goto LABEL_106;
        if (v32 > 5 || ((1 << v32) & 0x32) == 0 || objc_msgSend(v5, "count") != 1)
        {
          v53 = objc_msgSend(v4, "filterForSignificantDateNodes");
          v49 = 0x1E0D71000;
          if (!v53)
            goto LABEL_106;
          if (v32 == 3)
            goto LABEL_79;
          if (v32 != 2)
            goto LABEL_106;
          if (v93 == v99)
          {
LABEL_79:
            if (v106 == v113)
            {
LABEL_106:
              v35 = objc_alloc_init(*(Class *)(v49 + 1704));
              objc_msgSend(v4, "locale");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setLocale:", v74);

              if ((v6 & 0x40) != 0)
              {
                v76 = v114;

                v75 = v76;
              }
              else
              {
                v75 = v108;
              }
              v108 = v75;
              objc_msgSend(v35, "stringFromStartDate:endDate:type:", v114);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v109;
              v46 = v110;
              if (v102 == 3 && v106 != v113)
              {
                v47 = v103;
                if (objc_msgSend(v4, "usePeopleSubtitleFormatWithYears"))
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("PGPeopleSubtitleFormatWithYears %@"), CFSTR("PGPeopleSubtitleFormatWithYears %@"), CFSTR("Localizable"));
                  v78 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v78, v37);
                  v79 = objc_claimAutoreleasedReturnValue();

                  v38 = v109;
                  v37 = (void *)v79;
                }
                goto LABEL_61;
              }
LABEL_60:
              v47 = v103;
LABEL_61:

              v48 = v112;
LABEL_73:
              v43 = v37;

              goto LABEL_74;
            }
          }
          objc_msgSend(v105, "significantDateNodesFromMomentNodes:dateFormatterType:", v5, v32);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "featuredYearNodes");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count");

          if (v56)
          {
            objc_msgSend(v4, "featuredYearNodes");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "_featuredDateNodesFromDateNodes:featuredYearNodes:", v54, v57);
            v58 = objc_claimAutoreleasedReturnValue();

            v54 = (void *)v58;
          }
          v59 = objc_msgSend(v54, "count");
          if (v59 == objc_msgSend(v104, "count"))
          {

            v49 = 0x1E0D71000;
            goto LABEL_106;
          }
          v117 = 0;
          v118 = 0;
          v100 = v54;
          +[PGCommonTitleUtility startAndEndDateNodeFromDateNodes:startDateNode:endDateNode:](PGCommonTitleUtility, "startAndEndDateNodeFromDateNodes:startDateNode:endDateNode:", v54, &v118, &v117);
          v64 = v118;
          v68 = v117;
          objc_msgSend(v64, "localDate");
          v72 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "localDate");
          v80 = objc_claimAutoreleasedReturnValue();
          v81 = (void *)v80;
          v37 = 0;
          if (v72 && v80)
          {
            v82 = v80;
            v83 = objc_alloc_init(MEMORY[0x1E0D716A8]);
            objc_msgSend(v4, "locale");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "setLocale:", v84);

            v85 = (void *)v82;
            objc_msgSend(v83, "stringFromStartDate:endDate:type:", v114, v108, v102);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = v83;
            v94 = v85;
            objc_msgSend(v83, "stringFromStartDate:endDate:type:", v72, v85, v102);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v86, "length");
            if (v87 < objc_msgSend(v37, "length"))
            {
              v88 = v86;

              v37 = v88;
            }
            v96 = v86;
            if (v102 == 3)
            {
              v89 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v72);
              v81 = v94;
              if (v89 != objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v94)
                && objc_msgSend(v4, "usePeopleSubtitleFormatWithYears"))
              {
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("PGPeopleSubtitleFormatWithYears %@"), CFSTR("PGPeopleSubtitleFormatWithYears %@"), CFSTR("Localizable"));
                v91 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v91, v37);
                v92 = objc_claimAutoreleasedReturnValue();

                v37 = (void *)v92;
              }
              v24 = v107;
            }
            else
            {
              v24 = v107;
              v81 = v94;
            }

          }
          v50 = v100;
          goto LABEL_105;
        }
        objc_msgSend(v115, "dayNode");
        v50 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v115, "isSameNodeAsNode:", v109))
        {
          objc_msgSend(v50, "calendarUnitValue");
          v51 = v12;
        }
        else
        {
          objc_msgSend(v109, "dayNode");
          v64 = (id)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v50, "calendarUnitValue");
          v51 = v12;
          if (v64 != v50)
          {
            v66 = v65;
            v67 = objc_msgSend(v64, "calendarUnitValue");
            v68 = v12;
            if (v66 != v67)
            {
              objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 32, v108);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "hour");

              if (v70 >= 12)
              {
                v71 = v108;

                v68 = v71;
              }
            }
            goto LABEL_104;
          }
        }
        v68 = v51;
        v64 = v50;
LABEL_104:
        v72 = objc_alloc_init(MEMORY[0x1E0D716A8]);
        objc_msgSend(v4, "locale");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setLocale:", v73);

        objc_msgSend(v72, "stringFromStartDate:endDate:type:", v51, v68, v102);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v107;
LABEL_105:

        v48 = v112;
        v38 = v109;
        v49 = 0x1E0D71000uLL;
        if (!v37)
          goto LABEL_106;
LABEL_72:
        v46 = v110;
        v47 = v103;
        goto LABEL_73;
      }
    }
    v37 = 0;
    v48 = v112;
    goto LABEL_72;
  }
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("PGTimeTitleFormatOverTheYears"), CFSTR("PGTimeTitleFormatOverTheYears"), CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  v43 = v19;
LABEL_74:

  return v43;
}

+ (id)_featuredDateNodesFromDateNodes:(id)a3 featuredYearNodes:(id)a4
{
  id v5;
  id v6;
  PGGraphDateNodeCollection *v7;
  void *v8;
  PGGraphDateNodeCollection *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = [PGGraphDateNodeCollection alloc];
  objc_msgSend(v5, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAElementCollection initWithSet:graph:](v7, "initWithSet:graph:", v6, v8);

  objc_msgSend(v5, "dateNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAElementCollection collectionByIntersecting:](v9, "collectionByIntersecting:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)timeTitleWithDateInterval:(id)a3 allowedFormats:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v7);
  v10 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v8);
  v11 = ((uint64_t)(a4 << 61) >> 63) & 3;
  if ((a4 & 2) != 0)
    v11 = 2;
  v12 = (a4 & 1) == 0 && (a4 & 6) == 0;
  if ((a4 & 1) != 0)
    v13 = 1;
  else
    v13 = v11;
  if ((a4 & 0x10) != 0)
  {
    if ((v12 | objc_msgSend(a1, "_canUseOverTheYearsForStartYear:endYear:", v9, v10)) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PGTimeTitleFormatOverTheYears"), CFSTR("PGTimeTitleFormatOverTheYears"), CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_22:
    v23 = objc_alloc_init(MEMORY[0x1E0D716A8]);
    objc_msgSend(v23, "stringFromStartDate:endDate:type:", v7, v8, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  if ((a4 & 0x20) == 0)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "numberOfYearsFromDate:toDate:", v7, v14);
  v16 = objc_msgSend(a1, "numberOfYearsFromDate:toDate:", v8, v14);
  if (v16 != v15 || (unint64_t)(v16 - 1) >= 0x32)
  {

    goto LABEL_22;
  }
  v17 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v14);
  v18 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v8);
  if (v15 != 1 || v17 == v18)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v22, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PGRelativeDateLastYear"), CFSTR("PGRelativeDateLastYear"), CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:
  if (!v20)
    goto LABEL_22;
LABEL_23:

  return v20;
}

+ (id)splitTimeTitleWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "allowedFormats");
  v26 = 0;
  v27 = 0;
  objc_msgSend(a1, "_dateNodesFromMomentNodes:featuredYearNodes:momentsLocalStartDate:momentsLocalEndDate:", v5, 0, &v27, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  v9 = v26;
  v24 = 0;
  v25 = 0;
  +[PGCommonTitleUtility startAndEndDateNodeFromDateNodes:startDateNode:endDateNode:](PGCommonTitleUtility, "startAndEndDateNodeFromDateNodes:startDateNode:endDateNode:", v7, &v25, &v24);
  v10 = v25;
  v11 = v24;
  if (v8 && objc_msgSend(v7, "count"))
  {
    if (!objc_msgSend(v4, "filterDates") || objc_msgSend(v5, "count") != 1)
      goto LABEL_13;
    objc_msgSend(v10, "dayNode");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    if (objc_msgSend(v10, "isSameNodeAsNode:", v11))
    {
      v12 = v12;
      objc_msgSend(v12, "calendarUnitValue");
    }
    else
    {
      objc_msgSend(v11, "dayNode");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "calendarUnitValue");
      if (v21 != v12)
      {
        v12 = v21;
        if (v14 != objc_msgSend(v21, "calendarUnitValue"))
        {
          objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 32, v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v15, "hour");

          v16 = v21;
          v12 = v21;
          if (v20 > 11)
            goto LABEL_12;
        }
      }
    }
    v22 = v8;

    v17 = v10;
    v16 = v12;
    v11 = v17;
    v9 = v22;
LABEL_12:

LABEL_13:
    objc_msgSend(v4, "locale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_splitTimeTitleWithLocalStartDate:endDate:startDateNode:endDateNode:allowedFormats:locale:", v8, v9, v10, v11, v6, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

  return v13;
}

+ (id)splitTimeTitleWithDateInterval:(id)a3 allowedFormats:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_splitTimeTitleWithLocalStartDate:endDate:startDateNode:endDateNode:allowedFormats:locale:", v7, v8, 0, 0, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_splitTimeTitleWithLocalStartDate:(id)a3 endDate:(id)a4 startDateNode:(id)a5 endDateNode:(id)a6 allowedFormats:(unint64_t)a7 locale:(id)a8
{
  char v9;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  char v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  _BOOL8 v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v45 = a8;
  if (v16)
  {
    v18 = objc_msgSend(v16, "year");
    v19 = objc_msgSend(v16, "month");
  }
  else
  {
    v18 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v14);
    v19 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v14);
  }
  v20 = v19;
  v44 = v14;
  if (v17)
  {
    v21 = objc_msgSend(v17, "year");
    v22 = objc_msgSend(v17, "month");
  }
  else
  {
    v21 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v15);
    v22 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v15);
  }
  v42 = v20;
  v43 = v16;
  v41 = v22;
  v23 = v15;
  if ((v9 & 1) != 0)
  {
    v27 = 0;
    v26 = 0;
    v25 = 3;
    v24 = 4;
    goto LABEL_18;
  }
  if ((v9 & 2) != 0)
  {
    v27 = 0;
    v26 = 0;
    v25 = 3;
    v24 = 6;
    goto LABEL_18;
  }
  if ((v9 & 4) == 0)
  {
    v24 = 0;
    if ((v9 & 0x10) == 0)
    {
      v25 = 0;
      v26 = 0;
LABEL_17:
      v27 = 1;
      goto LABEL_18;
    }
LABEL_16:
    v25 = v24;
    v29 = v18;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PGTimeTitleFormatOverTheYears"), CFSTR("PGTimeTitleFormatOverTheYears"), CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v29;
    v24 = 0;
    goto LABEL_17;
  }
  v28 = objc_msgSend(a1, "_canUseOverTheYearsForStartYear:endYear:", v18, v21);
  v25 = 0;
  v27 = 0;
  v24 = 3;
  if ((v9 & 0x10) != 0)
  {
    v26 = 0;
    if ((v28 & 1) == 0)
      goto LABEL_18;
    goto LABEL_16;
  }
  v26 = 0;
LABEL_18:
  if (v18 != v21 && v26 == 0)
    v32 = 0;
  else
    v32 = v25;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc_init(MEMORY[0x1E0D716A8]);
  objc_msgSend(v34, "setLocale:", v45);
  if ((v27 & 1) != 0)
  {
    v35 = v44;
  }
  else
  {
    v37 = v42 == v41 && v18 == v21;
    v35 = v44;
    objc_msgSend(v34, "stringFromStartDate:endDate:type:showLongMonthFormatIfNeeded:", v44, v23, v24, v37);
    v38 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v38;
  }
  if (v26)
    objc_msgSend(v33, "addObject:", v26);
  if (v32)
  {
    objc_msgSend(v34, "stringFromStartDate:endDate:type:showLongMonthFormatIfNeeded:", v35, v23, v32, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_msgSend(v33, "addObject:", v39);

  }
  return v33;
}

+ (id)peopleTimeTitleWithEventNodes:(id)a3 requireMultipleYears:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestampUTCStart"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isSameNodeAsNode:", v10))
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(v10, "localStartDate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;
    if (!v11)
    {
      v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v9, "graph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateNodeForLocalDate:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v30 = a4;
    if (v14 == v11)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v15, "dateNodeForLocalDate:", v14);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    v33 = v15;
    v34 = v10;
    objc_msgSend(v17, "yearNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v19;
    if (objc_msgSend(v17, "isSameNodeAsNode:", v19))
    {
      objc_msgSend(v20, "calendarUnitValue");
    }
    else
    {
      objc_msgSend(v19, "yearNode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "calendarUnitValue");
      if (v20 != v21)
      {
        v23 = v22;
        v28 = objc_msgSend(v21, "calendarUnitValue");
        v24 = objc_alloc_init(MEMORY[0x1E0D716A8]);
        v25 = v24;
        if (v23 != v28)
        {
          objc_msgSend(v24, "stringFromStartDate:endDate:type:", v11, v14, 3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PGPeopleSubtitleFormatWithYears %@"), CFSTR("PGPeopleSubtitleFormatWithYears %@"), CFSTR("Localizable"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v29, v31);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
          v10 = v34;
          goto LABEL_21;
        }
LABEL_17:
        if (v30)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v25, "stringFromStartDate:endDate:type:", v11, v14, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_20;
      }
    }
    v25 = objc_alloc_init(MEMORY[0x1E0D716A8]);
    v21 = v20;
    goto LABEL_17;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

+ (id)peopleTimeTitleWithEventNodes:(id)a3
{
  return (id)objc_msgSend(a1, "peopleTimeTitleWithEventNodes:requireMultipleYears:", a3, 0);
}

+ (id)_numberOfYearsAgoWithEventNodes:(id)a3 relativeToDateComponents:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id obj;
  uint8_t buf[16];
  _QWORD v25[8];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__17477;
  v40 = __Block_byref_object_dispose__17478;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__17477;
  v34 = __Block_byref_object_dispose__17478;
  v35 = 0;
  v7 = objc_msgSend(v6, "year");
  v8 = objc_msgSend(v6, "month");
  v9 = objc_msgSend(v6, "day");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25[0] = v12;
        v25[1] = 3221225472;
        v25[2] = __79__PGTimeTitleUtility__numberOfYearsAgoWithEventNodes_relativeToDateComponents___block_invoke;
        v25[3] = &unk_1E842A0A0;
        v25[6] = v9;
        v25[7] = v8;
        v25[4] = &v30;
        v25[5] = &v36;
        objc_msgSend(v14, "enumerateDateNodesUsingBlock:", v25);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v10);
  }

  v15 = v37[5];
  if (!v15)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "No matching date node found. Falling back to any date node from event nodes", buf, 2u);
    }

    objc_storeStrong(v37 + 5, (id)v31[5]);
    v15 = v37[5];
    if (!v15)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cannot generate ordinalYearsAgo string. Reason: No date node found.", buf, 2u);
      }

      goto LABEL_17;
    }
  }
  v18 = objc_msgSend(v15, "year");
  if (v18 <= v7)
  {
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18 - v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v19;
}

+ (id)numberOfYearsAgoWithMomentNodes:(id)a3 relativeToDateComponents:(id)a4 useOrdinal:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a5;
  objc_msgSend(a1, "_numberOfYearsAgoWithEventNodes:relativeToDateComponents:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v8, "setNumberStyle:", 6);
      objc_msgSend(v8, "stringFromNumber:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_canUseOverTheYearsForStartYear:(int64_t)a3 endYear:(int64_t)a4
{
  return a3 + 2 <= a4;
}

+ (BOOL)_yearIsNeededForDisplayingDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0D4B130];
  v4 = a3;
  objc_msgSend(v3, "currentLocalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compareDate:toDate:toUnitGranularity:", v5, v4, 4);

  return v6 != 0;
}

+ (BOOL)yearIsNeededForDisplayingDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0D4B130];
  v4 = a3;
  objc_msgSend(v3, "currentLocalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compareDate:toDate:toUnitGranularity:", v5, v4, 4);

  return v6 != 0;
}

+ (unint64_t)_dateIntervalFormatterTypeWithEventNodes:(id)a3 allowedFormats:(unint64_t)a4
{
  char v4;
  id v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = v4 & 1;
    if ((v4 & 0xE) != 0)
    {
      v8 = objc_msgSend(a1, "_eventNodesCoverCompleteMonth:", v6);
      if ((v4 & 1) == 0 || v8)
      {
        v9 = 2;
        if ((v4 & 2) == 0)
          v9 = v4 & 1;
        if ((v4 & 8) != 0)
          v7 = 6;
        else
          v7 = v9;
        if ((v4 & 4) != 0)
        {
          v10 = objc_msgSend(a1, "_eventNodesCoverCompleteYear:", v6);
          if ((v4 & 0xB) != 0)
            v11 = v10;
          else
            v11 = 1;
          if (v11)
            v7 = 3;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_eventNodesCoverCompleteMonth:(id)a3
{
  return objc_msgSend(a1, "_momentNodes:coverCompleteMonth:coverCompleteYear:", a3, 1, 0);
}

+ (BOOL)_eventNodesCoverCompleteYear:(id)a3
{
  return objc_msgSend(a1, "_momentNodes:coverCompleteMonth:coverCompleteYear:", a3, 0, 1);
}

+ (BOOL)_momentNodes:(id)a3 coverCompleteMonth:(BOOL)a4 coverCompleteYear:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  BOOL v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke;
        v19[3] = &unk_1E842A118;
        v24 = a4;
        v25 = a5;
        v20 = v9;
        v23 = a1;
        v15 = v10;
        v21 = v15;
        v22 = &v30;
        objc_msgSend(v14, "enumerateDateNodesUsingBlock:", v19);
        LOBYTE(v14) = *((_BYTE *)v31 + 24) == 0;

        if ((v14 & 1) == 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v11)
            goto LABEL_4;
          break;
        }
      }
    }

    v16 = *((_BYTE *)v31 + 24) == 0;
    _Block_object_dispose(&v30, 8);
    v8 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)_enumerateNeighborMomentNodesOfMomentNodes:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, uint64_t);
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[3];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke;
  aBlock[3] = &unk_1E842A168;
  v8 = v5;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = v18;
  v17 = &v20;
  v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v11[2](v11, 1);
  if (!*((_BYTE *)v21 + 24))
    v11[2](v11, 0);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

}

+ (BOOL)_hasReachedNumberVisitsPerMonth:(unint64_t)a3 inEvents:(id)a4 withLocationNodes:(id)a5 startDateNode:(id)a6 endDateNode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void (**v17)(void *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a1, "_commonLocationLabelForLocationNodes:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 1;
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke;
    v26 = &unk_1E842A1E0;
    v31 = a1;
    v27 = v12;
    v28 = v16;
    v29 = v13;
    v30 = &v33;
    v32 = a3;
    v17 = (void (**)(void *, uint64_t))_Block_copy(&v23);
    v18 = objc_msgSend(v14, "month", v23, v24, v25, v26);
    v19 = v18;
    if ((objc_msgSend(v14, "isEqual:", v15) & 1) == 0)
      v19 = objc_msgSend(v15, "month");
    v17[2](v17, v18);
    v20 = v34;
    if (v18 != v19 && v34[3] < a3)
    {
      v17[2](v17, v19);
      v20 = v34;
    }
    v21 = v20[3] >= a3;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)_hasReachedNumberVisitsPerYear:(unint64_t)a3 inEvents:(id)a4 withLocationNodes:(id)a5 startDateNode:(id)a6 endDateNode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void (**v20)(void *, void *);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a1, "_commonLocationLabelForLocationNodes:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v29 = v12;
    v17 = objc_msgSend(v14, "month");
    v18 = objc_msgSend(v14, "isEqual:", v15);
    v19 = v17;
    if ((v18 & 1) == 0)
      v19 = objc_msgSend(v15, "month");
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke;
    aBlock[3] = &unk_1E842A280;
    v34 = v17;
    v35 = v19;
    v31 = v16;
    v32 = v13;
    v33 = &v37;
    v36 = a3;
    v20 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(v14, "collection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "yearNodes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "anyNode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0)
    {
      v24 = 0;
    }
    else
    {
      objc_msgSend(v15, "collection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "yearNodes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "anyNode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v20[2](v20, v23);
    if (v24 && (objc_msgSend(v24, "isSameNodeAsNode:", v23) & 1) == 0)
      v20[2](v20, v24);
    v25 = v38[3] >= a3;

    _Block_object_dispose(&v37, 8);
    v12 = v29;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)_commonLocationLabelForLocationNodes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v11);

        if (v6 < v12)
        {
          objc_msgSend(v10, "label");
          v13 = objc_claimAutoreleasedReturnValue();

          v6 = v12;
          v7 = (void *)v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_dateNodesFromMomentNodes:(id)a3 featuredYearNodes:(id)a4 momentsLocalStartDate:(id *)a5 momentsLocalEndDate:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  char v27;
  PGGraphMomentNodeCollection *v28;
  void *v29;
  void *v30;
  PGGraphMomentNodeCollection *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    *a5 = 0;
    *a6 = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v11 = (void *)MEMORY[0x1E0C99E60];
  v36 = v10;
  if (v10)
  {
    objc_msgSend(v10, "years");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v37 = v9;
  obj = v9;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v15)
    goto LABEL_20;
  v16 = v15;
  v17 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v40 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_msgSend(v19, "localStartDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localEndDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "count"))
      {
        objc_msgSend(v20, "earlierDate:", *a5);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
        objc_msgSend(v21, "laterDate:", *a6);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      v22 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v20);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v13, "containsObject:", v23);

      if (v24)
      {
        objc_msgSend(v20, "earlierDate:", *a5);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v21);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v13, "containsObject:", v26);

      if ((v27 & 1) != 0)
        goto LABEL_17;
LABEL_18:

    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v16);
LABEL_20:

  v28 = [PGGraphMomentNodeCollection alloc];
  objc_msgSend(obj, "anyObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "graph");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MAElementCollection initWithSet:graph:](v28, "initWithSet:graph:", obj, v30);

  -[PGGraphMomentNodeCollection dateNodes](v31, "dateNodes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v36;
  if (v36)
  {
    objc_msgSend(v36, "dateNodes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "collectionByIntersecting:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v34;
  }
  v9 = v37;
  objc_msgSend(v32, "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v14;
}

+ (id)significantDateNodesFromMomentNodes:(id)a3 dateFormatterType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD aBlock[5];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke;
  aBlock[3] = &__block_descriptor_40_e35___NSString_16__0__PGGraphDateNode_8l;
  aBlock[4] = a4;
  v31 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "numberOfAssets");
        v36[0] = MEMORY[0x1E0C809B0];
        v10 += v14;
        v36[1] = 3221225472;
        v36[2] = __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke_2;
        v36[3] = &unk_1E842A2C8;
        v37 = v7;
        v39 = v31;
        v38 = v6;
        v40 = v14;
        objc_msgSend(v13, "enumerateDateNodesUsingBlock:", v36);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v9);
    v15 = (double)v10;
  }
  else
  {
    v15 = 0.0;
  }

  objc_msgSend(v6, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17 >= 2)
  {
    v18 = v17;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29 = v16;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedIntegerValue");

          if ((double)v26 / v15 < 0.4 / (double)v18)
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("dateNodes"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "minusSet:", v27);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v21);
    }

    v16 = v29;
  }

  return v7;
}

+ (id)_locationNodesForTimeTitleFromLocationNodes:(id)a3
{
  id v3;
  void *v4;
  PGGraphNodeCollection *v5;
  void *v6;
  PGGraphNodeCollection *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [PGGraphNodeCollection alloc];
    objc_msgSend(v4, "graph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MAElementCollection initWithSet:graph:](v5, "initWithSet:graph:", v3, v6);

    +[PGGraphAreaNode filter](PGGraphAreaNode, "filter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAreaNodeCollection, "nodesRelatedToNodes:withRelation:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphLocationNode filter](PGGraphLocationNode, "filter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addressNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cityNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionByFormingUnionWith:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "temporarySet");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v17;
}

+ (int64_t)numberOfYearsFromDate:(id)a3 toDate:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v5 = (void *)MEMORY[0x1E0D4B130];
  v6 = a4;
  objc_msgSend(v5, "components:fromDate:", 4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDateComponents:toDateComponents:options:", 4, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "year");

  return v10;
}

id __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dayNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "monthNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "collection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "yearNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "anyNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 32);
  if (v16 > 6)
  {
    v18 = 0;
    goto LABEL_8;
  }
  if (((1 << v16) & 0x33) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), v15, v11, v7);
  }
  else
  {
    if (((1 << v16) & 0x44) == 0)
    {
      v17 = v15;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v15, v11, v20);
  }
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v18 = v17;
LABEL_8:

  return v18;
}

void __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateNodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("dateNodes"));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v3);
    v5 = (void *)v6;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56) + v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("numberOfAssets"));

  objc_msgSend(v5, "addObject:", v10);
}

void __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2;
  v6[3] = &unk_1E842A258;
  v10 = *(_OWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(a2, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("YEAR"), 400, v6);

}

void __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v10 = a2;
  v5 = objc_msgSend(v10, "month");
  if (v5 != *(_QWORD *)(a1 + 56) && v5 != *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v10, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "momentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3;
    v11[3] = &unk_1E842A230;
    v12 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v15 = 1;
    v9 = *(_QWORD *)(a1 + 48);
    v13 = v8;
    v14 = v9;
    objc_msgSend(v7, "enumerateNodesUsingBlock:", v11);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 72))
      *a3 = 1;

  }
}

void __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  objc_msgSend(a2, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addressNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deepParentLocationNodesWithLabel:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_4;
  v10[3] = &unk_1E842A208;
  v7 = *(id *)(a1 + 40);
  v14 = *(_BYTE *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v13 = a3;
  objc_msgSend(v9, "enumerateNodesUsingBlock:", v10);

}

uint64_t __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  BOOL v6;
  _BYTE *v7;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if (*(_BYTE *)(a1 + 56))
    v6 = (_DWORD)result == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = *(_BYTE **)(a1 + 48);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *v7 = 1;
    *a3 = 1;
  }
  return result;
}

void __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(void **)(a1 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2;
  v7[3] = &unk_1E842A1B8;
  v11 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  v12 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "_enumerateNeighborMomentNodesOfMomentNodes:usingBlock:", v4, v7);

}

void __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v7 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3;
  v13[3] = &unk_1E842A190;
  v8 = a1[7];
  v13[4] = &v14;
  v13[5] = v8;
  objc_msgSend(v7, "enumerateDateNodesUsingBlock:", v13);
  if (*((_BYTE *)v15 + 24))
  {
    objc_msgSend(v7, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addressNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deepParentLocationNodesWithLabel:", a1[4]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "temporarySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      if (objc_msgSend(v12, "intersectsSet:", a1[5]))
        ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) >= a1[8])
        *a4 = 1;
    }

  }
  else
  {
    *a3 = 1;
  }
  _Block_object_dispose(&v14, 8);

}

uint64_t __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "month");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke(uint64_t a1, char a2)
{
  void (**v3)(void *, id);
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke_2;
  v6[3] = &unk_1E842A140;
  v8 = a2;
  v7 = *(id *)(a1 + 32);
  v3 = (void (**)(void *, id))_Block_copy(v6);
  v4 = *(id *)(a1 + 40);
  do
  {
    v5 = v4;
    v3[2](v3, v4);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      break;
  }
  while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

}

id __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = v3;
  do
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v4, "nextMomentNode");
    else
      objc_msgSend(v4, "previousMomentNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      break;
    v4 = v5;
  }
  while ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) != 0);

  return v5;
}

void __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;

  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v5, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "monthNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_BYTE *)(a1 + 65))
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v5, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "yearNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "anyNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v11 = objc_msgSend(v10, "calendarUnitValue");
  v12 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v11);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && (v12 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", v11);
    v13 = *(void **)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_2;
    v17[3] = &unk_1E842A0F0;
    v21 = *(_BYTE *)(a1 + 64);
    v15 = v6;
    v22 = *(_BYTE *)(a1 + 65);
    v16 = *(_QWORD *)(a1 + 48);
    v18 = v15;
    v19 = v16;
    v20 = v11;
    objc_msgSend(v13, "_enumerateNeighborMomentNodesOfMomentNodes:usingBlock:", v14, v17);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a3 = 1;

  }
}

void __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3, uint64_t a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_3;
  v11[3] = &unk_1E842A0C8;
  v16 = *(_BYTE *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  v17 = *(_BYTE *)(a1 + 57);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = a4;
  objc_msgSend(a2, "enumerateDateNodesUsingBlock:", v11);
  *a3 = 1;

}

void __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "monthNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;
    objc_msgSend(v6, "anyNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 65))
  {
    objc_msgSend(*(id *)(a1 + 32), "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "yearNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v8 = 0;
LABEL_6:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "calendarUnitValue") == *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a3 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }

}

void __79__PGTimeTitleUtility__numberOfYearsAgoWithEventNodes_relativeToDateComponents___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v6 = a2;
  v7 = *(_QWORD *)(a1[4] + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v12 = v6;
  if (!v9)
  {
    objc_storeStrong(v8, a2);
    v6 = v12;
  }
  v10 = objc_msgSend(v6, "month");
  v11 = objc_msgSend(v12, "day");
  if (a1[6] == v10 && a1[7] == v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *a3 = 1;
  }

}

@end
