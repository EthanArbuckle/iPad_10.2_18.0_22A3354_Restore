@implementation VSDownloadMetrics

- (VSDownloadMetrics)initWithVoiceName:(id)a3 languageCode:(id)a4 gender:(int64_t)a5
{
  id v7;
  id v8;
  VSDownloadMetrics *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *voiceDownloadKey;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VSDownloadMetrics;
  v7 = a4;
  v8 = a3;
  v9 = -[VSDownloadMetrics init](&v15, sel_init);
  v9->_downloadBeginTimestamp = mach_absolute_time();
  v10 = (void *)MEMORY[0x1E0CB3940];
  +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@:%@"), v7, v11, v8);
  v12 = objc_claimAutoreleasedReturnValue();

  voiceDownloadKey = v9->_voiceDownloadKey;
  v9->_voiceDownloadKey = (NSString *)v12;

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;

  -[VSDownloadMetrics dictionaryMetrics](self, "dictionaryMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryMetrics
{
  const __CFString *voiceDownloadKey;
  void *v4;
  void *v5;
  NSNumber *downloadSize;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *clientBundleIdentifier;
  void *v14;
  void *v15;
  _QWORD v17[9];
  _QWORD v18[10];

  v18[9] = *MEMORY[0x1E0C80C00];
  voiceDownloadKey = (const __CFString *)self->_voiceDownloadKey;
  if (!voiceDownloadKey)
    voiceDownloadKey = &stru_1EA8B0C98;
  v18[0] = voiceDownloadKey;
  v17[0] = CFSTR("voice_asset_key");
  v17[1] = CFSTR("allowing_cellular");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCellularAllowed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("discretionary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_discretionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  downloadSize = self->_downloadSize;
  v18[2] = v5;
  v18[3] = downloadSize;
  v17[3] = CFSTR("download_size");
  v17[4] = CFSTR("download_duration");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[VSDownloadMetrics downloadDuration](self, "downloadDuration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v8;
  v17[5] = CFSTR("download_progress");
  *(float *)&v9 = self->_downloadProgress;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v10;
  v17[6] = CFSTR("error_code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_errorCode);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  clientBundleIdentifier = (const __CFString *)self->_clientBundleIdentifier;
  if (!clientBundleIdentifier)
    clientBundleIdentifier = &stru_1EA8B0C98;
  v18[6] = v11;
  v18[7] = clientBundleIdentifier;
  v17[7] = CFSTR("client_bundle_identifier");
  v17[8] = CFSTR("setup_duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_setupTimeInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)endMetrics
{
  int64_t downloadEndTimestamp;

  downloadEndTimestamp = self->_downloadEndTimestamp;
  if (!downloadEndTimestamp)
    self->_downloadEndTimestamp = mach_absolute_time();
  return downloadEndTimestamp == 0;
}

- (double)downloadDuration
{
  uint64_t downloadEndTimestamp;
  double v4;
  double v5;

  downloadEndTimestamp = self->_downloadEndTimestamp;
  if (!downloadEndTimestamp)
    downloadEndTimestamp = mach_absolute_time();
  v4 = (double)(downloadEndTimestamp - self->_downloadBeginTimestamp);
  +[VSDownloadMetrics _clockFactor](VSDownloadMetrics, "_clockFactor");
  return v5 * v4;
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isCellularAllowed
{
  return self->_isCellularAllowed;
}

- (void)setIsCellularAllowed:(BOOL)a3
{
  self->_isCellularAllowed = a3;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (NSNumber)downloadSize
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDownloadSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (double)setupTimeInterval
{
  return self->_setupTimeInterval;
}

- (void)setSetupTimeInterval:(double)a3
{
  self->_setupTimeInterval = a3;
}

- (NSString)voiceDownloadKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)downloadBeginTimestamp
{
  return self->_downloadBeginTimestamp;
}

- (int64_t)downloadEndTimestamp
{
  return self->_downloadEndTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceDownloadKey, 0);
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

+ (double)_clockFactor
{
  if (_clockFactor_onceToken_286 != -1)
    dispatch_once(&_clockFactor_onceToken_286, &__block_literal_global_287);
  return *(double *)&_clockFactor_clockToSeconds_288;
}

double __33__VSDownloadMetrics__clockFactor__block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  _clockFactor_clockToSeconds_288 = *(_QWORD *)&result;
  return result;
}

@end
