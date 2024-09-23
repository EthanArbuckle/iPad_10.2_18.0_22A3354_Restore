@implementation PGPublicEventCriteria

- (BOOL)_hasSufficientTimeOverlapForEvent:(id)a3 matchingOptions:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGPublicEventCriteria minimumTimeAttendance](self, "minimumTimeAttendance");
  v9 = v8;
  v10 = -[PGPublicEventCriteria allowsExpandingTimeAttendance](self, "allowsExpandingTimeAttendance");
  objc_msgSend(v7, "expandedAttendanceDateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actualAttendanceDateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "universalDateIntervalIncludingTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v14 = v11;
  else
    v14 = v12;
  v15 = v14;
  v16 = 0.0;
  if (objc_msgSend(v13, "intersectsDateInterval:", v15))
  {
    objc_msgSend(v12, "duration");
    v16 = v17;
  }
  if (v16 < v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138479363;
    v25 = v19;
    v26 = 2048;
    v27 = v16;
    v28 = 2048;
    v29 = v9;
    v30 = 2113;
    v31 = v20;
    v32 = 2113;
    v33 = v21;
    v34 = 2113;
    v35 = v22;
    v36 = 2113;
    v37 = v23;
    _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: absolute time overlap %.0f, minimum %.0f, eventInterval [%{private}@ - %{private}@], attendance [%{private}@ - %{private}@]", (uint8_t *)&v24, 0x48u);

  }
  return v16 >= v9;
}

- (BOOL)_isMatchingMeaningDisambiguationForEvent:(id)a3 matchingOptions:(id)a4 withHighConfidence:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  __CFString *v46;
  id v47;
  BOOL v48;
  void *v49;
  PGPublicEventCriteria *v50;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "name");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v50 = self;
  -[PGPublicEventCriteria prohibitedCriteria](self, "prohibitedCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v62;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v62 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v8, "matchingCriteria");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "matchingResultWithCriteria:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isMatching");

        if (v17)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "identifier");
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478083;
            v67 = v52;
            v68 = 2114;
            v69 = v46;
            _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: is matching prohibited meaning %{public}@", buf, 0x16u);

          }
          v34 = 0;
          *a5 = 0;
          goto LABEL_44;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[PGPublicEventCriteria disambiguationCriteria](v50, "disambiguationCriteria");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  v20 = v19 != 0;
  v48 = v19 != 0;
  if (v19)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    if (v22)
    {
      v23 = v22;
      v49 = v18;
      v47 = v7;
      v24 = MEMORY[0x1E0C81028];
      v25 = *(_QWORD *)v58;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v58 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v26);
          objc_msgSend(v8, "matchingCriteria");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "matchingResultWithCriteria:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isMatching");

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            if (v30)
              v31 = &stru_1E8436F28;
            else
              v31 = CFSTR("not ");
            objc_msgSend(v27, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478339;
            v67 = v52;
            v68 = 2114;
            v69 = v31;
            v70 = 2114;
            v71 = v32;
            _os_log_debug_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: is %{public}@matching meaning %{public}@", buf, 0x20u);

            if ((v30 & 1) != 0)
            {
LABEL_29:

              v7 = v47;
              v18 = v49;
              v20 = v48;
              goto LABEL_30;
            }
          }
          else if ((v30 & 1) != 0)
          {
            goto LABEL_29;
          }
          ++v26;
        }
        while (v23 != v26);
        v33 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
        v23 = v33;
      }
      while (v33);
      v34 = 0;
      v20 = 0;
      v7 = v47;
LABEL_40:
      v18 = v49;
    }
    else
    {
      v34 = 0;
      v20 = 0;
    }
  }
  else
  {
LABEL_30:
    v35 = v7;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[PGPublicEventCriteria highConfidenceCriteria](v50, "highConfidenceCriteria");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v36)
    {
      v37 = v36;
      v49 = v18;
      v38 = *(_QWORD *)v54;
      while (2)
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v21);
          v40 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
          v41 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v8, "matchingCriteria");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "matchingResultWithCriteria:", v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isMatching");

          objc_autoreleasePoolPop(v41);
          if ((v44 & 1) != 0)
          {
            v34 = 1;
            v20 = 1;
            v7 = v35;
            goto LABEL_40;
          }
        }
        v37 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
        v34 = 1;
        if (v37)
          continue;
        break;
      }
      v7 = v35;
      v18 = v49;
      v20 = v48;
    }
    else
    {
      v34 = 1;
    }
  }

  *a5 = v20;
LABEL_44:

  return v34;
}

