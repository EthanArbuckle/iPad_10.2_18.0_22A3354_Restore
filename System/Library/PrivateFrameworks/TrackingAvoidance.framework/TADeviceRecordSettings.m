@implementation TADeviceRecordSettings

- (double)purgeTimeInterval
{
  return self->_purgeTimeInterval;
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (TADeviceRecordSettings)init
{
  uint64_t v3;

  LOBYTE(v3) = 1;
  return -[TADeviceRecordSettings initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:](self, "initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:", 22, 4, 1, 1, 1, 22, 90000.0, 3600.0, 7200.0, 28800.0, 3600.0, 3600.0, 960.0,
           28800.0,
           v3,
           0x40AC200000000000,
           0x40AC200000000000);
}

- (TADeviceRecordSettings)initWithExpiryTimeInterval:(double)a3 purgeTimeInterval:(double)a4 keepAliveInterval:(double)a5 minimumStagingInterval:(double)a6 stagingBackstopHour:(unint64_t)a7 assumedKeyRollHour:(unint64_t)a8 scanInterval:(double)a9 surfaceImmediatelyBeepOnMove:(BOOL)a10 surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:(BOOL)a11 maxExpectedHELEWildInterval:(double)a12 maxExpectedDurianWildInterval:(double)a13 shouldAlertHELEImmediatelyForImmediateTypes:(BOOL)a14 minimumHELEStagingInterval:(double)a15 stagingHELEBackstopHour:(unint64_t)a16 surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:(BOOL)a17 hyperHELEStagingInterval:(double)a18 hyperStagingInterval:(double)a19
{
  TADeviceRecordSettings *result;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)TADeviceRecordSettings;
  result = -[TADeviceRecordSettings init](&v34, sel_init);
  if (result)
  {
    result->_expiryTimeInterval = a3;
    result->_purgeTimeInterval = a4;
    result->_keepAliveInterval = a5;
    result->_minimumStagingInterval = a6;
    result->_stagingBackstopHour = a7;
    result->_assumedKeyRollHour = a8;
    result->_surfaceImmediatelyBeepOnMove = a10;
    result->_surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll = a11;
    result->_scanInterval = a9;
    result->_maxExpectedHELEWildInterval = a12;
    result->_shouldAlertHELEImmediatelyForImmediateTypes = a14;
    result->_maxExpectedDurianWildInterval = a13;
    result->_minimumHELEStagingInterval = a15;
    result->_stagingHELEBackstopHour = a16;
    result->_surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll = a17;
    result->_hyperHELEStagingInterval = a18;
    result->_hyperStagingInterval = a19;
  }
  return result;
}

- (TADeviceRecordSettings)initWithExpiryTimeIntervalOrDefault:(id)a3 purgeTimeIntervalOrDefault:(id)a4 keepAliveIntervalOrDefault:(id)a5 minimumStagingIntervalOrDefault:(id)a6 stagingBackstopHourOrDefault:(id)a7 assumedKeyRollHourOrDefault:(id)a8 scanIntervalOrDefault:(id)a9 surfaceImmediatelyBeepOnMoveOrDefault:(id)a10 surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:(id)a11 maxExpectedHELEWildIntervalOrDefault:(id)a12 maxExpectedDurianWildIntervalOrDefault:(id)a13 shouldAlertHELEImmediatelyForImmediateTypesOrDefault:(id)a14 minimumHELEStagingIntervalOrDefault:(id)a15 stagingHELEBackstopHourOrDefault:(id)a16 surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyrollOrDefault:(id)a17 hyperHELEStagingIntervalOrDefault:(id)a18 hyperStagingIntervalOrDefault:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  TADeviceRecordSettings *v57;
  uint64_t v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;

  v76 = a3;
  v75 = a4;
  v74 = a5;
  v73 = a6;
  v70 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v29 = a13;
  v30 = a14;
  v31 = a15;
  v72 = a16;
  v71 = a17;
  v77 = a18;
  v32 = a19;
  if (v76)
    objc_msgSend(v76, "doubleValue");
  else
    *(double *)&v33 = 90000.0;
  v65 = *(double *)&v33;
  if (v75)
    objc_msgSend(v75, "doubleValue");
  else
    *(double *)&v34 = 3600.0;
  v64 = *(double *)&v34;
  v66 = v32;
  if (v74)
  {
    objc_msgSend(v74, "doubleValue");
    v36 = v35;
  }
  else
  {
    v36 = 7200.0;
  }
  if (v73)
  {
    objc_msgSend(v73, "doubleValue");
    v38 = v37;
  }
  else
  {
    v38 = 28800.0;
  }
  if (v70)
    v39 = objc_msgSend(v70, "unsignedIntValue");
  else
    v39 = 22;
  v63 = v39;
  if (v24)
    v40 = objc_msgSend(v24, "unsignedIntValue");
  else
    v40 = 4;
  v62 = v40;
  if (v25)
  {
    objc_msgSend(v25, "doubleValue");
    v42 = v41;
    if (v26)
    {
LABEL_21:
      v61 = objc_msgSend(v26, "BOOLValue");
      goto LABEL_24;
    }
  }
  else
  {
    v42 = 3600.0;
    if (v26)
      goto LABEL_21;
  }
  v61 = 1;
