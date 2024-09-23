@implementation PMLAWDSessionTrackerMock

- (PMLAWDSessionTrackerMock)initWithModel:(id)a3
{
  PMLAWDSessionTrackerMock *v3;
  uint64_t v4;
  NSMutableArray *internalTrackedSessions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PMLAWDSessionTrackerMock;
  v3 = -[PMLAWDBaseTracker initWithModel:](&v7, sel_initWithModel_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    internalTrackedSessions = v3->_internalTrackedSessions;
    v3->_internalTrackedSessions = (NSMutableArray *)v4;

    objc_storeStrong((id *)&v3->_trackedSessions, v3->_internalTrackedSessions);
  }
  return v3;
}

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
  -[NSMutableArray addObject:](self->_internalTrackedSessions, "addObject:", a4);
}

- (void)clearTrackedSessions
{
  -[NSMutableArray removeAllObjects](self->_internalTrackedSessions, "removeAllObjects");
}

- (NSArray)trackedSessions
{
  return self->_trackedSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedSessions, 0);
  objc_storeStrong((id *)&self->_internalTrackedSessions, 0);
}

@end
