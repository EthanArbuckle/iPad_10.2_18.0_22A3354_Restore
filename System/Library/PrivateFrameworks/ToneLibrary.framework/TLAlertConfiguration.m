@implementation TLAlertConfiguration

- (TLAlertConfiguration)initWithType:(int64_t)a3
{
  TLAlertConfiguration *v4;
  TLAlertConfiguration *v5;
  NSString *topic;
  NSString *toneIdentifier;
  NSString *vibrationIdentifier;
  NSString *audioCategory;
  unint64_t type;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TLAlertConfiguration;
  v4 = -[TLAlertConfiguration init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    topic = v4->_topic;
    v4->_type = a3;
    v4->_topic = (NSString *)&stru_1E952DE48;

    toneIdentifier = v5->_toneIdentifier;
    v5->_toneIdentifier = (NSString *)&stru_1E952DE48;

    vibrationIdentifier = v5->_vibrationIdentifier;
    v5->_vibrationIdentifier = (NSString *)&stru_1E952DE48;

    audioCategory = v5->_audioCategory;
    v5->_audioCategory = (NSString *)&stru_1E952DE48;

    type = v5->_type;
    v11 = type >= 0x1C;
    v13 = type == 28;
    v12 = (1 << type) & 0x10006002;
    v13 = !v13 && v11 || v12 == 0;
    if (!v13)
      v5->_shouldRepeat = 1;
    v5->_audioVolume = 1.0;
    v5->_targetDevice = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  int64_t type;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t externalToneMediaLibraryItemIdentifier;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  uint32x4_t v15;
  int64x2_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int8x16_t v24;

  type = self->_type;
  v4 = -[NSString hash](self->_topic, "hash");
  v5 = -[NSString hash](self->_toneIdentifier, "hash");
  v6 = -[NSString hash](self->_vibrationIdentifier, "hash");
  v7 = -[NSURL hash](self->_externalToneFileURL, "hash");
  externalToneMediaLibraryItemIdentifier = self->_externalToneMediaLibraryItemIdentifier;
  v9 = -[NSDictionary hash](self->_externalVibrationPattern, "hash");
  v10 = -[NSURL hash](self->_externalVibrationPatternFileURL, "hash");
  v11 = -[NSString hash](self->_audioCategory, "hash");
  v12 = llroundf(self->_audioVolume * 1000.0);
  v13 = self->_maximumDuration * 10000.0;
  v14 = llround(v13);
  LODWORD(v13) = *(_DWORD *)&self->_forPreview;
  v15 = vmovl_u16((uint16x4_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&v13)));
  v16.i64[0] = v15.u32[0];
  v16.i64[1] = v15.u32[1];
  v17 = (int8x16_t)vshrq_n_s64(vshlq_n_s64(v16, 0x38uLL), 0x38uLL);
  v16.i64[0] = v15.u32[2];
  v16.i64[1] = v15.u32[3];
  v18 = vbicq_s8((int8x16_t)xmmword_1D341A800, (int8x16_t)vshrq_n_s64(vshlq_n_s64(v16, 0x38uLL), 0x38uLL));
  v19 = vbicq_s8((int8x16_t)xmmword_1D341A810, v17);
  v20 = llround(self->_audioPlaybackInitiationDelay * 10000.0);
  v21 = 100000000;
  if (self->_shouldForcePlayingAtUserSelectedAudioVolume)
    v22 = 100000000;
  else
    v22 = 0;
  if (!self->_shouldIgnoreAccessibilityDisabledVibrationSetting)
    v21 = 0;
  v23 = 100;
  if (!self->_hasCustomAudioVolume)
    v23 = 0;
  v24 = veorq_s8(v19, v18);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v24.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)) ^ v22 ^ (v21 | v23) ^ type ^ externalToneMediaLibraryItemIdentifier ^ llround(self->_audioVolumeRampingDuration * 10000.0) ^ v20 ^ (1000000000 * self->_targetDevice) ^ v12 ^ v11 ^ v14 ^ v10 ^ v9 ^ v7 ^ v6 ^ v5 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  TLAlertConfiguration *v4;
  TLAlertConfiguration *v5;
  NSString *topic;
  NSString *toneIdentifier;
  NSString *vibrationIdentifier;
  NSURL *externalToneFileURL;
  NSDictionary *externalVibrationPattern;
  NSURL *externalVibrationPatternFileURL;
  NSString *audioCategory;
  BOOL v13;

  v4 = (TLAlertConfiguration *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v13 = self->_type == v5->_type
         && ((topic = self->_topic, topic == v5->_topic) || -[NSString isEqualToString:](topic, "isEqualToString:"))
         && ((toneIdentifier = self->_toneIdentifier, toneIdentifier == v5->_toneIdentifier)
          || -[NSString isEqualToString:](toneIdentifier, "isEqualToString:"))
         && ((vibrationIdentifier = self->_vibrationIdentifier, vibrationIdentifier == v5->_vibrationIdentifier)
          || -[NSString isEqualToString:](vibrationIdentifier, "isEqualToString:"))
         && ((externalToneFileURL = self->_externalToneFileURL, externalToneFileURL == v5->_externalToneFileURL)
          || -[NSURL isEqual:](externalToneFileURL, "isEqual:"))
         && self->_externalToneMediaLibraryItemIdentifier == v5->_externalToneMediaLibraryItemIdentifier
         && ((externalVibrationPattern = self->_externalVibrationPattern,
              externalVibrationPattern == v5->_externalVibrationPattern)
          || -[NSDictionary isEqualToDictionary:](externalVibrationPattern, "isEqualToDictionary:"))
         && ((externalVibrationPatternFileURL = self->_externalVibrationPatternFileURL,
              externalVibrationPatternFileURL == v5->_externalVibrationPatternFileURL)
          || -[NSURL isEqual:](externalVibrationPatternFileURL, "isEqual:"))
         && ((audioCategory = self->_audioCategory, audioCategory == v5->_audioCategory)
          || -[NSString isEqualToString:](audioCategory, "isEqualToString:"))
         && self->_forPreview == v5->_forPreview
         && vabds_f32(self->_audioVolume, v5->_audioVolume) < 0.00000011921
         && vabdd_f64(self->_maximumDuration, v5->_maximumDuration) < 0.00000011920929
         && self->_prefersToDisallowExternalPlayback == v5->_prefersToDisallowExternalPlayback
         && self->_shouldRepeat == v5->_shouldRepeat
         && self->_shouldIgnoreRingerSwitch == v5->_shouldIgnoreRingerSwitch
         && self->_shouldForcePlayingAtUserSelectedAudioVolume == v5->_shouldForcePlayingAtUserSelectedAudioVolume
         && self->_shouldIgnoreAccessibilityDisabledVibrationSetting == v5->_shouldIgnoreAccessibilityDisabledVibrationSetting
         && self->_targetDevice == v5->_targetDevice
         && self->_hasCustomAudioVolume == v5->_hasCustomAudioVolume
         && self->_audioPlaybackInitiationDelay == v5->_audioPlaybackInitiationDelay
         && self->_audioVolumeRampingDuration == v5->_audioVolumeRampingDuration;

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t targetDevice;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _TLAlertTypeGetHumanReadableDescription(self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; type = %@"), v7);

  if (-[NSString length](self->_topic, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; topic = \"%@\"), self->_topic);
  if (-[NSString length](self->_toneIdentifier, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; toneIdentifier = \"%@\"), self->_toneIdentifier);
  if (-[NSString length](self->_vibrationIdentifier, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; vibrationIdentifier = \"%@\"), self->_vibrationIdentifier);
  if (self->_externalToneFileURL)
    objc_msgSend(v6, "appendFormat:", CFSTR("; externalToneFileURL = %@"), self->_externalToneFileURL);
  if (self->_externalToneMediaLibraryItemIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; externalToneMediaLibraryItemIdentifier = %llu"),
      self->_externalToneMediaLibraryItemIdentifier);
  if (self->_externalVibrationPattern)
    objc_msgSend(v6, "appendString:", CFSTR("; has externalVibrationPattern"));
  if (self->_externalVibrationPatternFileURL)
    objc_msgSend(v6, "appendFormat:", CFSTR("; externalVibrationPatternFileURL = %@"),
      self->_externalVibrationPatternFileURL);
  if (-[NSString length](self->_audioCategory, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; audioCategory = \"%@\"), self->_audioCategory);
  if (self->_hasCustomAudioVolume)
    objc_msgSend(v6, "appendFormat:", CFSTR("; audioVolume = %f"), self->_audioVolume);
  if (self->_forPreview)
    objc_msgSend(v6, "appendString:", CFSTR("; isForPreview = YES"));
  if (self->_maximumDuration > 0.00000011920929)
    objc_msgSend(v6, "appendFormat:", CFSTR("; maximumDuration = %f"), *(_QWORD *)&self->_maximumDuration);
  if (self->_prefersToDisallowExternalPlayback)
    objc_msgSend(v6, "appendString:", CFSTR("; prefersToDisallowExternalPlayback = YES"));
  if (self->_shouldRepeat)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldRepeat = YES"));
  if (self->_shouldIgnoreRingerSwitch)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldIgnoreRingerSwitch = YES"));
  if (self->_shouldForcePlayingAtUserSelectedAudioVolume)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldForcePlayingAtUserSelectedAudioVolume = YES"));
  if (self->_shouldIgnoreAccessibilityDisabledVibrationSetting)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldIgnoreAccessibilityDisabledVibrationSetting = YES"));
  targetDevice = self->_targetDevice;
  if (targetDevice)
  {
    _TLAlertTargetDeviceGetHumanReadableDescription(targetDevice);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; targetDevice = %@"), v9);

  }
  if (self->_audioPlaybackInitiationDelay > 0.00000011920929)
    objc_msgSend(v6, "appendFormat:", CFSTR("; audioPlaybackInitiationDelay = %f"),
      *(_QWORD *)&self->_audioPlaybackInitiationDelay);
  if (self->_audioVolumeRampingDuration > 0.00000011920929)
    objc_msgSend(v6, "appendFormat:", CFSTR("; audioVolumeRampingDuration = %f"),
      *(_QWORD *)&self->_audioVolumeRampingDuration);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TLAlertConfiguration *v4;
  uint64_t v5;
  NSString *topic;
  uint64_t v7;
  NSString *toneIdentifier;
  uint64_t v9;
  NSString *vibrationIdentifier;
  uint64_t v11;
  NSURL *externalToneFileURL;
  uint64_t v13;
  NSDictionary *externalVibrationPattern;
  uint64_t v15;
  NSURL *externalVibrationPatternFileURL;
  uint64_t v17;
  NSString *audioCategory;

  v4 = -[TLAlertConfiguration initWithType:]([TLAlertConfiguration alloc], "initWithType:", self->_type);
  if (v4)
  {
    v5 = -[NSString copy](self->_topic, "copy");
    topic = v4->_topic;
    v4->_topic = (NSString *)v5;

    v7 = -[NSString copy](self->_toneIdentifier, "copy");
    toneIdentifier = v4->_toneIdentifier;
    v4->_toneIdentifier = (NSString *)v7;

    v9 = -[NSString copy](self->_vibrationIdentifier, "copy");
    vibrationIdentifier = v4->_vibrationIdentifier;
    v4->_vibrationIdentifier = (NSString *)v9;

    v11 = -[NSURL copy](self->_externalToneFileURL, "copy");
    externalToneFileURL = v4->_externalToneFileURL;
    v4->_externalToneFileURL = (NSURL *)v11;

    v4->_externalToneMediaLibraryItemIdentifier = self->_externalToneMediaLibraryItemIdentifier;
    v13 = -[NSDictionary copy](self->_externalVibrationPattern, "copy");
    externalVibrationPattern = v4->_externalVibrationPattern;
    v4->_externalVibrationPattern = (NSDictionary *)v13;

    v15 = -[NSURL copy](self->_externalVibrationPatternFileURL, "copy");
    externalVibrationPatternFileURL = v4->_externalVibrationPatternFileURL;
    v4->_externalVibrationPatternFileURL = (NSURL *)v15;

    v17 = -[NSString copy](self->_audioCategory, "copy");
    audioCategory = v4->_audioCategory;
    v4->_audioCategory = (NSString *)v17;

    v4->_audioVolume = self->_audioVolume;
    v4->_forPreview = self->_forPreview;
    v4->_maximumDuration = self->_maximumDuration;
    v4->_prefersToDisallowExternalPlayback = self->_prefersToDisallowExternalPlayback;
    v4->_shouldRepeat = self->_shouldRepeat;
    v4->_shouldIgnoreRingerSwitch = self->_shouldIgnoreRingerSwitch;
    v4->_shouldForcePlayingAtUserSelectedAudioVolume = self->_shouldForcePlayingAtUserSelectedAudioVolume;
    v4->_shouldIgnoreAccessibilityDisabledVibrationSetting = self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
    v4->_targetDevice = self->_targetDevice;
    v4->_hasCustomAudioVolume = self->_hasCustomAudioVolume;
    v4->_audioPlaybackInitiationDelay = self->_audioPlaybackInitiationDelay;
    v4->_audioVolumeRampingDuration = self->_audioVolumeRampingDuration;
  }
  return v4;
}

- (TLAlertConfiguration)initWithCoder:(id)a3
{
  id v4;
  TLAlertConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *topic;
  void *v9;
  uint64_t v10;
  NSString *toneIdentifier;
  void *v12;
  uint64_t v13;
  NSString *vibrationIdentifier;
  void *v15;
  uint64_t v16;
  NSURL *externalToneFileURL;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *externalVibrationPattern;
  void *v28;
  uint64_t v29;
  NSURL *externalVibrationPatternFileURL;
  void *v31;
  uint64_t v32;
  NSString *audioCategory;
  float v34;
  double v35;
  void *v36;
  double v37;
  double v38;

  v4 = a3;
  v5 = -[TLAlertConfiguration initWithType:](self, "initWithType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    topic = v5->_topic;
    v5->_topic = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toneIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    toneIdentifier = v5->_toneIdentifier;
    v5->_toneIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vibrationIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    vibrationIdentifier = v5->_vibrationIdentifier;
    v5->_vibrationIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalToneFileURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    externalToneFileURL = v5->_externalToneFileURL;
    v5->_externalToneFileURL = (NSURL *)v16;

    v5->_externalToneMediaLibraryItemIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("externalToneMediaLibraryItemIdentifier"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("externalVibrationPattern"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    externalVibrationPattern = v5->_externalVibrationPattern;
    v5->_externalVibrationPattern = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalVibrationPatternFileURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    externalVibrationPatternFileURL = v5->_externalVibrationPatternFileURL;
    v5->_externalVibrationPatternFileURL = (NSURL *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioCategory"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    audioCategory = v5->_audioCategory;
    v5->_audioCategory = (NSString *)v32;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("audioVolume"));
    v5->_audioVolume = v34;
    v5->_forPreview = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isForPreview"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumDuration"));
    v5->_maximumDuration = v35;
    v5->_prefersToDisallowExternalPlayback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersToDisallowExternalPlayback"));
    v5->_shouldRepeat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRepeat"));
    v5->_shouldIgnoreRingerSwitch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIgnoreRingerSwitch"));
    v5->_shouldForcePlayingAtUserSelectedAudioVolume = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldForcePlayingAtUserSelectedAudioVolume"));
    v5->_shouldIgnoreAccessibilityDisabledVibrationSetting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIgnoreAccessibilityDisabledVibrationSetting"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetDevice"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetDevice = TLAlertTargetDeviceFromString(v36);
    v5->_hasCustomAudioVolume = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCustomAudioVolume"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("audioPlaybackInitiationDelay"));
    v5->_audioPlaybackInitiationDelay = v37;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("audioVolumeRampingDuration"));
    v5->_audioVolumeRampingDuration = v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  double v6;
  id v7;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topic, CFSTR("topic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toneIdentifier, CFSTR("toneIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vibrationIdentifier, CFSTR("vibrationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalToneFileURL, CFSTR("externalToneFileURL"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_externalToneMediaLibraryItemIdentifier, CFSTR("externalToneMediaLibraryItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVibrationPattern, CFSTR("externalVibrationPattern"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVibrationPatternFileURL, CFSTR("externalVibrationPatternFileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioCategory, CFSTR("audioCategory"));
  *(float *)&v6 = self->_audioVolume;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("audioVolume"), v6);
  objc_msgSend(v5, "encodeBool:forKey:", self->_forPreview, CFSTR("isForPreview"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maximumDuration"), self->_maximumDuration);
  objc_msgSend(v5, "encodeBool:forKey:", self->_prefersToDisallowExternalPlayback, CFSTR("prefersToDisallowExternalPlayback"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRepeat, CFSTR("shouldRepeat"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldIgnoreRingerSwitch, CFSTR("shouldIgnoreRingerSwitch"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldForcePlayingAtUserSelectedAudioVolume, CFSTR("shouldForcePlayingAtUserSelectedAudioVolume"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldIgnoreAccessibilityDisabledVibrationSetting, CFSTR("shouldIgnoreAccessibilityDisabledVibrationSetting"));
  NSStringFromTLAlertTargetDevice(self->_targetDevice);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("targetDevice"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCustomAudioVolume, CFSTR("hasCustomAudioVolume"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("audioPlaybackInitiationDelay"), self->_audioPlaybackInitiationDelay);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("audioVolumeRampingDuration"), self->_audioVolumeRampingDuration);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_freeze
{
  self->_isFrozen = 1;
}

- (void)_throwForFrozenInstance
{
  if (self->_isFrozen)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Instances of TLAlertConfiguration cannot be mutated once they've been used to make an instance of TLAlert. Please make a copy of the TLAlertConfiguration instead."));
}

- (void)setTopic:(id)a3
{
  NSString *v4;
  NSString *topic;
  int64_t type;
  BOOL v7;
  int v8;
  double v9;
  id v10;

  v10 = a3;
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  v4 = (NSString *)objc_msgSend(v10, "copy");
  topic = self->_topic;
  self->_topic = v4;

  type = self->_type;
  if (type == 13)
  {
    if (self->_hasCustomRepeatingFlag)
      goto LABEL_15;
    self->_shouldRepeat = objc_msgSend(v10, "isEqualToString:", CFSTR("TLAlertTopicAlarmGoToSleep")) ^ 1;
    type = self->_type;
  }
  if (type == 1)
  {
    if (self->_hasCustomRepeatingFlag)
      goto LABEL_15;
    v7 = (objc_msgSend(v10, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeGroupInvitation")) & 1) == 0
      && !objc_msgSend(v10, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeParticipantJoined"));
    self->_shouldRepeat = v7;
    type = self->_type;
  }
  if (type == 16)
  {
    v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationFindMyDevice"));
    v9 = 0.0;
    if (v8)
      v9 = 5.0;
    self->_audioPlaybackInitiationDelay = v9;
    self->_audioVolumeRampingDuration = v9;
  }
LABEL_15:

}

- (void)setToneIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *toneIdentifier;

  v4 = a3;
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  v5 = (NSString *)objc_msgSend(v4, "copy");

  toneIdentifier = self->_toneIdentifier;
  self->_toneIdentifier = v5;

}

- (void)setVibrationIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *vibrationIdentifier;

  v4 = a3;
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  v5 = (NSString *)objc_msgSend(v4, "copy");

  vibrationIdentifier = self->_vibrationIdentifier;
  self->_vibrationIdentifier = v5;

}

- (void)setExternalToneFileURL:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *externalToneFileURL;

  v4 = a3;
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  v5 = (NSURL *)objc_msgSend(v4, "copy");

  externalToneFileURL = self->_externalToneFileURL;
  self->_externalToneFileURL = v5;

}

- (void)setExternalToneMediaLibraryItemIdentifier:(unint64_t)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_externalToneMediaLibraryItemIdentifier = a3;
}

- (void)setExternalVibrationPattern:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *externalVibrationPattern;

  v4 = a3;
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");

  externalVibrationPattern = self->_externalVibrationPattern;
  self->_externalVibrationPattern = v5;

}

- (void)setExternalVibrationPatternFileURL:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *externalVibrationPatternFileURL;

  v4 = a3;
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  v5 = (NSURL *)objc_msgSend(v4, "copy");

  externalVibrationPatternFileURL = self->_externalVibrationPatternFileURL;
  self->_externalVibrationPatternFileURL = v5;

}

- (void)setAudioCategory:(id)a3
{
  id v4;
  NSString *v5;
  NSString *audioCategory;

  v4 = a3;
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  v5 = (NSString *)objc_msgSend(v4, "copy");

  audioCategory = self->_audioCategory;
  self->_audioCategory = v5;

}

- (void)setAudioVolume:(float)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_audioVolume = a3;
  self->_hasCustomAudioVolume = 1;
}

- (void)setForPreview:(BOOL)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_forPreview = a3;
}

- (void)setMaximumDuration:(double)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_maximumDuration = a3;
}

- (void)setPrefersToDisallowExternalPlayback:(BOOL)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_prefersToDisallowExternalPlayback = a3;
}

- (void)setShouldRepeat:(BOOL)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_shouldRepeat = a3;
  self->_hasCustomRepeatingFlag = 1;
}

- (void)setShouldIgnoreRingerSwitch:(BOOL)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_shouldIgnoreRingerSwitch = a3;
}

- (void)setShouldForcePlayingAtUserSelectedAudioVolume:(BOOL)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_shouldForcePlayingAtUserSelectedAudioVolume = a3;
}

- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_shouldIgnoreAccessibilityDisabledVibrationSetting = a3;
}

- (void)setTargetDevice:(int64_t)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_targetDevice = a3;
}

- (void)_setAudioPlaybackInitiationDelay:(double)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_audioPlaybackInitiationDelay = a3;
}

- (void)_setAudioVolumeRampingDuration:(double)a3
{
  -[TLAlertConfiguration _throwForFrozenInstance](self, "_throwForFrozenInstance");
  self->_audioVolumeRampingDuration = a3;
}

- (BOOL)_hasCustomAudioVolume
{
  return self->_hasCustomAudioVolume;
}

- (double)_audioPlaybackInitiationDelay
{
  return self->_audioPlaybackInitiationDelay;
}

- (double)_audioVolumeRampingDuration
{
  return self->_audioVolumeRampingDuration;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (NSURL)externalToneFileURL
{
  return self->_externalToneFileURL;
}

- (unint64_t)externalToneMediaLibraryItemIdentifier
{
  return self->_externalToneMediaLibraryItemIdentifier;
}

- (NSDictionary)externalVibrationPattern
{
  return self->_externalVibrationPattern;
}

- (NSURL)externalVibrationPatternFileURL
{
  return self->_externalVibrationPatternFileURL;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (BOOL)isForPreview
{
  return self->_forPreview;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (BOOL)prefersToDisallowExternalPlayback
{
  return self->_prefersToDisallowExternalPlayback;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (BOOL)shouldIgnoreRingerSwitch
{
  return self->_shouldIgnoreRingerSwitch;
}

- (BOOL)shouldForcePlayingAtUserSelectedAudioVolume
{
  return self->_shouldForcePlayingAtUserSelectedAudioVolume;
}

- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting
{
  return self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_externalVibrationPatternFileURL, 0);
  objc_storeStrong((id *)&self->_externalVibrationPattern, 0);
  objc_storeStrong((id *)&self->_externalToneFileURL, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
