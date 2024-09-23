@implementation STMSizeCacheEvent

+ (id)eventWithPath:(id)a3 flags:(unsigned int)a4 event:(unint64_t)CurrentEventId
{
  uint64_t v6;
  id v7;
  STMSizeCacheEvent *v8;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = objc_alloc_init(STMSizeCacheEvent);
  -[STMSizeCacheEvent setPath:](v8, "setPath:", v7);

  -[STMSizeCacheEvent setFlags:](v8, "setFlags:", v6);
  if (!CurrentEventId)
    CurrentEventId = FSEventsGetCurrentEventId();
  -[STMSizeCacheEvent setEvtID:](v8, "setEvtID:", CurrentEventId);
  return v8;
}

- (int64_t)eventIDCompare:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "evtID");
  if (v5 <= -[STMSizeCacheEvent evtID](self, "evtID"))
  {
    v7 = objc_msgSend(v4, "evtID");
    v6 = v7 < -[STMSizeCacheEvent evtID](self, "evtID");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)evtID
{
  return self->_evtID;
}

- (void)setEvtID:(unint64_t)a3
{
  self->_evtID = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
