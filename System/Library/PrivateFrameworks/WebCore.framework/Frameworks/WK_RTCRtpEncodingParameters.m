@implementation WK_RTCRtpEncodingParameters

- (WK_RTCRtpEncodingParameters)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WK_RTCRtpEncodingParameters;
  return -[WK_RTCRtpEncodingParameters init](&v3, sel_init);
}

- (WK_RTCRtpEncodingParameters)initWithNativeParameters:(const void *)a3
{
  WK_RTCRtpEncodingParameters *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *rid;
  uint64_t v8;
  NSNumber *maxBitrateBps;
  uint64_t v10;
  NSNumber *minBitrateBps;
  uint64_t v12;
  NSNumber *maxFramerate;
  uint64_t v14;
  NSNumber *numTemporalLayers;
  uint64_t v16;
  NSNumber *scaleResolutionDownBy;
  uint64_t v18;
  NSNumber *ssrc;

  v4 = -[WK_RTCRtpEncodingParameters init](self, "init");
  if (v4)
  {
    v5 = *((unsigned __int8 *)a3 + 151);
    if ((v5 & 0x80u) != 0)
      v5 = *((_QWORD *)a3 + 17);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "rtcStringForStdString:", (char *)a3 + 128);
      v6 = objc_claimAutoreleasedReturnValue();
      rid = v4->_rid;
      v4->_rid = (NSString *)v6;

    }
    v4->_isActive = *((_BYTE *)a3 + 124);
    if (*((_BYTE *)a3 + 24))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)a3 + 5));
      v8 = objc_claimAutoreleasedReturnValue();
      maxBitrateBps = v4->_maxBitrateBps;
      v4->_maxBitrateBps = (NSNumber *)v8;

    }
    if (*((_BYTE *)a3 + 32))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)a3 + 7));
      v10 = objc_claimAutoreleasedReturnValue();
      minBitrateBps = v4->_minBitrateBps;
      v4->_minBitrateBps = (NSNumber *)v10;

    }
    if (*((_BYTE *)a3 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)*((double *)a3 + 5));
      v12 = objc_claimAutoreleasedReturnValue();
      maxFramerate = v4->_maxFramerate;
      v4->_maxFramerate = (NSNumber *)v12;

    }
    if (*((_BYTE *)a3 + 60))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)a3 + 14));
      v14 = objc_claimAutoreleasedReturnValue();
      numTemporalLayers = v4->_numTemporalLayers;
      v4->_numTemporalLayers = (NSNumber *)v14;

    }
    if (*((_BYTE *)a3 + 72))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)a3 + 8));
      v16 = objc_claimAutoreleasedReturnValue();
      scaleResolutionDownBy = v4->_scaleResolutionDownBy;
      v4->_scaleResolutionDownBy = (NSNumber *)v16;

    }
    if (*((_BYTE *)a3 + 4))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)a3);
      v18 = objc_claimAutoreleasedReturnValue();
      ssrc = v4->_ssrc;
      v4->_ssrc = (NSNumber *)v18;

    }
    v4->_networkPriority = +[WK_RTCRtpEncodingParameters priorityFromNativePriority:](WK_RTCRtpEncodingParameters, "priorityFromNativePriority:", *((unsigned int *)a3 + 4));
  }
  return v4;
}

