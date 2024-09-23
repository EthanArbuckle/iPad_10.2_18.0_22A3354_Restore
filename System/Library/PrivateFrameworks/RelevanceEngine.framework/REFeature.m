@implementation REFeature

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSet](REFeatureSet, "featureSet");
}

+ (REFeature)priorityFeature
{
  if (priorityFeature_onceToken != -1)
    dispatch_once(&priorityFeature_onceToken, &__block_literal_global_47_0);
  return (REFeature *)(id)priorityFeature_SystemFeature;
}

+ (REFeature)dateFeature
{
  if (dateFeature_onceToken != -1)
    dispatch_once(&dateFeature_onceToken, &__block_literal_global_35);
  return (REFeature *)(id)dateFeature_SystemFeature;
}

+ (REFeature)dailyRoutineFeature
{
  if (dailyRoutineFeature_onceToken != -1)
    dispatch_once(&dailyRoutineFeature_onceToken, &__block_literal_global_77);
  return (REFeature *)(id)dailyRoutineFeature_SystemFeature;
}

+ (REFeature)locationFeature
{
  if (locationFeature_onceToken != -1)
    dispatch_once(&locationFeature_onceToken, &__block_literal_global_41);
  return (REFeature *)(id)locationFeature_SystemFeature;
}

+ (REFeature)geofenceFeature
{
  if (geofenceFeature_onceToken != -1)
    dispatch_once(&geofenceFeature_onceToken, &__block_literal_global_44_0);
  return (REFeature *)(id)geofenceFeature_SystemFeature;
}

+ (REFeature)dataSourceFeature
{
  if (dataSourceFeature_onceToken != -1)
    dispatch_once(&dataSourceFeature_onceToken, &__block_literal_global_32);
  return (REFeature *)(id)dataSourceFeature_SystemFeature;
}

+ (REFeature)isInDailyRoutineFeature
{
  if (isInDailyRoutineFeature_onceToken != -1)
    dispatch_once(&isInDailyRoutineFeature_onceToken, &__block_literal_global_80);
  return (REFeature *)(id)isInDailyRoutineFeature_SystemFeature;
}

+ (id)groupFeature
{
  if (groupFeature_onceToken != -1)
    dispatch_once(&groupFeature_onceToken, &__block_literal_global_86);
  return (id)groupFeature_SystemFeature;
}

+ (id)forcedFeature
{
  if (forcedFeature_onceToken != -1)
    dispatch_once(&forcedFeature_onceToken, &__block_literal_global_74);
  return (id)forcedFeature_SystemFeature;
}

+ (REFeature)sentimentAnalysisFeature
{
  if (sentimentAnalysisFeature_onceToken != -1)
    dispatch_once(&sentimentAnalysisFeature_onceToken, &__block_literal_global_92);
  return (REFeature *)(id)sentimentAnalysisFeature_SystemFeature;
}

+ (REFeature)sentimentAnalysisCertaintyFeature
{
  if (sentimentAnalysisCertaintyFeature_onceToken != -1)
    dispatch_once(&sentimentAnalysisCertaintyFeature_onceToken, &__block_literal_global_98);
  return (REFeature *)(id)sentimentAnalysisCertaintyFeature_SystemFeature;
}

+ (REFeature)portraitFeature
{
  if (portraitFeature_onceToken != -1)
    dispatch_once(&portraitFeature_onceToken, &__block_literal_global_101);
  return (REFeature *)(id)portraitFeature_SystemFeature;
}

+ (REFeature)negativeSentimentAnalysisFeature
{
  if (negativeSentimentAnalysisFeature_onceToken != -1)
    dispatch_once(&negativeSentimentAnalysisFeature_onceToken, &__block_literal_global_95);
  return (REFeature *)(id)negativeSentimentAnalysisFeature_SystemFeature;
}

+ (REFeature)workoutStateFeature
{
  if (workoutStateFeature_onceToken != -1)
    dispatch_once(&workoutStateFeature_onceToken, &__block_literal_global_158);
  return (REFeature *)(id)workoutStateFeature_SystemFeature;
}

+ (REFeature)siriActionPerformedCountFeature
{
  if (siriActionPerformedCountFeature_onceToken != -1)
    dispatch_once(&siriActionPerformedCountFeature_onceToken, &__block_literal_global_140);
  return (REFeature *)(id)siriActionPerformedCountFeature_SystemFeature;
}

