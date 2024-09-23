@implementation NCNotificationStructuredListUtilities

+ (BOOL)isNotificationListComponentDelegateMethod:(SEL)a3
{
  if ((objc_msgSend(a1, "_isNotificationListComponentDelegateMethod:") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_isNotificationListBaseComponentDelegateMethod:", a3);
}

+ (BOOL)_isNotificationListComponentDelegateMethod:(SEL)a3
{
  void *v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__NCNotificationStructuredListUtilities__isNotificationListComponentDelegateMethod___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_isNotificationListComponentDelegateMethod__onceToken != -1)
    dispatch_once(&_isNotificationListComponentDelegateMethod__onceToken, block);
  v4 = (void *)_isNotificationListComponentDelegateMethod____notificationListComponentDelegateSelectors;
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  return (char)v4;
}

void __84__NCNotificationStructuredListUtilities__isNotificationListComponentDelegateMethod___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_selectorsForProtocol:", &unk_1EFC0B9D8);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_isNotificationListComponentDelegateMethod____notificationListComponentDelegateSelectors;
  _isNotificationListComponentDelegateMethod____notificationListComponentDelegateSelectors = v1;

}

+ (BOOL)_isNotificationListBaseComponentDelegateMethod:(SEL)a3
{
  void *v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NCNotificationStructuredListUtilities__isNotificationListBaseComponentDelegateMethod___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_isNotificationListBaseComponentDelegateMethod__onceToken != -1)
    dispatch_once(&_isNotificationListBaseComponentDelegateMethod__onceToken, block);
  v4 = (void *)_isNotificationListBaseComponentDelegateMethod____notificationListBaseComponentDelegateSelectors;
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  return (char)v4;
}

void __88__NCNotificationStructuredListUtilities__isNotificationListBaseComponentDelegateMethod___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_selectorsForProtocol:", &unk_1EFC0A830);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_isNotificationListBaseComponentDelegateMethod____notificationListBaseComponentDelegateSelectors;
  _isNotificationListBaseComponentDelegateMethod____notificationListBaseComponentDelegateSelectors = v1;

}

+ (id)_selectorsForProtocol:(id)a3
{
  Protocol *v3;
  id v4;
  objc_method_description *v5;
  objc_method_description *v6;
  unsigned int v7;
  unsigned int v8;
  objc_method_description *v9;
  void *v10;
  unsigned int v12;
  unsigned int outCount;

  v3 = (Protocol *)a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  outCount = 0;
  v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount);
  v12 = 0;
  v6 = protocol_copyMethodDescriptionList(v3, 0, 1, &v12);
  v7 = outCount;
  if (v12 + outCount)
  {
    v8 = 0;
    do
    {
      if (v8 >= v7)
      {
        v9 = v6;
      }
      else
      {
        v7 = 0;
        v9 = v5;
      }
      NSStringFromSelector(v9[v8 - v7].name);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      ++v8;
      v7 = outCount;
    }
    while (v8 < v12 + outCount);
  }
  free(v5);
  free(v6);

  return v4;
}

@end
