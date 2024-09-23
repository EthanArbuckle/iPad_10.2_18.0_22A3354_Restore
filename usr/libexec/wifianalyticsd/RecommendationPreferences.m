@implementation RecommendationPreferences

+ (id)sharedObject
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C9D8;
  block[3] = &unk_1000CCD10;
  block[4] = a1;
  if (qword_1000ED060 != -1)
    dispatch_once(&qword_1000ED060, block);
  return (id)qword_1000ED058;
}

- (RecommendationPreferences)init
{
  RecommendationPreferences *v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  RecommendationPreferences *v8;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  NSObject *v17;

  v11.receiver = self;
  v11.super_class = (Class)RecommendationPreferences;
  v2 = -[RecommendationPreferences init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject persistentDomainForName:](v3, "persistentDomainForName:", CFSTR("com.apple.wifianalyticsd")));
    v5 = WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RecommendationPreferences init]";
      v14 = 1024;
      v15 = 167;
      v16 = 2112;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RecommendationPreferences defaults %@", buf, 0x1Cu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("disable_recommendation_engine"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("disable_dps_wd"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E00E0, CFSTR("minutes_between_dps_wd"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E00F8, CFSTR("dps_wd_cca"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0110, CFSTR("dps_stall_dur_for_wd"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0128, CFSTR("dps_capture_evaluated_at_sample"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0140, CFSTR("dps_trap_evaluated_at_sample"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0140, CFSTR("dps_interrogation_sample_count"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0158, CFSTR("dps_duration_between_samples"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0170, CFSTR("dps_report_sent_after"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("force_dps_recommend_always"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0140, CFSTR("dns_symptoms_trap_evaluated_at_sample"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0188, CFSTR("dns_symptoms_interrogation_sample_count"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0158, CFSTR("dns_symptoms_duration_between_samples_before_trap"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E01A0, CFSTR("dns_symptoms_duration_between_samples_after_trap"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("disable_fast_dps_wd"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("disable_fast_dps_validation_for_test"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E01B8, CFSTR("minutes_between_fast_dps_wd_screen_on"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E01B8, CFSTR("minutes_between_fast_dps_wd_screen_off"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E01D0, CFSTR("prediction_probability_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E00F8, CFSTR("prediction_probability_threshold_macos"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E01E8, CFSTR("reset_cca_bin_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0200, CFSTR("minutes_between_symptoms_dps_wd_screen_on"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0200, CFSTR("minutes_between_symptoms_dps_wd_screen_off"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0218, CFSTR("minutes_between_peer_diagnostics_trigger_for_dns_stall"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0218, CFSTR("minutes_between_peer_diagnostics_trigger_for_other_issues"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0230, CFSTR("reset_score_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0248, CFSTR("dps_symptoms_average_cca_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0260, CFSTR("reset_pd_rssi_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E00F8, CFSTR("reset_pd_cca_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0278, CFSTR("reset_legacy_chipset_cca_bin_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0290, CFSTR("reset_rssi_bin_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E02A8, CFSTR("reset_awdl_activity_threshold"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("disable_slow_wifi_wd"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0218, CFSTR("minutes_between_slow_wifi_wd"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E02C0, CFSTR("slow_wifi_interrogation_sample_count"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E02D8, CFSTR("slow_wifi_duration_between_samples"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E02F0, CFSTR("slow_wifi_report_sent_after"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("disable_slow_wifi_dps_is_priority_network"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0308, CFSTR("ior_rescan_budget_less_than_previous_max_channels_seconds"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0320, CFSTR("ior_rescan_budget_exploratory_seconds"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0218, CFSTR("ior_rescan_new_phy_delay_seconds"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0338, CFSTR("ior_persist_delay_seconds"));
    objc_msgSend(v7, "setObject:forKey:", &off_1000E0320, CFSTR("work_report_seconds"));
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("work_report_logs_enabled"));
    -[NSObject setPersistentDomain:forName:](v3, "setPersistentDomain:forName:", v4, CFSTR("com.apple.wifianalyticsd"));
    -[NSObject registerDefaults:](v3, "registerDefaults:", v7);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_recommendation_engine"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_dps_wd"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_dps_wd"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_wd_cca"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_stall_dur_for_wd"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_capture_evaluated_at_sample"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_trap_evaluated_at_sample"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_interrogation_sample_count"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_duration_between_samples"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_report_sent_after"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("force_dps_recommend_always"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dns_symptoms_trap_evaluated_at_sample"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dns_symptoms_interrogation_sample_count"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dns_symptoms_duration_between_samples_before_trap"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dns_symptoms_duration_between_samples_after_trap"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_fast_dps_wd"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_fast_dps_validation_for_test"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_fast_dps_wd_screen_on"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_fast_dps_wd_screen_off"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("prediction_probability_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("prediction_probability_threshold_macos"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("reset_cca_bin_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("reset_score_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("dps_symptoms_average_cca_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("reset_pd_rssi_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("reset_pd_cca_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_symptoms_dps_wd_screen_on"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_symptoms_dps_wd_screen_off"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_peer_diagnostics_trigger_for_dns_stall"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_peer_diagnostics_trigger_for_other_issues"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("reset_legacy_chipset_cca_bin_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("reset_rssi_bin_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("reset_awdl_activity_threshold"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_slow_wifi_wd"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("minutes_between_slow_wifi_wd"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("slow_wifi_interrogation_sample_count"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("slow_wifi_duration_between_samples"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("slow_wifi_report_sent_after"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_slow_wifi_dps_is_priority_network"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("ior_rescan_budget_less_than_previous_max_channels_seconds"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("ior_rescan_budget_exploratory_seconds"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("ior_rescan_new_phy_delay_seconds"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("ior_persist_delay_seconds"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("work_report_seconds"), 5, 0);
    -[NSObject addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("work_report_logs_enabled"), 5, 0);
    v8 = v2;

  }
  else
  {
    v10 = WALogCategoryDefaultHandle();
    v3 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[RecommendationPreferences init]";
      v14 = 1024;
      v15 = 163;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_recommendation_engine"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_dps_wd"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_dps_wd"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_wd_cca"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_stall_dur_for_wd"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_capture_evaluated_at_sample"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_trap_evaluated_at_sample"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_interrogation_sample_count"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_duration_between_samples"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_report_sent_after"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("force_dps_recommend_always"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dns_symptoms_trap_evaluated_at_sample"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dns_symptoms_interrogation_sample_count"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dns_symptoms_duration_between_samples_before_trap"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dns_symptoms_duration_between_samples_after_trap"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_fast_dps_wd"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_fast_dps_validation_for_test"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_fast_dps_wd_screen_on"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_fast_dps_wd_screen_off"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("prediction_probability_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("prediction_probability_threshold_macos"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reset_cca_bin_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_symptoms_dps_wd_screen_on"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_symptoms_dps_wd_screen_off"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_peer_diagnostics_trigger_for_dns_stall"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_peer_diagnostics_trigger_for_other_issues"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reset_score_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dps_symptoms_average_cca_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reset_pd_rssi_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reset_pd_cca_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reset_legacy_chipset_cca_bin_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reset_rssi_bin_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("reset_awdl_activity_threshold"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_slow_wifi_wd"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("minutes_between_slow_wifi_wd"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("slow_wifi_interrogation_sample_count"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("slow_wifi_duration_between_samples"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("slow_wifi_report_sent_after"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_slow_wifi_dps_is_priority_network"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("ior_rescan_budget_less_than_previous_max_channels_seconds"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("ior_rescan_budget_exploratory_seconds"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("ior_rescan_new_phy_delay_seconds"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("ior_persist_delay_seconds"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("work_report_seconds"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("work_report_logs_enabled"));

  v4.receiver = self;
  v4.super_class = (Class)RecommendationPreferences;
  -[RecommendationPreferences dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  const char *v20;
  const char *v21;
  id v22;
  unsigned int v23;
  const char *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unsigned int v34;
  const char *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unsigned int v41;
  const char *v42;
  id v43;
  unsigned int v44;
  const char *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  unsigned int v63;
  const char *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  unsigned int v70;
  const char *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  unsigned int v78;
  const char *v79;
  id v80;
  NSObject *v81;
  objc_super v82;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int64_t v88;
  __int16 v89;
  id v90;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v14 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("disable_recommendation_engine")))
  {
    if (v16)
    {
      -[RecommendationPreferences setDisable_recommendation_engine:](self, "setDisable_recommendation_engine:", objc_msgSend(v16, "BOOLValue"));
      v17 = WALogCategoryDefaultHandle();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[RecommendationPreferences disable_recommendation_engine](self, "disable_recommendation_engine");
        v20 = "NO";
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        *(_DWORD *)buf = 136446722;
        if (v19)
          v20 = "YES";
        v85 = 1024;
        v86 = 484;
        v87 = 2080;
        v88 = (int64_t)v20;
        v21 = "%{public}s::%d:disable_recommendation_engine Preference is %s";
        goto LABEL_200;
      }
LABEL_201:

    }
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("disable_dps_wd")))
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_dps_wd")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setMinutes_between_dps_wd:](self, "setMinutes_between_dps_wd:", objc_msgSend(v16, "unsignedIntegerValue"));
        v25 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 494;
        v87 = 2048;
        v88 = -[RecommendationPreferences minutes_between_dps_wd](self, "minutes_between_dps_wd");
        v21 = "%{public}s::%d:minutes_between_dps_wd Preference is %ld";
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_wd_cca")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setDps_wd_cca:](self, "setDps_wd_cca:", objc_msgSend(v16, "unsignedIntegerValue"));
        v26 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v26);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 499;
        v87 = 2048;
        v88 = -[RecommendationPreferences dps_wd_cca](self, "dps_wd_cca");
        v21 = "%{public}s::%d:dps_wd_cca Preference is %ld";
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_stall_dur_for_wd")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setDps_stall_dur_for_wd:](self, "setDps_stall_dur_for_wd:", objc_msgSend(v16, "unsignedIntegerValue"));
        v27 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 504;
        v87 = 2048;
        v88 = -[RecommendationPreferences dps_stall_dur_for_wd](self, "dps_stall_dur_for_wd");
        v21 = "%{public}s::%d:dps_stall_dur_for_wd Preference is %ld";
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_capture_evaluated_at_sample")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setDps_capture_evaluated_at_sample:](self, "setDps_capture_evaluated_at_sample:", objc_msgSend(v16, "unsignedIntegerValue"));
        v28 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v28);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 509;
        v87 = 2048;
        v88 = -[RecommendationPreferences dps_capture_evaluated_at_sample](self, "dps_capture_evaluated_at_sample");
        v21 = "%{public}s::%d:dps_capture_evaluated_at_sample Preference is %ld";
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_trap_evaluated_at_sample")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setDps_trap_evaluated_at_sample:](self, "setDps_trap_evaluated_at_sample:", objc_msgSend(v16, "unsignedIntegerValue"));
        v29 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 514;
        v87 = 2048;
        v88 = -[RecommendationPreferences dps_trap_evaluated_at_sample](self, "dps_trap_evaluated_at_sample");
        v21 = "%{public}s::%d:dps_trap_evaluated_at_sample Preference is %ld";
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_interrogation_sample_count")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setDps_interrogation_sample_count:](self, "setDps_interrogation_sample_count:", objc_msgSend(v16, "unsignedIntegerValue"));
        v30 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v30);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 519;
        v87 = 2048;
        v88 = -[RecommendationPreferences dps_interrogation_sample_count](self, "dps_interrogation_sample_count");
        v21 = "%{public}s::%d:dps_interrogation_sample_count Preference is %ld";
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_duration_between_samples")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setDps_duration_between_samples:](self, "setDps_duration_between_samples:", objc_msgSend(v16, "unsignedIntegerValue"));
        v31 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v31);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 524;
        v87 = 2048;
        v88 = -[RecommendationPreferences dps_duration_between_samples](self, "dps_duration_between_samples");
        v21 = "%{public}s::%d:dps_duration_between_samples Preference is %ld";
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_report_sent_after")))
      {
        if (!v16)
          goto LABEL_202;
        -[RecommendationPreferences setDps_report_sent_after:](self, "setDps_report_sent_after:", objc_msgSend(v16, "unsignedIntegerValue"));
        v32 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v32);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_201;
        *(_DWORD *)buf = 136446722;
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        v85 = 1024;
        v86 = 529;
        v87 = 2048;
        v88 = -[RecommendationPreferences dps_report_sent_after](self, "dps_report_sent_after");
        v21 = "%{public}s::%d:dps_report_sent_after Preference is %ld";
      }
      else
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("force_dps_recommend_always")))
        {
          if (v16)
          {
            -[RecommendationPreferences setForce_dps_recommend_always:](self, "setForce_dps_recommend_always:", objc_msgSend(v16, "BOOLValue"));
            v33 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v34 = -[RecommendationPreferences force_dps_recommend_always](self, "force_dps_recommend_always");
              v35 = "NO";
              v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              *(_DWORD *)buf = 136446722;
              if (v34)
                v35 = "YES";
              v85 = 1024;
              v86 = 534;
              v87 = 2080;
              v88 = (int64_t)v35;
              v21 = "%{public}s::%d:force_dps_recommend_always Preference is %s";
              goto LABEL_200;
            }
            goto LABEL_201;
          }
          goto LABEL_202;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("dns_symptoms_trap_evaluated_at_sample")))
        {
          if (!v16)
            goto LABEL_202;
          -[RecommendationPreferences setDns_symptoms_trap_evaluated_at_sample:](self, "setDns_symptoms_trap_evaluated_at_sample:", objc_msgSend(v16, "unsignedIntegerValue"));
          v36 = WALogCategoryDefaultHandle();
          v18 = objc_claimAutoreleasedReturnValue(v36);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            goto LABEL_201;
          *(_DWORD *)buf = 136446722;
          v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          v85 = 1024;
          v86 = 539;
          v87 = 2048;
          v88 = -[RecommendationPreferences dns_symptoms_trap_evaluated_at_sample](self, "dns_symptoms_trap_evaluated_at_sample");
          v21 = "%{public}s::%d:dns_symptoms_trap_evaluated_at_sample Preference is %ld";
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dns_symptoms_interrogation_sample_count")))
        {
          if (!v16)
            goto LABEL_202;
          -[RecommendationPreferences setDns_symptoms_interrogation_sample_count:](self, "setDns_symptoms_interrogation_sample_count:", objc_msgSend(v16, "unsignedIntegerValue"));
          v37 = WALogCategoryDefaultHandle();
          v18 = objc_claimAutoreleasedReturnValue(v37);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            goto LABEL_201;
          *(_DWORD *)buf = 136446722;
          v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          v85 = 1024;
          v86 = 544;
          v87 = 2048;
          v88 = -[RecommendationPreferences dns_symptoms_interrogation_sample_count](self, "dns_symptoms_interrogation_sample_count");
          v21 = "%{public}s::%d:dns_symptoms_interrogation_sample_count Preference is %ld";
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dns_symptoms_duration_between_samples_before_trap")))
        {
          if (!v16)
            goto LABEL_202;
          -[RecommendationPreferences setDns_symptoms_duration_between_samples_before_trap:](self, "setDns_symptoms_duration_between_samples_before_trap:", objc_msgSend(v16, "unsignedIntegerValue"));
          v38 = WALogCategoryDefaultHandle();
          v18 = objc_claimAutoreleasedReturnValue(v38);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            goto LABEL_201;
          *(_DWORD *)buf = 136446722;
          v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          v85 = 1024;
          v86 = 549;
          v87 = 2048;
          v88 = -[RecommendationPreferences dns_symptoms_duration_between_samples_before_trap](self, "dns_symptoms_duration_between_samples_before_trap");
          v21 = "%{public}s::%d:dns_symptoms_duration_between_samples_before_trap Preference is %ld";
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dns_symptoms_duration_between_samples_after_trap")))
        {
          if (!v16)
            goto LABEL_202;
          -[RecommendationPreferences setDns_symptoms_duration_between_samples_after_trap:](self, "setDns_symptoms_duration_between_samples_after_trap:", objc_msgSend(v16, "unsignedIntegerValue"));
          v39 = WALogCategoryDefaultHandle();
          v18 = objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            goto LABEL_201;
          *(_DWORD *)buf = 136446722;
          v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
          v85 = 1024;
          v86 = 554;
          v87 = 2048;
          v88 = -[RecommendationPreferences dns_symptoms_duration_between_samples_after_trap](self, "dns_symptoms_duration_between_samples_after_trap");
          v21 = "%{public}s::%d:dns_symptoms_duration_between_samples_after_trap Preference is %ld";
        }
        else
        {
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("disable_fast_dps_wd")))
          {
            if (v16)
            {
              -[RecommendationPreferences setDisable_fast_dps_wd:](self, "setDisable_fast_dps_wd:", objc_msgSend(v16, "BOOLValue"));
              v40 = WALogCategoryDefaultHandle();
              v18 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v41 = -[RecommendationPreferences disable_fast_dps_wd](self, "disable_fast_dps_wd");
                v42 = "NO";
                v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                *(_DWORD *)buf = 136446722;
                if (v41)
                  v42 = "YES";
                v85 = 1024;
                v86 = 559;
                v87 = 2080;
                v88 = (int64_t)v42;
                v21 = "%{public}s::%d:disable_fast_dps_wd Preference is %s";
                goto LABEL_200;
              }
              goto LABEL_201;
            }
            goto LABEL_202;
          }
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("disable_fast_dps_validation_for_test")))
          {
            if (v16)
            {
              -[RecommendationPreferences setDisable_fast_dps_validation_for_test:](self, "setDisable_fast_dps_validation_for_test:", objc_msgSend(v16, "BOOLValue"));
              v43 = WALogCategoryDefaultHandle();
              v18 = objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v44 = -[RecommendationPreferences disable_fast_dps_validation_for_test](self, "disable_fast_dps_validation_for_test");
                v45 = "NO";
                v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                *(_DWORD *)buf = 136446722;
                if (v44)
                  v45 = "YES";
                v85 = 1024;
                v86 = 564;
                v87 = 2080;
                v88 = (int64_t)v45;
                v21 = "%{public}s::%d:disable_fast_dps_validation_for_test Preference is %s";
                goto LABEL_200;
              }
              goto LABEL_201;
            }
            goto LABEL_202;
          }
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_fast_dps_wd_screen_on")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setMinutes_between_fast_dps_wd_screen_on:](self, "setMinutes_between_fast_dps_wd_screen_on:", objc_msgSend(v16, "unsignedIntegerValue"));
            v46 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v46);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 569;
            v87 = 2048;
            v88 = -[RecommendationPreferences minutes_between_fast_dps_wd_screen_on](self, "minutes_between_fast_dps_wd_screen_on");
            v21 = "%{public}s::%d:minutes_between_fast_dps_wd_screen_on Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_fast_dps_wd_screen_off")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setMinutes_between_fast_dps_wd_screen_off:](self, "setMinutes_between_fast_dps_wd_screen_off:", objc_msgSend(v16, "unsignedIntegerValue"));
            v47 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v47);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 574;
            v87 = 2048;
            v88 = -[RecommendationPreferences minutes_between_fast_dps_wd_screen_off](self, "minutes_between_fast_dps_wd_screen_off");
            v21 = "%{public}s::%d:minutes_between_fast_dps_wd_screen_off Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("prediction_probability_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setPrediction_probability_threshold:](self, "setPrediction_probability_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v48 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v48);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 579;
            v87 = 2048;
            v88 = -[RecommendationPreferences prediction_probability_threshold](self, "prediction_probability_threshold");
            v21 = "%{public}s::%d:prediction_probability_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("prediction_probability_threshold_macos")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setPrediction_probability_threshold_macos:](self, "setPrediction_probability_threshold_macos:", objc_msgSend(v16, "unsignedIntegerValue"));
            v49 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v49);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 584;
            v87 = 2048;
            v88 = -[RecommendationPreferences prediction_probability_threshold_macos](self, "prediction_probability_threshold_macos");
            v21 = "%{public}s::%d:prediction_probability_threshold_macos Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset_cca_bin_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setReset_cca_bin_threshold:](self, "setReset_cca_bin_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v50 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v50);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 589;
            v87 = 2048;
            v88 = -[RecommendationPreferences reset_cca_bin_threshold](self, "reset_cca_bin_threshold");
            v21 = "%{public}s::%d:reset_cca_bin_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset_score_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setReset_score_threshold:](self, "setReset_score_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v51 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v51);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 594;
            v87 = 2048;
            v88 = -[RecommendationPreferences reset_score_threshold](self, "reset_score_threshold");
            v21 = "%{public}s::%d:reset_score_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dps_symptoms_average_cca_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setDps_symptoms_average_cca_threshold:](self, "setDps_symptoms_average_cca_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v52 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v52);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 599;
            v87 = 2048;
            v88 = -[RecommendationPreferences dps_symptoms_average_cca_threshold](self, "dps_symptoms_average_cca_threshold");
            v21 = "%{public}s::%d:dps_symptoms_average_cca_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset_pd_rssi_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setReset_pd_rssi_threshold:](self, "setReset_pd_rssi_threshold:", objc_msgSend(v16, "integerValue"));
            v53 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v53);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 604;
            v87 = 2048;
            v88 = -[RecommendationPreferences reset_pd_rssi_threshold](self, "reset_pd_rssi_threshold");
            v21 = "%{public}s::%d:reset_pd_rssi_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset_pd_cca_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setReset_pd_cca_threshold:](self, "setReset_pd_cca_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v54 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v54);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 609;
            v87 = 2048;
            v88 = -[RecommendationPreferences reset_pd_cca_threshold](self, "reset_pd_cca_threshold");
            v21 = "%{public}s::%d:reset_pd_cca_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_symptoms_dps_wd_screen_on")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setMinutes_between_symptoms_dps_wd_screen_on:](self, "setMinutes_between_symptoms_dps_wd_screen_on:", objc_msgSend(v16, "unsignedIntegerValue"));
            v55 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v55);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 614;
            v87 = 2048;
            v88 = -[RecommendationPreferences minutes_between_symptoms_dps_wd_screen_on](self, "minutes_between_symptoms_dps_wd_screen_on");
            v21 = "%{public}s::%d:minutes_between_symptoms_dps_wd_screen_on Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_symptoms_dps_wd_screen_off")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setMinutes_between_symptoms_dps_wd_screen_off:](self, "setMinutes_between_symptoms_dps_wd_screen_off:", objc_msgSend(v16, "unsignedIntegerValue"));
            v56 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v56);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 619;
            v87 = 2048;
            v88 = -[RecommendationPreferences minutes_between_symptoms_dps_wd_screen_off](self, "minutes_between_symptoms_dps_wd_screen_off");
            v21 = "%{public}s::%d:minutes_between_symptoms_dps_wd_screen_off Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_peer_diagnostics_trigger_for_dns_stall")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setMinutes_between_peer_diagnostics_trigger_for_dns_stall:](self, "setMinutes_between_peer_diagnostics_trigger_for_dns_stall:", objc_msgSend(v16, "unsignedIntegerValue"));
            v57 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v57);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 624;
            v87 = 2048;
            v88 = -[RecommendationPreferences minutes_between_peer_diagnostics_trigger_for_dns_stall](self, "minutes_between_peer_diagnostics_trigger_for_dns_stall");
            v21 = "%{public}s::%d:minutes_between_peer_diagnostics_trigger_for_dns_stall Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_peer_diagnostics_trigger_for_other_issues")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setMinutes_between_peer_diagnostics_trigger_for_other_issues:](self, "setMinutes_between_peer_diagnostics_trigger_for_other_issues:", objc_msgSend(v16, "unsignedIntegerValue"));
            v58 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v58);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 629;
            v87 = 2048;
            v88 = -[RecommendationPreferences minutes_between_peer_diagnostics_trigger_for_other_issues](self, "minutes_between_peer_diagnostics_trigger_for_other_issues");
            v21 = "%{public}s::%d:minutes_between_peer_diagnostics_trigger_for_other_issues Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset_legacy_chipset_cca_bin_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setReset_legacy_chipset_cca_bin_threshold:](self, "setReset_legacy_chipset_cca_bin_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v59 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v59);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 634;
            v87 = 2048;
            v88 = -[RecommendationPreferences reset_legacy_chipset_cca_bin_threshold](self, "reset_legacy_chipset_cca_bin_threshold");
            v21 = "%{public}s::%d:reset_legacy_chipset_cca_bin_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset_rssi_bin_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setReset_rssi_bin_threshold:](self, "setReset_rssi_bin_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v60 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v60);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 639;
            v87 = 2048;
            v88 = -[RecommendationPreferences reset_rssi_bin_threshold](self, "reset_rssi_bin_threshold");
            v21 = "%{public}s::%d:reset_rssi_bin_threshold Preference is %ld";
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset_awdl_activity_threshold")))
          {
            if (!v16)
              goto LABEL_202;
            -[RecommendationPreferences setReset_awdl_activity_threshold:](self, "setReset_awdl_activity_threshold:", objc_msgSend(v16, "unsignedIntegerValue"));
            v61 = WALogCategoryDefaultHandle();
            v18 = objc_claimAutoreleasedReturnValue(v61);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_201;
            *(_DWORD *)buf = 136446722;
            v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
            v85 = 1024;
            v86 = 644;
            v87 = 2048;
            v88 = -[RecommendationPreferences reset_awdl_activity_threshold](self, "reset_awdl_activity_threshold");
            v21 = "%{public}s::%d:reset_awdl_activity_threshold Preference is %ld";
          }
          else
          {
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("disable_slow_wifi_wd")))
            {
              if (v16)
              {
                -[RecommendationPreferences setDisable_slow_wifi_wd:](self, "setDisable_slow_wifi_wd:", objc_msgSend(v16, "BOOLValue"));
                v62 = WALogCategoryDefaultHandle();
                v18 = objc_claimAutoreleasedReturnValue(v62);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  v63 = -[RecommendationPreferences disable_slow_wifi_wd](self, "disable_slow_wifi_wd");
                  v64 = "NO";
                  v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                  *(_DWORD *)buf = 136446722;
                  if (v63)
                    v64 = "YES";
                  v85 = 1024;
                  v86 = 649;
                  v87 = 2080;
                  v88 = (int64_t)v64;
                  v21 = "%{public}s::%d:disable_slow_wifi_wd Preference is %s";
                  goto LABEL_200;
                }
                goto LABEL_201;
              }
              goto LABEL_202;
            }
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("minutes_between_slow_wifi_wd")))
            {
              if (!v16)
                goto LABEL_202;
              -[RecommendationPreferences setMinutes_between_slow_wifi_wd:](self, "setMinutes_between_slow_wifi_wd:", objc_msgSend(v16, "unsignedIntegerValue"));
              v65 = WALogCategoryDefaultHandle();
              v18 = objc_claimAutoreleasedReturnValue(v65);
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                goto LABEL_201;
              *(_DWORD *)buf = 136446722;
              v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              v85 = 1024;
              v86 = 654;
              v87 = 2048;
              v88 = -[RecommendationPreferences minutes_between_slow_wifi_wd](self, "minutes_between_slow_wifi_wd");
              v21 = "%{public}s::%d:minutes_between_slow_wifi_wd Preference is %ld";
            }
            else if (objc_msgSend(v10, "isEqualToString:", CFSTR("slow_wifi_interrogation_sample_count")))
            {
              if (!v16)
                goto LABEL_202;
              -[RecommendationPreferences setSlow_wifi_interrogation_sample_count:](self, "setSlow_wifi_interrogation_sample_count:", objc_msgSend(v16, "unsignedIntegerValue"));
              v66 = WALogCategoryDefaultHandle();
              v18 = objc_claimAutoreleasedReturnValue(v66);
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                goto LABEL_201;
              *(_DWORD *)buf = 136446722;
              v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              v85 = 1024;
              v86 = 659;
              v87 = 2048;
              v88 = -[RecommendationPreferences slow_wifi_interrogation_sample_count](self, "slow_wifi_interrogation_sample_count");
              v21 = "%{public}s::%d:slow_wifi_interrogation_sample_count Preference is %ld";
            }
            else if (objc_msgSend(v10, "isEqualToString:", CFSTR("slow_wifi_duration_between_samples")))
            {
              if (!v16)
                goto LABEL_202;
              -[RecommendationPreferences setSlow_wifi_duration_between_samples:](self, "setSlow_wifi_duration_between_samples:", objc_msgSend(v16, "unsignedIntegerValue"));
              v67 = WALogCategoryDefaultHandle();
              v18 = objc_claimAutoreleasedReturnValue(v67);
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                goto LABEL_201;
              *(_DWORD *)buf = 136446722;
              v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              v85 = 1024;
              v86 = 664;
              v87 = 2048;
              v88 = -[RecommendationPreferences slow_wifi_duration_between_samples](self, "slow_wifi_duration_between_samples");
              v21 = "%{public}s::%d:slow_wifi_duration_between_samples Preference is %ld";
            }
            else if (objc_msgSend(v10, "isEqualToString:", CFSTR("slow_wifi_report_sent_after")))
            {
              if (!v16)
                goto LABEL_202;
              -[RecommendationPreferences setSlow_wifi_report_sent_after:](self, "setSlow_wifi_report_sent_after:", objc_msgSend(v16, "unsignedIntegerValue"));
              v68 = WALogCategoryDefaultHandle();
              v18 = objc_claimAutoreleasedReturnValue(v68);
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                goto LABEL_201;
              *(_DWORD *)buf = 136446722;
              v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
              v85 = 1024;
              v86 = 669;
              v87 = 2048;
              v88 = -[RecommendationPreferences slow_wifi_report_sent_after](self, "slow_wifi_report_sent_after");
              v21 = "%{public}s::%d:slow_wifi_report_sent_after Preference is %ld";
            }
            else
            {
              if (objc_msgSend(v10, "isEqualToString:", CFSTR("disable_slow_wifi_dps_is_priority_network")))
              {
                if (v16)
                {
                  -[RecommendationPreferences setDisable_slow_wifi_dps_is_priority_network:](self, "setDisable_slow_wifi_dps_is_priority_network:", objc_msgSend(v16, "BOOLValue"));
                  v69 = WALogCategoryDefaultHandle();
                  v18 = objc_claimAutoreleasedReturnValue(v69);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    v70 = -[RecommendationPreferences disable_slow_wifi_dps_is_priority_network](self, "disable_slow_wifi_dps_is_priority_network");
                    v71 = "NO";
                    v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                    *(_DWORD *)buf = 136446722;
                    if (v70)
                      v71 = "YES";
                    v85 = 1024;
                    v86 = 674;
                    v87 = 2080;
                    v88 = (int64_t)v71;
                    v21 = "%{public}s::%d:disable_slow_wifi_dps_is_priority_network Preference is %s";
                    goto LABEL_200;
                  }
                  goto LABEL_201;
                }
                goto LABEL_202;
              }
              if (objc_msgSend(v10, "isEqualToString:", CFSTR("ior_rescan_budget_less_than_previous_max_channels_seconds")))
              {
                if (!v16)
                  goto LABEL_202;
                -[RecommendationPreferences setIor_rescan_budget_less_than_previous_max_channels_seconds:](self, "setIor_rescan_budget_less_than_previous_max_channels_seconds:", objc_msgSend(v16, "unsignedIntegerValue"));
                v72 = WALogCategoryDefaultHandle();
                v18 = objc_claimAutoreleasedReturnValue(v72);
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_201;
                *(_DWORD *)buf = 136446722;
                v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                v85 = 1024;
                v86 = 679;
                v87 = 2048;
                v88 = -[RecommendationPreferences ior_rescan_budget_less_than_previous_max_channels_seconds](self, "ior_rescan_budget_less_than_previous_max_channels_seconds");
                v21 = "%{public}s::%d:ior_rescan_budget_less_than_previous_max_channels_seconds Preference is %ld";
              }
              else if (objc_msgSend(v10, "isEqualToString:", CFSTR("ior_rescan_budget_exploratory_seconds")))
              {
                if (!v16)
                  goto LABEL_202;
                -[RecommendationPreferences setIor_rescan_budget_exploratory_seconds:](self, "setIor_rescan_budget_exploratory_seconds:", objc_msgSend(v16, "unsignedIntegerValue"));
                v73 = WALogCategoryDefaultHandle();
                v18 = objc_claimAutoreleasedReturnValue(v73);
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_201;
                *(_DWORD *)buf = 136446722;
                v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                v85 = 1024;
                v86 = 684;
                v87 = 2048;
                v88 = -[RecommendationPreferences ior_rescan_budget_exploratory_seconds](self, "ior_rescan_budget_exploratory_seconds");
                v21 = "%{public}s::%d:ior_rescan_budget_exploratory_seconds Preference is %ld";
              }
              else if (objc_msgSend(v10, "isEqualToString:", CFSTR("ior_rescan_new_phy_delay_seconds")))
              {
                if (!v16)
                  goto LABEL_202;
                -[RecommendationPreferences setIor_rescan_new_phy_delay_seconds:](self, "setIor_rescan_new_phy_delay_seconds:", objc_msgSend(v16, "unsignedIntegerValue"));
                v74 = WALogCategoryDefaultHandle();
                v18 = objc_claimAutoreleasedReturnValue(v74);
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_201;
                *(_DWORD *)buf = 136446722;
                v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                v85 = 1024;
                v86 = 689;
                v87 = 2048;
                v88 = -[RecommendationPreferences ior_rescan_new_phy_delay_seconds](self, "ior_rescan_new_phy_delay_seconds");
                v21 = "%{public}s::%d:ior_rescan_new_phy_delay_seconds Preference is %ld";
              }
              else if (objc_msgSend(v10, "isEqualToString:", CFSTR("ior_persist_delay_seconds")))
              {
                if (!v16)
                  goto LABEL_202;
                -[RecommendationPreferences setIor_persist_delay_seconds:](self, "setIor_persist_delay_seconds:", objc_msgSend(v16, "unsignedIntegerValue"));
                v75 = WALogCategoryDefaultHandle();
                v18 = objc_claimAutoreleasedReturnValue(v75);
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_201;
                *(_DWORD *)buf = 136446722;
                v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                v85 = 1024;
                v86 = 694;
                v87 = 2048;
                v88 = -[RecommendationPreferences ior_persist_delay_seconds](self, "ior_persist_delay_seconds");
                v21 = "%{public}s::%d:ior_persist_delay_seconds Preference is %ld";
              }
              else
              {
                if (!objc_msgSend(v10, "isEqualToString:", CFSTR("work_report_seconds")))
                {
                  if (objc_msgSend(v10, "isEqualToString:", CFSTR("work_report_logs_enabled")))
                  {
                    if (v16)
                    {
                      -[RecommendationPreferences setWork_report_logs_enabled:](self, "setWork_report_logs_enabled:", objc_msgSend(v16, "BOOLValue"));
                      v77 = WALogCategoryDefaultHandle();
                      v18 = objc_claimAutoreleasedReturnValue(v77);
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        v78 = -[RecommendationPreferences work_report_logs_enabled](self, "work_report_logs_enabled");
                        v79 = "NO";
                        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                        *(_DWORD *)buf = 136446722;
                        if (v78)
                          v79 = "YES";
                        v85 = 1024;
                        v86 = 704;
                        v87 = 2080;
                        v88 = (int64_t)v79;
                        v21 = "%{public}s::%d:work_report_logs_enabled Preference is %s";
                        goto LABEL_200;
                      }
                      goto LABEL_201;
                    }
                  }
                  else
                  {
                    v80 = WALogCategoryDefaultHandle();
                    v81 = objc_claimAutoreleasedReturnValue(v80);
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446978;
                      v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                      v85 = 1024;
                      v86 = 707;
                      v87 = 2112;
                      v88 = (int64_t)v12;
                      v89 = 2112;
                      v90 = v10;
                      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%{public}s::%d:Received an unexpected wifianalyticsd preference change: %@ for %@", buf, 0x26u);
                    }

                    v82.receiver = self;
                    v82.super_class = (Class)RecommendationPreferences;
                    -[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:](&v82, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
                  }
                  goto LABEL_202;
                }
                if (!v16)
                  goto LABEL_202;
                -[RecommendationPreferences setWork_report_seconds:](self, "setWork_report_seconds:", objc_msgSend(v16, "unsignedIntegerValue"));
                v76 = WALogCategoryDefaultHandle();
                v18 = objc_claimAutoreleasedReturnValue(v76);
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_201;
                *(_DWORD *)buf = 136446722;
                v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
                v85 = 1024;
                v86 = 699;
                v87 = 2048;
                v88 = -[RecommendationPreferences work_report_seconds](self, "work_report_seconds");
                v21 = "%{public}s::%d:work_report_seconds Preference is %ld";
              }
            }
          }
        }
      }