- (RtpEncodingParameters)nativeParameters
{
  BOOL *p_engaged;
  NSNumber *maxBitrateBps;
  NSNumber *minBitrateBps;
  NSNumber *maxFramerate;
  NSNumber *numTemporalLayers;
  NSNumber *scaleResolutionDownBy;
  double v10;
  NSNumber *ssrc;
  RtpEncodingParameters *result;
  __int128 v13;
  uint64_t v14;

  retstr->var0.var0.__null_state_ = 0;
  retstr->var0.__engaged_ = 0;
  retstr->var1 = 1.0;
  retstr->var2 = 1;
  retstr->var3.var0.__null_state_ = 0;
  retstr->var3.__engaged_ = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var4.__engaged_ = 0;
  retstr->var5.var0.var0 = 0;
  retstr->var5.var1 = 0;
  retstr->var6.var0.__null_state_ = 0;
  retstr->var6.__engaged_ = 0;
  retstr->var7.var0.var0 = 0;
  retstr->var7.var1 = 0;
  retstr->var8.var0.var0 = 0;
  LOBYTE(retstr[1].var1) = 0;
  LOBYTE(retstr[1].var2) = 0;
  retstr[1].var3.__engaged_ = 0;
  retstr[1].var4.var0.__null_state_ = 1;
  retstr[1].var7.var0.var0 = 0;
  retstr[2].var7.var1 = 0;
  *(_QWORD *)&retstr[1].var4.__engaged_ = 0;
  p_engaged = &retstr[1].var4.__engaged_;
  *(_WORD *)&retstr[1].var6.var0.__null_state_ = 0;
  retstr[1].var5.var0.var1 = 0.0;
  *(_QWORD *)&retstr[1].var5.var1 = 0;
  if (self->_rid)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "rtcStdStringForString:");
    *(_OWORD *)p_engaged = v13;
    *(_QWORD *)&retstr[1].var5.var1 = v14;
  }
  retstr[1].var4.var0.__null_state_ = self->_isActive;
  maxBitrateBps = self->_maxBitrateBps;
  if (maxBitrateBps)
  {
    retstr->var3.var0.__val_ = -[NSNumber intValue](maxBitrateBps, "intValue");
    retstr->var3.__engaged_ = 1;
  }
  minBitrateBps = self->_minBitrateBps;
  if (minBitrateBps)
  {
    retstr->var4.var0.__val_ = -[NSNumber intValue](minBitrateBps, "intValue");
    retstr->var4.__engaged_ = 1;
  }
  maxFramerate = self->_maxFramerate;
  if (maxFramerate)
  {
    retstr->var5.var0.var1 = (double)-[NSNumber intValue](maxFramerate, "intValue");
    retstr->var5.var1 = 1;
  }
  numTemporalLayers = self->_numTemporalLayers;
  if (numTemporalLayers)
  {
    retstr->var6.var0.__val_ = -[NSNumber intValue](numTemporalLayers, "intValue");
    retstr->var6.__engaged_ = 1;
  }
  scaleResolutionDownBy = self->_scaleResolutionDownBy;
  if (scaleResolutionDownBy)
  {
    -[NSNumber doubleValue](scaleResolutionDownBy, "doubleValue");
    retstr->var7.var0.var1 = v10;
    retstr->var7.var1 = 1;
  }
  ssrc = self->_ssrc;
  if (ssrc)
  {
    retstr->var0.var0.__val_ = -[NSNumber unsignedLongValue](ssrc, "unsignedLongValue");
    retstr->var0.__engaged_ = 1;
  }
  result = (RtpEncodingParameters *)+[WK_RTCRtpEncodingParameters nativePriorityFromPriority:](WK_RTCRtpEncodingParameters, "nativePriorityFromPriority:", self->_networkPriority);
  retstr->var2 = (int)result;
  return result;
}

+ (int)nativePriorityFromPriority:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

+ (int64_t)priorityFromNativePriority:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 1);
  if (v3 < 3)
    return v3 + 1;
  else
    return 0;
}

- (NSString)rid
{
  return self->_rid;
}

- (void)setRid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSNumber)maxBitrateBps
{
  return self->_maxBitrateBps;
}

- (void)setMaxBitrateBps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)minBitrateBps
{
  return self->_minBitrateBps;
}

- (void)setMinBitrateBps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)maxFramerate
{
  return self->_maxFramerate;
}

- (void)setMaxFramerate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)numTemporalLayers
{
  return self->_numTemporalLayers;
}

- (void)setNumTemporalLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)scaleResolutionDownBy
{
  return self->_scaleResolutionDownBy;
}

- (void)setScaleResolutionDownBy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)ssrc
{
  return self->_ssrc;
}

- (int64_t)networkPriority
{
  return self->_networkPriority;
}

- (void)setNetworkPriority:(int64_t)a3
{
  self->_networkPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssrc, 0);
  objc_storeStrong((id *)&self->_scaleResolutionDownBy, 0);
  objc_storeStrong((id *)&self->_numTemporalLayers, 0);
  objc_storeStrong((id *)&self->_maxFramerate, 0);
  objc_storeStrong((id *)&self->_minBitrateBps, 0);
  objc_storeStrong((id *)&self->_maxBitrateBps, 0);
  objc_storeStrong((id *)&self->_rid, 0);
}

@end
