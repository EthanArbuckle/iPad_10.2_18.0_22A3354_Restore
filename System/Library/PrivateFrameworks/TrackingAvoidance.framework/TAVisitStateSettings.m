@implementation TAVisitStateSettings

- (double)interVisitSnapshotUpdateInterval
{
  return self->_interVisitSnapshotUpdateInterval;
}

- (NSSet)sensitiveLOITypes
{
  return self->_sensitiveLOITypes;
}

- (double)thresholdOfLocationRelevance
{
  return self->_thresholdOfLocationRelevance;
}

- (TAVisitStateSettings)initWithVisitSnapshotCapacity:(unint64_t)a3 visitDisplayBufferCapacity:(unint64_t)a4 interVisitMetricSnapshotCapacity:(unint64_t)a5 interVisitSnapshotUpdateInterval:(double)a6 thresholdOfLocationRelevance:(double)a7 snapshotBufferTimeIntervalOfRetention:(double)a8 loiBufferPerTypeCapacity:(unint64_t)a9 loiBufferTimeIntervalOfRetention:(double)a10 maxNSigmaBetweenLastLocationAndVisit:(unint64_t)a11 qualitySnapshotDwellDuration:(double)a12 qualitySnapshotDisplayOnDuration:(double)a13 uniqueUTObservationCapPerVisit:(unint64_t)a14 sensitiveLOITypes:(id)a15
{
  id v28;
  TAVisitStateSettings *v29;
  TAVisitStateSettings *v30;
  objc_super v32;

  v28 = a15;
  v32.receiver = self;
  v32.super_class = (Class)TAVisitStateSettings;
  v29 = -[TAVisitStateSettings init](&v32, sel_init);
  v30 = v29;
  if (v29)
  {
    v29->_visitSnapshotCapacity = a3;
    v29->_visitDisplayBufferCapacity = a4;
    v29->_interVisitMetricSnapshotCapacity = a5;
    v29->_thresholdOfLocationRelevance = a7;
    v29->_interVisitSnapshotUpdateInterval = a6;
    v29->_snapshotBufferTimeIntervalOfRetention = a8;
    v29->_loiBufferPerTypeCapacity = a9;
    v29->_loiBufferTimeIntervalOfRetention = a10;
    v29->_maxNSigmaBetweenLastLocationAndVisit = a11;
    v29->_qualitySnapshotDwellDuration = a12;
    v29->_qualitySnapshotDisplayOnDuration = a13;
    v29->_uniqueUTObservationCapPerVisit = a14;
    objc_storeStrong((id *)&v29->_sensitiveLOITypes, a15);
  }

  return v30;
}

- (TAVisitStateSettings)initWithVisitSnapshotCapacityOrDefault:(id)a3 visitDisplayBufferCapacityOrDefault:(id)a4 interVisitMetricSnapshotCapacityOrDefault:(id)a5 interVisitSnapshotUpdateIntervalOrDefault:(id)a6 thresholdOfLocationRelevanceOrDefault:(id)a7 snapshotBufferTimeIntervalOfRetentionOrDefault:(id)a8 loiBufferPerTypeCapacityOrDefault:(id)a9 loiBufferTimeIntervalOfRetentionOrDefault:(id)a10 maxNSigmaBetweenLastLocationAndVisitOrDefault:(id)a11 qualitySnapshotDwellDurationOrDefault:(id)a12 qualitySnapshotDisplayOnDurationOrDefault:(id)a13 uniqueUTObservationCapPerVisitOrDefault:(id)a14 sensitiveLOITypesOrDefault:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  TAVisitStateSettings *v48;
  id v50;
  void *v51;
  TAFilterGeneralSettings *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;

  v20 = a3;
  v58 = a4;
  v21 = a5;
  v63 = a6;
  v22 = a7;
  v62 = a8;
  v23 = a9;
  v61 = a10;
  v60 = a11;
  v24 = a12;
  v25 = a13;
  v59 = a14;
  v26 = a15;
  if (v20)
    v55 = objc_msgSend(v20, "unsignedIntegerValue");
  else
    v55 = 288;
  v27 = v58;
  if (v58)
  {
    v54 = objc_msgSend(v58, "unsignedIntegerValue");
    if (v21)
    {
LABEL_6:
      v53 = objc_msgSend(v21, "unsignedIntegerValue");
      goto LABEL_9;
    }
  }
  else
  {
    v54 = 200;
    if (v21)
      goto LABEL_6;
  }
  v53 = 288;