+ (REFeature)sessionFeature
{
  if (sessionFeature_onceToken != -1)
    dispatch_once(&sessionFeature_onceToken, &__block_literal_global_83);
  return (REFeature *)(id)sessionFeature_SystemFeature;
}

+ (REFeature)recentSiriActionFeature
{
  if (recentSiriActionFeature_onceToken != -1)
    dispatch_once(&recentSiriActionFeature_onceToken, &__block_literal_global_89);
  return (REFeature *)(id)recentSiriActionFeature_SystemFeature;
}

+ (REFeature)nowPlayingStateFeature
{
  if (nowPlayingStateFeature_onceToken != -1)
    dispatch_once(&nowPlayingStateFeature_onceToken, &__block_literal_global_143);
  return (REFeature *)(id)nowPlayingStateFeature_SystemFeature;
}

+ (REFeature)noContentFeature
{
  if (noContentFeature_onceToken != -1)
    dispatch_once(&noContentFeature_onceToken, &__block_literal_global_65);
  return (REFeature *)(id)noContentFeature_SystemFeature;
}

+ (REFeature)motionFeature
{
  if (motionFeature_onceToken != -1)
    dispatch_once(&motionFeature_onceToken, &__block_literal_global_122);
  return (REFeature *)(id)motionFeature_SystemFeature;
}

+ (REFeature)currentlyPlayingMediaDonationFeature
{
  if (currentlyPlayingMediaDonationFeature_onceToken != -1)
    dispatch_once(&currentlyPlayingMediaDonationFeature_onceToken, &__block_literal_global_146);
  return (REFeature *)(id)currentlyPlayingMediaDonationFeature_SystemFeature;
}

+ (REFeature)currentlyPlayingFromAppFeature
{
  if (currentlyPlayingFromAppFeature_onceToken != -1)
    dispatch_once(&currentlyPlayingFromAppFeature_onceToken, &__block_literal_global_149);
  return (REFeature *)(id)currentlyPlayingFromAppFeature_SystemFeature;
}

+ (REFeature)dateOccursTodayFeature
{
  if (dateOccursTodayFeature_onceToken != -1)
    dispatch_once(&dateOccursTodayFeature_onceToken, &__block_literal_global_38_1);
  return (REFeature *)(id)dateOccursTodayFeature_SystemFeature;
}

+ (REFeature)conditionalFeature
{
  if (conditionalFeature_onceToken != -1)
    dispatch_once(&conditionalFeature_onceToken, &__block_literal_global_68);
  return (REFeature *)(id)conditionalFeature_SystemFeature;
}

+ (REFeature)bluetoothDeviceFeature
{
  if (bluetoothDeviceFeature_onceToken != -1)
    dispatch_once(&bluetoothDeviceFeature_onceToken, &__block_literal_global_191);
  return (REFeature *)(id)bluetoothDeviceFeature_SystemFeature;
}

+ (REFeature)activitySummaryFeature
{
  if (activitySummaryFeature_onceToken != -1)
    dispatch_once(&activitySummaryFeature_onceToken, &__block_literal_global_176);
  return (REFeature *)(id)activitySummaryFeature_SystemFeature;
}

+ (id)crossedFeatureWithFeatures:(id)a3
{
  id v3;
  void *v4;
  _RECrossedFeature *v5;

  v3 = a3;
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v5 = -[_RECrossedFeature initWithFeatures:]([_RECrossedFeature alloc], "initWithFeatures:", v4);

  return v5;
}

+ (REFeature)travelingFeature
{
  if (travelingFeature_onceToken != -1)
    dispatch_once(&travelingFeature_onceToken, &__block_literal_global_113);
  return (REFeature *)(id)travelingFeature_SystemFeature;
}

+ (REFeature)siriDomainFeature
{
  if (siriDomainFeature_onceToken != -1)
    dispatch_once(&siriDomainFeature_onceToken, &__block_literal_global_71);
  return (REFeature *)(id)siriDomainFeature_SystemFeature;
}

+ (REFeature)sectionFeature
{
  if (sectionFeature_onceToken != -1)
    dispatch_once(&sectionFeature_onceToken, &__block_literal_global_38);
  return (REFeature *)(id)sectionFeature_SystemFeature;
}

