@implementation TSPortMetrics

- (TSPortMetrics)initWithDaemonMetrics:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  self->_portNumber = objc_msgSend(v4, "portNumber");
  self->_syncTimeouts = objc_msgSend(v4, "syncTimeouts");
  self->_filterResetsDroppedLimit = objc_msgSend(v4, "filterResetsDroppedLimit");
  self->_filterResetsOutOfBounds = objc_msgSend(v4, "filterResetsOutOfBounds");
  self->_meanDelayTime = objc_msgSend(v4, "meanDelayTime");
  self->_droppedMeasurements = objc_msgSend(v4, "droppedMeasurements");
  self->_discardedPpmLimitMeasurements = objc_msgSend(v4, "discardedPpmLimitMeasurements");
  self->_discardedDelayLimitExceededMeasurements = objc_msgSend(v4, "discardedDelayLimitExceededMeasurements");
  self->_discardedOutOfBoundsMeasurements = objc_msgSend(v4, "discardedOutOfBoundsMeasurements");
  self->_discardedTimestampsOutOfOrderMeasurements = objc_msgSend(v4, "discardedTimestampsOutOfOrderMeasurements");
  self->_successfulMeasurements = objc_msgSend(v4, "successfulMeasurements");
  self->_totalMeasurements = objc_msgSend(v4, "totalMeasurements");
  self->_droppedPercentage = objc_msgSend(v4, "droppedPercentage");
  self->_discardedPpmLimitPercentage = objc_msgSend(v4, "discardedPpmLimitPercentage");
  self->_discardedDelayLimitExceededPercentage = objc_msgSend(v4, "discardedDelayLimitExceededPercentage");
  self->_discardedOutOfBoundsPercentage = objc_msgSend(v4, "discardedOutOfBoundsPercentage");
  self->_discardedTimestampsOutOfOrderPercentage = objc_msgSend(v4, "discardedTimestampsOutOfOrderPercentage");
  v5 = objc_msgSend(v4, "successfulPercentage");

  self->_successfulPercentage = v5;
  return self;
}

- (id)toDaemonMetrics
{
  _TSF_TSDPortMetrics *v3;

  v3 = [_TSF_TSDPortMetrics alloc];
  -[_TSF_TSDPortMetrics setPortNumber:](v3, "setPortNumber:", self->_portNumber);
  -[_TSF_TSDPortMetrics setSyncTimeouts:](v3, "setSyncTimeouts:", self->_syncTimeouts);
  -[_TSF_TSDPortMetrics setFilterResetsDroppedLimit:](v3, "setFilterResetsDroppedLimit:", self->_filterResetsDroppedLimit);
  -[_TSF_TSDPortMetrics setFilterResetsOutOfBounds:](v3, "setFilterResetsOutOfBounds:", self->_filterResetsOutOfBounds);
  -[_TSF_TSDPortMetrics setMeanDelayTime:](v3, "setMeanDelayTime:", self->_meanDelayTime);
  -[_TSF_TSDPortMetrics setDroppedMeasurements:](v3, "setDroppedMeasurements:", self->_droppedMeasurements);
  -[_TSF_TSDPortMetrics setDiscardedPpmLimitMeasurements:](v3, "setDiscardedPpmLimitMeasurements:", self->_discardedPpmLimitMeasurements);
  -[_TSF_TSDPortMetrics setDiscardedDelayLimitExceededMeasurements:](v3, "setDiscardedDelayLimitExceededMeasurements:", self->_discardedDelayLimitExceededMeasurements);
  -[_TSF_TSDPortMetrics setDiscardedOutOfBoundsMeasurements:](v3, "setDiscardedOutOfBoundsMeasurements:", self->_discardedOutOfBoundsMeasurements);
  -[_TSF_TSDPortMetrics setDiscardedTimestampsOutOfOrderMeasurements:](v3, "setDiscardedTimestampsOutOfOrderMeasurements:", self->_discardedTimestampsOutOfOrderMeasurements);
  -[_TSF_TSDPortMetrics setSuccessfulMeasurements:](v3, "setSuccessfulMeasurements:", self->_successfulMeasurements);
  -[_TSF_TSDPortMetrics setTotalMeasurements:](v3, "setTotalMeasurements:", self->_totalMeasurements);
  -[_TSF_TSDPortMetrics setDroppedPercentage:](v3, "setDroppedPercentage:", self->_droppedPercentage);
  -[_TSF_TSDPortMetrics setDiscardedPpmLimitPercentage:](v3, "setDiscardedPpmLimitPercentage:", self->_discardedPpmLimitPercentage);
  -[_TSF_TSDPortMetrics setDiscardedDelayLimitExceededPercentage:](v3, "setDiscardedDelayLimitExceededPercentage:", self->_discardedDelayLimitExceededPercentage);
  -[_TSF_TSDPortMetrics setDiscardedOutOfBoundsPercentage:](v3, "setDiscardedOutOfBoundsPercentage:", self->_discardedOutOfBoundsPercentage);
  -[_TSF_TSDPortMetrics setDiscardedTimestampsOutOfOrderPercentage:](v3, "setDiscardedTimestampsOutOfOrderPercentage:", self->_discardedTimestampsOutOfOrderPercentage);
  -[_TSF_TSDPortMetrics setSuccessfulPercentage:](v3, "setSuccessfulPercentage:", self->_successfulPercentage);
  return v3;
}

