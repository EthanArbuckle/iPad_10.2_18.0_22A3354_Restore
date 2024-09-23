@implementation MOSummarizationParameters

- (MOSummarizationParameters)initWithConfigurationManager:(id)a3
{
  id v6;
  MOSummarizationParameters *v7;
  MOSummarizationParameters *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  double v43;
  float v44;
  double v45;
  float v46;
  double v47;
  float v48;
  double v49;
  float v50;
  double v51;
  float v52;
  double v53;
  float v54;
  double v55;
  float v56;
  double v57;
  float v58;
  double v59;
  float v60;
  MOSummarizationParameters *v61;
  id os_log;
  NSObject *v63;
  void *v64;
  objc_super v66;

  v6 = a3;
  if (v6)
  {
    v66.receiver = self;
    v66.super_class = (Class)MOSummarizationParameters;
    v7 = -[MOSummarizationParameters init](&v66, "init");
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_configurationManager, a3);
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_DominantBundleOverlappingThreshold"), 0.7);
      *(float *)&v9 = v9;
      v8->_dominantBundle_overlappingThreshold = *(float *)&v9;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_DominantBundleMainActionSelectionThreshold"), 0.6);
      *(float *)&v10 = v10;
      v8->_dominantBundle_mainActionSelectionThreshold = *(float *)&v10;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_DominantBundleMediaPlaySessionDominantFactorThreshold"), 0.8);
      *(float *)&v11 = v11;
      v8->_dominantBundle_mediaPlaySessionDominantFactorThreshold = *(float *)&v11;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_DominantBundleMediaPlaySessionsOverlapsMinimumDistance"), 0.5);
      *(float *)&v12 = v12;
      v8->_dominantBundle_mediaPlaySessionsOverlapsMinimumDistance = *(float *)&v12;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Media_FirstPartyAppOverThirdPartyPlayTimePercentageThreshold"), 0.05);
      *(float *)&v13 = v13;
      v8->_mediaBundleFirstPartyPlayTimePercentageThreshold = *(float *)&v13;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_MediaBundleMinimumTotalPlayTimeThreshold"), 60.0);
      *(float *)&v14 = v14;
      v8->_mediaBundleMinimumTotalPlayTimeThreshold = *(float *)&v14;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_DominantBundleSuppressMediaBundleComparedWithActivityBundleThreshold"), 0.8);
      *(float *)&v15 = v15;
      v8->_dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold = *(float *)&v15;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_DominantBundleSuppressMediaBundleComparedWithHomeBundleThreshold"), 0.8);
      *(float *)&v16 = v16;
      v8->_dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold = *(float *)&v16;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityOutingBundlesAggregationDistanceThreshold"), 1000.0);
      *(float *)&v17 = v17;
      v8->_fineGranularity_outingBundlesAggregationDistanceThreshold = *(float *)&v17;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityOutingBundlesAggregationTimeIntervalThreshold"), 900.0);
      *(float *)&v18 = v18;
      v8->_fineGranularity_outingBundlesAggregationTimeIntervalThreshold = *(float *)&v18;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityOutingBundlesAggregationDistanceToClusterThreshold"), 1500.0);
      *(float *)&v19 = v19;
      v8->_fineGranularity_outingBundlesAggregationDistanceToClusterThreshold = *(float *)&v19;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityActivityBundlesAggregationTimeIntervalThreshold"), 600.0);
      *(float *)&v20 = v20;
      v8->_fineGranularity_activityBundlesAggregationTimeIntervalThreshold = *(float *)&v20;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityActivityBundlesDropForDurationThreshold"), 0.8);
      *(float *)&v21 = v21;
      v8->_fineGranularity_activityBundlesDropForDurationThreshold = *(float *)&v21;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityOutingBundlesAggregationDistanceThreshold"), 5000.0);
      *(float *)&v22 = v22;
      v8->_coarseGranularity_outingBundlesAggregationDistanceThreshold = *(float *)&v22;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityOutingBundlesAggregationTimeIntervalThreshold"), 3600.0);
      *(float *)&v23 = v23;
      v8->_coarseGranularity_outingBundlesAggregationTimeIntervalThreshold = *(float *)&v23;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityOutingBundlesAggregationDistanceToClusterThreshold"), 8000.0);
      *(float *)&v24 = v24;
      v8->_coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold = *(float *)&v24;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_MegaBundleDurationThresholdForAddingTimePrefix"), 18000.0);
      *(float *)&v25 = v25;
      v8->_megaBundleDurationThresholdForAddingTimePrefix = *(float *)&v25;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityContactMegaBundleLookBackDays"), 7.0);
      *(float *)&v26 = v26;
      v8->_coarseGranularity_contactMegaBundleLookBackDays = *(float *)&v26;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityContactBundleAggregationCallCountThreshold"), 1.0);
      *(float *)&v27 = v27;
      v8->_coarseGranularity_contactBundleAggregationCallCountThreshold = *(float *)&v27;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityContactBundleAggregationCallDurationThreshold"), 300.0);
      *(float *)&v28 = v28;
      v8->_coarseGranularity_contactBundleAggregationCallDurationThreshold = *(float *)&v28;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityContactBundleAggregationMessageCountThreshold"), 5.0);
      *(float *)&v29 = v29;
      v8->_coarseGranularity_contactBundleAggregationMessageCountThreshold = *(float *)&v29;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityContactBundleAggregationOutGoingMessageCountThreshold"), 3.0);
      *(float *)&v30 = v30;
      v8->_coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold = *(float *)&v30;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityMediaBundleAggregationPodcastPlayTimePercentageThreshold"), 0.7);
      *(float *)&v31 = v31;
      v8->_coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold = *(float *)&v31;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityMediaBundleAggregationPodcastTotalPlayTimeThreshold"), 600.0);
      *(float *)&v32 = v32;
      v8->_coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold = *(float *)&v32;
      -[MOConfigurationManagerBase getDoubleSettingForKey:withFallback:](v8->_configurationManager, "getDoubleSettingForKey:withFallback:", CFSTR("Summarization_MediaBundleMaxResourcesPerBundle"), 26.0);
      v8->_mediaBundleMaxResourcesPerBundle = (uint64_t)v33;
      LODWORD(v33) = 1039516303;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityOutingBundlesExclusionGoodnessScoreThreshold"), v33);
      v8->_fineGranularity_outingBundlesExclusionGoodnessScoreThreshold = v34;
      LODWORD(v35) = 1036831949;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityOutingBundlesAggregationGoodnessScoreDeltaThreshold"), v35);
      v8->_fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = v36;
      LODWORD(v37) = 1039516303;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityOutingBundlesExclusionGoodnessScoreThreshold"), v37);
      v8->_coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold = v38;
      LODWORD(v39) = 1036831949;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_CoarseGranularityOutingBundlesAggregationGoodnessScoreDeltaThreshold"), v39);
      v8->_coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = v40;
      LODWORD(v41) = 1128792064;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityTransitBundlesDestinationOneWayRouteMinimumDistanceThreshold"), v41);
      v8->_fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold = v42;
      LODWORD(v43) = 1128792064;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityTransitBundlesDestinationMaximumDistanceThreshold"), v43);
      v8->_fineGranularity_transitBundlesDestinationMaximumDistanceThreshold = v44;
      LODWORD(v45) = 1142292480;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityTransitBundlesDestinationMaximumTimeThresholdPedestrian"), v45);
      v8->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian = v46;
      LODWORD(v47) = 1133903872;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityTransitBundlesDestinationMaximumTimeThresholdCycle"), v47);
      v8->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle = v48;
      LODWORD(v49) = 1142292480;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_FineGranularityTransitBundlesWorkoutMinimumDuration"), v49);
      v8->_fineGranularity_transitBundlesWorkoutMinimumDuration = v50;
      LODWORD(v51) = 1153138688;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_MotionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel"), v51);
      v8->_motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel = v52;
      LODWORD(v53) = 1163984896;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_MotionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace"), v53);
      v8->_motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace = v54;
      LODWORD(v55) = 1137180672;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_MotionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap"), v55);
      v8->_motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap = v56;
      LODWORD(v57) = 1041194025;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Summarization_ActivitySummarySuppressionGoodnessScoreThreshold"), v57);
      v8->_activitySummary_suppressionGoodnessScoreThreshold = v58;
      LODWORD(v59) = 1180762112;
      -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v8->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("EmotionAttachmentSummaryBundleDurationThreshold"), v59);
      v8->_emotionAttachmentBundleDurationThreshold = v60;
    }
    self = v8;
    v61 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v63 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      -[MOSummarizationParameters initWithConfigurationManager:].cold.1(v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSummarizationParameters.m"), 135, CFSTR("Invalid parameter not satisfying: configurationManager"));

    v61 = 0;
  }

  return v61;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (float)dominantBundle_overlappingThreshold
{
  return self->_dominantBundle_overlappingThreshold;
}

