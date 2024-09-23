@implementation MOPromptMetrics

- (MOPromptMetrics)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8;
  id v9;
  void *v10;
  MOPromptMetrics *v11;
  MOPromptMetrics *v12;
  void *v13;
  void *v14;
  MOPromptMetrics *v15;
  id os_log;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  SEL v28;
  MOPromptMetrics *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOPromptMetrics initWithStartDate:endDate:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: startDate");
    v28 = a2;
    v29 = self;
    v30 = 37;
    goto LABEL_12;
  }
  if (!v9)
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MOPromptMetrics initWithStartDate:endDate:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: endDate");
    v28 = a2;
    v29 = self;
    v30 = 38;
LABEL_12:
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("MOPromptMetrics.m"), v30, v27);

    v15 = 0;
    goto LABEL_13;
  }
  v11 = -[MOPromptMetrics initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
    -[NSDate timeIntervalSinceDate:](v12->_endDate, "timeIntervalSinceDate:", v12->_startDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v12, "metrics"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("QueryTimeDuration"));

  }
  self = v12;
  v15 = self;
LABEL_13:

  return v15;
}

- (MOPromptMetrics)initWithStartDate:(id)a3 endDate:(id)a4 EventManager:(id)a5
{
  id v10;
  MOPromptMetrics *v11;
  MOPromptMetrics *v12;
  MOPromptMetrics *v13;
  id os_log;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v10 = a5;
  if (v10)
  {
    v11 = -[MOPromptMetrics initWithStartDate:endDate:](self, "initWithStartDate:endDate:", a3, a4);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)&v11->_eventManager, a5);
    self = v12;
    v13 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MOPromptMetrics initWithStartDate:endDate:EventManager:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPromptMetrics.m"), 53, CFSTR("Invalid parameter not satisfying: eventManager"));

    v13 = 0;
  }

  return v13;
}

- (MOPromptMetrics)initWithLoggingEnabled:(BOOL)a3
{
  MOPromptMetrics *v3;
  uint64_t v4;
  MOPromptMetrics *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];

  v58.receiver = self;
  v58.super_class = (Class)MOPromptMetrics;
  v3 = -[MOMetric initWithLoggingEnabled:](&v58, "initWithLoggingEnabled:", a3);
  v5 = v3;
  if (v3)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(v3, v4), "BOOLeanKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v9);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = objc_msgSend((id)objc_opt_class(v5, v14), "integerKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_1002DB1E0, v21);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      }
      while (v18);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v24 = objc_msgSend((id)objc_opt_class(v5, v23), "doubleKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v47;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v31, "setObject:forKeyedSubscript:", &off_1002DD168, v30);

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
      }
      while (v27);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = objc_msgSend((id)objc_opt_class(v5, v32), "bucketedKeys", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v43;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v40, "setObject:forKeyedSubscript:", &off_1002DB1E0, v39);

          v38 = (char *)v38 + 1;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
      }
      while (v36);
    }

  }
  return v5;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("IHA_State"), 0);
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Age"), CFSTR("BiologicalSex"), CFSTR("ZeroEventDayCount"), CFSTR("ZeroEventWeekCount"), CFSTR("ZeroEventDayCountAcrossAllEvents"), CFSTR("ZeroEventWeekCountAcrossAllEvents"), CFSTR("Routine_nVisits"), CFSTR("Routine_nHomeVisits"), CFSTR("Routine_nWorkVisits"), CFSTR("Routine_nGymVisits"), CFSTR("Routine_nSchoolVisits"), CFSTR("Storytelling_NumMoments"), CFSTR("Storytelling_NumMomentsWithEvent"), CFSTR("Storytelling_NumMomentsWithEventAndArtist"), CFSTR("Storytelling_NumMomentsWithPeople"), CFSTR("Storytelling_NumMomentsWithFamily"), CFSTR("Storytelling_MomenetInferenceTag_1_1"),
           CFSTR("Storytelling_MomenetInferenceTag_1_2"),
           CFSTR("Storytelling_MomenetInferenceTag_1_3"),
           CFSTR("Storytelling_MomenetInferenceTag_1_4"),
           CFSTR("Storytelling_MomenetInferenceTag_2_1"),
           CFSTR("Storytelling_MomenetInferenceTag_2_2"),
           CFSTR("Storytelling_MomenetInferenceTag_2_3"),
           CFSTR("Storytelling_MomenetInferenceTag_2_4"),
           CFSTR("Storytelling_MomenetInferenceTag_3_1"),
           CFSTR("Storytelling_MomenetInferenceTag_3_2"),
           CFSTR("Storytelling_MomenetInferenceTag_3_3"),
           CFSTR("Storytelling_MomenetInferenceTag_3_4"),
           CFSTR("Workout_NumWorkouts"),
           CFSTR("Workout_WorkoutType_1"),
           CFSTR("Workout_WorkoutType_2"),
           CFSTR("Workout_WorkoutType_3"),
           CFSTR("Workout_WorkoutType_4"),
           CFSTR("Workout_WorkoutType_5"),
           CFSTR("Workout_WorkoutType_6"),
           CFSTR("Workout_WorkoutType_7"),
           CFSTR("Workout_WorkoutType_8"),
           CFSTR("Workout_WorkoutType_9"),
           CFSTR("Workout_WorkoutType_10"),
           CFSTR("Proactive_NumAllEvents"),
           CFSTR("Proactive_NumMediaOnRepeatEvents"),
           CFSTR("Proactive_NumTopicEvents"),
           CFSTR("Proactive_NumTravelEvents"),
           CFSTR("Proactive_NumSharedWithYouEvents"),
           CFSTR("Proactive_NumSignificantContactEvents"),
           CFSTR("Proactive_NumStructuredEvents"),
           CFSTR("Proactive_NumLeisureMediaEvents"),
           CFSTR("Proactive_NumNLEvents"),
           CFSTR("numPreBundles"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0"),
           CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1"),
           CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0"),
           CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1"),
           CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0"),
           CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1"));
}

+ (id)doubleKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("QueryTimeDuration"), CFSTR("Routine_AverageVisitsLatency"), CFSTR("Routine_AverageVisitsRealLatency"), CFSTR("Storytelling_AverageMomentsLatency"), CFSTR("Storytelling_AverageMomentsRealLatency"), CFSTR("Workout_AverageWorkoutLatency"), CFSTR("Proactive_EventsAverageLatency"), CFSTR("Proactive_MediaOnRepeatAverageLatency"), CFSTR("Proactive_TopicAverageLatency"), CFSTR("Proactive_TravelAverageLatency"), CFSTR("Proactive_SharedWithYouAverageLatency"), CFSTR("Proactive_SignificantContactAverageLatency"), CFSTR("Proactive_StructuredEventsAverageLatency"), CFSTR("Proactive_LeisureMediaEventsAverageLatency"), CFSTR("Proactive_NLEventsAverageLatency"), CFSTR("Routine_MeanDeltaBetweenVisits"), CFSTR("Routine_MeanDeltaBetweenVisitsBoundariesIncluded"),
           CFSTR("Routine_MinDeltaBetweenVisits"),
           CFSTR("Routine_MinDeltaBetweenVisitsBoundariesIncluded"),
           CFSTR("Routine_MaxDeltaBetweenVisits"),
           CFSTR("Routine_MaxDeltaBetweenVisitsBoundariesIncluded"),
           CFSTR("Routine_SDDeltaBetweenVisits"),
           CFSTR("Routine_SDDeltaBetweenVisitsBoundariesIncluded"),
           CFSTR("Storytelling_PercentageOfMomentEventsNoLOI"),
           CFSTR("Workout_PercentageOfWorkoutEventsNoLOI"),
           CFSTR("Proactive_PercentageOfMediaOnRepeatEventsNoLOI"),
           CFSTR("Proactive_PercentageOfTopicEventsNoLOI"),
           CFSTR("Proactive_PercentageOfTravelEventsNoLOI"),
           CFSTR("Proactive_PercentageOfSharedWithYouEventsNoLOI"),
           CFSTR("Proactive_PercentageOfSignificantContactEventsNoLOI"),
           CFSTR("Proactive_PercentageOfStructuredEventsNoLOI"),
           CFSTR("Proactive_PercentageOfLeisureMediaEventsNoLOI"),
           CFSTR("Proactive_PercentageOfNLEventsNoLOI"),
           CFSTR("Storytelling_MeanDeltaBetweenMoments"),
           CFSTR("Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded"),
           CFSTR("Storytelling_MinDeltaBetweenMoments"),
           CFSTR("Storytelling_MinDeltaBetweenMomentsBoundariesIncluded"),
           CFSTR("Storytelling_MaxDeltaBetweenMoments"),
           CFSTR("Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded"),
           CFSTR("Storytelling_SDDeltaBetweenMoments"),
           CFSTR("Storytelling_SDDeltaBetweenMomentsBoundariesIncluded"),
           CFSTR("Workout_MeanDeltaBetweenWorkouts"),
           CFSTR("Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded"),
           CFSTR("Workout_MinDeltaBetweenWorkouts"),
           CFSTR("Workout_MinDeltaBetweenWorkoutsBoundariesIncluded"),
           CFSTR("Workout_MaxDeltaBetweenWorkouts"),
           CFSTR("Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded"),
           CFSTR("Workout_SDDeltaBetweenWorkouts"),
           CFSTR("Workout_SDDeltaBetweenWorkoutsBoundariesIncluded"),
           CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEvents"),
           CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"),
           CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEvents"),
           CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"),
           CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEvents"),
           CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"),
           CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEvents"),
           CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"),
           CFSTR("Proactive_MeanDeltaBetweenTopicEvents"),
           CFSTR("Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded"),
           CFSTR("Proactive_MinDeltaBetweenTopicEvents"),
           CFSTR("Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded"));
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("QueryTimeDuration_Bucketed"), CFSTR("Age_Bucketed"), CFSTR("HourIDSubmission"), CFSTR("DayIDSubmission"), CFSTR("Routine_nVisits_Bucketed"), CFSTR("Routine_nHomeVisits_Bucketed"), CFSTR("Routine_nWorkVisits_Bucketed"), CFSTR("Routine_nGymVisits_Bucketed"), CFSTR("Routine_nSchoolVisits_Bucketed"), CFSTR("Routine_AverageVisitsLatency_Bucketed"), CFSTR("Routine_AverageVisitsRealLatency_Bucketed"), CFSTR("Routine_HourIDVisit_Start_1"), CFSTR("Routine_HourIDVisit_Start_2"), CFSTR("Routine_HourIDVisit_Start_3"), CFSTR("Routine_HourIDVisit_Start_4"), CFSTR("Routine_HourIDVisit_Start_5"), CFSTR("Routine_HourIDVisit_Start_6"),
           CFSTR("Routine_HourIDVisit_Start_7"),
           CFSTR("Routine_HourIDVisit_Start_8"),
           CFSTR("Routine_HourIDVisit_Start_9"),
           CFSTR("Routine_HourIDVisit_Start_10"),
           CFSTR("Routine_HourIDVisit_End_1"),
           CFSTR("Routine_HourIDVisit_End_2"),
           CFSTR("Routine_HourIDVisit_End_3"),
           CFSTR("Routine_HourIDVisit_End_4"),
           CFSTR("Routine_HourIDVisit_End_5"),
           CFSTR("Routine_HourIDVisit_End_6"),
           CFSTR("Routine_HourIDVisit_End_7"),
           CFSTR("Routine_HourIDVisit_End_8"),
           CFSTR("Routine_HourIDVisit_End_9"),
           CFSTR("Routine_HourIDVisit_End_10"),
           CFSTR("Routine_MeanDeltaBetweenVisits_Bucketed"),
           CFSTR("Routine_MeanDeltaBetweenVisitsBoundariesIncluded_Bucketed"),
           CFSTR("Routine_MinDeltaBetweenVisits_Bucketed"),
           CFSTR("Routine_MinDeltaBetweenVisitsBoundariesIncluded_Bucketed"),
           CFSTR("Routine_MaxDeltaBetweenVisits_Bucketed"),
           CFSTR("Routine_MaxDeltaBetweenVisitsBoundariesIncluded_Bucketed"),
           CFSTR("Routine_SDDeltaBetweenVisits_Bucketed"),
           CFSTR("Routine_SDDeltaBetweenVisitsBoundariesIncluded_Bucketed"),
           CFSTR("Storytelling_PercentageOfMomentEventsNoLOI_Bucketed"),
           CFSTR("Workout_PercentageOfWorkoutEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfMediaOnRepeatEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfTopicEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfTravelEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfSharedWithYouEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfSignificantContactEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfStructuredEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfLeisureMediaEventsNoLOI_Bucketed"),
           CFSTR("Proactive_PercentageOfNLEventsNoLOI_Bucketed"),
           CFSTR("Storytelling_NumMoments_Bucketed"),
           CFSTR("Storytelling_NumMomentsWithEvent_Bucketed"),
           CFSTR("Storytelling_NumMomentsWithEventAndArtist_Bucketed"),
           CFSTR("Storytelling_NumMomentsWithPeople_Bucketed"),
           CFSTR("Storytelling_NumMomentsWithFamily_Bucketed"),
           CFSTR("Storytelling_MomenetInferenceTag_1_1_Bucketed"),
           CFSTR("Storytelling_MomenetInferenceTag_1_2_Bucketed"),
           CFSTR("Storytelling_MomenetInferenceTag_1_3_Bucketed"),
           CFSTR("Storytelling_MomenetInferenceTag_1_4_Bucketed"),
           CFSTR("Storytelling_MomenetInferenceTag_2_1_Bucketed"),
           CFSTR("Storytelling_MomenetInferenceTag_2_2_Bucketed"),
           CFSTR("Storytelling_MomenetInferenceTag_2_3_Bucketed"));
}

+ (id)supportedMetricKeys
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  v3 = objc_msgSend((id)objc_opt_class(a1, a2), "integerKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v4));

  v7 = objc_msgSend((id)objc_opt_class(a1, v6), "BOOLeanKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  v11 = objc_msgSend((id)objc_opt_class(a1, v10), "doubleKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  v15 = objc_msgSend((id)objc_opt_class(a1, v14), "bucketedKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v17);

  return v5;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)MOAnalyticsEventPromptMetrics;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  objc_super v6;

  -[MOPromptMetrics setDerivedMetrics](self, "setDerivedMetrics");
  v6.receiver = self;
  v6.super_class = (Class)MOPromptMetrics;
  return -[MOMetric submitMetricsWithError:](&v6, "submitMetricsWithError:", a3);
}

+ (id)medianOf:(id)a3
{
  id v3;
  void *v4;
  _UNKNOWN **v5;
  unsigned __int8 v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v4, "doubleValue");
      v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingSelector:", "compare:"));
      v6 = objc_msgSend(v3, "count");
      v7 = (unint64_t)objc_msgSend(v4, "count") >> 1;
      if ((v6 & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v7));
        objc_msgSend(v8, "doubleValue");
        v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v7 - 1));
        objc_msgSend(v8, "doubleValue");
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v7));
        objc_msgSend(v11, "doubleValue");
        v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v10 + v12) * 0.5));

      }
    }

  }
  else
  {
    v5 = &off_1002DD168;
  }

  return v5;
}

+ (id)meanOf:(id)a3
{
  id v3;
  void *v4;
  _UNKNOWN **v5;
  double v6;
  unint64_t v7;
  void *v8;
  double v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v4, "doubleValue");
      v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    }
    else
    {
      v6 = 0.0;
      if (objc_msgSend(v3, "count"))
      {
        v7 = 1;
        do
        {
          if ((unint64_t)objc_msgSend(v3, "count") >= v7)
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v7 - 1));
            objc_msgSend(v8, "doubleValue");
            v6 = v6 + (v9 - v6) / (double)(int)v7;

          }
          else
          {
            v6 = v6 - v6 / (double)(int)v7;
          }
        }
        while ((unint64_t)objc_msgSend(v3, "count") > v7++);
      }
      v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    }
  }
  else
  {
    v5 = &off_1002DD168;
  }

  return v5;
}

+ (id)standardDeviationOf:(id)a3
{
  id v3;
  _UNKNOWN **v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = &off_1002DD178;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v3));
      objc_msgSend(v5, "doubleValue");
      v7 = v6;

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v3;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        v12 = 0.0;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "doubleValue", (_QWORD)v16);
            v12 = v12 + (v14 - v7) * (v14 - v7);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }
      else
      {
        v12 = 0.0;
      }

      v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqrt(v12 / (double)(unint64_t)objc_msgSend(v8, "count"))));
    }
  }
  else
  {
    v4 = &off_1002DD168;
  }

  return v4;
}

