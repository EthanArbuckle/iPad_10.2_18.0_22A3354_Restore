@implementation SXLayoutContextFactory

- (id)createLayoutContextForColumnLayout:(id)a3 unitConverter:(id)a4
{
  id v5;
  id v6;
  SXLayoutContext *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SXLayoutContext initWithColumnLayout:unitConverter:]([SXLayoutContext alloc], "initWithColumnLayout:unitConverter:", v6, v5);

  return v7;
}

@end