- (void)setDominantBundle_overlappingThreshold:(float)a3
{
  self->_dominantBundle_overlappingThreshold = a3;
}

- (float)dominantBundle_mainActionSelectionThreshold
{
  return self->_dominantBundle_mainActionSelectionThreshold;
}

- (void)setDominantBundle_mainActionSelectionThreshold:(float)a3
{
  self->_dominantBundle_mainActionSelectionThreshold = a3;
}

- (float)dominantBundle_mediaPlaySessionDominantFactorThreshold
{
  return self->_dominantBundle_mediaPlaySessionDominantFactorThreshold;
}

- (void)setDominantBundle_mediaPlaySessionDominantFactorThreshold:(float)a3
{
  self->_dominantBundle_mediaPlaySessionDominantFactorThreshold = a3;
}

- (float)dominantBundle_mediaPlaySessionsOverlapsMinimumDistance
{
  return self->_dominantBundle_mediaPlaySessionsOverlapsMinimumDistance;
}

- (void)setDominantBundle_mediaPlaySessionsOverlapsMinimumDistance:(float)a3
{
  self->_dominantBundle_mediaPlaySessionsOverlapsMinimumDistance = a3;
}

- (float)dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold
{
  return self->_dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold;
}

- (void)setDominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold:(float)a3
{
  self->_dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold = a3;
}

