@implementation UIView(WatchQuickActionPrivate)

- (void)_wqa_registerQuickActionForBoundingPathChanges:()WatchQuickActionPrivate
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_getAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isEqual:", v4) & 1) != 0)
      goto LABEL_10;
    wqa_services_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = a1;
      _os_log_impl(&dword_22B0D4000, v7, OS_LOG_TYPE_INFO, "unregistering existing path change observer %@ from view: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(a1, "_wqa_actuallyClearAndUnregisterQuickAction:", v6);
  }
  if (v4)
  {
    wqa_services_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = a1;
      _os_log_impl(&dword_22B0D4000, v8, OS_LOG_TYPE_INFO, "registering path change observer %@ from view: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_setAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier, v4, (void *)1);
    objc_msgSend(a1, "_addBoundingPathChangeObserver:", v4);
  }
LABEL_10:

}

- (void)_wqa_unregisterExistingQuickActionForBoundingPathChanges
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    wqa_services_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412546;
      v5 = v2;
      v6 = 2112;
      v7 = a1;
      _os_log_impl(&dword_22B0D4000, v3, OS_LOG_TYPE_INFO, "unregistering path change observer %@ from view: %@", (uint8_t *)&v4, 0x16u);
    }

    objc_msgSend(a1, "_wqa_actuallyClearAndUnregisterQuickAction:", v2);
  }

}

- (void)_wqa_actuallyClearAndUnregisterQuickAction:()WatchQuickActionPrivate
{
  objc_msgSend(a1, "_removeBoundingPathChangeObserver:");
  objc_setAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier, 0, (void *)1);
}

@end