- (BOOL)isMatchingEvent:(id)a3 matchingOptions:(id)a4 withHighConfidence:(BOOL *)a5 matchingDistance:(double *)a6
{
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  BOOL v24;
  _BOOL4 v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGPublicEventCriteria hasMinimumAttendance](self, "hasMinimumAttendance"))
  {
    v13 = -[PGPublicEventCriteria minimumAttendance](self, "minimumAttendance");
    v14 = objc_msgSend(v10, "expectedAttendance");
    if (!objc_msgSend(v10, "hasExpectedAttendance") || v14 < v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478339;
        v33 = v12;
        v34 = 2048;
        v35 = *(double *)&v14;
        v36 = 2048;
        v37 = *(double *)&v13;
        _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: minimumAttendance %ld is not big enough %ld", buf, 0x20u);
      }
      objc_msgSend(v11, "coordinates");
      goto LABEL_11;
    }
  }
  v15 = -[PGPublicEventCriteria _hasSufficientTimeOverlapForEvent:matchingOptions:](self, "_hasSufficientTimeOverlapForEvent:matchingOptions:", v10, v11);
  objc_msgSend(v11, "coordinates");
  v30 = v16;
  v31 = v17;
  if (!v15)
  {
LABEL_11:
    v23 = 1.79769313e308;
LABEL_12:
    v24 = 0;
    *a5 = 0;
    *a6 = v23;
    goto LABEL_13;
  }
  -[PGPublicEventCriteria maximumDistance](self, "maximumDistance");
  v19 = v18;
  objc_msgSend(v10, "businessItemCoordinates");
  v28 = v20;
  v29 = v21;
  CLLocationCoordinate2DGetDistanceFrom();
  v23 = v22;
  if (v22 > v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      v33 = v12;
      v34 = 2048;
      v35 = v23;
      v36 = 2048;
      v37 = v19;
      _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: distance %.1f is larger than maxDistance %.1f", buf, 0x20u);
    }
    goto LABEL_12;
  }
  buf[0] = 0;
  v26 = -[PGPublicEventCriteria _isMatchingMeaningDisambiguationForEvent:matchingOptions:withHighConfidence:](self, "_isMatchingMeaningDisambiguationForEvent:matchingOptions:withHighConfidence:", v10, v11, buf, v28, v29, v30, v31);
  v24 = 0;
  v27 = buf[0];
  *a5 = buf[0];
  *a6 = v23;
  if (v26)
  {
    if (!v27
      && (v23 <= 30.0
       || self->_promoteToHighConfidenceBasedOnCategory
       || -[PGPublicEventCriteria _promoteToHighConfidenceBasedOnEvent:](self, "_promoteToHighConfidenceBasedOnEvent:", v10)))
    {
      v24 = 1;
      *a5 = 1;
    }
    else
    {
      v24 = 1;
    }
  }
LABEL_13:

  return v24;
}

- (BOOL)hasMinimumAttendance
{
  int64_t minimumAttendance;
  BOOL v3;

  minimumAttendance = self->_minimumAttendance;
  if (minimumAttendance)
    v3 = minimumAttendance == 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)_promoteToHighConfidenceBasedOnEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  PGPublicEventCriteria *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "languageCode");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria _localizedSubcategoryTerms:](self, "_localizedSubcategoryTerms:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categories");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  v45 = v7;
  if (v8)
  {
    v9 = *(_QWORD *)v59;
    v40 = (void *)v5;
    v43 = v6;
    v36 = self;
    v37 = *(_QWORD *)v59;
    do
    {
      v10 = 0;
      v38 = v8;
      do
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(v7);
        v41 = v10;
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v10), "localizedSubcategories", v36);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v12 = v11;
        v42 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v42)
        {
          v13 = *(_QWORD *)v55;
          v39 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v55 != v13)
                objc_enumerationMutation(v12);
              v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              v50 = 0u;
              v51 = 0u;
              v52 = 0u;
              v53 = 0u;
              v16 = v6;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v51;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v51 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
                    objc_msgSend(v15, "localizedLowercaseString");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v21) = objc_msgSend(v22, "containsString:", v21);

                    if ((v21 & 1) != 0)
                    {

                      v33 = 1;
                      v34 = v45;
                      v25 = v45;
                      v24 = v40;
                      v23 = v43;
                      goto LABEL_38;
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              v6 = v43;
              v13 = v39;
            }
            v5 = (uint64_t)v40;
            v7 = v45;
            self = v36;
            v42 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          }
          while (v42);
        }

        v10 = v41 + 1;
        v9 = v37;
      }
      while (v41 + 1 != v38);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v8);
  }
  v23 = v6;

  v24 = (void *)v5;
  -[PGPublicEventCriteria _localizedEventNameTerms:](self, "_localizedEventNameTerms:", v5);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v47;
    while (2)
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v47 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
        objc_msgSend(v4, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedLowercaseString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v30) = objc_msgSend(v32, "containsString:", v30);

        if ((v30 & 1) != 0)
        {

          goto LABEL_36;
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
      if (v27)
        continue;
      break;
    }
  }

  if (objc_msgSend(v4, "hasExpectedAttendance") && objc_msgSend(v4, "expectedAttendance") > 2000)
