@implementation PGGuessWhoRelationshipMetricEvent

- (PGGuessWhoRelationshipMetricEvent)initWithGraphManager:(id)a3
{
  id v5;
  PGGuessWhoRelationshipMetricEvent *v6;
  PGGuessWhoRelationshipMetricEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGuessWhoRelationshipMetricEvent;
  v6 = -[PGGuessWhoRelationshipMetricEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_manager, a3);

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.Intelligence.Guesswho.Relationship");
}

- (BOOL)shouldReportMetrics
{
  return -[PGManager isReady](self->_manager, "isReady");
}

- (id)payload
{
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v41;
  void *v42;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfPeople);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("people_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfInferredFamilyMembers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("inferred_family_members_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfInferredFriends);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("inferred_friends_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfInferredParents);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("inferred_parents_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfInferredCoworkers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("inferred_coworkers_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfInferredPartners);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("inferred_partners_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfInferredChildren);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("inferred_children_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfFamilyHolidaySignalRegistrations);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("family_holiday_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfParentContactNameSignalRegistrations);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("parent_contact_name_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfSameFamilyNameSignalRegistrations);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("same_family_name_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfHomeMomentsSignalRegistrations);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("home_moments_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAnniversaryDateSignalRegistrations);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("anniversary_date_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTopTwoPersonSocialGroupSignalRegistrations);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("top_two_person_sg_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfLoveEmojisSignalRegistrations);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("love_emojis_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTopPersonSignalRegistrations);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("top_person_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfFriendNightOutSignalRegistrations);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("friend_night_out_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfPartnerTripSignalRegistrations);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("partner_trip_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfFriendsFamilyTripSignalRegistrations);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("friends_family_trip_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfWeekendSignalRegistrations);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("weekend_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfCoworkersAtWorkSignalRegistrations);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("coworker_work_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfCoworkerCalendarSignalRegistrations);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("coworker_calendar_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAgeDifferentThanMeSignalRegistrations);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("age_different_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfParentGrandparentOldSignalRegistrations);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("parent_grandparent_old_signal_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfFamilyHolidaySignalRegistrationsInCorrectInference);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("family_holiday_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfParentContactNameSignalRegistrationsInCorrectInference);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("parent_contact_name_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfSameFamilyNameSignalRegistrationsInCorrectInference);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("same_family_name_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfHomeMomentsSignalRegistrationsInCorrectInference);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("home_moments_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAnniversaryDateSignalRegistrationsInCorrectInference);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("anniversary_date_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("top_two_person_sg_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfLoveEmojisSignalRegistrationsInCorrectInference);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("love_emojis_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTopPersonSignalRegistrationsInCorrectInference);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("top_person_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfFriendNightOutSignalRegistrationsInCorrectInference);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("friend_night_out_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfPartnerTripSignalRegistrationsInCorrectInference);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("partner_trip_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("friends_family_trip_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfWeekendSignalRegistrationsInCorrectInference);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("weekend_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("coworker_work_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfCoworkerCalendarSignalRegistrationsInCorrectInference);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("coworker_calendar_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("age_different_signal_in_correct_inference_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfParentGrandparentOldSignalRegistrationsInCorrectInference);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("parent_grandparent_old_signal_in_correct_inference_count"));

  return v3;
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double Current;
  NSObject *v7;
  PGManager *manager;
  _QWORD v9[5];
  char v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v10 = 0;
      v4[2](v4, &v10, 0.0);
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v12 = 155;
          v13 = 2080;
          v14 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGGuessWhoRelationshipMetricEvent.m";
          v7 = MEMORY[0x1E0C81028];
LABEL_12:
          _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      v5 = Current;
    }
  }
  manager = self->_manager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke;
  v9[3] = &unk_1E84353C0;
  v9[4] = self;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](manager, "performSynchronousConcurrentGraphReadUsingBlock:", v9);
  if (v4)
  {
    if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      v10 = 0;
      v4[2](v4, &v10, 1.0);
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v12 = 232;
          v13 = 2080;
          v14 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGGuessWhoRelationshipMetricEvent.m";
          v7 = MEMORY[0x1E0C81028];
          goto LABEL_12;
        }
      }
    }
  }
LABEL_13:

}

