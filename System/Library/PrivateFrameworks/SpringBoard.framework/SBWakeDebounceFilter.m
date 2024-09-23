@implementation SBWakeDebounceFilter

- (void)setIntervalActivationLimit:(unint64_t)a3
{
  if (self->_intervalActivationLimit != a3)
  {
    self->_intervalActivationLimit = a3;
    -[SBWakeDebounceFilter _reconfigureFilter]((uint64_t)self);
  }
}

- (void)_reconfigureFilter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 8), "count");
    v3 = *(_QWORD *)(a1 + 24);
    if (v3 != v2)
    {
      v4 = v2;
      v5 = (void *)MEMORY[0x1D17E5334]();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 >= 1)
      {
        for (i = 0; i != v4; ++i)
        {
          objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", (i + *(_QWORD *)(a1 + 16)) % v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v8);

        }
      }
      v9 = v3 - v4;
      if (v3 > v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        do
        {
          objc_msgSend(v6, "addObject:", v10);
          --v9;
        }
        while (v9);

      }
      objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
      v11 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v6;

      *(_QWORD *)(a1 + 16) = v4;
      objc_autoreleasePoolPop(v5);
    }
  }
}

- (BOOL)wakeEventOccurred
{
  uint64_t v3;
  NSNumber *overrideTime;
  double v5;
  double v7;
  void *v8;
  void *v9;
  NSMutableArray *wakeEvents;
  int64_t oldestWakeEventIndex;

  if (!self->_intervalActivationLimit)
    return 1;
  v3 = -[NSMutableArray count](self->_wakeEvents, "count");
  overrideTime = self->_overrideTime;
  if (overrideTime)
    -[NSNumber doubleValue](overrideTime, "doubleValue");
  else
    BSContinuousMachTimeNow();
  v7 = v5;
  -[NSMutableArray objectAtIndexedSubscript:](self->_wakeEvents, "objectAtIndexedSubscript:", self->_oldestWakeEventIndex % v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  wakeEvents = self->_wakeEvents;
  oldestWakeEventIndex = self->_oldestWakeEventIndex;
  self->_oldestWakeEventIndex = oldestWakeEventIndex + 1;
  -[NSMutableArray setObject:atIndexedSubscript:](wakeEvents, "setObject:atIndexedSubscript:", v9, oldestWakeEventIndex % v3);

  return BSFloatGreaterThanFloat();
}

- (double)_currentTime
{
  void *v1;
  double result;

  if (!a1)
    return 0.0;
  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "doubleValue");
  else
    BSContinuousMachTimeNow();
  return result;
}

- (unint64_t)intervalActivationLimit
{
  return self->_intervalActivationLimit;
}

- (NSNumber)_overrideTime
{
  return self->_overrideTime;
}

- (void)_setOverrideTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)filterInterval
{
  return self->_filterInterval;
}

- (void)setFilterInterval:(double)a3
{
  self->_filterInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTime, 0);
  objc_storeStrong((id *)&self->_wakeEvents, 0);
}

@end