LABEL_9:
  if (v63)
  {
    objc_msgSend(v63, "doubleValue");
    v29 = v28;
    if (v22)
    {
LABEL_11:
      objc_msgSend(v22, "doubleValue");
      v31 = v30;
      goto LABEL_14;
    }
  }
  else
  {
    v29 = 900.0;
    if (v22)
      goto LABEL_11;
  }
  v52 = -[TAFilterGeneralSettings initWithDefaults]([TAFilterGeneralSettings alloc], "initWithDefaults");
  -[TAFilterGeneralSettings thresholdOfLocationRelevance](v52, "thresholdOfLocationRelevance");
  v31 = v32;
LABEL_14:
  if (v62)
  {
    objc_msgSend(v62, "doubleValue");
    v34 = v33;
  }
  else
  {
    v34 = 86400.0;
  }
  v57 = v21;
  if (v23)
    v35 = objc_msgSend(v23, "unsignedIntegerValue");
  else
    v35 = 3;
  if (v61)
  {
    objc_msgSend(v61, "doubleValue");
    v37 = v36;
  }
  else
  {
    v37 = 86400.0;
  }
  if (v60)
  {
    v38 = objc_msgSend(v60, "unsignedIntValue");
    if (v24)
    {
LABEL_25:
      objc_msgSend(v24, "doubleValue");
      v40 = v39;
      goto LABEL_28;
    }
  }
  else
  {
    v38 = 2;
    if (v24)
      goto LABEL_25;
  }
  v40 = 600.0;
LABEL_28:
  v41 = v25;
  if (v25)
  {
    v42 = v24;
    v43 = v41;
    objc_msgSend(v41, "doubleValue");
    v45 = v44;
  }
  else
  {
    v43 = 0;
    v42 = v24;
    v45 = 120.0;
  }
  v46 = v23;
  if (v59)
  {
    v47 = objc_msgSend(v59, "unsignedIntegerValue");
    if (v26)
      goto LABEL_33;
LABEL_37:
    +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes](TAFilterVisitsSettings, "defaultVisitsSensitiveLOITypes");
    v50 = v20;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[TAVisitStateSettings initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:](self, "initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:", v55, v54, v53, v35, v38, v47, v29, v31, v34, v37, v40, v45, v51);

    v20 = v50;
    v27 = v58;
    if (v22)
      goto LABEL_35;
    goto LABEL_34;
  }
  v47 = 200;
  if (!v26)
    goto LABEL_37;
LABEL_33:
  v48 = -[TAVisitStateSettings initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:](self, "initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:", v55, v54, v53, v35, v38, v47, v29, v31, v34, v37, v40, v45, v26);
  if (!v22)
LABEL_34:

LABEL_35:
  return v48;
}

