@implementation SiriCoreLinkRecommendationInfo

- (SiriCoreLinkRecommendationInfo)initWithPreferences:(BOOL)a3 wifiPreference:(BOOL)a4 timeTaken:(double)a5 metrics:(id)a6
{
  id v11;
  SiriCoreLinkRecommendationInfo *v12;
  SiriCoreLinkRecommendationInfo *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SiriCoreLinkRecommendationInfo;
  v12 = -[SiriCoreLinkRecommendationInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_btPreference = a3;
    v12->_wifiPreference = a4;
    v12->_timeTaken = a5;
    objc_storeStrong((id *)&v12->_linkRecommendationMetrics, a6);
  }

  return v13;
}

- (SiriCoreLinkRecommendationInfo)initWithQueue:(id)a3
{
  id v4;
  SiriCoreLinkRecommendationInfo *v5;
  SiriCoreLinkRecommendationInfo *v6;
  objc_class *WRM_iRATInterfaceClass;
  WRM_iRATInterface *v8;
  WRM_iRATInterface *iRATClient;
  NSObject *v10;
  const char *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SiriCoreLinkRecommendationInfo;
  v5 = -[SiriCoreLinkRecommendationInfo init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_btPreference = 0;
    v5->_timeTaken = 0.0;
    WRM_iRATInterfaceClass = (objc_class *)getWRM_iRATInterfaceClass();
    if (WRM_iRATInterfaceClass)
    {
      v8 = (WRM_iRATInterface *)objc_alloc_init(WRM_iRATInterfaceClass);
      iRATClient = v6->_iRATClient;
      v6->_iRATClient = v8;

      -[WRM_iRATInterface registerClient:queue:](v6->_iRATClient, "registerClient:queue:", 22, v4);
      v10 = *MEMORY[0x24BE08FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[SiriCoreLinkRecommendationInfo initWithQueue:]";
        v11 = "%s Using link recommendation";
LABEL_7:
        _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else
    {
      v10 = *MEMORY[0x24BE08FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[SiriCoreLinkRecommendationInfo initWithQueue:]";
        v11 = "%s Unable to use link recommendation";
        goto LABEL_7;
      }
    }
  }

  return v6;
}

- (BOOL)btPreference
{
  return self->_btPreference;
}

- (void)setBTPreference:(BOOL)a3
{
  self->_btPreference = a3;
}

- (BOOL)wifiPreference
{
  return self->_wifiPreference;
}

- (void)setWiFiPreference:(BOOL)a3
{
  self->_wifiPreference = a3;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (void)setTimeTaken:(double)a3
{
  self->_timeTaken = a3;
}

- (void)setLinkMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_linkRecommendationMetrics, a3);
}

- (id)linkMetrics
{
  return self->_linkRecommendationMetrics;
}

- (void)resetLinkMetrics
{
  WRM_iRATProximityRecommendationLogging *linkRecommendationMetrics;

  linkRecommendationMetrics = self->_linkRecommendationMetrics;
  self->_timeTaken = 0.0;
  self->_linkRecommendationMetrics = 0;
  *(_WORD *)&self->_btPreference = 1;

}

- (void)fetchLinkMetrics:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iRATClient, 0);
  objc_storeStrong((id *)&self->_linkRecommendationMetrics, 0);
}

@end