+ (REFeature)locationOfInterestFeature
{
  if (locationOfInterestFeature_onceToken != -1)
    dispatch_once(&locationOfInterestFeature_onceToken, &__block_literal_global_107);
  return (REFeature *)(id)locationOfInterestFeature_SystemFeature;
}

+ (REFeature)knownLocationOfInterestFeature
{
  if (knownLocationOfInterestFeature_onceToken != -1)
    dispatch_once(&knownLocationOfInterestFeature_onceToken, &__block_literal_global_110_0);
  return (REFeature *)(id)knownLocationOfInterestFeature_SystemFeature;
}

+ (REFeature)isWeekendFeature
{
  if (isWeekendFeature_onceToken != -1)
    dispatch_once(&isWeekendFeature_onceToken, &__block_literal_global_62);
  return (REFeature *)(id)isWeekendFeature_SystemFeature;
}

+ (REFeature)interactionFeature
{
  if (interactionFeature_onceToken != -1)
    dispatch_once(&interactionFeature_onceToken, &__block_literal_global_50);
  return (REFeature *)(id)interactionFeature_SystemFeature;
}

+ (REFeature)dayOfWeekFeature
{
  if (dayOfWeekFeature_onceToken != -1)
    dispatch_once(&dayOfWeekFeature_onceToken, &__block_literal_global_59_0);
  return (REFeature *)(id)dayOfWeekFeature_SystemFeature;
}

+ (REFeature)currentTimeFeature
{
  if (currentTimeFeature_onceToken != -1)
    dispatch_once(&currentTimeFeature_onceToken, &__block_literal_global_56);
  return (REFeature *)(id)currentTimeFeature_SystemFeature;
}

+ (REFeature)isStationaryFeature
{
  if (isStationaryFeature_onceToken != -1)
    dispatch_once(&isStationaryFeature_onceToken, &__block_literal_global_116);
  return (REFeature *)(id)isStationaryFeature_SystemFeature;
}

+ (REFeature)deviceMotionFeature
{
  if (deviceMotionFeature_onceToken != -1)
    dispatch_once(&deviceMotionFeature_onceToken, &__block_literal_global_119);
  return (REFeature *)(id)deviceMotionFeature_SystemFeature;
}

+ (REFeature)coreBehaviorTimePredictionFeature
{
  if (coreBehaviorTimePredictionFeature_onceToken != -1)
    dispatch_once(&coreBehaviorTimePredictionFeature_onceToken, &__block_literal_global_203);
  return (REFeature *)(id)coreBehaviorTimePredictionFeature_SystemFeature;
}

+ (REFeature)coreBehaviorTimeCoarsePredictionFeature
{
  if (coreBehaviorTimeCoarsePredictionFeature_onceToken != -1)
    dispatch_once(&coreBehaviorTimeCoarsePredictionFeature_onceToken, &__block_literal_global_206);
  return (REFeature *)(id)coreBehaviorTimeCoarsePredictionFeature_SystemFeature;
}

+ (REFeature)coreBehaviorLocationPredictionFeature
{
  if (coreBehaviorLocationPredictionFeature_onceToken != -1)
    dispatch_once(&coreBehaviorLocationPredictionFeature_onceToken, &__block_literal_global_215);
  return (REFeature *)(id)coreBehaviorLocationPredictionFeature_SystemFeature;
}

+ (REFeature)coreBehaviorLocationCoarsePredictionFeature
{
  if (coreBehaviorLocationCoarsePredictionFeature_onceToken != -1)
    dispatch_once(&coreBehaviorLocationCoarsePredictionFeature_onceToken, &__block_literal_global_218);
  return (REFeature *)(id)coreBehaviorLocationCoarsePredictionFeature_SystemFeature;
}

+ (REFeature)coreBehaviorDayPredictionFeature
{
  if (coreBehaviorDayPredictionFeature_onceToken != -1)
    dispatch_once(&coreBehaviorDayPredictionFeature_onceToken, &__block_literal_global_209);
  return (REFeature *)(id)coreBehaviorDayPredictionFeature_SystemFeature;
}

+ (REFeature)coreBehaviorDayCoarsePredictionFeature
{
  if (coreBehaviorDayCoarsePredictionFeature_onceToken != -1)
    dispatch_once(&coreBehaviorDayCoarsePredictionFeature_onceToken, &__block_literal_global_212);
  return (REFeature *)(id)coreBehaviorDayCoarsePredictionFeature_SystemFeature;
}