LABEL_200:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v21, buf, 0x1Cu);
      goto LABEL_201;
    }
    if (v16)
    {
      -[RecommendationPreferences setDisable_dps_wd:](self, "setDisable_dps_wd:", objc_msgSend(v16, "BOOLValue"));
      v22 = WALogCategoryDefaultHandle();
      v18 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v23 = -[RecommendationPreferences disable_dps_wd](self, "disable_dps_wd");
        v24 = "NO";
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        *(_DWORD *)buf = 136446722;
        if (v23)
          v24 = "YES";
        v85 = 1024;
        v86 = 489;
        v87 = 2080;
        v88 = (int64_t)v24;
        v21 = "%{public}s::%d:disable_dps_wd Preference is %s";
        goto LABEL_200;
      }
      goto LABEL_201;
    }
  }
LABEL_202:

}

- (BOOL)disable_recommendation_engine
{
  return self->_disable_recommendation_engine;
}

- (void)setDisable_recommendation_engine:(BOOL)a3
{
  self->_disable_recommendation_engine = a3;
}

- (BOOL)disable_dps_wd
{
  return self->_disable_dps_wd;
}

- (void)setDisable_dps_wd:(BOOL)a3
{
  self->_disable_dps_wd = a3;
}

- (unint64_t)minutes_between_dps_wd
{
  return self->_minutes_between_dps_wd;
}

