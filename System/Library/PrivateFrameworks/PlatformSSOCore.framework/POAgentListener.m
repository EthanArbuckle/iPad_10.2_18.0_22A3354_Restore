@implementation POAgentListener

- (POAgentListener)initWithMachServiceName:(id)a3
{
  POAgentListener *v3;
  POAgentListener *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)POAgentListener;
  v3 = -[POAgentListener initWithMachServiceName:](&v6, sel_initWithMachServiceName_, a3);
  v4 = v3;
  if (v3)
    -[POAgentListener setDelegate:](v3, "setDelegate:", v3);
  return v4;
}

@end