+ (id)getTimeDeltaMetricMap
{
  _QWORD v3[88];
  _QWORD v4[88];

  v3[0] = CFSTR("Routine_MeanDeltaBetweenVisits");
  v3[1] = CFSTR("Routine_MeanDeltaBetweenVisitsBoundariesIncluded");
  v4[0] = CFSTR("Routine_MeanDeltaBetweenVisits_Bucketed");
  v4[1] = CFSTR("Routine_MeanDeltaBetweenVisitsBoundariesIncluded_Bucketed");
  v3[2] = CFSTR("Routine_MinDeltaBetweenVisits");
  v3[3] = CFSTR("Routine_MinDeltaBetweenVisitsBoundariesIncluded");
  v4[2] = CFSTR("Routine_MinDeltaBetweenVisits_Bucketed");
  v4[3] = CFSTR("Routine_MinDeltaBetweenVisitsBoundariesIncluded_Bucketed");
  v3[4] = CFSTR("Routine_MaxDeltaBetweenVisits");
  v3[5] = CFSTR("Routine_MaxDeltaBetweenVisitsBoundariesIncluded");
  v4[4] = CFSTR("Routine_MaxDeltaBetweenVisits_Bucketed");
  v4[5] = CFSTR("Routine_MaxDeltaBetweenVisitsBoundariesIncluded_Bucketed");
  v3[6] = CFSTR("Routine_SDDeltaBetweenVisits");
  v3[7] = CFSTR("Routine_SDDeltaBetweenVisitsBoundariesIncluded");
  v4[6] = CFSTR("Routine_SDDeltaBetweenVisits_Bucketed");
  v4[7] = CFSTR("Routine_SDDeltaBetweenVisitsBoundariesIncluded_Bucketed");
  v3[8] = CFSTR("Storytelling_MeanDeltaBetweenMoments");
  v3[9] = CFSTR("Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded");
  v4[8] = CFSTR("Storytelling_MeanDeltaBetweenMoments_Bucketed");
  v4[9] = CFSTR("Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded_Bucketed");
  v3[10] = CFSTR("Storytelling_MinDeltaBetweenMoments");
  v3[11] = CFSTR("Storytelling_MinDeltaBetweenMomentsBoundariesIncluded");
  v4[10] = CFSTR("Storytelling_MinDeltaBetweenMoments_Bucketed");
  v4[11] = CFSTR("Storytelling_MinDeltaBetweenMomentsBoundariesIncluded_Bucketed");
  v3[12] = CFSTR("Storytelling_MaxDeltaBetweenMoments");
  v3[13] = CFSTR("Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded");
  v4[12] = CFSTR("Storytelling_MaxDeltaBetweenMoments_Bucketed");
  v4[13] = CFSTR("Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded_Bucketed");
  v3[14] = CFSTR("Storytelling_SDDeltaBetweenMoments");
  v3[15] = CFSTR("Storytelling_SDDeltaBetweenMomentsBoundariesIncluded");
  v4[14] = CFSTR("Storytelling_SDDeltaBetweenMoments_Bucketed");
  v4[15] = CFSTR("Storytelling_SDDeltaBetweenMomentsBoundariesIncluded_Bucketed");
  v3[16] = CFSTR("Workout_MeanDeltaBetweenWorkouts");
  v3[17] = CFSTR("Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded");
  v4[16] = CFSTR("Workout_MeanDeltaBetweenWorkouts_Bucketed");
  v4[17] = CFSTR("Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded_Bucketed");
  v3[18] = CFSTR("Workout_MinDeltaBetweenWorkouts");
  v3[19] = CFSTR("Workout_MinDeltaBetweenWorkoutsBoundariesIncluded");
  v4[18] = CFSTR("Workout_MinDeltaBetweenWorkouts_Bucketed");
  v4[19] = CFSTR("Workout_MinDeltaBetweenWorkoutsBoundariesIncluded_Bucketed");
  v3[20] = CFSTR("Workout_MaxDeltaBetweenWorkouts");
  v3[21] = CFSTR("Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded");
  v4[20] = CFSTR("Workout_MaxDeltaBetweenWorkouts_Bucketed");
  v4[21] = CFSTR("Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded_Bucketed");
  v3[22] = CFSTR("Workout_SDDeltaBetweenWorkouts");
  v3[23] = CFSTR("Workout_SDDeltaBetweenWorkoutsBoundariesIncluded");
  v4[22] = CFSTR("Workout_SDDeltaBetweenWorkouts_Bucketed");
  v4[23] = CFSTR("Workout_SDDeltaBetweenWorkoutsBoundariesIncluded_Bucketed");
  v3[24] = CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEvents");
  v3[25] = CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded");
  v4[24] = CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEvents_Bucketed");
  v4[25] = CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed");
  v3[26] = CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEvents");
  v3[27] = CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded");
  v4[26] = CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEvents_Bucketed");
  v4[27] = CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed");
  v3[28] = CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEvents");
  v3[29] = CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded");
  v4[28] = CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEvents_Bucketed");
  v4[29] = CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed");
  v3[30] = CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEvents");
  v3[31] = CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded");
  v4[30] = CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEvents_Bucketed");
  v4[31] = CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed");
  v3[32] = CFSTR("Proactive_MeanDeltaBetweenTopicEvents");
  v3[33] = CFSTR("Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded");
  v4[32] = CFSTR("Proactive_MeanDeltaBetweenTopicEvents_Bucketed");
  v4[33] = CFSTR("Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded_Bucketed");
  v3[34] = CFSTR("Proactive_MinDeltaBetweenTopicEvents");
  v3[35] = CFSTR("Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded");
  v4[34] = CFSTR("Proactive_MinDeltaBetweenTopicEvents_Bucketed");
  v4[35] = CFSTR("Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded_Bucketed");
  v3[36] = CFSTR("Proactive_MaxDeltaBetweenTopicEvents");
  v3[37] = CFSTR("Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded");
  v4[36] = CFSTR("Proactive_MaxDeltaBetweenTopicEvents_Bucketed");
  v4[37] = CFSTR("Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded_Bucketed");
  v3[38] = CFSTR("Proactive_SDDeltaBetweenTopicEvents");
  v3[39] = CFSTR("Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded");
  v4[38] = CFSTR("Proactive_SDDeltaBetweenTopicEvents_Bucketed");
  v4[39] = CFSTR("Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded_Bucketed");
  v3[40] = CFSTR("Proactive_MeanDeltaBetweenTravelEvents");
  v3[41] = CFSTR("Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded");
  v4[40] = CFSTR("Proactive_MeanDeltaBetweenTravelEvents_Bucketed");
  v4[41] = CFSTR("Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded_Bucketed");
  v3[42] = CFSTR("Proactive_MinDeltaBetweenTravelEvents");
  v3[43] = CFSTR("Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded");
  v4[42] = CFSTR("Proactive_MinDeltaBetweenTravelEvents_Bucketed");
  v4[43] = CFSTR("Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded_Bucketed");
  v3[44] = CFSTR("Proactive_MaxDeltaBetweenTravelEvents");
  v3[45] = CFSTR("Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded");
  v4[44] = CFSTR("Proactive_MaxDeltaBetweenTravelEvents_Bucketed");
  v4[45] = CFSTR("Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded_Bucketed");
  v3[46] = CFSTR("Proactive_SDDeltaBetweenTravelEvents");
  v3[47] = CFSTR("Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded");
  v4[46] = CFSTR("Proactive_SDDeltaBetweenTravelEvents_Bucketed");
  v4[47] = CFSTR("Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded_Bucketed");
  v3[48] = CFSTR("Proactive_MeanDeltaBetweenSharedWithYouEvents");
  v3[49] = CFSTR("Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded");
  v4[48] = CFSTR("Proactive_MeanDeltaBetweenSharedWithYouEvents_Bucketed");
  v4[49] = CFSTR("Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed");
  v3[50] = CFSTR("Proactive_MinDeltaBetweenSharedWithYouEvents");
  v3[51] = CFSTR("Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded");
  v4[50] = CFSTR("Proactive_MinDeltaBetweenSharedWithYouEvents_Bucketed");
  v4[51] = CFSTR("Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed");
  v3[52] = CFSTR("Proactive_MaxDeltaBetweenSharedWithYouEvents");
  v3[53] = CFSTR("Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded");
  v4[52] = CFSTR("Proactive_MaxDeltaBetweenSharedWithYouEvents_Bucketed");
  v4[53] = CFSTR("Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed");
  v3[54] = CFSTR("Proactive_SDDeltaBetweenSharedWithYouEvents");
  v3[55] = CFSTR("Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded");
  v4[54] = CFSTR("Proactive_SDDeltaBetweenSharedWithYouEvents_Bucketed");
  v4[55] = CFSTR("Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed");
  v3[56] = CFSTR("Proactive_MeanDeltaBetweenSignificantContactEvents");
  v3[57] = CFSTR("Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded");
  v4[56] = CFSTR("Proactive_MeanDeltaBetweenSignificantContactEvents_Bucketed");
  v4[57] = CFSTR("Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed");
  v3[58] = CFSTR("Proactive_MinDeltaBetweenSignificantContactEvents");
  v3[59] = CFSTR("Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded");
  v4[58] = CFSTR("Proactive_MinDeltaBetweenSignificantContactEvents_Bucketed");
  v4[59] = CFSTR("Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed");
  v3[60] = CFSTR("Proactive_MaxDeltaBetweenSignificantContactEvents");
  v3[61] = CFSTR("Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded");
  v4[60] = CFSTR("Proactive_MaxDeltaBetweenSignificantContactEvents_Bucketed");
  v4[61] = CFSTR("Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed");
  v3[62] = CFSTR("Proactive_SDDeltaBetweenSignificantContactEvents");
  v3[63] = CFSTR("Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded");
  v4[62] = CFSTR("Proactive_SDDeltaBetweenSignificantContactEvents_Bucketed");
  v4[63] = CFSTR("Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed");
  v3[64] = CFSTR("Proactive_MeanDeltaBetweenStructuredEvents");
  v4[64] = CFSTR("Proactive_MeanDeltaBetweenStructuredEvents_Bucketed");
  v3[65] = CFSTR("Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded");
  v4[65] = CFSTR("Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed");
  v3[66] = CFSTR("Proactive_MinDeltaBetweenStructuredEvents");
  v4[66] = CFSTR("Proactive_MinDeltaBetweenStructuredEvents_Bucketed");
  v3[67] = CFSTR("Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded");
  v4[67] = CFSTR("Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed");
  v3[68] = CFSTR("Proactive_MaxDeltaBetweenStructuredEvents");
  v4[68] = CFSTR("Proactive_MaxDeltaBetweenStructuredEvents_Bucketed");
  v3[69] = CFSTR("Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded");
  v4[69] = CFSTR("Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed");
  v3[70] = CFSTR("Proactive_SDDeltaBetweenStructuredEvents");
  v4[70] = CFSTR("Proactive_SDDeltaBetweenStructuredEvents_Bucketed");
  v3[71] = CFSTR("Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded");
  v4[71] = CFSTR("Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed");
  v3[72] = CFSTR("Proactive_MeanDeltaBetweenLeisureMediaEvents");
  v4[72] = CFSTR("Proactive_MeanDeltaBetweenLeisureMediaEvents_Bucketed");
  v3[73] = CFSTR("Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded");
  v4[73] = CFSTR("Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed");
  v3[74] = CFSTR("Proactive_MinDeltaBetweenLeisureMediaEvents");
  v4[74] = CFSTR("Proactive_MinDeltaBetweenLeisureMediaEvents_Bucketed");
  v3[75] = CFSTR("Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded");
  v4[75] = CFSTR("Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed");
  v3[76] = CFSTR("Proactive_MaxDeltaBetweenLeisureMediaEvents");
  v4[76] = CFSTR("Proactive_MaxDeltaBetweenLeisureMediaEvents_Bucketed");
  v3[77] = CFSTR("Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded");
  v4[77] = CFSTR("Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed");
  v3[78] = CFSTR("Proactive_SDDeltaBetweenLeisureMediaEvents");
  v4[78] = CFSTR("Proactive_SDDeltaBetweenLeisureMediaEvents_Bucketed");
  v3[79] = CFSTR("Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded");
  v4[79] = CFSTR("Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed");
  v3[80] = CFSTR("Proactive_MeanDeltaBetweenNLEvents");
  v4[80] = CFSTR("Proactive_MeanDeltaBetweenNLEvents_Bucketed");
  v3[81] = CFSTR("Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded");
  v4[81] = CFSTR("Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded_Bucketed");
  v3[82] = CFSTR("Proactive_MinDeltaBetweenNLEvents");
  v4[82] = CFSTR("Proactive_MinDeltaBetweenNLEvents_Bucketed");
  v3[83] = CFSTR("Proactive_MinDeltaBetweenNLEventsBoundariesIncluded");
  v4[83] = CFSTR("Proactive_MinDeltaBetweenNLEventsBoundariesIncluded_Bucketed");
  v3[84] = CFSTR("Proactive_MaxDeltaBetweenNLEvents");
  v4[84] = CFSTR("Proactive_MaxDeltaBetweenNLEvents_Bucketed");
  v3[85] = CFSTR("Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded");
  v4[85] = CFSTR("Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded_Bucketed");
  v3[86] = CFSTR("Proactive_SDDeltaBetweenNLEvents");
  v4[86] = CFSTR("Proactive_SDDeltaBetweenNLEvents_Bucketed");
  v3[87] = CFSTR("Proactive_SDDeltaBetweenNLEventsBoundariesIncluded");
  v4[87] = CFSTR("Proactive_SDDeltaBetweenNLEventsBoundariesIncluded_Bucketed");
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 88));
}

- (void)setDerivedMetrics
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  void *j;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
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
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  MOPromptMetrics *v287;
  void *v288;
  void *v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  _BYTE v298[128];
  _QWORD v299[12];
  _QWORD v300[12];
  _BYTE v301[128];

  v286 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DB1F8, &off_1002DB288, &off_1002DB2A0));
  v285 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DB1F8, &off_1002DD188, &off_1002DD198));
  v3 = objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DB1F8, &off_1002DD1A8, &off_1002DD1B8));
  v289 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DB1F8, &off_1002DD1A8, &off_1002DD1C8));
  v283 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DB1F8, &off_1002DB2A0, &off_1002DD1D8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QueryTimeDuration")));
  v284 = (void *)v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v5, v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("QueryTimeDuration_Bucketed"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Age")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v9, &off_1002DCC50));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("Age_Bucketed"));

  v294 = 0u;
  v295 = 0u;
  v296 = 0u;
  v297 = 0u;
  v288 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics getTimeDeltaMetricMap](MOPromptMetrics, "getTimeDeltaMetricMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "allKeys"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v294, v301, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v295;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v295 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v294 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "objectForKey:", v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v17));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v20, v289));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v294, v301, 16);
    }
    while (v14);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Routine_nVisits")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v24, v286));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("Routine_nVisits_Bucketed"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Routine_nHomeVisits")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v28, v286));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("Routine_nHomeVisits_Bucketed"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Routine_nWorkVisits")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v32, v286));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("Routine_nWorkVisits_Bucketed"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Routine_nGymVisits")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v36, v286));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("Routine_nGymVisits_Bucketed"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Routine_nSchoolVisits")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v40, v286));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("Routine_nSchoolVisits_Bucketed"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Routine_AverageVisitsLatency")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v44, v285));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("Routine_AverageVisitsLatency_Bucketed"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("Routine_AverageVisitsRealLatency")));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v48, v285));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("Routine_AverageVisitsRealLatency_Bucketed"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Storytelling_NumMoments")));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v52, v286));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("Storytelling_NumMoments_Bucketed"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("Storytelling_NumMomentsWithEvent")));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v56, v286));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v57, CFSTR("Storytelling_NumMomentsWithEvent_Bucketed"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("Storytelling_NumMomentsWithEventAndArtist")));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v60, v286));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("Storytelling_NumMomentsWithEventAndArtist_Bucketed"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("Storytelling_NumMomentsWithFamily")));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v64, v286));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, CFSTR("Storytelling_NumMomentsWithFamily_Bucketed"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Storytelling_NumMomentsWithPeople")));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v68, v286));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, CFSTR("Storytelling_NumMomentsWithPeople_Bucketed"));

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Storytelling_AverageMomentsLatency")));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v72, v285));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, CFSTR("Storytelling_AverageMomentsLatency_Bucketed"));

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("Storytelling_AverageMomentsRealLatency")));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v76, v285));
  v287 = self;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, CFSTR("Storytelling_AverageMomentsRealLatency_Bucketed"));

  v299[0] = CFSTR("Storytelling_MomenetInferenceTag_1_1");
  v299[1] = CFSTR("Storytelling_MomenetInferenceTag_1_2");
  v300[0] = CFSTR("Storytelling_MomenetInferenceTag_1_1_Bucketed");
  v300[1] = CFSTR("Storytelling_MomenetInferenceTag_1_2_Bucketed");
  v299[2] = CFSTR("Storytelling_MomenetInferenceTag_1_3");
  v299[3] = CFSTR("Storytelling_MomenetInferenceTag_1_4");
  v300[2] = CFSTR("Storytelling_MomenetInferenceTag_1_3_Bucketed");
  v300[3] = CFSTR("Storytelling_MomenetInferenceTag_1_4_Bucketed");
  v299[4] = CFSTR("Storytelling_MomenetInferenceTag_2_1");
  v299[5] = CFSTR("Storytelling_MomenetInferenceTag_2_2");
  v300[4] = CFSTR("Storytelling_MomenetInferenceTag_2_1_Bucketed");
  v300[5] = CFSTR("Storytelling_MomenetInferenceTag_2_2_Bucketed");
  v299[6] = CFSTR("Storytelling_MomenetInferenceTag_2_3");
  v299[7] = CFSTR("Storytelling_MomenetInferenceTag_2_4");
  v300[6] = CFSTR("Storytelling_MomenetInferenceTag_2_3_Bucketed");
  v300[7] = CFSTR("Storytelling_MomenetInferenceTag_2_4_Bucketed");
  v299[8] = CFSTR("Storytelling_MomenetInferenceTag_3_1");
  v299[9] = CFSTR("Storytelling_MomenetInferenceTag_3_2");
  v300[8] = CFSTR("Storytelling_MomenetInferenceTag_3_1_Bucketed");
  v300[9] = CFSTR("Storytelling_MomenetInferenceTag_3_2_Bucketed");
  v299[10] = CFSTR("Storytelling_MomenetInferenceTag_3_3");
  v299[11] = CFSTR("Storytelling_MomenetInferenceTag_3_4");
  v300[10] = CFSTR("Storytelling_MomenetInferenceTag_3_3_Bucketed");
  v300[11] = CFSTR("Storytelling_MomenetInferenceTag_3_4_Bucketed");
  v290 = 0u;
  v291 = 0u;
  v292 = 0u;
  v293 = 0u;
  v79 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v300, v299, 12));
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v290, v298, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v291;
    do
    {
      for (j = 0; j != v81; j = (char *)j + 1)
      {
        if (*(_QWORD *)v291 != v82)
          objc_enumerationMutation(v79);
        v84 = *(_QWORD *)(*((_QWORD *)&v290 + 1) + 8 * (_QWORD)j);
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", v84));
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotoMomentTags getCoarseInferenceTag:](MOPhotoMomentTags, "getCoarseInferenceTag:", v86));

        if (v87)
        {
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", v84));
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v87, v88);

        }
      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v290, v298, 16);
    }
    while (v81);
  }
  v90 = v79;

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("Workout_NumWorkouts")));
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v92, v286));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v94, "setObject:forKeyedSubscript:", v93, CFSTR("Workout_NumWorkouts_Bucketed"));

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Workout_AverageWorkoutLatency")));
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v96, v285));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, CFSTR("Workout_AverageWorkoutLatency_Bucketed"));

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("Proactive_NumAllEvents")));
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v286));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Proactive_NumAllEvents_Bucketed"));

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("Proactive_NumMediaOnRepeatEvents")));
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v104, v286));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v106, "setObject:forKeyedSubscript:", v105, CFSTR("Proactive_NumMediaOnRepeatEvents_Bucketed"));

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("Proactive_NumTopicEvents")));
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v108, v286));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v110, "setObject:forKeyedSubscript:", v109, CFSTR("Proactive_NumTopicEvents_Bucketed"));

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("Proactive_NumTravelEvents")));
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v112, v286));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v114, "setObject:forKeyedSubscript:", v113, CFSTR("Proactive_NumTravelEvents_Bucketed"));

  v115 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("Proactive_NumSharedWithYouEvents")));
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v116, v286));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v118, "setObject:forKeyedSubscript:", v117, CFSTR("Proactive_NumSharedWithYouEvents_Bucketed"));

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("Proactive_NumSignificantContactEvents")));
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v120, v286));
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v122, "setObject:forKeyedSubscript:", v121, CFSTR("Proactive_NumSignificantContactEvents_Bucketed"));

  v123 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("Proactive_NumStructuredEvents")));
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v124, v286));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v126, "setObject:forKeyedSubscript:", v125, CFSTR("Proactive_NumStructuredEvents_Bucketed"));

  v127 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("Proactive_NumLeisureMediaEvents")));
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v128, v286));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v130, "setObject:forKeyedSubscript:", v129, CFSTR("Proactive_NumLeisureMediaEvents_Bucketed"));

  v131 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("Proactive_NumNLEvents")));
  v133 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v132, v286));
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v134, "setObject:forKeyedSubscript:", v133, CFSTR("Proactive_NumNLEvents_Bucketed"));

  v135 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "objectForKeyedSubscript:", CFSTR("Proactive_EventsAverageLatency")));
  v137 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v136, v285));
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v138, "setObject:forKeyedSubscript:", v137, CFSTR("Proactive_EventsAverageLatency_Bucketed"));

  v139 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("Proactive_MediaOnRepeatAverageLatency")));
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v140, v285));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v142, "setObject:forKeyedSubscript:", v141, CFSTR("Proactive_MediaOnRepeatAverageLatency_Bucketed"));

  v143 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("Proactive_TopicAverageLatency")));
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v144, v285));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v146, "setObject:forKeyedSubscript:", v145, CFSTR("Proactive_TopicAverageLatency_Bucketed"));

  v147 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("Proactive_TravelAverageLatency")));
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v148, v285));
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v150, "setObject:forKeyedSubscript:", v149, CFSTR("Proactive_TravelAverageLatency_Bucketed"));

  v151 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("Proactive_SharedWithYouAverageLatency")));
  v153 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v152, v285));
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v154, "setObject:forKeyedSubscript:", v153, CFSTR("Proactive_SharedWithYouAverageLatency_Bucketed"));

  v155 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("Proactive_SignificantContactAverageLatency")));
  v157 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v156, v285));
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v158, "setObject:forKeyedSubscript:", v157, CFSTR("Proactive_SignificantContactAverageLatency_Bucketed"));

  v159 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("Proactive_StructuredEventsAverageLatency")));
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v160, v285));
  v162 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v162, "setObject:forKeyedSubscript:", v161, CFSTR("Proactive_StructuredEventsAverageLatency_Bucketed"));

  v163 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("Proactive_LeisureMediaEventsAverageLatency")));
  v165 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v164, v285));
  v166 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v166, "setObject:forKeyedSubscript:", v165, CFSTR("Proactive_LeisureMediaEventsAverageLatency_Bucketed"));

  v167 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "objectForKeyedSubscript:", CFSTR("Proactive_NLEventsAverageLatency")));
  v169 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v168, v285));
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v170, "setObject:forKeyedSubscript:", v169, CFSTR("Proactive_NLEventsAverageLatency_Bucketed"));

  v171 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "objectForKeyedSubscript:", CFSTR("Storytelling_PercentageOfMomentEventsNoLOI")));
  v173 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v172, v283));
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v174, "setObject:forKeyedSubscript:", v173, CFSTR("Storytelling_PercentageOfMomentEventsNoLOI_Bucketed"));

  v175 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("Workout_PercentageOfWorkoutEventsNoLOI")));
  v177 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v176, v283));
  v178 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v177, CFSTR("Workout_PercentageOfWorkoutEventsNoLOI_Bucketed"));

  v179 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfMediaOnRepeatEventsNoLOI")));
  v181 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v180, v283));
  v182 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v182, "setObject:forKeyedSubscript:", v181, CFSTR("Proactive_PercentageOfMediaOnRepeatEventsNoLOI_Bucketed"));

  v183 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfTopicEventsNoLOI")));
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v184, v283));
  v186 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v186, "setObject:forKeyedSubscript:", v185, CFSTR("Proactive_PercentageOfTopicEventsNoLOI_Bucketed"));

  v187 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfTravelEventsNoLOI")));
  v189 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v188, v283));
  v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v190, "setObject:forKeyedSubscript:", v189, CFSTR("Proactive_PercentageOfTravelEventsNoLOI_Bucketed"));

  v191 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfSharedWithYouEventsNoLOI")));
  v193 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v192, v283));
  v194 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v194, "setObject:forKeyedSubscript:", v193, CFSTR("Proactive_PercentageOfSharedWithYouEventsNoLOI_Bucketed"));

  v195 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfSignificantContactEventsNoLOI")));
  v197 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v196, v283));
  v198 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v198, "setObject:forKeyedSubscript:", v197, CFSTR("Proactive_PercentageOfSignificantContactEventsNoLOI_Bucketed"));

  v199 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfStructuredEventsNoLOI")));
  v201 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v200, v283));
  v202 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v202, "setObject:forKeyedSubscript:", v201, CFSTR("Proactive_PercentageOfStructuredEventsNoLOI_Bucketed"));

  v203 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfLeisureMediaEventsNoLOI")));
  v205 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v204, v283));
  v206 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v206, "setObject:forKeyedSubscript:", v205, CFSTR("Proactive_PercentageOfLeisureMediaEventsNoLOI_Bucketed"));

  v207 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "objectForKeyedSubscript:", CFSTR("Proactive_PercentageOfNLEventsNoLOI")));
  v209 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v208, v283));
  v210 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v210, "setObject:forKeyedSubscript:", v209, CFSTR("Proactive_PercentageOfNLEventsNoLOI_Bucketed"));

  v211 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("numPreBundles")));
  v213 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v212, v286));
  v214 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v214, "setObject:forKeyedSubscript:", v213, CFSTR("numPreBundles_Bucketed"));

  v215 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0")));
  v217 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v216, v286));
  v218 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v218, "setObject:forKeyedSubscript:", v217, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0_Bucketed"));

  v219 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1")));
  v221 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v220, v286));
  v222 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v222, "setObject:forKeyedSubscript:", v221, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1_Bucketed"));

  v223 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0")));
  v225 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v224, v286));
  v226 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v226, "setObject:forKeyedSubscript:", v225, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0_Bucketed"));

  v227 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1")));
  v229 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v228, v286));
  v230 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v230, "setObject:forKeyedSubscript:", v229, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1_Bucketed"));

  v231 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0")));
  v233 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v232, v286));
  v234 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v234, "setObject:forKeyedSubscript:", v233, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0_Bucketed"));

  v235 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1")));
  v237 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v236, v286));
  v238 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v238, "setObject:forKeyedSubscript:", v237, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1_Bucketed"));

  v239 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v240 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0")));
  v241 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v240, v286));
  v242 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v242, "setObject:forKeyedSubscript:", v241, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0_Bucketed"));

  v243 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1")));
  v245 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v244, v286));
  v246 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v246, "setObject:forKeyedSubscript:", v245, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1_Bucketed"));

  v247 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v247, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0")));
  v249 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v248, v286));
  v250 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v250, "setObject:forKeyedSubscript:", v249, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0_Bucketed"));

  v251 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1")));
  v253 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v252, v286));
  v254 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v254, "setObject:forKeyedSubscript:", v253, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1_Bucketed"));

  v255 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0")));
  v257 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v256, v286));
  v258 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v258, "setObject:forKeyedSubscript:", v257, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0_Bucketed"));

  v259 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v259, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1")));
  v261 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v260, v286));
  v262 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v262, "setObject:forKeyedSubscript:", v261, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1_Bucketed"));

  v263 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v264 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0")));
  v265 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v264, v286));
  v266 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v266, "setObject:forKeyedSubscript:", v265, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0_Bucketed"));

  v267 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1")));
  v269 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v268, v286));
  v270 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v270, "setObject:forKeyedSubscript:", v269, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1_Bucketed"));

  v271 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0")));
  v273 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v272, v286));
  v274 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v274, "setObject:forKeyedSubscript:", v273, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0_Bucketed"));

  v275 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "objectForKeyedSubscript:", CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1")));
  v277 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v276, v286));
  v278 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v278, "setObject:forKeyedSubscript:", v277, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1_Bucketed"));

  v279 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("numBundles")));
  v281 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v280, v286));
  v282 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v287, "metrics"));
  objc_msgSend(v282, "setObject:forKeyedSubscript:", v281, CFSTR("numBundles_Bucketed"));

}