- (void)setMinutes_between_dps_wd:(unint64_t)a3
{
  self->_minutes_between_dps_wd = a3;
}

- (unint64_t)dps_wd_cca
{
  return self->_dps_wd_cca;
}

- (void)setDps_wd_cca:(unint64_t)a3
{
  self->_dps_wd_cca = a3;
}

- (unint64_t)dps_stall_dur_for_wd
{
  return self->_dps_stall_dur_for_wd;
}

- (void)setDps_stall_dur_for_wd:(unint64_t)a3
{
  self->_dps_stall_dur_for_wd = a3;
}

- (unint64_t)dps_capture_evaluated_at_sample
{
  return self->_dps_capture_evaluated_at_sample;
}

- (void)setDps_capture_evaluated_at_sample:(unint64_t)a3
{
  self->_dps_capture_evaluated_at_sample = a3;
}

- (unint64_t)dps_trap_evaluated_at_sample
{
  return self->_dps_trap_evaluated_at_sample;
}

- (void)setDps_trap_evaluated_at_sample:(unint64_t)a3
{
  self->_dps_trap_evaluated_at_sample = a3;
}

- (unint64_t)dps_interrogation_sample_count
{
  return self->_dps_interrogation_sample_count;
}

- (void)setDps_interrogation_sample_count:(unint64_t)a3
{
  self->_dps_interrogation_sample_count = a3;
}

