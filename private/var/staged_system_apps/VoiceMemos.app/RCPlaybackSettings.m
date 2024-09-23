@implementation RCPlaybackSettings

- (RCPlaybackSettings)initWithUUID:(id)a3 enhanced:(BOOL)a4 silenceRemoved:(BOOL)a5 playbackSpeed:(double)a6
{
  id v11;
  RCPlaybackSettings *v12;
  RCPlaybackSettings *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCPlaybackSettings;
  v12 = -[RCPlaybackSettings init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    v13->_enhanced = a4;
    v13->_silenceRemoved = a5;
    v13->_playbackSpeed = a6;
  }

  return v13;
}

- (BOOL)hasCustomizedPlaybackSettings
{
  double v4;

  if (-[RCPlaybackSettings enhanced](self, "enhanced") || -[RCPlaybackSettings silenceRemoved](self, "silenceRemoved"))
    return 1;
  -[RCPlaybackSettings playbackSpeed](self, "playbackSpeed");
  return v4 != 1.0;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)enhanced
{
  return self->_enhanced;
}

- (void)setEnhanced:(BOOL)a3
{
  self->_enhanced = a3;
}

- (BOOL)silenceRemoved
{
  return self->_silenceRemoved;
}

- (void)setSilenceRemoved:(BOOL)a3
{
  self->_silenceRemoved = a3;
}

- (double)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(double)a3
{
  self->_playbackSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
