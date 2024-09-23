@implementation SignpostReporterObjectFilter

- (BOOL)_objectPassesStringFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  int v20;

  v4 = a3;
  if ((id)-[SignpostReporterObjectFilter platform](self, "platform") == (id)1
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subsystem")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name")),
        v8 = IsPerfLoggingInterval(v5, v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string1Value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string2Value"));
    v11 = PassesPerfLoggingAllowlist(v9, v10);

    if (!v11)
      goto LABEL_21;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  if (!SignpostReporterShouldUseAllowlist())
  {
LABEL_19:
    LOBYTE(v20) = 1;
    goto LABEL_20;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string1Name"));

  if (v13)
    v14 = v12;
  else
    v14 = 1;
  if ((v14 & 1) == 0 && (sub_100003F08(v4, -[SignpostReporterObjectFilter platform](self, "platform")) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string1Value"));
    v16 = StringPassesSignpostReporterStringAllowlist(v15, -[SignpostReporterObjectFilter platform](self, "platform"));

    if (!v16)
    {
LABEL_21:
      LOBYTE(v20) = 0;
      goto LABEL_20;
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string2Name"));

  if (v17)
    v18 = v12;
  else
    v18 = 1;
  if ((v18 & 1) != 0)
    goto LABEL_19;
  if ((sub_1000042D0(v4) & 1) != 0)
    goto LABEL_19;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string2Value"));
  v20 = StringPassesSignpostReporterStringAllowlist(v19, -[SignpostReporterObjectFilter platform](self, "platform"));

  if (v20)
    goto LABEL_19;
LABEL_20:

  return v20;
}

- (BOOL)shouldReportSignpostObject:(id)a3 classificationOut:(unint64_t *)a4
{
  id v6;
  float v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  if (objc_msgSend(v6, "canGenerateCoreAnalyticsPayload"))
  {
    if (objc_msgSend(v6, "telemetryEnabled"))
    {
      objc_msgSend(v6, "durationSeconds");
      if (v7 >= 0.0)
      {
        if (-[SignpostReporterObjectFilter _objectPassesStringFilter:](self, "_objectPassesStringFilter:", v6))
        {
          v11 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter scnFilter](self, "scnFilter"));
          if (v11)
          {
            v12 = (void *)v11;
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter scnFilter](self, "scnFilter"));
            v8 = objc_msgSend(v13, "shouldReportObject:", v6);

            if (v8)
              v9 = 1;
            else
              v9 = 4;
          }
          else
          {
            LOBYTE(v8) = 1;
            v9 = 1;
          }
        }
        else
        {
          LOBYTE(v8) = 0;
          v9 = 2;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
        v9 = 3;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
      v9 = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    v9 = 5;
  }
  if (a4)
    *a4 = v9;
  -[SignpostReporterObjectFilter incrementTotalForObject:classification:](self, "incrementTotalForObject:classification:", v6, v9);

  return v8;
}

- (id)_init
{
  SignpostReporterObjectFilter *v2;
  SignpostReporterAggregation *v3;
  SignpostReporterAggregation *allInspectedSignpostObjectsAggregation;
  SignpostReporterAggregation *v5;
  SignpostReporterAggregation *telemetryReportedAggregation;
  SignpostReporterAggregation *v7;
  SignpostReporterAggregation *telemetryDisabledAggregation;
  SignpostReporterAggregation *v9;
  SignpostReporterAggregation *telemetryNotReportedFailedStringAllowlistAggregation;
  SignpostReporterAggregation *v11;
  SignpostReporterAggregation *telemetryNotReportedFailedSCFilterAggregation;
  SignpostReporterAggregation *v13;
  SignpostReporterAggregation *telemetryNotReportedDurationThresholdAggregation;
  SignpostReporterAggregation *v15;
  SignpostReporterAggregation *telemetryNotReportedClassNotSupportedAggregation;
  SignpostReporterAggregation *v17;
  SignpostReporterAggregation *telemetryReportedEventsAggregation;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SignpostReporterObjectFilter;
  v2 = -[SignpostReporterObjectFilter init](&v20, "init");
  if (v2)
  {
    v3 = objc_alloc_init(SignpostReporterAggregation);
    allInspectedSignpostObjectsAggregation = v2->_allInspectedSignpostObjectsAggregation;
    v2->_allInspectedSignpostObjectsAggregation = v3;

    v5 = objc_alloc_init(SignpostReporterAggregation);
    telemetryReportedAggregation = v2->_telemetryReportedAggregation;
    v2->_telemetryReportedAggregation = v5;

    v7 = objc_alloc_init(SignpostReporterAggregation);
    telemetryDisabledAggregation = v2->_telemetryDisabledAggregation;
    v2->_telemetryDisabledAggregation = v7;

    v9 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedFailedStringAllowlistAggregation = v2->_telemetryNotReportedFailedStringAllowlistAggregation;
    v2->_telemetryNotReportedFailedStringAllowlistAggregation = v9;

    v11 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedFailedSCFilterAggregation = v2->_telemetryNotReportedFailedSCFilterAggregation;
    v2->_telemetryNotReportedFailedSCFilterAggregation = v11;

    v13 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedDurationThresholdAggregation = v2->_telemetryNotReportedDurationThresholdAggregation;
    v2->_telemetryNotReportedDurationThresholdAggregation = v13;

    v15 = objc_alloc_init(SignpostReporterAggregation);
    telemetryNotReportedClassNotSupportedAggregation = v2->_telemetryNotReportedClassNotSupportedAggregation;
    v2->_telemetryNotReportedClassNotSupportedAggregation = v15;

    v17 = objc_alloc_init(SignpostReporterAggregation);
    telemetryReportedEventsAggregation = v2->_telemetryReportedEventsAggregation;
    v2->_telemetryReportedEventsAggregation = v17;

  }
  return v2;
}

- (SignpostReporterObjectFilter)init
{
  SignpostReporterObjectFilter *v2;
  id v3;
  uint64_t v4;
  SRSubsystemCategoryNameFilter *scnFilter;

  v2 = -[SignpostReporterObjectFilter _init](self, "_init");
  if (v2)
  {
    v2->_platform = sub_100002B3C();
    v3 = sub_1000031B0(-[SignpostReporterObjectFilter platform](v2, "platform"));
    v4 = objc_claimAutoreleasedReturnValue(v3);
    scnFilter = v2->_scnFilter;
    v2->_scnFilter = (SRSubsystemCategoryNameFilter *)v4;

  }
  return v2;
}

- (SignpostReporterObjectFilter)initWithPlatform:(unint64_t)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  void *v8;
  SignpostReporterObjectFilter *v9;

  if (a3)
  {
    v4 = -[SignpostReporterObjectFilter _init](self, "_init");
    v5 = v4;
    if (v4)
    {
      v4[1] = a3;
      v6 = sub_1000031B0((uint64_t)objc_msgSend(v4, "platform"));
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)v5[16];
      v5[16] = v7;

    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)incrementTotalForObject:(id)a3 classification:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subsystem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter allInspectedSignpostObjectsAggregation](self, "allInspectedSignpostObjectsAggregation"));
  objc_msgSend(v8, "incrementSubsystem:category:", v6, v7);

  switch(a4)
  {
    case 0uLL:
      v9 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryDisabledAggregation](self, "telemetryDisabledAggregation"));
      goto LABEL_9;
    case 1uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryReportedAggregation](self, "telemetryReportedAggregation"));
      v10 = 1;
      goto LABEL_10;
    case 2uLL:
      v9 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryNotReportedFailedStringAllowlistAggregation](self, "telemetryNotReportedFailedStringAllowlistAggregation"));
      goto LABEL_9;
    case 3uLL:
      v9 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryNotReportedDurationThresholdAggregation](self, "telemetryNotReportedDurationThresholdAggregation"));
      goto LABEL_9;
    case 4uLL:
      v9 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryNotReportedFailedSCFilterAggregation](self, "telemetryNotReportedFailedSCFilterAggregation"));
      goto LABEL_9;
    case 5uLL:
      v9 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryNotReportedClassNotSupportedAggregation](self, "telemetryNotReportedClassNotSupportedAggregation"));
