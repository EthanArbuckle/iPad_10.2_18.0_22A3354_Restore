@implementation RTAuthorizedLocationMetrics

- (RTAuthorizedLocationMetrics)initWithDaemonStartDate:(id)a3
{
  id v5;
  NSObject *v6;
  RTAuthorizedLocationMetrics *v7;
  RTAuthorizedLocationMetrics *v8;
  RTAuthorizedLocationCurationMetrics *curationMetrics;
  RTAuthorizedLocationQueryMetrics *queryMetrics;
  RTAuthorizedLocationDatabaseInitializationMetrics *initializationMetrics;
  uint64_t v12;
  NSDate *lastQueryMetricSubmissionDate;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTAuthorizedLocationMetrics initWithDaemonStartDate:]";
      v18 = 1024;
      v19 = 130;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: daemonStartDate (in %s:%d)", buf, 0x12u);
    }

  }
  v15.receiver = self;
  v15.super_class = (Class)RTAuthorizedLocationMetrics;
  v7 = -[RTAuthorizedLocationMetrics init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    curationMetrics = v7->_curationMetrics;
    v7->_curationMetrics = 0;

    queryMetrics = v8->_queryMetrics;
    v8->_queryMetrics = 0;

    initializationMetrics = v8->_initializationMetrics;
    v8->_initializationMetrics = 0;

    *(_WORD *)&v8->_locationServicesEnabled = 0;
    objc_storeStrong((id *)&v8->_daemonStartDate, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = objc_claimAutoreleasedReturnValue();
    lastQueryMetricSubmissionDate = v8->_lastQueryMetricSubmissionDate;
    v8->_lastQueryMetricSubmissionDate = (NSDate *)v12;

  }
  return v8;
}

- (double)timeSinceLastQueryMetricsSubmission
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastQueryMetricSubmissionDate);
  v5 = v4;

  return v5;
}

- (double)timeSinceDaemonStart
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_daemonStartDate);
  v5 = v4;

  return v5;
}