- (unint64_t)dps_duration_between_samples
{
  return self->_dps_duration_between_samples;
}

- (void)setDps_duration_between_samples:(unint64_t)a3
{
  self->_dps_duration_between_samples = a3;
}

- (unint64_t)dps_report_sent_after
{
  return self->_dps_report_sent_after;
}

- (void)setDps_report_sent_after:(unint64_t)a3
{
  self->_dps_report_sent_after = a3;
}

- (BOOL)force_dps_recommend_always
{
  return self->_force_dps_recommend_always;
}

- (void)setForce_dps_recommend_always:(BOOL)a3
{
  self->_force_dps_recommend_always = a3;
}

- (unint64_t)dns_symptoms_trap_evaluated_at_sample
{
  return self->_dns_symptoms_trap_evaluated_at_sample;
}

- (void)setDns_symptoms_trap_evaluated_at_sample:(unint64_t)a3
{
  self->_dns_symptoms_trap_evaluated_at_sample = a3;
}

- (unint64_t)dns_symptoms_interrogation_sample_count
{
  return self->_dns_symptoms_interrogation_sample_count;
}

- (void)setDns_symptoms_interrogation_sample_count:(unint64_t)a3
{
  self->_dns_symptoms_interrogation_sample_count = a3;
}

- (unint64_t)dns_symptoms_duration_between_samples_before_trap
{
  return self->_dns_symptoms_duration_between_samples_before_trap;
}

