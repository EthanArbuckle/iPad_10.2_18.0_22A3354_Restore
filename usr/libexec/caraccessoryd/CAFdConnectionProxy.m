@implementation CAFdConnectionProxy

void __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CAFDLogging();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "agent"));
  objc_msgSend(v4, "_removeConnection:", WeakRetained);

  objc_msgSend(WeakRetained, "invalidateAndRemoveAssertions");
}

void __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CAFDLogging();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "agent"));
  objc_msgSend(v4, "_removeConnection:", WeakRetained);

  objc_msgSend(WeakRetained, "invalidateAndRemoveAssertions");
}

void __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v2 = (id *)(a1 + 32);
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "assertions"));
  objc_msgSend(v5, "removeObject:", v4);

  v6 = CAFDAssertionLogging();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke_cold_1(v2, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)*v2 + 4);
}

id __89___CAFdConnectionProxy_removeRegistrationFromPluginID_instanceIDs_priority_withResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

void __75___CAFdConnectionProxy_readFromPluginID_instanceIDs_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc((Class)CAFResponse);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 2, 0));
  v3 = objc_msgSend(v2, "initWithError:", v4);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

void __69___CAFdConnectionProxy_writeToPluginID_values_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc((Class)CAFResponse);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 2, 0));
  v3 = objc_msgSend(v2, "initWithError:", v4);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

void __79___CAFdConnectionProxy_requestPluginID_instanceID_value_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 2, 0));
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __50___CAFdConnectionProxy_didUpdateCurrentCarConfig___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteProxy"));
  objc_msgSend(v2, "didUpdateCurrentCarConfig:", *(_QWORD *)(a1 + 40));

}

void __40___CAFdConnectionProxy_didUpdateConfig___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteProxy"));
  objc_msgSend(v2, "didUpdateConfig:", *(_QWORD *)(a1 + 40));

}

void __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteProxy"));
  objc_msgSend(v2, "didUpdatePluginID:values:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __73___CAFdConnectionProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteProxy"));
  objc_msgSend(v2, "didRequestPluginID:instanceID:value:withResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __59___CAFdConnectionProxy_didNotifyPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "remoteProxy"));
  objc_msgSend(v2, "didNotifyPluginID:instanceID:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "assertions"));
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, a2, v4, "%{public}@ Assertion released. active count=%lu", v5);

  OUTLINED_FUNCTION_10();
}

@end
