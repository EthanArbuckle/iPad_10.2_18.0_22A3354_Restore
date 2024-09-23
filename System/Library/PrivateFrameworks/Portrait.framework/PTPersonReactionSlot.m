@implementation PTPersonReactionSlot

- (PTPersonReactionSlot)initWithStartTime:(float)a3 stopTime:(float)a4
{
  char *v6;
  PTPersonReactionSlot *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PTPersonReactionSlot;
  v6 = -[PTPersonReactionSlot init](&v13, sel_init);
  v7 = (PTPersonReactionSlot *)v6;
  if (v6)
  {
    *((_QWORD *)v6 + 1) = 0;
    v8 = MEMORY[0x1E0CA2E18];
    v9 = *MEMORY[0x1E0CA2E18];
    *((_OWORD *)v6 + 2) = *MEMORY[0x1E0CA2E18];
    v10 = *(_QWORD *)(v8 + 16);
    *((_QWORD *)v6 + 6) = v10;
    *(_OWORD *)(v6 + 56) = v9;
    *((_QWORD *)v6 + 9) = v10;
    *((float *)v6 + 4) = a3;
    *((float *)v6 + 5) = a4;
    v11 = v6;
  }

  return v7;
}

- (PTEffectReaction)reaction
{
  return (PTEffectReaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)activeGestureType
{
  return self->_activeGestureType;
}

- (void)setActiveGestureType:(unsigned int)a3
{
  self->_activeGestureType = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeGestureLastSeenTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_activeGestureLastSeenTime, 24, 1, 0);
  return result;
}

- (void)setActiveGestureLastSeenTime:(id *)a3
{
  objc_copyStruct(&self->_activeGestureLastSeenTime, a3, 24, 1, 0);
}

- (unsigned)latestGestureType
{
  return self->_latestGestureType;
}

- (void)setLatestGestureType:(unsigned int)a3
{
  self->_latestGestureType = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latestGestureFirstSeenTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_latestGestureFirstSeenTime, 24, 1, 0);
  return result;
}

- (void)setLatestGestureFirstSeenTime:(id *)a3
{
  objc_copyStruct(&self->_latestGestureFirstSeenTime, a3, 24, 1, 0);
}

- (float)milliSecondsToStart
{
  return self->_milliSecondsToStart;
}

- (void)setMilliSecondsToStart:(float)a3
{
  self->_milliSecondsToStart = a3;
}

- (float)milliSecondsToStop
{
  return self->_milliSecondsToStop;
}

- (void)setMilliSecondsToStop:(float)a3
{
  self->_milliSecondsToStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reaction, 0);
}

@end
