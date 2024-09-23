@implementation SWCServiceSettings

void __41___SWCServiceSettings_notificationCenter__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37D0]);
  v3 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v2;

  if (_SWCServerIsUsingTestListener())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_serviceSettingsDidChange_, CFSTR("com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", *(_QWORD *)(a1 + 32), sel_serviceSettingsDidChange_, CFSTR("com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification"), 0, 4);
  }

}

void __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __58___SWCServiceSettings_objectForKey_ofClass_valuesOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __44___SWCServiceSettings_commitReturningError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __44___SWCServiceSettings_commitReturningError___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1[5] + 8);
  if (v11)
  {
    *(_BYTE *)(v6 + 24) = 1;
    v7 = (void **)(a1[4] + 32);
    v8 = v11;
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
    v7 = (void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v8 = v5;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __65___SWCServiceSettings_postChangeNotificationForServiceSpecifier___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("_SWCServiceSettings notification queue", v2);
  v1 = (void *)qword_1ED1B6180;
  qword_1ED1B6180 = (uint64_t)v0;

}

void __65___SWCServiceSettings_postChangeNotificationForServiceSpecifier___block_invoke_2(uint64_t a1)
{
  id v2;

  if (_SWCServerIsUsingTestListener())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification"), 0, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:options:", CFSTR("com.apple.swc.internalUseOnly.serviceSettingsDidChangeNotification"), 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

@end