LABEL_9:
      v11 = (void *)v9;
      v10 = 0;
LABEL_10:
      objc_msgSend(v11, "incrementSubsystem:category:", v6, v7);

      break;
    default:
      v10 = 0;
      break;
  }
  v12 = objc_opt_class(SignpostAnimationInterval);
  if ((objc_opt_isKindOfClass(v16, v12) & 1) != 0)
  {
    if (v10)
      ++self->_totalReportedAnimationCount;
    else
      ++self->_totalUnreportedAnimationCount;
  }
  else
  {
    v13 = objc_opt_class(SignpostInterval);
    if ((objc_opt_isKindOfClass(v16, v13) & 1) != 0)
    {
      if (v10)
        ++self->_totalReportedIntervalCount;
      else
        ++self->_totalUnreportedIntervalCount;
    }
    else
    {
      v14 = objc_opt_class(SignpostEvent);
      if ((objc_opt_isKindOfClass(v16, v14) & 1) != 0)
      {
        if (v10)
        {
          ++self->_totalReportedEventCount;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryReportedEventsAggregation](self, "telemetryReportedEventsAggregation"));
          objc_msgSend(v15, "incrementSubsystem:category:", v6, v7);

        }
        else
        {
          ++self->_totalUnreportedEventCount;
        }
      }
    }
  }

}