- (TAVisitStateSettings)initWithDefaults
{
  TAFilterGeneralSettings *v3;
  double v4;
  double v5;
  void *v6;
  TAVisitStateSettings *v7;

  v3 = -[TAFilterGeneralSettings initWithDefaults]([TAFilterGeneralSettings alloc], "initWithDefaults");
  -[TAFilterGeneralSettings thresholdOfLocationRelevance](v3, "thresholdOfLocationRelevance");
  v5 = v4;
  +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes](TAFilterVisitsSettings, "defaultVisitsSensitiveLOITypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TAVisitStateSettings initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:](self, "initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:", 288, 200, 288, 3, 2, 200, 900.0, v5, 86400.0, 86400.0, 600.0, 120.0, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  TAVisitStateSettings *v4;
  TAVisitStateSettings *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;

  v4 = (TAVisitStateSettings *)a3;
  if (self == v4)
  {
    v33 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[TAVisitStateSettings visitSnapshotCapacity](self, "visitSnapshotCapacity");
      if (v6 != -[TAVisitStateSettings visitSnapshotCapacity](v5, "visitSnapshotCapacity"))
        goto LABEL_18;
      v7 = -[TAVisitStateSettings visitDisplayBufferCapacity](self, "visitDisplayBufferCapacity");
      if (v7 != -[TAVisitStateSettings visitDisplayBufferCapacity](v5, "visitDisplayBufferCapacity"))
        goto LABEL_18;
      v8 = -[TAVisitStateSettings interVisitMetricSnapshotCapacity](self, "interVisitMetricSnapshotCapacity");
      if (v8 != -[TAVisitStateSettings interVisitMetricSnapshotCapacity](v5, "interVisitMetricSnapshotCapacity"))
        goto LABEL_18;
      -[TAVisitStateSettings interVisitSnapshotUpdateInterval](self, "interVisitSnapshotUpdateInterval");
      v10 = v9;
      -[TAVisitStateSettings interVisitSnapshotUpdateInterval](v5, "interVisitSnapshotUpdateInterval");
      if (v10 != v11)
        goto LABEL_18;
      -[TAVisitStateSettings thresholdOfLocationRelevance](self, "thresholdOfLocationRelevance");
      v13 = v12;
      -[TAVisitStateSettings thresholdOfLocationRelevance](v5, "thresholdOfLocationRelevance");
      if (v13 != v14)
        goto LABEL_18;
      -[TAVisitStateSettings snapshotBufferTimeIntervalOfRetention](self, "snapshotBufferTimeIntervalOfRetention");
      v16 = v15;
      -[TAVisitStateSettings snapshotBufferTimeIntervalOfRetention](v5, "snapshotBufferTimeIntervalOfRetention");
      if (v16 != v17)
        goto LABEL_18;
      v18 = -[TAVisitStateSettings loiBufferPerTypeCapacity](self, "loiBufferPerTypeCapacity");
      if (v18 != -[TAVisitStateSettings loiBufferPerTypeCapacity](v5, "loiBufferPerTypeCapacity"))
        goto LABEL_18;
      -[TAVisitStateSettings loiBufferTimeIntervalOfRetention](self, "loiBufferTimeIntervalOfRetention");
      v20 = v19;
      -[TAVisitStateSettings loiBufferTimeIntervalOfRetention](v5, "loiBufferTimeIntervalOfRetention");
      if (v20 != v21)
        goto LABEL_18;
      v22 = -[TAVisitStateSettings maxNSigmaBetweenLastLocationAndVisit](self, "maxNSigmaBetweenLastLocationAndVisit");
      if (v22 == -[TAVisitStateSettings maxNSigmaBetweenLastLocationAndVisit](v5, "maxNSigmaBetweenLastLocationAndVisit")&& (-[TAVisitStateSettings qualitySnapshotDwellDuration](self, "qualitySnapshotDwellDuration"), v24 = v23, -[TAVisitStateSettings qualitySnapshotDwellDuration](v5, "qualitySnapshotDwellDuration"), v24 == v25)&& (-[TAVisitStateSettings qualitySnapshotDisplayOnDuration](self, "qualitySnapshotDisplayOnDuration"), v27 = v26, -[TAVisitStateSettings qualitySnapshotDisplayOnDuration](v5, "qualitySnapshotDisplayOnDuration"), v27 == v28))
      {
        -[TAVisitStateSettings sensitiveLOITypes](self, "sensitiveLOITypes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVisitStateSettings sensitiveLOITypes](v5, "sensitiveLOITypes");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 == v30)
        {
          v33 = 1;
        }
        else
        {
          -[TAVisitStateSettings sensitiveLOITypes](self, "sensitiveLOITypes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVisitStateSettings sensitiveLOITypes](v5, "sensitiveLOITypes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqual:", v32);

        }
      }
      else
      {
LABEL_18:
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }
  }

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitStateSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  TAVisitStateSettings *v27;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VisitCap"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VisitDisplayCap"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("InterCap"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("InterUpdateInterval"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ThresLocRel"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SnapshotRetention"));
  v13 = v12;
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LOICap"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("LOIRetention"));
  v16 = v15;
  v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaxNSigma"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MinDwell"));
  v19 = v18;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MinDisplay"));
  v21 = v20;
  v22 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PerVisitCacheCap"));
  v23 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("SensitiveLOITypes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[TAVisitStateSettings initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:](self, "initWithVisitSnapshotCapacity:visitDisplayBufferCapacity:interVisitMetricSnapshotCapacity:interVisitSnapshotUpdateInterval:thresholdOfLocationRelevance:snapshotBufferTimeIntervalOfRetention:loiBufferPerTypeCapacity:loiBufferTimeIntervalOfRetention:maxNSigmaBetweenLastLocationAndVisit:qualitySnapshotDwellDuration:qualitySnapshotDisplayOnDuration:uniqueUTObservationCapPerVisit:sensitiveLOITypes:", v5, v6, v7, v14, v17, v22, v9, v11, v13, v16, v19, v21, v26);
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t visitSnapshotCapacity;
  id v5;

  visitSnapshotCapacity = self->_visitSnapshotCapacity;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", visitSnapshotCapacity, CFSTR("VisitCap"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_visitDisplayBufferCapacity, CFSTR("VisitDisplayCap"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interVisitMetricSnapshotCapacity, CFSTR("InterCap"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("InterUpdateInterval"), self->_interVisitSnapshotUpdateInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ThresLocRel"), self->_thresholdOfLocationRelevance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SnapshotRetention"), self->_snapshotBufferTimeIntervalOfRetention);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_loiBufferPerTypeCapacity, CFSTR("LOICap"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("LOIRetention"), self->_loiBufferTimeIntervalOfRetention);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxNSigmaBetweenLastLocationAndVisit, CFSTR("MaxNSigma"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MinDwell"), self->_qualitySnapshotDwellDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MinDisplay"), self->_qualitySnapshotDisplayOnDuration);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_uniqueUTObservationCapPerVisit, CFSTR("PerVisitCacheCap"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sensitiveLOITypes, CFSTR("SensitiveLOITypes"));

}

