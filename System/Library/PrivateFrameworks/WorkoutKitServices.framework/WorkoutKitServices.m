void _WorkoutKitConnectWithBlock(void *a1, void *a2)
{
  void (**v3)(id, void *, void *);
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.WorkoutKitXPCService"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257944A98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "activate");
  objc_initWeak(&location, v5);
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = ___WorkoutKitConnectWithBlock_block_invoke;
  v16[3] = &unk_251BECE30;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v16);
  v10 = v7;
  v11 = 3221225472;
  v12 = ___WorkoutKitConnectWithBlock_block_invoke_2;
  v13 = &unk_251BECE58;
  v8 = v4;
  v14 = v8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "setInvalidationHandler:", &v10);
  objc_msgSend(v5, "remoteObjectProxy", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v9, v5);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void sub_24A628980(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x24BDB0728]();
}

