@implementation TSClockMetrics

- (TSClockMetrics)initWithDaemonMetrics:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  self->_clockIdentity = objc_msgSend(v4, "clockIdentity");
  self->_gmChangesCount = objc_msgSend(v4, "gmChangesCount");
  self->_timeToChangeGm = objc_msgSend(v4, "timeToChangeGm");
  self->_timeToLock = objc_msgSend(v4, "timeToLock");
  v5 = objc_msgSend(v4, "coreAudioReanchors");

  self->_coreAudioReanchors = v5;
  return self;
}

- (id)toDaemonMetrics
{
  _TSF_TSDClockMetrics *v3;

  v3 = [_TSF_TSDClockMetrics alloc];
  -[_TSF_TSDClockMetrics setClockIdentity:](v3, "setClockIdentity:", self->_clockIdentity);
  -[_TSF_TSDClockMetrics setGmChangesCount:](v3, "setGmChangesCount:", self->_gmChangesCount);
  -[_TSF_TSDClockMetrics setTimeToChangeGm:](v3, "setTimeToChangeGm:", self->_timeToChangeGm);
  -[_TSF_TSDClockMetrics setTimeToLock:](v3, "setTimeToLock:", self->_timeToLock);
  -[_TSF_TSDClockMetrics setCoreAudioReanchors:](v3, "setCoreAudioReanchors:", self->_coreAudioReanchors);
  return v3;
}

- (TSClockMetrics)initWithInterfaceMetrics:(id *)a3
{
  __int128 v3;

  self->_clockIdentity = a3->var0;
  v3 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_gmChangesCount = *(_OWORD *)&a3->var1;
  *(_OWORD *)&self->_timeToLock = v3;
  return self;
}

- (void)printMetrics
{
  unint64_t clockIdentity;
  unint64_t gmChangesCount;
  unint64_t timeToChangeGm;
  unint64_t timeToLock;
  unint64_t coreAudioReanchors;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Clock Metrics:", (uint8_t *)&v8, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    clockIdentity = self->_clockIdentity;
    v8 = 134217984;
    v9 = clockIdentity;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Clock Identity = %llx\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    gmChangesCount = self->_gmChangesCount;
    v8 = 134217984;
    v9 = gmChangesCount;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  GM Changes = %zu\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    timeToChangeGm = self->_timeToChangeGm;
    v8 = 134217984;
    v9 = timeToChangeGm;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Time to change GM = %zu\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    timeToLock = self->_timeToLock;
    v8 = 134217984;
    v9 = timeToLock;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Time to lock = %zu\n", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    coreAudioReanchors = self->_coreAudioReanchors;
    v8 = 134217984;
    v9 = coreAudioReanchors;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Core audio reanchors = %zu\n", (uint8_t *)&v8, 0xCu);
  }
}

- (unint64_t)clockIdentity
{
  return self->_clockIdentity;
}

- (unint64_t)gmChangesCount
{
  return self->_gmChangesCount;
}

- (unint64_t)timeToChangeGm
{
  return self->_timeToChangeGm;
}

- (unint64_t)timeToLock
{
  return self->_timeToLock;
}

- (unint64_t)coreAudioReanchors
{
  return self->_coreAudioReanchors;
}

@end