- (id)calculateZeroCountsForEvents:(id)a3 withCalendar:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  MOPromptMetrics *v32;
  NSMutableSet *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v8, "setDay:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startOfDayForDate:", self->_startDate));
  v33 = objc_opt_new(NSMutableSet);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "earlierDate:", self->_endDate));

  if (v10 == v9)
  {
    v13 = 0;
    LODWORD(v11) = 0;
    v14 = v9;
    v30 = v8;
    v31 = v7;
    v29 = v9;
    v32 = self;
    do
    {
      v35 = (uint64_t)objc_msgSend(v8, "day", v29, v30, v31) / 7 + 1;
      objc_msgSend(v8, "setDay:", (char *)objc_msgSend(v8, "day") + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v8, v9, 0));
      v36 = v13;
      if ((unint64_t)objc_msgSend(v6, "count") > (int)v13)
      {
        v34 = v11;
        v15 = 0;
        v16 = (int)v13;
        while (1)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v16 + v15));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "endDate"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "earlierDate:", v12));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v16 + v15));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "endDate"));

          if (v19 != v21)
            break;
          ++v15;
          if ((unint64_t)objc_msgSend(v6, "count") <= v16 + v15)
          {
            v36 = (v36 + v15);
            v8 = v30;
            v7 = v31;
            v9 = v29;
            self = v32;
            v11 = v34;
LABEL_11:
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v35));
            -[NSMutableSet addObject:](v33, "addObject:", v22);

            goto LABEL_14;
          }
        }
        self = v32;
        v11 = v34;
        if ((_DWORD)v15)
        {
          v36 = v15 + v36;
          v8 = v30;
          v7 = v31;
          v9 = v29;
          goto LABEL_11;
        }
        v36 = v15 + v36;
        v8 = v30;
        v7 = v31;
        v9 = v29;
      }
      v11 = (v11 + 1);
LABEL_14:

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "earlierDate:", self->_endDate));
      v14 = v12;
      v24 = v23 == v12;
      v13 = v36;
    }
    while (v24);
  }
  else
  {
    v11 = 0;
    v35 = 0;
    v12 = v9;
  }
  v37[0] = CFSTR("CountOfZeroEventDays");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
  v37[1] = CFSTR("CountOfZeroEventWeeks");
  v38[0] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v35 - (_QWORD)-[NSMutableSet count](v33, "count")));
  v38[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));

  return v27;
}

- (BOOL)doesInterval:(id)a3 overlapWithAnyIntervalFromArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "intersectionWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
        objc_msgSend(v11, "timeIntervalSinceDate:", v12);
        v14 = v13;

        if (v14 > 0.0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)calculateAndSetMetricsForRawEvents:(id)a3
{
  id v4;
  NSDate *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v33;
  _UNKNOWN **v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  _UNKNOWN **v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _UNKNOWN **v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  _UNKNOWN **v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _UNKNOWN **v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  _UNKNOWN **v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  _UNKNOWN **v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _UNKNOWN **v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  _UNKNOWN **v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  _UNKNOWN **v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  _UNKNOWN **v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
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
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  NSMutableArray *v192;
  void *v193;
  NSDate *endDate;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  id v223;
  void *i;
  void *v225;
  id v226;
  void *v227;
  void *v228;
  id v229;
  void *v230;
  void *v231;
  id v232;
  id v233;
  id v234;
  char v235;
  char v236;
  uint64_t v237;
  void *j;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  id v244;
  id v245;
  id v246;
  char v247;
  char v248;
  uint64_t v249;
  void *k;
  void *v251;
  void *v252;
  void *v253;
  int v254;
  void *v255;
  _UNKNOWN **v256;
  void *v257;
  MOPromptMetrics *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void **p_cache;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  void *v272;
  uint64_t v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  double v278;
  double v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  const __CFString *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  double v316;
  double v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  double v322;
  double v323;
  void *v324;
  void *v325;
  void *v326;
  int v327;
  int v328;
  uint64_t v329;
  int v330;
  void *v331;
  void *v332;
  id v333;
  id v334;
  id v335;
  uint64_t v336;
  void *m;
  uint64_t v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  uint64_t v343;
  const __CFString *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  id v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  NSMutableArray *v362;
  void *v363;
  NSDate *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  uint64_t v389;
  void *v390;
  void *v391;
  void *v392;
  unint64_t v393;
  uint64_t v394;
  int v395;
  void *v396;
  id v397;
  void *v398;
  void *v399;
  id v400;
  unsigned int v401;
  uint64_t v402;
  void *v403;
  uint64_t v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  uint64_t v414;
  void *v415;
  void *v416;
  double v417;
  double v418;
  void *v419;
  void *v420;
  id v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  _UNKNOWN **v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  _UNKNOWN **v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  _UNKNOWN **v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  _UNKNOWN **v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  _UNKNOWN **v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  _UNKNOWN **v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  _UNKNOWN **v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  _UNKNOWN **v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  _UNKNOWN **v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  _UNKNOWN **v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  MOPromptMetrics *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  id v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  NSMutableArray *v533;
  void *v534;
  NSDate *v535;
  void *v536;
  void *v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  uint64_t v558;
  void *v559;
  void *v560;
  void *v561;
  NSMutableArray *v562;
  id v563;
  id v564;
  id v565;
  uint64_t v566;
  void *n;
  void *v568;
  uint64_t v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  double v574;
  double v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  uint64_t v584;
  void *v585;
  void *v586;
  void *v587;
  unint64_t v588;
  int v589;
  void *v590;
  id v591;
  void *v592;
  void *v593;
  id v594;
  unsigned int v595;
  uint64_t v596;
  void *v597;
  uint64_t v598;
  void *v599;
  void *v600;
  void *v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  double v610;
  double v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  void *v620;
  int v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  void *v649;
  void *v650;
  void *v651;
  void *v652;
  void *v653;
  id v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  NSMutableArray *v659;
  void *v660;
  NSDate *v661;
  void *v662;
  void *v663;
  void *v664;
  void *v665;
  void *v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  void *v671;
  void *v672;
  void *v673;
  void *v674;
  void *v675;
  void *v676;
  void *v677;
  void *v678;
  void *v679;
  void *v680;
  void *v681;
  void *v682;
  void *v683;
  void *v684;
  void *v685;
  uint64_t v686;
  void *v687;
  void *v688;
  void *v689;
  uint64_t v690;
  int v691;
  void *v692;
  id v693;
  void *v694;
  void *v695;
  id v696;
  unsigned int v697;
  uint64_t v698;
  void *v699;
  uint64_t v700;
  void *v701;
  void *v702;
  void *v703;
  void *v704;
  void *v705;
  void *v706;
  void *v707;
  void *v708;
  void *v709;
  void *v710;
  void *v711;
  double v712;
  double v713;
  void *v714;
  void *v715;
  void *v716;
  void *v717;
  void *v718;
  void *v719;
  void *v720;
  void *v721;
  void *v722;
  int v723;
  void *v724;
  void *v725;
  void *v726;
  void *v727;
  void *v728;
  void *v729;
  void *v730;
  void *v731;
  void *v732;
  void *v733;
  void *v734;
  void *v735;
  void *v736;
  void *v737;
  void *v738;
  void *v739;
  void *v740;
  void *v741;
  void *v742;
  void *v743;
  void *v744;
  void *v745;
  void *v746;
  void *v747;
  void *v748;
  void *v749;
  void *v750;
  void *v751;
  void *v752;
  void *v753;
  void *v754;
  void *v755;
  id v756;
  void *v757;
  void *v758;
  void *v759;
  void *v760;
  NSMutableArray *v761;
  void *v762;
  NSDate *v763;
  void *v764;
  void *v765;
  void *v766;
  void *v767;
  void *v768;
  void *v769;
  void *v770;
  void *v771;
  void *v772;
  void *v773;
  void *v774;
  void *v775;
  void *v776;
  void *v777;
  void *v778;
  void *v779;
  void *v780;
  void *v781;
  void *v782;
  void *v783;
  void *v784;
  void *v785;
  void *v786;
  void *v787;
  uint64_t v788;
  void *v789;
  void *v790;
  void *v791;
  uint64_t v792;
  int v793;
  void *v794;
  id v795;
  void *v796;
  void *v797;
  id v798;
  unsigned int v799;
  uint64_t v800;
  void *v801;
  uint64_t v802;
  void *v803;
  void *v804;
  void *v805;
  void *v806;
  void *v807;
  void *v808;
  void *v809;
  void *v810;
  void *v811;
  void *v812;
  void *v813;
  double v814;
  double v815;
  void *v816;
  void *v817;
  void *v818;
  void *v819;
  void *v820;
  void *v821;
  void *v822;
  void *v823;
  void *v824;
  int v825;
  void *v826;
  void *v827;
  void *v828;
  void *v829;
  void *v830;
  void *v831;
  void *v832;
  void *v833;
  void *v834;
  void *v835;
  void *v836;
  void *v837;
  void *v838;
  void *v839;
  void *v840;
  void *v841;
  void *v842;
  void *v843;
  void *v844;
  void *v845;
  void *v846;
  void *v847;
  void *v848;
  void *v849;
  void *v850;
  void *v851;
  void *v852;
  void *v853;
  void *v854;
  void *v855;
  void *v856;
  void *v857;
  id v858;
  void *v859;
  void *v860;
  void *v861;
  void *v862;
  NSMutableArray *v863;
  void *v864;
  NSDate *v865;
  void *v866;
  void *v867;
  void *v868;
  void *v869;
  void *v870;
  void *v871;
  void *v872;
  void *v873;
  void *v874;
  void *v875;
  void *v876;
  void *v877;
  void *v878;
  void *v879;
  void *v880;
  void *v881;
  void *v882;
  void *v883;
  void *v884;
  void *v885;
  void *v886;
  void *v887;
  void *v888;
  void *v889;
  uint64_t v890;
  void *v891;
  void *v892;
  void *v893;
  uint64_t v894;
  int v895;
  void *v896;
  id v897;
  void *v898;
  void *v899;
  id v900;
  unsigned int v901;
  uint64_t v902;
  void *v903;
  uint64_t v904;
  void *v905;
  void *v906;
  void *v907;
  void *v908;
  void *v909;
  void *v910;
  void *v911;
  void *v912;
  void *v913;
  void *v914;
  void *v915;
  double v916;
  double v917;
  void *v918;
  void *v919;
  void *v920;
  void *v921;
  void *v922;
  void *v923;
  void *v924;
  void *v925;
  void *v926;
  int v927;
  void *v928;
  void *v929;
  void *v930;
  void *v931;
  void *v932;
  void *v933;
  void *v934;
  void *v935;
  void *v936;
  void *v937;
  void *v938;
  void *v939;
  void *v940;
  void *v941;
  void *v942;
  void *v943;
  void *v944;
  void *v945;
  void *v946;
  void *v947;
  void *v948;
  void *v949;
  void *v950;
  void *v951;
  void *v952;
  void *v953;
  void *v954;
  void *v955;
  void *v956;
  void *v957;
  void *v958;
  void *v959;
  id v960;
  void *v961;
  void *v962;
  void *v963;
  void *v964;
  NSMutableArray *v965;
  void *v966;
  NSDate *v967;
  void *v968;
  void *v969;
  void *v970;
  void *v971;
  void *v972;
  void *v973;
  void *v974;
  void *v975;
  void *v976;
  void *v977;
  void *v978;
  void *v979;
  void *v980;
  void *v981;
  void *v982;
  void *v983;
  void *v984;
  void *v985;
  void *v986;
  void *v987;
  void *v988;
  void *v989;
  void *v990;
  void *v991;
  uint64_t v992;
  void *v993;
  void *v994;
  void *v995;
  uint64_t v996;
  int v997;
  void *v998;
  id v999;
  void *v1000;
  void *v1001;
  id v1002;
  unsigned int v1003;
  uint64_t v1004;
  void *v1005;
  uint64_t v1006;
  void *v1007;
  void *v1008;
  void *v1009;
  void *v1010;
  void *v1011;
  void *v1012;
  void *v1013;
  void *v1014;
  void *v1015;
  void *v1016;
  double v1017;
  double v1018;
  void *v1019;
  void *v1020;
  void *v1021;
  void *v1022;
  void *v1023;
  void *v1024;
  void *v1025;
  void *v1026;
  int v1027;
  void *v1028;
  void *v1029;
  void *v1030;
  void *v1031;
  void *v1032;
  void *v1033;
  void *v1034;
  void *v1035;
  void *v1036;
  void *v1037;
  void *v1038;
  void *v1039;
  void *v1040;
  void *v1041;
  void *v1042;
  void *v1043;
  void *v1044;
  void *v1045;
  void *v1046;
  void *v1047;
  void *v1048;
  void *v1049;
  void *v1050;
  void *v1051;
  void *v1052;
  void *v1053;
  void *v1054;
  void *v1055;
  void *v1056;
  void *v1057;
  void *v1058;
  NSMutableArray *v1059;
  NSDate *v1060;
  void *v1061;
  void *v1062;
  void *v1063;
  void *v1064;
  void *v1065;
  void *v1066;
  void *v1067;
  void *v1068;
  void *v1069;
  void *v1070;
  void *v1071;
  void *v1072;
  void *v1073;
  void *v1074;
  void *v1075;
  void *v1076;
  void *v1077;
  void *v1078;
  void *v1079;
  void *v1080;
  void *v1081;
  void *v1082;
  uint64_t v1083;
  void *v1084;
  void *v1085;
  void *v1086;
  void *v1087;
  uint64_t v1088;
  int v1089;
  void *v1090;
  id v1091;
  void *v1092;
  void *v1093;
  id v1094;
  unsigned int v1095;
  uint64_t v1096;
  void *v1097;
  uint64_t v1098;
  void *v1099;
  void *v1100;
  void *v1101;
  void *v1102;
  void *v1103;
  void *v1104;
  void *v1105;
  void *v1106;
  void *v1107;
  void *v1108;
  double v1109;
  double v1110;
  void *v1111;
  void *v1112;
  void *v1113;
  void *v1114;
  void *v1115;
  void *v1116;
  void *v1117;
  void *v1118;
  int v1119;
  void *v1120;
  void *v1121;
  void *v1122;
  void *v1123;
  void *v1124;
  void *v1125;
  void *v1126;
  void *v1127;
  void *v1128;
  void *v1129;
  void *v1130;
  void *v1131;
  void *v1132;
  void *v1133;
  void *v1134;
  void *v1135;
  MOPromptMetrics *v1136;
  _UNKNOWN **v1137;
  void *v1138;
  void *v1139;
  void *v1140;
  void *v1141;
  void *v1142;
  void *v1143;
  void *v1144;
  void *v1145;
  void *v1146;
  void *v1147;
  void *v1148;
  void *v1149;
  void *v1150;
  void *v1151;
  void *v1152;
  NSMutableArray *v1153;
  NSDate *v1154;
  void *v1155;
  void *v1156;
  void *v1157;
  void *v1158;
  void *v1159;
  void *v1160;
  void *v1161;
  void *v1162;
  void *v1163;
  void *v1164;
  void *v1165;
  void *v1166;
  void *v1167;
  void *v1168;
  void *v1169;
  void *v1170;
  void *v1171;
  void *v1172;
  void *v1173;
  void *v1174;
  void *v1175;
  void *v1176;
  uint64_t v1177;
  void *v1178;
  void *v1179;
  void *v1180;
  uint64_t v1181;
  int v1182;
  void *v1183;
  id v1184;
  void *v1185;
  void *v1186;
  id v1187;
  unsigned int v1188;
  uint64_t v1189;
  void *v1190;
  uint64_t v1191;
  void *v1192;
  void *v1193;
  void *v1194;
  void *v1195;
  void *v1196;
  void *v1197;
  void *v1198;
  void *v1199;
  void *v1200;
  void *v1201;
  double v1202;
  double v1203;
  void *v1204;
  void *v1205;
  void *v1206;
  void *v1207;
  void *v1208;
  void *v1209;
  void *v1210;
  void *v1211;
  int v1212;
  void *v1213;
  void *v1214;
  void *v1215;
  void *v1216;
  void *v1217;
  void *v1218;
  void *v1219;
  void *v1220;
  void *v1221;
  void *v1222;
  void *v1223;
  void *v1224;
  void *v1225;
  void *v1226;
  void *v1227;
  void *v1228;
  double v1229;
  void *v1230;
  void *v1231;
  void *v1232;
  void *v1233;
  void *v1234;
  void *v1235;
  void *v1236;
  void *v1237;
  void *v1238;
  void *v1239;
  void *v1240;
  void *v1241;
  id v1242;
  void *v1243;
  void *v1244;
  void *v1245;
  void *v1246;
  NSMutableArray *v1247;
  void *v1248;
  NSDate *v1249;
  void *v1250;
  void *v1251;
  void *v1252;
  void *v1253;
  void *v1254;
  void *v1255;
  void *v1256;
  void *v1257;
  void *v1258;
  void *v1259;
  void *v1260;
  void *v1261;
  void *v1262;
  void *v1263;
  void *v1264;
  void *v1265;
  void *v1266;
  void *v1267;
  void *v1268;
  void *v1269;
  void *v1270;
  void *v1271;
  void *v1272;
  void *v1273;
  void *v1274;
  void *v1275;
  void *v1276;
  void *v1277;
  uint64_t v1278;
  int v1279;
  int v1280;
  void *v1281;
  void *v1282;
  id v1283;
  void *v1284;
  void *v1285;
  id v1286;
  unsigned int v1287;
  uint64_t v1288;
  void *v1289;
  uint64_t v1290;
  void *v1291;
  void *v1292;
  void *v1293;
  void *v1294;
  void *v1295;
  void *v1296;
  void *v1297;
  void *v1298;
  void *v1299;
  void *v1300;
  void *v1301;
  double v1302;
  double v1303;
  void *v1304;
  void *v1305;
  void *v1306;
  void *v1307;
  void *v1308;
  void *v1309;
  void *v1310;
  void *v1311;
  void *v1312;
  void *v1313;
  void *v1314;
  void *v1315;
  void *v1316;
  void *v1317;
  void *v1318;
  void *v1319;
  void *v1320;
  void *v1321;
  void *v1322;
  void *v1323;
  void *v1324;
  void *v1325;
  void *v1326;
  void *v1327;
  void *v1328;
  void *v1329;
  void *v1330;
  void *v1331;
  void *v1332;
  double v1333;
  void *v1334;
  void *v1335;
  void *v1336;
  void *v1337;
  void *v1338;
  void *v1339;
  void *v1340;
  void *v1341;
  void *v1342;
  void *v1343;
  void *v1344;
  void *v1345;
  id v1346;
  void *v1347;
  void *v1348;
  void *v1349;
  void *v1350;
  NSMutableArray *v1351;
  void *v1352;
  NSDate *v1353;
  void *v1354;
  void *v1355;
  void *v1356;
  void *v1357;
  void *v1358;
  void *v1359;
  void *v1360;
  void *v1361;
  void *v1362;
  void *v1363;
  void *v1364;
  void *v1365;
  void *v1366;
  void *v1367;
  void *v1368;
  void *v1369;
  void *v1370;
  void *v1371;
  void *v1372;
  void *v1373;
  void *v1374;
  void *v1375;
  void *v1376;
  void *v1377;
  void *v1378;
  void *v1379;
  void *v1380;
  void *v1381;
  void *v1382;
  void *v1383;
  void *v1384;
  void *v1385;
  void *v1386;
  void *v1387;
  void *v1388;
  void *v1389;
  void *v1390;
  void *v1391;
  NSMutableArray *v1392;
  void *v1393;
  void *v1394;
  NSMutableArray *v1395;
  void *v1396;
  void *v1397;
  void *v1398;
  NSMutableArray *v1399;
  NSMutableArray *v1400;
  void *v1401;
  void *v1402;
  id v1403;
  NSDate *v1404;
  NSMutableArray *v1405;
  void *v1406;
  unsigned int v1407;
  NSMutableArray *v1408;
  unsigned int v1409;
  void *v1410;
  void *v1411;
  unsigned int v1412;
  id v1413;
  id v1414;
  unsigned int v1415;
  void *v1416;
  id obj;
  unsigned int v1418;
  uint64_t v1419;
  uint64_t v1420;
  unsigned int v1421;
  unsigned int v1422;
  unsigned int v1423;
  unsigned int v1424;
  unsigned int v1425;
  unsigned int v1426;
  unsigned int v1427;
  void *v1428;
  unsigned int v1429;
  id v1430;
  id v1431;
  int v1432;
  int v1433;
  int v1434;
  int v1435;
  int v1436;
  int v1437;
  int v1438;
  unsigned int v1439;
  NSMutableArray *v1440;
  unsigned int v1441;
  unsigned int v1442;
  uint64_t v1443;
  void *v1444;
  unsigned int v1445;
  id v1446;
  uint64_t v1447;
  void *v1448;
  void *v1449;
  int v1450;
  uint64_t v1451;
  NSMutableArray *v1452;
  MOPromptMetrics *v1453;
  __int128 v1454;
  __int128 v1455;
  __int128 v1456;
  __int128 v1457;
  __int128 v1458;
  __int128 v1459;
  __int128 v1460;
  __int128 v1461;
  __int128 v1462;
  __int128 v1463;
  __int128 v1464;
  __int128 v1465;
  __int128 v1466;
  __int128 v1467;
  __int128 v1468;
  __int128 v1469;
  __int128 v1470;
  __int128 v1471;
  __int128 v1472;
  __int128 v1473;
  __int128 v1474;
  __int128 v1475;
  __int128 v1476;
  __int128 v1477;
  _QWORD v1478[2];
  _QWORD v1479[2];
  _QWORD v1480[2];
  _QWORD v1481[2];
  _QWORD v1482[2];
  _QWORD v1483[2];
  _QWORD v1484[2];
  _QWORD v1485[2];
  _BYTE v1486[128];
  void *v1487;
  _QWORD v1488[2];
  _BYTE v1489[128];
  _BYTE v1490[128];
  _BYTE v1491[128];
  _BYTE v1492[128];
  _BYTE v1493[128];
  _QWORD v1494[2];
  _QWORD v1495[2];
  _QWORD v1496[2];
  void *v1497;

  v4 = a3;
  v5 = self->_endDate;
  v1391 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v1404 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1391, "components:fromDate:", 736, v5));
  v7 = objc_msgSend(v6, "weekday");
  v8 = objc_msgSend(v6, "hour");
  v9 = objc_msgSend(v6, "minute");
  v1389 = v6;
  v10 = (uint64_t)((double)(uint64_t)v9 * 60.0 + (double)(uint64_t)v8 * 3600.0 + (double)(uint64_t)objc_msgSend(v6, "second"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("DayIDSubmission"));

  v13 = objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DB1F8, &off_1002DD1E8, &off_1002DD1F8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v10));
  v1388 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v14, v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("HourIDSubmission"));

  -[NSDate timeIntervalSinceDate:](self->_endDate, "timeIntervalSinceDate:", self->_startDate);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v1406 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DB1F8, v17, &off_1002DD1F8));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundler propertyNameDictionary](MOEventBundler, "propertyNameDictionary"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate >= %@ && endDate <= %@"), self->_startDate, self->_endDate));
  v1390 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v19));
  v1403 = objc_msgSend(v20, "mutableCopy");

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1));
  v1497 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v1497, 1));
  objc_msgSend(v1403, "sortUsingDescriptors:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOPromptMetrics calculateZeroCountsForEvents:withCalendar:](self, "calculateZeroCountsForEvents:withCalendar:", v1403, v1391));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("CountOfZeroEventDays")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("ZeroEventDayCountAcrossAllEvents"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("CountOfZeroEventWeeks")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("ZeroEventWeekCountAcrossAllEvents"));

  v1402 = v18;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %i"), v28, 4));
  v1496[0] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %i"), v30, 5));
  v1496[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1496, 2));
  v33 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v32));

  v34 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v1387 = (void *)v33;
  v1385 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v33));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOPromptMetrics calculateZeroCountsForEvents:withCalendar:](self, "calculateZeroCountsForEvents:withCalendar:"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("CountOfZeroEventDays")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, CFSTR("ZeroEventDayCount"));

  v1386 = v35;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("CountOfZeroEventWeeks")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("ZeroEventWeekCount"));

  v1405 = objc_opt_new(NSMutableArray);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v40, 4));
  v1495[0] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v42, 1));
  v1495[1] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1495, 2));
  v45 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v44));

  v1384 = (void *)v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v45));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v46, "count")));
  v1453 = self;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("Routine_nVisits"));

  v1440 = objc_opt_new(NSMutableArray);
  v49 = objc_opt_new(NSMutableArray);
  v1400 = objc_opt_new(NSMutableArray);
  v1392 = v49;
  v1393 = v46;
  if (objc_msgSend(v46, "count"))
  {
    v50 = 0;
    v1445 = 0;
    v51 = 0;
    v1429 = 0;
    v1418 = 0;
    v52 = 0;
    while (1)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", v50));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "placeName"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "lowercaseString"));

      v1449 = v55;
      if (objc_msgSend(v55, "containsString:", CFSTR("home")))
      {
        ++v1445;
      }
      else if (objc_msgSend(v55, "containsString:", CFSTR("work")))
      {
        v51 = (v51 + 1);
      }
      else if (objc_msgSend(v55, "containsString:", CFSTR("gym")))
      {
        ++v1429;
      }
      else if (objc_msgSend(v55, "containsString:", CFSTR("school")))
      {
        ++v1418;
      }
      else if (objc_msgSend(v53, "placeDiscovery") != (id)2)
      {
        goto LABEL_15;
      }
      v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
      if (v56)
      {
        v57 = (void *)v56;
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));

        if (v58)
        {
          v59 = objc_alloc((Class)NSDateInterval);
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
          v62 = objc_msgSend(v59, "initWithStartDate:endDate:", v60, v61);

          v55 = v1449;
          -[NSMutableArray addObject:](v1440, "addObject:", v62);

        }
      }