+ (REFeature)isConnectedToCarFeature
{
  if (isConnectedToCarFeature_onceToken != -1)
    dispatch_once(&isConnectedToCarFeature_onceToken, &__block_literal_global_185);
  return (REFeature *)(id)isConnectedToCarFeature_SystemFeature;
}

+ (REFeature)isConnectedToBluetoothSpeakerFeature
{
  if (isConnectedToBluetoothSpeakerFeature_onceToken != -1)
    dispatch_once(&isConnectedToBluetoothSpeakerFeature_onceToken, &__block_literal_global_188);
  return (REFeature *)(id)isConnectedToBluetoothSpeakerFeature_SystemFeature;
}

+ (REFeature)appUsageFeature
{
  if (appUsageFeature_onceToken != -1)
    dispatch_once(&appUsageFeature_onceToken, &__block_literal_global_53);
  return (REFeature *)(id)appUsageFeature_SystemFeature;
}

+ (REFeature)standHourCompletionFeature
{
  if (standHourCompletionFeature_onceToken != -1)
    dispatch_once(&standHourCompletionFeature_onceToken, &__block_literal_global_173);
  return (REFeature *)(id)standHourCompletionFeature_SystemFeature;
}

+ (REFeature)exerciseTimeCompletionFeature
{
  if (exerciseTimeCompletionFeature_onceToken != -1)
    dispatch_once(&exerciseTimeCompletionFeature_onceToken, &__block_literal_global_170);
  return (REFeature *)(id)exerciseTimeCompletionFeature_SystemFeature;
}

+ (REFeature)activeEnergyCompletionFeature
{
  if (activeEnergyCompletionFeature_onceToken != -1)
    dispatch_once(&activeEnergyCompletionFeature_onceToken, &__block_literal_global_167);
  return (REFeature *)(id)activeEnergyCompletionFeature_SystemFeature;
}

+ (REFeature)performedWorkoutCountFeature
{
  if (performedWorkoutCountFeature_onceToken != -1)
    dispatch_once(&performedWorkoutCountFeature_onceToken, &__block_literal_global_164_0);
  return (REFeature *)(id)performedWorkoutCountFeature_SystemFeature;
}

+ (REFeature)dailyAverageWorkoutCountFeature
{
  if (dailyAverageWorkoutCountFeature_onceToken != -1)
    dispatch_once(&dailyAverageWorkoutCountFeature_onceToken, &__block_literal_global_161);
  return (REFeature *)(id)dailyAverageWorkoutCountFeature_SystemFeature;
}

+ (REFeature)activeWorkoutFeature
{
  if (activeWorkoutFeature_onceToken != -1)
    dispatch_once(&activeWorkoutFeature_onceToken, &__block_literal_global_155);
  return (REFeature *)(id)activeWorkoutFeature_SystemFeature;
}

+ (REFeature)featureWithName:(id)a3 featureType:(unint64_t)a4
{
  id v5;
  _REConcreteFeature *v6;

  if (a3)
  {
    v5 = a3;
    v6 = -[_REConcreteFeature initWithName:featureType:]([_REConcreteFeature alloc], "initWithName:featureType:", v5, a4);

  }
  else
  {
    v6 = 0;
  }
  return (REFeature *)v6;
}

+ (id)transformedFeatureWithTransformer:(id)a3 features:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _RETransformedFeature *v22;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "_validateWithFeatures:", v6) & 1) == 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature Transformer %@ unable to support features %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  v13 = objc_msgSend(v5, "_featureCount");
  if (v13 != objc_msgSend(v6, "count"))
  {
    v14 = (void *)*MEMORY[0x24BDBCAB0];
    v15 = objc_msgSend(v5, "_featureCount");
    objc_msgSend(v6, "count");
    RERaiseInternalException(v14, CFSTR("Expected %lu number of features. Received %lu."), v16, v17, v18, v19, v20, v21, v15);
  }
  v22 = -[_RETransformedFeature initWithTransformer:features:]([_RETransformedFeature alloc], "initWithTransformer:features:", v5, v6);

  return v22;
}

- (id)featureByUsingTransformer:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  REFeature *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v4, v5, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return (NSString *)&stru_24CF92178;
}

