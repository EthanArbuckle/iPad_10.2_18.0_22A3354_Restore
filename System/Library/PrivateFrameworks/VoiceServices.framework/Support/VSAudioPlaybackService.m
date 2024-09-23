@implementation VSAudioPlaybackService

- (VSAudioPlaybackService)initWithAudioSessionID:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4 useAVSBAR:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  VSAudioPlaybackService *v8;
  __objc2_class *v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  VSAudioPlaybackServiceProtocol *implementation;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  VSAudioPlaybackService *v26;
  VSAudioRouteInfo *v27;
  VSAudioRouteInfo *outputRouteInfo;
  NSObject *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  uint64_t v37;
  void *v38;
  uint8_t v39[128];
  uint8_t buf[16];
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)VSAudioPlaybackService;
  v8 = -[VSAudioPlaybackService init](&v36, sel_init);
  if (!v8)
  {
LABEL_22:
    v26 = v8;
    goto LABEL_23;
  }
  if (v5)
    v9 = VSAudioPlaybackServiceAVSBAR;
  else
    v9 = VSAudioPlaybackServiceAT;
  v10 = [v9 alloc];
  v11 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  v41 = v11;
  v42 = *(_QWORD *)&a4->mBitsPerChannel;
  v12 = objc_msgSend(v10, "initWithAudioSessionID:asbd:", v7, buf);
  implementation = v8->_implementation;
  v8->_implementation = (VSAudioPlaybackServiceProtocol *)v12;

  if (v8->_implementation)
  {
    VSGetLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    v8->_playbackIntervalId = os_signpost_id_generate(v14);

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDB1858], "retrieveSessionWithID:", -[VSAudioPlaybackServiceProtocol sessionID](v8->_implementation, "sessionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentRoute");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v16, "outputs", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v22), "portType");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v23);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        }
        while (v20);
      }

      v37 = *MEMORY[0x24BE648C0];
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attributeForKey:", *MEMORY[0x24BE648A0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v25)
    {
      v27 = -[VSAudioRouteInfo initWithRouteAttributes:]([VSAudioRouteInfo alloc], "initWithRouteAttributes:", v25);
      outputRouteInfo = v8->_outputRouteInfo;
      v8->_outputRouteInfo = v27;

    }
    VSGetLogDefault();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      -[VSAudioRouteInfo audioRouteName](v8->_outputRouteInfo, "audioRouteName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl(&dword_21AA84000, v29, OS_LOG_TYPE_INFO, "Current audio output route: %@", buf, 0xCu);

    }
    goto LABEL_22;
  }
  v26 = 0;
LABEL_23:

  return v26;
}

- (AudioStreamBasicDescription)asbd
{
  AudioStreamBasicDescription *result;

  result = (AudioStreamBasicDescription *)self->_implementation;
  if (result)
    return (AudioStreamBasicDescription *)-[AudioStreamBasicDescription asbd](result, "asbd");
  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  return result;
}

- (BOOL)discontinuedDuringPlayback
{
  return -[VSAudioPlaybackServiceProtocol discontinuedDuringPlayback](self->_implementation, "discontinuedDuringPlayback");
}

- (NSError)error
{
  return (NSError *)-[VSAudioPlaybackServiceProtocol error](self->_implementation, "error");
}

- (id)start
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t playbackIntervalId;
  uint8_t v7[16];

  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  playbackIntervalId = self->_playbackIntervalId;
  if (playbackIntervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21AA84000, v4, OS_SIGNPOST_INTERVAL_BEGIN, playbackIntervalId, "AudioPlayback", (const char *)&unk_21AAD544F, v7, 2u);
  }

  -[VSAudioPlaybackServiceProtocol start](self->_implementation, "start");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enqueue:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  -[VSAudioPlaybackServiceProtocol enqueue:packetCount:packetDescriptions:](self->_implementation, "enqueue:packetCount:packetDescriptions:", a3, a4, a5);
}

- (void)flushAndStop
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t playbackIntervalId;
  uint8_t v6[16];

  -[VSAudioPlaybackServiceProtocol flushAndStop](self->_implementation, "flushAndStop");
  -[VSAudioPlaybackService setTimingObserver:](self, "setTimingObserver:", 0);
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  playbackIntervalId = self->_playbackIntervalId;
  if (playbackIntervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_21AA84000, v4, OS_SIGNPOST_INTERVAL_END, playbackIntervalId, "AudioPlayback", (const char *)&unk_21AAD544F, v6, 2u);
  }

}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t playbackIntervalId;
  uint8_t v6[16];

  -[VSAudioPlaybackServiceProtocol stop](self->_implementation, "stop");
  -[VSAudioPlaybackService setTimingObserver:](self, "setTimingObserver:", 0);
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  playbackIntervalId = self->_playbackIntervalId;
  if (playbackIntervalId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_21AA84000, v4, OS_SIGNPOST_INTERVAL_END, playbackIntervalId, "AudioPlayback", (const char *)&unk_21AAD544F, v6, 2u);
  }

}

- (void)pause
{
  -[VSAudioPlaybackServiceProtocol pause](self->_implementation, "pause");
}

- (void)setTimingObserver:(id)a3
{
  id v4;
  id timingObserver;

  v4 = a3;
  -[VSAudioPlaybackServiceProtocol removeTimeObserver:](self->_implementation, "removeTimeObserver:", self->_timingObserver);
  timingObserver = self->_timingObserver;
  self->_timingObserver = v4;

}

- (id)audioPowerProvider
{
  return (id)-[VSAudioPlaybackServiceProtocol audioPowerProvider](self->_implementation, "audioPowerProvider");
}

- (void)willBeginAccessPower
{
  -[VSAudioPlaybackServiceProtocol willBeginAccessPower](self->_implementation, "willBeginAccessPower");
}

- (void)didEndAccessPower
{
  -[VSAudioPlaybackServiceProtocol didEndAccessPower](self->_implementation, "didEndAccessPower");
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  return -[VSAudioPlaybackServiceProtocol getAveragePower:andPeakPower:](self->_implementation, "getAveragePower:andPeakPower:", a3, a4);
}

- (VSAudioRouteInfo)outputRouteInfo
{
  return self->_outputRouteInfo;
}

- (VSAudioPlaybackServiceProtocol)implementation
{
  return self->_implementation;
}

- (void)setImplementation:(id)a3
{
  objc_storeStrong((id *)&self->_implementation, a3);
}

- (unint64_t)playbackIntervalId
{
  return self->_playbackIntervalId;
}

- (void)setPlaybackIntervalId:(unint64_t)a3
{
  self->_playbackIntervalId = a3;
}

- (id)timingObserver
{
  return self->_timingObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timingObserver, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_outputRouteInfo, 0);
}

+ (double)durationOfAudioDataLength:(unint64_t)a3 withAudioDescription:(AudioStreamBasicDescription *)a4
{
  UInt32 mBytesPerFrame;
  double result;

  mBytesPerFrame = a4->mBytesPerFrame;
  result = 0.0;
  if (mBytesPerFrame)
  {
    if (a4->mSampleRate != 0.0)
      return (double)a3 / (a4->mSampleRate * (double)mBytesPerFrame);
  }
  return result;
}

+ (unint64_t)bytesOfDuration:(double)a3 withAudioDescription:(AudioStreamBasicDescription *)a4
{
  Float64 mSampleRate;

  mSampleRate = a4->mSampleRate;
  LODWORD(mSampleRate) = a4->mBytesPerFrame;
  return (unint64_t)(a4->mSampleRate * a3 * (double)*(unint64_t *)&mSampleRate);
}

@end