- (void)setDns_symptoms_duration_between_samples_before_trap:(unint64_t)a3
{
  self->_dns_symptoms_duration_between_samples_before_trap = a3;
}

- (unint64_t)dns_symptoms_duration_between_samples_after_trap
{
  return self->_dns_symptoms_duration_between_samples_after_trap;
}

- (void)setDns_symptoms_duration_between_samples_after_trap:(unint64_t)a3
{
  self->_dns_symptoms_duration_between_samples_after_trap = a3;
}

- (BOOL)disable_fast_dps_wd
{
  return self->_disable_fast_dps_wd;
}

- (void)setDisable_fast_dps_wd:(BOOL)a3
{
  self->_disable_fast_dps_wd = a3;
}

- (BOOL)disable_fast_dps_validation_for_test
{
  return self->_disable_fast_dps_validation_for_test;
}

- (void)setDisable_fast_dps_validation_for_test:(BOOL)a3
{
  self->_disable_fast_dps_validation_for_test = a3;
}

- (unint64_t)minutes_between_fast_dps_wd_screen_on
{
  return self->_minutes_between_fast_dps_wd_screen_on;
}

- (void)setMinutes_between_fast_dps_wd_screen_on:(unint64_t)a3
{
  self->_minutes_between_fast_dps_wd_screen_on = a3;
}

