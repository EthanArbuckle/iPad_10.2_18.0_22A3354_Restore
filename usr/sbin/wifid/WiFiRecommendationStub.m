@implementation WiFiRecommendationStub

- (WiFiRecommendationStub)initWithWiFiNetwork:(__WiFiNetwork *)a3
{
  WiFiRecommendationStub *v4;
  NSString *v5;
  NSString *v6;
  WiFiScanObserverNetwork *v7;
  WiFiScanObserverNetwork *v8;
  WiFiCandidateNetworkStub *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiRecommendationStub;
  v4 = -[WiFiRecommendationStub init](&v11, "init");
  v5 = (NSString *)sub_10002B088(a3);
  v4->_SSID = v5;
  v6 = v5;
  v7 = -[WiFiScanObserverNetwork initWithWiFiNetworkRef:]([WiFiScanObserverNetwork alloc], "initWithWiFiNetworkRef:", a3);
  v4->_scannedNetwork = (WiFiScannedNetwork *)v7;
  v8 = v7;
  v9 = objc_alloc_init(WiFiCandidateNetworkStub);
  -[WiFiCandidateNetworkStub setSSID:](v9, "setSSID:", v4->_SSID);
  -[WiFiCandidateNetworkStub setSource:](v9, "setSource:", 2);
  v4->_network = (WiFiCandidateNetwork *)v9;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiRecommendationStub;
  -[WiFiRecommendationStub dealloc](&v3, "dealloc");
}

- (WiFiCandidateNetwork)network
{
  return self->_network;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WiFiScannedNetwork)scannedNetwork
{
  return self->_scannedNetwork;
}

- (BOOL)unwantedNetworkName
{
  return self->_unwantedNetworkName;
}

@end
