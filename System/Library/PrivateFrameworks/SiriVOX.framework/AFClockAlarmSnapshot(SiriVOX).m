@implementation AFClockAlarmSnapshot(SiriVOX)

- (id)svx_notifiedFiringAlarms
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;

  objc_msgSend(a1, "alarmsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notifiedFiringAlarmIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __57__AFClockAlarmSnapshot_SiriVOX__svx_notifiedFiringAlarms__block_invoke;
  v12 = &unk_24D24BF38;
  v13 = v2;
  v14 = v3;
  v5 = v3;
  v6 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v5, "copy", v9, v10, v11, v12);
  return v7;
}

@end
