@implementation NRBabelRouteLocal

- (unsigned)seqno
{
  void *v2;
  unsigned __int16 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelRoute instance](self, "instance"));
  v3 = (unsigned __int16)objc_msgSend(v2, "nodeSeqno");

  return v3;
}

- (unsigned)metric
{
  return 0;
}

- (NRBabelRouteLocal)initWithPrefix:(id)a3 instance:(id)a4
{
  id v6;
  id v7;
  NRBabelRouteLocal *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[0] = 0;
  v11[1] = 0;
  v6 = a4;
  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRBabelRouteLocal;
  v8 = -[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:](&v10, "initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:", v7, 0, objc_msgSend(v6, "routerID"), objc_msgSend(v6, "nodeSeqno"), 0xFFFFLL, 0, v11, v6);

  return v8;
}

@end