- (TSPortMetrics)initWithInterfaceMetrics:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  self->_portNumber = a3->var0;
  v3 = *(_OWORD *)((char *)&a3->var2 + 2);
  *(_OWORD *)&self->_syncTimeouts = *(_OWORD *)(&a3->var0 + 1);
  *(_OWORD *)&self->_filterResetsOutOfBounds = v3;
  v4 = *(_OWORD *)((char *)&a3->var6 + 2);
  *(_OWORD *)&self->_droppedMeasurements = *(_OWORD *)((char *)&a3->var4 + 2);
  *(_OWORD *)&self->_discardedDelayLimitExceededMeasurements = v4;
  v5 = *(_OWORD *)((char *)&a3->var10 + 2);
  *(_OWORD *)&self->_discardedTimestampsOutOfOrderMeasurements = *(_OWORD *)((char *)&a3->var8 + 2);
  *(_OWORD *)&self->_totalMeasurements = v5;
  v6 = *(_OWORD *)((char *)&a3->var14 + 2);
  *(_OWORD *)&self->_discardedPpmLimitPercentage = *(_OWORD *)((char *)&a3->var12 + 2);
  *(_OWORD *)&self->_discardedOutOfBoundsPercentage = v6;
  self->_successfulPercentage = *(unint64_t *)((char *)&a3->var16 + 2);
  return self;
}