- (unint64_t)minutes_between_fast_dps_wd_screen_off
{
  return self->_minutes_between_fast_dps_wd_screen_off;
}

- (void)setMinutes_between_fast_dps_wd_screen_off:(unint64_t)a3
{
  self->_minutes_between_fast_dps_wd_screen_off = a3;
}

- (unint64_t)prediction_probability_threshold
{
  return self->_prediction_probability_threshold;
}

- (void)setPrediction_probability_threshold:(unint64_t)a3
{
  self->_prediction_probability_threshold = a3;
}

- (unint64_t)prediction_probability_threshold_macos
{
  return self->_prediction_probability_threshold_macos;
}

- (void)setPrediction_probability_threshold_macos:(unint64_t)a3
{
  self->_prediction_probability_threshold_macos = a3;
}

- (unint64_t)reset_cca_bin_threshold
{
  return self->_reset_cca_bin_threshold;
}

- (void)setReset_cca_bin_threshold:(unint64_t)a3
{
  self->_reset_cca_bin_threshold = a3;
}

- (unint64_t)reset_legacy_chipset_cca_bin_threshold
{
  return self->_reset_legacy_chipset_cca_bin_threshold;
}

- (void)setReset_legacy_chipset_cca_bin_threshold:(unint64_t)a3
{
  self->_reset_legacy_chipset_cca_bin_threshold = a3;
}

