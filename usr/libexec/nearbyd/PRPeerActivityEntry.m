@implementation PRPeerActivityEntry

+ (id)entryWithActivityType:(int)a3
{
  uint64_t v3;
  double v4;

  v3 = *(_QWORD *)&a3;
  v4 = sub_10000883C();
  return +[PRPeerActivityEntry entryWithActivityType:timestamp:](PRPeerActivityEntry, "entryWithActivityType:timestamp:", v3, v4);
}

+ (id)entryWithActivityType:(int)a3 timestamp:(double)a4
{
  uint64_t v5;
  PRPeerActivityEntry *v6;

  v5 = *(_QWORD *)&a3;
  v6 = objc_opt_new(PRPeerActivityEntry);
  -[PRPeerActivityEntry setLatestActivityType:](v6, "setLatestActivityType:", v5);
  -[PRPeerActivityEntry setLatestActivityTimestamp:](v6, "setLatestActivityTimestamp:", a4);
  return v6;
}

- (int)latestActivityType
{
  return self->_latestActivityType;
}

- (void)setLatestActivityType:(int)a3
{
  self->_latestActivityType = a3;
}

- (double)latestActivityTimestamp
{
  return self->_latestActivityTimestamp;
}

- (void)setLatestActivityTimestamp:(double)a3
{
  self->_latestActivityTimestamp = a3;
}

- (BOOL)peerLostCallbackReceived
{
  return self->_peerLostCallbackReceived;
}

- (void)setPeerLostCallbackReceived:(BOOL)a3
{
  self->_peerLostCallbackReceived = a3;
}

@end