LABEL_24:
  v69 = v26;
  if (v27)
  {
    v60 = objc_msgSend(v27, "BOOLValue");
    if (v28)
    {
LABEL_26:
      objc_msgSend(v28, "doubleValue");
      v44 = v43;
      goto LABEL_29;
    }
  }
  else
  {
    v60 = 1;
    if (v28)
      goto LABEL_26;
  }
  v44 = 3600.0;
LABEL_29:
  if (v29)
  {
    objc_msgSend(v29, "doubleValue");
    v46 = v45;
  }
  else
  {
    v46 = 960.0;
  }
  v67 = v27;
  if (v30)
  {
    v47 = objc_msgSend(v30, "BOOLValue");
    if (v31)
    {
LABEL_34:
      v48 = v31;
      objc_msgSend(v31, "doubleValue");
      v50 = v49;
      goto LABEL_37;
    }
  }
  else
  {
    v47 = 1;
    if (v31)
      goto LABEL_34;
  }
  v48 = v31;
  v50 = 28800.0;
LABEL_37:
  if (v72)
    v51 = objc_msgSend(v72, "unsignedIntValue");
  else
    v51 = 22;
  if (v71)
    v52 = objc_msgSend(v71, "BOOLValue");
  else
    v52 = 1;
  v53 = 0x40AC200000000000;
  v54 = 0x40AC200000000000;
  if (v77)
  {
    objc_msgSend(v77, "doubleValue");
    v54 = v55;
  }
  if (v66)
  {
    objc_msgSend(v66, "doubleValue");
    v53 = v56;
  }
  LOBYTE(v59) = v52;
  v57 = -[TADeviceRecordSettings initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:](self, "initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:", v63, v62, v61, v60, v47, v51, v65, v64, v36, v38, v42, v44, v46,
          v50,
          v59,
          v54,
          v53);

  return v57;
}