- (unint64_t)featureType
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  REFeature *v4;
  REFeature *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  unint64_t v10;

  v4 = (REFeature *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[REFeature name](self, "name");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[REFeature name](v5, "name");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      v10 = -[REFeature featureType](self, "featureType");
      v9 = v10 == -[REFeature featureType](v5, "featureType");
      goto LABEL_10;
    }
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[REFeature name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[REFeature featureType](self, "featureType") ^ v4;

  return v5;
}

- (int64_t)_bitCount
{
  return -1;
}

- (id)_rootFeatures
{
  return +[REFeatureSet featureSet](REFeatureSet, "featureSet");
}

void __27__REFeature_sectionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("section"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sectionFeature_SystemFeature;
  sectionFeature_SystemFeature = v0;

}

void __30__REFeature_dataSourceFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("dataSource"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dataSourceFeature_SystemFeature;
  dataSourceFeature_SystemFeature = v0;

}

void __24__REFeature_dateFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("date"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dateFeature_SystemFeature;
  dateFeature_SystemFeature = v0;

}

void __35__REFeature_dateOccursTodayFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("dateOccursToday"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dateOccursTodayFeature_SystemFeature;
  dateOccursTodayFeature_SystemFeature = v0;

}

void __28__REFeature_locationFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("location"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)locationFeature_SystemFeature;
  locationFeature_SystemFeature = v0;

}

void __28__REFeature_geofenceFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("geofence"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)geofenceFeature_SystemFeature;
  geofenceFeature_SystemFeature = v0;

}

void __28__REFeature_priorityFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("priority"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)priorityFeature_SystemFeature;
  priorityFeature_SystemFeature = v0;

}

void __31__REFeature_interactionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("interaction"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interactionFeature_SystemFeature;
  interactionFeature_SystemFeature = v0;

}

void __28__REFeature_appUsageFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("appUsage"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appUsageFeature_SystemFeature;
  appUsageFeature_SystemFeature = v0;

}

void __31__REFeature_currentTimeFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("currentTime"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentTimeFeature_SystemFeature;
  currentTimeFeature_SystemFeature = v0;

}

void __29__REFeature_dayOfWeekFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("dayOfWeek"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dayOfWeekFeature_SystemFeature;
  dayOfWeekFeature_SystemFeature = v0;

}

void __29__REFeature_isWeekendFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("isWeekend"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isWeekendFeature_SystemFeature;
  isWeekendFeature_SystemFeature = v0;

}

void __29__REFeature_noContentFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("noContent"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)noContentFeature_SystemFeature;
  noContentFeature_SystemFeature = v0;

}

void __31__REFeature_conditionalFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("conditional"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conditionalFeature_SystemFeature;
  conditionalFeature_SystemFeature = v0;

}

void __30__REFeature_siriDomainFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("siriDomain"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siriDomainFeature_SystemFeature;
  siriDomainFeature_SystemFeature = v0;

}

void __26__REFeature_forcedFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("forced"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)forcedFeature_SystemFeature;
  forcedFeature_SystemFeature = v0;

}

void __32__REFeature_dailyRoutineFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("dailyRoutine"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dailyRoutineFeature_SystemFeature;
  dailyRoutineFeature_SystemFeature = v0;

}

void __36__REFeature_isInDailyRoutineFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("isInDailyRoutine"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isInDailyRoutineFeature_SystemFeature;
  isInDailyRoutineFeature_SystemFeature = v0;

}

void __27__REFeature_sessionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("session"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sessionFeature_SystemFeature;
  sessionFeature_SystemFeature = v0;

}

void __25__REFeature_groupFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("group"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)groupFeature_SystemFeature;
  groupFeature_SystemFeature = v0;

}

void __36__REFeature_recentSiriActionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("recentSiriAction"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)recentSiriActionFeature_SystemFeature;
  recentSiriActionFeature_SystemFeature = v0;

}

void __37__REFeature_sentimentAnalysisFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("sentimentAnalysis"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sentimentAnalysisFeature_SystemFeature;
  sentimentAnalysisFeature_SystemFeature = v0;

}

void __45__REFeature_negativeSentimentAnalysisFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("negativeSentimentAnalysis"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)negativeSentimentAnalysisFeature_SystemFeature;
  negativeSentimentAnalysisFeature_SystemFeature = v0;

}

void __46__REFeature_sentimentAnalysisCertaintyFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("sentimentAnalysisCertainty"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sentimentAnalysisCertaintyFeature_SystemFeature;
  sentimentAnalysisCertaintyFeature_SystemFeature = v0;

}