LABEL_15:
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));

      if (v63)
      {
        if (v50)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", (v50 - 1)));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "endDate"));

          if (v65)
          {
            v66 = v34[317];
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", v50 - 1));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "endDate"));
            objc_msgSend(v67, "timeIntervalSinceDate:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "numberWithDouble:"));
            -[NSMutableArray addObject:](v1405, "addObject:", v70);

            v34 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
          }
        }
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "creationDate"));

        if (v71)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "creationDate"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
          objc_msgSend(v72, "timeIntervalSinceDate:", v73);
          v75 = v74;

          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithDouble:", v75));
          -[NSMutableArray addObject:](v49, "addObject:", v76);

        }
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "sourceCreationDate"));

        v55 = v1449;
        if (v77)
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "sourceCreationDate"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
          objc_msgSend(v78, "timeIntervalSinceDate:", v79);
          v81 = v80;

          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithDouble:", v81));
          -[NSMutableArray addObject:](v1400, "addObject:", v82);

        }
      }
      v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "creationDate"));
      if (!v83)
        goto LABEL_34;
      v84 = (void *)v83;
      v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
      if (v85)
      {
        v86 = (void *)v85;
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));

        if (!v87)
        {
LABEL_33:
          v55 = v1449;
          goto LABEL_34;
        }
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "creationDate"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
        objc_msgSend(v88, "timeIntervalSinceDate:", v89);
        v91 = v90;

        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithDouble:", v91));
        -[NSMutableArray addObject:](v49, "addObject:", v92);

        v1441 = v51;
        if (v52)
        {
          switch(v52)
          {
            case 1:
              v93 = v34[317];
              v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v94);
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "numberWithDouble:"));
              v96 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v95, v1406));
              v97 = v34;
              v98 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v98, "setObject:forKeyedSubscript:", v96, CFSTR("Routine_HourIDVisit_Start_2"));

              v99 = v97[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_2"));
              v52 = 2;
              goto LABEL_30;
            case 2:
              v110 = v34[317];
              v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v111);
              v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "numberWithDouble:"));
              v113 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v112, v1406));
              v114 = v34;
              v115 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v115, "setObject:forKeyedSubscript:", v113, CFSTR("Routine_HourIDVisit_Start_3"));

              v116 = v114[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_3"));
              v52 = 3;
              goto LABEL_30;
            case 3:
              v117 = v34[317];
              v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v118);
              v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "numberWithDouble:"));
              v120 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v119, v1406));
              v121 = v34;
              v122 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v122, "setObject:forKeyedSubscript:", v120, CFSTR("Routine_HourIDVisit_Start_4"));

              v123 = v121[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_4"));
              v52 = 4;
              goto LABEL_30;
            case 4:
              v124 = v34[317];
              v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v125);
              v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "numberWithDouble:"));
              v127 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v126, v1406));
              v128 = v34;
              v129 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v129, "setObject:forKeyedSubscript:", v127, CFSTR("Routine_HourIDVisit_Start_5"));

              v130 = v128[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_5"));
              v52 = 5;
              goto LABEL_30;
            case 5:
              v131 = v34[317];
              v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v132);
              v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "numberWithDouble:"));
              v134 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v133, v1406));
              v135 = v34;
              v136 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v136, "setObject:forKeyedSubscript:", v134, CFSTR("Routine_HourIDVisit_Start_6"));

              v137 = v135[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_6"));
              v52 = 6;
              goto LABEL_30;
            case 6:
              v138 = v34[317];
              v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v139);
              v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "numberWithDouble:"));
              v141 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v140, v1406));
              v142 = v34;
              v143 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v143, "setObject:forKeyedSubscript:", v141, CFSTR("Routine_HourIDVisit_Start_7"));

              v144 = v142[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_7"));
              v52 = 7;
              goto LABEL_30;
            case 7:
              v145 = v34[317];
              v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v146);
              v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "numberWithDouble:"));
              v148 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v147, v1406));
              v149 = v34;
              v150 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v150, "setObject:forKeyedSubscript:", v148, CFSTR("Routine_HourIDVisit_Start_8"));

              v151 = v149[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_8"));
              v52 = 8;
              goto LABEL_30;
            case 8:
              v152 = v34[317];
              v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v153);
              v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "numberWithDouble:"));
              v155 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v154, v1406));
              v156 = v34;
              v157 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v157, "setObject:forKeyedSubscript:", v155, CFSTR("Routine_HourIDVisit_Start_9"));

              v158 = v156[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_9"));
              v52 = 9;
              goto LABEL_30;
            case 9:
              v159 = v34[317];
              v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v160);
              v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "numberWithDouble:"));
              v162 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v161, v1406));
              v163 = v34;
              v164 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v164, "setObject:forKeyedSubscript:", v162, CFSTR("Routine_HourIDVisit_Start_10"));

              v165 = v163[317];
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
              v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "numberWithDouble:"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_10"));
              v52 = 10;
              goto LABEL_30;
            default:
              ++v52;
              goto LABEL_33;
          }
        }
        v103 = v34[317];
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "startDate"));
        -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "numberWithDouble:"));
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v105, v1406));
        v107 = v34;
        v108 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
        objc_msgSend(v108, "setObject:forKeyedSubscript:", v106, CFSTR("Routine_HourIDVisit_Start_1"));

        v109 = v107[317];
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endDate"));
        -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v84);
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "numberWithDouble:"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v100, v1406));
        v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
        objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, CFSTR("Routine_HourIDVisit_End_1"));
        v52 = 1;
LABEL_30:

        v34 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
        v49 = v1392;
        v46 = v1393;
        v51 = v1441;
        v55 = v1449;
      }

LABEL_34:
      if ((unint64_t)objc_msgSend(v46, "count") <= ++v50)
        goto LABEL_45;
    }
  }
  v1418 = 0;
  v1429 = 0;
  v51 = 0;
  v1445 = 0;
LABEL_45:
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithInt:", v1445));
  v167 = v51;
  v168 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v168, "setObject:forKeyedSubscript:", v166, CFSTR("Routine_nHomeVisits"));

  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithInt:", v167));
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v170, "setObject:forKeyedSubscript:", v169, CFSTR("Routine_nWorkVisits"));

  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithInt:", v1429));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v172, "setObject:forKeyedSubscript:", v171, CFSTR("Routine_nGymVisits"));

  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithInt:", v1418));
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v174, "setObject:forKeyedSubscript:", v173, CFSTR("Routine_nSchoolVisits"));

  v175 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v49));
  v176 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v176, "setObject:forKeyedSubscript:", v175, CFSTR("Routine_AverageVisitsLatency"));

  v177 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1400));
  v178 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v177, CFSTR("Routine_AverageVisitsRealLatency"));

  if (-[NSMutableArray count](v1405, "count"))
  {
    v179 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v180 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v180, "setObject:forKeyedSubscript:", v179, CFSTR("Routine_MeanDeltaBetweenVisits"));

    v181 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v182 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v182, "setObject:forKeyedSubscript:", v181, CFSTR("Routine_MinDeltaBetweenVisits"));

    v183 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v184 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", v183, CFSTR("Routine_MaxDeltaBetweenVisits"));

    v185 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v186 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v186, "setObject:forKeyedSubscript:", v185, CFSTR("Routine_SDDeltaBetweenVisits"));

  }
  v187 = objc_msgSend(v46, "count");
  v188 = v34[317];
  if (v187)
  {
    v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstObject"));
    v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "endDate"));
    objc_msgSend(v190, "timeIntervalSinceDate:", v1453->_startDate);
    v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "numberWithDouble:"));
    v192 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v191);

    v193 = v34[317];
    endDate = v1453->_endDate;
    v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "lastObject"));
    v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "endDate"));
    -[NSDate timeIntervalSinceDate:](endDate, "timeIntervalSinceDate:", v196);
    v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v197);

    v198 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v199 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v199, "setObject:forKeyedSubscript:", v198, CFSTR("Routine_MeanDeltaBetweenVisitsBoundariesIncluded"));

    v200 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v201 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v201, "setObject:forKeyedSubscript:", v200, CFSTR("Routine_MinDeltaBetweenVisitsBoundariesIncluded"));

    v202 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v203 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v203, "setObject:forKeyedSubscript:", v202, CFSTR("Routine_MaxDeltaBetweenVisitsBoundariesIncluded"));

    v204 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v205 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v205, "setObject:forKeyedSubscript:", v204, CFSTR("Routine_SDDeltaBetweenVisitsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "numberWithDouble:"));
    v207 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v207, "setObject:forKeyedSubscript:", v206, CFSTR("Routine_MeanDeltaBetweenVisitsBoundariesIncluded"));

    v208 = v34[317];
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "numberWithDouble:"));
    v210 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v210, "setObject:forKeyedSubscript:", v209, CFSTR("Routine_MinDeltaBetweenVisitsBoundariesIncluded"));

    v211 = v34[317];
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "numberWithDouble:"));
    v213 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v213, "setObject:forKeyedSubscript:", v212, CFSTR("Routine_MaxDeltaBetweenVisitsBoundariesIncluded"));

    v204 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v204, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Routine_SDDeltaBetweenVisitsBoundariesIncluded"));
    v192 = v1405;
  }

  -[NSMutableArray removeAllObjects](v192, "removeAllObjects");
  v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v214, 2));
  v1494[0] = v215;
  v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v217 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v216, 5));
  v1494[1] = v217;
  v218 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1494, 2));
  v219 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v218));

  v1383 = (void *)v219;
  v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v219));
  v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34[317], "numberWithUnsignedInteger:", objc_msgSend(v220, "count")));
  v222 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v222, "setObject:forKeyedSubscript:", v221, CFSTR("Storytelling_NumMoments"));

  v1476 = 0u;
  v1477 = 0u;
  v1474 = 0u;
  v1475 = 0u;
  v223 = v220;
  obj = v223;
  v1430 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v1474, v1493, 16);
  if (v1430)
  {
    v1450 = 0;
    v1415 = 0;
    v1412 = 0;
    v1409 = 0;
    v1407 = 0;
    v1419 = *(_QWORD *)v1475;
    do
    {
      for (i = 0; i != v1430; i = (char *)i + 1)
      {
        if (*(_QWORD *)v1475 != v1419)
          objc_enumerationMutation(obj);
        v225 = *(void **)(*((_QWORD *)&v1474 + 1) + 8 * (_QWORD)i);
        v226 = objc_alloc((Class)NSDateInterval);
        v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "startDate"));
        v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "endDate"));
        v229 = objc_msgSend(v226, "initWithStartDate:endDate:", v227, v228);

        v1446 = v229;
        v1442 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v1453, "doesInterval:overlapWithAnyIntervalFromArray:", v229, v1440);
        v230 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "extendedAttributes"));
        v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "photoMomentPersons"));

        v1472 = 0u;
        v1473 = 0u;
        v1470 = 0u;
        v1471 = 0u;
        v232 = v231;
        v233 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v1470, v1492, 16);
        if (v233)
        {
          v234 = v233;
          v235 = 0;
          v236 = 0;
          v237 = *(_QWORD *)v1471;
          do
          {
            for (j = 0; j != v234; j = (char *)j + 1)
            {
              if (*(_QWORD *)v1471 != v237)
                objc_enumerationMutation(v232);
              v239 = *(void **)(*((_QWORD *)&v1470 + 1) + 8 * (_QWORD)j);
              v240 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "name"));
              v236 |= objc_msgSend(v240, "length") != 0;
              v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "family"));
              v235 |= objc_msgSend(v241, "length") != 0;

            }
            v234 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v1470, v1492, 16);
          }
          while (v234);

          if ((v236 & 1) != 0)
            ++v1407;
          if ((v235 & 1) != 0)
            ++v1409;
        }
        else
        {

        }
        v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "extendedAttributes"));
        v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "photoMomentPublicEvents"));

        v1468 = 0u;
        v1469 = 0u;
        v1466 = 0u;
        v1467 = 0u;
        v244 = v243;
        v245 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v1466, v1491, 16);
        if (v245)
        {
          v246 = v245;
          v247 = 0;
          v248 = 0;
          v249 = *(_QWORD *)v1467;
          do
          {
            for (k = 0; k != v246; k = (char *)k + 1)
            {
              if (*(_QWORD *)v1467 != v249)
                objc_enumerationMutation(v244);
              v251 = *(void **)(*((_QWORD *)&v1466 + 1) + 8 * (_QWORD)k);
              v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "name"));
              v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "performers"));
              v248 |= objc_msgSend(v252, "length") != 0;
              v247 |= objc_msgSend(v253, "count") != 0;

            }
            v246 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v1466, v1491, 16);
          }
          while (v246);

          if ((v248 & 1) != 0)
            ++v1412;
          v254 = v1450;
          v255 = v1446;
          if ((v247 & 1) != 0)
            ++v1415;
        }
        else
        {

          v254 = v1450;
          v255 = v1446;
        }
        v1450 = v254 + v1442;

      }
      v223 = obj;
      v1430 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1474, v1493, 16);
    }
    while (v1430);
  }
  else
  {
    v1450 = 0;
    v1415 = 0;
    v1412 = 0;
    v1409 = 0;
    v1407 = 0;
  }

  v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v1407));
  v258 = v1453;
  v259 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v259, "setObject:forKeyedSubscript:", v257, CFSTR("Storytelling_NumMomentsWithPeople"));

  v260 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v1409));
  v261 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v261, "setObject:forKeyedSubscript:", v260, CFSTR("Storytelling_NumMomentsWithFamily"));

  v262 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v1412));
  v263 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v263, "setObject:forKeyedSubscript:", v262, CFSTR("Storytelling_NumMomentsWithEvent"));

  v264 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v1415));
  v265 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v265, "setObject:forKeyedSubscript:", v264, CFSTR("Storytelling_NumMomentsWithEventAndArtist"));

  if (objc_msgSend(v223, "count"))
  {
    v266 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v1450 / (double)(unint64_t)objc_msgSend(v223, "count")));
    v267 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v267, "setObject:forKeyedSubscript:", v266, CFSTR("Storytelling_PercentageOfMomentEventsNoLOI"));

  }
  v1416 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotoMomentTags getInferenceTagMap](MOPhotoMomentTags, "getInferenceTagMap"));
  v1408 = objc_opt_new(NSMutableArray);
  v1399 = objc_opt_new(NSMutableArray);
  p_cache = (void **)(MOBiomeDonationUtility + 16);
  if (objc_msgSend(v223, "count"))
  {
    v269 = 0;
    do
    {
      v1451 = v269;
      v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "objectAtIndexedSubscript:", v269));
      v271 = objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "creationDate"));
      if (v271)
      {
        v272 = (void *)v271;
        v273 = objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "startDate"));
        if (!v273)
          goto LABEL_97;
        v274 = (void *)v273;
        v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));

        if (v275)
        {
          v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "creationDate"));
          v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));
          objc_msgSend(v276, "timeIntervalSinceDate:", v277);
          v279 = v278;

          v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v279));
          -[NSMutableArray addObject:](v1408, "addObject:", v280);

          switch((_DWORD)v1451)
          {
            case 2:
              v299 = v256[317];
              v300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v300);
              v301 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v299, "numberWithDouble:"));
              v302 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v301, v1406));
              v303 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
              objc_msgSend(v303, "setObject:forKeyedSubscript:", v302, CFSTR("Storytelling_HourIDMoment_Start_3"));

              v304 = v256[317];
              v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v272);
              v287 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v304, "numberWithDouble:"));
              v288 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v287, v1406));
              v289 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
              v290 = v289;
              v291 = v288;
              v292 = CFSTR("Storytelling_HourIDMoment_End_3");
              goto LABEL_96;
            case 1:
              v293 = v256[317];
              v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v294);
              v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v293, "numberWithDouble:"));
              v296 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v295, v1406));
              v297 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
              objc_msgSend(v297, "setObject:forKeyedSubscript:", v296, CFSTR("Storytelling_HourIDMoment_Start_2"));

              v298 = v256[317];
              v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v272);
              v287 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "numberWithDouble:"));
              v288 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v287, v1406));
              v289 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
              v290 = v289;
              v291 = v288;
              v292 = CFSTR("Storytelling_HourIDMoment_End_2");
              goto LABEL_96;
            case 0:
              v281 = v256[317];
              v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "startDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v282);
              v283 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "numberWithDouble:"));
              v284 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v283, v1406));
              v285 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
              objc_msgSend(v285, "setObject:forKeyedSubscript:", v284, CFSTR("Storytelling_HourIDMoment_Start_1"));

              v286 = v256[317];
              v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));
              -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v272);
              v287 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v286, "numberWithDouble:"));
              v288 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v287, v1406));
              v289 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
              v290 = v289;
              v291 = v288;
              v292 = CFSTR("Storytelling_HourIDMoment_End_1");
LABEL_96:
              objc_msgSend(v289, "setObject:forKeyedSubscript:", v291, v292);

              p_cache = (void **)(MOBiomeDonationUtility + 16);
LABEL_97:

              break;
          }
        }
      }
      v305 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));

      if (v305)
      {
        if (v1451)
        {
          v306 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndexedSubscript:", (v1451 - 1)));
          v307 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v306, "endDate"));

          if (v307)
          {
            v308 = v256[317];
            v309 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));
            v310 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndexedSubscript:", v1451 - 1));
            v311 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v310, "endDate"));
            objc_msgSend(v309, "timeIntervalSinceDate:", v311);
            v312 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v308, "numberWithDouble:"));
            -[NSMutableArray addObject:](v1405, "addObject:", v312);

          }
        }
        v313 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "creationDate"));

        if (v313)
        {
          v314 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "creationDate"));
          v315 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));
          objc_msgSend(v314, "timeIntervalSinceDate:", v315);
          v317 = v316;

          v318 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v317));
          -[NSMutableArray addObject:](v1408, "addObject:", v318);

        }
        v319 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "sourceCreationDate"));

        if (v319)
        {
          v320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "sourceCreationDate"));
          v321 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "endDate"));
          objc_msgSend(v320, "timeIntervalSinceDate:", v321);
          v323 = v322;

          v324 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v323));
          -[NSMutableArray addObject:](v1399, "addObject:", v324);

        }
      }
      v223 = obj;
      if (v1451 <= 2)
      {
        v1464 = 0u;
        v1465 = 0u;
        v1462 = 0u;
        v1463 = 0u;
        v1410 = v270;
        v325 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "extendedAttributes"));
        v326 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v325, "photoMomentInferences"));

        v1413 = v326;
        v327 = v1451;
        v1431 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v1462, v1490, 16);
        if (v1431)
        {
          v328 = 0;
          v1420 = *(_QWORD *)v1463;
          while (2)
          {
            v329 = 0;
            if (v328 <= 4)
              v330 = 4;
            else
              v330 = v328;
            v1443 = (v330 - v328);
            do
            {
              if (*(_QWORD *)v1463 != v1420)
                objc_enumerationMutation(v1413);
              v331 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v1462 + 1) + 8 * v329), "lowercaseString"));
              v332 = v331;
              if (v329 == v1443)
              {

                goto LABEL_146;
              }
              v1447 = v329;
              v1460 = 0u;
              v1461 = 0u;
              v1458 = 0u;
              v1459 = 0u;
              v333 = v1416;
              v334 = objc_msgSend(v333, "countByEnumeratingWithState:objects:count:", &v1458, v1489, 16);
              if (v334)
              {
                v335 = v334;
                v336 = *(_QWORD *)v1459;
                do
                {
                  for (m = 0; m != v335; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v1459 != v336)
                      objc_enumerationMutation(v333);
                    v338 = *(_QWORD *)(*((_QWORD *)&v1458 + 1) + 8 * (_QWORD)m);
                    v339 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v333, "objectForKeyedSubscript:", v338));
                    v340 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v339, "lowercaseString"));
                    if (objc_msgSend(v332, "containsString:", v340))
                    {
                      if (v327 == 2)
                      {
                        switch(v328)
                        {
                          case 0:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_3_1");
                            goto LABEL_139;
                          case 1:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_3_2");
                            goto LABEL_139;
                          case 2:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_3_3");
                            goto LABEL_139;
                          case 3:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_3_4");
LABEL_139:
                            objc_msgSend(v341, "setObject:forKeyedSubscript:", v343, v344);

                            v327 = v1451;
                            break;
                          default:
                            break;
                        }
                      }
                      else if (v327 == 1)
                      {
                        switch(v328)
                        {
                          case 0:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_2_1");
                            goto LABEL_139;
                          case 1:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_2_2");
                            goto LABEL_139;
                          case 2:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_2_3");
                            goto LABEL_139;
                          case 3:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_2_4");
                            goto LABEL_139;
                          default:
                            break;
                        }
                      }
                      else
                      {
                        switch(v328)
                        {
                          case 0:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_1_1");
                            goto LABEL_139;
                          case 1:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_1_2");
                            goto LABEL_139;
                          case 2:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_1_3");
                            goto LABEL_139;
                          case 3:
                            v341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                            v342 = v341;
                            v343 = v338;
                            v344 = CFSTR("Storytelling_MomenetInferenceTag_1_4");
                            goto LABEL_139;
                          default:
                            break;
                        }
                      }
                    }

                  }
                  v335 = objc_msgSend(v333, "countByEnumeratingWithState:objects:count:", &v1458, v1489, 16);
                }
                while (v335);
              }
              ++v328;

              v329 = v1447 + 1;
              v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
              v223 = obj;
            }
            while ((id)(v1447 + 1) != v1431);
            v1431 = objc_msgSend(v1413, "countByEnumeratingWithState:objects:count:", &v1462, v1490, 16);
            if (v1431)
              continue;
            break;
          }
        }
