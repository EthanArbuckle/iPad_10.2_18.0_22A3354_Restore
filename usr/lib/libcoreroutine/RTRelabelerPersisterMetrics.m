@implementation RTRelabelerPersisterMetrics

- (RTRelabelerPersisterMetrics)initWithLoggingEnabled:(BOOL)a3
{
  RTRelabelerPersisterMetrics *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)RTRelabelerPersisterMetrics;
  v3 = -[RTMetric initWithLoggingEnabled:](&v50, sel_initWithLoggingEnabled_, a3);
  if (v3)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v47;
      v8 = MEMORY[0x1E0C9AAA0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v47 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9);
          -[RTMetric metrics](v3, "metrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v10);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v6);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend((id)objc_opt_class(), "unsignedIntegerKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v43;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v16);
          -[RTMetric metrics](v3, "metrics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E9328F58, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v14);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend((id)objc_opt_class(), "doubleKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23);
          -[RTMetric metrics](v3, "metrics");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E932D390, v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      }
      while (v21);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend((id)objc_opt_class(), "bucketedKeys", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v30);
          -[RTMetric metrics](v3, "metrics");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E9328F70, v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
      }
      while (v28);
    }

  }
  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventRelabelerPersisterRun;
}

+ (id)BOOLeanKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("relabelerWasNil"), CFSTR("persisterWasNil"), CFSTR("resnappingErroredOut"), CFSTR("cleanUpErroredOut"), CFSTR("combineErroredOut"), CFSTR("mergingSequentialVisitsErroredOut"), CFSTR("fixingUnconcreteErroredOut"), CFSTR("saveErroredOut"), 0);
}

+ (id)unsignedIntegerKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("numberOfStartingLOIs"), CFSTR("numberOfStartingVisits"), CFSTR("numberUnassociated"), CFSTR("numberUnassociatedError"), CFSTR("numberOfNonPlaceholderSame"), CFSTR("numberOfNonPlaceholderDifferent"), CFSTR("numberOfNonPlaceholderError"), CFSTR("numberOfPlaceholderCollapsed"), CFSTR("numberOfPlaceholderIntendedRestored"), CFSTR("numberOfPlaceholderUnintendedRestored"), CFSTR("numberOfPlaceholderNotCollapsedRevGeoQuery"), CFSTR("numberOfPlaceholderError"), CFSTR("numberOfLOIsCollapsed"), CFSTR("numberOfCombineIterations"), CFSTR("numberOfLOIsCleanedUp"), CFSTR("numberOfBrokenLOIErrors"), CFSTR("numberOfUnknownErrors"),
               CFSTR("numberOfInvalidParameterErrors"),
               CFSTR("numberOfDistanceCalculatorErrors"),
               CFSTR("numberOfFetchRequestErrors"),
               CFSTR("numberOfNilVisitMOErrors"),
               CFSTR("numberOfNilLOIMOErrors"),
               CFSTR("numberOfNilPlaceMOErrors"),
               CFSTR("numberOfRevGeoQueryErrors"),
               CFSTR("numberOfNoSingularTranstiionErrors"),
               CFSTR("totalNumberOfErrors"),
               0);
}

+ (id)doubleKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("startingVisitDensity"), CFSTR("percentageOfUnassociatedError"), CFSTR("percentageOfLOIsCollapsed"), CFSTR("errorRate"), CFSTR("visitDensityRatioIncrease"), CFSTR("runTime"), 0);
}

+ (id)bucketedKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("bucketedNumberOfStartingVisits"), CFSTR("bucketedPercentageOfNonPlaceholderSame"), CFSTR("bucketedPercentageOfNonPlaceholderDifferent"), CFSTR("bucketedPercentageOfNonPlaceholderError"), CFSTR("bucketedPercentageOfPlaceholderCollapsed"), CFSTR("bucketedPercentageOfPlaceholderIntendedRestored"), CFSTR("bucketedPercentageOfPlaceholderUnintendedRestored"), CFSTR("bucketedPercentageOfPlaceholderRevGeoQuery"), CFSTR("bucketedPercentageOfPlaceholderError"), CFSTR("bucketedPercentageOfNonPlaceholder"), CFSTR("bucketedPercentageOfPlaceholder"), CFSTR("bucketedPercentageOfLOIsCleanedUp"), CFSTR("bucketedPercentageOfLOIsBroken"), CFSTR("bucketedPercentageOfLOIsDeleted"), CFSTR("bucketedPercentageOfUnknownErrors"), CFSTR("bucketedPercentageOfInvalidParameterErrors"), CFSTR("bucketedPercentageOfDistanceCalculatorErrors"),
               CFSTR("bucketedPercentageOfFetchRequestErrors"),
               CFSTR("bucketedPercentageOfNilVisitMOErrors"),
               CFSTR("bucketedPercentageOfNilLOIMOErrors"),
               CFSTR("bucketedPercentageOfNilPlaceMOErrors"),
               CFSTR("bucketedPercentageOfRevGeoQueryErrors"),
               CFSTR("bucketedPercentageOfNoSingularTransitionErrors"),
               0);
}

