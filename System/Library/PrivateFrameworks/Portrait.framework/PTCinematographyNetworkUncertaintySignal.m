@implementation PTCinematographyNetworkUncertaintySignal

- (PTCinematographyNetworkUncertaintySignal)initWithModelDictionary:(id)a3
{
  id v4;
  PTCinematographyNetworkUncertaintySignal *v5;
  void *v6;
  void *v7;
  float v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyNetworkUncertaintySignal;
  v5 = -[PTCinematographyNetworkSignal initWithModelDictionary:](&v10, sel_initWithModelDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("params"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timer_seconds_divisor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v5->_timerSecondsDivisor = v8;

  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (-[PTCinematographyNetworkSignal checkSignalForStream:](self, "checkSignalForStream:", v7))
  {
    -[PTCinematographyNetworkUncertaintySignal _timerUncertaintyForPayload:](self, "_timerUncertaintyForPayload:", v6);
    objc_msgSend(v7, "writeFloat:");
  }
  else
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetworkNamedSignal writePayload:toStream:].cold.2(v8);

  }
}

- (float)_timerUncertaintyForPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  double Seconds;
  float timerSecondsDivisor;
  CMTime v13;
  CMTime rhs;
  CMTime lhs;
  CMTime v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "detection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "time");

    v7 = 0.0;
    if ((BYTE4(v18) & 0x1D) == 1)
    {
      memset(&v16, 0, sizeof(v16));
      if (v4)
        objc_msgSend(v4, "time");
      else
        memset(&lhs, 0, sizeof(lhs));
      objc_msgSend(v4, "detection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "time");
      else
        memset(&rhs, 0, sizeof(rhs));
      CMTimeSubtract(&v16, &lhs, &rhs);

      v13 = v16;
      Seconds = CMTimeGetSeconds(&v13);
      if (Seconds >= 0.0)
      {
        timerSecondsDivisor = self->_timerSecondsDivisor;
        if (timerSecondsDivisor > 0.0)
          v7 = Seconds / timerSecondsDivisor;
      }
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;

    v7 = 0.0;
  }

  return v7;
}

- (float)timerSecondsDivisor
{
  return self->_timerSecondsDivisor;
}

@end