- (void)printMetrics
{
  int portNumber;
  unint64_t syncTimeouts;
  unint64_t filterResetsDroppedLimit;
  unint64_t filterResetsOutOfBounds;
  unint64_t meanDelayTime;
  unint64_t droppedMeasurements;
  unint64_t discardedPpmLimitMeasurements;
  unint64_t discardedDelayLimitExceededMeasurements;
  unint64_t discardedOutOfBoundsMeasurements;
  unint64_t discardedTimestampsOutOfOrderMeasurements;
  unint64_t successfulMeasurements;
  unint64_t totalMeasurements;
  unint64_t droppedPercentage;
  unint64_t discardedPpmLimitPercentage;
  unint64_t discardedDelayLimitExceededPercentage;
  unint64_t discardedOutOfBoundsPercentage;
  unint64_t discardedTimestampsOutOfOrderPercentage;
  unint64_t successfulPercentage;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    portNumber = self->_portNumber;
    v21 = 67109120;
    LODWORD(v22) = portNumber;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Port = %u\n", (uint8_t *)&v21, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    syncTimeouts = self->_syncTimeouts;
    v21 = 134217984;
    v22 = syncTimeouts;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Sync Timeouts = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    filterResetsDroppedLimit = self->_filterResetsDroppedLimit;
    v21 = 134217984;
    v22 = filterResetsDroppedLimit;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Filter Resets (Dropped Limit) = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    filterResetsOutOfBounds = self->_filterResetsOutOfBounds;
    v21 = 134217984;
    v22 = filterResetsOutOfBounds;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Filter Resets (Out Of Bounds) = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    meanDelayTime = self->_meanDelayTime;
    v21 = 134217984;
    v22 = meanDelayTime;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Mean Delay Time = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    droppedMeasurements = self->_droppedMeasurements;
    v21 = 134217984;
    v22 = droppedMeasurements;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Dropped Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedPpmLimitMeasurements = self->_discardedPpmLimitMeasurements;
    v21 = 134217984;
    v22 = discardedPpmLimitMeasurements;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded PPM Limit Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedDelayLimitExceededMeasurements = self->_discardedDelayLimitExceededMeasurements;
    v21 = 134217984;
    v22 = discardedDelayLimitExceededMeasurements;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded Delay Limit Exceeded Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedOutOfBoundsMeasurements = self->_discardedOutOfBoundsMeasurements;
    v21 = 134217984;
    v22 = discardedOutOfBoundsMeasurements;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded Out Of Bounds Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedTimestampsOutOfOrderMeasurements = self->_discardedTimestampsOutOfOrderMeasurements;
    v21 = 134217984;
    v22 = discardedTimestampsOutOfOrderMeasurements;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded Timestamps Out Of Order Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    successfulMeasurements = self->_successfulMeasurements;
    v21 = 134217984;
    v22 = successfulMeasurements;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Successful Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    totalMeasurements = self->_totalMeasurements;
    v21 = 134217984;
    v22 = totalMeasurements;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Total Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    droppedPercentage = self->_droppedPercentage;
    v21 = 134217984;
    v22 = droppedPercentage;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Dropped Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedPpmLimitPercentage = self->_discardedPpmLimitPercentage;
    v21 = 134217984;
    v22 = discardedPpmLimitPercentage;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded PPM Limit Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedDelayLimitExceededPercentage = self->_discardedDelayLimitExceededPercentage;
    v21 = 134217984;
    v22 = discardedDelayLimitExceededPercentage;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded Delay Limit Exceeded Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedOutOfBoundsPercentage = self->_discardedOutOfBoundsPercentage;
    v21 = 134217984;
    v22 = discardedOutOfBoundsPercentage;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded Out Of Bounds Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    discardedTimestampsOutOfOrderPercentage = self->_discardedTimestampsOutOfOrderPercentage;
    v21 = 134217984;
    v22 = discardedTimestampsOutOfOrderPercentage;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Discarded Timestamps Out Of Order Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    successfulPercentage = self->_successfulPercentage;
    v21 = 134217984;
    v22 = successfulPercentage;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Successful Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (unint64_t)syncTimeouts
{
  return self->_syncTimeouts;
}

- (unint64_t)filterResetsDroppedLimit
{
  return self->_filterResetsDroppedLimit;
}

- (unint64_t)filterResetsOutOfBounds
{
  return self->_filterResetsOutOfBounds;
}

- (unint64_t)meanDelayTime
{
  return self->_meanDelayTime;
}

- (unint64_t)droppedMeasurements
{
  return self->_droppedMeasurements;
}

- (unint64_t)discardedPpmLimitMeasurements
{
  return self->_discardedPpmLimitMeasurements;
}

- (unint64_t)discardedDelayLimitExceededMeasurements
{
  return self->_discardedDelayLimitExceededMeasurements;
}

- (unint64_t)discardedOutOfBoundsMeasurements
{
  return self->_discardedOutOfBoundsMeasurements;
}

- (unint64_t)discardedTimestampsOutOfOrderMeasurements
{
  return self->_discardedTimestampsOutOfOrderMeasurements;
}

- (unint64_t)successfulMeasurements
{
  return self->_successfulMeasurements;
}

- (unint64_t)totalMeasurements
{
  return self->_totalMeasurements;
}

- (unint64_t)droppedPercentage
{
  return self->_droppedPercentage;
}

- (unint64_t)discardedPpmLimitPercentage
{
  return self->_discardedPpmLimitPercentage;
}

- (unint64_t)discardedDelayLimitExceededPercentage
{
  return self->_discardedDelayLimitExceededPercentage;
}

- (unint64_t)discardedOutOfBoundsPercentage
{
  return self->_discardedOutOfBoundsPercentage;
}

- (unint64_t)discardedTimestampsOutOfOrderPercentage
{
  return self->_discardedTimestampsOutOfOrderPercentage;
}

- (unint64_t)successfulPercentage
{
  return self->_successfulPercentage;
}

@end
