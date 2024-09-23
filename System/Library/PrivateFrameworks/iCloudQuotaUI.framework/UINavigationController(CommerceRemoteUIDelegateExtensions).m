@implementation UINavigationController(CommerceRemoteUIDelegateExtensions)

- (void)removeViewControllersAfter:()CommerceRemoteUIDelegateExtensions before:animated:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = objc_msgSend(v11, "indexOfObject:", v9);
  v13 = objc_msgSend(v11, "indexOfObject:", v8);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    ICQUSLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218240;
      v19 = v12;
      v20 = 2048;
      v21 = v13;
      v15 = "unable to find initial (%lu) or final (%lu) view controller";
      v16 = v14;
      v17 = 22;
LABEL_9:
      _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v17);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v13 <= v12 + 1)
  {
    ICQUSLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v15 = "no view controllers between initial and final view controllers";
      v16 = v14;
      v17 = 2;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(v11, "removeObjectsInRange:");
  objc_msgSend(a1, "setViewControllers:animated:", v11, a5);
LABEL_11:

}

@end