- (void)_incrementRelationshipSignalMetricsForRelationshipEdge:(id)a3 inferredRelationshipCorrect:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL8 v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL8 v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _BOOL8 v27;
  unsigned int v28;
  uint64_t v29;
  double v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  _BOOL8 v34;
  double v35;
  double v36;
  unint64_t v37;
  unint64_t v38;
  _BOOL8 v39;
  double v40;
  double v41;
  unint64_t v42;
  unint64_t v43;
  _BOOL8 v44;
  double v45;
  double v46;
  unint64_t v47;
  unint64_t v48;
  _BOOL8 v49;
  double v50;
  double v51;
  unint64_t v52;
  unint64_t v53;
  _BOOL8 v54;
  double v55;
  double v56;
  unint64_t v57;
  unint64_t v58;
  _BOOL8 v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  id v64;

  v4 = a4;
  v64 = a3;
  objc_msgSend(v64, "familyHolidayAttendanceRate");
  v7 = v6;
  v8 = -[PGGuessWhoRelationshipMetricEvent numberOfFamilyHolidaySignalRegistrations](self, "numberOfFamilyHolidaySignalRegistrations");
  if (v7 <= 0.0)
    v9 = v8;
  else
    v9 = v8 + 1;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfFamilyHolidaySignalRegistrations:](self, "setNumberOfFamilyHolidaySignalRegistrations:", v9);
  v10 = -[PGGuessWhoRelationshipMetricEvent numberOfFamilyHolidaySignalRegistrationsInCorrectInference](self, "numberOfFamilyHolidaySignalRegistrationsInCorrectInference");
  v11 = v4 && v7 > 0.0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfFamilyHolidaySignalRegistrationsInCorrectInference:](self, "setNumberOfFamilyHolidaySignalRegistrationsInCorrectInference:", v10 + v11);
  v12 = objc_msgSend(v64, "hasParentContactName");
  if (v4)
    v13 = v12;
  else
    v13 = 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfParentContactNameSignalRegistrations:](self, "setNumberOfParentContactNameSignalRegistrations:", -[PGGuessWhoRelationshipMetricEvent numberOfParentContactNameSignalRegistrations](self, "numberOfParentContactNameSignalRegistrations")+ v12);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfParentContactNameSignalRegistrationsInCorrectInference:](self, "setNumberOfParentContactNameSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfParentContactNameSignalRegistrationsInCorrectInference](self, "numberOfParentContactNameSignalRegistrationsInCorrectInference")+ v13);
  v14 = objc_msgSend(v64, "hasSameFamilyNameAsMePerson");
  if (v4)
    v15 = v14;
  else
    v15 = 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfSameFamilyNameSignalRegistrations:](self, "setNumberOfSameFamilyNameSignalRegistrations:", -[PGGuessWhoRelationshipMetricEvent numberOfSameFamilyNameSignalRegistrations](self, "numberOfSameFamilyNameSignalRegistrations")+ v14);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfSameFamilyNameSignalRegistrationsInCorrectInference:](self, "setNumberOfSameFamilyNameSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfSameFamilyNameSignalRegistrationsInCorrectInference](self, "numberOfSameFamilyNameSignalRegistrationsInCorrectInference")+ v15);
  v16 = objc_msgSend(v64, "numberOfMomentsAtHome");
  v17 = -[PGGuessWhoRelationshipMetricEvent numberOfHomeMomentsSignalRegistrations](self, "numberOfHomeMomentsSignalRegistrations");
  if (v16)
    v18 = v17 + 1;
  else
    v18 = v17;
  v19 = v4 && v16 != 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfHomeMomentsSignalRegistrations:](self, "setNumberOfHomeMomentsSignalRegistrations:", v18);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfHomeMomentsSignalRegistrationsInCorrectInference:](self, "setNumberOfHomeMomentsSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfHomeMomentsSignalRegistrationsInCorrectInference](self, "numberOfHomeMomentsSignalRegistrationsInCorrectInference")+ v19);
  v20 = objc_msgSend(v64, "hasAnniversaryDate");
  if (v4)
    v21 = v20;
  else
    v21 = 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfAnniversaryDateSignalRegistrations:](self, "setNumberOfAnniversaryDateSignalRegistrations:", -[PGGuessWhoRelationshipMetricEvent numberOfAnniversaryDateSignalRegistrations](self, "numberOfAnniversaryDateSignalRegistrations")+ v20);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfAnniversaryDateSignalRegistrationsInCorrectInference:](self, "setNumberOfAnniversaryDateSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfAnniversaryDateSignalRegistrationsInCorrectInference](self, "numberOfAnniversaryDateSignalRegistrationsInCorrectInference")+ v21);
  v22 = objc_msgSend(v64, "isTopTwoPersonsSocialGroup");
  if (v4)
    v23 = v22;
  else
    v23 = 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfTopTwoPersonSocialGroupSignalRegistrations:](self, "setNumberOfTopTwoPersonSocialGroupSignalRegistrations:", -[PGGuessWhoRelationshipMetricEvent numberOfTopTwoPersonSocialGroupSignalRegistrations](self, "numberOfTopTwoPersonSocialGroupSignalRegistrations")+ v22);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference:](self, "setNumberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference](self, "numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference")+ v23);
  v24 = objc_msgSend(v64, "numberOfLoveEmojisExchanged");
  v25 = -[PGGuessWhoRelationshipMetricEvent numberOfLoveEmojisSignalRegistrations](self, "numberOfLoveEmojisSignalRegistrations");
  if (v24)
    v26 = v25 + 1;
  else
    v26 = v25;
  v27 = v4 && v24 != 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfLoveEmojisSignalRegistrations:](self, "setNumberOfLoveEmojisSignalRegistrations:", v26);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfLoveEmojisSignalRegistrationsInCorrectInference:](self, "setNumberOfLoveEmojisSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfLoveEmojisSignalRegistrationsInCorrectInference](self, "numberOfLoveEmojisSignalRegistrationsInCorrectInference")+ v27);
  v28 = objc_msgSend(v64, "isTopPerson");
  if (v4)
    v29 = v28;
  else
    v29 = 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfTopPersonSignalRegistrations:](self, "setNumberOfTopPersonSignalRegistrations:", -[PGGuessWhoRelationshipMetricEvent numberOfTopPersonSignalRegistrations](self, "numberOfTopPersonSignalRegistrations")+ v28);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfTopPersonSignalRegistrationsInCorrectInference:](self, "setNumberOfTopPersonSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfTopPersonSignalRegistrationsInCorrectInference](self, "numberOfTopPersonSignalRegistrationsInCorrectInference")+ v29);
  objc_msgSend(v64, "friendNightOutAttendanceRate");
  v31 = v30;
  v32 = -[PGGuessWhoRelationshipMetricEvent numberOfFriendNightOutSignalRegistrations](self, "numberOfFriendNightOutSignalRegistrations");
  if (v31 <= 0.0)
    v33 = v32;
  else
    v33 = v32 + 1;
  v34 = v4 && v31 > 0.0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfFriendNightOutSignalRegistrations:](self, "setNumberOfFriendNightOutSignalRegistrations:", v33);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfFriendNightOutSignalRegistrationsInCorrectInference:](self, "setNumberOfFriendNightOutSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfFriendNightOutSignalRegistrationsInCorrectInference](self, "numberOfFriendNightOutSignalRegistrationsInCorrectInference")+ v34);
  objc_msgSend(v64, "partnerTripAttendanceRate");
  v36 = v35;
  v37 = -[PGGuessWhoRelationshipMetricEvent numberOfPartnerTripSignalRegistrations](self, "numberOfPartnerTripSignalRegistrations");
  if (v36 <= 0.0)
    v38 = v37;
  else
    v38 = v37 + 1;
  v39 = v4 && v36 > 0.0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfPartnerTripSignalRegistrations:](self, "setNumberOfPartnerTripSignalRegistrations:", v38);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfPartnerTripSignalRegistrationsInCorrectInference:](self, "setNumberOfPartnerTripSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfPartnerTripSignalRegistrationsInCorrectInference](self, "numberOfPartnerTripSignalRegistrationsInCorrectInference")+ v39);
  objc_msgSend(v64, "friendsAndFamilyTripAttendanceRate");
  v41 = v40;
  v42 = -[PGGuessWhoRelationshipMetricEvent numberOfFriendsFamilyTripSignalRegistrations](self, "numberOfFriendsFamilyTripSignalRegistrations");
  if (v41 <= 0.0)
    v43 = v42;
  else
    v43 = v42 + 1;
  v44 = v4 && v41 > 0.0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfFriendsFamilyTripSignalRegistrations:](self, "setNumberOfFriendsFamilyTripSignalRegistrations:", v43);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfFriendsFamilyTripSignalRegistrationsInCorrectInference:](self, "setNumberOfFriendsFamilyTripSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference](self, "numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference")+ v44);
  objc_msgSend(v64, "weekendAppearanceRatio");
  v46 = v45;
  v47 = -[PGGuessWhoRelationshipMetricEvent numberOfWeekendSignalRegistrations](self, "numberOfWeekendSignalRegistrations");
  if (v46 <= 0.0)
    v48 = v47;
  else
    v48 = v47 + 1;
  v49 = v4 && v46 > 0.0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfWeekendSignalRegistrations:](self, "setNumberOfWeekendSignalRegistrations:", v48);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfWeekendSignalRegistrationsInCorrectInference:](self, "setNumberOfWeekendSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfWeekendSignalRegistrationsInCorrectInference](self, "numberOfWeekendSignalRegistrationsInCorrectInference")+ v49);
  objc_msgSend(v64, "momentsAtWorkAppearanceRate");
  v51 = v50;
  v52 = -[PGGuessWhoRelationshipMetricEvent numberOfCoworkersAtWorkSignalRegistrations](self, "numberOfCoworkersAtWorkSignalRegistrations");
  if (v51 <= 0.0)
    v53 = v52;
  else
    v53 = v52 + 1;
  v54 = v4 && v51 > 0.0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfCoworkersAtWorkSignalRegistrations:](self, "setNumberOfCoworkersAtWorkSignalRegistrations:", v53);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfCoworkersAtWorkSignalRegistrationsInCorrectInference:](self, "setNumberOfCoworkersAtWorkSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference](self, "numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference")+ v54);
  objc_msgSend(v64, "calendarAttendanceRatio");
  v56 = v55;
  v57 = -[PGGuessWhoRelationshipMetricEvent numberOfCoworkerCalendarSignalRegistrations](self, "numberOfCoworkerCalendarSignalRegistrations");
  if (v56 <= 0.0)
    v58 = v57;
  else
    v58 = v57 + 1;
  v59 = v4 && v56 > 0.0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfCoworkerCalendarSignalRegistrations:](self, "setNumberOfCoworkerCalendarSignalRegistrations:", v58);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfCoworkerCalendarSignalRegistrationsInCorrectInference:](self, "setNumberOfCoworkerCalendarSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfCoworkerCalendarSignalRegistrationsInCorrectInference](self, "numberOfCoworkerCalendarSignalRegistrationsInCorrectInference")+ v59);
  v60 = objc_msgSend(v64, "isPersonAgeDifferentThanMeNode");
  if (v4)
    v61 = v60;
  else
    v61 = 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfAgeDifferentThanMeSignalRegistrations:](self, "setNumberOfAgeDifferentThanMeSignalRegistrations:", -[PGGuessWhoRelationshipMetricEvent numberOfAgeDifferentThanMeSignalRegistrations](self, "numberOfAgeDifferentThanMeSignalRegistrations")+ v60);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference:](self, "setNumberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference](self, "numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference")+ v61);
  v62 = objc_msgSend(v64, "isPersonOldEnoughToBeParentOrGrandparent");
  if (v4)
    v63 = v62;
  else
    v63 = 0;
  -[PGGuessWhoRelationshipMetricEvent setNumberOfParentGrandparentOldSignalRegistrations:](self, "setNumberOfParentGrandparentOldSignalRegistrations:", -[PGGuessWhoRelationshipMetricEvent numberOfParentGrandparentOldSignalRegistrations](self, "numberOfParentGrandparentOldSignalRegistrations")+ v62);
  -[PGGuessWhoRelationshipMetricEvent setNumberOfParentGrandparentOldSignalRegistrationsInCorrectInference:](self, "setNumberOfParentGrandparentOldSignalRegistrationsInCorrectInference:", -[PGGuessWhoRelationshipMetricEvent numberOfParentGrandparentOldSignalRegistrationsInCorrectInference](self, "numberOfParentGrandparentOldSignalRegistrationsInCorrectInference")+ v63);

}