LABEL_146:

        v258 = v1453;
        p_cache = MOBiomeDonationUtility.cache;
        v270 = v1410;
      }
      v269 = v1451 + 1;

    }
    while ((unint64_t)objc_msgSend(v223, "count") > v1451 + 1);
  }
  v345 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 488, "meanOf:", v1408));
  v346 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
  objc_msgSend(v346, "setObject:forKeyedSubscript:", v345, CFSTR("Storytelling_AverageMomentsLatency"));

  v347 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 488, "meanOf:", v1399));
  v348 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
  objc_msgSend(v348, "setObject:forKeyedSubscript:", v347, CFSTR("Storytelling_AverageMomentsRealLatency"));

  if (-[NSMutableArray count](v1405, "count"))
  {
    v349 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 488, "meanOf:", v1405));
    v350 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v350, "setObject:forKeyedSubscript:", v349, CFSTR("Storytelling_MeanDeltaBetweenMoments"));

    v351 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v352 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v352, "setObject:forKeyedSubscript:", v351, CFSTR("Storytelling_MinDeltaBetweenMoments"));

    v353 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v354 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v354, "setObject:forKeyedSubscript:", v353, CFSTR("Storytelling_MaxDeltaBetweenMoments"));

    v355 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 488, "standardDeviationOf:", v1405));
    v356 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v356, "setObject:forKeyedSubscript:", v355, CFSTR("Storytelling_SDDeltaBetweenMoments"));

  }
  v357 = objc_msgSend(v223, "count");
  v358 = v256[317];
  if (v357)
  {
    v359 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "firstObject"));
    v360 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "endDate"));
    objc_msgSend(v360, "timeIntervalSinceDate:", v258->_startDate);
    v361 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v358, "numberWithDouble:"));
    v362 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v361);

    v363 = v256[317];
    v364 = v258->_endDate;
    v365 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "lastObject"));
    v366 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v365, "endDate"));
    -[NSDate timeIntervalSinceDate:](v364, "timeIntervalSinceDate:", v366);
    v367 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v363, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v367);

    v368 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 488, "meanOf:", v1405));
    v369 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v369, "setObject:forKeyedSubscript:", v368, CFSTR("Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded"));

    v370 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v371 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v371, "setObject:forKeyedSubscript:", v370, CFSTR("Storytelling_MinDeltaBetweenMomentsBoundariesIncluded"));

    v372 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v373 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v373, "setObject:forKeyedSubscript:", v372, CFSTR("Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded"));

    v374 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 488, "standardDeviationOf:", v1405));
    v375 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v375, "setObject:forKeyedSubscript:", v374, CFSTR("Storytelling_SDDeltaBetweenMomentsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v258->_endDate, "timeIntervalSinceDate:", v258->_startDate);
    v376 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v358, "numberWithDouble:"));
    v377 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v377, "setObject:forKeyedSubscript:", v376, CFSTR("Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded"));

    v378 = v256[317];
    -[NSDate timeIntervalSinceDate:](v258->_endDate, "timeIntervalSinceDate:", v258->_startDate);
    v379 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "numberWithDouble:"));
    v380 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v380, "setObject:forKeyedSubscript:", v379, CFSTR("Storytelling_MinDeltaBetweenMomentsBoundariesIncluded"));

    v381 = v256[317];
    -[NSDate timeIntervalSinceDate:](v258->_endDate, "timeIntervalSinceDate:", v258->_startDate);
    v382 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v381, "numberWithDouble:"));
    v383 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v383, "setObject:forKeyedSubscript:", v382, CFSTR("Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded"));

    v374 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
    objc_msgSend(v374, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Storytelling_SDDeltaBetweenMomentsBoundariesIncluded"));
    v362 = v1405;
  }

  -[NSMutableArray removeAllObjects](v362, "removeAllObjects");
  v384 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v385 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v384, 1));
  v1488[0] = v385;
  v386 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v387 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v386, 2));
  v1488[1] = v387;
  v388 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1488, 2));
  v389 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v388));

  v1382 = (void *)v389;
  v390 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v389));
  v391 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", objc_msgSend(v390, "count")));
  v392 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v258, "metrics"));
  objc_msgSend(v392, "setObject:forKeyedSubscript:", v391, CFSTR("Workout_NumWorkouts"));

  v1395 = objc_opt_new(NSMutableArray);
  v1448 = v390;
  if (objc_msgSend(v390, "count"))
  {
    v393 = 0;
    v394 = 0;
    v395 = 0;
    while (1)
    {
      v396 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v390, "objectAtIndexedSubscript:", v393));
      v397 = objc_alloc((Class)NSDateInterval);
      v398 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
      v399 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
      v400 = objc_msgSend(v397, "initWithStartDate:endDate:", v398, v399);

      v401 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v1453, "doesInterval:overlapWithAnyIntervalFromArray:", v400, v1440);
      v402 = objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "creationDate"));
      if (v402)
      {
        v403 = (void *)v402;
        v404 = objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
        if (v404)
        {
          v405 = (void *)v404;
          v406 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));

          if (v406)
          {
            if (v393)
            {
              v407 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1448, "objectAtIndexedSubscript:", (v393 - 1)));
              v408 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v407, "endDate"));

              if (v408)
              {
                v409 = v256[317];
                v410 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                v411 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1448, "objectAtIndexedSubscript:", v393 - 1));
                v412 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v411, "endDate"));
                objc_msgSend(v410, "timeIntervalSinceDate:", v412);
                v413 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v409, "numberWithDouble:"));
                -[NSMutableArray addObject:](v1405, "addObject:", v413);

                v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
              }
            }
            v414 = (v394 + 1);
            v415 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "creationDate"));
            v416 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
            objc_msgSend(v415, "timeIntervalSinceDate:", v416);
            v418 = v417;

            v419 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v418));
            -[NSMutableArray addObject:](v1395, "addObject:", v419);

            if ((int)v394 <= 9)
            {
              v420 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "workoutType"));
              v421 = +[HKWorkout _workoutActivityTypeFromString:](HKWorkout, "_workoutActivityTypeFromString:", v420);

              switch((int)v394)
              {
                case 0:
                  v422 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v423 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v422, CFSTR("Workout_WorkoutType_1"));

                  v424 = v256[317];
                  v425 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v425);
                  v426 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v424, "numberWithDouble:"));
                  v427 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v426, v1406));
                  v428 = v256;
                  v429 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v429, "setObject:forKeyedSubscript:", v427, CFSTR("Workout_HourIDWorkout_Start_1"));

                  v430 = v428[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v430, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_1"));
                  v394 = 1;
                  goto LABEL_173;
                case 1:
                  v434 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v435 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v435, "setObject:forKeyedSubscript:", v434, CFSTR("Workout_WorkoutType_2"));

                  v436 = v256[317];
                  v437 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v437);
                  v438 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v436, "numberWithDouble:"));
                  v439 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v438, v1406));
                  v440 = v256;
                  v441 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v441, "setObject:forKeyedSubscript:", v439, CFSTR("Workout_HourIDWorkout_Start_2"));

                  v442 = v440[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v442, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_2"));
                  v394 = 2;
                  goto LABEL_173;
                case 2:
                  v443 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v444 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v444, "setObject:forKeyedSubscript:", v443, CFSTR("Workout_WorkoutType_3"));

                  v445 = v256[317];
                  v446 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v446);
                  v447 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v445, "numberWithDouble:"));
                  v448 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v447, v1406));
                  v449 = v256;
                  v450 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v450, "setObject:forKeyedSubscript:", v448, CFSTR("Workout_HourIDWorkout_Start_3"));

                  v451 = v449[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v451, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_3"));
                  v394 = 3;
                  goto LABEL_173;
                case 3:
                  v452 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v453 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v453, "setObject:forKeyedSubscript:", v452, CFSTR("Workout_WorkoutType_4"));

                  v454 = v256[317];
                  v455 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v455);
                  v456 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v454, "numberWithDouble:"));
                  v457 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v456, v1406));
                  v458 = v256;
                  v459 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v459, "setObject:forKeyedSubscript:", v457, CFSTR("Workout_HourIDWorkout_Start_4"));

                  v460 = v458[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v460, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_4"));
                  v394 = 4;
                  goto LABEL_173;
                case 4:
                  v461 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v462 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v462, "setObject:forKeyedSubscript:", v461, CFSTR("Workout_WorkoutType_5"));

                  v463 = v256[317];
                  v464 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v464);
                  v465 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v463, "numberWithDouble:"));
                  v466 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v465, v1406));
                  v467 = v256;
                  v468 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v468, "setObject:forKeyedSubscript:", v466, CFSTR("Workout_HourIDWorkout_Start_5"));

                  v469 = v467[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v469, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_5"));
                  v394 = 5;
                  goto LABEL_173;
                case 5:
                  v470 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v471 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v471, "setObject:forKeyedSubscript:", v470, CFSTR("Workout_WorkoutType_6"));

                  v472 = v256[317];
                  v473 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v473);
                  v474 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v472, "numberWithDouble:"));
                  v475 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v474, v1406));
                  v476 = v256;
                  v477 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v477, "setObject:forKeyedSubscript:", v475, CFSTR("Workout_HourIDWorkout_Start_6"));

                  v478 = v476[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v478, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_6"));
                  v394 = 6;
                  goto LABEL_173;
                case 6:
                  v479 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v480 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v480, "setObject:forKeyedSubscript:", v479, CFSTR("Workout_WorkoutType_7"));

                  v481 = v256[317];
                  v482 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v482);
                  v483 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v481, "numberWithDouble:"));
                  v484 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v483, v1406));
                  v485 = v256;
                  v486 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v486, "setObject:forKeyedSubscript:", v484, CFSTR("Workout_HourIDWorkout_Start_7"));

                  v487 = v485[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v487, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_7"));
                  v394 = 7;
                  goto LABEL_173;
                case 7:
                  v488 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v489 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v489, "setObject:forKeyedSubscript:", v488, CFSTR("Workout_WorkoutType_8"));

                  v490 = v256[317];
                  v491 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v491);
                  v492 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v490, "numberWithDouble:"));
                  v493 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v492, v1406));
                  v494 = v256;
                  v495 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v495, "setObject:forKeyedSubscript:", v493, CFSTR("Workout_HourIDWorkout_Start_8"));

                  v496 = v494[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v496, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_8"));
                  v394 = 8;
                  goto LABEL_173;
                case 8:
                  v497 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v498 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v498, "setObject:forKeyedSubscript:", v497, CFSTR("Workout_WorkoutType_9"));

                  v499 = v256[317];
                  v500 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v500);
                  v501 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v499, "numberWithDouble:"));
                  v502 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v501, v1406));
                  v503 = v256;
                  v504 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v504, "setObject:forKeyedSubscript:", v502, CFSTR("Workout_HourIDWorkout_Start_9"));

                  v505 = v503[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v505, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_9"));
                  v394 = 9;
                  goto LABEL_173;
                case 9:
                  v506 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", v421));
                  v507 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v507, "setObject:forKeyedSubscript:", v506, CFSTR("Workout_WorkoutType_10"));

                  v508 = v256[317];
                  v509 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v509);
                  v510 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v508, "numberWithDouble:"));
                  v511 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v510, v1406));
                  v512 = v256;
                  v513 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v513, "setObject:forKeyedSubscript:", v511, CFSTR("Workout_HourIDWorkout_Start_10"));

                  v514 = v512[317];
                  v403 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v396, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v403);
                  v431 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v514, "numberWithDouble:"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v431, v1406));
                  v433 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                  objc_msgSend(v433, "setObject:forKeyedSubscript:", v432, CFSTR("Workout_HourIDWorkout_End_10"));
                  v394 = 10;
LABEL_173:

                  v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
                  goto LABEL_174;
                default:
                  goto LABEL_176;
              }
            }
            goto LABEL_176;
          }
        }
        else
        {
LABEL_174:

        }
      }
      v414 = v394;
LABEL_176:
      v395 += v401;

      ++v393;
      v390 = v1448;
      v394 = v414;
      if ((unint64_t)objc_msgSend(v1448, "count") <= v393)
        goto LABEL_179;
    }
  }
  v395 = 0;
LABEL_179:
  if (objc_msgSend(v390, "count"))
  {
    v515 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", 1.0 - (double)v395 / (double)(unint64_t)objc_msgSend(v390, "count")));
    v516 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v516, "setObject:forKeyedSubscript:", v515, CFSTR("Workout_PercentageOfWorkoutEventsNoLOI"));

  }
  v517 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1395));
  v518 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v518, "setObject:forKeyedSubscript:", v517, CFSTR("Workout_AverageWorkoutLatency"));

  v519 = v1453;
  if (-[NSMutableArray count](v1405, "count"))
  {
    v520 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v521 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v521, "setObject:forKeyedSubscript:", v520, CFSTR("Workout_MeanDeltaBetweenWorkouts"));

    v522 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v523 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v523, "setObject:forKeyedSubscript:", v522, CFSTR("Workout_MinDeltaBetweenWorkouts"));

    v524 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v525 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v525, "setObject:forKeyedSubscript:", v524, CFSTR("Workout_MaxDeltaBetweenWorkouts"));

    v526 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v527 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v527, "setObject:forKeyedSubscript:", v526, CFSTR("Workout_SDDeltaBetweenWorkouts"));

  }
  v528 = objc_msgSend(v1448, "count");
  v529 = v256[317];
  if (v528)
  {
    v530 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1448, "firstObject"));
    v531 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v530, "endDate"));
    objc_msgSend(v531, "timeIntervalSinceDate:", v1453->_startDate);
    v532 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v529, "numberWithDouble:"));
    v533 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v532);

    v534 = v256[317];
    v535 = v1453->_endDate;
    v536 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1448, "lastObject"));
    v537 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v536, "endDate"));
    -[NSDate timeIntervalSinceDate:](v535, "timeIntervalSinceDate:", v537);
    v538 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v534, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v538);

    v539 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v540 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v540, "setObject:forKeyedSubscript:", v539, CFSTR("Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded"));

    v541 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v542 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v542, "setObject:forKeyedSubscript:", v541, CFSTR("Workout_MinDeltaBetweenWorkoutsBoundariesIncluded"));

    v543 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v544 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v544, "setObject:forKeyedSubscript:", v543, CFSTR("Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded"));

    v545 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v546 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v546, "setObject:forKeyedSubscript:", v545, CFSTR("Workout_SDDeltaBetweenWorkoutsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v547 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v529, "numberWithDouble:"));
    v548 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v548, "setObject:forKeyedSubscript:", v547, CFSTR("Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded"));

    v549 = v256[317];
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v550 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v549, "numberWithDouble:"));
    v551 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v551, "setObject:forKeyedSubscript:", v550, CFSTR("Workout_MinDeltaBetweenWorkoutsBoundariesIncluded"));

    v552 = v256[317];
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v553 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v552, "numberWithDouble:"));
    v554 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v554, "setObject:forKeyedSubscript:", v553, CFSTR("Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded"));

    v545 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v545, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Workout_SDDeltaBetweenWorkoutsBoundariesIncluded"));
    v533 = v1405;
  }

  -[NSMutableArray removeAllObjects](v533, "removeAllObjects");
  v555 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v556 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v555, 3));
  v1487 = v556;
  v557 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v1487, 1));
  v558 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v557));

  v1381 = (void *)v558;
  v559 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v558));
  v560 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", objc_msgSend(v559, "count")));
  v561 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v561, "setObject:forKeyedSubscript:", v560, CFSTR("Proactive_NumAllEvents"));

  v562 = objc_opt_new(NSMutableArray);
  v1454 = 0u;
  v1455 = 0u;
  v1456 = 0u;
  v1457 = 0u;
  v563 = v559;
  v564 = objc_msgSend(v563, "countByEnumeratingWithState:objects:count:", &v1454, v1486, 16);
  if (v564)
  {
    v565 = v564;
    v566 = *(_QWORD *)v1455;
    do
    {
      for (n = 0; n != v565; n = (char *)n + 1)
      {
        if (*(_QWORD *)v1455 != v566)
          objc_enumerationMutation(v563);
        v568 = *(void **)(*((_QWORD *)&v1454 + 1) + 8 * (_QWORD)n);
        v569 = objc_claimAutoreleasedReturnValue(objc_msgSend(v568, "creationDate"));
        if (v569)
        {
          v570 = (void *)v569;
          v571 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v568, "endDate"));

          if (v571)
          {
            v572 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v568, "creationDate"));
            v573 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v568, "endDate"));
            objc_msgSend(v572, "timeIntervalSinceDate:", v573);
            v575 = v574;

            v576 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v575));
            -[NSMutableArray addObject:](v562, "addObject:", v576);

          }
        }
      }
      v565 = objc_msgSend(v563, "countByEnumeratingWithState:objects:count:", &v1454, v1486, 16);
    }
    while (v565);
  }

  if (-[NSMutableArray count](v562, "count"))
  {
    v577 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v562));
    v578 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v578, "setObject:forKeyedSubscript:", v577, CFSTR("Proactive_EventsAverageLatency"));

    -[NSMutableArray removeAllObjects](v562, "removeAllObjects");
  }
  v1380 = v563;
  v1452 = v562;
  v579 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v580 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v579, 3));
  v1485[0] = v580;
  v581 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v582 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v581, 3));
  v1485[1] = v582;
  v583 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1485, 2));
  v584 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v583));

  v1379 = (void *)v584;
  v585 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v584));
  v586 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", objc_msgSend(v585, "count")));
  v587 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v587, "setObject:forKeyedSubscript:", v586, CFSTR("Proactive_NumMediaOnRepeatEvents"));

  v1444 = v585;
  if (objc_msgSend(v585, "count"))
  {
    v588 = 0;
    v589 = 0;
    v1432 = 0;
    while (1)
    {
      v590 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v585, "objectAtIndexedSubscript:", v588));
      v591 = objc_alloc((Class)NSDateInterval);
      v592 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "startDate"));
      v593 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
      v594 = objc_msgSend(v591, "initWithStartDate:endDate:", v592, v593);

      v595 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v519, "doesInterval:overlapWithAnyIntervalFromArray:", v594, v1440);
      v596 = objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "creationDate"));
      if (v596)
      {
        v597 = (void *)v596;
        v598 = objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "startDate"));
        if (!v598)
          goto LABEL_215;
        v599 = (void *)v598;
        v600 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));

        if (v600)
          break;
      }
LABEL_216:
      v519 = v1453;
LABEL_217:
      v589 += v595;

      ++v588;
      v585 = v1444;
      if ((unint64_t)objc_msgSend(v1444, "count") <= v588)
        goto LABEL_220;
    }
    v1421 = v595;
    v519 = v1453;
    if (v588)
    {
      v601 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1444, "objectAtIndexedSubscript:", (v588 - 1)));
      v602 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v601, "endDate"));

      if (v602)
      {
        v603 = v256[317];
        v604 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
        v605 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1444, "objectAtIndexedSubscript:", v588 - 1));
        v606 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v605, "endDate"));
        objc_msgSend(v604, "timeIntervalSinceDate:", v606);
        v607 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v603, "numberWithDouble:"));
        -[NSMutableArray addObject:](v1405, "addObject:", v607);

      }
    }
    v608 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "creationDate"));
    v609 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
    objc_msgSend(v608, "timeIntervalSinceDate:", v609);
    v611 = v610;

    v612 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v611));
    -[NSMutableArray addObject:](v1452, "addObject:", v612);

    if (v1432)
    {
      switch(v1432)
      {
        case 1:
          v613 = v256[317];
          v614 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v614);
          v615 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v613, "numberWithDouble:"));
          v616 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v615, v1406));
          v617 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v617, "setObject:forKeyedSubscript:", v616, CFSTR("Proactive_HourIDMediaOnRepeat_Start_2"));

          v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v597);
          v618 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v619 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v618, v1406));
          v620 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v620, "setObject:forKeyedSubscript:", v619, CFSTR("Proactive_HourIDMediaOnRepeat_End_2"));
          v621 = 2;
          goto LABEL_214;
        case 2:
          v627 = v256[317];
          v628 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v628);
          v629 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v627, "numberWithDouble:"));
          v630 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v629, v1406));
          v631 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v631, "setObject:forKeyedSubscript:", v630, CFSTR("Proactive_HourIDMediaOnRepeat_Start_3"));

          v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v597);
          v618 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v619 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v618, v1406));
          v620 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v620, "setObject:forKeyedSubscript:", v619, CFSTR("Proactive_HourIDMediaOnRepeat_End_3"));
          v621 = 3;
          goto LABEL_214;
        case 3:
          v632 = v256[317];
          v633 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v633);
          v634 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v632, "numberWithDouble:"));
          v635 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v634, v1406));
          v636 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v636, "setObject:forKeyedSubscript:", v635, CFSTR("Proactive_HourIDMediaOnRepeat_Start_4"));

          v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v597);
          v618 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v619 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v618, v1406));
          v620 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v620, "setObject:forKeyedSubscript:", v619, CFSTR("Proactive_HourIDMediaOnRepeat_End_4"));
          v621 = 4;
          goto LABEL_214;
        case 4:
          v637 = v256[317];
          v638 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v638);
          v639 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v637, "numberWithDouble:"));
          v640 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v639, v1406));
          v641 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v641, "setObject:forKeyedSubscript:", v640, CFSTR("Proactive_HourIDMediaOnRepeat_Start_5"));

          v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v597);
          v618 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v619 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v618, v1406));
          v620 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v620, "setObject:forKeyedSubscript:", v619, CFSTR("Proactive_HourIDMediaOnRepeat_End_5"));
          v621 = 5;
          goto LABEL_214;
        default:
          ++v1432;
          v595 = v1421;
          break;
      }
      goto LABEL_217;
    }
    v622 = v256[317];
    v623 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "startDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v623);
    v624 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v622, "numberWithDouble:"));
    v625 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v624, v1406));
    v626 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v626, "setObject:forKeyedSubscript:", v625, CFSTR("Proactive_HourIDMediaOnRepeat_Start_1"));

    v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v590, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v597);
    v618 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v619 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v618, v1406));
    v620 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v620, "setObject:forKeyedSubscript:", v619, CFSTR("Proactive_HourIDMediaOnRepeat_End_1"));
    v621 = 1;
LABEL_214:
    v1432 = v621;

    v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v595 = v1421;
LABEL_215:

    goto LABEL_216;
  }
  v589 = 0;