- (BOOL)isEqual:(id)a3
{
  TADeviceRecordSettings *v4;
  TADeviceRecordSettings *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  int64_t v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;

  v4 = (TADeviceRecordSettings *)a3;
  if (self == v4)
  {
    v43 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TADeviceRecordSettings expiryTimeInterval](self, "expiryTimeInterval");
      v7 = v6;
      -[TADeviceRecordSettings expiryTimeInterval](v5, "expiryTimeInterval");
      if (v7 != v8)
        goto LABEL_22;
      -[TADeviceRecordSettings purgeTimeInterval](self, "purgeTimeInterval");
      v10 = v9;
      -[TADeviceRecordSettings purgeTimeInterval](v5, "purgeTimeInterval");
      if (v10 != v11)
        goto LABEL_22;
      -[TADeviceRecordSettings keepAliveInterval](self, "keepAliveInterval");
      v13 = v12;
      -[TADeviceRecordSettings keepAliveInterval](v5, "keepAliveInterval");
      if (v13 != v14)
        goto LABEL_22;
      -[TADeviceRecordSettings minimumStagingInterval](self, "minimumStagingInterval");
      v16 = v15;
      -[TADeviceRecordSettings minimumStagingInterval](v5, "minimumStagingInterval");
      if (v16 != v17)
        goto LABEL_22;
      v18 = -[TADeviceRecordSettings stagingBackstopHour](self, "stagingBackstopHour");
      if (v18 != -[TADeviceRecordSettings stagingBackstopHour](v5, "stagingBackstopHour"))
        goto LABEL_22;
      v19 = -[TADeviceRecordSettings assumedKeyRollHour](self, "assumedKeyRollHour");
      if (v19 != -[TADeviceRecordSettings assumedKeyRollHour](v5, "assumedKeyRollHour"))
        goto LABEL_22;
      -[TADeviceRecordSettings scanInterval](self, "scanInterval");
      v21 = v20;
      -[TADeviceRecordSettings scanInterval](v5, "scanInterval");
      if (v21 != v22)
        goto LABEL_22;
      v23 = -[TADeviceRecordSettings surfaceImmediatelyBeepOnMove](self, "surfaceImmediatelyBeepOnMove");
      if (v23 != -[TADeviceRecordSettings surfaceImmediatelyBeepOnMove](v5, "surfaceImmediatelyBeepOnMove"))
        goto LABEL_22;
      v24 = -[TADeviceRecordSettings surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self, "surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll");
      if (v24 != -[TADeviceRecordSettings surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll](v5, "surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"))goto LABEL_22;
      -[TADeviceRecordSettings maxExpectedHELEWildInterval](self, "maxExpectedHELEWildInterval");
      v26 = v25;
      -[TADeviceRecordSettings maxExpectedHELEWildInterval](v5, "maxExpectedHELEWildInterval");
      if (v26 != v27)
        goto LABEL_22;
      -[TADeviceRecordSettings maxExpectedDurianWildInterval](self, "maxExpectedDurianWildInterval");
      v29 = v28;
      -[TADeviceRecordSettings maxExpectedDurianWildInterval](v5, "maxExpectedDurianWildInterval");
      if (v29 != v30)
        goto LABEL_22;
      v31 = -[TADeviceRecordSettings shouldAlertHELEImmediatelyForImmediateTypes](self, "shouldAlertHELEImmediatelyForImmediateTypes");
      if (v31 != -[TADeviceRecordSettings shouldAlertHELEImmediatelyForImmediateTypes](v5, "shouldAlertHELEImmediatelyForImmediateTypes"))goto LABEL_22;
      -[TADeviceRecordSettings minimumHELEStagingInterval](self, "minimumHELEStagingInterval");
      v33 = v32;
      -[TADeviceRecordSettings minimumHELEStagingInterval](v5, "minimumHELEStagingInterval");
      if (v33 != v34)
        goto LABEL_22;
      v35 = -[TADeviceRecordSettings stagingHELEBackstopHour](self, "stagingHELEBackstopHour");
      if (v35 == -[TADeviceRecordSettings stagingHELEBackstopHour](v5, "stagingHELEBackstopHour")
        && (v36 = -[TADeviceRecordSettings surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll](self, "surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"), v36 == -[TADeviceRecordSettings surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll](v5, "surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"))&& (-[TADeviceRecordSettings hyperHELEStagingInterval](self, "hyperHELEStagingInterval"), v38 = v37, -[TADeviceRecordSettings hyperHELEStagingInterval](v5, "hyperHELEStagingInterval"), v38 == v39))
      {
        -[TADeviceRecordSettings hyperStagingInterval](self, "hyperStagingInterval");
        v41 = v40;
        -[TADeviceRecordSettings hyperStagingInterval](v5, "hyperStagingInterval");
        v43 = v41 == v42;
      }
      else
      {
LABEL_22:
        v43 = 0;
      }

    }
    else
    {
      v43 = 0;
    }
  }

  return v43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TADeviceRecordSettings)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  _BOOL8 v15;
  _BOOL8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  double v32;
  double v33;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ExpiryInterval"));
  v33 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PurgeInterval"));
  v32 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("KeepAliveInterval"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MinStagingInterval"));
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BackstopHour"));
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("KeyRollHour"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ScanInterval"));
  v14 = v13;
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SurfaceImmediatelyBeepOnMove")) != 0;
  v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll")) != 0;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MaxExpectedHELEWildInterval"));
  v18 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MaxExpectedDurianWildInterval"));
  v20 = v19;
  v21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HELEImmediate"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MinHELEStagingInterval"));
  v23 = v22;
  v24 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HELEBackstopHour"));
  v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll")) != 0;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HyperHELEStagingInterval"));
  v27 = v26;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HyperStagingInterval"));
  v29 = v28;

  LOBYTE(v31) = v25;
  return -[TADeviceRecordSettings initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:](self, "initWithExpiryTimeInterval:purgeTimeInterval:keepAliveInterval:minimumStagingInterval:stagingBackstopHour:assumedKeyRollHour:scanInterval:surfaceImmediatelyBeepOnMove:surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll:maxExpectedHELEWildInterval:maxExpectedDurianWildInterval:shouldAlertHELEImmediatelyForImmediateTypes:minimumHELEStagingInterval:stagingHELEBackstopHour:surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll:hyperHELEStagingInterval:hyperStagingInterval:", v11, v12, v15, v16, v21, v24, v33, v32, v8, v10, v14, v18, v20,
           v23,
           v31,
           v27,
           v29);
}

