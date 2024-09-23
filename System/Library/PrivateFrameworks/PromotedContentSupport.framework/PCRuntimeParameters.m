@implementation PCRuntimeParameters

+ (void)rateLimitRequestsInFeed:(float)a3 inArticle:(float)a4 betweenArticle:(float)a5 videoInArticle:(float)a6 nativeInFeed:(float)a7 nativeInArticle:(float)a8
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v22[0] = *MEMORY[0x24BDFD4F0];
  sub_2153ED6D8(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v22[1] = *MEMORY[0x24BDFD4E8];
  sub_2153ED6D8(a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  v22[2] = *MEMORY[0x24BDFD4E0];
  sub_2153ED6D8(a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = *MEMORY[0x24BDFD508];
  sub_2153ED6D8(a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = *MEMORY[0x24BDFD500];
  sub_2153ED6D8(a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  v22[5] = *MEMORY[0x24BDFD4F8];
  sub_2153ED6D8(a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(MEMORY[0x24BDFD4D8], "metricClass")), "initWithPurpose:metric:contentIdentifier:contextIdentifier:handle:branch:properties:internalProperties:relayData:environment:order:options:", -1, 77000, 0, 0, 0, 0, v19, 0, 0, 0, 0, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDFD4D8], "daemonDeliveryClass"), "daemonDelivery");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "receivedMetric:", v20);

}

+ (int64_t)contextPrefetchLimit
{
  if (qword_253DA4CD0 >= 0)
    return qword_253DA4CD0;
  else
    return 3;
}

+ (void)setContextPrefetchLimit:(int64_t)a3
{
  qword_253DA4CD0 = a3;
}

@end