- (float)dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold
{
  return self->_dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold;
}

- (void)setDominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold:(float)a3
{
  self->_dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationDistanceThreshold
{
  return self->_fineGranularity_outingBundlesAggregationDistanceThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationDistanceThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationDistanceThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationTimeIntervalThreshold
{
  return self->_fineGranularity_outingBundlesAggregationTimeIntervalThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationTimeIntervalThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationTimeIntervalThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationDistanceToClusterThreshold
{
  return self->_fineGranularity_outingBundlesAggregationDistanceToClusterThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationDistanceToClusterThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationDistanceToClusterThreshold = a3;
}

- (float)fineGranularity_activityBundlesAggregationTimeIntervalThreshold
{
  return self->_fineGranularity_activityBundlesAggregationTimeIntervalThreshold;
}

- (void)setFineGranularity_activityBundlesAggregationTimeIntervalThreshold:(float)a3
{
  self->_fineGranularity_activityBundlesAggregationTimeIntervalThreshold = a3;
}

- (float)fineGranularity_activityBundlesDropForDurationThreshold
{
  return self->_fineGranularity_activityBundlesDropForDurationThreshold;
}

- (void)setFineGranularity_activityBundlesDropForDurationThreshold:(float)a3
{
  self->_fineGranularity_activityBundlesDropForDurationThreshold = a3;
}

- (float)fineGranularity_outingBundlesExclusionGoodnessScoreThreshold
{
  return self->_fineGranularity_outingBundlesExclusionGoodnessScoreThreshold;
}

- (void)setFineGranularity_outingBundlesExclusionGoodnessScoreThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesExclusionGoodnessScoreThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold
{
  return self->_fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = a3;
}

- (float)fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold
{
  return self->_fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold;
}

- (void)setFineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold = a3;
}

- (float)fineGranularity_transitBundlesDestinationMaximumDistanceThreshold
{
  return self->_fineGranularity_transitBundlesDestinationMaximumDistanceThreshold;
}

- (void)setFineGranularity_transitBundlesDestinationMaximumDistanceThreshold:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationMaximumDistanceThreshold = a3;
}

- (float)fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian
{
  return self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian;
}

- (void)setFineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian = a3;
}

- (float)fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle
{
  return self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle;
}

- (void)setFineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle = a3;
}

- (float)fineGranularity_transitBundlesWorkoutMinimumDuration
{
  return self->_fineGranularity_transitBundlesWorkoutMinimumDuration;
}

- (void)setFineGranularity_transitBundlesWorkoutMinimumDuration:(float)a3
{
  self->_fineGranularity_transitBundlesWorkoutMinimumDuration = a3;
}

- (float)motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel
{
  return self->_motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel;
}

- (void)setMotionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel:(float)a3
{
  self->_motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel = a3;
}

- (float)motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace
{
  return self->_motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace;
}