LABEL_220:
  if (objc_msgSend(v585, "count"))
  {
    v642 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", 1.0 - (double)v589 / (double)(unint64_t)objc_msgSend(v585, "count")));
    v643 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v643, "setObject:forKeyedSubscript:", v642, CFSTR("Proactive_PercentageOfMediaOnRepeatEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v644 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v645 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v645, "setObject:forKeyedSubscript:", v644, CFSTR("Proactive_MediaOnRepeatAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v646 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v647 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v647, "setObject:forKeyedSubscript:", v646, CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEvents"));

    v648 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v649 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v649, "setObject:forKeyedSubscript:", v648, CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEvents"));

    v650 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v651 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v651, "setObject:forKeyedSubscript:", v650, CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEvents"));

    v652 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v653 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v653, "setObject:forKeyedSubscript:", v652, CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEvents"));

  }
  v654 = objc_msgSend(v585, "count");
  v655 = v256[317];
  if (v654)
  {
    v656 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v585, "firstObject"));
    v657 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v656, "endDate"));
    objc_msgSend(v657, "timeIntervalSinceDate:", v519->_startDate);
    v658 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v655, "numberWithDouble:"));
    v659 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v658);

    v660 = v256[317];
    v661 = v519->_endDate;
    v662 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v585, "lastObject"));
    v663 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v662, "endDate"));
    -[NSDate timeIntervalSinceDate:](v661, "timeIntervalSinceDate:", v663);
    v664 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v660, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v664);

    v665 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v666 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v666, "setObject:forKeyedSubscript:", v665, CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));

    v667 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v668 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v668, "setObject:forKeyedSubscript:", v667, CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));

    v669 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v670 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v670, "setObject:forKeyedSubscript:", v669, CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));

    v671 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v672 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v672, "setObject:forKeyedSubscript:", v671, CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v673 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v655, "numberWithDouble:"));
    v674 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v674, "setObject:forKeyedSubscript:", v673, CFSTR("Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));

    v675 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v676 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v675, "numberWithDouble:"));
    v677 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v677, "setObject:forKeyedSubscript:", v676, CFSTR("Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));

    v678 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v679 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v678, "numberWithDouble:"));
    v680 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v680, "setObject:forKeyedSubscript:", v679, CFSTR("Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));

    v671 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v671, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"));
    v659 = v1405;
  }

  -[NSMutableArray removeAllObjects](v659, "removeAllObjects");
  v681 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v682 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v681, 3));
  v1484[0] = v682;
  v683 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v684 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v683, 7));
  v1484[1] = v684;
  v685 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1484, 2));
  v686 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v685));

  v1378 = (void *)v686;
  v687 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v686));
  v688 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", objc_msgSend(v687, "count")));
  v689 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
  objc_msgSend(v689, "setObject:forKeyedSubscript:", v688, CFSTR("Proactive_NumTopicEvents"));

  v1398 = v687;
  if (objc_msgSend(v687, "count"))
  {
    v690 = 0;
    v691 = 0;
    v1433 = 0;
    while (1)
    {
      v692 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v687, "objectAtIndexedSubscript:", v690));
      v693 = objc_alloc((Class)NSDateInterval);
      v694 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "startDate"));
      v695 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
      v696 = objc_msgSend(v693, "initWithStartDate:endDate:", v694, v695);

      v697 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v519, "doesInterval:overlapWithAnyIntervalFromArray:", v696, v1440);
      v698 = objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "creationDate"));
      if (v698)
      {
        v699 = (void *)v698;
        v700 = objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "startDate"));
        if (!v700)
          goto LABEL_246;
        v701 = (void *)v700;
        v702 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));

        if (v702)
          break;
      }
LABEL_247:
      v519 = v1453;
LABEL_248:
      v691 += v697;

      if ((unint64_t)objc_msgSend(v687, "count") <= ++v690)
        goto LABEL_251;
    }
    v1422 = v697;
    v519 = v1453;
    if (v690)
    {
      v703 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v687, "objectAtIndexedSubscript:", (v690 - 1)));
      v704 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v703, "endDate"));

      if (v704)
      {
        v705 = v256[317];
        v706 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
        v707 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v687, "objectAtIndexedSubscript:", v690 - 1));
        v708 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v707, "endDate"));
        objc_msgSend(v706, "timeIntervalSinceDate:", v708);
        v709 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v705, "numberWithDouble:"));
        -[NSMutableArray addObject:](v1405, "addObject:", v709);

        v687 = v1398;
      }
    }
    v710 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "creationDate"));
    v711 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
    objc_msgSend(v710, "timeIntervalSinceDate:", v711);
    v713 = v712;

    v714 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v713));
    -[NSMutableArray addObject:](v1452, "addObject:", v714);

    if (v1433)
    {
      switch(v1433)
      {
        case 1:
          v715 = v256[317];
          v716 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v716);
          v717 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v715, "numberWithDouble:"));
          v718 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v717, v1406));
          v719 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v719, "setObject:forKeyedSubscript:", v718, CFSTR("Proactive_HourIDTopicEvent_Start_2"));

          v699 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v699);
          v720 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v721 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v720, v1406));
          v722 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v722, "setObject:forKeyedSubscript:", v721, CFSTR("Proactive_HourIDTopicEvent_End_2"));
          v723 = 2;
          goto LABEL_245;
        case 2:
          v729 = v256[317];
          v730 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v730);
          v731 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v729, "numberWithDouble:"));
          v732 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v731, v1406));
          v733 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v733, "setObject:forKeyedSubscript:", v732, CFSTR("Proactive_HourIDTopicEvent_Start_3"));

          v699 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v699);
          v720 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v721 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v720, v1406));
          v722 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v722, "setObject:forKeyedSubscript:", v721, CFSTR("Proactive_HourIDTopicEvent_End_3"));
          v723 = 3;
          goto LABEL_245;
        case 3:
          v734 = v256[317];
          v735 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v735);
          v736 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v734, "numberWithDouble:"));
          v737 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v736, v1406));
          v738 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v738, "setObject:forKeyedSubscript:", v737, CFSTR("Proactive_HourIDTopicEvent_Start_4"));

          v699 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v699);
          v720 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v721 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v720, v1406));
          v722 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v722, "setObject:forKeyedSubscript:", v721, CFSTR("Proactive_HourIDTopicEvent_End_4"));
          v723 = 4;
          goto LABEL_245;
        case 4:
          v739 = v256[317];
          v740 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v740);
          v741 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v739, "numberWithDouble:"));
          v742 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v741, v1406));
          v743 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v743, "setObject:forKeyedSubscript:", v742, CFSTR("Proactive_HourIDTopicEvent_Start_5"));

          v699 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v699);
          v720 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v721 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v720, v1406));
          v722 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v722, "setObject:forKeyedSubscript:", v721, CFSTR("Proactive_HourIDTopicEvent_End_5"));
          v723 = 5;
          goto LABEL_245;
        default:
          ++v1433;
          v697 = v1422;
          break;
      }
      goto LABEL_248;
    }
    v724 = v256[317];
    v725 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "startDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v725);
    v726 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v724, "numberWithDouble:"));
    v727 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v726, v1406));
    v728 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v728, "setObject:forKeyedSubscript:", v727, CFSTR("Proactive_HourIDTopicEvent_Start_1"));

    v699 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v692, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v699);
    v720 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v721 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v720, v1406));
    v722 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v722, "setObject:forKeyedSubscript:", v721, CFSTR("Proactive_HourIDTopicEvent_End_1"));
    v723 = 1;
LABEL_245:
    v1433 = v723;

    v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v687 = v1398;
    v697 = v1422;
LABEL_246:

    goto LABEL_247;
  }
  v691 = 0;
LABEL_251:
  if (objc_msgSend(v687, "count"))
  {
    v744 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", 1.0 - (double)v691 / (double)(unint64_t)objc_msgSend(v687, "count")));
    v745 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v745, "setObject:forKeyedSubscript:", v744, CFSTR("Proactive_PercentageOfTopicEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v746 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v747 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v747, "setObject:forKeyedSubscript:", v746, CFSTR("Proactive_TopicAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v748 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v749 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v749, "setObject:forKeyedSubscript:", v748, CFSTR("Proactive_MeanDeltaBetweenTopicEvents"));

    v750 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v751 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v751, "setObject:forKeyedSubscript:", v750, CFSTR("Proactive_MinDeltaBetweenTopicEvents"));

    v752 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v753 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v753, "setObject:forKeyedSubscript:", v752, CFSTR("Proactive_MaxDeltaBetweenTopicEvents"));

    v754 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v755 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v755, "setObject:forKeyedSubscript:", v754, CFSTR("Proactive_SDDeltaBetweenTopicEvents"));

  }
  v756 = objc_msgSend(v687, "count");
  v757 = v256[317];
  if (v756)
  {
    v758 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v687, "firstObject"));
    v759 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v758, "endDate"));
    objc_msgSend(v759, "timeIntervalSinceDate:", v519->_startDate);
    v760 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v757, "numberWithDouble:"));
    v761 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v760);

    v762 = v256[317];
    v763 = v519->_endDate;
    v764 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v687, "lastObject"));
    v765 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v764, "endDate"));
    -[NSDate timeIntervalSinceDate:](v763, "timeIntervalSinceDate:", v765);
    v766 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v762, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v766);

    v767 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v768 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v768, "setObject:forKeyedSubscript:", v767, CFSTR("Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded"));

    v769 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v770 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v770, "setObject:forKeyedSubscript:", v769, CFSTR("Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded"));

    v771 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v772 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v772, "setObject:forKeyedSubscript:", v771, CFSTR("Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded"));

    v773 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v774 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v774, "setObject:forKeyedSubscript:", v773, CFSTR("Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v775 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v757, "numberWithDouble:"));
    v776 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v776, "setObject:forKeyedSubscript:", v775, CFSTR("Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded"));

    v777 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v778 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v777, "numberWithDouble:"));
    v779 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v779, "setObject:forKeyedSubscript:", v778, CFSTR("Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded"));

    v780 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v781 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v780, "numberWithDouble:"));
    v782 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v782, "setObject:forKeyedSubscript:", v781, CFSTR("Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded"));

    v773 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v773, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded"));
    v761 = v1405;
  }

  -[NSMutableArray removeAllObjects](v761, "removeAllObjects");
  v783 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v784 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v783, 3));
  v1483[0] = v784;
  v785 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v786 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v785, 8));
  v1483[1] = v786;
  v787 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1483, 2));
  v788 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v787));

  v1377 = (void *)v788;
  v789 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v788));
  v790 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", objc_msgSend(v789, "count")));
  v791 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
  objc_msgSend(v791, "setObject:forKeyedSubscript:", v790, CFSTR("Proactive_NumTravelEvents"));

  v1397 = v789;
  if (objc_msgSend(v789, "count"))
  {
    v792 = 0;
    v793 = 0;
    v1434 = 0;
    while (1)
    {
      v794 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v789, "objectAtIndexedSubscript:", v792));
      v795 = objc_alloc((Class)NSDateInterval);
      v796 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "startDate"));
      v797 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
      v798 = objc_msgSend(v795, "initWithStartDate:endDate:", v796, v797);

      v799 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v519, "doesInterval:overlapWithAnyIntervalFromArray:", v798, v1440);
      v800 = objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "creationDate"));
      if (v800)
      {
        v801 = (void *)v800;
        v802 = objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "startDate"));
        if (!v802)
          goto LABEL_277;
        v803 = (void *)v802;
        v804 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));

        if (v804)
          break;
      }
LABEL_278:
      v519 = v1453;
LABEL_279:
      v793 += v799;

      if ((unint64_t)objc_msgSend(v789, "count") <= ++v792)
        goto LABEL_282;
    }
    v1423 = v799;
    v519 = v1453;
    if (v792)
    {
      v805 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v789, "objectAtIndexedSubscript:", (v792 - 1)));
      v806 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v805, "endDate"));

      if (v806)
      {
        v807 = v256[317];
        v808 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
        v809 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v789, "objectAtIndexedSubscript:", v792 - 1));
        v810 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v809, "endDate"));
        objc_msgSend(v808, "timeIntervalSinceDate:", v810);
        v811 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v807, "numberWithDouble:"));
        -[NSMutableArray addObject:](v1405, "addObject:", v811);

        v789 = v1397;
      }
    }
    v812 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "creationDate"));
    v813 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
    objc_msgSend(v812, "timeIntervalSinceDate:", v813);
    v815 = v814;

    v816 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v815));
    -[NSMutableArray addObject:](v1452, "addObject:", v816);

    if (v1434)
    {
      switch(v1434)
      {
        case 1:
          v817 = v256[317];
          v818 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v818);
          v819 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v817, "numberWithDouble:"));
          v820 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v819, v1406));
          v821 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v821, "setObject:forKeyedSubscript:", v820, CFSTR("Proactive_HourIDTravelEvent_Start_2"));

          v801 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v801);
          v822 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v823 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v822, v1406));
          v824 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v824, "setObject:forKeyedSubscript:", v823, CFSTR("Proactive_HourIDTravelEvent_End_2"));
          v825 = 2;
          goto LABEL_276;
        case 2:
          v831 = v256[317];
          v832 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v832);
          v833 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v831, "numberWithDouble:"));
          v834 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v833, v1406));
          v835 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v835, "setObject:forKeyedSubscript:", v834, CFSTR("Proactive_HourIDTravelEvent_Start_3"));

          v801 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v801);
          v822 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v823 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v822, v1406));
          v824 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v824, "setObject:forKeyedSubscript:", v823, CFSTR("Proactive_HourIDTravelEvent_End_3"));
          v825 = 3;
          goto LABEL_276;
        case 3:
          v836 = v256[317];
          v837 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v837);
          v838 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v836, "numberWithDouble:"));
          v839 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v838, v1406));
          v840 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v840, "setObject:forKeyedSubscript:", v839, CFSTR("Proactive_HourIDTravelEvent_Start_4"));

          v801 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v801);
          v822 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v823 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v822, v1406));
          v824 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v824, "setObject:forKeyedSubscript:", v823, CFSTR("Proactive_HourIDTravelEvent_End_4"));
          v825 = 4;
          goto LABEL_276;
        case 4:
          v841 = v256[317];
          v842 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v842);
          v843 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v841, "numberWithDouble:"));
          v844 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v843, v1406));
          v845 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v845, "setObject:forKeyedSubscript:", v844, CFSTR("Proactive_HourIDTravelEvent_Start_5"));

          v801 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v801);
          v822 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v823 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v822, v1406));
          v824 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v824, "setObject:forKeyedSubscript:", v823, CFSTR("Proactive_HourIDTravelEvent_End_5"));
          v825 = 5;
          goto LABEL_276;
        default:
          ++v1434;
          v799 = v1423;
          break;
      }
      goto LABEL_279;
    }
    v826 = v256[317];
    v827 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "startDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v827);
    v828 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v826, "numberWithDouble:"));
    v829 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v828, v1406));
    v830 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v830, "setObject:forKeyedSubscript:", v829, CFSTR("Proactive_HourIDTravelEvent_Start_1"));

    v801 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v794, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v801);
    v822 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v823 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v822, v1406));
    v824 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v824, "setObject:forKeyedSubscript:", v823, CFSTR("Proactive_HourIDTravelEvent_End_1"));
    v825 = 1;
LABEL_276:
    v1434 = v825;

    v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v789 = v1397;
    v799 = v1423;
LABEL_277:

    goto LABEL_278;
  }
  v793 = 0;
LABEL_282:
  if (objc_msgSend(v789, "count"))
  {
    v846 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", 1.0 - (double)v793 / (double)(unint64_t)objc_msgSend(v789, "count")));
    v847 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v847, "setObject:forKeyedSubscript:", v846, CFSTR("Proactive_PercentageOfTravelEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v848 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v849 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v849, "setObject:forKeyedSubscript:", v848, CFSTR("Proactive_TravelAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v850 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v851 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v851, "setObject:forKeyedSubscript:", v850, CFSTR("Proactive_MeanDeltaBetweenTravelEvents"));

    v852 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v853 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v853, "setObject:forKeyedSubscript:", v852, CFSTR("Proactive_MinDeltaBetweenTravelEvents"));

    v854 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v855 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v855, "setObject:forKeyedSubscript:", v854, CFSTR("Proactive_MaxDeltaBetweenTravelEvents"));

    v856 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v857 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v857, "setObject:forKeyedSubscript:", v856, CFSTR("Proactive_SDDeltaBetweenTravelEvents"));

  }
  v858 = objc_msgSend(v789, "count");
  v859 = v256[317];
  if (v858)
  {
    v860 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v789, "firstObject"));
    v861 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v860, "endDate"));
    objc_msgSend(v861, "timeIntervalSinceDate:", v519->_startDate);
    v862 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v859, "numberWithDouble:"));
    v863 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v862);

    v864 = v256[317];
    v865 = v519->_endDate;
    v866 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v789, "lastObject"));
    v867 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v866, "endDate"));
    -[NSDate timeIntervalSinceDate:](v865, "timeIntervalSinceDate:", v867);
    v868 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v864, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v868);

    v869 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v870 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v870, "setObject:forKeyedSubscript:", v869, CFSTR("Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded"));

    v871 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v872 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v872, "setObject:forKeyedSubscript:", v871, CFSTR("Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded"));

    v873 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v874 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v874, "setObject:forKeyedSubscript:", v873, CFSTR("Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded"));

    v875 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v876 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v876, "setObject:forKeyedSubscript:", v875, CFSTR("Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v877 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v859, "numberWithDouble:"));
    v878 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v878, "setObject:forKeyedSubscript:", v877, CFSTR("Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded"));

    v879 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v880 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v879, "numberWithDouble:"));
    v881 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v881, "setObject:forKeyedSubscript:", v880, CFSTR("Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded"));

    v882 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v883 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v882, "numberWithDouble:"));
    v884 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v884, "setObject:forKeyedSubscript:", v883, CFSTR("Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded"));

    v875 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v875, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded"));
    v863 = v1405;
  }

  -[NSMutableArray removeAllObjects](v863, "removeAllObjects");
  v885 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v886 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v885, 3));
  v1482[0] = v886;
  v887 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v888 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v887, 9));
  v1482[1] = v888;
  v889 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1482, 2));
  v890 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v889));

  v1376 = (void *)v890;
  v891 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v890));
  v892 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", objc_msgSend(v891, "count")));
  v893 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
  objc_msgSend(v893, "setObject:forKeyedSubscript:", v892, CFSTR("Proactive_NumSharedWithYouEvents"));

  v1396 = v891;
  if (objc_msgSend(v891, "count"))
  {
    v894 = 0;
    v895 = 0;
    v1435 = 0;
    while (1)
    {
      v896 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v891, "objectAtIndexedSubscript:", v894));
      v897 = objc_alloc((Class)NSDateInterval);
      v898 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "startDate"));
      v899 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
      v900 = objc_msgSend(v897, "initWithStartDate:endDate:", v898, v899);

      v901 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v519, "doesInterval:overlapWithAnyIntervalFromArray:", v900, v1440);
      v902 = objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "creationDate"));
      if (v902)
      {
        v903 = (void *)v902;
        v904 = objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "startDate"));
        if (!v904)
          goto LABEL_308;
        v905 = (void *)v904;
        v906 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));

        if (v906)
          break;
      }
LABEL_309:
      v519 = v1453;
LABEL_310:
      v895 += v901;

      if ((unint64_t)objc_msgSend(v891, "count") <= ++v894)
        goto LABEL_313;
    }
    v1424 = v901;
    v519 = v1453;
    if (v894)
    {
      v907 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v891, "objectAtIndexedSubscript:", (v894 - 1)));
      v908 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v907, "endDate"));

      if (v908)
      {
        v909 = v256[317];
        v910 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
        v911 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v891, "objectAtIndexedSubscript:", v894 - 1));
        v912 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v911, "endDate"));
        objc_msgSend(v910, "timeIntervalSinceDate:", v912);
        v913 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v909, "numberWithDouble:"));
        -[NSMutableArray addObject:](v1405, "addObject:", v913);

        v891 = v1396;
      }
    }
    v914 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "creationDate"));
    v915 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
    objc_msgSend(v914, "timeIntervalSinceDate:", v915);
    v917 = v916;

    v918 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", v917));
    -[NSMutableArray addObject:](v1452, "addObject:", v918);

    if (v1435)
    {
      switch(v1435)
      {
        case 1:
          v919 = v256[317];
          v920 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v920);
          v921 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v919, "numberWithDouble:"));
          v922 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v921, v1406));
          v923 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v923, "setObject:forKeyedSubscript:", v922, CFSTR("Proactive_HourIDSharedWithYouEvent_Start_2"));

          v903 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v903);
          v924 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v925 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v924, v1406));
          v926 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v926, "setObject:forKeyedSubscript:", v925, CFSTR("Proactive_HourIDSharedWithYouEvent_End_2"));
          v927 = 2;
          goto LABEL_307;
        case 2:
          v933 = v256[317];
          v934 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v934);
          v935 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v933, "numberWithDouble:"));
          v936 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v935, v1406));
          v937 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v937, "setObject:forKeyedSubscript:", v936, CFSTR("Proactive_HourIDSharedWithYouEvent_Start_3"));

          v903 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v903);
          v924 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v925 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v924, v1406));
          v926 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v926, "setObject:forKeyedSubscript:", v925, CFSTR("Proactive_HourIDSharedWithYouEvent_End_3"));
          v927 = 3;
          goto LABEL_307;
        case 3:
          v938 = v256[317];
          v939 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v939);
          v940 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v938, "numberWithDouble:"));
          v941 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v940, v1406));
          v942 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v942, "setObject:forKeyedSubscript:", v941, CFSTR("Proactive_HourIDSharedWithYouEvent_Start_4"));

          v903 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v903);
          v924 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v925 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v924, v1406));
          v926 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v926, "setObject:forKeyedSubscript:", v925, CFSTR("Proactive_HourIDSharedWithYouEvent_End_4"));
          v927 = 4;
          goto LABEL_307;
        case 4:
          v943 = v256[317];
          v944 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v944);
          v945 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v943, "numberWithDouble:"));
          v946 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v945, v1406));
          v947 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v947, "setObject:forKeyedSubscript:", v946, CFSTR("Proactive_HourIDSharedWithYouEvent_Start_5"));

          v903 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v903);
          v924 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v925 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v924, v1406));
          v926 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v926, "setObject:forKeyedSubscript:", v925, CFSTR("Proactive_HourIDSharedWithYouEvent_End_5"));
          v927 = 5;
          goto LABEL_307;
        default:
          ++v1435;
          v901 = v1424;
          break;
      }
      goto LABEL_310;
    }
    v928 = v256[317];
    v929 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "startDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v929);
    v930 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v928, "numberWithDouble:"));
    v931 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v930, v1406));
    v932 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v932, "setObject:forKeyedSubscript:", v931, CFSTR("Proactive_HourIDSharedWithYouEvent_Start_1"));

    v903 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v896, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v903);
    v924 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v925 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v924, v1406));
    v926 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v926, "setObject:forKeyedSubscript:", v925, CFSTR("Proactive_HourIDSharedWithYouEvent_End_1"));
    v927 = 1;
LABEL_307:
    v1435 = v927;

    v256 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v891 = v1396;
    v901 = v1424;
LABEL_308:

    goto LABEL_309;
  }
  v895 = 0;
