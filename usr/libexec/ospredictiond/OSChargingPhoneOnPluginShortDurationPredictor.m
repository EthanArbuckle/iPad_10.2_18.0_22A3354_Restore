@implementation OSChargingPhoneOnPluginShortDurationPredictor

- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  _BOOL4 v27;
  BOOL v28;
  OSChargingTwoStagePredictorQueryResult *result;
  int v30;
  void *v31;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = (void *)os_transaction_create("com.apple.osintelligence.smartcharging.mlmodelpredictor.decision");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Getting predictions for short duration or not, with on plugin model", (uint8_t *)&v30, 2u);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingTwoStagePredictor getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:](self, "getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:", v15, v14, v13, a6));

  *(_QWORD *)&retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0xC0F869F000000000);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OSChargingPhoneOnPluginPredictor engageOnPluginModel](self, "engageOnPluginModel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "predictionFromFeatures:error:", v17, 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "featureValueForName:", CFSTR("classProbability")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dictionaryValue"));

  v22 = v13;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
    v30 = 138412290;
    v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "On plugin engagement model raw output %@", (uint8_t *)&v30, 0xCu);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", &off_100064CE8));
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  retstr->var2 = v26;
  v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v26 <= 0.7125)
  {
    if (v27)
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Engagement model says we are in a short charging duration.", (uint8_t *)&v30, 2u);
    }
    v28 = 1;
  }
  else
  {
    if (v27)
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Engagement model says we are not in a short charging duration.", (uint8_t *)&v30, 2u);
    }
    v28 = 0;
  }
  retstr->var0 = v28;

  return result;
}

@end
