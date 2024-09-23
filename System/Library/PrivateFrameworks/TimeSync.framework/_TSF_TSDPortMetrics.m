@implementation _TSF_TSDPortMetrics

- (void)calculatePercentages
{
  unint64_t totalMeasurements;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  totalMeasurements = self->_totalMeasurements;
  if (totalMeasurements)
  {
    v3 = 100 * self->_droppedMeasurements / totalMeasurements;
    v4 = 100 * self->_discardedPpmLimitMeasurements / totalMeasurements;
    v5 = 100 * self->_discardedDelayLimitExceededMeasurements / totalMeasurements;
    v6 = 100 * self->_discardedOutOfBoundsMeasurements / totalMeasurements;
    v7 = 100 * self->_discardedTimestampsOutOfOrderMeasurements / totalMeasurements;
    totalMeasurements = 100 * self->_successfulMeasurements / totalMeasurements;
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  self->_droppedPercentage = v3;
  self->_discardedPpmLimitPercentage = v4;
  self->_discardedDelayLimitExceededPercentage = v5;
  self->_discardedOutOfBoundsPercentage = v6;
  self->_discardedTimestampsOutOfOrderPercentage = v7;
  self->_successfulPercentage = totalMeasurements;
}

- (_TSF_TSDPortMetrics)initWithPort:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v5 = a3;
  objc_storeStrong((id *)&self->_port, a3);
  -[_TSF_TSDgPTPPort service](self->_port, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iodProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  self->_portNumber = objc_msgSend(v5, "portNumber");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncReceiptTimeoutCounter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncReceiptTimeoutCounter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_syncTimeouts = objc_msgSend(v9, "unsignedIntValue");

  }
  else
  {
    self->_syncTimeouts = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetDroppedLimitCounter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetDroppedLimitCounter"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_filterResetsDroppedLimit = objc_msgSend(v11, "unsignedIntValue");

    }
    else
    {
      self->_filterResetsDroppedLimit = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetOutOfBoundsCounter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetOutOfBoundsCounter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self->_filterResetsOutOfBounds = objc_msgSend(v13, "unsignedIntValue");

    }
    else
    {
      self->_filterResetsOutOfBounds = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LinkPropagationMeanDelay"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LinkPropagationMeanDelay"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_meanDelayTime = objc_msgSend(v15, "unsignedIntValue");

    }
    else
    {
      self->_meanDelayTime = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDroppedCounter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDroppedCounter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self->_droppedMeasurements = objc_msgSend(v17, "unsignedIntValue");

    }
    else
    {
      self->_droppedMeasurements = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RawDelayMeasurementCounter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RawDelayMeasurementCounter"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntValue");

    }
    else
    {
      v20 = 0;
    }

    self->_totalMeasurements = self->_droppedMeasurements + v20;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardPPMLimitCounter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardPPMLimitCounter"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      self->_discardedPpmLimitMeasurements = objc_msgSend(v22, "unsignedIntValue");

    }
    else
    {
      self->_discardedPpmLimitMeasurements = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardDelayLimitExceededCounter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardDelayLimitExceededCounter"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self->_discardedDelayLimitExceededMeasurements = objc_msgSend(v24, "unsignedIntValue");

    }
    else
    {
      self->_discardedDelayLimitExceededMeasurements = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardOutOfBoundsCounter"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardOutOfBoundsCounter"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      self->_discardedOutOfBoundsMeasurements = objc_msgSend(v26, "unsignedIntValue");

    }
    else
    {
      self->_discardedOutOfBoundsMeasurements = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardTimestampsOutOfOrderCounter"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardTimestampsOutOfOrderCounter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      self->_discardedTimestampsOutOfOrderMeasurements = objc_msgSend(v28, "unsignedIntValue");

    }
    else
    {
      self->_discardedTimestampsOutOfOrderMeasurements = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementSuccessCounter"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementSuccessCounter"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      self->_successfulMeasurements = objc_msgSend(v30, "unsignedIntValue");

    }
    else
    {
      self->_successfulMeasurements = 0;
    }

    -[_TSF_TSDPortMetrics calculatePercentages](self, "calculatePercentages");
  }

  return self;
}

- (id)getDelta:(id)a3
{
  id v4;
  _TSF_TSDPortMetrics *v5;

  v4 = a3;
  v5 = objc_alloc_init(_TSF_TSDPortMetrics);
  -[_TSF_TSDPortMetrics setPortNumber:](v5, "setPortNumber:", self->_portNumber);
  -[_TSF_TSDPortMetrics setSyncTimeouts:](v5, "setSyncTimeouts:", self->_syncTimeouts - objc_msgSend(v4, "syncTimeouts"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_TSF_TSDPortMetrics setFilterResetsDroppedLimit:](v5, "setFilterResetsDroppedLimit:", self->_filterResetsDroppedLimit - objc_msgSend(v4, "filterResetsDroppedLimit"));
    -[_TSF_TSDPortMetrics setFilterResetsOutOfBounds:](v5, "setFilterResetsOutOfBounds:", self->_filterResetsOutOfBounds - objc_msgSend(v4, "filterResetsOutOfBounds"));
    -[_TSF_TSDPortMetrics setDroppedMeasurements:](v5, "setDroppedMeasurements:", self->_droppedMeasurements - objc_msgSend(v4, "droppedMeasurements"));
    -[_TSF_TSDPortMetrics setDiscardedPpmLimitMeasurements:](v5, "setDiscardedPpmLimitMeasurements:", self->_discardedPpmLimitMeasurements - objc_msgSend(v4, "discardedPpmLimitMeasurements"));
    -[_TSF_TSDPortMetrics setDiscardedDelayLimitExceededMeasurements:](v5, "setDiscardedDelayLimitExceededMeasurements:", self->_discardedDelayLimitExceededMeasurements - objc_msgSend(v4, "discardedDelayLimitExceededMeasurements"));
    -[_TSF_TSDPortMetrics setDiscardedOutOfBoundsMeasurements:](v5, "setDiscardedOutOfBoundsMeasurements:", self->_discardedOutOfBoundsMeasurements - objc_msgSend(v4, "discardedOutOfBoundsMeasurements"));
    -[_TSF_TSDPortMetrics setDiscardedTimestampsOutOfOrderMeasurements:](v5, "setDiscardedTimestampsOutOfOrderMeasurements:", self->_discardedTimestampsOutOfOrderMeasurements - objc_msgSend(v4, "discardedTimestampsOutOfOrderMeasurements"));
    -[_TSF_TSDPortMetrics setSuccessfulMeasurements:](v5, "setSuccessfulMeasurements:", self->_successfulMeasurements - objc_msgSend(v4, "successfulMeasurements"));
    -[_TSF_TSDPortMetrics setTotalMeasurements:](v5, "setTotalMeasurements:", self->_totalMeasurements - objc_msgSend(v4, "totalMeasurements"));
    -[_TSF_TSDPortMetrics calculatePercentages](v5, "calculatePercentages");
  }

  return v5;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned __int16)a3
{
  self->_portNumber = a3;
}

