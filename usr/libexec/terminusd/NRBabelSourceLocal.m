@implementation NRBabelSourceLocal

- (NRBabelSourceLocal)initWithPrefix:(id)a3 instance:(id)a4
{
  id v6;
  id v7;
  NRBabelSourceLocal *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRBabelSourceLocal;
  v8 = -[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:](&v10, "initWithPrefix:routerID:seqno:metric:instance:", v7, objc_msgSend(v6, "routerID"), objc_msgSend(v6, "nodeSeqno"), 0, v6);

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelSource bPrefix](self, "bPrefix"));
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (local)"), v4);

  return v5;
}

- (unsigned)seqno
{
  void *v2;
  unsigned __int16 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelSource instance](self, "instance"));
  v3 = (unsigned __int16)objc_msgSend(v2, "nodeSeqno");

  return v3;
}

- (BOOL)isNewDistanceFeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  return 0;
}

@end
