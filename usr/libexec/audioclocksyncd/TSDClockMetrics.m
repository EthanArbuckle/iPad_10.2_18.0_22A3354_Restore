@implementation TSDClockMetrics

- (TSDClockMetrics)initWithClock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPClock iokitMatchingDictionaryForClockIdentifier:](TSDgPTPClock, "iokitMatchingDictionaryForClockIdentifier:", objc_msgSend(v4, "clockIdentity")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iodProperties"));
  v8 = objc_msgSend(v4, "clockIdentity");

  self->_clockIdentity = (unint64_t)v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GrandmasterChangesCounter")));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GrandmasterChangesCounter")));
    self->_gmChangesCount = objc_msgSend(v10, "unsignedIntValue");

  }
  else
  {
    self->_gmChangesCount = 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TimeToChangeGrandmaster")));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TimeToChangeGrandmaster")));
    self->_timeToChangeGm = (unint64_t)objc_msgSend(v12, "unsignedLongLongValue");

  }
  else
  {
    self->_timeToChangeGm = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TimeToLock")));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TimeToLock")));
    self->_timeToLock = (unint64_t)objc_msgSend(v14, "unsignedLongLongValue");

  }
  else
  {
    self->_timeToLock = 0;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CoreAudioReanchors")));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CoreAudioReanchors")));
    self->_coreAudioReanchors = objc_msgSend(v16, "unsignedIntValue");

  }
  else
  {
    self->_coreAudioReanchors = 0;
  }

  return self;
}

- (TSDClockMetrics)initWithInterfaceMetrics:(id *)a3
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
  TSDClockMetrics *v5;
  unint64_t coreAudioReanchors;
  id v7;

  v4 = a3;
  v5 = objc_alloc_init(TSDClockMetrics);
  -[TSDClockMetrics setClockIdentity:](v5, "setClockIdentity:", self->_clockIdentity);
  -[TSDClockMetrics setGmChangesCount:](v5, "setGmChangesCount:", self->_gmChangesCount - (_QWORD)objc_msgSend(v4, "gmChangesCount"));
  coreAudioReanchors = self->_coreAudioReanchors;
  v7 = objc_msgSend(v4, "coreAudioReanchors");

  -[TSDClockMetrics setCoreAudioReanchors:](v5, "setCoreAudioReanchors:", coreAudioReanchors - (_QWORD)v7);
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
