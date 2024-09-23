@implementation PCStatusConditions

+ (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, PCStatusConditionsImpl *);
  PCStatusConditionsImpl *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD, PCStatusConditionsImpl *))a5;
  if (!v12 || !v7)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = -1102;
LABEL_8:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PCStatusConditionsErrorDomain"), v11, 0);
    v9 = (PCStatusConditionsImpl *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9);
    goto LABEL_9;
  }
  if (MKBDeviceUnlockedSinceBoot())
  {
    v9 = objc_alloc_init(PCStatusConditionsImpl);
    -[PCStatusConditionsImpl isStatusConditionRegistered:bundleIdentifier:completionHandler:](v9, "isStatusConditionRegistered:bundleIdentifier:completionHandler:", v12, v7, v8);
LABEL_9:

    goto LABEL_10;
  }
  if (v8)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = -1101;
    goto LABEL_8;
  }
LABEL_10:

}

+ (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, PCStatusConditionsImpl *);
  PCStatusConditionsImpl *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, PCStatusConditionsImpl *))a4;
  if (!v9)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = -1102;
LABEL_7:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PCStatusConditionsErrorDomain"), v8, 0);
    v6 = (PCStatusConditionsImpl *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
    goto LABEL_8;
  }
  if (MKBDeviceUnlockedSinceBoot())
  {
    v6 = objc_alloc_init(PCStatusConditionsImpl);
    -[PCStatusConditionsImpl setStatusCondition:completionHandler:](v6, "setStatusCondition:completionHandler:", v9, v5);
LABEL_8:

    goto LABEL_9;
  }
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = -1101;
    goto LABEL_7;
  }
LABEL_9:

}

+ (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, PCStatusConditionsImpl *);
  PCStatusConditionsImpl *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, PCStatusConditionsImpl *))a4;
  if (!v9)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = -1102;
LABEL_7:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PCStatusConditionsErrorDomain"), v8, 0);
    v6 = (PCStatusConditionsImpl *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
    goto LABEL_8;
  }
  if (MKBDeviceUnlockedSinceBoot())
  {
    v6 = objc_alloc_init(PCStatusConditionsImpl);
    -[PCStatusConditionsImpl clearStatusCondition:completionHandler:](v6, "clearStatusCondition:completionHandler:", v9, v5);
LABEL_8:

    goto LABEL_9;
  }
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = -1101;
    goto LABEL_7;
  }
LABEL_9:

}

@end
