@implementation PUAssetExplorerAnalytics

- (PUAssetExplorerAnalytics)init
{
  PUAssetExplorerAnalytics *v2;
  NSMutableSet *v3;
  NSMutableSet *eventsSent;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAssetExplorerAnalytics;
  v2 = -[PUAssetExplorerAnalytics init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    eventsSent = v2->_eventsSent;
    v2->_eventsSent = v3;

  }
  return v2;
}

- (void)sendEvent:(id)a3 view:(unint64_t)a4 source:(unint64_t)a5 currentAssetCount:(int64_t)a6
{
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((-[NSMutableSet containsObject:](self->_eventsSent, "containsObject:", v10) & 1) == 0)
  {
    v16[0] = v10;
    v15[0] = CFSTR("eventName");
    v15[1] = CFSTR("view");
    if (a4 > 2)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E58A6E88[a4];
    v16[1] = v11;
    v15[2] = CFSTR("source");
    if (a5 > 4)
      v12 = CFSTR("unknown");
    else
      v12 = off_1E58A6EA0[a5];
    v16[2] = v12;
    v15[3] = CFSTR("currentAssetCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    AnalyticsSendEvent();
    -[NSMutableSet addObject:](self->_eventsSent, "addObject:", v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsSent, 0);
}

@end
