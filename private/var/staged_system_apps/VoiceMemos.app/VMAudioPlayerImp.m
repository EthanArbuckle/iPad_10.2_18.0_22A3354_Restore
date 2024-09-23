@implementation VMAudioPlayerImp

- (VMAudioPlayerImp)init
{
  VMAudioPlayerImp *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMAudioPlayerImp;
  result = -[VMAudioPlayerImp init](&v3, "init");
  if (result)
  {
    result->_targetRate = 1.0;
    result->_playableRange = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeEverything;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[VMAudioService stopPlaying:](self->_service, "stopPlaying:", self);
  v3.receiver = self;
  v3.super_class = (Class)VMAudioPlayerImp;
  -[VMAudioPlayerImp dealloc](&v3, "dealloc");
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (double)playerTime
{
  double result;

  if (-[VMPlayerItem seeking](self->_playerItem, "seeking"))
    return self->_targetTime;
  -[VMPlayerItem currentTime](self->_playerItem, "currentTime");
  return result;
}

- (void)setPlayerTime:(double)a3
{
  self->_targetTime = a3;
  -[VMAudioService setTime:controller:](self->_service, "setTime:controller:", self);
}

- (void)setCurrentRate:(float)a3
{
  self->_currentRate = a3;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (void)setCurrentState:(int)a3
{
  int currentState;
  int targetState;
  double beginTime;

  currentState = self->_currentState;
  self->_currentState = a3;
  if ((a3 == 3) != -[VMAudioPlayerImp playing](self, "playing"))
    -[VMAudioPlayerImp setPlaying:](self, "setPlaying:", a3 == 3);
  if (a3 == 4 && currentState == 3)
  {
    targetState = self->_targetState;
    if (targetState == 4)
    {
      -[VMAudioPlayerImp playerTime](self, "playerTime");
    }
    else
    {
      if (targetState != 3)
        return;
      beginTime = self->_playableRange.beginTime;
    }
    self->_targetTime = beginTime;
  }
}

- (void)setPlaybackError:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_playbackError, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "setPlaybackError:", v5);

}

- (BOOL)startPlaying
{
  self->_targetState = 3;
  -[VMAudioService startPlaying:](self->_service, "startPlaying:", self);
  return 1;
}

- (BOOL)stopPlaying
{
  self->_targetState = 4;
  return -[VMAudioService pausePlaying:](self->_service, "pausePlaying:", self);
}

- (float)rate
{
  return self->_targetRate;
}

- (void)setRate:(float)a3
{
  self->_targetRate = a3;
  -[VMAudioService setTargetRate:controller:](self->_service, "setTargetRate:controller:", self);
}

- (void)setSilenceRemoverEnabled:(BOOL)a3
{
  self->_silenceRemoverEnabled = a3;
  -[VMAudioService setSilenceRemoverEnabled:controller:](self->_service, "setSilenceRemoverEnabled:controller:");
}

- (void)setPlayableRange:(id)a3
{
  double var1;
  void *v4;
  id v5;

  var1 = a3.var1;
  self->_playableRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioPlayerImp playerItem](self, "playerItem"));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setPlayableRangeEndTime:", var1);
    v4 = v5;
  }

}

- (BOOL)willPlayPendingPreparation
{
  if (self->_targetState != 3)
    return 0;
  if ((self->_currentState - 1) >= 2)
    return -[VMPlayerItem seeking](self->_playerItem, "seeking");
  return 1;
}

- (float)targetRate
{
  return self->_targetRate;
}

- (void)setTargetRate:(float)a3
{
  self->_targetRate = a3;
}

- (double)targetTime
{
  return self->_targetTime;
}

- (void)setTargetTime:(double)a3
{
  self->_targetTime = a3;
}

- (int)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(int)a3
{
  self->_targetState = a3;
}

- (float)currentRate
{
  return self->_currentRate;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (int)currentState
{
  return self->_currentState;
}

- (NSString)recordingID
{
  return self->_recordingID;
}

- (void)setRecordingID:(id)a3
{
  objc_storeStrong((id *)&self->_recordingID, a3);
}

- (_TtC10VoiceMemos12VMPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (RCSSavedRecordingAccessToken)playbackToken
{
  return self->_playbackToken;
}

- (void)setPlaybackToken:(id)a3
{
  objc_storeStrong((id *)&self->_playbackToken, a3);
}

- (NSError)playbackError
{
  return self->_playbackError;
}

- (VMAudioPlayerController)controller
{
  return (VMAudioPlayerController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)playableRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_playableRange.beginTime;
  endTime = self->_playableRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (BOOL)silenceRemoverEnabled
{
  return self->_silenceRemoverEnabled;
}

- (VMAudioService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_playbackError, 0);
  objc_storeStrong((id *)&self->_playbackToken, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_recordingID, 0);
}

@end