void __28__REFeature_portraitFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("portrait"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)portraitFeature_SystemFeature;
  portraitFeature_SystemFeature = v0;

}

+ (REFeature)relevanceThresholdFeature
{
  if (relevanceThresholdFeature_onceToken != -1)
    dispatch_once(&relevanceThresholdFeature_onceToken, &__block_literal_global_104);
  return (REFeature *)(id)relevanceThresholdFeature_SystemFeature;
}

void __38__REFeature_relevanceThresholdFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("relevanceThreshold"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)relevanceThresholdFeature_SystemFeature;
  relevanceThresholdFeature_SystemFeature = v0;

}

void __38__REFeature_locationOfInterestFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("locationOfInterest"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)locationOfInterestFeature_SystemFeature;
  locationOfInterestFeature_SystemFeature = v0;

}

void __43__REFeature_knownLocationOfInterestFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("knownLocationOfInterest"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownLocationOfInterestFeature_SystemFeature;
  knownLocationOfInterestFeature_SystemFeature = v0;

}

void __29__REFeature_travelingFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("traveling"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)travelingFeature_SystemFeature;
  travelingFeature_SystemFeature = v0;

}

void __32__REFeature_isStationaryFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("isStationary"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isStationaryFeature_SystemFeature;
  isStationaryFeature_SystemFeature = v0;

}

void __32__REFeature_deviceMotionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("deviceMotion"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deviceMotionFeature_SystemFeature;
  deviceMotionFeature_SystemFeature = v0;

}

void __26__REFeature_motionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("motion"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)motionFeature_SystemFeature;
  motionFeature_SystemFeature = v0;

}

+ (REFeature)itemIdentifierFeature
{
  if (itemIdentifierFeature_onceToken != -1)
    dispatch_once(&itemIdentifierFeature_onceToken, &__block_literal_global_125);
  return (REFeature *)(id)itemIdentifierFeature_SystemFeature;
}

void __34__REFeature_itemIdentifierFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("itemIdentifier"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)itemIdentifierFeature_SystemFeature;
  itemIdentifierFeature_SystemFeature = v0;

}

+ (REFeature)isSiriActionFeature
{
  if (isSiriActionFeature_onceToken != -1)
    dispatch_once(&isSiriActionFeature_onceToken, &__block_literal_global_128);
  return (REFeature *)(id)isSiriActionFeature_SystemFeature;
}

void __32__REFeature_isSiriActionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("isSiriAction"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isSiriActionFeature_SystemFeature;
  isSiriActionFeature_SystemFeature = v0;

}

+ (REFeature)isDeveloperDonationFeature
{
  if (isDeveloperDonationFeature_onceToken != -1)
    dispatch_once(&isDeveloperDonationFeature_onceToken, &__block_literal_global_131);
  return (REFeature *)(id)isDeveloperDonationFeature_SystemFeature;
}

void __39__REFeature_isDeveloperDonationFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("isDeveloperDonation"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isDeveloperDonationFeature_SystemFeature;
  isDeveloperDonationFeature_SystemFeature = v0;

}

+ (REFeature)siriActionHasRelevanceProvidersFeature
{
  if (siriActionHasRelevanceProvidersFeature_onceToken != -1)
    dispatch_once(&siriActionHasRelevanceProvidersFeature_onceToken, &__block_literal_global_134);
  return (REFeature *)(id)siriActionHasRelevanceProvidersFeature_SystemFeature;
}

void __51__REFeature_siriActionHasRelevanceProvidersFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("siriActionHasRelevanceProviders"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siriActionHasRelevanceProvidersFeature_SystemFeature;
  siriActionHasRelevanceProvidersFeature_SystemFeature = v0;

}

+ (REFeature)siriActionDailyAveragePerformedCountFeature
{
  if (siriActionDailyAveragePerformedCountFeature_onceToken != -1)
    dispatch_once(&siriActionDailyAveragePerformedCountFeature_onceToken, &__block_literal_global_137);
  return (REFeature *)(id)siriActionDailyAveragePerformedCountFeature_SystemFeature;
}

void __56__REFeature_siriActionDailyAveragePerformedCountFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("siriActionDailyAveragePerformedCount"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siriActionDailyAveragePerformedCountFeature_SystemFeature;
  siriActionDailyAveragePerformedCountFeature_SystemFeature = v0;

}