- (id)_inferredRelationshipKeys
{
  return &unk_1E84E9CA0;
}

- (id)_readableStringByRelationshipEdgeProperty
{
  _QWORD v3[16];
  _QWORD v4[17];

  v4[16] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("rfamhol");
  v3[1] = CFSTR("rparnam");
  v4[0] = CFSTR("Family Holiday");
  v4[1] = CFSTR("Parent Contact Name");
  v3[2] = CFSTR("rfamnam");
  v3[3] = CFSTR("gwnummmtshome");
  v4[2] = CFSTR("Same Family Name");
  v4[3] = CFSTR("Moments At Home");
  v3[4] = CFSTR("rhasanniv");
  v3[5] = CFSTR("rtop2sg");
  v4[4] = CFSTR("Anniversary Date");
  v4[5] = CFSTR("Top Two Person SG");
  v3[6] = CFSTR("rlovexch");
  v3[7] = CFSTR("rtop");
  v4[6] = CFSTR("Love Emojis");
  v4[7] = CFSTR("Top Person");
  v3[8] = CFSTR("rfrndnghtout");
  v3[9] = CFSTR("rprtnrtrip");
  v4[8] = CFSTR("Friend Night Out");
  v4[9] = CFSTR("Partner Trip");
  v3[10] = CFSTR("rfrfamtrip");
  v3[11] = CFSTR("rwkend");
  v4[10] = CFSTR("Friends/Family Trip");
  v4[11] = CFSTR("Weekend");
  v3[12] = CFSTR("rwork");
  v3[13] = CFSTR("rcal");
  v4[12] = CFSTR("Coworkers At Work");
  v4[13] = CFSTR("Coworker Calendar");
  v3[14] = CFSTR("ragediff");
  v3[15] = CFSTR("rold");
  v4[14] = CFSTR("Age Different Than Me");
  v4[15] = CFSTR("Parent Or Grandparent Old Enough");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_relationshipKeyForLabel:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAMILY")) & 1) != 0)
  {
    v4 = &unk_1E84E4010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARTNER")) & 1) != 0)
  {
    v4 = &unk_1E84E4058;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COWORKER")) & 1) != 0)
  {
    v4 = &unk_1E84E4040;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRIEND")) & 1) != 0)
  {
    v4 = &unk_1E84E4028;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PARENT")))
  {
    v4 = &unk_1E84E4070;
  }
  else
  {
    v4 = &unk_1E84E40A0;
  }

  return v4;
}

- (unint64_t)numberOfPeople
{
  return self->_numberOfPeople;
}

- (void)setNumberOfPeople:(unint64_t)a3
{
  self->_numberOfPeople = a3;
}

- (unint64_t)numberOfInferredFamilyMembers
{
  return self->_numberOfInferredFamilyMembers;
}

- (void)setNumberOfInferredFamilyMembers:(unint64_t)a3
{
  self->_numberOfInferredFamilyMembers = a3;
}

- (unint64_t)numberOfInferredFriends
{
  return self->_numberOfInferredFriends;
}

- (void)setNumberOfInferredFriends:(unint64_t)a3
{
  self->_numberOfInferredFriends = a3;
}

- (unint64_t)numberOfInferredParents
{
  return self->_numberOfInferredParents;
}

- (void)setNumberOfInferredParents:(unint64_t)a3
{
  self->_numberOfInferredParents = a3;
}

- (unint64_t)numberOfInferredCoworkers
{
  return self->_numberOfInferredCoworkers;
}

- (void)setNumberOfInferredCoworkers:(unint64_t)a3
{
  self->_numberOfInferredCoworkers = a3;
}

- (unint64_t)numberOfInferredPartners
{
  return self->_numberOfInferredPartners;
}

- (void)setNumberOfInferredPartners:(unint64_t)a3
{
  self->_numberOfInferredPartners = a3;
}

- (unint64_t)numberOfInferredChildren
{
  return self->_numberOfInferredChildren;
}

- (void)setNumberOfInferredChildren:(unint64_t)a3
{
  self->_numberOfInferredChildren = a3;
}

- (unint64_t)numberOfFamilyHolidaySignalRegistrations
{
  return self->_numberOfFamilyHolidaySignalRegistrations;
}

- (void)setNumberOfFamilyHolidaySignalRegistrations:(unint64_t)a3
{
  self->_numberOfFamilyHolidaySignalRegistrations = a3;
}

- (unint64_t)numberOfParentContactNameSignalRegistrations
{
  return self->_numberOfParentContactNameSignalRegistrations;
}

- (void)setNumberOfParentContactNameSignalRegistrations:(unint64_t)a3
{
  self->_numberOfParentContactNameSignalRegistrations = a3;
}

- (unint64_t)numberOfSameFamilyNameSignalRegistrations
{
  return self->_numberOfSameFamilyNameSignalRegistrations;
}

- (void)setNumberOfSameFamilyNameSignalRegistrations:(unint64_t)a3
{
  self->_numberOfSameFamilyNameSignalRegistrations = a3;
}

- (unint64_t)numberOfHomeMomentsSignalRegistrations
{
  return self->_numberOfHomeMomentsSignalRegistrations;
}

- (void)setNumberOfHomeMomentsSignalRegistrations:(unint64_t)a3
{
  self->_numberOfHomeMomentsSignalRegistrations = a3;
}

- (unint64_t)numberOfAnniversaryDateSignalRegistrations
{
  return self->_numberOfAnniversaryDateSignalRegistrations;
}

- (void)setNumberOfAnniversaryDateSignalRegistrations:(unint64_t)a3
{
  self->_numberOfAnniversaryDateSignalRegistrations = a3;
}

- (unint64_t)numberOfTopTwoPersonSocialGroupSignalRegistrations
{
  return self->_numberOfTopTwoPersonSocialGroupSignalRegistrations;
}

- (void)setNumberOfTopTwoPersonSocialGroupSignalRegistrations:(unint64_t)a3
{
  self->_numberOfTopTwoPersonSocialGroupSignalRegistrations = a3;
}

- (unint64_t)numberOfLoveEmojisSignalRegistrations
{
  return self->_numberOfLoveEmojisSignalRegistrations;
}

- (void)setNumberOfLoveEmojisSignalRegistrations:(unint64_t)a3
{
  self->_numberOfLoveEmojisSignalRegistrations = a3;
}

- (unint64_t)numberOfTopPersonSignalRegistrations
{
  return self->_numberOfTopPersonSignalRegistrations;
}

- (void)setNumberOfTopPersonSignalRegistrations:(unint64_t)a3
{
  self->_numberOfTopPersonSignalRegistrations = a3;
}

- (unint64_t)numberOfFriendNightOutSignalRegistrations
{
  return self->_numberOfFriendNightOutSignalRegistrations;
}

- (void)setNumberOfFriendNightOutSignalRegistrations:(unint64_t)a3
{
  self->_numberOfFriendNightOutSignalRegistrations = a3;
}

- (unint64_t)numberOfPartnerTripSignalRegistrations
{
  return self->_numberOfPartnerTripSignalRegistrations;
}

- (void)setNumberOfPartnerTripSignalRegistrations:(unint64_t)a3
{
  self->_numberOfPartnerTripSignalRegistrations = a3;
}

- (unint64_t)numberOfFriendsFamilyTripSignalRegistrations
{
  return self->_numberOfFriendsFamilyTripSignalRegistrations;
}

- (void)setNumberOfFriendsFamilyTripSignalRegistrations:(unint64_t)a3
{
  self->_numberOfFriendsFamilyTripSignalRegistrations = a3;
}

- (unint64_t)numberOfWeekendSignalRegistrations
{
  return self->_numberOfWeekendSignalRegistrations;
}

- (void)setNumberOfWeekendSignalRegistrations:(unint64_t)a3
{
  self->_numberOfWeekendSignalRegistrations = a3;
}

- (unint64_t)numberOfCoworkersAtWorkSignalRegistrations
{
  return self->_numberOfCoworkersAtWorkSignalRegistrations;
}

- (void)setNumberOfCoworkersAtWorkSignalRegistrations:(unint64_t)a3
{
  self->_numberOfCoworkersAtWorkSignalRegistrations = a3;
}

- (unint64_t)numberOfCoworkerCalendarSignalRegistrations
{
  return self->_numberOfCoworkerCalendarSignalRegistrations;
}

- (void)setNumberOfCoworkerCalendarSignalRegistrations:(unint64_t)a3
{
  self->_numberOfCoworkerCalendarSignalRegistrations = a3;
}

- (unint64_t)numberOfAgeDifferentThanMeSignalRegistrations
{
  return self->_numberOfAgeDifferentThanMeSignalRegistrations;
}

- (void)setNumberOfAgeDifferentThanMeSignalRegistrations:(unint64_t)a3
{
  self->_numberOfAgeDifferentThanMeSignalRegistrations = a3;
}

- (unint64_t)numberOfParentGrandparentOldSignalRegistrations
{
  return self->_numberOfParentGrandparentOldSignalRegistrations;
}

- (void)setNumberOfParentGrandparentOldSignalRegistrations:(unint64_t)a3
{
  self->_numberOfParentGrandparentOldSignalRegistrations = a3;
}

- (unint64_t)numberOfFamilyHolidaySignalRegistrationsInCorrectInference
{
  return self->_numberOfFamilyHolidaySignalRegistrationsInCorrectInference;
}

- (void)setNumberOfFamilyHolidaySignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfFamilyHolidaySignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfParentContactNameSignalRegistrationsInCorrectInference
{
  return self->_numberOfParentContactNameSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfParentContactNameSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfParentContactNameSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfSameFamilyNameSignalRegistrationsInCorrectInference
{
  return self->_numberOfSameFamilyNameSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfSameFamilyNameSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfSameFamilyNameSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfHomeMomentsSignalRegistrationsInCorrectInference
{
  return self->_numberOfHomeMomentsSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfHomeMomentsSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfHomeMomentsSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfAnniversaryDateSignalRegistrationsInCorrectInference
{
  return self->_numberOfAnniversaryDateSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfAnniversaryDateSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfAnniversaryDateSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference
{
  return self->_numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfLoveEmojisSignalRegistrationsInCorrectInference
{
  return self->_numberOfLoveEmojisSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfLoveEmojisSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfLoveEmojisSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfTopPersonSignalRegistrationsInCorrectInference
{
  return self->_numberOfTopPersonSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfTopPersonSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfTopPersonSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfFriendNightOutSignalRegistrationsInCorrectInference
{
  return self->_numberOfFriendNightOutSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfFriendNightOutSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfFriendNightOutSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfPartnerTripSignalRegistrationsInCorrectInference
{
  return self->_numberOfPartnerTripSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfPartnerTripSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfPartnerTripSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference
{
  return self->_numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfFriendsFamilyTripSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfWeekendSignalRegistrationsInCorrectInference
{
  return self->_numberOfWeekendSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfWeekendSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfWeekendSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference
{
  return self->_numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfCoworkersAtWorkSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfCoworkerCalendarSignalRegistrationsInCorrectInference
{
  return self->_numberOfCoworkerCalendarSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfCoworkerCalendarSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfCoworkerCalendarSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference
{
  return self->_numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfParentGrandparentOldSignalRegistrationsInCorrectInference
{
  return self->_numberOfParentGrandparentOldSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfParentGrandparentOldSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfParentGrandparentOldSignalRegistrationsInCorrectInference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

void __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id obj;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  objc_msgSend(v10, "graph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  v2 = PGIsAppleInternal_isAppleInternal;
  objc_msgSend(v12, "personNodesIncludingMe:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfPeople:", objc_msgSend(v11, "count"));
  objc_msgSend(v12, "meNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_inferredRelationshipKeys");
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v56, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "unsignedIntegerValue");
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke_2;
        v16[3] = &unk_1E842D778;
        v25 = &v32;
        v26 = v7;
        v20 = &v52;
        v21 = &v48;
        v22 = &v44;
        v23 = &v40;
        v24 = &v36;
        v27 = v2;
        v8 = v14;
        v9 = *(_QWORD *)(a1 + 32);
        v17 = v8;
        v18 = v9;
        v19 = v6;
        objc_msgSend(v8, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", v7, 2, v16);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v56, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInferredFamilyMembers:", v53[3]);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInferredFriends:", v49[3]);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInferredParents:", v45[3]);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInferredCoworkers:", v41[3]);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInferredPartners:", v37[3]);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInferredChildren:", v33[3]);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

}

void __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  switch(*(_QWORD *)(a1 + 104))
  {
    case 1:
      v7 = a1 + 80;
      goto LABEL_8;
    case 2:
      v7 = a1 + 64;
      goto LABEL_8;
    case 4:
      v7 = a1 + 56;
      goto LABEL_8;
    case 5:
      v7 = a1 + 96;
      goto LABEL_8;
    case 8:
      v7 = a1 + 72;
      goto LABEL_8;
    case 0xDLL:
      v7 = a1 + 88;
LABEL_8:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24);
      break;
    default:
      break;
  }
  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 32), "relationshipEdgesToPersonNode:matchingQuery:", v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "label");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_relationshipKeyForLabel:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v14) = v16 == *(void **)(a1 + 48);

          v11 |= v14;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "_incrementRelationshipSignalMetricsForRelationshipEdge:inferredRelationshipCorrect:", v6, v11 & 1);

  }
}

@end
