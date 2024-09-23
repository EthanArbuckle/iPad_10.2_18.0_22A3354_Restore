@implementation TUIAnalytics

- (TUIAnalytics)init
{
  NSDate *timeConversationUIDisplayed;

  timeConversationUIDisplayed = self->_timeConversationUIDisplayed;
  self->_timeConversationUIDisplayed = 0;

  return self;
}

- (void)ktConversationNoMatch:(BOOL)a3
{
  NSDate *timeConversationUIDisplayed;

  timeConversationUIDisplayed = self->_timeConversationUIDisplayed;
  if (timeConversationUIDisplayed)
    -[NSDate timeIntervalSinceNow](timeConversationUIDisplayed, "timeIntervalSinceNow");
  AnalyticsSendEventLazy();
}

id __38__TUIAnalytics_ktConversationNoMatch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("reportToApple");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("timeToNoMatch");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)ktMarkAsVerified:(BOOL)a3 sasCodeGenerated:(BOOL)a4 publicKeyVisible:(BOOL)a5
{
  NSDate *timeConversationUIDisplayed;

  timeConversationUIDisplayed = self->_timeConversationUIDisplayed;
  if (timeConversationUIDisplayed)
    -[NSDate timeIntervalSinceNow](timeConversationUIDisplayed, "timeIntervalSinceNow");
  AnalyticsSendEventLazy();
}

id __67__TUIAnalytics_ktMarkAsVerified_sasCodeGenerated_publicKeyVisible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("timeToVerified");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("sasCodeGenerated");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("publicKeyVisible");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 42));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)ktInteraction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(CFSTR("conversationUIDisplayed"), "isEqualToString:", v4))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAnalytics setTimeConversationUIDisplayed:](self, "setTimeConversationUIDisplayed:", v5);

  }
  v7 = v4;
  v6 = v4;
  AnalyticsSendEventLazy();

}

id __30__TUIAnalytics_ktInteraction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("kind");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)timeConversationUIDisplayed
{
  return self->_timeConversationUIDisplayed;
}

- (void)setTimeConversationUIDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_timeConversationUIDisplayed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeConversationUIDisplayed, 0);
}

@end
