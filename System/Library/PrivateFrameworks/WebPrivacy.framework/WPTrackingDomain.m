@implementation WPTrackingDomain

- (WPTrackingDomain)initWithHost:(id)a3 owner:(id)a4 canBlock:(BOOL)a5
{
  id v9;
  id v10;
  WPTrackingDomain *v11;
  WPTrackingDomain *v12;
  WPTrackingDomain *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WPTrackingDomain;
  v11 = -[WPTrackingDomain init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_host, a3);
    objc_storeStrong((id *)&v12->_owner, a4);
    v12->_canBlock = a5;
    v13 = v12;
  }

  return v12;
}

- (NSString)host
{
  return self->_host;
}

- (NSString)owner
{
  return self->_owner;
}

- (BOOL)canBlock
{
  return self->_canBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
