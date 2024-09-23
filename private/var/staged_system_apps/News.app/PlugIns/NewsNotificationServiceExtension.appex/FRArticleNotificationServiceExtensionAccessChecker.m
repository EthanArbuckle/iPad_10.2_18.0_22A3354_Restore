@implementation FRArticleNotificationServiceExtensionAccessChecker

- (FRArticleNotificationServiceExtensionAccessChecker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRArticleNotificationServiceExtensionAccessChecker;
  return -[FRArticleNotificationServiceExtensionAccessChecker init](&v3, "init");
}

- (BOOL)hasPaidAccessToHeadlineWithAccessChecker:(id)a3 headline:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  char v20;
  void *v21;
  unsigned __int8 v22;
  char v23;
  id v24;
  id v25;
  uint64_t v26;
  id AssociatedObject;
  void *v28;
  unint64_t v29;
  char v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  BOOL v36;
  unsigned __int8 v38;
  void *v39;
  void *v40;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v9 = objc_msgSend(v8, "isPaid");
  v10 = objc_msgSend(v8, "isBundlePaid");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceChannel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v13 = v7;
  v14 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleSubscriptionProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "purchaseProvider"));
  v17 = v15;
  v18 = v16;
  v19 = v14;
  if ((v9 & 1) != 0 || v10)
  {
    v20 = v9 ^ 1;
    if (!v18)
      v20 = 1;
    if ((v20 & 1) != 0
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "purchasedTagIDs")),
          v22 = objc_msgSend(v21, "containsObject:", v19),
          v21,
          (v22 & 1) == 0))
    {
      v23 = v10 ^ 1;
      if (!v17)
        v23 = 1;
      if ((v23 & 1) != 0)
        goto LABEL_15;
      v24 = v17;
      v25 = v19;
      if (!v25)
        goto LABEL_12;
      v39 = v25;
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bundleSubscription"));
      AssociatedObject = objc_getAssociatedObject((id)v26, (const void *)(v26 + 1));
      v40 = v24;
      v28 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
      v29 = (unint64_t)objc_msgSend(v28, "unsignedIntegerValue");
      v30 = v29;
      v31 = objc_getAssociatedObject((id)v26, (const void *)~v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = objc_msgSend(v32, "unsignedIntegerValue") ^ v30;

      v24 = v40;
      v25 = v39;
      if ((v33 & 1) == 0)
      {
LABEL_12:

LABEL_15:
        v36 = 0;
        goto LABEL_16;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bundleSubscription"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bundleChannelIDs"));
      v38 = objc_msgSend(v35, "containsObject:", v39);

      if ((v38 & 1) == 0)
        goto LABEL_15;
    }
  }
  v36 = 1;
LABEL_16:

  return v36;
}

@end
