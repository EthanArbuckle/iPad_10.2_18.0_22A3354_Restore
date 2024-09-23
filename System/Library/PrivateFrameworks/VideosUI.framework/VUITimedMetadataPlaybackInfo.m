@implementation VUITimedMetadataPlaybackInfo

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VUITimedMetadataPlaybackInfo programId](self, "programId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITimedMetadataPlaybackInfo currentTime](self, "currentTime");
  v6 = v5;
  -[VUITimedMetadataPlaybackInfo timeStamp](self, "timeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITimedMetadataPlaybackInfo playbackRate](self, "playbackRate");
  v9 = v8;
  -[VUITimedMetadataPlaybackInfo featureStartTime](self, "featureStartTime");
  v11 = v10;
  -[VUITimedMetadataPlaybackInfo audioLanguage](self, "audioLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITimedMetadataPlaybackInfo adamId](self, "adamId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITimedMetadataPlaybackInfo rawTimedMetadata](self, "rawTimedMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TimedMetadataPlaybackInfo(%p) programId: %@, currentTime: %f, timeStamp: %@, playbackRate: %f, featureStartTime: %f, audioLanguage: %@, adamId: %@, hasRawTimedMetadata: %d>"), self, v4, v6, v7, v9, v11, v12, v13, v14 != 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)programId
{
  return self->_programId;
}

- (void)setProgramId:(id)a3
{
  objc_storeStrong((id *)&self->_programId, a3);
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(double)a3
{
  self->_playbackRate = a3;
}

- (double)featureStartTime
{
  return self->_featureStartTime;
}

- (void)setFeatureStartTime:(double)a3
{
  self->_featureStartTime = a3;
}

- (NSString)audioLanguage
{
  return self->_audioLanguage;
}

- (void)setAudioLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_audioLanguage, a3);
}

- (NSString)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_adamId, a3);
}

- (NSData)rawTimedMetadata
{
  return self->_rawTimedMetadata;
}

- (void)setRawTimedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_rawTimedMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTimedMetadata, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_audioLanguage, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_programId, 0);
}

@end