LABEL_36:
    v33 = 1;
  else
    v33 = 0;
  v34 = v45;
LABEL_38:

  return v33;
}

- (id)_localizedSubcategoryTerms:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("en")) & 1) != 0)
  {
    v4 = &unk_1E84E9D30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("de")) & 1) != 0)
  {
    v4 = &unk_1E84E9D48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fr")) & 1) != 0)
  {
    v4 = &unk_1E84E9D60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ja")) & 1) != 0)
  {
    v4 = &unk_1E84E9D78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("zh")) & 1) != 0)
  {
    v4 = &unk_1E84E9D90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("nl")) & 1) != 0)
  {
    v4 = &unk_1E84E9DA8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("it")) & 1) != 0)
  {
    v4 = &unk_1E84E9DC0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ko")) & 1) != 0)
  {
    v4 = &unk_1E84E9DD8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("es")) & 1) != 0)
  {
    v4 = &unk_1E84E9DF0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ar")) & 1) != 0)
  {
    v4 = &unk_1E84E9E08;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pt")) & 1) != 0)
  {
    v4 = &unk_1E84E9E20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ru")))
  {
    v4 = &unk_1E84E9E38;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("da")))
    v4 = &unk_1E84E9E50;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("nb")))
    v4 = &unk_1E84E9E68;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("pl")))
    v4 = &unk_1E84E9E80;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("sv")))
    v4 = &unk_1E84E9E98;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("tr")))
    v4 = &unk_1E84E9EB0;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("fi")))
    v4 = &unk_1E84E9EC8;

  return v4;
}

- (id)_localizedEventNameTerms:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("en")) & 1) != 0)
  {
    v4 = &unk_1E84E9EE0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("de")) & 1) != 0)
  {
    v4 = &unk_1E84E9EF8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fr")) & 1) != 0)
  {
    v4 = &unk_1E84E9F10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ja")) & 1) != 0)
  {
    v4 = &unk_1E84E9F28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("zh")) & 1) != 0)
  {
    v4 = &unk_1E84E9F40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("nl")) & 1) != 0)
  {
    v4 = &unk_1E84E9F58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("it")) & 1) != 0)
  {
    v4 = &unk_1E84E9F70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ko")) & 1) != 0)
  {
    v4 = &unk_1E84E9F88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("es")) & 1) != 0)
  {
    v4 = &unk_1E84E9FA0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ar")) & 1) != 0)
  {
    v4 = &unk_1E84E9FB8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pt")) & 1) != 0)
  {
    v4 = &unk_1E84E9FD0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ru")))
  {
    v4 = &unk_1E84E9FE8;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("da")))
    v4 = &unk_1E84EA000;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("nb")))
    v4 = &unk_1E84EA018;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("pl")))
    v4 = &unk_1E84EA030;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("sv")))
    v4 = &unk_1E84EA048;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("tr")))
    v4 = &unk_1E84EA060;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("fi")))
    v4 = &unk_1E84EA078;

  return v4;
}

- (NSString)eventCategory
{
  return self->_eventCategory;
}

- (void)setEventCategory:(id)a3
{
  objc_storeStrong((id *)&self->_eventCategory, a3);
}

- (double)minimumTimeAttendance
{
  return self->_minimumTimeAttendance;
}

- (void)setMinimumTimeAttendance:(double)a3
{
  self->_minimumTimeAttendance = a3;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (int64_t)minimumAttendance
{
  return self->_minimumAttendance;
}

- (void)setMinimumAttendance:(int64_t)a3
{
  self->_minimumAttendance = a3;
}

- (BOOL)allowsExpandingTimeAttendance
{
  return self->_allowsExpandingTimeAttendance;
}

- (void)setAllowsExpandingTimeAttendance:(BOOL)a3
{
  self->_allowsExpandingTimeAttendance = a3;
}

- (NSArray)disambiguationCriteria
{
  return self->_disambiguationCriteria;
}

- (void)setDisambiguationCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationCriteria, a3);
}

- (NSArray)highConfidenceCriteria
{
  return self->_highConfidenceCriteria;
}

- (void)setHighConfidenceCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_highConfidenceCriteria, a3);
}

- (NSArray)prohibitedCriteria
{
  return self->_prohibitedCriteria;
}

- (void)setProhibitedCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedCriteria, a3);
}

- (BOOL)promoteToHighConfidenceBasedOnCategory
{
  return self->_promoteToHighConfidenceBasedOnCategory;
}

- (void)setPromoteToHighConfidenceBasedOnCategory:(BOOL)a3
{
  self->_promoteToHighConfidenceBasedOnCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitedCriteria, 0);
  objc_storeStrong((id *)&self->_highConfidenceCriteria, 0);
  objc_storeStrong((id *)&self->_disambiguationCriteria, 0);
  objc_storeStrong((id *)&self->_eventCategory, 0);
}

@end
