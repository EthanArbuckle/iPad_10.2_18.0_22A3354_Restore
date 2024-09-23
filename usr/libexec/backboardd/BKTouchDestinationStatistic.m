@implementation BKTouchDestinationStatistic

- (void)reset
{
  NSMutableDictionary *statsPerDestination;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKTouchDestinationStatistic;
  -[BKEventStatistic reset](&v4, "reset");
  statsPerDestination = self->_statsPerDestination;
  self->_statsPerDestination = 0;

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v6 = objc_opt_class(BSDescriptionStream, v5);
  v7 = v4;
  v11 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      v8 = v11;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003C94;
  v12[3] = &unk_1000ECD80;
  v12[4] = self;
  v13 = v9;
  v10 = v9;
  objc_msgSend(v10, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", CFSTR("destinations"), CFSTR("{"), CFSTR("}"), v12);

}

- (void)addDestination:(id)a3 touchIdentifier:(unsigned int)a4
{
  unsigned int *v6;
  NSMutableDictionary *statsPerDestination;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  BKTouchDestinationStats *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ClientConnectionManager;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int *v22;

  v6 = (unsigned int *)a3;
  statsPerDestination = self->_statsPerDestination;
  v22 = v6;
  if (!statsPerDestination)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_statsPerDestination;
    self->_statsPerDestination = v8;

    v6 = v22;
    statsPerDestination = self->_statsPerDestination;
  }
  v10 = (BKTouchDestinationStats *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](statsPerDestination, "objectForKey:", v6));
  if (!v10)
  {
    v10 = objc_alloc_init(BKTouchDestinationStats);
    -[NSMutableDictionary setObject:forKey:](self->_statsPerDestination, "setObject:forKey:", v10, v22);
    if (v22)
      v12 = v22[3];
    else
      v12 = 0;
    ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(v22, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(ClientConnectionManager);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientForTaskPort:", v12));
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "pid");
      if (v17)
        v18 = v17;
      else
        v18 = 0xFFFFFFFFLL;
    }
    else
    {
      v18 = 0xFFFFFFFFLL;
    }

    v19 = BSProcessDescriptionForPID(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[BKTouchDestinationStats setProcessDescription:](v10, "setProcessDescription:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDestinationStats touchIdentifiers](v10, "touchIdentifiers"));
  objc_msgSend(v21, "addIndex:", a4);

  -[BKEventStatistic setNeedsLogging:](self, "setNeedsLogging:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsPerDestination, 0);
}

- (NSMutableDictionary)statsPerDestination
{
  return self->_statsPerDestination;
}

- (void)setStatsPerDestination:(id)a3
{
  objc_storeStrong((id *)&self->_statsPerDestination, a3);
}

@end