- (unint64_t)platform
{
  return self->_platform;
}

- (SignpostReporterAggregation)allInspectedSignpostObjectsAggregation
{
  return self->_allInspectedSignpostObjectsAggregation;
}

- (SignpostReporterAggregation)telemetryReportedEventsAggregation
{
  return self->_telemetryReportedEventsAggregation;
}

- (SignpostReporterAggregation)telemetryReportedAggregation
{
  return self->_telemetryReportedAggregation;
}

- (SignpostReporterAggregation)telemetryDisabledAggregation
{
  return self->_telemetryDisabledAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedFailedStringAllowlistAggregation
{
  return self->_telemetryNotReportedFailedStringAllowlistAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedFailedSCFilterAggregation
{
  return self->_telemetryNotReportedFailedSCFilterAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedDurationThresholdAggregation
{
  return self->_telemetryNotReportedDurationThresholdAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedClassNotSupportedAggregation
{
  return self->_telemetryNotReportedClassNotSupportedAggregation;
}

- (unint64_t)totalUnreportedIntervalCount
{
  return self->_totalUnreportedIntervalCount;
}

- (unint64_t)totalReportedIntervalCount
{
  return self->_totalReportedIntervalCount;
}

- (unint64_t)totalUnreportedAnimationCount
{
  return self->_totalUnreportedAnimationCount;
}

- (unint64_t)totalReportedAnimationCount
{
  return self->_totalReportedAnimationCount;
}

- (unint64_t)totalUnreportedEventCount
{
  return self->_totalUnreportedEventCount;
}

- (unint64_t)totalReportedEventCount
{
  return self->_totalReportedEventCount;
}

- (SRSubsystemCategoryNameFilter)scnFilter
{
  return self->_scnFilter;
}

- (void)setScnFilter:(id)a3
{
  objc_storeStrong((id *)&self->_scnFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scnFilter, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedClassNotSupportedAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedDurationThresholdAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedFailedSCFilterAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryNotReportedFailedStringAllowlistAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryDisabledAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryReportedAggregation, 0);
  objc_storeStrong((id *)&self->_telemetryReportedEventsAggregation, 0);
  objc_storeStrong((id *)&self->_allInspectedSignpostObjectsAggregation, 0);
}

@end