- (unint64_t)reset_rssi_bin_threshold
{
  return self->_reset_rssi_bin_threshold;
}

- (void)setReset_rssi_bin_threshold:(unint64_t)a3
{
  self->_reset_rssi_bin_threshold = a3;
}

- (unint64_t)reset_awdl_activity_threshold
{
  return self->_reset_awdl_activity_threshold;
}

- (void)setReset_awdl_activity_threshold:(unint64_t)a3
{
  self->_reset_awdl_activity_threshold = a3;
}

- (unint64_t)minutes_between_symptoms_dps_wd_screen_on
{
  return self->_minutes_between_symptoms_dps_wd_screen_on;
}

- (void)setMinutes_between_symptoms_dps_wd_screen_on:(unint64_t)a3
{
  self->_minutes_between_symptoms_dps_wd_screen_on = a3;
}

- (unint64_t)minutes_between_symptoms_dps_wd_screen_off
{
  return self->_minutes_between_symptoms_dps_wd_screen_off;
}

- (void)setMinutes_between_symptoms_dps_wd_screen_off:(unint64_t)a3
{
  self->_minutes_between_symptoms_dps_wd_screen_off = a3;
}

- (unint64_t)minutes_between_peer_diagnostics_trigger_for_dns_stall
{
  return self->_minutes_between_peer_diagnostics_trigger_for_dns_stall;
}