- (unint64_t)visitSnapshotCapacity
{
  return self->_visitSnapshotCapacity;
}

- (unint64_t)visitDisplayBufferCapacity
{
  return self->_visitDisplayBufferCapacity;
}

- (unint64_t)interVisitMetricSnapshotCapacity
{
  return self->_interVisitMetricSnapshotCapacity;
}

- (double)snapshotBufferTimeIntervalOfRetention
{
  return self->_snapshotBufferTimeIntervalOfRetention;
}

- (unint64_t)loiBufferPerTypeCapacity
{
  return self->_loiBufferPerTypeCapacity;
}

- (double)loiBufferTimeIntervalOfRetention
{
  return self->_loiBufferTimeIntervalOfRetention;
}

- (unint64_t)maxNSigmaBetweenLastLocationAndVisit
{
  return self->_maxNSigmaBetweenLastLocationAndVisit;
}

- (double)qualitySnapshotDwellDuration
{
  return self->_qualitySnapshotDwellDuration;
}

- (double)qualitySnapshotDisplayOnDuration
{
  return self->_qualitySnapshotDisplayOnDuration;
}

- (unint64_t)uniqueUTObservationCapPerVisit
{
  return self->_uniqueUTObservationCapPerVisit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveLOITypes, 0);
}

@end