LABEL_313:
  if (objc_msgSend(v891, "count"))
  {
    v948 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithDouble:", 1.0 - (double)v895 / (double)(unint64_t)objc_msgSend(v891, "count")));
    v949 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v949, "setObject:forKeyedSubscript:", v948, CFSTR("Proactive_PercentageOfSharedWithYouEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v950 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v951 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v951, "setObject:forKeyedSubscript:", v950, CFSTR("Proactive_SharedWithYouAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v952 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v953 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v953, "setObject:forKeyedSubscript:", v952, CFSTR("Proactive_MeanDeltaBetweenSharedWithYouEvents"));

    v954 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v955 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v955, "setObject:forKeyedSubscript:", v954, CFSTR("Proactive_MinDeltaBetweenSharedWithYouEvents"));

    v956 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v957 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v957, "setObject:forKeyedSubscript:", v956, CFSTR("Proactive_MaxDeltaBetweenSharedWithYouEvents"));

    v958 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v959 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v959, "setObject:forKeyedSubscript:", v958, CFSTR("Proactive_SDDeltaBetweenSharedWithYouEvents"));

  }
  v960 = objc_msgSend(v891, "count");
  v961 = v256[317];
  if (v960)
  {
    v962 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v891, "firstObject"));
    v963 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v962, "endDate"));
    objc_msgSend(v963, "timeIntervalSinceDate:", v519->_startDate);
    v964 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v961, "numberWithDouble:"));
    v965 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v964);

    v966 = v256[317];
    v967 = v519->_endDate;
    v968 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v891, "lastObject"));
    v969 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v968, "endDate"));
    -[NSDate timeIntervalSinceDate:](v967, "timeIntervalSinceDate:", v969);
    v970 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v966, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v970);

    v971 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v972 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v972, "setObject:forKeyedSubscript:", v971, CFSTR("Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded"));

    v973 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v974 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v974, "setObject:forKeyedSubscript:", v973, CFSTR("Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded"));

    v975 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v976 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v976, "setObject:forKeyedSubscript:", v975, CFSTR("Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded"));

    v977 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v978 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v978, "setObject:forKeyedSubscript:", v977, CFSTR("Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v979 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v961, "numberWithDouble:"));
    v980 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v980, "setObject:forKeyedSubscript:", v979, CFSTR("Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded"));

    v981 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v982 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v981, "numberWithDouble:"));
    v983 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v983, "setObject:forKeyedSubscript:", v982, CFSTR("Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded"));

    v984 = v256[317];
    -[NSDate timeIntervalSinceDate:](v519->_endDate, "timeIntervalSinceDate:", v519->_startDate);
    v985 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v984, "numberWithDouble:"));
    v986 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v986, "setObject:forKeyedSubscript:", v985, CFSTR("Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded"));

    v977 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
    objc_msgSend(v977, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded"));
    v965 = v1405;
  }

  -[NSMutableArray removeAllObjects](v965, "removeAllObjects");
  v987 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v988 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v987, 3));
  v1481[0] = v988;
  v989 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v990 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v989, 10));
  v1481[1] = v990;
  v991 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1481, 2));
  v992 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v991));

  v1375 = (void *)v992;
  v993 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v992));
  v994 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256[317], "numberWithUnsignedInteger:", objc_msgSend(v993, "count")));
  v995 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v519, "metrics"));
  objc_msgSend(v995, "setObject:forKeyedSubscript:", v994, CFSTR("Proactive_NumSignificantContactEvents"));

  v1394 = v993;
  if (objc_msgSend(v993, "count"))
  {
    v996 = 0;
    v997 = 0;
    v1436 = 0;
    while (1)
    {
      v998 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v993, "objectAtIndexedSubscript:", v996));
      v999 = objc_alloc((Class)NSDateInterval);
      v1000 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "startDate"));
      v1001 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
      v1002 = objc_msgSend(v999, "initWithStartDate:endDate:", v1000, v1001);

      v1003 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v1453, "doesInterval:overlapWithAnyIntervalFromArray:", v1002, v1440);
      v1004 = objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "creationDate"));
      if (v1004)
      {
        v1005 = (void *)v1004;
        v1006 = objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "startDate"));
        if (!v1006)
          goto LABEL_339;
        v1007 = (void *)v1006;
        v1008 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));

        if (v1008)
          break;
      }
LABEL_340:
      v997 += v1003;

      if ((unint64_t)objc_msgSend(v993, "count") <= ++v996)
        goto LABEL_343;
    }
    v1425 = v1003;
    if (v996)
    {
      v1009 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v993, "objectAtIndexedSubscript:", (v996 - 1)));
      v1010 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1009, "endDate"));

      if (v1010)
      {
        v1011 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
        v1012 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v993, "objectAtIndexedSubscript:", v996 - 1));
        v1013 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1012, "endDate"));
        objc_msgSend(v1011, "timeIntervalSinceDate:", v1013);
        v1014 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableArray addObject:](v1405, "addObject:", v1014);

      }
    }
    v1015 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "creationDate"));
    v1016 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
    objc_msgSend(v1015, "timeIntervalSinceDate:", v1016);
    v1018 = v1017;

    v1019 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v1018));
    -[NSMutableArray addObject:](v1452, "addObject:", v1019);

    if (v1436)
    {
      switch(v1436)
      {
        case 1:
          v1020 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1020);
          v1021 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1022 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1021, v1406));
          v1023 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1023, "setObject:forKeyedSubscript:", v1022, CFSTR("Proactive_HourIDSignificantContactEvent_Start_2"));

          v1005 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1005);
          v1024 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1025 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1024, v1406));
          v1026 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1026, "setObject:forKeyedSubscript:", v1025, CFSTR("Proactive_HourIDSignificantContactEvent_End_2"));
          v1027 = 2;
          goto LABEL_338;
        case 2:
          v1032 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1032);
          v1033 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1034 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1033, v1406));
          v1035 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1035, "setObject:forKeyedSubscript:", v1034, CFSTR("Proactive_HourIDSignificantContactEvent_Start_3"));

          v1005 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1005);
          v1024 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1025 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1024, v1406));
          v1026 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1026, "setObject:forKeyedSubscript:", v1025, CFSTR("Proactive_HourIDSignificantContactEvent_End_3"));
          v1027 = 3;
          goto LABEL_338;
        case 3:
          v1036 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1036);
          v1037 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1038 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1037, v1406));
          v1039 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1039, "setObject:forKeyedSubscript:", v1038, CFSTR("Proactive_HourIDSignificantContactEvent_Start_4"));

          v1005 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1005);
          v1024 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1025 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1024, v1406));
          v1026 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1026, "setObject:forKeyedSubscript:", v1025, CFSTR("Proactive_HourIDSignificantContactEvent_End_4"));
          v1027 = 4;
          goto LABEL_338;
        case 4:
          v1040 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1040);
          v1041 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1042 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1041, v1406));
          v1043 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1043, "setObject:forKeyedSubscript:", v1042, CFSTR("Proactive_HourIDSignificantContactEvent_Start_5"));

          v1005 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1005);
          v1024 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1025 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1024, v1406));
          v1026 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1026, "setObject:forKeyedSubscript:", v1025, CFSTR("Proactive_HourIDSignificantContactEvent_End_5"));
          v1027 = 5;
          goto LABEL_338;
        default:
          ++v1436;
          v1003 = v1425;
          break;
      }
      goto LABEL_340;
    }
    v1028 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "startDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1028);
    v1029 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1030 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1029, v1406));
    v1031 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1031, "setObject:forKeyedSubscript:", v1030, CFSTR("Proactive_HourIDSignificantContactEvent_Start_1"));

    v1005 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v998, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1005);
    v1024 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1025 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1024, v1406));
    v1026 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1026, "setObject:forKeyedSubscript:", v1025, CFSTR("Proactive_HourIDSignificantContactEvent_End_1"));
    v1027 = 1;
LABEL_338:
    v1436 = v1027;

    v993 = v1394;
    v1003 = v1425;
LABEL_339:

    goto LABEL_340;
  }
  v997 = 0;
LABEL_343:
  if (objc_msgSend(v993, "count"))
  {
    v1044 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v997 / (double)(unint64_t)objc_msgSend(v993, "count")));
    v1045 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1045, "setObject:forKeyedSubscript:", v1044, CFSTR("Proactive_PercentageOfSignificantContactEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v1046 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v1047 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1047, "setObject:forKeyedSubscript:", v1046, CFSTR("Proactive_SignificantContactAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v1048 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1049 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1049, "setObject:forKeyedSubscript:", v1048, CFSTR("Proactive_MeanDeltaBetweenSignificantContactEvents"));

    v1050 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1051 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1051, "setObject:forKeyedSubscript:", v1050, CFSTR("Proactive_MinDeltaBetweenSignificantContactEvents"));

    v1052 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1053 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1053, "setObject:forKeyedSubscript:", v1052, CFSTR("Proactive_MaxDeltaBetweenSignificantContactEvents"));

    v1054 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1055 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1055, "setObject:forKeyedSubscript:", v1054, CFSTR("Proactive_SDDeltaBetweenSignificantContactEvents"));

  }
  if (objc_msgSend(v1394, "count"))
  {
    v1056 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1394, "firstObject"));
    v1057 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1056, "endDate"));
    objc_msgSend(v1057, "timeIntervalSinceDate:", v1453->_startDate);
    v1058 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1059 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v1058);

    v1060 = v1453->_endDate;
    v1061 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1394, "lastObject"));
    v1062 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1061, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1060, "timeIntervalSinceDate:", v1062);
    v1063 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v1063);

    v1064 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1065 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1065, "setObject:forKeyedSubscript:", v1064, CFSTR("Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded"));

    v1066 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1067 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1067, "setObject:forKeyedSubscript:", v1066, CFSTR("Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded"));

    v1068 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1069 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1069, "setObject:forKeyedSubscript:", v1068, CFSTR("Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded"));

    v1070 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1071 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1071, "setObject:forKeyedSubscript:", v1070, CFSTR("Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v1072 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1073 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1073, "setObject:forKeyedSubscript:", v1072, CFSTR("Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded"));

    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v1074 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1075 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1075, "setObject:forKeyedSubscript:", v1074, CFSTR("Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded"));

    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v1076 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1077 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1077, "setObject:forKeyedSubscript:", v1076, CFSTR("Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded"));

    v1070 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1070, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded"));
    v1059 = v1405;
  }

  -[NSMutableArray removeAllObjects](v1059, "removeAllObjects");
  v1078 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v1079 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v1078, 3));
  v1480[0] = v1079;
  v1080 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v1081 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v1080, 11));
  v1480[1] = v1081;
  v1082 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1480, 2));
  v1083 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v1082));

  v1374 = (void *)v1083;
  v1084 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v1083));
  v1085 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v1084, "count")));
  v1086 = v1084;
  v1087 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v1087, "setObject:forKeyedSubscript:", v1085, CFSTR("Proactive_NumStructuredEvents"));

  v1411 = v1086;
  if (objc_msgSend(v1086, "count"))
  {
    v1088 = 0;
    v1089 = 0;
    v1437 = 0;
    while (1)
    {
      v1090 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1086, "objectAtIndexedSubscript:", v1088));
      v1091 = objc_alloc((Class)NSDateInterval);
      v1092 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "startDate"));
      v1093 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
      v1094 = objc_msgSend(v1091, "initWithStartDate:endDate:", v1092, v1093);

      v1095 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v1453, "doesInterval:overlapWithAnyIntervalFromArray:", v1094, v1440);
      v1096 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "creationDate"));
      if (v1096)
      {
        v1097 = (void *)v1096;
        v1098 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "startDate"));
        if (!v1098)
          goto LABEL_369;
        v1099 = (void *)v1098;
        v1100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));

        if (v1100)
          break;
      }
LABEL_370:
      v1089 += v1095;

      if ((unint64_t)objc_msgSend(v1086, "count") <= ++v1088)
        goto LABEL_373;
    }
    if (v1088)
    {
      v1101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1086, "objectAtIndexedSubscript:", (v1088 - 1)));
      v1102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1101, "endDate"));

      if (v1102)
      {
        v1103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
        v1104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1086, "objectAtIndexedSubscript:", v1088 - 1));
        v1105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1104, "endDate"));
        objc_msgSend(v1103, "timeIntervalSinceDate:", v1105);
        v1106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableArray addObject:](v1405, "addObject:", v1106);

        v1086 = v1411;
      }
    }
    v1107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "creationDate"));
    v1108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
    objc_msgSend(v1107, "timeIntervalSinceDate:", v1108);
    v1110 = v1109;

    v1111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v1110));
    -[NSMutableArray addObject:](v1452, "addObject:", v1111);

    if (v1437)
    {
      v1426 = v1095;
      switch(v1437)
      {
        case 1:
          v1112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1112);
          v1113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1114 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1113, v1406));
          v1115 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1115, "setObject:forKeyedSubscript:", v1114, CFSTR("Proactive_HourIDStructuredEvent_Start_2"));

          v1097 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1097);
          v1116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1117 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1116, v1406));
          v1118 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1118, "setObject:forKeyedSubscript:", v1117, CFSTR("Proactive_HourIDStructuredEvent_End_2"));
          v1119 = 2;
          goto LABEL_368;
        case 2:
          v1124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1124);
          v1125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1126 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1125, v1406));
          v1127 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1127, "setObject:forKeyedSubscript:", v1126, CFSTR("Proactive_HourIDStructuredEvent_Start_3"));

          v1097 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1097);
          v1116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1117 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1116, v1406));
          v1118 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1118, "setObject:forKeyedSubscript:", v1117, CFSTR("Proactive_HourIDStructuredEvent_End_3"));
          v1119 = 3;
          goto LABEL_368;
        case 3:
          v1128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1128);
          v1129 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1130 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1129, v1406));
          v1131 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1131, "setObject:forKeyedSubscript:", v1130, CFSTR("Proactive_HourIDStructuredEvent_Start_4"));

          v1097 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1097);
          v1116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1117 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1116, v1406));
          v1118 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1118, "setObject:forKeyedSubscript:", v1117, CFSTR("Proactive_HourIDStructuredEvent_End_4"));
          v1119 = 4;
          goto LABEL_368;
        case 4:
          v1132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1132);
          v1133 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1134 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1133, v1406));
          v1135 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1135, "setObject:forKeyedSubscript:", v1134, CFSTR("Proactive_HourIDStructuredEvent_Start_5"));

          v1097 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1097);
          v1116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1117 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1116, v1406));
          v1118 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1118, "setObject:forKeyedSubscript:", v1117, CFSTR("Proactive_HourIDStructuredEvent_End_5"));
          v1119 = 5;
          goto LABEL_368;
        default:
          ++v1437;
          break;
      }
      goto LABEL_370;
    }
    v1426 = v1095;
    v1120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "startDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1120);
    v1121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1122 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1121, v1406));
    v1123 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1123, "setObject:forKeyedSubscript:", v1122, CFSTR("Proactive_HourIDStructuredEvent_Start_1"));

    v1097 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1090, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1097);
    v1116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1117 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1116, v1406));
    v1118 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1118, "setObject:forKeyedSubscript:", v1117, CFSTR("Proactive_HourIDStructuredEvent_End_1"));
    v1119 = 1;
LABEL_368:
    v1437 = v1119;

    v1086 = v1411;
    v1095 = v1426;
LABEL_369:

    goto LABEL_370;
  }
  v1089 = 0;
LABEL_373:
  v1136 = v1453;
  v1137 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  if (objc_msgSend(v1086, "count"))
  {
    v1138 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v1089 / (double)(unint64_t)objc_msgSend(v1086, "count")));
    v1139 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1139, "setObject:forKeyedSubscript:", v1138, CFSTR("Proactive_PercentageOfStructuredEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v1140 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v1141 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1141, "setObject:forKeyedSubscript:", v1140, CFSTR("Proactive_StructuredEventsAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v1142 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1143 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1143, "setObject:forKeyedSubscript:", v1142, CFSTR("Proactive_MeanDeltaBetweenStructuredEvents"));

    v1144 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1145 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1145, "setObject:forKeyedSubscript:", v1144, CFSTR("Proactive_MinDeltaBetweenStructuredEvents"));

    v1146 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1147 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1147, "setObject:forKeyedSubscript:", v1146, CFSTR("Proactive_MaxDeltaBetweenStructuredEvents"));

    v1148 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1149 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1149, "setObject:forKeyedSubscript:", v1148, CFSTR("Proactive_SDDeltaBetweenStructuredEvents"));

  }
  if (objc_msgSend(v1411, "count"))
  {
    v1150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1411, "firstObject"));
    v1151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1150, "endDate"));
    objc_msgSend(v1151, "timeIntervalSinceDate:", v1453->_startDate);
    v1152 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1153 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v1152);

    v1154 = v1453->_endDate;
    v1155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1411, "lastObject"));
    v1156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1155, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1154, "timeIntervalSinceDate:", v1156);
    v1157 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v1157);

    v1158 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1159 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1159, "setObject:forKeyedSubscript:", v1158, CFSTR("Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded"));

    v1160 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1161 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1161, "setObject:forKeyedSubscript:", v1160, CFSTR("Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded"));

    v1162 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1163 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1163, "setObject:forKeyedSubscript:", v1162, CFSTR("Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded"));

    v1164 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1165 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1165, "setObject:forKeyedSubscript:", v1164, CFSTR("Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v1166 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1167 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1167, "setObject:forKeyedSubscript:", v1166, CFSTR("Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded"));

    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v1168 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1169 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1169, "setObject:forKeyedSubscript:", v1168, CFSTR("Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded"));

    -[NSDate timeIntervalSinceDate:](v1453->_endDate, "timeIntervalSinceDate:", v1453->_startDate);
    v1170 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v1171 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1171, "setObject:forKeyedSubscript:", v1170, CFSTR("Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded"));

    v1164 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
    objc_msgSend(v1164, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded"));
    v1153 = v1405;
  }

  -[NSMutableArray removeAllObjects](v1153, "removeAllObjects");
  v1172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v1173 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v1172, 3));
  v1479[0] = v1173;
  v1174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v1175 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v1174, 4));
  v1479[1] = v1175;
  v1176 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1479, 2));
  v1177 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v1176));

  v1373 = (void *)v1177;
  v1178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v1177));
  v1179 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v1178, "count")));
  v1180 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
  objc_msgSend(v1180, "setObject:forKeyedSubscript:", v1179, CFSTR("Proactive_NumLeisureMediaEvents"));

  v1414 = v1178;
  if (objc_msgSend(v1178, "count"))
  {
    v1181 = 0;
    v1182 = 0;
    v1438 = 0;
    while (1)
    {
      v1183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1178, "objectAtIndexedSubscript:", v1181));
      v1184 = objc_alloc((Class)NSDateInterval);
      v1185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "startDate"));
      v1186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
      v1187 = objc_msgSend(v1184, "initWithStartDate:endDate:", v1185, v1186);

      v1188 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v1136, "doesInterval:overlapWithAnyIntervalFromArray:", v1187, v1440);
      v1189 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "creationDate"));
      if (v1189)
      {
        v1190 = (void *)v1189;
        v1191 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "startDate"));
        if (!v1191)
          goto LABEL_400;
        v1192 = (void *)v1191;
        v1193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));

        if (v1193)
        {
          if (v1181)
          {
            v1194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1414, "objectAtIndexedSubscript:", (v1181 - 1)));
            v1195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1194, "endDate"));

            if (v1195)
            {
              v1196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
              v1197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1414, "objectAtIndexedSubscript:", v1181 - 1));
              v1198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1197, "endDate"));
              objc_msgSend(v1196, "timeIntervalSinceDate:", v1198);
              v1199 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              -[NSMutableArray addObject:](v1405, "addObject:", v1199);

            }
          }
          v1200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "creationDate"));
          v1201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
          objc_msgSend(v1200, "timeIntervalSinceDate:", v1201);
          v1203 = v1202;

          v1204 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v1203));
          -[NSMutableArray addObject:](v1452, "addObject:", v1204);

          if (v1438)
          {
            v1427 = v1188;
            switch(v1438)
            {
              case 1:
                v1205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "startDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1205);
                v1206 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1207 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1206, v1406));
                v1208 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1208, "setObject:forKeyedSubscript:", v1207, CFSTR("Proactive_HourIDLeisureMediaEvent_Start_2"));

                v1190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1190);
                v1209 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1210 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1209, v1406));
                v1211 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1211, "setObject:forKeyedSubscript:", v1210, CFSTR("Proactive_HourIDLeisureMediaEvent_End_2"));
                v1212 = 2;
                goto LABEL_399;
              case 2:
                v1217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "startDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1217);
                v1218 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1219 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1218, v1406));
                v1220 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1220, "setObject:forKeyedSubscript:", v1219, CFSTR("Proactive_HourIDLeisureMediaEvent_Start_3"));

                v1190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1190);
                v1209 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1210 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1209, v1406));
                v1211 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1211, "setObject:forKeyedSubscript:", v1210, CFSTR("Proactive_HourIDLeisureMediaEvent_End_3"));
                v1212 = 3;
                goto LABEL_399;
              case 3:
                v1221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "startDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1221);
                v1222 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1223 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1222, v1406));
                v1224 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1224, "setObject:forKeyedSubscript:", v1223, CFSTR("Proactive_HourIDLeisureMediaEvent_Start_4"));

                v1190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1190);
                v1209 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1210 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1209, v1406));
                v1211 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1211, "setObject:forKeyedSubscript:", v1210, CFSTR("Proactive_HourIDLeisureMediaEvent_End_4"));
                v1212 = 4;
                goto LABEL_399;
              case 4:
                v1225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "startDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1225);
                v1226 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1227 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1226, v1406));
                v1228 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1228, "setObject:forKeyedSubscript:", v1227, CFSTR("Proactive_HourIDLeisureMediaEvent_Start_5"));

                v1190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
                -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1190);
                v1209 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v1210 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1209, v1406));
                v1211 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
                objc_msgSend(v1211, "setObject:forKeyedSubscript:", v1210, CFSTR("Proactive_HourIDLeisureMediaEvent_End_5"));
                v1212 = 5;
                goto LABEL_399;
              default:
                ++v1438;
                v1136 = v1453;
                goto LABEL_395;
            }
          }
          v1427 = v1188;
          v1213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "startDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1213);
          v1214 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1215 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1214, v1406));
          v1216 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1216, "setObject:forKeyedSubscript:", v1215, CFSTR("Proactive_HourIDLeisureMediaEvent_Start_1"));

          v1190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1183, "endDate"));
          -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1190);
          v1209 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v1210 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1209, v1406));
          v1211 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
          objc_msgSend(v1211, "setObject:forKeyedSubscript:", v1210, CFSTR("Proactive_HourIDLeisureMediaEvent_End_1"));
          v1212 = 1;
LABEL_399:
          v1438 = v1212;

          v1136 = v1453;
          v1178 = v1414;
          v1188 = v1427;
LABEL_400:

          goto LABEL_401;
        }
LABEL_395:
        v1178 = v1414;
      }