+ (id)supportedMetricKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "unsignedIntegerKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "doubleKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "bucketedKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  return v4;
}

- (void)tallyKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTMetric metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTRelabelerPersisterMetrics tallyKey:]";
      v12 = 1024;
      v13 = 77;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Called tallyKey on a non-NSNumber value (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v4);

}

- (void)tallyError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  unint64_t v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = v4;
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D18598]);

    if (v7)
    {
      v8 = objc_msgSend(v13, "code");
      v5 = v13;
      if (v8 == 7)
      {
        v9 = CFSTR("numberOfInvalidParameterErrors");
LABEL_9:
        -[RTRelabelerPersisterMetrics tallyKey:](self, "tallyKey:", v9);
        v5 = v13;
      }
    }
    else
    {
      objc_msgSend(v13, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("RTRelabelerPersisterErrorDomain"));

      if (!v11)
      {
        v9 = CFSTR("numberOfUnknownErrors");
        goto LABEL_9;
      }
      v12 = objc_msgSend(v13, "code");
      v5 = v13;
      if (v12 <= 8)
      {
        v9 = off_1E92A3358[v12];
        goto LABEL_9;
      }
    }
  }

}

- (void)setErrorKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTMetric metrics](self, "metrics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);

}

- (double)safeFraction:(double)a3 denominator:(double)a4
{
  double result;

  result = a3 / a4;
  if (a4 <= 0.0)
    return -1.0;
  return result;
}

- (void)setBucketedPercentageMetricsWithMappings:(id)a3 sharedDenominator:(double)a4 sharedBins:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  __int128 v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  obj = v7;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: mappings";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_18;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: sharedBins";
    goto LABEL_21;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v29;
    *(_QWORD *)&v11 = 136315394;
    v26 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[RTMetric metrics](self, "metrics", v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "doubleValue");
          -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 * 100.0);
          v20 = objc_claimAutoreleasedReturnValue();
          +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v20, v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMetric metrics](self, "metrics");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "secondObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            v33 = "-[RTRelabelerPersisterMetrics setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:]";
            v34 = 1024;
            v35 = 152;
            _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromValue (in %s:%d)", buf, 0x12u);
          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }
LABEL_19:

}