void __44__REFeature_siriActionPerformedCountFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("siriActionPerformedCount"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siriActionPerformedCountFeature_SystemFeature;
  siriActionPerformedCountFeature_SystemFeature = v0;

}

void __35__REFeature_nowPlayingStateFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("nowPlayingState"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nowPlayingStateFeature_SystemFeature;
  nowPlayingStateFeature_SystemFeature = v0;

}

void __49__REFeature_currentlyPlayingMediaDonationFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("currentlyPlayingMediaDonation"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentlyPlayingMediaDonationFeature_SystemFeature;
  currentlyPlayingMediaDonationFeature_SystemFeature = v0;

}

void __43__REFeature_currentlyPlayingFromAppFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("currentlyPlayingFromApp"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentlyPlayingFromAppFeature_SystemFeature;
  currentlyPlayingFromAppFeature_SystemFeature = v0;

}

+ (REFeature)siriActionRoleFeature
{
  if (siriActionRoleFeature_onceToken != -1)
    dispatch_once(&siriActionRoleFeature_onceToken, &__block_literal_global_152);
  return (REFeature *)(id)siriActionRoleFeature_SystemFeature;
}

void __34__REFeature_siriActionRoleFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("siriActionRole"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siriActionRoleFeature_SystemFeature;
  siriActionRoleFeature_SystemFeature = v0;

}

void __33__REFeature_activeWorkoutFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("activeWorkout"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activeWorkoutFeature_SystemFeature;
  activeWorkoutFeature_SystemFeature = v0;

}

void __32__REFeature_workoutStateFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("workoutState"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)workoutStateFeature_SystemFeature;
  workoutStateFeature_SystemFeature = v0;

}

void __44__REFeature_dailyAverageWorkoutCountFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("dailyAverageWorkoutCount"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dailyAverageWorkoutCountFeature_SystemFeature;
  dailyAverageWorkoutCountFeature_SystemFeature = v0;

}

void __41__REFeature_performedWorkoutCountFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("performedWorkoutCount"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)performedWorkoutCountFeature_SystemFeature;
  performedWorkoutCountFeature_SystemFeature = v0;

}

void __42__REFeature_activeEnergyCompletionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("activeEnergyCompletion"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activeEnergyCompletionFeature_SystemFeature;
  activeEnergyCompletionFeature_SystemFeature = v0;

}

void __42__REFeature_exerciseTimeCompletionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("exerciseTimeCompletion"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exerciseTimeCompletionFeature_SystemFeature;
  exerciseTimeCompletionFeature_SystemFeature = v0;

}

void __39__REFeature_standHourCompletionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("standHourCompletion"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)standHourCompletionFeature_SystemFeature;
  standHourCompletionFeature_SystemFeature = v0;

}

void __35__REFeature_activitySummaryFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("activitySummary"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activitySummaryFeature_SystemFeature;
  activitySummaryFeature_SystemFeature = v0;

}

+ (REFeature)bulletinFeature
{
  if (bulletinFeature_onceToken != -1)
    dispatch_once(&bulletinFeature_onceToken, &__block_literal_global_179);
  return (REFeature *)(id)bulletinFeature_SystemFeature;
}

void __28__REFeature_bulletinFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("bulletin"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bulletinFeature_SystemFeature;
  bulletinFeature_SystemFeature = v0;

}

+ (REFeature)companionAppUsageFeature
{
  if (companionAppUsageFeature_onceToken != -1)
    dispatch_once(&companionAppUsageFeature_onceToken, &__block_literal_global_182);
  return (REFeature *)(id)companionAppUsageFeature_SystemFeature;
}

void __37__REFeature_companionAppUsageFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("companionAppUsage"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)companionAppUsageFeature_SystemFeature;
  companionAppUsageFeature_SystemFeature = v0;

}

void __36__REFeature_isConnectedToCarFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("isConnectedToCar"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isConnectedToCarFeature_SystemFeature;
  isConnectedToCarFeature_SystemFeature = v0;

}

void __49__REFeature_isConnectedToBluetoothSpeakerFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("isConnectedToBluetoothSpeaker"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isConnectedToBluetoothSpeakerFeature_SystemFeature;
  isConnectedToBluetoothSpeakerFeature_SystemFeature = v0;

}