- (void)encodeWithCoder:(id)a3
{
  double expiryTimeInterval;
  id v5;

  expiryTimeInterval = self->_expiryTimeInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ExpiryInterval"), expiryTimeInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("PurgeInterval"), self->_purgeTimeInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("KeepAliveInterval"), self->_keepAliveInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MinStagingInterval"), self->_minimumStagingInterval);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stagingBackstopHour, CFSTR("BackstopHour"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_assumedKeyRollHour, CFSTR("KeyRollHour"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ScanInterval"), self->_scanInterval);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_surfaceImmediatelyBeepOnMove, CFSTR("SurfaceImmediatelyBeepOnMove"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll, CFSTR("surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MaxExpectedHELEWildInterval"), self->_maxExpectedHELEWildInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MaxExpectedDurianWildInterval"), self->_maxExpectedDurianWildInterval);
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAlertHELEImmediatelyForImmediateTypes, CFSTR("HELEImmediate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("MinHELEStagingInterval"), self->_minimumHELEStagingInterval);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stagingHELEBackstopHour, CFSTR("HELEBackstopHour"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll, CFSTR("surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HyperHELEStagingInterval"), self->_hyperHELEStagingInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HyperStagingInterval"), self->_hyperStagingInterval);

}

- (double)expiryTimeInterval
{
  return self->_expiryTimeInterval;
}

- (void)setExpiryTimeInterval:(double)a3
{
  self->_expiryTimeInterval = a3;
}

- (void)setPurgeTimeInterval:(double)a3
{
  self->_purgeTimeInterval = a3;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (double)minimumStagingInterval
{
  return self->_minimumStagingInterval;
}

- (int64_t)stagingBackstopHour
{
  return self->_stagingBackstopHour;
}

- (int64_t)assumedKeyRollHour
{
  return self->_assumedKeyRollHour;
}

- (BOOL)surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll
{
  return self->_surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll;
}

- (BOOL)surfaceImmediatelyBeepOnMove
{
  return self->_surfaceImmediatelyBeepOnMove;
}

- (double)maxExpectedHELEWildInterval
{
  return self->_maxExpectedHELEWildInterval;
}

- (double)maxExpectedDurianWildInterval
{
  return self->_maxExpectedDurianWildInterval;
}

- (BOOL)shouldAlertHELEImmediatelyForImmediateTypes
{
  return self->_shouldAlertHELEImmediatelyForImmediateTypes;
}

- (double)minimumHELEStagingInterval
{
  return self->_minimumHELEStagingInterval;
}

- (int64_t)stagingHELEBackstopHour
{
  return self->_stagingHELEBackstopHour;
}

- (BOOL)surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll
{
  return self->_surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll;
}

- (double)hyperHELEStagingInterval
{
  return self->_hyperHELEStagingInterval;
}

- (double)hyperStagingInterval
{
  return self->_hyperStagingInterval;
}

@end