LABEL_401:
      v1182 += v1188;

      if ((unint64_t)objc_msgSend(v1178, "count") <= ++v1181)
      {
        v1229 = (double)v1182;
        v1137 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
        goto LABEL_404;
      }
    }
  }
  v1229 = 0.0;
LABEL_404:
  if (objc_msgSend(v1178, "count"))
  {
    v1230 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1137[317], "numberWithDouble:", 1.0 - v1229 / (double)(unint64_t)objc_msgSend(v1178, "count")));
    v1231 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1231, "setObject:forKeyedSubscript:", v1230, CFSTR("Proactive_PercentageOfLeisureMediaEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v1232 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v1233 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1233, "setObject:forKeyedSubscript:", v1232, CFSTR("Proactive_LeisureMediaEventsAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v1234 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1235 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1235, "setObject:forKeyedSubscript:", v1234, CFSTR("Proactive_MeanDeltaBetweenLeisureMediaEvents"));

    v1236 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1237 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1237, "setObject:forKeyedSubscript:", v1236, CFSTR("Proactive_MinDeltaBetweenLeisureMediaEvents"));

    v1238 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1239 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1239, "setObject:forKeyedSubscript:", v1238, CFSTR("Proactive_MaxDeltaBetweenLeisureMediaEvents"));

    v1240 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1241 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1241, "setObject:forKeyedSubscript:", v1240, CFSTR("Proactive_SDDeltaBetweenLeisureMediaEvents"));

  }
  v1242 = objc_msgSend(v1178, "count");
  v1243 = v1137[317];
  if (v1242)
  {
    v1244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1178, "firstObject"));
    v1245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1244, "endDate"));
    objc_msgSend(v1245, "timeIntervalSinceDate:", v1136->_startDate);
    v1246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1243, "numberWithDouble:"));
    v1247 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v1246);

    v1248 = v1137[317];
    v1249 = v1136->_endDate;
    v1250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1178, "lastObject"));
    v1251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1250, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1249, "timeIntervalSinceDate:", v1251);
    v1252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1248, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v1252);

    v1253 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1254 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1254, "setObject:forKeyedSubscript:", v1253, CFSTR("Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded"));

    v1255 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1256 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1256, "setObject:forKeyedSubscript:", v1255, CFSTR("Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded"));

    v1257 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1258 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1258, "setObject:forKeyedSubscript:", v1257, CFSTR("Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded"));

    v1259 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1260 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1260, "setObject:forKeyedSubscript:", v1259, CFSTR("Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v1136->_endDate, "timeIntervalSinceDate:", v1136->_startDate);
    v1261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1243, "numberWithDouble:"));
    v1262 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1262, "setObject:forKeyedSubscript:", v1261, CFSTR("Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded"));

    v1263 = v1137[317];
    -[NSDate timeIntervalSinceDate:](v1136->_endDate, "timeIntervalSinceDate:", v1136->_startDate);
    v1264 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1263, "numberWithDouble:"));
    v1265 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1265, "setObject:forKeyedSubscript:", v1264, CFSTR("Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded"));

    v1266 = v1137[317];
    -[NSDate timeIntervalSinceDate:](v1136->_endDate, "timeIntervalSinceDate:", v1136->_startDate);
    v1267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1266, "numberWithDouble:"));
    v1268 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1268, "setObject:forKeyedSubscript:", v1267, CFSTR("Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded"));

    v1259 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1259, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded"));
    v1247 = v1405;
  }

  -[NSMutableArray removeAllObjects](v1247, "removeAllObjects");
  v1269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strProvider")));
  v1270 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v1269, 3));
  v1478[0] = v1270;
  v1271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1402, "objectForKeyedSubscript:", CFSTR("strCategory")));
  v1272 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v1271, 12));
  v1478[1] = v1272;
  v1273 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1478, 2));
  v1274 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v1273));

  v1275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1403, "filteredArrayUsingPredicate:", v1274));
  v1276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1137[317], "numberWithUnsignedInteger:", objc_msgSend(v1275, "count")));
  v1277 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
  objc_msgSend(v1277, "setObject:forKeyedSubscript:", v1276, CFSTR("Proactive_NumNLEvents"));

  v1428 = v1275;
  if (objc_msgSend(v1275, "count"))
  {
    v1401 = v1274;
    v1278 = 0;
    v1279 = 0;
    v1280 = 0;
    v1281 = v1428;
    while (1)
    {
      v1282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1281, "objectAtIndexedSubscript:", v1278));
      v1283 = objc_alloc((Class)NSDateInterval);
      v1284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "startDate"));
      v1285 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
      v1286 = objc_msgSend(v1283, "initWithStartDate:endDate:", v1284, v1285);

      v1287 = -[MOPromptMetrics doesInterval:overlapWithAnyIntervalFromArray:](v1136, "doesInterval:overlapWithAnyIntervalFromArray:", v1286, v1440);
      v1288 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "creationDate"));
      if (v1288)
        break;
LABEL_433:
      v1279 += v1287;

      if ((unint64_t)objc_msgSend(v1281, "count") <= ++v1278)
      {
        v1333 = (double)v1279;
        v1274 = v1401;
        goto LABEL_436;
      }
    }
    v1289 = (void *)v1288;
    v1439 = v1287;
    v1290 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "startDate"));
    if (v1290)
    {
      v1291 = (void *)v1290;
      v1292 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));

      if (!v1292)
      {
LABEL_426:
        v1281 = v1428;
LABEL_432:
        v1287 = v1439;
        goto LABEL_433;
      }
      if (v1278)
      {
        v1293 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1428, "objectAtIndexedSubscript:", (v1278 - 1)));
        v1294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1293, "endDate"));

        if (v1294)
        {
          v1295 = v1137[317];
          v1296 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
          v1297 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1428, "objectAtIndexedSubscript:", v1278 - 1));
          v1298 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1297, "endDate"));
          objc_msgSend(v1296, "timeIntervalSinceDate:", v1298);
          v1299 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1295, "numberWithDouble:"));
          -[NSMutableArray addObject:](v1405, "addObject:", v1299);

          v1136 = v1453;
        }
      }
      v1300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "creationDate"));
      v1301 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
      objc_msgSend(v1300, "timeIntervalSinceDate:", v1301);
      v1303 = v1302;

      v1304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1137[317], "numberWithDouble:", v1303));
      -[NSMutableArray addObject:](v1452, "addObject:", v1304);

      if (v1280)
      {
        switch(v1280)
        {
          case 1:
            v1305 = v1137[317];
            v1306 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "startDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1306);
            v1307 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1305, "numberWithDouble:"));
            v1308 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1307, v1406));
            v1309 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
            objc_msgSend(v1309, "setObject:forKeyedSubscript:", v1308, CFSTR("Proactive_HourIDNLEvent_Start_2"));

            v1289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1289);
            v1310 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            v1311 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1310, v1406));
            v1312 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
            objc_msgSend(v1312, "setObject:forKeyedSubscript:", v1311, CFSTR("Proactive_HourIDNLEvent_End_2"));
            v1280 = 2;
            goto LABEL_430;
          case 2:
            v1318 = v1137[317];
            v1319 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "startDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1319);
            v1320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1318, "numberWithDouble:"));
            v1321 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1320, v1406));
            v1322 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
            objc_msgSend(v1322, "setObject:forKeyedSubscript:", v1321, CFSTR("Proactive_HourIDNLEvent_Start_3"));

            v1289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1289);
            v1310 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            v1311 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1310, v1406));
            v1312 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
            objc_msgSend(v1312, "setObject:forKeyedSubscript:", v1311, CFSTR("Proactive_HourIDNLEvent_End_3"));
            v1280 = 3;
            goto LABEL_430;
          case 3:
            v1323 = v1137[317];
            v1324 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "startDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1324);
            v1325 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1323, "numberWithDouble:"));
            v1326 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1325, v1406));
            v1327 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
            objc_msgSend(v1327, "setObject:forKeyedSubscript:", v1326, CFSTR("Proactive_HourIDNLEvent_Start_4"));

            v1289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1289);
            v1310 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            v1311 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1310, v1406));
            v1312 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
            objc_msgSend(v1312, "setObject:forKeyedSubscript:", v1311, CFSTR("Proactive_HourIDNLEvent_End_4"));
            v1280 = 4;
            goto LABEL_430;
          case 4:
            v1328 = v1137[317];
            v1329 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "startDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1329);
            v1330 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1328, "numberWithDouble:"));
            v1331 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1330, v1406));
            v1332 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
            objc_msgSend(v1332, "setObject:forKeyedSubscript:", v1331, CFSTR("Proactive_HourIDNLEvent_Start_5"));

            v1289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
            -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1289);
            v1310 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            v1311 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1310, v1406));
            v1312 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
            objc_msgSend(v1312, "setObject:forKeyedSubscript:", v1311, CFSTR("Proactive_HourIDNLEvent_End_5"));
            v1280 = 5;
            goto LABEL_430;
          default:
            ++v1280;
            goto LABEL_426;
        }
      }
      v1313 = v1137[317];
      v1314 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "startDate"));
      -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1314);
      v1315 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1313, "numberWithDouble:"));
      v1316 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1315, v1406));
      v1317 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
      objc_msgSend(v1317, "setObject:forKeyedSubscript:", v1316, CFSTR("Proactive_HourIDNLEvent_Start_1"));

      v1289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1282, "endDate"));
      -[NSDate timeIntervalSinceDate:](v1404, "timeIntervalSinceDate:", v1289);
      v1310 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v1311 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v1310, v1406));
      v1312 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1453, "metrics"));
      objc_msgSend(v1312, "setObject:forKeyedSubscript:", v1311, CFSTR("Proactive_HourIDNLEvent_End_1"));
      v1280 = 1;
LABEL_430:

      v1136 = v1453;
      v1137 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      v1281 = v1428;
    }

    goto LABEL_432;
  }
  v1333 = 0.0;
LABEL_436:
  if (objc_msgSend(v1428, "count"))
  {
    v1334 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1137[317], "numberWithDouble:", 1.0 - v1333 / (double)(unint64_t)objc_msgSend(v1428, "count")));
    v1335 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1335, "setObject:forKeyedSubscript:", v1334, CFSTR("Proactive_PercentageOfNLEventsNoLOI"));

  }
  if (-[NSMutableArray count](v1452, "count"))
  {
    v1336 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1452));
    v1337 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1337, "setObject:forKeyedSubscript:", v1336, CFSTR("Proactive_NLEventsAverageLatency"));

    -[NSMutableArray removeAllObjects](v1452, "removeAllObjects");
  }
  if (-[NSMutableArray count](v1405, "count"))
  {
    v1338 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1339 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1339, "setObject:forKeyedSubscript:", v1338, CFSTR("Proactive_MeanDeltaBetweenNLEvents"));

    v1340 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1341 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1341, "setObject:forKeyedSubscript:", v1340, CFSTR("Proactive_MinDeltaBetweenNLEvents"));

    v1342 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1343 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1343, "setObject:forKeyedSubscript:", v1342, CFSTR("Proactive_MaxDeltaBetweenNLEvents"));

    v1344 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1345 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1345, "setObject:forKeyedSubscript:", v1344, CFSTR("Proactive_SDDeltaBetweenNLEvents"));

  }
  v1346 = objc_msgSend(v1428, "count");
  v1347 = v1137[317];
  if (v1346)
  {
    v1348 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1428, "firstObject"));
    v1349 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1348, "endDate"));
    objc_msgSend(v1349, "timeIntervalSinceDate:", v1136->_startDate);
    v1350 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1347, "numberWithDouble:"));
    v1351 = v1405;
    -[NSMutableArray addObject:](v1405, "addObject:", v1350);

    v1352 = v1137[317];
    v1353 = v1136->_endDate;
    v1354 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1428, "lastObject"));
    v1355 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1354, "endDate"));
    -[NSDate timeIntervalSinceDate:](v1353, "timeIntervalSinceDate:", v1355);
    v1356 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1352, "numberWithDouble:"));
    -[NSMutableArray addObject:](v1405, "addObject:", v1356);

    v1357 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics meanOf:](MOPromptMetrics, "meanOf:", v1405));
    v1358 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1358, "setObject:forKeyedSubscript:", v1357, CFSTR("Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded"));

    v1359 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@min.doubleValue")));
    v1360 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1360, "setObject:forKeyedSubscript:", v1359, CFSTR("Proactive_MinDeltaBetweenNLEventsBoundariesIncluded"));

    v1361 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v1405, "valueForKeyPath:", CFSTR("@max.doubleValue")));
    v1362 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1362, "setObject:forKeyedSubscript:", v1361, CFSTR("Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded"));

    v1363 = (void *)objc_claimAutoreleasedReturnValue(+[MOPromptMetrics standardDeviationOf:](MOPromptMetrics, "standardDeviationOf:", v1405));
    v1364 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1364, "setObject:forKeyedSubscript:", v1363, CFSTR("Proactive_SDDeltaBetweenNLEventsBoundariesIncluded"));

  }
  else
  {
    -[NSDate timeIntervalSinceDate:](v1136->_endDate, "timeIntervalSinceDate:", v1136->_startDate);
    v1365 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1347, "numberWithDouble:"));
    v1366 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1366, "setObject:forKeyedSubscript:", v1365, CFSTR("Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded"));

    v1367 = v1137[317];
    -[NSDate timeIntervalSinceDate:](v1136->_endDate, "timeIntervalSinceDate:", v1136->_startDate);
    v1368 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1367, "numberWithDouble:"));
    v1369 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1369, "setObject:forKeyedSubscript:", v1368, CFSTR("Proactive_MinDeltaBetweenNLEventsBoundariesIncluded"));

    v1370 = v1137[317];
    -[NSDate timeIntervalSinceDate:](v1136->_endDate, "timeIntervalSinceDate:", v1136->_startDate);
    v1371 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1370, "numberWithDouble:"));
    v1372 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1372, "setObject:forKeyedSubscript:", v1371, CFSTR("Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded"));

    v1363 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v1136, "metrics"));
    objc_msgSend(v1363, "setObject:forKeyedSubscript:", &off_1002DD178, CFSTR("Proactive_SDDeltaBetweenNLEventsBoundariesIncluded"));
    v1351 = v1405;
  }

  -[NSMutableArray removeAllObjects](v1351, "removeAllObjects");
}

- (void)calculateAndSetMetricsForCorrelatedEvents:(id)a3
{
  id v4;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  int v52;
  uint64_t v53;
  void *i;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  const __CFString *v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  MOPromptMetrics *v82;
  id v83;
  id obj;
  uint64_t v85;
  void *v86;
  int v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _QWORD v99[4];
  _QWORD v100[4];
  void *v101;
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundles"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0"));

  v82 = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1"));

  if (v4 && objc_msgSend(v4, "count"))
  {
    v79 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("numPreBundles"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundler propertyNameDictionary](MOEventBundler, "propertyNameDictionary"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("strProvider")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v25, 1));
    v104[0] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("strCategory")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v27, 2));
    v104[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 2));
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v29));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("strProvider")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v30, 2));
    v103[0] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("strCategory")));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v32, 5));
    v103[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v103, 2));
    v35 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v34));

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("strProvider")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v36, 4));
    v102[0] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("strCategory")));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v38, 1));
    v102[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v102, 2));
    v41 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v40));

    v77 = v24;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("strProvider")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v42, 3));
    v101 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v101, 1));
    v45 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v44));

    v99[0] = &off_1002DB2B8;
    v99[1] = &off_1002DB2D0;
    v100[0] = v78;
    v100[1] = v35;
    v75 = (void *)v41;
    v76 = (void *)v35;
    v99[2] = &off_1002DB2E8;
    v99[3] = &off_1002DB300;
    v100[2] = v41;
    v100[3] = v45;
    v74 = (void *)v45;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v100, v99, 4));
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v79;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
    v46 = 0;
    if (v83)
    {
      v80 = *(_QWORD *)v94;
      do
      {
        v47 = 0;
        do
        {
          v86 = v46;
          if (*(_QWORD *)v94 != v80)
            objc_enumerationMutation(obj);
          v85 = v47;
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v47)));
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v49 = v81;
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          if (v50)
          {
            v51 = v50;
            v88 = 0;
            v87 = 0;
            v52 = 0;
            v53 = *(_QWORD *)v90;
            do
            {
              for (i = 0; i != v51; i = (char *)i + 1)
              {
                if (*(_QWORD *)v90 != v53)
                  objc_enumerationMutation(v49);
                v55 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
                v56 = objc_autoreleasePoolPush();
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v55));
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "filteredSetUsingPredicate:", v57));
                v59 = v58;
                if (v58 && objc_msgSend(v58, "count"))
                {
                  if ((objc_msgSend(v55, "isEqual:", &off_1002DB2B8) & 1) != 0)
                  {
                    v52 = 1;
                  }
                  else if ((objc_msgSend(v55, "isEqual:", &off_1002DB2D0) & 1) != 0)
                  {
                    LODWORD(v88) = 1;
                  }
                  else if ((objc_msgSend(v55, "isEqual:", &off_1002DB2E8) & 1) != 0)
                  {
                    v87 = 1;
                  }
                  else
                  {
                    HIDWORD(v88) |= objc_msgSend(v55, "isEqual:", &off_1002DB300);
                  }
                }

                objc_autoreleasePoolPop(v56);
              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
            }
            while (v51);
          }
          else
          {
            v88 = 0;
            v87 = 0;
            v52 = 0;
          }

          v60 = v52 | v88 | v87;
          if ((v60 & 1) == 0)
          {
            v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0");
            if ((v88 & 0x100000000) == 0)
              goto LABEL_44;
          }
          v62 = HIDWORD(v88) ^ 1;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1");
          if (((v60 | HIDWORD(v88) ^ 1) & 1) == 0)
            goto LABEL_44;
          v63 = v87 ^ 1;
          v64 = v52 | v88 | v87 ^ 1;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0");
          if (((v64 | HIDWORD(v88)) & 1) == 0)
            goto LABEL_44;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1");
          if (((v64 | v62) & 1) == 0)
            goto LABEL_44;
          v65 = v52 | v88 ^ 1;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0");
          if (((v65 | v87 | HIDWORD(v88)) & 1) == 0)
            goto LABEL_44;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1");
          if (((v65 | v87 | v62) & 1) == 0)
            goto LABEL_44;
          v66 = v65 | v63;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0");
          if (((v66 | HIDWORD(v88)) & 1) == 0)
            goto LABEL_44;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1");
          if (((v66 | v62) & 1) == 0)
            goto LABEL_44;
          v67 = v52 ^ 1 | v88;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0");
          if (((v67 | v87 | HIDWORD(v88)) & 1) == 0)
            goto LABEL_44;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1");
          if (((v67 | v87 | v62) & 1) == 0)
            goto LABEL_44;
          v68 = v67 | v63;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0");
          if (((v68 | HIDWORD(v88)) & 1) == 0)
            goto LABEL_44;
          v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1");
          if (((v68 | v62) & 1) != 0
            && (v69 = v52 ^ 1 | v88 ^ 1,
                v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0"),
                ((v69 | v87 | HIDWORD(v88)) & 1) != 0)
            && (v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1"),
                ((v69 | v87 | v62) & 1) != 0)
            && (v70 = v69 | v63,
                v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0"),
                ((v70 | HIDWORD(v88)) & 1) != 0)
            && (v61 = CFSTR("numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1"),
                ((v70 | v62) & 1) != 0))
          {
            v46 = v86;
          }
          else
          {
LABEL_44:
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v82, "metrics"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", v61));

            v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v46, "intValue") + 1));
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v82, "metrics"));
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v72, v61);

          }
          v47 = v85 + 1;
        }
        while ((id)(v85 + 1) != v83);
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      }
      while (v83);
    }

    v4 = v79;
  }

}

- (void)calculateAndSetMetricsForSemanticallyBundledEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1002DB1F8, CFSTR("numBundles"));

  v5 = v8;
  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("numBundles"));

    v5 = v8;
  }

}

- (void)getAndSetAgeGender
{
  void *v3;
  unsigned int v4;
  id os_log;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  uint8_t *v51;
  _QWORD *v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  if (objc_opt_class(MCProfileConnection, a2)
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection")),
        v4 = objc_msgSend(v3, "isHealthDataSubmissionAllowed"),
        v3,
        v4))
  {
    -[MOPromptMetrics setIHAState:](self, "setIHAState:", 1);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex for CoreAnalytics, with IHA permission", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v56 = buf;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__39;
    v59 = __Block_byref_object_dispose__39;
    v60 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = __Block_byref_object_copy__39;
    v53[4] = __Block_byref_object_dispose__39;
    v54 = 0;
    v7 = dispatch_semaphore_create(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager getHealthKitManager](self->_eventManager, "getHealthKitManager"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = __37__MOPromptMetrics_getAndSetAgeGender__block_invoke;
    v49[3] = &unk_1002B0C40;
    v9 = v7;
    v50 = v9;
    v51 = buf;
    v52 = v53;
    objc_msgSend(v8, "fetchUserBiologicalSexWithHandler:", v49);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOPromptMetrics.m", 2198, "-[MOPromptMetrics getAndSetAgeGender]"));
    v48 = 0;
    v11 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v9, &v48, v10);
    v34 = v48;
    if (!v11)
    {
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MOTrendsAnalyzer(Metrics) setCommonFields:].cold.1((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

    }
    -[MOPromptMetrics setBiologicalSex:](self, "setBiologicalSex:", *((_QWORD *)v56 + 5));
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__39;
    v46 = __Block_byref_object_dispose__39;
    v47 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__39;
    v40[4] = __Block_byref_object_dispose__39;
    v41 = 0;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __37__MOPromptMetrics_getAndSetAgeGender__block_invoke_1271;
    v36[3] = &unk_1002B0C68;
    v20 = dispatch_semaphore_create(0);
    v37 = v20;
    v38 = &v42;
    v39 = v40;
    objc_msgSend(v8, "fetchUserAgeWithHandler:", v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOPromptMetrics.m", 2215, "-[MOPromptMetrics getAndSetAgeGender]"));
    v35 = 0;
    v22 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v20, &v35, v21);
    v23 = v35;
    if (!v22)
    {
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MOTrendsAnalyzer(Metrics) setCommonFields:].cold.1((uint64_t)v21, v25, v26, v27, v28, v29, v30, v31);

    }
    -[MOPromptMetrics setAge:](self, "setAge:", v43[5]);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    -[MOPromptMetrics setIHAState:](self, "setIHAState:", 0);
    -[MOPromptMetrics setBiologicalSex:](self, "setBiologicalSex:", 0);
    -[MOPromptMetrics setAge:](self, "setAge:", 0);
    v32 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Not sending age/biologicalSex to CoreAnalytics, no IHA permission", buf, 2u);
    }

  }
}

void __37__MOPromptMetrics_getAndSetAgeGender__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __37__MOPromptMetrics_getAndSetAgeGender__block_invoke_1271(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setIHAState:(BOOL)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("IHA_State"));

}

- (void)setBiologicalSex:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "biologicalSex")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("BiologicalSex"));

  }
}

- (void)setAge:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = objc_msgSend(a3, "copy");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Age"));

  }
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: startDate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: endDate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 EventManager:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: eventManager", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

@end
