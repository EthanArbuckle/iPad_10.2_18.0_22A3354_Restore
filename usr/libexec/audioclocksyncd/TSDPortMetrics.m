@implementation TSDPortMetrics

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

- (TSDPortMetrics)initWithPort:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TSDgPTPPort *port;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = a3;
  objc_storeStrong((id *)&self->_port, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self->_port, "service"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iodProperties"));

  self->_portNumber = (unsigned __int16)objc_msgSend(v5, "portNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncReceiptTimeoutCounter")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncReceiptTimeoutCounter")));
    self->_syncTimeouts = objc_msgSend(v9, "unsignedIntValue");

  }
  else
  {
    self->_syncTimeouts = 0;
  }

  port = self->_port;
  v11 = objc_opt_class(TSDgPTPFDEtEPort);
  if ((objc_opt_isKindOfClass(port, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetDroppedLimitCounter")));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetDroppedLimitCounter")));
      self->_filterResetsDroppedLimit = objc_msgSend(v13, "unsignedIntValue");

    }
    else
    {
      self->_filterResetsDroppedLimit = 0;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetOutOfBoundsCounter")));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetOutOfBoundsCounter")));
      self->_filterResetsOutOfBounds = objc_msgSend(v15, "unsignedIntValue");

    }
    else
    {
      self->_filterResetsOutOfBounds = 0;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LinkPropagationMeanDelay")));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LinkPropagationMeanDelay")));
      self->_meanDelayTime = objc_msgSend(v17, "unsignedIntValue");

    }
    else
    {
      self->_meanDelayTime = 0;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDroppedCounter")));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDroppedCounter")));
      self->_droppedMeasurements = objc_msgSend(v19, "unsignedIntValue");

    }
    else
    {
      self->_droppedMeasurements = 0;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RawDelayMeasurementCounter")));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RawDelayMeasurementCounter")));
      v22 = objc_msgSend(v21, "unsignedIntValue");

    }
    else
    {
      v22 = 0;
    }

    self->_totalMeasurements = self->_droppedMeasurements + v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardPPMLimitCounter")));
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardPPMLimitCounter")));
      self->_discardedPpmLimitMeasurements = objc_msgSend(v24, "unsignedIntValue");

    }
    else
    {
      self->_discardedPpmLimitMeasurements = 0;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardDelayLimitExceededCounter")));
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardDelayLimitExceededCounter")));
      self->_discardedDelayLimitExceededMeasurements = objc_msgSend(v26, "unsignedIntValue");

    }
    else
    {
      self->_discardedDelayLimitExceededMeasurements = 0;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardOutOfBoundsCounter")));
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardOutOfBoundsCounter")));
      self->_discardedOutOfBoundsMeasurements = objc_msgSend(v28, "unsignedIntValue");

    }
    else
    {
      self->_discardedOutOfBoundsMeasurements = 0;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardTimestampsOutOfOrderCounter")));
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardTimestampsOutOfOrderCounter")));
      self->_discardedTimestampsOutOfOrderMeasurements = objc_msgSend(v30, "unsignedIntValue");

    }
    else
    {
      self->_discardedTimestampsOutOfOrderMeasurements = 0;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementSuccessCounter")));
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SyncMeasurementSuccessCounter")));
      self->_successfulMeasurements = objc_msgSend(v32, "unsignedIntValue");

    }
    else
    {
      self->_successfulMeasurements = 0;
    }

    -[TSDPortMetrics calculatePercentages](self, "calculatePercentages");
  }

  return self;
}

- (id)getDelta:(id)a3
{
  id v4;
  TSDPortMetrics *v5;
  TSDgPTPPort *port;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(TSDPortMetrics);
  -[TSDPortMetrics setPortNumber:](v5, "setPortNumber:", self->_portNumber);
  -[TSDPortMetrics setSyncTimeouts:](v5, "setSyncTimeouts:", self->_syncTimeouts - (_QWORD)objc_msgSend(v4, "syncTimeouts"));
  port = self->_port;
  v7 = objc_opt_class(TSDgPTPFDEtEPort);
  if ((objc_opt_isKindOfClass(port, v7) & 1) != 0)
  {
    -[TSDPortMetrics setFilterResetsDroppedLimit:](v5, "setFilterResetsDroppedLimit:", self->_filterResetsDroppedLimit - (_QWORD)objc_msgSend(v4, "filterResetsDroppedLimit"));
    -[TSDPortMetrics setFilterResetsOutOfBounds:](v5, "setFilterResetsOutOfBounds:", self->_filterResetsOutOfBounds - (_QWORD)objc_msgSend(v4, "filterResetsOutOfBounds"));
    -[TSDPortMetrics setDroppedMeasurements:](v5, "setDroppedMeasurements:", self->_droppedMeasurements - (_QWORD)objc_msgSend(v4, "droppedMeasurements"));
    -[TSDPortMetrics setDiscardedPpmLimitMeasurements:](v5, "setDiscardedPpmLimitMeasurements:", self->_discardedPpmLimitMeasurements - (_QWORD)objc_msgSend(v4, "discardedPpmLimitMeasurements"));
    -[TSDPortMetrics setDiscardedDelayLimitExceededMeasurements:](v5, "setDiscardedDelayLimitExceededMeasurements:", self->_discardedDelayLimitExceededMeasurements- (_QWORD)objc_msgSend(v4, "discardedDelayLimitExceededMeasurements"));
    -[TSDPortMetrics setDiscardedOutOfBoundsMeasurements:](v5, "setDiscardedOutOfBoundsMeasurements:", self->_discardedOutOfBoundsMeasurements - (_QWORD)objc_msgSend(v4, "discardedOutOfBoundsMeasurements"));
    -[TSDPortMetrics setDiscardedTimestampsOutOfOrderMeasurements:](v5, "setDiscardedTimestampsOutOfOrderMeasurements:", self->_discardedTimestampsOutOfOrderMeasurements- (_QWORD)objc_msgSend(v4, "discardedTimestampsOutOfOrderMeasurements"));
    -[TSDPortMetrics setSuccessfulMeasurements:](v5, "setSuccessfulMeasurements:", self->_successfulMeasurements - (_QWORD)objc_msgSend(v4, "successfulMeasurements"));
    -[TSDPortMetrics setTotalMeasurements:](v5, "setTotalMeasurements:", self->_totalMeasurements - (_QWORD)objc_msgSend(v4, "totalMeasurements"));
    -[TSDPortMetrics calculatePercentages](v5, "calculatePercentages");
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
