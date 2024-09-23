@implementation RERecentActionNotifier

- (void)performedAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v13[0] = CFSTR("RERecentDonatedActionBundleIdentifierKey");
    v3 = a3;
    objc_msgSend(v3, "donationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v13[1] = CFSTR("RERecentDonatedActionIdentifierKey");
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "actionTypeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "re_actionIdentifierHashValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    v13[2] = CFSTR("RERecentDonatedActionDateKey");
    objc_msgSend(v3, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("RERecentDonatedActionWasPerformedNotification"), 0, v11);

  }
}

@end
