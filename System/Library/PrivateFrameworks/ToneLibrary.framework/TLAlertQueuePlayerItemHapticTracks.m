@implementation TLAlertQueuePlayerItemHapticTracks

- (TLAlertQueuePlayerItemHapticTracks)initWithHapticPlayerItemTrack:(id)a3 attenuatedHapticPlayerItemTrack:(id)a4
{
  id v7;
  id v8;
  TLAlertQueuePlayerItemHapticTracks *v9;
  TLAlertQueuePlayerItemHapticTracks *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TLAlertQueuePlayerItemHapticTracks;
  v9 = -[TLAlertQueuePlayerItemHapticTracks init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hapticPlayerItemTrack, a3);
    objc_storeStrong((id *)&v10->_attenuatedHapticPlayerItemTrack, a4);
  }

  return v10;
}

- (AVPlayerItemTrack)hapticPlayerItemTrack
{
  return self->_hapticPlayerItemTrack;
}

- (AVPlayerItemTrack)attenuatedHapticPlayerItemTrack
{
  return self->_attenuatedHapticPlayerItemTrack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attenuatedHapticPlayerItemTrack, 0);
  objc_storeStrong((id *)&self->_hapticPlayerItemTrack, 0);
}

@end
