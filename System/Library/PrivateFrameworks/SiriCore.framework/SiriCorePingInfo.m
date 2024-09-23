@implementation SiriCorePingInfo

- (void)markPingSentWithIndex:(int64_t)a3
{
  NSMapTable *outstandingPings;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  id v9;

  outstandingPings = self->_outstandingPings;
  if (!outstandingPings)
  {
    v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 1);
    v7 = self->_outstandingPings;
    self->_outstandingPings = v6;

    outstandingPings = self->_outstandingPings;
  }
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemUptime");
  NSMapInsert(outstandingPings, (const void *)a3, (const void *)objc_msgSend(v8, "numberWithDouble:"));

}

- (void)markPongReceivedWithIndex:(int64_t)a3
{
  NSMapTable *outstandingPings;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  id v13;

  outstandingPings = self->_outstandingPings;
  if (outstandingPings)
  {
    v6 = NSMapGet(outstandingPings, (const void *)a3);
    if (v6)
    {
      v13 = v6;
      NSMapRemove(self->_outstandingPings, (const void *)a3);
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemUptime");
      v9 = v8;
      objc_msgSend(v13, "doubleValue");
      v11 = v9 - v10;

      v12 = self->_pingAcknowledgedCount + 1;
      self->_pingAcknowledgedCount = v12;
      self->_avgPingTime = self->_avgPingTime + (v11 - self->_avgPingTime) / (double)v12;

    }
  }
}

- (unint64_t)numberOfUnacknowledgedPings
{
  return -[NSMapTable count](self->_outstandingPings, "count");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(SiriCorePingInfo);
  *((_QWORD *)result + 2) = self->_pingAcknowledgedCount;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_avgPingTime;
  return result;
}

- (int64_t)pingAcknowledgedCount
{
  return self->_pingAcknowledgedCount;
}

- (double)avgPingTime
{
  return self->_avgPingTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingPings, 0);
}

@end
