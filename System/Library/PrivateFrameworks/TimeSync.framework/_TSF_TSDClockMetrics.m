@implementation _TSF_TSDClockMetrics

- (_TSF_TSDClockMetrics)initWithClock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (void *)MEMORY[0x1E0D39F08];
  v5 = a3;
  +[_TSF_TSDgPTPClock iokitMatchingDictionaryForClockIdentifier:](_TSF_TSDgPTPClock, "iokitMatchingDictionaryForClockIdentifier:", objc_msgSend(v5, "clockIdentity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingService:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "iodProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "clockIdentity");

  self->_clockIdentity = v9;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GrandmasterChangesCounter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GrandmasterChangesCounter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_gmChangesCount = objc_msgSend(v11, "unsignedIntValue");

  }
  else
  {
    self->_gmChangesCount = 0;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TimeToChangeGrandmaster"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TimeToChangeGrandmaster"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_timeToChangeGm = objc_msgSend(v13, "unsignedLongLongValue");

  }
  else
  {
    self->_timeToChangeGm = 0;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TimeToLock"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TimeToLock"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_timeToLock = objc_msgSend(v15, "unsignedLongLongValue");

  }
  else
  {
    self->_timeToLock = 0;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CoreAudioReanchors"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CoreAudioReanchors"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self->_coreAudioReanchors = objc_msgSend(v17, "unsignedIntValue");

  }
  else
  {
    self->_coreAudioReanchors = 0;
  }

  return self;
}

- (_TSF_TSDClockMetrics)initWithInterfaceMetrics:(id *)a3
{
  __int128 v3;

  self->_clockIdentity = a3->var0;
  v3 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_gmChangesCount = *(_OWORD *)&a3->var1;
  *(_OWORD *)&self->_timeToLock = v3;
  return self;
}

- (id)getDelta:(id)a3
{
  id v4;
  _TSF_TSDClockMetrics *v5;
  unint64_t coreAudioReanchors;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(_TSF_TSDClockMetrics);
  -[_TSF_TSDClockMetrics setClockIdentity:](v5, "setClockIdentity:", self->_clockIdentity);
  -[_TSF_TSDClockMetrics setGmChangesCount:](v5, "setGmChangesCount:", self->_gmChangesCount - objc_msgSend(v4, "gmChangesCount"));
  coreAudioReanchors = self->_coreAudioReanchors;
  v7 = objc_msgSend(v4, "coreAudioReanchors");

  -[_TSF_TSDClockMetrics setCoreAudioReanchors:](v5, "setCoreAudioReanchors:", coreAudioReanchors - v7);
  return v5;
}

- (unint64_t)clockIdentity
{
  return self->_clockIdentity;
}

- (void)setClockIdentity:(unint64_t)a3
{
  self->_clockIdentity = a3;
}

- (unint64_t)gmChangesCount
{
  return self->_gmChangesCount;
}

- (void)setGmChangesCount:(unint64_t)a3
{
  self->_gmChangesCount = a3;
}

- (unint64_t)timeToChangeGm
{
  return self->_timeToChangeGm;
}

- (void)setTimeToChangeGm:(unint64_t)a3
{
  self->_timeToChangeGm = a3;
}

- (unint64_t)timeToLock
{
  return self->_timeToLock;
}

- (void)setTimeToLock:(unint64_t)a3
{
  self->_timeToLock = a3;
}

- (unint64_t)coreAudioReanchors
{
  return self->_coreAudioReanchors;
}

- (void)setCoreAudioReanchors:(unint64_t)a3
{
  self->_coreAudioReanchors = a3;
}

@end