- (void)setDerivedMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  _RTZip *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  _RTZip *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  _RTZip *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  _RTZip *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  void *v158;
  void *v159;
  double v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  _QWORD v181[9];
  _QWORD v182[9];
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[5];
  _QWORD v186[5];
  _QWORD v187[3];
  _QWORD v188[5];

  v188[3] = *MEMORY[0x1E0C80C00];
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328F58, &unk_1E9328F88, &unk_1E9328FA0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328F58, &unk_1E9328F88, &unk_1E9328FD0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numberOfStartingVisits"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v4, &unk_1E932CA00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("bucketedNumberOfStartingVisits"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[RTMetric metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfStartingVisits"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  -[RTMetric metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("numberOfStartingLOIs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v11, v14);
  objc_msgSend(v7, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("startingVisitDensity"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[RTMetric metrics](self, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("numberUnassociatedError"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  -[RTMetric metrics](self, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("numberUnassociated"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;
  -[RTMetric metrics](self, "metrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("numberUnassociatedError"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v21, v25 + v28);
  objc_msgSend(v17, "numberWithDouble:", v29 * 100.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("percentageOfUnassociatedError"));

  -[RTMetric metrics](self, "metrics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("numberOfNonPlaceholderSame"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  v35 = v34;
  -[RTMetric metrics](self, "metrics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("numberOfNonPlaceholderDifferent"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v35 + v38;
  -[RTMetric metrics](self, "metrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("numberOfNonPlaceholderError"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "doubleValue");
  v43 = v39 + v42;

  v188[0] = CFSTR("numberOfNonPlaceholderSame");
  v188[1] = CFSTR("numberOfNonPlaceholderDifferent");
  v188[2] = CFSTR("numberOfNonPlaceholderError");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 3);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = CFSTR("bucketedPercentageOfNonPlaceholderSame");
  v187[1] = CFSTR("bucketedPercentageOfNonPlaceholderDifferent");
  v187[2] = CFSTR("bucketedPercentageOfNonPlaceholderError");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 3);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[_RTZip initWithFirstInput:secondInput:]([_RTZip alloc], "initWithFirstInput:secondInput:", v178, v177);
  -[_RTZip zippedArray](v44, "zippedArray");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTRelabelerPersisterMetrics setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:](self, "setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:", v45, v180, v43);

  -[RTMetric metrics](self, "metrics");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("numberOfPlaceholderCollapsed"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "doubleValue");
  v48 = v47;
  -[RTMetric metrics](self, "metrics");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("numberOfPlaceholderIntendedRestored"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "doubleValue");
  v52 = v48 + v51;
  -[RTMetric metrics](self, "metrics");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("numberOfPlaceholderUnintendedRestored"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  v56 = v52 + v55;
  -[RTMetric metrics](self, "metrics");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("numberOfPlaceholderNotCollapsedRevGeoQuery"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "doubleValue");
  v60 = v56 + v59;
  -[RTMetric metrics](self, "metrics");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("numberOfPlaceholderError"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "doubleValue");
  v64 = v60 + v63;

  v186[0] = CFSTR("numberOfPlaceholderCollapsed");
  v186[1] = CFSTR("numberOfPlaceholderIntendedRestored");
  v186[2] = CFSTR("numberOfPlaceholderUnintendedRestored");
  v186[3] = CFSTR("numberOfPlaceholderNotCollapsedRevGeoQuery");
  v186[4] = CFSTR("numberOfPlaceholderError");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 5);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v185[0] = CFSTR("bucketedPercentageOfPlaceholderCollapsed");
  v185[1] = CFSTR("bucketedPercentageOfPlaceholderIntendedRestored");
  v185[2] = CFSTR("bucketedPercentageOfPlaceholderUnintendedRestored");
  v185[3] = CFSTR("bucketedPercentageOfPlaceholderRevGeoQuery");
  v185[4] = CFSTR("bucketedPercentageOfPlaceholderError");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v185, 5);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[_RTZip initWithFirstInput:secondInput:]([_RTZip alloc], "initWithFirstInput:secondInput:", v176, v174);
  -[_RTZip zippedArray](v65, "zippedArray");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTRelabelerPersisterMetrics setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:](self, "setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:", v66, v180, v64);

  -[RTMetric metrics](self, "metrics");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("numberOfStartingVisits"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v43, v69);
  v71 = v70 * 100.0;

  -[RTMetric metrics](self, "metrics");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("numberOfStartingVisits"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v64, v74);
  v76 = v75 * 100.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v71);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v77, v180);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setObject:forKeyedSubscript:", v78, CFSTR("bucketedPercentageOfNonPlaceholder"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v76);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v80, v180);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v81, CFSTR("bucketedPercentageOfPlaceholder"));

  v83 = (void *)MEMORY[0x1E0CB37E8];
  -[RTMetric metrics](self, "metrics");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("numberOfLOIsCollapsed"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "doubleValue");
  v87 = v86;
  -[RTMetric metrics](self, "metrics");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("numberOfStartingLOIs"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v87, v90);
  objc_msgSend(v83, "numberWithDouble:", v91 * 100.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v92, CFSTR("percentageOfLOIsCollapsed"));

  v184[0] = CFSTR("numberOfLOIsCleanedUp");
  v184[1] = CFSTR("numberOfBrokenLOIErrors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 2);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v183[0] = CFSTR("bucketedPercentageOfLOIsCleanedUp");
  v183[1] = CFSTR("bucketedPercentageOfLOIsBroken");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 2);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[_RTZip initWithFirstInput:secondInput:]([_RTZip alloc], "initWithFirstInput:secondInput:", v173, v172);
  -[_RTZip zippedArray](v94, "zippedArray");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("numberOfStartingLOIs"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "doubleValue");
  -[RTRelabelerPersisterMetrics setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:](self, "setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:", v95, &unk_1E932C9E8);

  -[RTMetric metrics](self, "metrics");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("numberOfLOIsCleanedUp"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "doubleValue");
  v101 = v100;
  -[RTMetric metrics](self, "metrics");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("numberOfBrokenLOIErrors"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "doubleValue");
  v105 = v101 + v104;

  -[RTMetric metrics](self, "metrics");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("numberOfStartingLOIs"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v105, v108);
  v110 = v109 * 100.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v111, &unk_1E932C9E8);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setObject:forKeyedSubscript:", v112, CFSTR("bucketedPercentageOfLOIsDeleted"));

  -[RTMetric metrics](self, "metrics");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "objectForKeyedSubscript:", CFSTR("numberOfUnknownErrors"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "doubleValue");
  v115 = v114;
  -[RTMetric metrics](self, "metrics");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("numberOfInvalidParameterErrors"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "doubleValue");
  v117 = v115 + v116;
  -[RTMetric metrics](self, "metrics");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "objectForKeyedSubscript:", CFSTR("numberOfDistanceCalculatorErrors"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "doubleValue");
  v119 = v117 + v118;
  -[RTMetric metrics](self, "metrics");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "objectForKeyedSubscript:", CFSTR("numberOfFetchRequestErrors"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "doubleValue");
  v121 = v119 + v120;
  -[RTMetric metrics](self, "metrics");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("numberOfNilVisitMOErrors"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "doubleValue");
  v124 = v121 + v123;
  -[RTMetric metrics](self, "metrics");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("numberOfNilLOIMOErrors"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "doubleValue");
  v128 = v124 + v127;
  -[RTMetric metrics](self, "metrics");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("numberOfNilPlaceMOErrors"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "doubleValue");
  v132 = v128 + v131;
  -[RTMetric metrics](self, "metrics");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("numberOfRevGeoQueryErrors"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "doubleValue");
  v136 = v132 + v135;
  -[RTMetric metrics](self, "metrics");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("numberOfNoSingularTranstiionErrors"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "doubleValue");
  v140 = v136 + v139;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "setObject:forKeyedSubscript:", v141, CFSTR("totalNumberOfErrors"));

  v143 = (void *)MEMORY[0x1E0CB37E8];
  -[RTMetric metrics](self, "metrics");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("numberOfStartingVisits"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v140, v146);
  objc_msgSend(v143, "numberWithDouble:");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setObject:forKeyedSubscript:", v147, CFSTR("errorRate"));

  v182[0] = CFSTR("numberOfUnknownErrors");
  v182[1] = CFSTR("numberOfInvalidParameterErrors");
  v182[2] = CFSTR("numberOfDistanceCalculatorErrors");
  v182[3] = CFSTR("numberOfFetchRequestErrors");
  v182[4] = CFSTR("numberOfNilVisitMOErrors");
  v182[5] = CFSTR("numberOfNilLOIMOErrors");
  v182[6] = CFSTR("numberOfNilPlaceMOErrors");
  v182[7] = CFSTR("numberOfRevGeoQueryErrors");
  v182[8] = CFSTR("numberOfNoSingularTranstiionErrors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v182, 9);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v181[0] = CFSTR("bucketedPercentageOfUnknownErrors");
  v181[1] = CFSTR("bucketedPercentageOfInvalidParameterErrors");
  v181[2] = CFSTR("bucketedPercentageOfDistanceCalculatorErrors");
  v181[3] = CFSTR("bucketedPercentageOfFetchRequestErrors");
  v181[4] = CFSTR("bucketedPercentageOfNilVisitMOErrors");
  v181[5] = CFSTR("bucketedPercentageOfNilLOIMOErrors");
  v181[6] = CFSTR("bucketedPercentageOfNilPlaceMOErrors");
  v181[7] = CFSTR("bucketedPercentageOfRevGeoQueryErrors");
  v181[8] = CFSTR("bucketedPercentageOfNoSingularTransitionErrors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 9);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = -[_RTZip initWithFirstInput:secondInput:]([_RTZip alloc], "initWithFirstInput:secondInput:", v149, v150);
  -[_RTZip zippedArray](v151, "zippedArray");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTRelabelerPersisterMetrics setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:](self, "setBucketedPercentageMetricsWithMappings:sharedDenominator:sharedBins:", v152, v179, v140);

  v153 = (void *)MEMORY[0x1E0CB37E8];
  -[RTMetric metrics](self, "metrics");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("numberOfStartingLOIs"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "doubleValue");
  v157 = v156;
  -[RTMetric metrics](self, "metrics");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("numberOfStartingLOIs"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "doubleValue");
  -[RTRelabelerPersisterMetrics safeFraction:denominator:](self, "safeFraction:denominator:", v157, v160 - v105);
  objc_msgSend(v153, "numberWithDouble:");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setObject:forKeyedSubscript:", v161, CFSTR("visitDensityRatioIncrease"));

}

- (BOOL)submitMetricsWithError:(id *)a3
{
  objc_super v6;

  -[RTRelabelerPersisterMetrics setDerivedMetrics](self, "setDerivedMetrics");
  v6.receiver = self;
  v6.super_class = (Class)RTRelabelerPersisterMetrics;
  return -[RTMetric submitMetricsWithError:](&v6, sel_submitMetricsWithError_, a3);
}

@end