- (id)convertToDictionary
{
  RTAuthorizedLocationCurationMetrics *v3;
  RTAuthorizedLocationQueryMetrics *v4;
  RTAuthorizedLocationDatabaseInitializationMetrics *v5;
  RTAuthorizedLocationDatabaseInitializationMetrics *v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;
  float v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  RTAuthorizedLocationDatabaseInitializationMetrics *v38;
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
  unsigned int v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[32];
  _QWORD v61[34];

  v61[32] = *MEMORY[0x1E0C80C00];
  v3 = self->_curationMetrics;
  v4 = self->_queryMetrics;
  v5 = self->_initializationMetrics;
  v6 = v5;
  if (v3)
  {
    if (v5)
      goto LABEL_3;
LABEL_8:
    v6 = objc_alloc_init(RTAuthorizedLocationDatabaseInitializationMetrics);
    if (v4)
      goto LABEL_4;
    goto LABEL_9;
  }
  v3 = objc_alloc_init(RTAuthorizedLocationCurationMetrics);
  if (!v6)
    goto LABEL_8;
LABEL_3:
  if (v4)
    goto LABEL_4;
LABEL_9:
  v4 = objc_alloc_init(RTAuthorizedLocationQueryMetrics);
LABEL_4:
  -[RTAuthorizedLocationQueryMetrics userTimeOffsetHours](v4, "userTimeOffsetHours");
  v8 = v7;
  -[RTAuthorizedLocationQueryMetrics userTimeOffsetHours](v4, "userTimeOffsetHours");
  v10 = v9 <= 0.0;
  v11 = -0.5;
  if (!v10)
    v11 = 0.5;
  v12 = (float)(int)(float)(v11 + (float)(v8 * 10.0)) * 0.1;
  -[RTAuthorizedLocationMetrics timeSinceDaemonStart](self, "timeSinceDaemonStart");
  v51 = (int)fmin(floor(v13 / 3600.0), 100.0);
  v60[0] = CFSTR("MaxCumulativeDwellTimeForNotFamiliarLois");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationCurationMetrics maxCumulativeDwellTimeForNotFamiliarLoiHours](v3, "maxCumulativeDwellTimeForNotFamiliarLoiHours");
  objc_msgSend(v14, "numberWithFloat:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v59;
  v60[1] = CFSTR("MaxUniqueVisitDaysForNotFamiliarLois");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationCurationMetrics maxUniqueVisitDaysForNotFamiliarLois](v3, "maxUniqueVisitDaysForNotFamiliarLois"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v58;
  v60[2] = CFSTR("AgeDaysRegistry");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationCurationMetrics ageDaysRegistry](v3, "ageDaysRegistry"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v57;
  v60[3] = CFSTR("AgeDaysFirstAnyLoiVisit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationCurationMetrics ageDaysFirstAnyLoiVisit](v3, "ageDaysFirstAnyLoiVisit"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v56;
  v60[4] = CFSTR("AgeDaysFirstTopLoiVisit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationCurationMetrics ageDaysFirstTopLoiVisit](v3, "ageDaysFirstTopLoiVisit"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v55;
  v60[5] = CFSTR("AgeDaysFirstTopLoiRegisteredVisit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationCurationMetrics ageDaysFirstTopLoiRegisteredVisit](v3, "ageDaysFirstTopLoiRegisteredVisit"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v54;
  v60[6] = CFSTR("AgeDaysFirstTopLoiGeoVisit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationCurationMetrics ageDaysFirstTopLoiGeoVisit](v3, "ageDaysFirstTopLoiGeoVisit"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v53;
  v60[7] = CFSTR("VisitRegistrationFraction");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationCurationMetrics visitRegistrationFraction](v3, "visitRegistrationFraction");
  objc_msgSend(v15, "numberWithFloat:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v50;
  v60[8] = CFSTR("RegistrationUsesBestTimeFraction");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationCurationMetrics registrationUsesBestTimeFraction](v3, "registrationUsesBestTimeFraction");
  objc_msgSend(v16, "numberWithFloat:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[8] = v49;
  v60[9] = CFSTR("TotalNumberOfVisitsToTopLOIWithKnownTechnology");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationCurationMetrics visitsToTopLOIWithTechAvailabilityKnown](v3, "visitsToTopLOIWithTechAvailabilityKnown"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[9] = v48;
  v60[10] = CFSTR("FractionOfVisitsToTopLOIWithGPS");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationCurationMetrics fractionOfVisitsToTopLOIWithGPS](v3, "fractionOfVisitsToTopLOIWithGPS");
  objc_msgSend(v17, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[10] = v47;
  v60[11] = CFSTR("FractionOfVisitsToTopLOIWithWiFiHI");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationCurationMetrics fractionOfVisitsToTopLOIWithWiFiHI](v3, "fractionOfVisitsToTopLOIWithWiFiHI");
  objc_msgSend(v18, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[11] = v46;
  v60[12] = CFSTR("EraseInstallInitializationAttemptCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationDatabaseInitializationMetrics eraseInstallInitializationAttemptCount](v6, "eraseInstallInitializationAttemptCount"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[12] = v45;
  v60[13] = CFSTR("EraseInstallInitializationCompletionTimeHours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationDatabaseInitializationMetrics eraseInstallInitializationCompletionTimeHours](v6, "eraseInstallInitializationCompletionTimeHours"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v61[13] = v44;
  v60[14] = CFSTR("VisitsRegisteredDuringEraseInstallInitialization");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationDatabaseInitializationMetrics numberOfVisitsRegisteredDuringEraseInstallInitialization](v6, "numberOfVisitsRegisteredDuringEraseInstallInitialization"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v61[14] = v43;
  v60[15] = CFSTR("FamiliarLoisGeneratedDuringEraseInstallInitialization");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationDatabaseInitializationMetrics numberOfALOIsGeneratedDuringEraseInstallInitialization](v6, "numberOfALOIsGeneratedDuringEraseInstallInitialization"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[15] = v42;
  v60[16] = CFSTR("DaemonResponseLatencyMs");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationQueryMetrics daemonResponseLatencyMs](v4, "daemonResponseLatencyMs");
  objc_msgSend(v19, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v61[16] = v41;
  v60[17] = CFSTR("LoiFamiliarityRank");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationQueryMetrics loiFamiliarityRank](v4, "loiFamiliarityRank"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v61[17] = v40;
  v60[18] = CFSTR("NormalizedDistanceToCentroid");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationQueryMetrics normalizedDistanceToCentroid](v4, "normalizedDistanceToCentroid");
  objc_msgSend(v20, "numberWithFloat:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v61[18] = v39;
  v60[19] = CFSTR("NumFamiliarLoi");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationQueryMetrics numFamiliarLois](v4, "numFamiliarLois"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v61[19] = v37;
  v60[20] = CFSTR("RejectionReasonCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationQueryMetrics rejectionReasonCode](v4, "rejectionReasonCode"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v61[20] = v36;
  v60[21] = CFSTR("IsLoiHistoricallyLocationStarved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RTAuthorizedLocationQueryMetrics isHistoricallyALowDiversityLocation](v4, "isHistoricallyALowDiversityLocation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v61[21] = v35;
  v60[22] = CFSTR("ResponseValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RTAuthorizedLocationQueryMetrics responseValue](v4, "responseValue"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v61[22] = v34;
  v60[23] = CFSTR("TechnologyAvailability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationQueryMetrics technologyAvailability](v4, "technologyAvailability"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v61[23] = v33;
  v60[24] = CFSTR("UserTimeOffset");
  *(float *)&v21 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[24] = v22;
  v60[25] = CFSTR("VisitDwell");
  v38 = v6;
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationQueryMetrics visitDwellMinutes](v4, "visitDwellMinutes");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[25] = v24;
  v60[26] = CFSTR("LocationAgeMinutes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationQueryMetrics locationAgeMinutes](v4, "locationAgeMinutes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61[26] = v25;
  v60[27] = CFSTR("HistoricalRejectionReasonCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RTAuthorizedLocationQueryMetrics historicalRejectionReasonCode](v4, "historicalRejectionReasonCode"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v61[27] = v26;
  v60[28] = CFSTR("HistoricalRejectionSpeedMps");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[RTAuthorizedLocationQueryMetrics historicalRejectionSpeedMps](v4, "historicalRejectionSpeedMps");
  objc_msgSend(v27, "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v61[28] = v28;
  v60[29] = CFSTR("LocationServicesEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_locationServicesEnabled);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v61[29] = v29;
  v60[30] = CFSTR("RoutineEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_routineEnabled);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v61[30] = v30;
  v60[31] = CFSTR("TimeSinceDaemonStartHours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[31] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 32);
  v52 = (id)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (void)submitToCoreAnalytics
{
  NSDate *v3;
  NSDate *lastQueryMetricSubmissionDate;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];

  if (self->_queryMetrics)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastQueryMetricSubmissionDate = self->_lastQueryMetricSubmissionDate;
    self->_lastQueryMetricSubmissionDate = v3;

  }
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke;
  v18[3] = &unk_1E929BFE0;
  v18[4] = self;
  v6 = (void *)MEMORY[0x1D8232094](v18, a2);
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = v5;
  v13 = 3221225472;
  v14 = __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke_2;
  v15 = &unk_1E929B460;
  v16 = (id)objc_msgSend(v7, "initWithCString:encoding:", RTAnalyticsEventDiscreteLoiFamiliarity, 1);
  v17 = v6;
  v8 = v16;
  v9 = v6;
  v10 = (void *)MEMORY[0x1D8232094](&v12);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v8, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

uint64_t __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertToDictionary");
}

id __52__RTAuthorizedLocationMetrics_submitToCoreAnalytics__block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

- (RTAuthorizedLocationCurationMetrics)curationMetrics
{
  return self->_curationMetrics;
}

- (void)setCurationMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_curationMetrics, a3);
}

- (RTAuthorizedLocationDatabaseInitializationMetrics)initializationMetrics
{
  return self->_initializationMetrics;
}

- (void)setInitializationMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_initializationMetrics, a3);
}

- (RTAuthorizedLocationQueryMetrics)queryMetrics
{
  return self->_queryMetrics;
}

- (void)setQueryMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_queryMetrics, a3);
}

- (NSDate)daemonStartDate
{
  return self->_daemonStartDate;
}

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (NSDate)lastQueryMetricSubmissionDate
{
  return self->_lastQueryMetricSubmissionDate;
}

- (void)setLastQueryMetricSubmissionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueryMetricSubmissionDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQueryMetricSubmissionDate, 0);
  objc_storeStrong((id *)&self->_daemonStartDate, 0);
  objc_storeStrong((id *)&self->_queryMetrics, 0);
  objc_storeStrong((id *)&self->_initializationMetrics, 0);
  objc_storeStrong((id *)&self->_curationMetrics, 0);
}

@end
