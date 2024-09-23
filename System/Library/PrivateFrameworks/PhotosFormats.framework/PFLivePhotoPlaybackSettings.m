@implementation PFLivePhotoPlaybackSettings

- (PFLivePhotoPlaybackSettings)init
{
  PFLivePhotoPlaybackSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFLivePhotoPlaybackSettings;
  result = -[PFLivePhotoPlaybackSettings init](&v3, sel_init);
  result->_audioVolume = 1.0;
  return result;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setVideoComposition:(id)a3
{
  objc_storeStrong((id *)&self->_videoComposition, a3);
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComposition, 0);
}

@end