void __35__REFeature_bluetoothDeviceFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("bluetoothDevice"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bluetoothDeviceFeature_SystemFeature;
  bluetoothDeviceFeature_SystemFeature = v0;

}

+ (REFeature)coreBehaviorShortcutTypeFeature
{
  if (coreBehaviorShortcutTypeFeature_onceToken != -1)
    dispatch_once(&coreBehaviorShortcutTypeFeature_onceToken, &__block_literal_global_194);
  return (REFeature *)(id)coreBehaviorShortcutTypeFeature_SystemFeature;
}

void __44__REFeature_coreBehaviorShortcutTypeFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorShortcutType"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorShortcutTypeFeature_SystemFeature;
  coreBehaviorShortcutTypeFeature_SystemFeature = v0;

}

+ (REFeature)coreBehaviorEventIdentifierHashFeature
{
  if (coreBehaviorEventIdentifierHashFeature_onceToken != -1)
    dispatch_once(&coreBehaviorEventIdentifierHashFeature_onceToken, &__block_literal_global_197);
  return (REFeature *)(id)coreBehaviorEventIdentifierHashFeature_SystemFeature;
}

void __51__REFeature_coreBehaviorEventIdentifierHashFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorEventIdentifierHash"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorEventIdentifierHashFeature_SystemFeature;
  coreBehaviorEventIdentifierHashFeature_SystemFeature = v0;

}

+ (REFeature)coreBehaviorAppIdentifierHashFeature
{
  if (coreBehaviorAppIdentifierHashFeature_onceToken != -1)
    dispatch_once(&coreBehaviorAppIdentifierHashFeature_onceToken, &__block_literal_global_200);
  return (REFeature *)(id)coreBehaviorAppIdentifierHashFeature_SystemFeature;
}

void __49__REFeature_coreBehaviorAppIdentifierHashFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorAppIdentifierHash"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorAppIdentifierHashFeature_SystemFeature;
  coreBehaviorAppIdentifierHashFeature_SystemFeature = v0;

}

void __46__REFeature_coreBehaviorTimePredictionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorTimePrediction"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorTimePredictionFeature_SystemFeature;
  coreBehaviorTimePredictionFeature_SystemFeature = v0;

}

void __52__REFeature_coreBehaviorTimeCoarsePredictionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorTimeCoarsePrediction"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorTimeCoarsePredictionFeature_SystemFeature;
  coreBehaviorTimeCoarsePredictionFeature_SystemFeature = v0;

}

void __45__REFeature_coreBehaviorDayPredictionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorDayPrediction"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorDayPredictionFeature_SystemFeature;
  coreBehaviorDayPredictionFeature_SystemFeature = v0;

}

void __51__REFeature_coreBehaviorDayCoarsePredictionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorDayCoarsePrediction"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorDayCoarsePredictionFeature_SystemFeature;
  coreBehaviorDayCoarsePredictionFeature_SystemFeature = v0;

}

void __50__REFeature_coreBehaviorLocationPredictionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorLocationPrediction"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorLocationPredictionFeature_SystemFeature;
  coreBehaviorLocationPredictionFeature_SystemFeature = v0;

}

void __56__REFeature_coreBehaviorLocationCoarsePredictionFeature__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", CFSTR("coreBehaviorLocationCoarsePrediction"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)coreBehaviorLocationCoarsePredictionFeature_SystemFeature;
  coreBehaviorLocationCoarsePredictionFeature_SystemFeature = v0;

}

+ (id)systemFeatureNames
{
  if (systemFeatureNames_onceToken != -1)
    dispatch_once(&systemFeatureNames_onceToken, &__block_literal_global_221);
  return (id)systemFeatureNames_FeatureNames;
}

void __31__REFeature_systemFeatureNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CFC1D18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemFeatureNames_FeatureNames;
  systemFeatureNames_FeatureNames = v0;

}

+ (id)featuresFromSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[REScriptProcessor processorWithSource:](REScriptProcessor, "processorWithSource:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)featuresFromSource:(id)a3 withNames:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  +[REScriptProcessor processorWithSource:](REScriptProcessor, "processorWithSource:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "featuresWithNames:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)featuresFromSourceAtPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[REScriptProcessor processorWithPath:](REScriptProcessor, "processorWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)featuresFromSourceAtPath:(id)a3 withNames:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  +[REScriptProcessor processorWithPath:](REScriptProcessor, "processorWithPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "featuresWithNames:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