- (void)setMotionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace:(float)a3
{
  self->_motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace = a3;
}

- (float)motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap
{
  return self->_motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap;
}

- (void)setMotionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap:(float)a3
{
  self->_motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap = a3;
}

- (float)coarseGranularity_outingBundlesAggregationDistanceThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationDistanceThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationDistanceThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationDistanceThreshold = a3;
}

- (float)coarseGranularity_outingBundlesAggregationTimeIntervalThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationTimeIntervalThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationTimeIntervalThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationTimeIntervalThreshold = a3;
}

- (float)coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationDistanceToClusterThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold = a3;
}

- (float)coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold
{
  return self->_coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold;
}

- (void)setCoarseGranularity_outingBundlesExclusionGoodnessScoreThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold = a3;
}

- (float)coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = a3;
}

- (float)megaBundleDurationThresholdForAddingTimePrefix
{
  return self->_megaBundleDurationThresholdForAddingTimePrefix;
}

- (void)setMegaBundleDurationThresholdForAddingTimePrefix:(float)a3
{
  self->_megaBundleDurationThresholdForAddingTimePrefix = a3;
}

- (NSDateInterval)aggregationDateInterval
{
  return self->_aggregationDateInterval;
}

- (void)setAggregationDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_aggregationDateInterval, a3);
}

- (float)coarseGranularity_contactMegaBundleLookBackDays
{
  return self->_coarseGranularity_contactMegaBundleLookBackDays;
}

- (void)setCoarseGranularity_contactMegaBundleLookBackDays:(float)a3
{
  self->_coarseGranularity_contactMegaBundleLookBackDays = a3;
}

- (float)coarseGranularity_contactBundleAggregationCallCountThreshold
{
  return self->_coarseGranularity_contactBundleAggregationCallCountThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationCallCountThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationCallCountThreshold = a3;
}

- (float)coarseGranularity_contactBundleAggregationCallDurationThreshold
{
  return self->_coarseGranularity_contactBundleAggregationCallDurationThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationCallDurationThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationCallDurationThreshold = a3;
}

- (float)coarseGranularity_contactBundleAggregationMessageCountThreshold
{
  return self->_coarseGranularity_contactBundleAggregationMessageCountThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationMessageCountThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationMessageCountThreshold = a3;
}

- (float)coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold
{
  return self->_coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold = a3;
}

- (float)coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold
{
  return self->_coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold;
}

- (void)setCoarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold:(float)a3
{
  self->_coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold = a3;
}

- (float)coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold
{
  return self->_coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold;
}

- (void)setCoarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold:(float)a3
{
  self->_coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold = a3;
}

- (int64_t)mediaBundleMaxResourcesPerBundle
{
  return self->_mediaBundleMaxResourcesPerBundle;
}

- (void)setMediaBundleMaxResourcesPerBundle:(int64_t)a3
{
  self->_mediaBundleMaxResourcesPerBundle = a3;
}

- (float)activitySummary_suppressionGoodnessScoreThreshold
{
  return self->_activitySummary_suppressionGoodnessScoreThreshold;
}

- (void)setActivitySummary_suppressionGoodnessScoreThreshold:(float)a3
{
  self->_activitySummary_suppressionGoodnessScoreThreshold = a3;
}

- (float)mediaBundleFirstPartyPlayTimePercentageThreshold
{
  return self->_mediaBundleFirstPartyPlayTimePercentageThreshold;
}

- (void)setMediaBundleFirstPartyPlayTimePercentageThreshold:(float)a3
{
  self->_mediaBundleFirstPartyPlayTimePercentageThreshold = a3;
}

- (float)mediaBundleMinimumTotalPlayTimeThreshold
{
  return self->_mediaBundleMinimumTotalPlayTimeThreshold;
}

- (void)setMediaBundleMinimumTotalPlayTimeThreshold:(float)a3
{
  self->_mediaBundleMinimumTotalPlayTimeThreshold = a3;
}

- (float)emotionAttachmentBundleDurationThreshold
{
  return self->_emotionAttachmentBundleDurationThreshold;
}

- (void)setEmotionAttachmentBundleDurationThreshold:(float)a3
{
  self->_emotionAttachmentBundleDurationThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationDateInterval, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (void)initWithConfigurationManager:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configurationManager", v1, 2u);
}

@end
