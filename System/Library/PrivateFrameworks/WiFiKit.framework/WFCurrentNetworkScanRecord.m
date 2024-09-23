@implementation WFCurrentNetworkScanRecord

- (WFCurrentNetworkScanRecord)initWithScanResult:(id)a3 knownNetworkProfile:(id)a4
{
  id v5;
  WFCurrentNetworkScanRecord *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCurrentNetworkScanRecord;
  v5 = a4;
  v6 = -[WFNetworkScanRecord initWithScanResults:](&v8, sel_initWithScanResults_, a3);
  -[WFNetworkScanRecord setMatchingKnownNetworkProfile:](v6, "setMatchingKnownNetworkProfile:", v5, v8.receiver, v8.super_class);

  return v6;
}

@end