- (unint64_t)syncTimeouts
{
  return self->_syncTimeouts;
}

- (void)setSyncTimeouts:(unint64_t)a3
{
  self->_syncTimeouts = a3;
}

- (unint64_t)filterResetsDroppedLimit
{
  return self->_filterResetsDroppedLimit;
}

- (void)setFilterResetsDroppedLimit:(unint64_t)a3
{
  self->_filterResetsDroppedLimit = a3;
}

- (unint64_t)filterResetsOutOfBounds
{
  return self->_filterResetsOutOfBounds;
}

- (void)setFilterResetsOutOfBounds:(unint64_t)a3
{
  self->_filterResetsOutOfBounds = a3;
}

- (unint64_t)meanDelayTime
{
  return self->_meanDelayTime;
}

- (void)setMeanDelayTime:(unint64_t)a3
{
  self->_meanDelayTime = a3;
}

- (unint64_t)droppedMeasurements
{
  return self->_droppedMeasurements;
}

- (void)setDroppedMeasurements:(unint64_t)a3
{
  self->_droppedMeasurements = a3;
}

- (unint64_t)discardedPpmLimitMeasurements
{
  return self->_discardedPpmLimitMeasurements;
}

- (void)setDiscardedPpmLimitMeasurements:(unint64_t)a3
{
  self->_discardedPpmLimitMeasurements = a3;
}

- (unint64_t)discardedDelayLimitExceededMeasurements
{
  return self->_discardedDelayLimitExceededMeasurements;
}

- (void)setDiscardedDelayLimitExceededMeasurements:(unint64_t)a3
{
  self->_discardedDelayLimitExceededMeasurements = a3;
}

- (unint64_t)discardedOutOfBoundsMeasurements
{
  return self->_discardedOutOfBoundsMeasurements;
}

- (void)setDiscardedOutOfBoundsMeasurements:(unint64_t)a3
{
  self->_discardedOutOfBoundsMeasurements = a3;
}

- (unint64_t)discardedTimestampsOutOfOrderMeasurements
{
  return self->_discardedTimestampsOutOfOrderMeasurements;
}

- (void)setDiscardedTimestampsOutOfOrderMeasurements:(unint64_t)a3
{
  self->_discardedTimestampsOutOfOrderMeasurements = a3;
}

- (unint64_t)successfulMeasurements
{
  return self->_successfulMeasurements;
}

- (void)setSuccessfulMeasurements:(unint64_t)a3
{
  self->_successfulMeasurements = a3;
}

- (unint64_t)totalMeasurements
{
  return self->_totalMeasurements;
}

- (void)setTotalMeasurements:(unint64_t)a3
{
  self->_totalMeasurements = a3;
}

- (unint64_t)droppedPercentage
{
  return self->_droppedPercentage;
}

- (void)setDroppedPercentage:(unint64_t)a3
{
  self->_droppedPercentage = a3;
}

- (unint64_t)discardedPpmLimitPercentage
{
  return self->_discardedPpmLimitPercentage;
}

- (void)setDiscardedPpmLimitPercentage:(unint64_t)a3
{
  self->_discardedPpmLimitPercentage = a3;
}

- (unint64_t)discardedDelayLimitExceededPercentage
{
  return self->_discardedDelayLimitExceededPercentage;
}

- (void)setDiscardedDelayLimitExceededPercentage:(unint64_t)a3
{
  self->_discardedDelayLimitExceededPercentage = a3;
}

- (unint64_t)discardedOutOfBoundsPercentage
{
  return self->_discardedOutOfBoundsPercentage;
}

- (void)setDiscardedOutOfBoundsPercentage:(unint64_t)a3
{
  self->_discardedOutOfBoundsPercentage = a3;
}

- (unint64_t)discardedTimestampsOutOfOrderPercentage
{
  return self->_discardedTimestampsOutOfOrderPercentage;
}

- (void)setDiscardedTimestampsOutOfOrderPercentage:(unint64_t)a3
{
  self->_discardedTimestampsOutOfOrderPercentage = a3;
}

- (unint64_t)successfulPercentage
{
  return self->_successfulPercentage;
}

- (void)setSuccessfulPercentage:(unint64_t)a3
{
  self->_successfulPercentage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
}

@end