- (void)setMinutes_between_peer_diagnostics_trigger_for_dns_stall:(unint64_t)a3
{
  self->_minutes_between_peer_diagnostics_trigger_for_dns_stall = a3;
}

- (unint64_t)minutes_between_peer_diagnostics_trigger_for_other_issues
{
  return self->_minutes_between_peer_diagnostics_trigger_for_other_issues;
}

- (void)setMinutes_between_peer_diagnostics_trigger_for_other_issues:(unint64_t)a3
{
  self->_minutes_between_peer_diagnostics_trigger_for_other_issues = a3;
}

- (unint64_t)reset_score_threshold
{
  return self->_reset_score_threshold;
}

- (void)setReset_score_threshold:(unint64_t)a3
{
  self->_reset_score_threshold = a3;
}

- (int64_t)reset_pd_rssi_threshold
{
  return self->_reset_pd_rssi_threshold;
}

- (void)setReset_pd_rssi_threshold:(int64_t)a3
{
  self->_reset_pd_rssi_threshold = a3;
}

- (unint64_t)reset_pd_cca_threshold
{
  return self->_reset_pd_cca_threshold;
}

- (void)setReset_pd_cca_threshold:(unint64_t)a3
{
  self->_reset_pd_cca_threshold = a3;
}

- (unint64_t)dps_symptoms_average_cca_threshold
{
  return self->_dps_symptoms_average_cca_threshold;
}

- (void)setDps_symptoms_average_cca_threshold:(unint64_t)a3
{
  self->_dps_symptoms_average_cca_threshold = a3;
}

- (BOOL)disable_slow_wifi_wd
{
  return self->_disable_slow_wifi_wd;
}

- (void)setDisable_slow_wifi_wd:(BOOL)a3
{
  self->_disable_slow_wifi_wd = a3;
}

- (unint64_t)minutes_between_slow_wifi_wd
{
  return self->_minutes_between_slow_wifi_wd;
}

- (void)setMinutes_between_slow_wifi_wd:(unint64_t)a3
{
  self->_minutes_between_slow_wifi_wd = a3;
}

- (unint64_t)slow_wifi_interrogation_sample_count
{
  return self->_slow_wifi_interrogation_sample_count;
}

- (void)setSlow_wifi_interrogation_sample_count:(unint64_t)a3
{
  self->_slow_wifi_interrogation_sample_count = a3;
}

- (unint64_t)slow_wifi_duration_between_samples
{
  return self->_slow_wifi_duration_between_samples;
}

- (void)setSlow_wifi_duration_between_samples:(unint64_t)a3
{
  self->_slow_wifi_duration_between_samples = a3;
}

- (unint64_t)slow_wifi_report_sent_after
{
  return self->_slow_wifi_report_sent_after;
}

- (void)setSlow_wifi_report_sent_after:(unint64_t)a3
{
  self->_slow_wifi_report_sent_after = a3;
}

- (BOOL)disable_slow_wifi_dps_is_priority_network
{
  return self->_disable_slow_wifi_dps_is_priority_network;
}

- (void)setDisable_slow_wifi_dps_is_priority_network:(BOOL)a3
{
  self->_disable_slow_wifi_dps_is_priority_network = a3;
}

- (unint64_t)ior_rescan_budget_less_than_previous_max_channels_seconds
{
  return self->_ior_rescan_budget_less_than_previous_max_channels_seconds;
}

- (void)setIor_rescan_budget_less_than_previous_max_channels_seconds:(unint64_t)a3
{
  self->_ior_rescan_budget_less_than_previous_max_channels_seconds = a3;
}

- (unint64_t)ior_rescan_budget_exploratory_seconds
{
  return self->_ior_rescan_budget_exploratory_seconds;
}

- (void)setIor_rescan_budget_exploratory_seconds:(unint64_t)a3
{
  self->_ior_rescan_budget_exploratory_seconds = a3;
}

- (unint64_t)ior_rescan_new_phy_delay_seconds
{
  return self->_ior_rescan_new_phy_delay_seconds;
}

- (void)setIor_rescan_new_phy_delay_seconds:(unint64_t)a3
{
  self->_ior_rescan_new_phy_delay_seconds = a3;
}

- (unint64_t)ior_persist_delay_seconds
{
  return self->_ior_persist_delay_seconds;
}

- (void)setIor_persist_delay_seconds:(unint64_t)a3
{
  self->_ior_persist_delay_seconds = a3;
}

- (unint64_t)work_report_seconds
{
  return self->_work_report_seconds;
}

- (void)setWork_report_seconds:(unint64_t)a3
{
  self->_work_report_seconds = a3;
}

- (BOOL)work_report_logs_enabled
{
  return self->_work_report_logs_enabled;
}

- (void)setWork_report_logs_enabled:(BOOL)a3
{
  self->_work_report_logs_enabled = a3;
}

@end
