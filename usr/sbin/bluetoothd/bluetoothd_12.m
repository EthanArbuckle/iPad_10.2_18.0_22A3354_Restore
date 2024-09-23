void sub_1006F42EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Failed to register the Device Manager callback with result %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F4350(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Failed to unregister the Device Manager callback with result %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F43B4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get address from handle %p", (uint8_t *)&v2, 0xCu);
  sub_1000726A0();
}

void sub_1006F4424(uint64_t a1, NSObject *a2)
{
  void **v3;
  void *__p[2];
  char v5;
  uint8_t buf[4];
  void **v7;

  sub_10006887C(a1, __p);
  if (v5 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  *(_DWORD *)buf = 136446210;
  v7 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Cannot hash UUID of unexpected length (%{public}s)", buf, 0xCu);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_1006F44DC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "!fQueue";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006F4550(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "this != getRootDispatcher()";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006F45C4(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  dispatch_queue_get_label(a1);
  sub_100072880((void *)&_mh_execute_header, v1, v2, "Registering %s in Dispatcher Watchdog", v3, v4, v5, v6, 2u);
  sub_100072694();
}

void sub_1006F4634(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  dispatch_queue_get_label(a1);
  sub_100072880((void *)&_mh_execute_header, v1, v2, "Unregistering %s in Dispatcher Watchdog", v3, v4, v5, v6, 2u);
  sub_100072694();
}

void sub_1006F46A4(char *a1, _QWORD *a2, NSObject *a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;

  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136315138;
  v5 = v3;
  sub_1002B54DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_1006F4720(uint8_t *a1, dispatch_queue_t queue, const char **a3, NSObject *a4)
{
  const char *label;

  label = dispatch_queue_get_label(queue);
  *(_DWORD *)a1 = 136315138;
  *a3 = label;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "%s", a1, 0xCu);
}

void sub_1006F4788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, " Stuck Queues ", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F47B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Bluetoothd is stuck. \n Registered Queues ", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F47E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 40));
  sub_100072880((void *)&_mh_execute_header, v1, v2, "Giving task to %s", v3, v4, v5, v6, 2u);
  sub_100072694();
}

void sub_1006F4854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Checking on the Tasks", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4880()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Clearing All Tasks", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F48AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Too many registered services", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F48D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not update SDP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not update EIR", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid address during an AFH update.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F495C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid handle during an AFH update.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4988()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set AFH map.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F49B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to start HCI tracing (already in progress ?)", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F49E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "BT not powered ON", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4A0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to stop HCI tracing (already in progress ?)", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4A38(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Sandbox extension consume failed with error: %lld", (uint8_t *)&v2, 0xCu);
}

void sub_1006F4AAC(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ABC Snapshot failed with code %lld and reason: %s", buf, 0x16u);
}

void sub_1006F4B00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Clean power off failed - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4B60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Stack startup failed - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4BC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Stack shutdown failed - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4C20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Power reset failed - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4C80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Stack halt failed - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F4CE0(char a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67240192;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "SystemHealth post component status: %{public, BOOL}d", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_1006F4D54(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 67240450;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SystemHealth post component status: %{public, BOOL}d Error: %@", (uint8_t *)v3, 0x12u);
}

void sub_1006F4DDC(unsigned __int16 a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Delete %d out %d entries from PowerAssertionHistory", (uint8_t *)v3, 0xEu);
}

void sub_1006F4E64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100482CCC(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v1, v2, "Failed to start \"%{public}s\" profile - no service is attached", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F4ECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1003CD7D8();
  sub_100482CCC(v0);
  sub_10010B380();
  sub_1000726FC((void *)&_mh_execute_header, v1, v2, "Failed to start \"%{public}s\" profile - profile failed registration with result %d", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F4F34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1003CD7D8();
  sub_100482CCC(v0);
  sub_10010B380();
  sub_1000726FC((void *)&_mh_execute_header, v1, v2, "Failed to start \"%{public}s\" profile - profile failed initialization with result %d", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F4F9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100482CCC(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v1, v2, "Failed to start \"%{public}s\" profile - profile is not stopped", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F5004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1003CD7D8();
  sub_100482CCC(v0);
  sub_10010B380();
  sub_1000726FC((void *)&_mh_execute_header, v1, v2, "Can't cleanup \"%{public}s\" profile - failed to clean up with result %d", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F506C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1003CD7D8();
  sub_100482CCC(v0);
  sub_10010B380();
  sub_1000726FC((void *)&_mh_execute_header, v1, v2, "Can't deregister \"%{public}s\" profile - failed to deregister with result %d", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F50D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100482CCC(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v1, v2, "\"%{public}s\" profile is already stopped", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F513C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;

  sub_1003CD7D8();
  sub_100482CCC(v1);
  sub_1000EEFE4();
  v4 = 2082;
  v5 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "\"%{public}s\" profile rejecting incoming connection as %{public}s", v3, 0x16u);
  sub_100072694();
}

void sub_1006F51D8(unsigned int a1, uint64_t a2, int a3, NSObject *a4)
{
  const char *v7;

  v7 = sub_1004809B4(a1);
  *(_DWORD *)a2 = 136446466;
  *(_QWORD *)(a2 + 4) = v7;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "\"%{public}s\" profile rejecting incoming connection as it would exceed the maximum number of connections (%d)", (uint8_t *)a2, 0x12u);
}

void sub_1006F5248(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100482CCC(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v1, v2, "\"%{public}s\" profile rejecting incoming connection as Bluetooth power is not on", v3, v4, v5, v6, v7);
  sub_100072694();
}

void sub_1006F52B0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "fDevicesMap.find(device) == fDevicesMap.end()";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006F5324(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "maxNumberOfConnections() <= 1";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006F5398(unsigned int *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_1004809B4(*a1);
  sub_1000EEFE4();
  sub_1002B54DC((void *)&_mh_execute_header, a2, v3, "Can not be connecting/connected to \"%{public}s\" profile at the same time", v4);
  sub_100072694();
}

void sub_1006F5410(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Gatt connected with error %{bluetooth:OI_STATUS}u", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_1006F5480(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Gatt device %{public}@ connected over classic when it should have be rejected", (uint8_t *)&v2, 0xCu);
}

void sub_1006F54F4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "GATT disconnected with handle that's not tracked", v1, 2u);
  sub_10007266C();
}

void sub_1006F5530(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "GATT device ready with handle that's not tracked", v1, 2u);
  sub_10007266C();
}

void sub_1006F556C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Gatt device connected with error %{bluetooth:OI_STATUS}u", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_1006F55DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register stack callbacks with %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F563C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_100072750((void *)&_mh_execute_header, v0, v1, "SDP query not allowed at this time", v2);
  sub_10007266C();
}

void sub_1006F566C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_100072750((void *)&_mh_execute_header, v0, v1, "NULL device -- aborting SDP", v2);
  sub_10007266C();
}

void sub_1006F569C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006F570C(int a1, NSObject *a2)
{
  void **v4;
  void *__p[2];
  char v6;
  uint8_t buf[4];
  void **v8;
  __int16 v9;
  int v10;

  sub_10043E5F8(*(_QWORD *)qword_100992C80, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  *(_DWORD *)buf = 136446466;
  v8 = v4;
  v9 = 1024;
  v10 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SDP connection to device %{public}s failed with result %{bluetooth:OI_STATUS}u", buf, 0x12u);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_1006F57E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Service search request failed %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5844()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "SDP Service database state search failed with %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F58A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Response returned status = %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Service database state response error with status %{bluetooth:OI_STATUS}u, need to disconnect", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5964(unsigned int a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;

  v4 = 136315138;
  v5 = sub_100486140(a1);
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Invalid SDP state: %s", (uint8_t *)&v4);
}

void sub_1006F59E4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_100072750((void *)&_mh_execute_header, v0, v1, "Attribute search didn't return a list", v2);
  sub_10007266C();
}

void sub_1006F5A14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006F5A84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error while executing DID %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5AE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to issue DID service search with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5B44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Attribute request failed with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5BA4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "AttributeValue wasn't a OI_DATAELEM_UINT, skipping", v3);
}

void sub_1006F5BD0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "AttributeValue inside OI_ATTRID_BluetoothProfileDescriptorList wasn't a OI_DATAELEM_SEQ, skipping", v3);
}

void sub_1006F5BFC(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "AttributeValue wasn't a OI_DATAELEM_SEQ, skipping", v3);
}

void sub_1006F5C28(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "AttributeID wasn't a UINT, skipping", v3);
}

void sub_1006F5C54()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_100072750((void *)&_mh_execute_header, v0, v1, "Service Attribute response received on already freed SDP client", v2);
  sub_10007266C();
}

void sub_1006F5C84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Service attribute response error with status %{bluetooth:OI_STATUS}u, need to disconnect", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5CE4(unsigned int a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;

  if (a1 > 0xA)
    v3 = "unknown sdp state";
  else
    v3 = off_100931138[a1];
  v4 = 136315138;
  v5 = v3;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Invalid state while trying to update RFCOMM channel state %s", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_1006F5D6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Service Search+Attribute response error with status %{bluetooth:OI_STATUS}u, need to disconnect", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F5DCC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;

  v2 = 141558531;
  v3 = 1752392040;
  v4 = 1041;
  v5 = 6;
  v6 = 2097;
  v7 = a1 + 44;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Device for addr %{private,bluetooth:BD_ADDR,mask.hash}.6P not found", (uint8_t *)&v2, 0x1Cu);
}

void sub_1006F5E68(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "SDP query complete on an invalid device!", v1, 2u);
}

void sub_1006F5EA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1004903BC(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "%{public}s is already started", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F5F10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1004903BC(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "%{public}s is already stopped", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F5F78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006F5FE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1004903BC(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "%{public}s is not started", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6050()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1004903BC(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "%{public}s - profile was null", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F60B8(char *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  char *v5;
  _QWORD *v6;

  v5 = *(char **)a1;
  if (a1[23] >= 0)
    v5 = a1;
  v6 = (_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 31) < 0)
    v6 = (_QWORD *)*v6;
  *(_DWORD *)buf = 136446466;
  *(_QWORD *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2082;
  *(_QWORD *)(buf + 14) = v6;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device %{public}s is no longer authorized for service %{public}s - disconnecting", buf, 0x16u);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_1006F6148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentCreateMsg sessionID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F61A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000726A8((void *)&_mh_execute_header, a2, a3, "BTPairingMsgHandler::handleBTPairingAgentDestroyMsg sessionID:%llx", a5, a6, a7, a8, 0);
  sub_1000726A0();
}

void sub_1006F6210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentStartMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6270()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentStopMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F62D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentCancelPairingMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6330()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentSetPincodeMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6390()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentAcceptSSPMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F63F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentDeletePairedDeviceMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6450()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentSetIOCapabilityMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F64B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentClearOOBDataForDeviceMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentSetOOBDataForDeviceMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6570()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Incorrect Buffer Length for r256", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F659C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Incorrect Buffer Length for c256", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F65C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Incorrect Buffer Length for r192", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F65F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Incorrect Buffer Length for c192", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6620()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTPairingMsgHandler::handleBTPairingAgentGetLocalOOBDataMsg agentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6680(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Still waiting for %lu services to shut down", (uint8_t *)&v4);
}

void sub_1006F66F0(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "Service event device handle is NULL", a1);
}

void sub_1006F6724()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "Fast connect ACL failed for device with %{public}s error %d", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F6768(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100072750((void *)&_mh_execute_header, a1, a3, "Bluetooth power not ON - shouldn't be trying to connect", v3);
  sub_10007266C();
}

void sub_1006F679C(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t *v4;

  if (*((char *)a1 + 23) >= 0)
    v4 = a1;
  else
    v4 = (uint64_t *)*a1;
  *(_DWORD *)a2 = 136446210;
  *(_QWORD *)(a2 + 4) = v4;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Device %{public}s has empty UUID", (uint8_t *)a2);
  if (*((char *)a1 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F67FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Reconnection failed with result %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F6860(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "result %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F68C4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100072750((void *)&_mh_execute_header, a1, a3, "Service Manager is already stalled.", v3);
  sub_10007266C();
}

void sub_1006F68F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "PFC to device %{public}s failed with %d", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F693C(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136446210;
  v2 = "device != NULL";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", (uint8_t *)&v1, 0xCu);
}

void sub_1006F69BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "LE disconnect returned %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F6A20(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100072750((void *)&_mh_execute_header, a1, a3, "CTKD le device connected, but could not find classic device in device manager", v3);
  sub_10007266C();
}

void sub_1006F6A54(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_10043E5F8(a1, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136446210;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "fastConnectProcessNextConnection for device %{public}s", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_1006F6AFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "L2CAP Packet Aggregation is overriden by defaults (=%s)", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F6B78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_DI_Register failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6BD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register the command disallowed event callback with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6C38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register the hardware error callback with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6C98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to read the local address with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6CF8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Overriding private address rotation interval to %d seconds", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F6D60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to initialize the stack wrapper with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "enableBTSpecAdvertisingSets cannot be false if enableExtendedAdvertising is true, overriding.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6DEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Disabling Secure Connections", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6E18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "LMP Routing is disabled", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Disabling Write COD WAR", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6E70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Disabling Connection Update WAR", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6E9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing Phy to 1Mpbs", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6EC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_DEVMGR_WriteStaticSettings failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6F28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "DI dergistration failed with %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6F88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "StackManager state currently in flux - not ready to start", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6FB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to Turn off the antenna switch VSE", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F6FE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "QoS Config Supported", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F700C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "QoS Config Not Supported", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7038()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Core Stack initialization failed!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7064()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Unable to send sleep mode parameters to host controller", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7090()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Unable to send calibration data to host controller", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F70BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Unable to copy calibration data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F70E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Unable to send regulatory data to host controller", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7114()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Unable to copy regulatory data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Ignoring connectability change request as stack is not %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F71B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Transport hard reset failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F71E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "StackManager state currently in flux - not ready to halt", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, " OI_HCI_Reset callback failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7270()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send HCIReset command with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F72D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Ignoring discoverability change request as stack is not %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F734C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stack is not ready", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7378()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1004ABCA0();
  sub_1002A827C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to make local device %s with result %{bluetooth:OI_STATUS}u", v1);
  sub_1000726A0();
}

void sub_1006F73F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cancelling discoverability change event as stack is not running", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7420()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Failed to set local device discoverability - current state is %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F749C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HCI_WriteEIR failed: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F74FC(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136446210;
  v2 = "constEirLen < OI_DHCI_EIR_DATA_LEN";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", (uint8_t *)&v1, 0xCu);
  sub_1000726A0();
}

void sub_1006F7578()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not set EIR : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F75D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Failed to set local device connectability - current state is %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F7654()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1004ABCA0();
  sub_1002A827C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to make local device %s with result %{bluetooth:OI_STATUS}u", v1);
  sub_1000726A0();
}

void sub_1006F76D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cancelling connectability change event as stack is not running", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F76FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100337DB4(a1, a2, 4.8752e-34);
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%{public}s completed with status %{bluetooth:OI_STATUS}u", v4, 0x12u);
}

void sub_1006F7748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_100337DB4(a1, a2, 4.8752e-34);
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v3;
  sub_1002A827C((void *)&_mh_execute_header, v5, v3, "%{public}s completed with status %{bluetooth:OI_STATUS}u", v4);
}

void sub_1006F7790(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "%{public}s timedout waiting for controller, however core-dump is in progress, wait for it to complete", v3);
}

void sub_1006F77C8(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "%{public}s timedout waiting for controller", v3);
}

void sub_1006F7800()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unable to find fail safe calibration file", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F782C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Calibration/Regulatory VSC error result of %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F788C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "StackManager Cannot set Spatial Mode with empty Bundle ID", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F78B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "BundleID does not exist, return default", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F78E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "BundleID exist, pair dict invalid", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7910()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "BundleID mode exist, no headtrack", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F793C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot get Spatial Mode with empty Bundle ID, return default value", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7968()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to change local name with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F79C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "readRSSI return status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7A28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Issuing readRSSI failed with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7A88()
{
  uint64_t v0;
  os_log_t v1;

  sub_1004ABC78();
  sub_100416988((void *)&_mh_execute_header, v0, v1, "Set disconnection timeout override for %{bluetooth:BD_ADDR}.6P failed with %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_1006F7AE8()
{
  uint64_t v0;
  os_log_t v1;

  sub_1004ABC78();
  sub_100416988((void *)&_mh_execute_header, v0, v1, "Set disable roleswitch for single connection failed for %{bluetooth:BD_ADDR}.6P failed with %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_1006F7B48()
{
  uint64_t v0;
  os_log_t v1;

  sub_1004ABC78();
  sub_100416988((void *)&_mh_execute_header, v0, v1, "Set accept roleswitch for single connection failed for %{bluetooth:BD_ADDR}.6P failed with %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_1006F7BA8()
{
  uint64_t v0;
  os_log_t v1;

  sub_1004ABC78();
  sub_100416988((void *)&_mh_execute_header, v0, v1, "Disabling roleswitch for %{bluetooth:BD_ADDR}.6P failed with %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_1006F7C08()
{
  uint64_t v0;
  os_log_t v1;

  sub_1004ABC78();
  sub_100416988((void *)&_mh_execute_header, v0, v1, "Invoking reduced QoS Latency for %{bluetooth:BD_ADDR}.6P failed with %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_1006F7C68()
{
  uint64_t v0;
  os_log_t v1;

  sub_1004ABC78();
  sub_100416988((void *)&_mh_execute_header, v0, v1, "Setting extended LSTO for %{bluetooth:BD_ADDR}.6P failed with %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_1006F7CC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HCI_EnableDeviceUnderTestMode callback failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7D28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to enable DUT mode with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7D88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HCI_SetEventFilter callback failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7DE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set event filter with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7E48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HCICMD_WriteScanEnable callback failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7EA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to enable LE TX Test mode with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7F08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "LE Test is already running.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7F34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "LE Test is not running.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7F60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to stop LE Test mode with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F7FC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring error from OI_DEVMGR_WriteStaticSettings: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_DEVMGR_WriteStaticSettings callback failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to write local device EIR with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F80E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_SECMGR_RegisterSecurityDB failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_SECMGR_RegisterESE failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F81A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set local device class with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8200()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HCI_WriteEIR callback failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8260(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "devicePair.second";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", buf, 0xCu);
}

void sub_1006F82AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a2, a3, "Failed to create HID user device with properties: %@", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006F8310(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a2, a3, "Failed to create non-keyholed HID user device with properties: %@", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006F8374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Input report ID %u is not a large report", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F83D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Got lead report before completing previous frame. Discarding previous report", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F8404(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Got middle report but nothing in the buffer. Discarding report", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F8434(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Got tail report but nothing in the buffer. Discarding report", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F8464()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;

  sub_100097230();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "getReportWithKeyhole 0x%x worked but returned wrong length (%lu)", v2, 0x12u);
  sub_1000726A0();
}

void sub_1006F84E0()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;

  sub_100097230();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "getReportWithKeyhole 0x%x set to 0xFF failed: 0x%x", v2, 0xEu);
  sub_1000726A0();
}

void sub_1006F855C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "getReportWithKeyhole 0x%x missing report or reportLength", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F85BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "setReportWithKeyhole 0x%x missing report or reportLength", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8624()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to rewrite page timeout.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8650()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to write page timeout.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F867C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid scan state.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F86A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set page timeout.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F86DC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unhandled XPC message: %u", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_1006F874C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Ignoring XPC message as session is NULL", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F877C(uint64_t a1, NSObject *a2)
{
  unsigned int v2;
  const char *v3;
  int v4;
  const char *v5;

  v2 = *(_DWORD *)(a1 + 136) - 1;
  if (v2 > 9)
    v3 = "Unknown";
  else
    v3 = off_100932578[v2];
  v4 = 136446210;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ignoring XPC message as state is \"%{public}s\"", (uint8_t *)&v4, 0xCu);
}

void sub_1006F8818(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "XPC message with XPC_TYPE_ERROR ", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F8848(char *a1, unsigned __int16 a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  _QWORD *v11;

  v5 = (*(uint64_t (**)(char *, _QWORD))(*(_QWORD *)a1 + 56))(a1, a2);
  v7 = a1 + 56;
  if (a1[79] < 0)
    v7 = (_QWORD *)*v7;
  v8 = 136446466;
  v9 = v5;
  v10 = 2082;
  v11 = v7;
  sub_1004B1D94((void *)&_mh_execute_header, a3, v6, "Sending XPC message \"%{public}s\" to session \"%{public}s\"", (uint8_t *)&v8);
}

void sub_1006F88F4(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "type == GATT_ATT_TYPE_PRIMARY_SERVICE";
  sub_1004B5F64((void *)&_mh_execute_header, (int)a2, a3, "Assertion failed: %{public}s", a1);
}

void sub_1006F8934(unsigned __int16 **a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = **a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Found orphaned handle 0x%04x in handle map", (uint8_t *)v3, 8u);
}

void sub_1006F89B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_1004B5F64((void *)&_mh_execute_header, v7, v8, "Didn't have entry in handle map for service \"%{public}s\"", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F89F8(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "type == GATT_ATT_TYPE_INCLUDED_SERVICE";
  sub_1004B5F64((void *)&_mh_execute_header, (int)a2, a3, "Assertion failed: %{public}s", a1);
}

void sub_1006F8A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_1004B5F64((void *)&_mh_execute_header, v7, v8, "Didn't have entry in handle map for characteristic \"%{public}s\"", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Unable to find parent service for included service \"%{public}s\"!", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8AC8(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "type == GATT_ATT_TYPE_CHARACTERISTIC";
  sub_1004B5F64((void *)&_mh_execute_header, (int)a2, a3, "Assertion failed: %{public}s", a1);
}

void sub_1006F8B08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Unable to find parent service for characteristic \"%{public}s\"!", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Unable to find parent service for value \"%{public}s\"!", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Dropping value \"%{public}s\" as we couldn't find a parent characteristic", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8BE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_1004B5F64((void *)&_mh_execute_header, v7, v8, "Didn't have entry in handle map for descriptor \"%{public}s\"", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Unable to find parent service for descriptor \"%{public}s\"!", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Dropping descriptor \"%{public}s\" as we couldn't find a parent characteristic", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006F8CB8(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to find parent service for characteristic handle 0x%04x!", (uint8_t *)v2, 8u);
}

void sub_1006F8D30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "[BTVCBonjourEndpoint] No remote UUID found, cancelling connection", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8D5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "[BTVCBonjourEndpoint] No Server UUID header found in WS response", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8D88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "[BTVCBonjourEndpoint] WebSocket protocol not found in connection parameters", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8DB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "[BTVCBonjourEndpoint] cancel called on nil connection", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8DE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "[BTVCBonjourEndpoint] receiveNextMessage called on nil connection", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8E0C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to perform inquiry with result %{bluetooth:OI_STATUS}u", (uint8_t *)v2, 8u);
}

void sub_1006F8E80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create an outgoing classic conenction status state notification token", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8EAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Le Connection Scan state notification token", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8ED8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create a stream state notification token", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8F04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create a CBPairing notification token", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8F30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create a pairing notification token", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8F5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create a connection notification token", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8F88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create a power notification token", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8FB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "************** Unlock your phone, restart bluetoothd to try again", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F8FE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "************** Remove the EraseAllPairedAndCachedDevice setting, and restart bluetoothd to continue", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F900C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Error reading getScanStatsWithThreshold %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F9070(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Error reading readScanStatsWithThreshold %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F90D4(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to locate dirty byte in SDP record - format was invalid (type = %d, size = %d)", (uint8_t *)v3, 0xEu);
}

void sub_1006F9158(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100072750((void *)&_mh_execute_header, a1, a3, "Exceeded maximum amount of keys!", v3);
}

void sub_1006F9190(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "Found invalid handle - removing associated callbacks", a1);
}

void sub_1006F91C4(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136446210;
  v2 = "device != NULL";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", (uint8_t *)&v1, 0xCu);
}

void sub_1006F9244(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "(NULL)";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Had no object for the scan from %{public}s", buf, 0xCu);
}

void sub_1006F9290(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Unable to scan, device is in DUT mode", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F92C0(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;

  v1 = 136315394;
  v2 = "SCAN_CORE_PAGE_SCAN_TIMER_EXPIRED_EVENT";
  v3 = 2080;
  v4 = "SCAN_CORE_PAGE_SCAN_IDLE";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Received '%s' when Scan Core Page Scan state is %s.", (uint8_t *)&v1, 0x16u);
}

void sub_1006F9354(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "SetLocalDeviceConnectabilitySpeedScenario failed with status %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F93B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "GetCachedDeviceConnectabilitySpeedScenario failed with status %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F941C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "_pageScanConnectivityCB failed with status %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006F9480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create a nexus provider", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F94AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create kevent for read queue", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F94D8(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 134217984;
  v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "AudioSkywalk read loop is configured to an invalid audio interval (%llu). Defaulting to 22000us", (uint8_t *)&v1, 0xCu);
  sub_1000726A0();
}

void sub_1006F954C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No channelId for skywalk pipe", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9578()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1003D7FC4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%d bytes available skywalk slot %d", v1, 0xEu);
  sub_1000726A0();
}

void sub_1006F95EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unable to create os_channel", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9618()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to alloc a nexus provider", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9644(unsigned __int16 a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 136315394;
  v3 = "TransportWrite";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: can't find handler for opCode 0x%04X", (uint8_t *)&v2, 0x12u);
}

void sub_1006F96D0(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "TransportWrite";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: invalide buffer", (uint8_t *)&v1, 0xCu);
}

void sub_1006F9750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTDiscoveryMsgHandler::handleBTDiscoveryAgentCreateMsg sessionID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F97B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000726A8((void *)&_mh_execute_header, a2, a3, "BTDiscoveryMsgHandler::handleBTDiscoveryAgentDestroyMsg sessionID:%llx", a5, a6, a7, a8, 0);
  sub_1000726A0();
}

void sub_1006F9818()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTDiscoveryMsgHandler::handleBTDiscoveryAgentStartScanForAdvertizedDataMsg discvoveryAgentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F9878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTDiscoveryMsgHandler::handleBTDiscoveryAgentStopScanMsg discvoveryAgentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F98D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTLocalDeviceMsgHandler::handleBTLocalDeviceGetPairedDevicesMsg agent:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F9938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTDiscoveryMsgHandler::handleBTDiscoveryAgentAddKeyMsg discvoveryAgentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F9998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTDiscoveryMsgHandler::handleBTDiscoveryAgentRemoveKeyMsg discvoveryAgentID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006F99F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Impossible to register PAN ...", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9A24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to accept packet type filter request - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9A84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to accept multicast filter request - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9AE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to deregister PAN User", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9B10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not allocate buffer to store data.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9B3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error : could not add service record %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9B9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "PanUserProfile Connection failed with %d!\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9BFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "We could not accept the connection. Now What ??", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9C28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to bring the link up", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9C54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Connection failed %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9CB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not get handsfree device from handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9D18(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1004E8B48(a1, a2, 3.8521e-34);
  sub_1002A827C((void *)&_mh_execute_header, v2, (uint64_t)v2, "Received SCO data size %zu is less than %d bytes, drop the packet", v3);
}

void sub_1006F9D50(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;

  v2 = 134218240;
  v3 = a1;
  sub_1004E8B64();
  sub_1002A827C((void *)&_mh_execute_header, v1, (uint64_t)v1, "SCO Data size %zu is less than offset %d bytes, drop the packet", (uint8_t *)&v2);
  sub_1000726A0();
}

void sub_1006F9DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;

  sub_10016574C();
  v3 = 2;
  sub_1002A827C((void *)&_mh_execute_header, v0, v1, "Remaining SCO Data size %zu is less than %d bytes, drop the packet", v2);
  sub_1000726A0();
}

void sub_1006F9E2C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;

  v2 = 134218240;
  v3 = a1;
  sub_1004E8B64();
  sub_1002A827C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Remaining SCO data size %zu is less than packetSize plus header %d, drop the packet", (uint8_t *)&v2);
  sub_1000726A0();
}

void sub_1006F9E9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "SCO packet index overflow, drop the packet", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9EC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to find device state for HFP handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9F2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "uplink frame unknown chunk :%u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9F90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "uplink frame total voice chunk too large :%u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006F9FF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "uplink frame sensor chunk too large :%u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not get handsfree device state from handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA0B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8149e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Could not get handsfree device from '%s'", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FA100()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to reset audio session stats.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA12C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Enabling SCO Buffer Flush failed with %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA18C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "This device handle is already in use.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA1B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to send manual volume update message device is null", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA1E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send manual volume update message %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA244()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "ReadScoBuffer Failed %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA2A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Device state is NULL for handle %d but device is still being tracked!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA308()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Disabling SCO Buffer Flush failed with %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA368()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "DeregisterScoDataApplication failed with %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA3C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Can't find device state for handsfree handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA42C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to accept audio with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA48C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Trying to transition to HandsfreeAoS while already transitioning", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA4B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "getSignalStrength failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA4E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "getRegistrationStatus failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "getOperatorStatus failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA53C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "getCurrentCalls failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA568()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Handsfree AG vendor callback registration failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA5C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Handsfree AG registration failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Hands-Free Profile initialization failed: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA688()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "HandsfreeAOS deregistration failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA6E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Handsfree AG deregistration failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA748()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Could not find valid RFCOMM channel in SDP record of device %{public}s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FA790()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to connect HandsfreeAoS with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA7F0(int a1)
{
  uint64_t v1;
  os_log_t v2;
  uint64_t v3;

  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a1;
  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v1, v2, "Failed to connect handsfree profile on channel %d with result %{bluetooth:OI_STATUS}u", v3);
  sub_1000726A0();
}

void sub_1006FA858(unsigned __int16 a1)
{
  uint64_t v1;
  os_log_t v2;
  uint64_t v3;

  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a1;
  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v1, v2, "Failed to disconnect handsfree profile on handle %d with result %{bluetooth:OI_STATUS}u", v3);
  sub_1000726A0();
}

void sub_1006FA8C4(unsigned __int16 a1)
{
  uint64_t v1;
  os_log_t v2;
  uint64_t v3;

  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a1;
  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v1, v2, "Failed to disconnect Handsfree AoS on handle %d with result %{bluetooth:OI_STATUS}u", v3);
  sub_1000726A0();
}

void sub_1006FA930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "No device found to report handsfree disconnection result on handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA994()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unexpected event without a valid handle or a valid address... Event is %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FA9F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send extended result code - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FAA58(char a1)
{
  const char *v1;
  NSObject *v2;
  int v3;
  const char *v4;

  v1 = "accept";
  if ((a1 & 1) == 0)
    v1 = "deny";
  v3 = 136446466;
  v4 = v1;
  sub_1004E8B64();
  sub_1002A827C((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to %{public}s connection with result %{bluetooth:OI_STATUS}u", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FAAE0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Failed to connect to device %{public}s due to %{bluetooth:OI_STATUS}u", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FAB28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received SLC connect complete event for unknown device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FAB54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Received SLC connection failure event for device %{public}s with result %{bluetooth:OI_STATUS}u", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FAB9C(_DWORD *a1, int a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a1 = 136446466;
  sub_1004E8B74((uint64_t)a1, a2, (uint64_t)"NULL");
  sub_1002A827C((void *)&_mh_execute_header, v2, (uint64_t)v2, "Received handsfree disconnection event for device %{public}s with result %{bluetooth:OI_STATUS}u", v3);
}

void sub_1006FABE0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Received handsfree disconnection event for device %{public}s with result %{bluetooth:OI_STATUS}u", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FAC28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HandsfreeAG_SendInput failed %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FAC88(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *(_DWORD *)(a1 + 8);
  v2 = *(_DWORD *)(a1 + 12);
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received response error %{bluetooth:OI_STATUS}u while sending response %d - disconnecting immediately", (uint8_t *)v4, 0xEu);
  sub_1000726A0();
}

void sub_1006FAD08(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint8_t v5[14];
  int v6;

  v3 = a1;
  sub_1004CF258(a1, a1);
  sub_10016574C();
  v6 = v3;
  sub_1002A827C((void *)&_mh_execute_header, a2, v4, "Unsupported Handsfree AoS codec ID - %s (%d)", v5);
}

void sub_1006FAD90(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "!addr.isZero()";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FAE04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Received command from handle %d before the device was connected. Looks like the device is sending commands before SLC is complete....", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FAE68(_DWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  uint64_t v3;

  LODWORD(v3) = 67109376;
  HIDWORD(v3) = *a1;
  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v1, v2, "HandsfreeEvent processing for event %d failed with result code - %{bluetooth:OI_STATUS}u", v3);
  sub_1000726A0();
}

void sub_1006FAED4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "SCO audio disconnect failed with result code - %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FAF34(_DWORD *a1, int a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a1 = 136446466;
  sub_1004E8B74((uint64_t)a1, a2, (uint64_t)"NULL");
  sub_1002A827C((void *)&_mh_execute_header, v2, (uint64_t)v2, "Received audio connection failure event for device %{public}s with result %{bluetooth:OI_STATUS}u", v3);
}

void sub_1006FAF78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unable to find handsfree device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FAFA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Dial failed as no number was provided", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FAFD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send subscriber number with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send network operator with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB090(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;

  v2 = "disabled";
  if ((a1 & 1) != 0)
    v2 = "enabled";
  v3 = 136446210;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Device state is null, not setting voice command to %{public}s", (uint8_t *)&v3, 0xCu);
  sub_1000726A0();
}

void sub_1006FB118()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Received invalid HF indicator assigned number: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Audio is not incoming on this device.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB1A4(uint64_t a1, int a2)
{
  NSObject *v2;
  uint8_t *v3;

  *(_QWORD *)(sub_1003ED6D4(a1, a2, 1.5047e-36) + 10) = "NULL";
  sub_1002A827C((void *)&_mh_execute_header, v2, (uint64_t)v2, "Audio disconnection failed %{bluetooth:OI_STATUS}u - disconnecting device %{public}s", v3);
}

void sub_1006FB1E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_1002F7630(v1, v2, v3, 1.5047e-36);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Audio disconnection failed %{bluetooth:OI_STATUS}u - disconnecting device %{public}s", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FB230(uint64_t a1, int a2)
{
  NSObject *v2;
  uint8_t *v3;

  *(_QWORD *)(sub_1003ED6D4(a1, a2, 1.5047e-36) + 10) = "NULL";
  sub_1002A827C((void *)&_mh_execute_header, v2, (uint64_t)v2, "Audio Creation failed %{bluetooth:OI_STATUS}u - %{public}s", v3);
}

void sub_1006FB274()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_1002F7630(v1, v2, v3, 1.5047e-36);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Audio Creation failed %{bluetooth:OI_STATUS}u - %{public}s", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FB2BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not get bdaddr from handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB320()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to redial last call", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB34C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Memory dial index 0 is not a valid index", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not open memory dial AB", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB3A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Received invalid DTMF tone %c", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB404()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ringing just stopped - ignoring answer event and informing device call is gone", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB430()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring answer event as there are no ringing or waiting calls", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB45C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Received unknown handsfree event - %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB4BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to list current calls with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB51C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring release held calls event as we have no held calls", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Ignoring release held calls event as we are still in call setup state \"%{public}s\"", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FB590()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring release active calls event as there are no active or held calls", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB5BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring release active calls event as there are no outgoing calls", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB5E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring hold active calls event as there are no active or held calls", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB614()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring hold active calls event as there are is an outgoing call in progress", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB640()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring add held call event as there are no held calls", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB66C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Call transfer event not supported", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB698()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to release call - bad call index %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB6F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_1004E8B14(v1, v2, v3, 1.5047e-36);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Found invalid call in current calls at index %d (call: %s)", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FB740()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_1004E8B14(v1, v2, v3, 1.5047e-36);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Found invalid call in sent calls at index %d (call: %s)", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FB788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to conference call - bad call index %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB7E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Local BT Clk read error %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB848()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send codec selection command with error %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB8A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not get out of VC mode.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB8D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Can't reject incoming call as there are no ringing or waiting calls", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB900()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to update call indicators with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HandsfreeAG_SendCallWaitingWithName failed: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FB9C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HandsfreeAG_SendRingWithName failed: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBA20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_DEVMGR_UnsetScoParams failed: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBA80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_DEVMGR_SetScoParams failed: %{bluetooth:OI_STATUS}u -- failing back to sco defaults", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBAE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed register eSCO Data App: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBB40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Set ignore chup to %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBBA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid audio-device from HAL plugin", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBBD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Voice data available", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBBFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid device state to change volume", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBC28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not get handsfree device from handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBC8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Detected error from the plugin, HFP routing will have problems", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBCB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Can't setAudioCodec as device wasn't found", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBCE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Handling HAoS mix with other HFP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBD10()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Unknown sample rate selected for SCO - sampleRate:%d, stereoCodecID:%u", 67109376, v2);
  sub_1000726A0();
}

void sub_1006FBD78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unknown sample rate %d requested", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBDD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unknown codec id %d requested", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBE38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "initHFPFastConnectL2CAP error creating HFP RFCOMM Channel", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBE64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "composeHFPDescriptor error getting signaling L2CAP data for HandsfreeAoS, status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBEC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "composeHFPDescriptor error getting signaling L2CAP data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBEF0(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseHFPDescriptor L2CAP signal channel not found", a1);
}

void sub_1006FBF24(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseHFPDescriptor L2CAP signal channel not found for HandsfreeAoS", a1);
}

void sub_1006FBF58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "setAllowsAutoRoute find HFP device failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBF84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "setAudioRouteHidden find HFP device failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBFB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "setHijackAudioRoute unable to find HFP device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FBFDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "setSmartRouteMode unable to find HFP device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC008()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "setUserSelectedDeviceType unable to find HFP device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC034()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to find audio device for hfpHandle:%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC098(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Reached maximum attempts (%d) to establish HandsfreeAoS call", (uint8_t *)v1, 8u);
  sub_10007266C();
}

void sub_1006FC110(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v4 = qword_100999808;
  os_log_type_enabled((os_log_t)qword_100999808, OS_LOG_TYPE_FAULT);
  v6 = 134217984;
  v7 = 24;
  sub_1002B54DC((void *)&_mh_execute_header, v4, v5, "Could not allocate %lu bytes", (uint8_t *)&v6);
  *a2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
}

void sub_1006FC1C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send call status with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send call setup status with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC280()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No UMUserManager available, so disabling multi user mode", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC2AC()
{
  uint64_t v0;
  os_log_t v1;

  sub_10026A5B8();
  sub_1000727B8((void *)&_mh_execute_header, v0, v1, "[Inquiry] Unable to fetch cloud device: %@, Error: %@");
  sub_1000726A0();
}

void sub_1006FC30C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Couldn't retrieve public local address from device tree!", v1, 2u);
  sub_10007266C();
}

void sub_1006FC344()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed registration for MKB first unlock notification with error : %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC3A4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to read local device hostname - using default \"%s\"", (uint8_t *)a2);
}

void sub_1006FC3E0()
{
  os_log_t v0;
  uint8_t v1[8];

  sub_100097230();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Failed to generate DHK with result %{bluetooth:OI_STATUS}u", v1, 8u);
  sub_10007266C();
}

void sub_1006FC44C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a1, a3, "Cloudpairing: XPC server error: %@", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FC4BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cloudpairing got invalid args", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC4E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error generating pairing ID, cannot cloud pair right now", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Invalid RemoveCloudPairedDevice value: %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006FC574()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Invalid Device UUID value: %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006FC5D4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  _UNKNOWN **v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = &off_1009607F0;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "XPC Version Check failure, received version: %@, current version: %@", (uint8_t *)&v2, 0x16u);
  sub_1000726A0();
}

void sub_1006FC658(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "DeviceSupportInformationRecordsUpdated failed to convert address", v3);
}

void sub_1006FC684(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "DeviceSupportInformationRecordsUpdated Unknown device", v3);
}

void sub_1006FC6B0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "[MP] Cloud: Received invalid device address", v3);
}

void sub_1006FC6DC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Cloudpairing got invalid type: %s", (uint8_t *)a2);
}

void sub_1006FC718()
{
  uint64_t v0;
  os_log_t v1;

  sub_10026A5B8();
  sub_1000727B8((void *)&_mh_execute_header, v0, v1, "DeviceSupportInformationRecordsUpdated error retrieving cloudDevice %@: %@");
  sub_1000726A0();
}

void sub_1006FC778()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  sub_1000EEFE4();
  v3 = 2160;
  v4 = 1752392040;
  v5 = 2113;
  v6 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "CloudPairing: No XPC connection to send message: %@ - %{private, mask.hash}@", v2, 0x20u);
}

void sub_1006FC80C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed Registering cloudkit.xpc service", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_1004F92F8(a1, a2, a3, 7.2226e-34);
  sub_1004F9324((void *)&_mh_execute_header, "IDS device %{private, mask.hash}s is not associated with paired local device \"%@\"", v3, v4);
}

void sub_1006FC870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_1004F92F8(a1, a2, a3, 7.2226e-34);
  sub_1004F9324((void *)&_mh_execute_header, "IDS device %{private, mask.hash}s is associated with unpaired local device \"%@\"", v3, v4);
}

void sub_1006FC8A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_1004F92F8(a1, a2, a3, 7.2226e-34);
  sub_1004F9324((void *)&_mh_execute_header, "IDS device %{private, mask.hash}s is associated with unknown local device \"%@\"", v3, v4);
}

void sub_1006FC8E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "MUC: failed to get IRK for RSA", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC90C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to generate CSRK with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC96C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to generate LTK with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FC9CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to generate DIV with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCA2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Cloud pairing key generation status %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006FCA94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Key generation failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCAC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Keys not available or generated", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCAEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "MUC: Could not generated IRK : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCB4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "MUC - RSA is nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCB78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "MUC - NO IRK for RSA: %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006FCBD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "MUC - multiple adv instances are not initialized yet", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCC04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid SmartChargeStatusHasChangedFromNotification", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCC30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Unable to find a Device matching addr format %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006FCC90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Unknown PowerUISmartChargingState %lu update from cloud", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1006FCCF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Biome GATTSession not available", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCD1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Biome DeviceBluetoothPowerEnabled not available", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCD48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "RegulatoryDomain RDEstimate not available", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCD74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "AppProtection Framework not available", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCDA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Must specify both a key and a value", a5, a6, a7, a8, 0);
}

void sub_1006FCDD4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[BTVCLinkScanner] Update payload filter data to %@, mask %@\n", (uint8_t *)&v3, 0x16u);
}

void sub_1006FCE58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "[BTVCLinkScanner] Invalidated\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCE84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "[BTVCLinkScanner] Invalidating\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCEB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "[BTVCLinkScanner] Starting scan, need stop first\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCEDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "[BTVCLinkScanner] Starting scan\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCF08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "HID host registration failed - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCF68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "HID host deregistration failed - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FCFC8(uint64_t a1, int a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446466;
  *(_QWORD *)(a1 + 4) = "NULL";
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a2;
  sub_1002A827C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unplugging virtual cable to device %{public}s failed with status %d", (uint8_t *)a1);
}

void sub_1006FD018()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Unplugging virtual cable to device %{public}s failed with status %d", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FD060(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FD0D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to connect - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD130()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to disconnect - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD190()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC0A0();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Did not find session for handle 0x%x", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD1F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Sent queue failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Set report failed due to hidperf is running", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD27C()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;

  sub_1002BC094();
  v3 = 2082;
  v4 = v0;
  sub_1002A827C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Received SUSPEND for untracked handle %d with reason %{public}s, Returning.", v2);
  sub_1000726A0();
}

void sub_1006FD314()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC0A0();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Device hasn't started can not suspend for handle 0x%x", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to suspend device with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD3D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Received EXIT_SUSPEND for untracked handle %d. Returning.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD438()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC0A0();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Device hasn't started can not exit suspend for handle 0x%x", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to unsuspend device with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD4F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "System can sleep but screen is still on, don't suspend HID", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD524()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Sending pending control channel operation 0x%x failed with %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FD588()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set HID protocol with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD5E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FD658()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "HID connection on handle 0x%x does not map to a valid device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD6BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136446210;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Handshake failed to complete on device %{public}s, disconnecting", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

uint64_t sub_1006FD70C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result)
    operator delete[]();
  return result;
}

void sub_1006FD738(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FD7A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to change connection packet type with %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD808()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to enable HID Latency Statistics for connection handle 0x%02x with result %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FD86C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Session is no longer valid, no input device to start", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD898()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Force sniff rate failed with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD8F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC0A0();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to disable HID Latency Statistics for connection handle 0x%02x", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FD958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136446210;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Failed to lookup HID Host handle for device %{public}s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FD9A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Failed to perform handshake with result %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1006FDA14()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "SDP failed to complete on device %{public}s with result %d", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FDA5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set protocol with error %{bluetooth:OI_STATUS}u - disconnecting", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "HID device handshake was unsuccessful", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDAE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "HID handshake failed with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDB48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "modeChangedInd -- handle without session", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDB74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Mode check timer fired, session is no longer valid", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDBA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Handle missing, device was cleaned up", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDBCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Get report failed with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDC2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Get report queue failed due to zero session count", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDC58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Get report channel busy - report queued", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDC84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Set report failed with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDCE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Report queue failed due to zero session count", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDD10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Set report channel busy - report queued", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDD3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Send Hid Control failed with status %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDD9C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a2, a3, "Failed to exclude advertisement database from backup with error: %@", a5, a6, a7, a8, 2u);
}

void sub_1006FDE04(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a2, a3, "Failed to create directory for advertisement database with error: %@", a5, a6, a7, a8, 2u);
}

void sub_1006FDE6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "failed to purge database clone", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDE98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "xpc activity triggered database clone purge failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDEC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "xpc activity triggered database purge failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDEF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "failed to clone database", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDF1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "failed to create directory for database clone", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FDF48(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "rdar://problem/66432832 attempting to cache descriptorSize: %u", (uint8_t *)v2, 8u);
}

void sub_1006FDFBC(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100262274(a1, a2);
  sub_100072894((void *)&_mh_execute_header, v2, v3, "Invalid format", v4);
}

void sub_1006FDFE4(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100262274(a1, a2);
  sub_100072894((void *)&_mh_execute_header, v2, v3, "This is not a report descriptor", v4);
}

void sub_1006FE00C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "reading root keys failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE038(_QWORD *a1, char a2, NSObject *a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;

  v3 = (_QWORD *)*a1;
  if ((a2 & 1) == 0)
    v3 = a1;
  v4 = 136446210;
  v5 = v3;
  sub_100265C78((void *)&_mh_execute_header, a2, a3, "Session attach for \"%{public}s\" failed", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_1006FE0AC()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Session attached twice", v1, 2u);
  sub_10007266C();
}

void sub_1006FE0E4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 136446210;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Ran out of handles for session \"%{public}s\"!", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FE14C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SessionManager not initialized!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid session handle", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE1A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No session found", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE1D0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(_QWORD *)(a1 + 4) = "(NULL)";
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Ran out of handles for session %{public}s!", (uint8_t *)a1);
}

void sub_1006FE210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Ran out of handles for session %{public}s!", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FE258()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Handle was NULL", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE284(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Trying to add BTHandle : %p which is same as our LocalDevice handle %p", (uint8_t *)&v2, 0x16u);
  sub_1000726A0();
}

void sub_1006FE300()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Session \"%{public}s\" already exists in SessionProcessIdentifierMap", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FE348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Session \"%{public}s\" is not present in SessionProcessIdentifierMap", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FE390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Session \"%{public}s\" already exists in SessionManagedConfigOverrideMap", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1006FE3D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No mask saved for handle", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE404()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stack not started, cannot register for role change callbacks", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE430()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Device orientation unknown", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE45C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_10052CF60((void *)&_mh_execute_header, v0, v1, "Link Adaptive AAC Configs already loaded", v2);
  sub_10007266C();
}

void sub_1006FE48C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Registering for legacyModeChangeEvent: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE4EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Unregistering for legacyModeChangeEvent: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE54C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid AAC Config", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE578()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid Device in AudioLinkManager Devices", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE5A4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  __int128 v3;

  sub_1002BC094();
  LOWORD(v3) = 2048;
  *(_QWORD *)((char *)&v3 + 2) = v0;
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Fail to load Bitrate Configs, out of range (%u of %lu).", v2, (_QWORD)v3);
  sub_1000726A0();
}

void sub_1006FE614()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to configure interlaced page scan", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE640()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to configure interlaced inquiry scan", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE66C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stack hasn't started -- not starting HFP metrics", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE698()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Please file a radar we are failing to submit metric for HFP audio streaming", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE6C4(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_10043F918(a1, (uint64_t)__p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136315138;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device %s, does not exist in AudioLinkManagerDevices something went wrong", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_1006FE770()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "deleting the fA2DPAoSInfoMetric", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE79C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "deleting the fA2DPPacketFlushInfoMetric", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE7C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Please file a radar we are failing to submit metric for A2DP audio streaming", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FE7F4(unint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v4[8];

  sub_1005214B0(a2, *a1);
  sub_1002BC094();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Low Latency Game: redundantant jitter change, mode: %d", v4, 8u);
  sub_1000726A0();
}

void sub_1006FE884(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Failed to create filepath at %@ to capture tailspin", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FE8EC(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to open file descriptor to capture tailspin: %@", (uint8_t *)a2);

}

void sub_1006FE938(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Trying to save tailspin %@", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FE9A0()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_10052CF4C();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "AudioSkywalkReadLoop overwait %llu ms occurred on device with handle %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FEA0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Report Audio Creation fail %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Audio Timesync: Timesync unregister failed ", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEA9C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Audio Timesync: Remote device no longer available: %llx ", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_1006FEB08(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10052CF60((void *)&_mh_execute_header, a3, (uint64_t)a3, "A2DP Link Adaptive invalid", a1);
}

void sub_1006FEB3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to enable beamforming VSE logging with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEB9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to disable beamforming VSE logging with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEBFC()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  sub_10052CF4C();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to %s Global MRC control with error %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FEC78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to enable beamforming MRC control VSE logging with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FECD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to disable beamforming MRC control VSE logging with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FED38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set default diversity antenna to %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FED9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set diversity follow mode to %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEDFC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10052CF30();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to set diversity mode %d on handle %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FEE5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set diversity antenna pair to (0, %d)", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEEBC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_1002BC094();
  LOWORD(v3) = 1024;
  HIWORD(v3) = v0;
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Device orientation set to %d, but failed to set diversity antenna to %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FEF2C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10052CF30();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to set diversity log mode %d on handle %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FEF8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "AudioLinkManager Cannot set Spatial Mode with empty Bundle ID", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEFB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "BundleID does not exist, return default", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FEFE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "BundleID exist, pair dict invalid", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF010(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FF080(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_100537A64(a1, a2);
  *v3 = 138412290;
  *v2 = v4;
  sub_100184790((void *)&_mh_execute_header, v5, v6, "Link state is stalled for device \"%@\"");

  sub_1000FB314();
}

void sub_1006FF0C8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_100537A64(a1, a2);
  *v3 = 138412290;
  *v2 = v4;
  sub_100184790((void *)&_mh_execute_header, v5, v6, "Protocol state is stalled for device \"%@\"");

  sub_1000FB314();
}

void sub_1006FF110(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FF180(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "LEA Start Stream failed %{bluetooth:OI_STATUS}u", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_1006FF1F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FF260(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;

  v3 = sub_100537A88(a1);
  v5 = 141558275;
  v6 = 1752392040;
  v7 = 2113;
  v8 = v3;
  sub_10026A55C((void *)&_mh_execute_header, a2, v4, "MFi authentication timed out for device %{private, mask.hash}@", (uint8_t *)&v5);

  sub_100072694();
}

void sub_1006FF2F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No codec found from the table", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF320()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Detected error from the plugin, LEA routing will have problems", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF34C(unsigned __int8 a1, unsigned __int16 a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Sending 'error (%u/%u)'", (uint8_t *)v3, 0xEu);
  sub_1000726A0();
}

void sub_1006FF3D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No LEA Audio context", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF400()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "NO receive buffer", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF42C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "LEA RX Audio: %lubytes received", (uint8_t *)&v2, 0xCu);
  sub_1000726A0();
}

void sub_1006FF49C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Invalid audio playload of size %lu received, Trigger PLC", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FF504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid incoming audio buffer", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF530(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = sub_100537A88(a1);
  v5 = 138412290;
  v6 = v3;
  sub_100072744((void *)&_mh_execute_header, a2, v4, "Device \"%@\" supports neither output nor input", (uint8_t *)&v5);

  sub_100072694();
}

void sub_1006FF5B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not determine LEA max packet size", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF5DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Capabilities mismatch", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF608()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring MFi Auth for default writes", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF634()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Too many LEA sessions", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF660(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100537A78((void *)&_mh_execute_header, a2, a3, "handle(0x%2X):event(%d), TxTotal(%d), TxR(%u), TxF(%u), RxTotal(%d), RxE(%u), RxM(%u), rssi(%d)", a5, a6, a7, a8, 0);
}

void sub_1006FF730(uint64_t a1, NSObject *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100537A78((void *)&_mh_execute_header, a2, (uint64_t)a3, "handle(0x%2X):event(%d), TxTotal(%d), TxR(%u), TxF(%u), RxTotal(%d), RxE(%u), RxM(%u), rssi(%d)", a5, a6, a7, a8, 0);
  *a3 = qword_1009999A0;
}

void sub_1006FF81C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring LEA Easy Pairing due to feature bit", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FF848(void *a1, char *a2, uint64_t a3, NSObject *a4)
{
  char *v6;

  if (a2[23] >= 0)
    v6 = a2;
  else
    v6 = *(char **)a2;
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = v6;
  sub_10026A55C((void *)&_mh_execute_header, a4, a3, "Magnet link disconnect from \"%{public}@\" does not match connected magnet \"%s\"", (uint8_t *)a3);
  if (a2[23] < 0)
    operator delete(*(void **)a2);

}

void sub_1006FF8CC(_xpc_connection_s *a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = xpc_connection_get_pid(a1);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received connection to BTAudio.xpc from unknown client pid %d, ignoring", (uint8_t *)v3, 8u);
  sub_1000726A0();
}

void sub_1006FF954(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a2, a3, "Unexpected error: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FF9B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a2, a3, "XPC server connection error: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1006FFA1C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "(fCodec->bitsPerSample == 4) || (fCodec->bitsPerSample == 6)";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FFA90(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "sample2Index < fCodec->bytesPerFrame";
  sub_1002B54DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "Assertion failed: %{public}s", a1);
}

void sub_1006FFAD4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "fAudioBuffer.getFillLevel() == fCodec->bytesPerFrame";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FFB48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "AudioBuffer wasn't flushed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FFB74(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Insufficient Buffer Length: %d", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_1006FFBE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000726A8((void *)&_mh_execute_header, a2, a3, "Get %zubytes of audio data", a5, a6, a7, a8, 0);
  sub_1000726A0();
}

void sub_1006FFC4C()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_10053940C();
  sub_1000728A4((void *)&_mh_execute_header, v0, v1, "bytesFilled: %zu, bytesPerFrame: %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FFCB0()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_10053940C();
  sub_1000728A4((void *)&_mh_execute_header, v0, v1, "bytesRead: %zu, bytesPerFrame: %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FFD14()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  sub_100539424();
  sub_1000728A4((void *)&_mh_execute_header, v0, v1, "bytesPerFrame(%u) is not multiples of bytesToFill(%lu)", v2, v3);
  sub_1000726A0();
}

void sub_1006FFD74(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "status != OI_STATUS_WRITE_IN_PROGRESS";
  sub_1002B54DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "Assertion failed: %{public}s", a1);
}

void sub_1006FFDB8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_100072750((void *)&_mh_execute_header, v0, v1, "Legacy audio queue full", v2);
  sub_10007266C();
}

void sub_1006FFDE8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "fAudioBuffer.getSentLevel() == 0";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FFE5C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "numPacketsForFrameMinus1 <= 0x03";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1006FFED0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "bytesRead: Zero", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1006FFEFC()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_10053940C();
  sub_1000728A4((void *)&_mh_execute_header, v0, v1, "bytesFilled: %zu, bytesPerFrame: %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FFF64()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_10053940C();
  sub_1000728A4((void *)&_mh_execute_header, v0, v1, "bytesRead: %zu, bytesPerFrame: %d", v2, v3);
  sub_1000726A0();
}

void sub_1006FFFCC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000726A8((void *)&_mh_execute_header, a2, a3, "Got %zubytes of audio data", a5, a6, a7, a8, 0);
  sub_1000726A0();
}

void sub_100700034(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "fAudioBuffer.getFillLevel() == fCodec->bytesPerFrame * 2";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1007000A8(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "Can't send invalid audio buffers", a1);
}

void sub_1007000DC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "numPacketsForFrameMinus1: %d", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_10070014C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 232);
  if (v2)
  {
    *(_QWORD *)(a1 + 240) = v2;
    operator delete(v2);
  }
}

void sub_100700170()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LE Unknown CB MsgID %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007001D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "fSession is null", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007001FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Failed to refreshPlistLimitations for %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070025C(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = 20161219;
  sub_1002A8234((void *)&_mh_execute_header, a2, a3, "CoreBluetooth version %d differs from bluetoothd version %d", (uint8_t *)v3);
  sub_1000726A0();
}

void sub_1007002D8(char *a1, _QWORD *a2, NSObject *a3)
{
  int v3;
  _QWORD *v4;

  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136446210;
  v4 = a2;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Duplicate XPC check-in from session \"%{public}s\"", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_100700350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Unknown debug command with ID %llu", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007003B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid debug command", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007003DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Unknown CBDebugCommandDeviceAccessNotification debug command with ID %llu", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070043C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "CBDebugCommandResolveLERandomAddressWithIRK ignoring bad inputs, returning 0", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700468()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "CBDebugCommandDisableHostWakeupOnLinkDrop Invalid UUID", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot accept out-of-band pairing request without data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007004C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot accept passkey pairing request without passkey", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007004EC(uint64_t a1, int a2, NSObject *a3)
{
  _QWORD *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  __int16 v10;
  __CFString *v11;

  v4 = (_QWORD *)(a1 + 56);
  if (*(char *)(a1 + 79) < 0)
    v4 = (_QWORD *)*v4;
  v5 = CFSTR("CBBTErrorReasonAdvertisingWatchNotFoundInternal");
  if (!a2)
    v5 = CFSTR("CBBTErrorReasonUnknownInternal");
  v6 = v5;
  v8 = 136446466;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  sub_10026A55C((void *)&_mh_execute_header, a3, v7, "BT Problem reported. Session:\"%{public}s\" reason:%@", (uint8_t *)&v8);

}

void sub_1007005B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "key cannot be empty", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007005E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;

  v2 = 138412546;
  v3 = a1;
  sub_100566050();
  sub_10026A55C((void *)&_mh_execute_header, v1, (uint64_t)v1, "unknown resource key:%@ subkey:%@", (uint8_t *)&v2);
  sub_1000726A0();
}

void sub_100700650()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Retrieving resources is a restricted SPI", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070067C(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_1000340DC(*(_QWORD *)(a1 + 128), (uint64_t)__p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136315138;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "session %s is not allowed to queryBluetoothStatus", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_10070072C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "kCBOptionStateDetailList cannot be empty", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700758()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "kCBOptionStateDetailList no valid arguments", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to start advertising with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007007E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Start periodic advertising is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700810()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to start/stop periodic advertising with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700870()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stop periodic advertising is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070089C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_100072794(a1, (_QWORD *)a2, a3, 4.8752e-34);
  sub_10026A55C((void *)&_mh_execute_header, v6, v4, "Session \"%{public}s\" is not entitled to publish built-in service %{public}s", v5);
  if (*(char *)(a2 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007008F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to convert service to be added", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070091C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "offline advertising payload is internal only", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700948()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "offline advertising payload is feature is not enabled", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700974(uint64_t *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *a1;
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = v4;
  sub_10026A55C((void *)&_mh_execute_header, a4, a3, "incomingAddress address buffer is invalid[%lu bytes] from %@", (uint8_t *)a2);
}

void sub_1007009C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "incomingAddress API use unauthorized for %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100700A24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8149e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "session %s is not allowed to request stable address", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100700A70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8149e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "session %s is not allowed to request next address rotation time", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100700ABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "RetrieveConnectionHandleForIdentifier requested by unauthorized process -- check entitlements", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700AE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "RetrieveConnectionHandleForIdentifier no connection handle for device %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100700B48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Device %@ does not exist", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100700BA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700BD4()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Limiting access to services", v1, 2u);
  sub_10007266C();
}

void sub_100700C0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleEnableMRCForPeripheral: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700C6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for option read handleEnableMRCForPeripheral: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700CCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unauthorized use of this API", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700CF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring command due to invalid device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700D24(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;

  v2 = 138412546;
  v3 = a1;
  sub_100566050();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Temporary IRK for device  %@, missing IRK %@", (uint8_t *)&v2, 0x16u);
  sub_1000726A0();
}

void sub_100700D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "IRK needs to be 16 bytes", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700DC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "invalid device specified %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100700E28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Ignoring command, cannot access device %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100700E88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring command due to invalid parameters", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700EB4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  sub_100566070();
  sub_100072794(v2, v3, v4, 5.778e-34);
  sub_10026A55C((void *)&_mh_execute_header, v7, v5, "Failed to create a new device for address %@ with identifier %{public}s as it already exists", v6);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);

  sub_1000DE5DC();
}

void sub_100700F08()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  sub_100566070();
  sub_100072794(v2, v3, v4, 5.778e-34);
  sub_10026A55C((void *)&_mh_execute_header, v7, v5, "Failed to create a new device for address %@ with identifier %{public}s", v6);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);

  sub_1000DE5DC();
}

void sub_100700F5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Device %@ already exists, cannot create a new one", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100700FBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "AddressBytes length must be 6 or 7 bytes", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100700FE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "handleCreatePeripheralWithAddressAndIdentifierMsg Private API", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701014(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "RegisterForConnectionEventsWithOptions with restricted service", v3);
}

void sub_100701040()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring command due to limited DeviceAccess Per Accessory extension", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070106C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring command due to limited DeviceAccess Media extension", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8149e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "session %s is not allowed to set LE AFH map ", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007010E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;
  int v6;
  _QWORD *v7;

  sub_1002A8288();
  if (v6 >= 0)
    v7 = v1;
  else
    v7 = (_QWORD *)*v1;
  *(_DWORD *)v2 = 67109378;
  *(_DWORD *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 8) = 2080;
  *(_QWORD *)(v2 + 10) = v7;
  sub_1002A827C((void *)&_mh_execute_header, v5, v3, "Failed to set connection AFH Map status=%{bluetooth:OI_STATUS}u for session %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100701148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  sub_1002A8288();
  sub_100566088(3.8522e-34, v1, v2, v3);
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = 5;
  *(_WORD *)(v4 + 18) = 2080;
  *(_QWORD *)(v4 + 20) = v5;
  sub_100566060((void *)&_mh_execute_header, "Ignoring LE AFH map of %ld bytes (needs to be %d bytes) from session %s", v6, v7);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007011A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterTargetCore for handleWipeDuplicateFilter: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701208()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgOptions for handleWipeDuplicateFilter: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convert XPC kCBScanOptionAppleFilterTargetCore for handleRemoveSingleEntryDuplicateFilter %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007012C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convert XPC Agr for handleRemoveSingleEntryDuplicateFilter %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701328()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convert XPC kCBScanOptionAppleFilterTargetCore for handleRemoveMultipleEntriesDuplicateFilter %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701388()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convert XPC Agr for handleRemoveMultipleEntriesDuplicateFilter %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007013E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convert XPC kCBScanOptionRemoveMultipleDupFilterEntryPacketType for handleClearDuplicateFilterCache %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701448()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convert XPC Arg for handleClearDuplicateFilterCache %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007014A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanEnableOptionAppleScanPeriod for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanEnableOptionAppleScanDuration for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701568()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterTargetCore for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007015C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterBypassFilterDuplicate for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAllowDuplicates for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701688()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanEnableOptionAppleType for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007016E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanEnableOptionAppleEnable for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgOptions for handleEnhancedScanEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007017A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterPriorityConfiguration for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701808()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanTargetCore for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701868()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanMaxWindowLECoded for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007018C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanMaxWindowLE2M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701928()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanMaxWindowLE1M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701988()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanIsLegacy for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007019E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanWindowLECoded for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701A48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanWindowLE2M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanWindowLE1M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701B08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanIntervalLECoded for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701B68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanIntervalLE2M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701BC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanIntervalLE1M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701C28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanTypeLECoded for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701C88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanTypeLE2M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701CE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanTypeLE1M for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701D48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanPHY for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701DA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterScanningFilterPolicy for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701E08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBSetScanParameterOwnAddress for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701E68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgOptions for handleEnhancedSetScanParametersMultiCoreMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701EC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOption27dBmReport for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701F28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOption127dBmReport for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701F88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterRSSIThresholdOrder for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100701FE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterTargetCore for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702048()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterBypassFilterDuplicate for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007020A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterAddressType for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702108()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterForceDups for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702168()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterRssi for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007021C8(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  sub_10026A55C((void *)&_mh_execute_header, a4, a3, "Blob length (%zu) or mask length(%zu) size are not supported for handleAddAdvancedMatchingRuleWithAddressMsg", (uint8_t *)a1);
}

void sub_100702214()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain payload filter mask for handleAddAdvancedMatchingRuleWithAddressMsg", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain payload filter data for handleAddAdvancedMatchingRuleWithAddressMsg", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070226C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgOptions for handleAddAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007022CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterRSSIThresholdOrder for handleRemoveAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070232C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterTargetCore for handleRemoveAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070238C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterBypassFilterDuplicate for handleRemoveAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007023EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterAddressType for handleRemoveAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070244C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterForceDups for handleRemoveAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007024AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBScanOptionAppleFilterRssi for handleRemoveAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070250C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain payload filter mask for handleRemoveAdvancedMatchingRuleWithAddressMsg", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702538()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain payload filter data for handleRemoveAdvancedMatchingRuleWithAddressMsg", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgOptions for handleRemoveAdvancedMatchingRuleWithAddressMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007025C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Match Action Rules are internal only", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007025F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgDataLengthMaxTxTime for handleDataLengthChangeMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702650()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgDataLengthMaxTxOctets for handleDataLengthChangeMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007026B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgOptions for handleDataLengthChangeMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702710()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsReadLocalSupportedCapabilitiesMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070273C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsReadLocalSupportedCapabilitiesMsg error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070279C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding is not supported for this platform", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007027C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsReadRemoteSupportedCapabilitiesMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007027F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsCreateConfigMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702820()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleCsCreateConfigMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702880(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 67109376;
  *(_DWORD *)(a2 + 4) = 10;
  *(_WORD *)(a2 + 8) = 1024;
  *(_DWORD *)(a2 + 10) = a1;
  sub_1002A8234((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error for handleCsCreateConfigMsg. Channel map can't be greater than %d currently at: %d", (uint8_t *)a2);
}

void sub_1007028D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleCsCreateConfigMsg for converting raw bytes channel: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsRemoveConfigMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070295C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleCsRemoveConfigMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007029BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsProcedureEnableMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007029E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleCsProcedureEnableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702A48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsSetProcedureParamsMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702A74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleCsSetProcedureParamsMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702AD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsSetAfhMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702B00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleCsSetAfhMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702B60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Channel Sounding handleCsSetDefaultSettingsMsg is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702B8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleCsReadLocalFAETableMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702BEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "kCBCSReflectorFAETable is not provided as option", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702C18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Error converting data for Channel Classification %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100702C78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgLESetPhyPhyOptions for handleLESetPHYMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702CD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgLESetPhyRxPhys for handleLESetPHYMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702D38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgLESetPhyTxPhys for handleLESetPHYMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702D98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgLESetPhyAllPhys for handleLESetPHYMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702DF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC kCBMsgArgOptions for handleLESetPHYMsg: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702E58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleConfigureRSSIDetection: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702EB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Device is not connected for CBMsgIdConfigureRSSIDetectionAndStatistics: %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100702F24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXPC options  for handleConfigureRSSIDetection: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702F84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleConfigureUsageNotifications: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100702FE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100566040();
  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error for handleConfigureUsageStatisticsNotifications: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703044()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Start LE Conn trigger Control message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007030A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot start event counter indications to an invalid device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007030D0()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;

  sub_100410050(__stack_chk_guard);
  v2 = 134218242;
  v3 = v0;
  sub_100566050();
  sub_10026A55C((void *)&_mh_execute_header, v1, (uint64_t)v1, "connection handle %p for device %@ is invalud", (uint8_t *)&v2);
  sub_1000726A0();
}

void sub_100703140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Could not get a connection handle for device %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007031A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Not allowed to start event counter SPMI", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007031CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Not allowed to stop event counter SPMI", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007031F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Set IRK for Device is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Remove IRK for Device is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Delete Device is only for internal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070327C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Get Num Connected Peripherals Per Application not allowed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007032A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Not a msg with replyable context", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007032D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Get LPEM Data not allowed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Get WhbGetOptimalHost not allowed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070332C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Get handleWhbGetLocalDevice not allowed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703358()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "This command is only accessible for system processes", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "This command is only accessible for internal processes", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007033B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Refresh identity is not allowed for App %@ :", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703410()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Get identity is not allowed for App %@ :", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703470()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid identifier", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070349C(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412802;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 22) = 1024;
  *(_DWORD *)(a2 + 24) = 1024;
  sub_100566060((void *)&_mh_execute_header, "Could not store custom property %@, value is longer than maximum permitted (string is %lu, max allowed is %d)", (uint8_t *)a2, a4);
}

void sub_1007034F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Attempting to write custom property without “com.apple.bluetooth.custom.properties.writable” entitlement.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070351C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Session cannot access device %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070357C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No identifier", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007035A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No duration", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007035D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Identifier is nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703600()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convert args with error: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703660()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unsupported apply type: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007036C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8149e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "session %s is not allowed to change LE power control ", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100703710()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  __int16 v3;
  const char *v4;

  sub_100097230();
  v3 = 2080;
  v4 = "handlesetLePowerControlMsg";
  sub_1002A827C((void *)&_mh_execute_header, v0, v1, "Failed to convertXpcObject  result = %d, function=%s", v2);
  sub_1000726A0();
}

void sub_100703788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to convertXpcObject kCBMsgArgOptions = %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007037E8()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;

  sub_1002BC094();
  v3 = 2112;
  v4 = v0;
  sub_1002A827C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Someone is accessing handle 0x%04x on device \"%@\", but we don't have the service for it! ಠ_ಠ", v2);
  sub_1000726A0();
}

void sub_100703860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  sub_100410050(__stack_chk_guard);
  v1 = *(_QWORD *)(v0 + 224);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v1;
  sub_10026A55C((void *)&_mh_execute_header, v3, (uint64_t)v3, "Missing plist limitation for a DA session bundle %@ client %@", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_1007038DC()
{
  int v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  int v4;

  sub_10052CF4C();
  v4 = v0;
  sub_1002A827C((void *)&_mh_execute_header, v1, v2, "%@ isCBPrivacySupported %d is not authorized to use bluetooth", v3);
  sub_1000726A0();
}

void sub_10070394C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "debugAddDeviceToOutgoingLEConnectionDenyList: %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007039AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "debugRemoveDeviceFromOutgoingLEConnectionDenyList: %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703A0C(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  id v7;

  v7 = a2;
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Overriding address with Invalid address string %@ (%@)", (uint8_t *)a3, 0x16u);

}

void sub_100703A88(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Cannot advertise service data for UUID of more than 2 bytes", v3);
}

void sub_100703AB4(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 20;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "service data cannot exceed %d bytes", buf, 8u);
}

void sub_100703AFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "service data invalid size", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703B28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Contact tracing is not allowed on this device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703B54(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(_QWORD *)(a1 + 4) = a2;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "TDS data too short %{public}zu", (uint8_t *)a1);
}

void sub_100703B90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failure converting XPC data for DBAF.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703BBC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "XPC object is not an dictionary (type is %{public}@)", (uint8_t *)a2);
}

void sub_100703BF8(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_1002C3FAC(a1);
  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "XPC object is not an array (type is %{public}@)", v4);
  sub_100072694();
}

void sub_100703C68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to add service with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703CC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Failed to set private mode for client session %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703D2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "TDS scan not allowed.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703D58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot use Legacy FindMy usecase without disabling the feature flag", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703D84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Session \"%s\" is using kCBScanOptionHWObjectDiscovery, move to kCBScanOptionHWObjectDiscoveryWild", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot use FindMy usecase without enabling the feature flag", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703E20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "handleCreatePeripheralFromIdentifierMsg Failed to create a new device from invalid identifier", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703E4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "handleCreatePeripheralFromIdentifierMsg Device %@ already exists, cannot create a new one", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703EAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "handleCreatePeripheralFromIdentifierMsg Failed to create a new device from identifier %{public}@ ", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703F0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "handleCreatePeripheralFromIdentifierMsg Private API", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703F38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "%@ cannot use this API", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100703F9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100703FC8()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;

  sub_100410050(__stack_chk_guard);
  sub_10052CF4C();
  v3 = v0;
  sub_1002A827C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Failed to set GAP name for device \"%@\" due to error %d", v2);
  sub_1000726A0();
}

void sub_100704034()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "FastLEConnection:handlePeripheralEnableFastLeConnectionWithData invalid device specified", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704060()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "FastLEConnection:handlePeripheralEnableFastLeConnectionWithData no access to this SPI", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070408C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "local address should be 6 bytes, ignoring invalid data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007040B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Peer address should be 6 bytes, ignoring invalid data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007040E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid User Description Length", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704110()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Invalid zone %{public}@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100704170()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contact a puck filter type", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070419C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain an RSSI threshold value", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007041C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain payload filter mask", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007041F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain payload filter data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain a valid Name Match Option", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070424C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The scan options didn't contain a valid RSSI threshold value", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "ruleID could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007042A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "serviceUUID could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007042D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Puck ScanIntervalBackground could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007042FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Puck ScanInterval could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704328()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Puck ScanWindow could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704354()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "UseCaseList could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704380()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "ObjectLocatorWithThisType options  could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007043AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Address type could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007043D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Filtered peers could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704404()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "RSSI Threshold options  could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704430()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Target Core options  could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070445C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "bypass Filter Duplicate options could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704488()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Force dups could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007044B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "ManufacturerID could not be converted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007044E0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "createXpcAdvData lenError", v3);
}

void sub_10070450C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  NSObject *v8;

  sub_1002A8288();
  sub_100566088(5.778e-34, v1, v2, v3);
  *(_WORD *)(v4 + 12) = 2080;
  *(_QWORD *)(v4 + 14) = v5;
  sub_10026A55C((void *)&_mh_execute_header, v8, v6, "createXpcAdvData error device:%@ address:%s, invalid length, not enough room for the len field.", v7);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100704560(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Could not register MAP: %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1007045C4(char *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  char *v5;

  if (a1[23] >= 0)
    v5 = a1;
  else
    v5 = *(char **)a1;
  *(_DWORD *)a2 = 136446466;
  *(_QWORD *)(a2 + 4) = v5;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  sub_1002A827C((void *)&_mh_execute_header, a4, a3, "Failed to disconnect from device %{public}s due to %{bluetooth:OI_STATUS}u", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_10070463C(char a1, int a2, NSObject *a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = "accept";
  if ((a1 & 1) == 0)
    v3 = "deny";
  v4 = 136315394;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  sub_1002A827C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to %s connection attempt - result was %{bluetooth:OI_STATUS}u", (uint8_t *)&v4);
}

void sub_1007046D0(char *a1, uint8_t *buf, os_log_t log)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Denying connection attempt from device %{public}s. Is MAP enabled? Is MAP connected to some other device?", buf, 0xCu);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_100704740(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Received disconnect event with no connected device for connectionId %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1007047A8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CK asked us to undelete message, which is unsupported", v1, 2u);
  sub_10007266C();
}

void sub_1007047E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a1, a3, "%s: can't create transport BTVirtualTransportInterfaceHCICommand", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100704854(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a1, a3, "%s: can't create transport kBTVirtualTransportInterfaceACL", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1007048C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a1, a3, "%s: invalid handle", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100704934()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create session for FastConnectACL Manager", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704960(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
}

void sub_1007049D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Fail to pause LEConnectionManager", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704A00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Fail to set iCloud RPA, skip BBFC", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704A2C(uint64_t a1, NSObject *a2)
{
  void **v3;
  void *__p[2];
  char v5;
  uint8_t buf[4];
  void **v7;

  sub_10043F6EC(a1, (uint64_t)__p);
  if (v5 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  *(_DWORD *)buf = 136446210;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Can't start scan for \"%{public}s\" since Scan is running already", buf, 0xCu);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_100704ADC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Fail to register connectCfm CB for FastConnectACL", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704B08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Previous connection request wasn't completed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704B34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
}

void sub_100704BA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "serviceConnection - m_Device is null", v2, v3, v4, v5, v6);
  sub_10007266C();
}

BOOL sub_100704BD4(NSObject *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  return *a2 == 0;
}

void sub_100704C60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Fail to pause LEObserver, Skip BBFC", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704C8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "LEObserver Already Paused, Kickstart BBFC", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704CB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Fail to register connectCfm CB", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704CE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Fail to unregister connectCfm CB for FastConnectACL", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704D10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error trying to create IOHIDManager", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704D3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error trying to open Apple USB Pairing HID Manager", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704D68(char *a1, uint64_t a2, NSObject *a3)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = v4;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to find HID device %s to remove", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_100704DD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Coud not copy BT ADDR because BT ADDR is all Zero", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704DFC(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t *v5;

  if (*((char *)a1 + 23) >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  v4 = 136315138;
  v5 = v3;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Failed to Send Link Key to device %s", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_100704E74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not generate link key", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704EA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "USB Pairing: failed - Failed to open device (%04X); retrying in 5s...\n",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10007266C();
}

void sub_100704F00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not open USB Device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704F2C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "USB Pairing: Invalid context (%p) / device (%p)\n", (uint8_t *)&v3, 0x16u);
  sub_1000726A0();
}

void sub_100704FAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "ERR: Unable to get location ID for a device\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100704FD8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Unable to find bluetooth device for iohid ref %p", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_100705040()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Sending existing LinkKey Failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070506C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Data sent to device does not match data being read back with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007050CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to Send Link Key to device with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070512C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not set link key to the device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705158(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown CB MsgID %d", (uint8_t *)v2, 8u);
}

void sub_1007051CC(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;

  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 20161219;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CoreBluetooth version %d differs from bluetoothd version %d", (uint8_t *)v2, 0xEu);
}

void sub_100705254(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ignoring mismatched check-in from client \"%{public}@\"", (uint8_t *)&v2, 0xCu);
}

void sub_1007052C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "PanConsumerProfile connection failed: %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070532C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "PanConsumerProfile disconnection failed: %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100705390(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to bring the link up", v1, 2u);
  sub_10007266C();
}

void sub_1007053CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Impossible to register PAN ...", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007053F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Failed to accept packet type filter request - %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070545C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Failed to accept multicast filter request - %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1007054C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to deregister PAN", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007054EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "We could not accept the connection. Was tethering off? error %u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100705550()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to bring the link up", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070557C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Connection failed!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007055A8(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136446210;
  v2 = "fNetIfc == NULL";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", (uint8_t *)&v1, 0xCu);
}

void sub_100705628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid size input report", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705654(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Unknown input report ID %u. I don't know to which keyhole it belongs to, so discarding", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1007056B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "The HID device that handles report ID %u isn't ready, discarding input report", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070571C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The HID device is not ready for a spoofed click", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Management HID device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705774()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Mouse HID device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007057A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Accelerometer HID device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007057CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "startTracking: sensor tracking is not supported on this platform", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007057F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "startTracking: session is nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "startTracking: device is nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705850(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "startTracking: invalid apple type: %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1007058B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "startTracking: invalid timeout value: %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100705918()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "startTracking:failed to create session ID string", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705944()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to configure sensor track Increase Scan Params device %{public}@ with status %d");
  sub_1000726A0();
}

void sub_1007059A4()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to start tracking device %{public}@ with status %d");
  sub_1000726A0();
}

void sub_100705A04(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Currently tracking apple types: %{public}@", buf, 0xCu);

}

void sub_100705A58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "stopTracking: sensor tracking is not supported on this platform", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705A84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "stopTracking: session is nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705AB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "stopTracking: device is nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705ADC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "stopTracking: invalid apple type: %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100705B40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "stopTracking: failed to create session ID string", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705B6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "stopTrackingForSession: sensor tracking is not supported on this platform", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705B98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "topTrackingForSession: session is nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705BC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "stopTrackingForSession: failed to create session ID string", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705BF0(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136446210;
  v2 = "index < fSize";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", (uint8_t *)&v1, 0xCu);
}

void sub_100705C70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid Phonebook character set.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705C9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not find phonebook", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705CC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Missing first argument in +XAPL command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100705D28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Missing second argument +XAPL command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100705D88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Incorrect argument in +IPHONEACCEV command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100705DE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Incorrect event count in +IPHONEACCEV command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100705E48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Unknown event in +IPHONEACCEV command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100705EA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +IPHONEACCEV command - device is not custom command compliant", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705ED4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +IPHONEACCEV command - invalid command", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705F00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +IPHONEACCEV command - invalid command received", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705F2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +IPHONEEV command - device is not custom command compliant", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705F58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +IPHONEACCNAME command - device is not custom command compliant", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100705F84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Incorrect argument in +IPHONEACCINDICATOR command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100705FE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Incorrect event count in +IPHONEACCINDICATOR command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706044()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Unknown event in +IPHONEACCINDICATOR command: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007060A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +IPHONEACCINDICATOR command - device is not custom command compliant", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007060D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +IPHONEACCINDICATOR command - invalid command", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007060FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +APLSIRI command - device is not custom command compliant", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100706128()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in APLEFM command", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100706154()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in APLEFM  command - device is not custom command compliant", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100706180()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +APLNRSTAT", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007061AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error in +APLNRSTAT  command - device is not custom command compliant", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007061D8(int *a1)
{
  do
  {
    if (*((char *)a1 - 1) < 0)
      operator delete(*((void **)a1 - 3));
    a1 -= 8;
  }
  while (a1 != dword_100993370);
}

void sub_100706218(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Unknown command type.", a5, a6, a7, a8, 0);
}

void sub_10070624C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Failed to open AB", a5, a6, a7, a8, 0);
}

void sub_100706280()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDefaultMsg sessionID:%lld", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007062E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryAddCallbacksMsg accessoryManager:%llx ", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706340()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "could not find callbacks (or) no callbacks were registered ", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070636C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryRemoveCallbacksMsg accessoryManager:%llx ", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007063CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryRegisterDeviceMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070642C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryPlugInDeviceMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070648C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryUnplugDeviceMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007064EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDeviceStateMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070654C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDevicesMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007065AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDeviceBatteryLevelMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070660C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDeviceBatteryStatusMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070666C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetTimeSyncIdMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007066CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryIsAccessoryMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070672C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGenerateLinkKeyMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070678C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetLinkKeyExMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007067EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetFirstSettingMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070684C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetSecondSettingMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007068AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetFirstSettingMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070690C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetRemoteTimeSyncMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070696C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSecondSettingMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007069CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to register a BTAccessoryManagerRegisterCustomMessageClient", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007069F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryRegisterCustomMessageClientMsg accessoryManager:%llx ", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706A58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryDeregisterCustomMessageClientMsg accessoryManager:%llx ", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706AB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySendCustomMessageMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706B18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDeviceDiagnosticsMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706B78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySendRequestPeriodicallyMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706BD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryCancelRequestPeriodicallyMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706C38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySendControlCommandMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706C98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDoubleTapActionMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706CF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetControlCommandMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706D58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDoubleTapActionExMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706DB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDoubleTapCapabilityMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706E18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetInEarStatusMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706E78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetFeatureCapabilityMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706ED8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetDoubleTapActionMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706F38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetDoubleTapActionExMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706F98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSettingFeatureBitMaskMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100706FF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetAccessoryInfoMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707058()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "BTAccessoryMsgHandler::handleBTAccessoryReadDeviceVersionInfoMsg ", v1, 2u);
  sub_10007266C();
}

void sub_100707090()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDeviceColorMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007070F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetWirelessSharingSpatialMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707150()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetupCommandMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007071B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySendRelayMsgMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryUpdateConnPriorityListMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707270()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetNonAppleHAEPairedDevicesMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007072D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryManagerSmartRouteModeMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707330()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSmartRouteModeMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707390()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSmartRouteSupportMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007073F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetDeviceStateOnPeerSrcMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707450()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSpatialAudioPlatformSupportMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007074B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDeviceSoundProfileSupportMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetDeviceSoundProfileAllowedMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707570()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetDeviceSoundProfileAllowedMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007075D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetCallManagementConfigMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetFeatureProxCardStatusMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707690()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetFeatureProxCardStatusMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007076F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetStereoHFPSupportMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetAnnounceMessagesSupport accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007077B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetAACPCapabilityBitsMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707810()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetAACPCapabilityIntegerMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707870()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySensorStreamTimeSyncEnableMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007078D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetAnnounceCallsSupportMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySpatialAudioModeMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSpatialAudioModeMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007079F0()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1000EEFE4();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "BTAccessoryMsgHandler::handleBTAccessorySpatialAudioAllowedMsg accessoryManagerID:%llx, spatial mode is %llu", v2, 0x16u);
  sub_1000726A0();
}

void sub_100707A6C()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;

  sub_1000EEFE4();
  v2 = 1024;
  v3 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "BTAccessoryMsgHandler::handleBTAccessoryGetSpatialAudioAllowedMsg accessoryManagerID:%llx, , spatial mode is %d", v1, 0x12u);
  sub_1000726A0();
}

void sub_100707AE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetAdaptiveLatencyJitterBufferLevelMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707B44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSpatialAudioActiveMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707BA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetIsHiddenMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707C04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetGyroInformationMsg - accessoryManagerID: %llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707C64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetSensorStreamingFrequencyMsg - accessoryManagerID: %llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707CC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetCaseSerialNumbersForAppleProductIdMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707D24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetCaseSerialNumbersForAppleProductIdsMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707D84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetPrimaryBudSide - accessoryManagerID: %llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707DE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessoryGetHeadphoneFeatureValueMsg - accessoryManagerID: %llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySetHeadphoneFeatureValueMsg - accessoryManagerID: %llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707EA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "BTAccessoryMsgHandler::handleBTAccessorySendAdaptiveVolumeMessageMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707F04()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  sub_100597B64();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "handleBTAccessorySendAdaptiveVolumeMessageMsg: incorrect message size received over XPC, expected: %u, got: %zu", v2, v3);
  sub_1000726A0();
}

void sub_100707F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "handleBTAccessorySendPMEConfigMessageMsg accessoryManagerID:%llx", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100707FC4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  sub_100597B64();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "handleBTAccessorySendPMEConfigMessageMsg: incorrect message size received over XPC, expected: %u, got: %zu", v2, v3);
  sub_1000726A0();
}

void sub_100708024(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136446210;
  v2 = "fSession == NULL";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", (uint8_t *)&v1, 0xCu);
}

void sub_1007080A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register as an AVRCP controller - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708104()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register as an AVRCP Target - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708164()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register AVRCP callbacks - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007081C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to deregister AVRCP callbacks - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to deregister as an AVRCP controller - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708284()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to deregister as an AVRCP Target - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007082E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "Failed to connect to device %{public}s: %{bluetooth:OI_STATUS}u", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100708328()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "Failed to disconnect from device %{public}s: %{bluetooth:OI_STATUS}u", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070836C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1007083DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send capability request - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070843C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1007084AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received disconnectCfm without a connectCfm, likely because the connection request was rejected.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007084D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Skipped queryDeviceCapabilities, Absolute Volume may not set up properly.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stale AVRCP command, device has disconnected already", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708530()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to respond to command: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708590()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to respond to capability request - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007085F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to respond to list request - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708650()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to respond to list value request - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007086B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to respond to 'get player attribute value' request: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708710()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to respond with error to set attribute value request - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708770()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set attribute value(s) - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007087D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "device %{public}s not found", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070881C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to respond to 'get play status' request: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070887C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send response to SetAddressedPlayer: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007088DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send browsing response to SetBrowsedPlayer: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070893C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_1007089AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send browsing response to ChangePath: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708A0C(uint64_t *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_1002A81D4(*a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Cannot find the MTU for device %{public}s", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100708A98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send browsing response to GetFolderItems: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708AF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100708B68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100708BD8(uint64_t *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_1002A81D4(*a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Cannot find the MTU for device %{public}s", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100708C64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send browsing response to GetItemAttributes: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708CC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100708D34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send browsing response to Search: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708D94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send browsing response to GetTotalNumberOfItems: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send response to PlayItem: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708E54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "device %{public}s not found. Dropping", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100708EA0(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_1002A81D4(*(_QWORD *)(a1 + 64), (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Dropping 'GetImageProperties' response as BIP connection no longer exists with device %{public}s", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100708F2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send response to GetImageProperties: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100708F8C(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_1002A81D4(*(_QWORD *)(a1 + 64), (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Dropping 'GetImage' response as BIP connection no longer exists with device %{public}s", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100709018()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send response to GetImage: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709078(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_1002A81D4(*(_QWORD *)(a1 + 64), (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Dropping 'GetLinkedThumbnail' response as BIP connection no longer exists with device %{public}s", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100709104()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send response to GetLinkedThumbnail: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709164()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "Failed to respond to 'get element attributes' request on device %{public}s: %{bluetooth:OI_STATUS}u", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007091A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register for volume change notifications - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709208()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "Failed to re-register for absolute volume change events on device %{public}s - result was %{bluetooth:OI_STATUS}u", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070924C(uint64_t *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_1002A81D4(*a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Failed to set volume on the remote device %{public}s", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_1007092D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "Failed to send mute button release to device %{public}s - result was %{bluetooth:OI_STATUS}u", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070931C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002F7654((void *)&_mh_execute_header, "Failed to send mute button press to device %{public}s - result was %{bluetooth:OI_STATUS}u", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100709360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "initAVRCPFastConnectL2CAP error creating AVRCP signal", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070938C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "composeAVRCPDescriptor error getting browse L2CAP data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007093B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "composeAVRCPDescriptor error getting signaling L2CAP data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007093E4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseAVRCPDescriptor L2CAP signal channel not found", a1);
}

void sub_100709418(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseAVRCPDescriptor L2CAP browse channel not found", a1);
}

void sub_10070944C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072684((void *)&_mh_execute_header, a2, a3, "Failed to validate format string: %@", a5, a6, a7, a8, 2u);
}

void sub_1007094B4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User responded with unknown response. Not unsetting tag 'RequiresANCSAuth'. Will ask again later", v1, 2u);
}

void sub_1007094F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No pairing callbacks registered", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709520()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Pairing agent is not started", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070954C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No pairing attempts currently pending", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709578()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "SMP_DeriveLTKFromLinkKey failed with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007095D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "getLinkKey failed with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709638()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Attempting to dispatch a cancellation event without creating one", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709664()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to start Classic SMP Pairing, no key derivation, classic pairing is done. (status=%d)", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007096C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Encryption is not AES_CCM, not doing Classic SMP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007096F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to grab paired devices", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070971C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stack is not running - rejecting pairing attempt", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No pairing agent - rejecting pairing attempt", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "We already have OOB data for device %{public}s, aborting pincode pairing", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007097BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "We already have OOB data for device %{public}s, aborting numeric comparison pairing", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100709804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "We already have OOB data for device %{public}s, aborting passkey pairing", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070984C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stack is not running - cannot deliver local OOB Data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Pairing timedout, request for device %{public}s not found", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007098C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Reached pairing timeout for pending attempt with device %{public}s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100709908()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Stack is not running", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709934(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = "setPincode";
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Rejecting Pairing Request because PIN code length is %zu", buf, 0x16u);
}

void sub_10070998C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "No authentification request found for device %{public}s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007099D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "No pending pairing attempts for device %{public}s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100709A1C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(_QWORD *)(a1 + 4) = "NULL";
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Pairing failure reported for device %{public}s", (uint8_t *)a1);
}

void sub_100709A5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100265C78((void *)&_mh_execute_header, v7, v8, "Pairing failure reported for device %{public}s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100709AA4(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_10043E5F8(a1, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136446210;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Unpairing device %{public}s - failed as stack is not running", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_100709B50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "KeyChain delete link-key failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709B7C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100265C78((void *)&_mh_execute_header, a2, a3, "LE device for addr %@ does not exist", (uint8_t *)a2);

  sub_1000DE5DC();
}

void sub_100709BC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error: Unrecognized pairingType %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709C20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "privacySyncAlertCB received with no pending device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709C4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No pending devices for _showPrivacySyncAlertForNextPendingDevice", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709C78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create run loop source", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709CA4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136446466;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2082;
  *(_QWORD *)&v3[14] = a2;
  sub_1000727B8((void *)&_mh_execute_header, a2, a3, "XPC service \"%{public}s\" server error: %{public}s", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_1000726A0();
}

void sub_100709D14(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136446466;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_1000727B8((void *)&_mh_execute_header, a2, a3, "Unexpected XPC service \"%{public}s\" server event: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_1000726A0();
}

void sub_100709D84(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136446210;
  v2 = "it != fClientInfoMap.end()";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", (uint8_t *)&v1, 0xCu);
  sub_1000726A0();
}

void sub_100709E00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "OOB data for this device is already present", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100709E30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_SECMGR_ReadLocalOobExtendedData returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709E90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_SECMGR_ReadLocalOobData returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100709EF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "User responded with unknown response. Not updating 'isUsingLowSecurity' status.", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100709F20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000728B8();
  sub_1005C3A94((void *)&_mh_execute_header, v0, v1, "Failed to set new link key for %{private,bluetooth:BD_ADDR,mask.hash}.6P", v2, v3, v4, v5, v6);
  sub_100347680();
}

void sub_100709F80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000728B8();
  sub_1005C3A94((void *)&_mh_execute_header, v0, v1, "Invalid device %{private,bluetooth:BD_ADDR,mask.hash}.6P", v2, v3, v4, v5, v6);
  sub_100347680();
}

void sub_100709FE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_HCI_ReadEncryptionKeySize failed: returned %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070A040()
{
  int v0;
  os_log_t v1;
  uint8_t v2[28];
  __int16 v3;
  int v4;

  sub_1000728B8();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Encryption key size for device %{private,bluetooth:BD_ADDR,mask.hash}.6P is %u", v2, 0x22u);
  sub_100347680();
}

void sub_10070A0BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Read Encryption Key Size failed with error %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070A11C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Audio Timesync: Getting BTTimeSync referene failed: make sure that you are registed with TimeSync", a5, a6, a7, a8, 0);
}

void sub_10070A150(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007265C((void *)&_mh_execute_header, a1, a3, "Audio Timesync: Invalid Spedup parameters: Targeted input will not work with default speed", a5, a6, a7, a8, 0);
}

void sub_10070A18C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070A1FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Command failed to execute with status %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070A260()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;

  sub_1002BC094();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to set MTU to %d with result %{bluetooth:OI_STATUS}u", v2, 0xEu);
  sub_1000726A0();
}

void sub_10070A2E0(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "No primary services found on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070A358(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = sub_1005D3DC4(a1);
  sub_1005D3DA0((void *)&_mh_execute_header, v1, v2, "No characteristics found in range [0x%04x, 0x%04x] on device \"%@\"", v3, v4, v5, v6, 2u);

  sub_100072870();
}

void sub_10070A3F8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1003CD7D8();
  v1 = sub_1005D3DB4(v0);
  sub_1005D3D7C();
  sub_1005D3DA0((void *)&_mh_execute_header, v2, v3, "No characteristic value could be read at handle 0x%04x on device \"%@\" - result was %{bluetooth:OI_STATUS}u", v4, v5, v6, v7, v8);

  sub_100072870();
}

void sub_10070A470(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Couldn't find characteristic at handle 0x%04x on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070A4E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Characteristic handle 0x%04x is not readable!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070A54C(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Handle 0x%04x is not a characteristic on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070A5C4(char *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  char *v7;
  int v8;
  int v9;
  id v10;

  if (a1[23] >= 0)
    v7 = a1;
  else
    v7 = *(char **)a1;
  v8 = *(unsigned __int16 *)(a2 + 64);
  v9 = *(unsigned __int16 *)(a2 + 66);
  v10 = *(id *)(a2 + 16);
  *(_DWORD *)a3 = 136446978;
  *(_QWORD *)(a3 + 4) = v7;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v8;
  *(_WORD *)(a3 + 18) = 1024;
  *(_DWORD *)(a3 + 20) = v9;
  *(_WORD *)(a3 + 24) = 2112;
  *(_QWORD *)(a3 + 26) = v10;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "No characteristic values with UUID %{public}s could be read in range [0x%04x, 0x%04x] on device \"%@\"", (uint8_t *)a3, 0x22u);
  if (a1[23] < 0)
    operator delete(*(void **)a1);

}

void sub_10070A68C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1003CD7D8();
  v1 = sub_1005D3DB4(v0);
  sub_1005D3D7C();
  sub_1005D3DA0((void *)&_mh_execute_header, v2, v3, "No characteristic value could be read at handle 0x%04x on device \"%@\" - result was %{bluetooth:OI_STATUS}u", v4, v5, v6, v7, v8);

  sub_100072870();
}

void sub_10070A704()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1003CD7D8();
  v1 = sub_1005D3DB4(v0);
  sub_1005D3D7C();
  sub_1005D3DA0((void *)&_mh_execute_header, v2, v3, "No descriptor could be read at handle 0x%04x on device \"%@\" - result was %{bluetooth:OI_STATUS}u", v4, v5, v6, v7, v8);

  sub_100072870();
}

void sub_10070A77C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1003CD7D8();
  v1 = sub_1005D3DB4(v0);
  sub_1005D3D7C();
  sub_1005D3DA0((void *)&_mh_execute_header, v2, v3, "Failed to write characteristic value at handle 0x%04x on device \"%@\" - result was %{bluetooth:OI_STATUS}u", v4, v5, v6, v7, v8);

  sub_100072870();
}

void sub_10070A7F0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1003CD7D8();
  v1 = sub_1005D3DB4(v0);
  sub_1005D3D7C();
  sub_1005D3DA0((void *)&_mh_execute_header, v2, v3, "Failed to write long characteristic value at handle 0x%04x on device \"%@\" - result was %{bluetooth:OI_STATUS}u", v4, v5, v6, v7, v8);

  sub_100072870();
}

void sub_10070A864()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1003CD7D8();
  v1 = sub_1005D3DB4(v0);
  sub_1005D3D7C();
  sub_1005D3DA0((void *)&_mh_execute_header, v2, v3, "Failed to write descriptor at handle 0x%04x on device \"%@\" - result was %{bluetooth:OI_STATUS}u", v4, v5, v6, v7, v8);

  sub_100072870();
}

void sub_10070A8D8(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "Failed to locate GAP device name characteristic on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070A950(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Setting GAP name failed with error %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070A9B4(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "Failed to locate GAP primary service on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070AA2C(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "Failed to locate GAP primary service on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070AAA4(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Unable to find service for characteristic handle 0x%04x on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AB1C(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Couldn't find handle 0x%04x on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AB94(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Couldn't find characteristic at handle 0x%04x on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AC0C(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Characteristic at handle 0x%04x does not support notifications or indications on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AC84(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Handle 0x%04x is not a characteristic on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070ACFC(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Couldn't find handle 0x%04x on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AD74(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Couldn't find characteristic at handle 0x%04x on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070ADEC(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Characteristic at handle 0x%04x does not support notifications or indications on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AE64(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Handle 0x%04x is not a characteristic on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AEDC(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Couldn't find handle 0x%04x on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070AF54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Characteristic handle 0x%04x is not writeable w/o response!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070AFB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Characteristic handle 0x%04x is not writeable!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B01C(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = sub_1005D3D6C(a1, a2);
  sub_1005D3D54();
  sub_1000726FC((void *)&_mh_execute_header, v3, v4, "Handle 0x%04x is not a characteristic on device \"%@\"", v5, v6, v7, v8, v9);

  sub_100072870();
}

void sub_10070B094(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070B104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070B174(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "Failed to locate GAP primary service on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070B1EC(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "Failed to locate GAP primary service on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070B264(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "Failed to locate GAP reconnection characteristic handle on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070B2DC(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1005D3DC4(a1);
  sub_1000EEFE4();
  sub_100072720((void *)&_mh_execute_header, v2, v3, "Failed to locate GATT primary service on device \"%@\"", v4, v5, v6, v7, v8);

  sub_100072694();
}

void sub_10070B354(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_10070B368()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register WiAP v2 SDP service record - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B3C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register SDP service record - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B428()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register RFCOMM server - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B488(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Failed to deregister RFCOMM server - result was %{bluetooth:OI_STATUS}u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070B4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot connect to NULL device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B520()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No rfcomm channel found for this profile", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B54C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Wireless IAP connection failed - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B5AC(char *a1, uint64_t a2, NSObject *a3)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)a2 = 136446210;
  *(_QWORD *)(a2 + 4) = v4;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Wireless IAP Service is not supported by device %{public}s", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_10070B614(char a1, int a2, os_log_t log)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = "accept";
  if ((a1 & 1) == 0)
    v3 = "deny";
  v4 = 136446466;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to %{public}s connection attempt - result was %{bluetooth:OI_STATUS}u", (uint8_t *)&v4, 0x12u);
}

void sub_10070B6B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error retrieving device from handle", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B6DC(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_10043E5F8(a1, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136446210;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Failed to open serial port for device %{public}s", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_10070B788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not establish connection to IAP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B7B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not establish endpoint to IAP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B7E0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "WiAPProfile::connectedCfm: Endpoint %@ doesn't exist", (uint8_t *)&v3);
}

void sub_10070B84C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot write data to NULL device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to queue data for processing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B8A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot read from NULL device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B8D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send data to BT device - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid write - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070B990(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072894((void *)&_mh_execute_header, (int)a2, a3, "Invalid format", a1);
}

void sub_10070B9C0(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Num frames to send (%d) exceeds maximum frame count (%d)", (uint8_t *)v3, 0xEu);
}

void sub_10070BA44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing init sequence on connection complete instead of link ready", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070BA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for unpaired databases to be cached", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070BAD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "GATT Init failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070BB30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Indication for an invalid handle, ignoring", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070BB5C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Not detecting built in services", v1, 2u);
  sub_10007266C();
}

void sub_10070BB94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Invalid database for device %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070BBF4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to redact HID reports for device %@", buf, 0xCu);

}

void sub_10070BC48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "MIDI: Invalid database for device %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070BCA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "MIDI: No manufacturer name to identify apple device - No AutoConnect", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070BCD4(char a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1 & 1;
  *((_WORD *)buf + 4) = 2048;
  *(_QWORD *)(buf + 10) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MIDI: ff %d, midi %p", buf, 0x12u);
}

void sub_10070BD2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "MIDI: should notify builtin service returned false - No AutoConnect", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070BD58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LE disconnect failed with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070BDB8()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Gatt Gateway can not find device in scheduler map!", v1, 2u);
  sub_10007266C();
}

void sub_10070BDF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Failed to create a GATT session for device \"%{public}@\"", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070BE50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070BEC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070BF30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070BFA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070C010(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070C080(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10070C0F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unhandled stack status: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C150()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "LeDeviceManager wasn't tracking a device for connection handle", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C17C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "No database exists for device \"%{public}@\" ", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070C1DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Received a notification for an unknown device %{public}@. Ignoring.", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070C23C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Received an indication on handle 0x%04x but no session is subscribed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C29C(unsigned __int16 a1, unsigned __int16 a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received \"service changed\" notification for [0x%04x;0x%04x] for an unknown device. Ignoring.",
    (uint8_t *)v3,
    0xEu);
  sub_1000726A0();
}

void sub_10070C324(uint64_t a1, char *a2, uint8_t *buf, os_log_t log)
{
  char *v5;

  if (a2[23] >= 0)
    v5 = a2;
  else
    v5 = *(char **)a2;
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2082;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Dropping notification from device \"%{public}@\" of non-characteristic value attribute \"%{public}s\"", buf, 0x16u);
  if (a2[23] < 0)
    operator delete(*(void **)a2);
}

void sub_10070C3A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to read RSSI : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C404()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error parsing XPC Args", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C430()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to change connection packet type : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C490()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error retrieving connection handle\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C4BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "ReadTransmitPowerLevel returned error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C51C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received XPC ReadTransmitPowerLevel request while another request was in flight. Dropping request", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C548()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Country Code Action : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C5A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Country Code Multi Band : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C608()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Country Code Multi Band is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C634()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "handleSimulateLocationUpdateMsg: countryString = %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070C694()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to set Cellular Transmit State : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C6F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error sending VSC to read factory cal table : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C754()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to send gizmo detected : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C7B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HCI_StartRxTest : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C814()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received XPC RxTest request while another request was in flight. Dropping request", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C840()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HCI_StartTxTest : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C8A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received XPC TxTest request while another request was in flight. Dropping request", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C8CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HCI_LeTestEnd : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C92C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received XPC LeTestEnd request while another request was in flight. Dropping request", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C958()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HCI_StartRxEnhancedTest : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C9B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received XPC RxEnhancedTest request while another request was in flight. Dropping request", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070C9E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HCI_StartTxEnhancedTest : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CA44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received XPC TxEnhancedTest request while another request was in flight. Dropping request", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CA70()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1003D7FC4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Got CC: %d LEFlag: %d", v1, 0xEu);
  sub_1000726A0();
}

void sub_10070CAE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "Got countryCode: %@", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070CB48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in read GPIO status : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CBA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to set SAR state : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CC08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unable to set WiFi 5G state : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CC68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No value for the key kCBMsgArgs\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CC94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unable to write cellular antenna", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CCC0()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_1003D7FC4();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to set diversity mode %d on handle %d", v2, v3);
  sub_1000726A0();
}

void sub_10070CD28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unable to enable/disable tunables read", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CD54()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_1003D7FC4();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to set BT diversity antenna to Ant%d on handle %d", v2, v3);
  sub_1000726A0();
}

void sub_10070CDBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error to send ADV Buffer Configuration : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CE1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in AdvMatch Control message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CE7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in read ADV buffer command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CEDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error to send Match table Configuration : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CF3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error to send Match table Extended Filter Configuration : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070CF9C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_1001084D0();
  HIWORD(v3) = v0;
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Error invalid endEntry (%d) or startEntry (%d) ", v2, v3);
  sub_1000726A0();
}

void sub_10070D000()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error to send match table parmater command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D060()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error to send match table parmater command; LE addr Convert failed : %d",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10007266C();
}

void sub_10070D0C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error to send Match Buffer Configuration : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D120()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SPMI Diagnostic message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D180()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in BTCLK SensorC Time Sync Control message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D1E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Tx ADV Trig Time Stamp Control message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Read LE Conn Event Counter message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D2A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SPMI debug control VSE message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in set GPIO state message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error parsing XPC Args", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D38C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HDR Setup Sync message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D3EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HDR Accept Sync message message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D44C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SCO Buffer Size Control message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D4AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SCO Buffer Size Control is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D4D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Control message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D538()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "HRB is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Allowed Bands message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D5C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to retrieve connection handle.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D5F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Change Connection Band message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D650()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Write Scan Enable message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D6B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Write Page Scan Activity message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D710()
{
  os_log_t v0;
  uint8_t v1[10];
  int v2;

  sub_1001084D0();
  v2 = 3;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error in HRB Set AFH Host Channel Classification message numberOfGroups is invalid: %d(shall be <= %d)", v1, 0xEu);
  sub_1000726A0();
}

void sub_10070D784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Set AFH Host Channel Classification message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D7E4()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_1000EEFE4();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error in HRB Set AFH Host Channel Classification message channel map size is invalid: %zu (shall be %d)", v2, 0x12u);
  sub_1000726A0();
}

void sub_10070D860()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1002CB84C();
  sub_1000727B8((void *)&_mh_execute_header, v0, v1, "Error in HRB Set AFH Host Channel Classification message size of gr channel map param  is invalid: %zu (shall be %lu)", v2, v3);
  sub_1000726A0();
}

void sub_10070D8C0()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1002CB84C();
  sub_1000727B8((void *)&_mh_execute_header, v0, v1, "Error in HRB Set AFH Host Channel Classification start freq param size is invalid: %zu (shall be %lu)", v2, v3);
  sub_1000726A0();
}

void sub_10070D920()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Get Essential Power Database Entries message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D980()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Read Transmit Power Level message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070D9E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Read AFH Channel Map message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DA40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Limit Channel Map message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DAA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in HRB Set Band Edges message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DB00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "HRB Set Band Edges is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DB2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Couldn't find the device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DB58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Enter Sniff Mode message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DBB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Exit Sniff Mode message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DC18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Enable Phy Stats message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DC78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Enable Phy Stats converting xpc args : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DCD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Advanced Sniff Mode message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DD38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Advanced Sniff Mode is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DD64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Exit Advanced Sniff Mode message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DDC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Exit Advanced Sniff Mode is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DDF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Advanced Sniff Reconfigure message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DE50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Advanced Sniff Reconfigure is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DE7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Set Peripheral Max Age message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DEDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Set Peripheral Max Age is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DF08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in LMP Flow message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DF68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "LMP Flow is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DF94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in AoS Empty Packet Report message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070DFF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "AoS Empty Packet Report is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Control AoS message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Control AoS is not supported.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E0AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in BTSC Page Scan message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E10C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error to Set QoS Config : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E16C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SPMI Coex Debug Counters Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E1CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SPMI Test Write Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E22C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SPMI Coex Tx Control Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E28C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SPMI Type 53 Config Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E2EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in SPMI Type 60 Config Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E34C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Read Controller RAM : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E3AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in set min encryption key size Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E40C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Factory Cal Set Tx Power : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E46C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Cal Set Tx Power Command invalid Mode: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E4CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Exiting", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E4F8(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;

  v2[0] = 67109632;
  v2[1] = a1;
  v3 = 1024;
  v4 = 210;
  v5 = 1024;
  v6 = 250;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: Unexpected File size %d; Expected File size %d or %d, Exiting\n",
    (uint8_t *)v2,
    0x14u);
  sub_1000726A0();
}

void sub_10070E588()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error Downloading Power Regulatory File, Exiting", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E5B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Device is not connected", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E5E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error parsing XPC Args: handleSimulateBudswapCmd", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E60C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Enable Phy Stats message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E66C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error writing BD Address : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E6CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Crc Erred Pdu Report Enable message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E72C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error in Apple Extended Adv Report Enable message : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E78C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "_findTypeFromLength cannot find type!!! This shall not happen!!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E7B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Perf recv data ind get connection handle failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E818()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "Unable to open, file path=%s\n", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070E878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_100072684((void *)&_mh_execute_header, v0, v1, "EOF found, file path=%s\n", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070E8D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error reading file", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E904(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "loadFile: Error Reading File Stat: errno = %d\n", (uint8_t *)v3, 8u);
  sub_1000726A0();
}

void sub_10070E98C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to write ACL data : %d\n", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070E9EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid size input report", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EA18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "The HID device is not ready for a spoofed click", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EA44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Management HID device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Trackpad HID device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EA9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Actuator HID device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EAC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to create Accelerometer HID device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EAF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "AdvertisementInterval defaults is now obsolete. Please use ConnectableAdvInt, NonConnectableAdvInt, ObjectDiscoveryAdvInt and ExtAdvInt instead", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EB20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LE_GAP_InitPeriodicAdvertising failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EB80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LE_GAP_InitAdvertising failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EBE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set address change callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EC40(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_1000340DC(a1, (uint64_t)__p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136446210;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Already not advertising data for session \"%{public}s\"", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_10070ECE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Cannot disable setLEAdvTxPowerIncrease response on handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070ED48()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100607A64();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "setLEAdvTxPowerIncrease disable on handle %d returned %d", v2, v3);
  sub_1000726A0();
}

void sub_10070EDA8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100607A64();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "btleTxAdvTrigTimeStamp disable on handle %d returned %d", v2, v3);
  sub_1000726A0();
}

void sub_10070EE08()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;

  sub_10052CF4C();
  v3 = 0;
  sub_10032187C((void *)&_mh_execute_header, v0, v1, "updateAdvertisement currentState:%{public}s, trying again in %dms", v2);
  sub_1000726A0();
}

void sub_10070EE90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Advertising tech still unknown. We'll revisit once we know how to advertise", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EEBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Resetting advertising internal states", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EEE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to start advertising with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EF48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to stop advertising with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070EFA8(char a1, uint64_t a2, os_log_t log)
{
  const char *v3;
  int v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;

  v3 = "YES";
  v4 = *(unsigned __int8 *)(a2 + 16945);
  if ((a1 & 1) != 0)
    v5 = "YES";
  else
    v5 = "NO";
  v6 = 136446722;
  v7 = v5;
  v8 = 2082;
  if (!v4)
    v3 = "NO";
  v9 = v3;
  v10 = 2082;
  v11 = "NO";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "updateAdvertisement deferred:%{public}s fDeferringUpdateAdvertisingState:%{public}s fAddressChangeInProgress:%{public}s", (uint8_t *)&v6, 0x20u);
}

void sub_10070F05C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_10052CF60((void *)&_mh_execute_header, v0, v1, "We're already deferred, skipping", v2);
  sub_10007266C();
}

void sub_10070F08C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002F75F8();
  sub_100607A90(4.8752e-34, v1, v2, v3);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Rejecting advertising from \"%{public}s\" for list type %d", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070F0E8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100607A64();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "setLEAdvTxPowerIncrease enable on handle %d returned %d", v2, v3);
  sub_1000726A0();
}

void sub_10070F148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "setLEAdvTxPowerIncrease on advertising handle is already set up on handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F1A8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100607A64();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "btleTxAdvTrigTimeStamp enable on handle %d returned %d", v2, v3);
  sub_1000726A0();
}

void sub_10070F208()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "SPMI Debug Control spmiDebugVSEControl returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "ObjectLocator Response on advertising handle is already set up on handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F2C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Already advertising data for session \"%{public}s\"", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070F314()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_10052CF60((void *)&_mh_execute_header, v0, v1, "appSessionStateChanged - backgrounded sessions", v2);
  sub_10007266C();
}

void sub_10070F344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100607A80((void *)&_mh_execute_header, v7, v8, "Pushing session %{public}s to the front of the line", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070F38C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LeBroadcaster::_LE_GAP_ParseAppleManufacturingData returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F3EC(char a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "LeBroadcaster::sendAppleManufacturingPayloadMetrics called with start:%d", (uint8_t *)v2, 8u);
  sub_10007266C();
}

void sub_10070F460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100607A80((void *)&_mh_execute_header, v7, v8, "Removing session %{public}s from the line", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070F4A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Already not advertising data for session \"%{public}s\"", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070F4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to start periodic advertising with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F554()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to stop periodic advertising with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F5B4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "LTV parsing failed, invalid length [%@]", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_10070F61C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Scan Response should *always* have room for the UUID hash!", v1, 2u);
  sub_10007266C();
}

void sub_10070F654(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10052CF60((void *)&_mh_execute_header, a3, (uint64_t)a3, "Extended advertising for background advertising is disabled", a1);
}

void sub_10070F688(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10052CF60((void *)&_mh_execute_header, a3, (uint64_t)a3, "We dont support extended advertising", a1);
}

void sub_10070F6BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Ignoring watchdog, coredump in progress", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F6E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "updateAdvertisement busy with address change for more than %dms, aborting to recover", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070F754(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "updateAdvertisement in unsettled state for more than %dms, trying to recover", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070F7C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002F75F8();
  sub_100607A90(4.8752e-34, v1, v2, v3);
  sub_10032187C((void *)&_mh_execute_header, v6, v4, "Session %{public}s is now %d", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070F818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100607A80((void *)&_mh_execute_header, v7, v8, "Session %{public}s does not support backgrounding", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10070F860()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;

  sub_10052CF4C();
  v3 = v0;
  sub_1002A827C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Advertising failed to %{public}s with result %{bluetooth:OI_STATUS}u", v2);
  sub_1000726A0();
}

void sub_10070F8E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Faking unsettled state, ignoring advertisingComplete event, staying in a bad state", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F914(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "fControllerMaxExtendedAdvertisingPayloadSize=%d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10070F97C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LE_GAP_SetNonConnectableAddress failed with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070F9DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "generateNonConnectableIdentity failed with error %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FA3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LE_GAP_OverrideLocalAddress returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FA9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Source supports Remote", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FAC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Source supports AACP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FAF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Source supports A2DP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FB20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Source supports HFP and HandsfreeAoS", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FB4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Source supports HFP", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FB78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing GATT Clean", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FBA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing AVRCP Clean", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FBD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing AACP Clean", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FBFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing HandsfreeAoS Clean", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FC28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing HFP Clean", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FC54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Forcing A2DP Clean", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FC80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to allocate fast connect channel with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FCE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "fastConnectEchoRspCB", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FD0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "composeGATTDescriptor error getting signaling L2CAP data", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FD38(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100410038();
  sub_10007275C((void *)&_mh_execute_header, v4, v5, "Descriptor was already sent once! FCState %s", v6, v7, v8, v9, v10);
  *a3 = qword_1009999D0;
  sub_100072694();
}

void sub_10070FDD4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "fastConnectParseProfileDescriptorMessage: Parse A2DP error!!!!", v3);
}

void sub_10070FE00(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Parse HFP error!!!!", v3);
}

void sub_10070FE2C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Parse AACP error!!!!", v3);
}

void sub_10070FE58(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Parse AVRCP error!!!!", v3);
}

void sub_10070FE84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "fastConnectParseProfileDescriptorMessage FC_ELEMENT_PROFILE_LIST Expected but received %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_10007275C((void *)&_mh_execute_header, v0, v1, "Descriptor was already received once! FCState %s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10070FF68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003D7FDC();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Wrong CID %d came with profile descriptor message", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10070FFC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Expected Device Info but received %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710028(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "parseGATTDescriptor L2CAP signal channel not found", v3);
}

void sub_100710054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_10007275C((void *)&_mh_execute_header, v0, v1, "Configure was already sent once! FCState %s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007100D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003D7FDC();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "fastConnectComposeServiceConfigureMessage Wrong CID %d came with fast connect channel support event", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710138()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find GATT signaling channel CID:%d Result:%d to report connection attempt", v2, v3);
  sub_1000726A0();
}

void sub_100710198()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find AVRCP signaling channel CID:%d Result:%d to report connection attempt", v2, v3);
  sub_1000726A0();
}

void sub_1007101F8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find AACP signaling channel CID:%d Result:%d to report connection attempt", v2, v3);
  sub_1000726A0();
}

void sub_100710258()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find HFP signaling channel CID:%d Result:%d to report connection attempt", v2, v3);
  sub_1000726A0();
}

void sub_1007102B8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find A2DP media or signaling channel mediaCID:%d mediaResult:%d to report connection attempt", v2, v3);
  sub_1000726A0();
}

void sub_100710318()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to complete GATT connect Cfm for CID:%d Result:%d to report connection result", v2, v3);
  sub_1000726A0();
}

void sub_100710378()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find AVRCP signaling channel CID:%d Result:%d to report connection result", v2, v3);
  sub_1000726A0();
}

void sub_1007103D8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find AACP signaling channel CID:%d Result:%d to report connection result", v2, v3);
  sub_1000726A0();
}

void sub_100710438()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find HFP signaling channel CID:%d Result:%d to report connection result", v2, v3);
  sub_1000726A0();
}

void sub_100710498()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100611574(__stack_chk_guard);
  sub_100506070();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to find A2DP media or signaling channel mediaCID:%d mediaResult:%d to report connection result", v2, v3);
  sub_1000726A0();
}

void sub_1007104F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136446210;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "No fast connect device found for %{public}s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100710548()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Fast Connect Profile Mask Mismatch!", v1, 2u);
  sub_10007266C();
}

void sub_100710580(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Parse AACP setup complete error", v3);
}

void sub_1007105AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "fastConnectParseSetupCompleteMessage FC_ELEMENT_PROFILE_LIST Expected but received %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071060C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Device Info Expected but received %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071066C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_10007275C((void *)&_mh_execute_header, v0, v1, "Setup Complete was already received once! FCState %s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007106E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003D7FDC();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Wrong CID %d came with setup complete message", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710744()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "FastConnectMagicPolicyCB: Channel not found in PolicyCB!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710770(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  uint64_t v11;

  v10 = 136315138;
  v11 = sub_10025304C(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  sub_100072744((void *)&_mh_execute_header, a2, v9, "Failed to find PFC device for address: %s", (uint8_t *)&v10);
  sub_100072694();
}

void sub_1007107EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Authentication failed: cleaning up fast connect channel", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710818(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "fastConnectAuthEvent Wrong CID %d came with fast connect channel support event", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100710880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136446210;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Device %{public}s has empty UUID", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007108D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to baseband retry for echo request, took %d ms", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "PFC failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not create fast connect device for incoming connection", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007109BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Could not find fast connect device for outgoing connection", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007109E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Unknown message %d received", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710A48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error Message received", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710A74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register L2CAP Queue with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710AD4(unsigned __int16 a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  int v4;

  v4 = *(unsigned __int16 *)(a2 + 36);
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "L2CAP channel info local CID %d local MTU %d", buf, 0xEu);
}

void sub_100710B30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "parseFastConnectEchoReq L2CAP channel alloc failed result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710B90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "PFC Source Not Supported", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710BBC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_1002A82B8();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "parseFastConnectEchoReq SDP expected %x received %x", v2, v3);
  sub_1000726A0();
}

void sub_100710C1C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8151e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Updating DID for device %s to %d", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100710C64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "device is not paired!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710C90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Not responding to echo request from %s, as PFC already in progress", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100710CE0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Failed to get address from handle %p", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_100710D48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "fastConnectGetAppleFeaturesAndSDPDatabaseState failed to find device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710D74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "fastConnectGetDeviceExtendedFeatures failed to find device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710DA0(uint64_t *a1, int a2, NSObject *a3)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 2048;
  v6 = v3;
  sub_1002A827C((void *)&_mh_execute_header, a3, (uint64_t)a3, "fastConnectEchoRspEvent NULL channel result %d channel %p", (uint8_t *)v4);
  sub_1000726A0();
}

void sub_100710E1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "fastConnectEchoRspEvent with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710E7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "fastConnectEchoRspEvent failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710EDC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_1002A82B8();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "SDP expected %x received %x", v2, v3);
  sub_1000726A0();
}

void sub_100710F3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Do not set ConnScanTimeoutExtendPercent %d percent - invalid", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100710F9C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10064934C();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Overriding MainCore Disabled for Connection Scan, invaid Overriding Scan Window %d, Scan Interval %d.", v2, v3);
  sub_1000726A0();
}

void sub_100710FFC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10064934C();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Overriding ScanCore Disabled for Connection Scan, invaid Overriding Scan Window %d, Scan Interval %d.", v2, v3);
  sub_1000726A0();
}

void sub_10071105C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100649444();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for fFastConnectionScanIntervalMsCoexCarPlayNoAudio", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007110C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100649444();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for fFastConnectionScanIntervalMsCoexCarPlayWithAudio", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711124()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100649444();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for connection parameter updates", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711188()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100649444();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for default connection interval", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007111EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for default connection interval", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071124C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for max number of devices in connection Filter Accept List", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007112AC()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10064934C();
  sub_100649390((void *)&_mh_execute_header, v0, v1, "maxInterval:%d is smaller than minInterval:%d LeConnectionLatencyVeryHigh", v2, v3);
  sub_1000726A0();
}

void sub_10071130C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10064934C();
  sub_100649390((void *)&_mh_execute_header, v0, v1, "maxInterval:%d is smaller than minInterval:%d LeConnectionLatencyHigh", v2, v3);
  sub_1000726A0();
}

float sub_10071136C(unsigned __int16 a1, unsigned __int16 a2, os_log_t log)
{
  float result;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;

  v4[0] = 67109888;
  v4[1] = a1;
  v5 = 1024;
  v6 = a2;
  v7 = 1024;
  v8 = 120;
  v9 = 1024;
  v10 = 100;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "maxInterval:%d is smaller than minInterval:%d Use default maxInterval %d and minInterval %d LeConnectionLatencyMedium", (uint8_t *)v4, 0x1Au);
  return result;
}

void sub_10071140C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10064934C();
  sub_100649390((void *)&_mh_execute_header, v0, v1, "maxInterval:%d is smaller than minInterval:%d LeConnectionLatencyLow", v2, v3);
  sub_1000726A0();
}

void sub_10071146C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = sub_100021770(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10064942C();
  sub_1002A827C((void *)&_mh_execute_header, a3, v6, "Failed to add address \"%{public}@\" to filter accept list with status:%d, restarting", v7);

  sub_100072870();
}

void sub_1007114F8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = sub_100021770(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10064942C();
  sub_1002A827C((void *)&_mh_execute_header, a3, v6, "Failed to remove address \"%{public}@\" from filter accept list with status:%d, restarting", v7);

  sub_100072870();
}

void sub_100711584()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Unable to find connected device for HCI handle %p", v2);
  sub_1000726A0();
}

void sub_1007115E8()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[10];
  int v3;
  __int16 v4;
  int v5;

  sub_1001084D0();
  v3 = 0;
  v4 = v0;
  v5 = 0xFFFF;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Overriding LEInstantFactor with a value %u out side range min %u max %d.", v2, 0x14u);
  sub_1000726A0();
}

void sub_100711664()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to add filter accept list callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007116C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set address will change callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711724()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set address change callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set Channel Sounding callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007117E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set connection callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711844()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set peripheral role with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007118A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set central role with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "connectionParametersUpdateRequestCallback: invalid handle", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to read local Fast LE Connection data from controller with result:%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Fast LE Connection disabled due to controller overrides", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007119BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to unset central role with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711A1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Timed out while waiting for all LE connections to complete disconnection", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711A48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Timed out while cancelling all pending connections", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711A74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "failed to cancel a connection. This should not happen, file a radar ! status=%{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711AD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "Already in state %{public}s, ignoring state change", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100711B54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "Subrate Change Event masking status: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711BB4()
{
  uint64_t v0;
  _QWORD *v1;
  unsigned __int16 v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002F75F8();
  sub_1006493A4(v1, v2, v3, 4.8151e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Failed to disable HID Latency Statistics for %s with LMhandle 0x%02x", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100711BFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send command to setting event mask for connection subrating with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711C5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Magnet phy enable failed with status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711CBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "Subrate Change Event un-masking status: %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100711D1C()
{
  uint64_t v0;
  _QWORD *v1;
  unsigned __int16 v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002F75F8();
  sub_1006493A4(v1, v2, v3, 4.8151e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Failed to enable HID Latency Statistics for %s with LMHandle 0x%02x", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100711D64()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100649414(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, (uint64_t)v0, "updateLeConnectionRSSIThresholdState: %{public}s is in invalid state", v1);
  sub_1000726A0();
}

void sub_100711DCC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to set connection interval for device \"%{public}@\" as it isn't connected", v2);
  sub_1000726A0();
}

void sub_100711E30()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Magnet Subrating requested for device \"%{public}@\" which is not a Magnet link or does not support subrating.", v2);
  sub_1000726A0();
}

void sub_100711E94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100711F04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "Magnet link to \"%{public}@\" is currently not subrated. Using default Magnet parameters.", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100711F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "Magnet Latency requested for device \"%{public}@\" that does not support subrating but is Magnet-capable. Using default Magnet parameters.", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100711FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Magnet Latency requested for device \"%{public}@\" that is not Magnet-capable.", v2);
  sub_1000726A0();
}

void sub_100712028()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "aopRssiDetectEvent: inDeviceEntry not valid", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100712054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid data length %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007120B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1002F7664((void *)&_mh_execute_header, a1, a3, "aopRssiDetectEvent: Event size=%d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100712120(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "AutoReconnected to a device never requested \"%{public}s\"", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_1007121A4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Device \"%{public}@\" no more valid keys/mac addresses", v2);
  sub_1000726A0();
}

void sub_100712208()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Ignoring connection request for unknown device \"%{public}@\"", v2);
  sub_1000726A0();
}

void sub_10071226C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot start a new connection, stack is shutting down", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100712298()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;

  sub_10016574C();
  v3 = 103;
  sub_1002A827C((void *)&_mh_execute_header, v0, v1, "Failed to add device \"%{public}@\" to filter accept list with result due to shutdown %{bluetooth:OI_STATUS}u", v2);
  sub_1000726A0();
}

void sub_100712304(int a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v6 = 136315394;
  v7 = sub_100036064(a1);
  v8 = 2114;
  v9 = a2;
  sub_10026A55C((void *)&_mh_execute_header, a3, v5, "UseCase %s cannot be considered for device \"%{public}@\"", (uint8_t *)&v6);
  sub_100072694();
}

void sub_10071238C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "LeConnectionDenyList: Failed to add device \"%{public}@\" to filter accept list because is currently blocked", v2);
  sub_1000726A0();
}

void sub_1007123F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_10007275C((void *)&_mh_execute_header, v0, v1, "device \"%{public}@\" already in fConnectingDevices", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100712450()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;

  sub_10016574C();
  v3 = v0;
  sub_1002A827C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Failed to add device \"%{public}@\" to filter accept list with result %{bluetooth:OI_STATUS}u", v2);
  sub_1000726A0();
}

void sub_1007124BC(void *a1, _DWORD *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a1;
  *a2 = 138412290;
  *a3 = v5;
  sub_100184790((void *)&_mh_execute_header, v6, v7, "address %@ is already in the FilterAcceptList");

  sub_1000FB314();
}

void sub_100712514(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;

  v1 = 136446466;
  v2 = "Idle";
  v3 = 2082;
  v4 = "Active";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unexpected connection state (%{public}s) in ConnectionManager state (%{public}s) for disconnect request event", (uint8_t *)&v1, 0x16u);
  sub_1000726A0();
}

void sub_1007125A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Device \"%{public}s\" is not connected nor pending connection", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007125F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unknown connection latency", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071261C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Enabling event for connection subrating failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071267C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Disabling event for connection subrating failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007126DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "Removed pending connection subrating parameters for handle %p", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_10071273C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No handle exists for device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100712768(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = 0;
  v5 = 2114;
  v6 = a1;
  sub_10026A55C((void *)&_mh_execute_header, a2, a3, "device is null \"%{public}@\" for session %{public}@ ", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1007127DC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Device \"%{public}@\" needs to be connected for using  RSSI detection", v2);
  sub_1000726A0();
}

void sub_100712840()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  v3 = 2114;
  v4 = v0;
  sub_10026A55C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Unable to convert handle from device \"%{public}@\" for session %{public}@ ", v2);
  sub_1000726A0();
}

void sub_1007128B4()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100649378();
  sub_10026A55C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to disable RSSI statistics and detection for \"%{public}@\". The session  %{public}@  is not currently detecting RSSI ", v1);
  sub_1000726A0();
}

void sub_10071291C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100649378();
  sub_10026A55C((void *)&_mh_execute_header, v0, (uint64_t)v0, "The session %{public}@ is already detecting RSSI statistics and detection for \"%{public}@\"  ", v1);
  sub_1000726A0();
}

void sub_100712984()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Device \"%{public}@\" needs to be connected for configuring BT Usage notifications", v4);

  sub_1000DE5DC();
}

void sub_1007129C4(void *a1, char *a2, uint64_t a3, NSObject *a4)
{
  char *v6;

  if (a2[23] >= 0)
    v6 = a2;
  else
    v6 = *(char **)a2;
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2082;
  *(_QWORD *)(a3 + 14) = v6;
  sub_10026A55C((void *)&_mh_execute_header, a4, a3, "Failed to configurate BT Usage notification for \"%{public}@\". The session  %{public}s  already owns bluetooth usage notifications ", (uint8_t *)a3);
  if (a2[23] < 0)
    operator delete(*(void **)a2);

  sub_1000DE5DC();
}

void sub_100712A44()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Unable to find device \"%{public}@\" for session", v2);
  sub_1000726A0();
}

void sub_100712AA8(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  sub_10026A55C((void *)&_mh_execute_header, a4, a3, "Device we will overwrite this new session %{public}@ with device : \"%{public}@\"  ", (uint8_t *)a3);

  sub_1000DE5DC();
}

void sub_100712B00()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100649378();
  sub_10026A55C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to find device \"%{public}@\" for session %{public}@ ", v1);
  sub_1000726A0();
}

void sub_100712B68(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "%{public}s", v3);
}

void sub_100712BA0(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device \"%{public}s\" is not connected nor pending connection", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100712C28(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device \"%{public}s\" is not connected nor pending connection", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100712CB0(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device \"%{public}s\" is not connected nor pending connection", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100712D38(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device \"%{public}s\" is not connected nor pending connection", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100712DC0(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device \"%{public}s\" is not connected nor pending connection", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100712E48()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "CsAgent for session %{public}@ is not found for ", v2);
  sub_1000726A0();
}

void sub_100712EAC(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device \"%{public}s\" is not connected nor pending connection", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100712F34()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "CsAgent for session %{public}@ is not found", v2);
  sub_1000726A0();
}

void sub_100712F98(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint8_t v15[24];

  sub_10064936C(a1, (uint64_t)a2);
  sub_1002A8180();
  sub_1002A81E0();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Device \"%{public}s\" is not connected nor pending connection", v15);
  if (v14 < 0)
    sub_1002A81CC(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  sub_1002A81A0();
}

void sub_100713020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to start connection with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "Successfully execute btscLeSetConnectionScan", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007130AC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "We're not supposed to be here, in processConnectingDevices when LE Connection Manager State is %{public}s", v2);
  sub_1000726A0();
}

void sub_100713134()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Device \"%{public}@\" is not in our list, cannot remove it", v2);
  sub_1000726A0();
}

void sub_100713198()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "add device %{public}@ with options ignored since it is not supported", v2);
  sub_1000726A0();
}

void sub_1007131FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to remove device from FilterAcceptList with error %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071325C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to add device to FilterAcceptList with error %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007132BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "CommandDisableHostWakeupOnLinkDrop autoReconnect flag ignored due to NOT supported", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007132E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "DisableHostWakeupOnLinkDrop device NOT connected", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713314()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "CommandDisableHostWakeupOnLinkDrop NOT supported", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713340()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid value for windowConfiguration=(%d). Only valid values are 0,1,2", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007133A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid value for enableDebugging=(%d). Only valid values are 0,1", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713400()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "CBUseCaseDigitalID connection prioritization parameters are out of range.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071342C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "CBUseCaseDigitalIDTSA connection prioritization parameters are out of range.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713458()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set prioritization threshold", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713484()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "We have a successful outgoing connection to address \"%{public}@\" with new device UUID mapped :( Sadly, we say goodbye to old device.", v4);

  sub_1000DE5DC();
}

void sub_1007134C4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "We may have an un-tracked connection to address \"%{public}@\" :( Sadly, we say goodbye.", v4);

  sub_1000DE5DC();
}

void sub_100713504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100713574()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;
  int v6;
  _QWORD *v7;

  sub_1002F75F8();
  if (v6 >= 0)
    v7 = v1;
  else
    v7 = (_QWORD *)*v1;
  *(_DWORD *)v3 = 136446466;
  *(_QWORD *)(v3 + 4) = v7;
  *(_WORD *)(v3 + 12) = 2048;
  *(_QWORD *)(v3 + 14) = v2;
  sub_10026A55C((void *)&_mh_execute_header, v5, v3, "Already have a connection to device \"%{public}s\" (handle %p)", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007135D8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "We may have an un-tracked connection to address \"%{public}@\" :(", v4);

  sub_1000DE5DC();
}

void sub_100713618()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Controller is too busy (result %{bluetooth:OI_STATUS}u), we need to wait until something disconnects.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713678(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Controller reported a duplicate connection (result %{bluetooth:OI_STATUS}u), we need to kick our state machine back into motion.", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1007136E4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10064945C();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to cancel pending connection(s) with result %{bluetooth:OI_STATUS}u ConnectionState=%d");
  sub_1000726A0();
}

void sub_10071374C()
{
  int v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  int v5;

  sub_100410038();
  v4 = 1024;
  v5 = v0;
  sub_1002A827C((void *)&_mh_execute_header, v1, v2, "Got a connection cancel complete event in wrong state %{public}s(%d)", v3);
  sub_1000726A0();
}

void sub_1007137DC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Disconnected unexpectedly from device \"%{public}s\" with error %{bluetooth:OI_STATUS}u", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100713824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Connection failed to device \"%{public}s\", Retrying", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100713870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Connection timed out to device \"%{public}s\"", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007138BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Disconnected from device \"%{public}s\" due to hardware reset", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100713908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Device \"%{public}s\" no more valid addresses or LTK's", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100713954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Automatically retrying connection to FindMy device \"%{public}s\"", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007139A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Disconnected from device \"%{public}s\" due to encryption timeout", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007139EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Disconnected from device \"%{public}s\" becuase we have too many paired devices.", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100713A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Disconnected from device \"%{public}s\" due to MIC failure", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100713A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Disconnected from device \"%{public}s\", Fast LE Connection establishment failed", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100713AD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Unable to find connected device, most likely because the device probably had a bad address and we ignored it when it connected.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713AFC(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_100649450(a1);
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  sub_1006493D8((void *)&_mh_execute_header, v3, v4, "Removing entry for address %{public}@ from pending parameters map");

  sub_1000FB314();
}

void sub_100713B48(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_100649450(a1);
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  sub_1006493D8((void *)&_mh_execute_header, v3, v4, "Removing entry for address %{public}@ from configured parameters map");

  sub_1000FB314();
}

void sub_100713B94()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1006493EC();
  sub_1006493CC((void *)&_mh_execute_header, v0, v1, "purgeDisconnectionHistoryLeConnectionRSSIThresholdState: count %d maxDisconnectionHistoryUUIDs %d not full", v2);
  sub_1000726A0();
}

void sub_100713BF8()
{
  int v0;
  NSObject *v1;
  uint8_t v2[10];
  int v3;

  sub_100410050(__stack_chk_guard);
  sub_10064945C();
  v3 = v0;
  sub_1006493CC((void *)&_mh_execute_header, v1, (uint64_t)v1, "purgeDisconnectionHistoryLeConnectionRSSIThresholdState: count %d -> %d", v2);
  sub_1000726A0();
}

void sub_100713C64(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5;
  double v6;
  __int16 v7;
  double v8;

  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  sub_10026A55C((void *)&_mh_execute_header, a1, a5, "purgeDisconnectionHistoryLeConnectionRSSIThresholdState: invalid currentTime %f cutoffTime %f", (uint8_t *)&v5);
  sub_1000726A0();
}

void sub_100713CDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003BA7B4(__stack_chk_guard);
  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "upsertDisconnectionHistoryElement %{public}s not found from fDisconnectionHistoryMap. Create a new entry.", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100713D44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003D7FDC();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "upsertDisconnectionHistoryElement map is full delete %d keys", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100713DA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003BA7B4(__stack_chk_guard);
  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "upsertDisconnectionHistoryElement %{public}s found from fDisconnectionHistoryMap", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

BOOL sub_100713E0C(uint64_t a1, _QWORD *a2)
{
  os_log_t v3;
  uint8_t v5[16];

  sub_10009720C();
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "fFastConnectionScanTimer is already running!", v5, 2u);
  return *a2 == 0;
}

void sub_100713E60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100410038();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "fConnectingDevices.size:%ld", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100713EC4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100410038();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "fConnectionState:%{public}s fConnectingDevices.size:%ld", v2, 0x16u);
  sub_1000726A0();
}

void sub_100713F68()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Unable to find device for HCI handle %p", v2);
  sub_1000726A0();
}

void sub_100713FCC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Unable to find a listener for device \"%{public}@\"", v2);
  sub_1000726A0();
}

void sub_100714030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No device for handle!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071405C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Unable to find connected device for HCI handle %p", v2);
  sub_1000726A0();
}

void sub_1007140C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "LE link is down, wait for disconnection complete", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007140EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Le link \"%{public}s\" is ready with error %{bluetooth:OI_STATUS}u", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100714134()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000EEFE4();
  sub_10007275C((void *)&_mh_execute_header, v0, v1, "Unable to find connected device for HCI handle %p", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_100714194(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to set prioritization threshold", a1);
}

void sub_1007141C8(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid LE connection handle!!", a1);
}

void sub_1007141FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to update connection parameters with status=%{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071425C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003D7FDC();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid minimum interval: %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007142BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003D7FDC();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid maximum interval: %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071431C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_10064934C();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Maximum interval is smaller than minimum interval: %u > %u", v2, v3);
  sub_1000726A0();
}

void sub_10071437C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid peripheral latency: %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007143DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid timeout multiplier: %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071443C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Remote side wants an interval that would provide a poor user experience (more than 2 seconds syncups)", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714468()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Remote side wants an interval / latency combination that would provide a poor user experience (more than 6 seconds syncups)", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714494(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Remote side wants a peripheral latency more than %u so we drain our battery and they don't - refusing", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100714500(unsigned __int16 *a1, NSObject *a2, uint64_t a3, float a4)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  double v7;

  v4 = *a1;
  v5[0] = 67109376;
  v5[1] = v4;
  v6 = 2048;
  v7 = a4;
  sub_1002A827C((void *)&_mh_execute_header, a2, a3, "The min requested is lower that the desired min: %u < %f", (uint8_t *)v5);
  sub_1000726A0();
}

void sub_10071457C()
{
  os_log_t v0;
  uint8_t v1[10];
  int v2;

  sub_1001084D0();
  v2 = 18000;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Remote side (peripheral) asks for a timeout (%u ms) of more than %d seconds. This is not very user friendly - refusing", v1, 0xEu);
  sub_1000726A0();
}

void sub_1007145F0(_DWORD *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = sub_100021770(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  *a1 = 138543362;
  *a3 = v6;
  sub_100184790((void *)&_mh_execute_header, v7, v8, "We may have an un-tracked auto-reconnect to address \"%{public}@\" :( Sadly, we say goodbye.");

  sub_1000FB314();
}

void sub_10071464C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid state", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714678()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003BA7B4(__stack_chk_guard);
  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "deleteDisconnectionHistoryElement: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007146E0()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100649414(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, (uint64_t)v0, "getNextLeConnectionRSSIThresholdState: %{public}s is in invalid state", v1);
  sub_1000726A0();
}

void sub_100714748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1003BA7B4(__stack_chk_guard);
  sub_1000EEFE4();
  sub_1000726A8((void *)&_mh_execute_header, v0, v1, "deleteLeConnectionRSSIThresholdState: %{public}s", v2, v3, v4, v5, v6);
  sub_1000726A0();
}

void sub_1007147B0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1006493EC();
  sub_1006493CC((void *)&_mh_execute_header, v0, v1, "capDisconnectionHistoryLeConnectionRSSIThresholdState: count %d maxDisconnectionHistoryUUIDs %d not full", v2);
  sub_1000726A0();
}

void sub_100714814(const unsigned __int8 *a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100030DF4(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, a2, v5, "Failed to set connection AFH Map for device \"%{public}@\" as it isn't connected", v6);

  sub_100072694();
}

void sub_100714898()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set connection AFH Map status=%{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007148F8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1003BA7B4(__stack_chk_guard);
  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "handleConnScanRxStoppedCB: uuid %s cannot be found from fConnScanUseCaseParamsMap", v2);
  sub_1000726A0();
}

void sub_100714964(int a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_100036064(a1);
  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "handleConnScanRxStoppedCB: unexpected useCase %s", v4);
  sub_100072694();
}

void sub_1007149D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "address data cannot be nil", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714A04(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Invalid address %@", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_100714A6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid findMyID", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714A98(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid allowed sessions for FindMy device %@", (uint8_t *)a2);

  sub_1000DE5DC();
}

void sub_100714AE0(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid addresses for FindMy device %@", (uint8_t *)a2);

  sub_1000DE5DC();
}

void sub_100714B28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid serialNumber", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714B54(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1003BA79C(a1, (uint64_t)a2, a3, 5.778e-34);
  sub_10026A55C((void *)&_mh_execute_header, v6, v4, "Invalid address (%@) for FindMy device %@", v5);

  sub_1000DE5DC();
}

void sub_100714B9C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1003BA79C(a1, (uint64_t)a2, a3, 5.778e-34);
  sub_10026A55C((void *)&_mh_execute_header, v6, v4, "Invalid LTK (%@) for FindMy device %@", v5);

  sub_1000DE5DC();
}

void sub_100714BE4()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  v2 = 1024;
  v3 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FastLeConnection:setControllerInfo not enabling Fast LE Connection to device %@ fFastLeConnectionAllowed:%d", v1, 0x12u);
  sub_1000726A0();
}

void sub_100714C5C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "FastLeConnection:enableFastLEConnection %@ Address cannot be 0", v2);
  sub_1000726A0();
}

void sub_100714CC0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "FastLEConnection:LeDevice::enableFastLEConnection %@ cannot enable, peer does not have our updated info", v2);
  sub_1000726A0();
}

void sub_100714D24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "FastLEConnection:LeDevice::setLEPaired FastLEConnection:Address cannot be 0", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714D50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid property", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714D7C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  sub_10026A55C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid property value (too long): %@ = %@", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_100714DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410050(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "setCustomProperty device %@ does not have a resolvable or linked address", v2);
  sub_1000726A0();
}

void sub_100714E58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Invalid state, device is neither CTKD or linked transport", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100714E84(uint64_t *a1, NSObject *a2)
{
  uint64_t v3;
  void *p_p;
  void *__p;
  char v6;
  int v7;
  void *v8;

  sub_10064960C(*a1);
  if (v6 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  v7 = 136315138;
  v8 = p_p;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "setCustomProperty Failed to get a classic device for address %s", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p);
}

void sub_100714F34(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to take assertionId for name: %s, return value was: %d", buf, 0x12u);
}

void sub_100714F88(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to release assertionId: %d, return value was %d", (uint8_t *)v4, 0xEu);
}

void sub_100715010()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid override value (%d) for max number of devices to be cached in memory", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715070(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "uuid";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1007150E4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "Ignoring device with no keys", a1);
}

void sub_100715118(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072750((void *)&_mh_execute_header, a3, (uint64_t)a3, "Skipping due to missing addresses", a1);
}

void sub_10071514C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Remote Bluetooth address \"%{public}@\" is invalid!", (uint8_t *)a2);

  sub_1000DE5DC();
}

void sub_100715194()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Trying to create new device from empty address!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007151C0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_100566070();
  sub_100072794(v2, v3, v4, 5.8382e-34);
  sub_1002A82D0((void *)&_mh_execute_header, "Now tracking new address \"%{public}@\" as device \"%{public}s\"", v5, v6);
  if (*(char *)(v1 + 23) < 0)
    sub_10066A994();

  sub_1000DE5DC();
}

void sub_10071520C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "UUID generation collision - UUID \"%{public}s\" already exists!", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100715258()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_10066A978();
  sub_10066A960(v1, v2, v3, 5.8382e-34);
  sub_100347688((void *)&_mh_execute_header, "Address \"%{public}@\" was not in the address map, but WAS in the device map as device \"%{public}@\"", v4, v5);

  sub_1000DE5DC();
}

void sub_100715294()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_10066A978();
  sub_10066A960(v1, v2, v3, 5.8382e-34);
  sub_1002B54E8((void *)&_mh_execute_header, "Address \"%{public}@\" is already associated with device \"%{public}@\", cannot use alternate identifier", v4, v5);

  sub_1000DE5DC();
}

void sub_1007152D0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_100566070();
  sub_100072794(v2, v3, v4, 5.8382e-34);
  sub_1002B54E8((void *)&_mh_execute_header, "Already tracking address \"%{public}@\" as device \"%{public}s\", cannot re-assign a new identifier to it", v5, v6);
  if (*(char *)(v1 + 23) < 0)
    sub_10066A994();

  sub_1000DE5DC();
}

void sub_10071531C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot specify an identifier and not set create and requiresProtectedCache to true", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715348()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to load device caches - device information will not be persisted", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715374()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002B5510();
  sub_100072794(v1, v2, v3, 5.8382e-34);
  sub_1002A82D0((void *)&_mh_execute_header, "Unset tag: \"%{public}@\" for valid classicDevice %{public}s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007153B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002B5510();
  sub_100072794(v1, v2, v3, 5.8382e-34);
  sub_1002B54E8((void *)&_mh_execute_header, "Unable to unset tag: \"%{public}@\" for valid classicDevice %{public}s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007153FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;
  int v5;
  _QWORD *v6;

  sub_1002B5510();
  if (v5 >= 0)
    v6 = v1;
  else
    v6 = (_QWORD *)*v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v6;
  sub_100072744((void *)&_mh_execute_header, v4, v2, "LeDeviceManager::persistDevice - could not find device for UUID %s", v3);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100715454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "Attempting to persist non-paired device \"%{public}s\" before the protected cache has been loaded.", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007154A0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "No address for unknown device \"%{public}@\"", v2);
  sub_1000726A0();
}

void sub_100715504(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  sub_1002B54DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "Device \"%{public}@\" has no address!", (uint8_t *)a2);

  sub_1000DE5DC();
}

void sub_10071554C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1002F7664((void *)&_mh_execute_header, a2, a3, "Is incompatible BLE HID device connected: %u", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_1007155B4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002B5510();
  sub_100072794(v1, v2, v3, 4.8752e-34);
  sub_1002A82D0((void *)&_mh_execute_header, "Set tag: \"%{public}s\" for valid classicDevice %{public}s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007155F8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002B5510();
  sub_100072794(v1, v2, v3, 4.8752e-34);
  sub_1002B54E8((void *)&_mh_execute_header, "Unable to set tag: \"%{public}s\" for valid classicDevice %{public}s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_10071563C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "External Lock devices got set with wrong tag HasTS", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715668()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "No device found for identifier %{public}@", v2);
  sub_1000726A0();
}

void sub_1007156CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid property", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007156F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "device not found", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715724()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072784((void *)&_mh_execute_header, v0, v1, "SetInitPHYs invalid initPHYs=%x", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072784((void *)&_mh_execute_header, v0, v1, "SetPHYOptions invalid PHYOptions=%x", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007157E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1002F7664((void *)&_mh_execute_header, a2, a3, "updateBTClock =%x", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10071584C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "aDevice";
  sub_1002B54DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "Assertion failed: %{public}s", a1);
}

void sub_100715890()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;

  sub_100097230();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Device cache size exceeded limit %d (fDeviceLRUList size %d)", v2, 0xEu);
  sub_1000726A0();
}

void sub_10071590C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Unexpected null LeDeviceManager::indexLeDevice parameter", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715938(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "it != fDeviceLRUList.end()";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1007159AC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to create a peripheral with identifier \"%{public}@\"", v2);
  sub_1000726A0();
}

void sub_100715A10()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_10066A978();
  sub_10066A960(v1, v2, v3, 5.8382e-34);
  sub_1002A82D0((void *)&_mh_execute_header, "Now tracking new address \"%{public}@\" as device \"%{public}@\"", v4, v5);

  sub_1000DE5DC();
}

void sub_100715A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_1002B54DC((void *)&_mh_execute_header, v7, (uint64_t)v7, "Trying to set a resolved address that is neither public nor static for device \"%{public}s\"", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100715A98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "cacheEvictedDeviceIfNeeded we need at least one old device to remove at this point", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715AC4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to get Firmware version for device %{public}@", v2);
  sub_1000726A0();
}

void sub_100715B28()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1000EEFE4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "createLexiconWithLocale Failed to create %@ LXLexiconRef: %@", v2, 0x16u);
  sub_1000726A0();
}

void sub_100715BA4(unsigned __int16 a1, unsigned __int8 *a2, uint8_t *buf, os_log_t log)
{
  int v4;

  v4 = *a2;
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "_retrieveRecentDevicesInfo array count %d larger than max %d", buf, 0xEu);
}

void sub_100715C00()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_10066A988(__stack_chk_guard);
  sub_100410038();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "[BTGlobalTCCNames] Failed to detach session %@ with error %d", v2, 0x12u);
  sub_1000726A0();
}

void sub_100715C7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "[BTGlobalTCCNames] Failed to get session from sessionHandle", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715CA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "[BTGlobalTCCNames] Failed to create session", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715CD4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10066A988(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "[BTGlobalTCCNames] session %@ is already using this manager", v2);
  sub_1000726A0();
}

void sub_100715D38()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10066A988(__stack_chk_guard);
  sub_100410038();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "[BTGlobalTCCNames] Failed to detach session %@", v2);
  sub_1000726A0();
}

void sub_100715D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "[BTGlobalTCCNames] Failed to stop scanning with result :%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715DFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_DEVMGR_GetLeRemoteSupportedFeatures fails with %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "OI_DEVMGR_GetLeRemoteVersioning fails with %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715EBC(_QWORD *a1)
{
  do
  {
    if (*((char *)a1 - 9) < 0)
      operator delete((void *)*(a1 - 4));
    a1 -= 4;
  }
  while (a1 != qword_100993F58);
}

void sub_100715EFC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_10052CF60((void *)&_mh_execute_header, v0, v1, "LeObserver Power : We're going to sleep!", v2);
  sub_10007266C();
}

void sub_100715F2C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1006870D4();
  sub_1002A827C((void *)&_mh_execute_header, v0, (uint64_t)v0, "ADVBUFF(%{public}@): Failed to disable adv Buffer : %d", v1);
  sub_1000726A0();
}

void sub_100715FBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid address", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100715FE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid encryption key specified", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716014()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to convert address to string", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716040()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_10052CF60((void *)&_mh_execute_header, v0, v1, "Configuration Timer Already Started", v2);
  sub_10007266C();
}

void sub_100716070()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "Controller configuration took: %d ms", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007160D0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_10052CF60((void *)&_mh_execute_header, v0, v1, "aopReceivedDeviceFoundEvent: inDeviceEntry not valid", v2);
  sub_10007266C();
}

void sub_100716100()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring invalid data length %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716164(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = sub_100021770(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = 138412290;
  v7 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v5, "aopReceivedDeviceFoundEvent: Bluetooth address \"%@\" is invalid!", (uint8_t *)&v6);

  sub_100347680();
}

void sub_1007161F0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 68157954;
  v3[1] = 43;
  v4 = 2096;
  v5 = a1;
  sub_10032187C((void *)&_mh_execute_header, a2, a3, "aopReceivedDeviceFoundEvent: AOPBTDeviceEntry entry, entry_buff:%.43P", (uint8_t *)v3);
  sub_1000726A0();
}

void sub_100716268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "LeObserver::FoundCb _LE_GAP_ParseAppleManufacturingData returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007162C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "enableMatchTable(Proximity Pairing) failed with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716328()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "enableMatchTable(All Types) failed with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716388()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "enableMatchTable(People Discovery) failed with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007163E8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to create Match Table for type %d with result %d", 67109376, v2);
  sub_1000726A0();
}

void sub_100716454()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to destroy Match Table for type %d with result %d", 67109376, v2);
  sub_1000726A0();
}

void sub_1007164C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "match table for type %d does not exists", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716524()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to send type %d match table parameter command : %d", 67109376, v2);
  sub_1000726A0();
}

void sub_10071658C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_1004E8B38();
  sub_1002A8220((void *)&_mh_execute_header, v0, v1, "Failed to send type %d match table config command with match table extended filter config command: %d", 67109376, v2);
  sub_1000726A0();
}

void sub_1007165F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "createAOPBTBufferMatchTable: getNextMatchRuleAvailableHandle returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716654()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_10052CF60((void *)&_mh_execute_header, v0, v1, "Creating an AOP match table with all types", v2);
  sub_10007266C();
}

void sub_100716684()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "ADVBUFF Unknown buffer size %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007166E8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_1002FD8D4((void *)&_mh_execute_header, v2, (uint64_t)v2, "Controller failed to read ADV buffers", v3);
}

void sub_100716714()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1006870D4();
  sub_1002A827C((void *)&_mh_execute_header, v0, (uint64_t)v0, "ADVBUFF(%{public}@): Failed to enable adv Buffer : %d", v1);
  sub_1000726A0();
}

void sub_1007167A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "enableMatchActionRulesBuffering returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716804()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "configureMatchActionRulesTableInternal returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716864()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10009720C();
  sub_1002FD8D4((void *)&_mh_execute_header, v0, v1, "We were not expecting to get anything right now", v2);
  sub_10007266C();
}

void sub_100716894()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to create Match Action Rules table with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007168F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to enable and resume: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716954()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send match table parmater command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007169B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "fMatchActionTableRules numOfRules=%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716A14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to pause: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716A74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No buffers to read, skipping", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716AA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Already reading buffers, skipping", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716ACC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "AOPBTProxCtxBuffer failed to pause Proximity Pairing match table with result %d, skipping read", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716B2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "AOPBTProxCtxBuffer failed to pause All Types match table with result %d, skipping read", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716B8C(unsigned __int8 a1, uint64_t a2, NSObject *a3)
{
  int v3;

  LOWORD(v3) = 1024;
  HIWORD(v3) = a1;
  sub_1002A8220((void *)&_mh_execute_header, a2, a3, "Match Table handle:%d type:%d out of range", 67109376, v3);
  sub_1000726A0();
}

void sub_100716C00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "AOPBTADPDBuff Failed to pause match table with result %d, skipping read", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716C60(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[8];

  sub_1006730E0(a1, 1);
  sub_100097230();
  sub_100687094((void *)&_mh_execute_header, a2, v3, "enableMatchActionRulesBuffering returned %d", v4);
  sub_1000726A0();
}

void sub_100716CDC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  uint8_t v6[8];
  __int16 v7;
  int v8;

  sub_1006755B0(a1);
  sub_100097230();
  v7 = 1024;
  v8 = v4;
  sub_1006493CC((void *)&_mh_execute_header, a3, v5, "Match Buffer readMatchBuffers returned %d, fMatchBufferExpectedEntries:%d", v6);
  sub_100347680();
}

void sub_100716D68(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;

  v3 = *(_DWORD *)(a1 + 268);
  v4 = *(_DWORD *)(a1 + 272);
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  sub_1006493CC((void *)&_mh_execute_header, a2, a3, "BLEScanStat: PageScan totalBTSCPageScanTime %d totalBTSCPageScanNumIDPackets %d", (uint8_t *)v5);
  sub_1000726A0();
}

void sub_100716DE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error reading getScanStats %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "BLEScanStat: numScanRequests increments %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716EA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "BLEScanStat: numPriorityCriticalScanRequests increments %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716F04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "BLEScanStat: numRangeScanRequests increments %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to create ADV Buffer NO with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot create NO OjectDiscovery buffer, not enough free buffers", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100716FF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to create ADV Buffer wild with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717050(uint64_t *a1, int *a2, uint64_t a3, NSObject *a4)
{
  uint64_t *v5;
  int v6;

  if (*((char *)a1 + 23) >= 0)
    v5 = a1;
  else
    v5 = (uint64_t *)*a1;
  v6 = *a2;
  *(_DWORD *)a3 = 136446466;
  *(_QWORD *)(a3 + 4) = v5;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v6;
  sub_10032187C((void *)&_mh_execute_header, a4, a3, "ScanAgentType for %{public}s is %d", (uint8_t *)a3);
  if (*((char *)a1 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007170C4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 138543618;
  sub_100262284();
  sub_1002A827C((void *)&_mh_execute_header, v0, v1, "ADVBUFF(%{public}@): Failed to configure buffer adv buffer: %d", (uint8_t *)v2);
  sub_1000726A0();
}

void sub_100717134()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1006870D4();
  sub_1002A827C((void *)&_mh_execute_header, v0, (uint64_t)v0, "ADVBUFF(%{public}@): Failed to configure buffer adv buffer: %d", v1);
  sub_1000726A0();
}

void sub_1007171C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to enable and pause: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "getNextMatchRuleAvailableHandle returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717284()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "ClearDuplicateFilterCache failed due to scan not in progress", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007172B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "ClearDuplicateFilterCache failed due to invalid packeType", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007172DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "clearDuplicateFilterCache failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071733C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "removeDuplicateFilterEntry failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071739C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "removeMultipleLEEntriesFromDuplicateFilter failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007173FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "addEnhancedMatchingRule failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071745C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "removeEnhancedMatchingRule failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007174BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "wipeMatchingRuleFilter failed with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071751C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "wipeMatchingRuleFilter failed with result %{bluetooth:OI_STATUS}u ", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071757C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Scan started improperly with result %{bluetooth:OI_STATUS}u -- now what?", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007175DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10071764C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to stop scanning with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007176AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to start scanning with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071770C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_1002F7674((void *)&_mh_execute_header, v7, (uint64_t)v7, "Agents: %{public}s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100717758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_1002F7674((void *)&_mh_execute_header, v7, (uint64_t)v7, "%{public}s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007177A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "ScanCoreBLEConnectionScanStat: MainCore is used for LE Connection %d times", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717804()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "ScanCoreBLEConnectionScanStat: ScanCore is used for LE Connection %d times", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717864()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "Set GHSDeviceType: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007178C4()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1006870EC();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x38u);
  sub_10068710C();
}

void sub_100717998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to decrypt adv: %{public}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007179F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "### Decrypt AccessoryStatus ADV failed: %{public}s, %{bluetooth:OI_STATUS}u", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100717A40()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_1002A8288();
  sub_10007284C(v1, v2, v3, 4.8752e-34);
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "### Decrypt FindMyAccessory ADV failed: %{public}s, %{bluetooth:OI_STATUS}u", v5);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100717A88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_1002F7674((void *)&_mh_execute_header, v7, (uint64_t)v7, "Decrypt AccessoryStatus ADV failed: no key, %{public}s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100717AD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Couldn't find IRK for subtype 8", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717B00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Scan stopped improperly with result %{bluetooth:OI_STATUS}u -- restart", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717B60(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v2[0] = 67109632;
  v2[1] = 18;
  v3 = 2048;
  v4 = a1;
  v5 = 2048;
  v6 = 29;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error parsing puck %d, invalid size %zu, we can only fit %zu bytes", (uint8_t *)v2, 0x1Cu);
  sub_100347680();
}

void sub_100717BEC()
{
  NSObject *v0;
  int v1;
  int v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  int v6;
  int v7;
  int v8;
  uint8_t v9[8];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  sub_1002BC094();
  v5 = *(_QWORD *)&v4 & (v3 >> 40);
  if (v5)
    v6 = 0;
  else
    v6 = v1;
  v10 = 1024;
  if (v5 == 64)
    v7 = v1;
  else
    v7 = 0;
  v11 = v7;
  v12 = 1024;
  v13 = v6;
  if (v5 == 192)
    v8 = v1;
  else
    v8 = 0;
  v14 = 1024;
  v15 = v2;
  v16 = 1024;
  v17 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "leSensorStateChanged: No uuid found for a device with address type valid? %d, resolvable? %d, non-resolvable? %d, public? %d, static? %d", v9, 0x20u);
  sub_100347680();
}

void sub_100717CD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send match buffer config command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717D34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Cannot create more than %d match tables", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100717DA0()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1004E8B38();
  sub_1006870EC();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xEu);
  sub_1000726A0();
}

void sub_100717E10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "MATCH TABLE It has same type (%d)", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717E70(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 0;
  sub_100687094((void *)&_mh_execute_header, a3, (uint64_t)a3, "MATCH TABLE first empty unused and uninitialized handle:%d", a1);
}

void sub_100717EAC(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_10052CF60((void *)&_mh_execute_header, v2, (uint64_t)v2, "MATCH TABLE It is not created", v3);
}

void sub_100717ED8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_1002FD8D4((void *)&_mh_execute_header, v2, (uint64_t)v2, "A Used slot has to have a size and a type", v3);
}

void sub_100717F04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to destroy Proximity Pairing Match Table with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to create Proximity Pairing Match Table with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100717FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to destroy All types Match Table with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718024()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to create all types Match Table with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718084()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to destroy People Discovery Match Table with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007180E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to create People Discovery Match Table with result %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718144()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "addScanFilterByUUIDWithBlobAndMask failed %{public}s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100718190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;

  sub_10007276C();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_1002A8194(v2, v6, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v7, (uint64_t)v7, "addScanFilterByUUID failed %{public}s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007181DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1002BC094();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "Setting duplicate filter bypass config to 0x%08x", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718240(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Exceeded address matching list size. Matching all devices", v3);
}

void sub_10071826C()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_100410038();
  sub_1006870EC();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
  sub_1000726A0();
}

void sub_100718308()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_100410038();
  sub_1006870EC();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x20u);
  sub_100347680();
}

void sub_1007183B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "enableADVBuffering returned %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718418(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10007275C((void *)&_mh_execute_header, a1, a3, "Controller failed to read ADV buffers for %{public}@", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_100718488(os_log_t log)
{
  _DWORD v1[2];
  __int16 v2;
  int v3;

  v1[0] = 67109376;
  v1[1] = 0;
  v2 = 1024;
  v3 = 1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected combination of enabled cores: scanLPCoreEnable %d, isScanCoreEnabled %d", (uint8_t *)v1, 0xEu);
  sub_1000726A0();
}

void sub_10071850C(unsigned __int16 a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1006870A0((double)a1);
  sub_1006870FC((void *)&_mh_execute_header, v1, v2, "Override full duty cycle scan parameter %.2fms/%.2fms by %.2fms/%.2fms", v3, v4, v5, v6, v7);
  sub_10068710C();
}

void sub_100718574(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_10052CF60((void *)&_mh_execute_header, v2, (uint64_t)v2, "allowDups not used because it hasPuckFilter and hasNoServiceUUID", v3);
}

void sub_1007185A0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Not supported config on mac", v3);
}

void sub_1007185CC(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_10006887C(a1, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136446210;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "addScanFilterByUUID failed %{public}s", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_100718678()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410038();
  sub_1002F7674((void *)&_mh_execute_header, v0, v1, "fAllUuids.size:%lu", v2);
  sub_1000726A0();
}

void sub_1007186E0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100262274(a1, a2);
  sub_100072750((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to add rule", v3);
}

void sub_10071870C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410038();
  sub_1002F7674((void *)&_mh_execute_header, v0, v1, "fEnhancedMatchRules %@", v2);
  sub_1000726A0();
}

void sub_100718774(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_1002F7674((void *)&_mh_execute_header, a2, a3, "fFilterPeripherals.size:%lu", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1007187DC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410038();
  sub_1002F7674((void *)&_mh_execute_header, v0, v1, "fZones %@", v2);
  sub_1000726A0();
}

void sub_100718844()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410038();
  sub_1002F7674((void *)&_mh_execute_header, v0, v1, "Dispatching controllerZoneAndFilterConfigComplete somethingChanged:%{public}s", v2);
  sub_1000726A0();
}

void sub_1007188C0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100410038();
  sub_1002F7674((void *)&_mh_execute_header, v0, v1, "Executing controllerZoneAndFilterConfigComplete fControllerConfigInProgress:%{public}s", v2);
  sub_1000726A0();
}

void sub_100718944(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "TDS matching disabled per <rdar://problem/55838471>", v1, 2u);
}

void sub_100718984(uint64_t a1, char *a2, uint64_t a3, NSObject *a4)
{
  char *v5;

  if (a2[23] >= 0)
    v5 = a2;
  else
    v5 = *(char **)a2;
  *(_DWORD *)a3 = 136446210;
  *(_QWORD *)(a3 + 4) = v5;
  sub_1002F7674((void *)&_mh_execute_header, a4, a3, "No match found for device \"%{public}s\"", (uint8_t *)a3);
  if (a2[23] < 0)
    operator delete(*(void **)a2);
}

void sub_1007189F0(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100072894((void *)&_mh_execute_header, (int)a2, a3, "Invalid zone (nil or 0 length).", a1);
}

void sub_100718A20()
{
  os_log_t v0;
  uint8_t v1[14];
  int v2;

  sub_10068CBA8(__stack_chk_guard);
  sub_10052CF4C();
  v2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "agent %s cannot scan, device never unlocked, entry.scanBeforeFirstUnlock:%d", v1, 0x12u);
  sub_1000726A0();
}

void sub_100718A98()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  int v3;
  __int16 v4;
  int v5;

  sub_10068CBA8(__stack_chk_guard);
  sub_10052CF4C();
  v3 = 1;
  v4 = v0;
  v5 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "agent %s cannot scan, deviceLocked:%d, entry.scanWhenLocked:%d", v2, 0x18u);
  sub_1000726A0();
}

void sub_100718B1C()
{
  NSObject *v0;
  uint64_t v1;
  _QWORD *v2;
  int v3;
  int v4;
  _QWORD *v5;

  sub_10068CBA8(__stack_chk_guard);
  if (v3 < 0)
    v2 = (_QWORD *)*v2;
  v4 = 136315138;
  v5 = v2;
  sub_1002F7674((void *)&_mh_execute_header, v0, v1, "agent %s cannot scan, disabled/leech", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_100718B8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Ignoring serialized OOB data of invalid length %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718BEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "still getting errSecUpgradePending when reading non connectable address", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718C18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "still getting errSecUpgradePending when calling readRootKeys", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718C44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not generated Non Connectable IRK : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718CA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set new identity non connectable root!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718CD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set new non connectable static random address", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718CFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "TTD: Could not generated Non Connectable IRK : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718D5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "TTD: Could not generated DHK : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718DBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "TTD: Could not generated IRK : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718E1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "still getting errSecUpgradePending when calling cloudNonce", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718E48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Generated new root keys while paired to other devices, please file a radar to Bluetooth (new bugs) | iOS", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718E74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "still getting errSecUpgradePending when reading local static address", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718EA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set new local static random address", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718ECC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Generating new local static random", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718EF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not generated DHK : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718F58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Could not generated IRK : %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718FB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set new Cloud Nonce", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100718FE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Generating new Cloud Nonce", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719010()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Failed to set Cloud Private!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071903C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Generating new Cloud Private and Cloud Public key", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719068()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "still getting errSecUpgradePending when calling read cloudPublicKey", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719094()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set new encryption root!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007190C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Generating new encryption root", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007190EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set new identity root!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719118()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Generating new identity root", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "readTEKsFromKeychain empty kContactTracingTEKBuffer, will generate a new TEK when advertising starts", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719170()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "readTEKsFromKeychain kContactTracingTEKBuffer invalid size, will generate a new TEK when advertising starts", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071919C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Diagnostics mode is ON, skipping keychain", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007191C8()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  sub_100649408();
  *v1 = 138543362;
  *v3 = v2;
  sub_1002B54DC((void *)&_mh_execute_header, v5, (uint64_t)v3, "Failed to retrieve UUID for paired address %{public}@", v4);

  sub_1000DE5DC();
}

void sub_100719210()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  sub_100649408();
  *v1 = 138543362;
  *v3 = v2;
  sub_100072744((void *)&_mh_execute_header, v5, (uint64_t)v3, "Removing incomplete pairing info for device %{public}@", v4);

  sub_1000DE5DC();
}

void sub_100719258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136446210;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Found missing/bad keys for device %{public}s, dropping pairing info", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_1007192A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_1002B54DC((void *)&_mh_execute_header, v3, (uint64_t)v3, "Failed to retrieve UUID for paired address %{public}@", v4);

  sub_1000DE5DC();
}

void sub_1007192E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Peer device using a debug LTK, removing.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719314()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Error for adding IRK before device: %{public}@ with BTResult: %d");
  sub_1000726A0();
}

void sub_100719374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed registration for MKB first unlock notification with error : %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007193D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set ourselves bondable with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719434()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register state change callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register pairing callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007194F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register security callbacks with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719554()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set root keys with result %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007195B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Reach maximum IRK devices %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100719620()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "We don't have any root keys, so we can't pair.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071964C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to pair device \"%{public}@\" with result %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_1007196AC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Device \"%{public}@\" isn't connected!", v2);
  sub_1000726A0();
}

void sub_100719710()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to set CTKD for device %{public}@ as it is unknown", v2);
  sub_1000726A0();
}

void sub_100719774()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to accept pairing for device \"%{public}@\" with result %{bluetooth:OI_STATUS}u - cancelling...");
  sub_1000726A0();
}

void sub_1007197D4()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to cancel pairing to device \"%{public}@\" with result %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_100719834()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to generate OOB data for device \"%{public}@\" with result %{bluetooth:OI_STATUS}u");
  sub_1000726A0();
}

void sub_100719894()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to enable OOB pairing for device \"%{public}@\"", v2);
  sub_1000726A0();
}

void sub_1007198F8()
{
  uint64_t v0;
  os_log_t v1;

  sub_1002FD8BC();
  sub_1002FD8A8((void *)&_mh_execute_header, v0, v1, "Failed to disable OOB pairing for device \"%{public}@\" with status %d");
  sub_1000726A0();
}

void sub_100719958(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136446210;
  v4 = "fInProgressKeys.find(device) == fInProgressKeys.end()";
  sub_1002B54DC((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_1007199CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "We received BT_ERROR_PAIRING_ALREADY_PAIRED but could not find an original. Thats strange.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_1007199F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;
  uint64_t *v6;

  sub_100649408();
  if (*((char *)v1 + 23) >= 0)
    v6 = v1;
  else
    v6 = (uint64_t *)*v1;
  *(_DWORD *)v2 = 136446466;
  *(_QWORD *)(v2 + 4) = v6;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v3;
  sub_1002A827C((void *)&_mh_execute_header, v5, v3, "Pairing failed to device \"%{public}s\" with error %{bluetooth:OI_STATUS}u", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100719A64(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  v5 = a1;
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = v5;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Received remote address but have no IRK for device \"%{public}@\"", (uint8_t *)a2, 0xCu);

  sub_1000FB314();
}

void sub_100719AC8(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  id v7;

  v7 = a2;
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_FAULT, "Resolved address we got on pairing completion (%{public}@) doesn't match the one that was distributed (%{public}@)!", (uint8_t *)a3, 0x16u);

  sub_1000FB314();
}

void sub_100719B44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007280C((void *)&_mh_execute_header, v0, v1, "Attempting to remove cloud paired device without iCloud identifier!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_100719B70(char *a1, _QWORD *a2, NSObject *a3)
{
  int v3;
  _QWORD *v4;

  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315138;
  v4 = a2;
  sub_100072744((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to find locally paired device with iCloud identifier \"%s\"", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_100719BE8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Found multiple paired devices referencing address \"%{public}@\" - leaving key(s)", v4);

  sub_1000DE5DC();
}

void sub_100719C28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Request to renew private mode by : %d seconds", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100719C90()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "FindMy device %@ does not have a valid LTK for its current address", v2);
  sub_1000726A0();
}

void sub_100719CF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a1, a3, "Clearing database cache for device status %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_100719D60()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Device %{public}@ is already LE Paired, cannot add temporary keys", v4);

  sub_1000DE5DC();
}

void sub_100719DA0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "LE Pairing in progress for device %{public}@", v4);

  sub_1000DE5DC();
}

void sub_100719DE0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_1002B54DC((void *)&_mh_execute_header, v3, (uint64_t)v3, "Device \"%{public}@\" wasn't being tracked by device manager!", v4);

  sub_1000DE5DC();
}

void sub_100719E20()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_1002B54DC((void *)&_mh_execute_header, v3, (uint64_t)v3, "Device \"%{public}@\" wasn't being tracked by LE Connection Manager!", v4);

  sub_1000DE5DC();
}

void sub_100719E60()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8381e-34);
  sub_1002B54DC((void *)&_mh_execute_header, v3, (uint64_t)v3, "Device \"%{public}@\" requested security but wasn't being tracked by device manager!", v4);

  sub_1000DE5DC();
}

void sub_100719EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136446210;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Denying pairing request from device \"%{public}s\" as there's no one to handle the request", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_100265C88();
  sub_1000DE5DC();
}

void sub_100719EF0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_100649408();
  sub_100337DB4(v1, v2, 5.8382e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = v4;
  sub_1002A827C((void *)&_mh_execute_header, v6, v4, "Failed to cancel pairing to device \"%{public}@\" with result %{bluetooth:OI_STATUS}u", v5);

  sub_1000DE5DC();
}

void sub_100719F40(const unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_1003D2DB4(a1, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136446210;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Couldn't find pairing agent to handle request for device \"%{public}s\" - cancelling pairing", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_100719FEC(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100021770(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_1000EEFE4();
  sub_1002B54DC((void *)&_mh_execute_header, a2, v5, "Device \"%{public}@\" requested pairing but wasn't being tracked by device manager!", v6);

}

void sub_10071A078()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "ALERT_LOCALIZED_MESSAGE_KEY validation failed: %@", v2);
  sub_1000726A0();
}

void sub_10071A0DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "User responded with unknown response.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A108()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Device %{public}@ is already paired and bonded, cannot create a new pairing record", v2);
  sub_1000726A0();
}

void sub_10071A16C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Device %{public}@ is already in pairing process, cannot create a new pairing record", v2);
  sub_1000726A0();
}

void sub_10071A1D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set tek buffer length, res = %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A230()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to set tek buffer, res = %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A290(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000726A8((void *)&_mh_execute_header, a2, a3, "storeTEKsInKeychain fTEKArray:%@", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10071A2F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000726A8((void *)&_mh_execute_header, a2, a3, "invalidateCurrentKey new fTEKArray:%@", a5, a6, a7, a8, 2u);
  sub_1000726A0();
}

void sub_10071A360(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;

  v2[0] = 68157954;
  v2[1] = 21;
  v3 = 2096;
  v4 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "invalidateCurrentTEK new TEK:%.21P", (uint8_t *)v2, 0x12u);
  sub_1000726A0();
}

void sub_10071A3E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "invalidateCurrentTEK previous TEK rolling period delta:%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A440()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "invalidateCurrentTEK current key already invalid, or missing", v1, 2u);
  sub_10007266C();
}

void sub_10071A478()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_1002A82B8();
  sub_1006A7964((void *)&_mh_execute_header, v0, v1, "maintainTEKList currentInterval:%d oldestInterval:%d", v2, v3);
  sub_1000726A0();
}

void sub_10071A4D8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;

  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *(_DWORD *)(a2 + 32);
  sub_1006A7964((void *)&_mh_execute_header, a2, a3, "isCurrentTEKValid lastActivePeriod:%d fEKRollingPeriod:%d", 67109376, v3);
  sub_1000726A0();
}

void sub_10071A550()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_1002F7664((void *)&_mh_execute_header, v0, v1, "debugFillTEKHistory pastDays:%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A5B0()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1000EEFE4();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "addTEK tek:%@ fTEKArray:%@", v2, 0x16u);
  sub_1000726A0();
}

void sub_10071A630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Cannot load payload payloadBytesLength=%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A690()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Cannot store payload payloadBytesLength=%d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A6F0()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1002A82B8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Known keys are up to 16 bytes for now. %d is too large for type %d.", v1, 0xEu);
  sub_1000726A0();
}

void sub_10071A760()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "PowerLogger not available", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A78C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(_QWORD *)(a1 + 40) = v2;
    operator delete(v2);
  }
}

void sub_10071A7A4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_1004B5F64((void *)&_mh_execute_header, a2, a3, "Unable to extract country code plist. %@", (uint8_t *)a2);

}

void sub_10071A7EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000727FC((void *)&_mh_execute_header, a1, a3, "CountryCode: Notifying Listeners", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10071A81C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000727FC((void *)&_mh_execute_header, a1, a3, "CountryCode: invoking GEO for location", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10071A84C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000727FC((void *)&_mh_execute_header, a1, a3, "CountryCode: update not needed", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10071A87C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register WiAP Sink v2 SDP service record - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A8DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register SDP service record - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A93C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to register RFCOMM server - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A99C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot connect to NULL device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A9C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No rfcomm channel found for this profile", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071A9F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Wireless IAP connection failed - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071AA54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error retrieving device from handle", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071AA80(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void **v4;
  void *__p[2];
  char v6;
  int v7;
  void **v8;

  sub_10043E5F8(a1, __p);
  if (v6 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v7 = 136446210;
  v8 = v4;
  sub_100072744((void *)&_mh_execute_header, a2, v3, "Failed to open serial port for device %{public}s", (uint8_t *)&v7);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_10071AB2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot write data to NULL device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071AB58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cannot read from NULL device", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071AB84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to send data to BT device - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071ABE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Invalid write - result was %{bluetooth:OI_STATUS}u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071AC44()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000EEFE4();
  sub_1000727B8((void *)&_mh_execute_header, v0, v1, "bundleId \"%@\"is not in the applicationMap. Could not set isAlive: %s");
  sub_1000726A0();
}

void sub_10071ACC8(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "Application \"%{public}s\" wasn't registered!", v3);
}

void sub_10071AD00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Cancelling Launch Attempt, Retry Limit Reached", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071AD2C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "bundleId \"%@\"is not in the applicationMap. Could not complete application launch path", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_10071AD98(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Failed to lookup the process ID of %{public}@", (uint8_t *)&v4);
  sub_1000726A0();
}

void sub_10071AE04(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_1000727B8((void *)&_mh_execute_header, a2, a3, "Failed To Launch Application %{public}@ Error %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_1000726A0();
}

void sub_10071AE78(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "No pid for bundle \"%{public}s\"", v3);
}

void sub_10071AEB0(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "Attempting to take process assertion for untracked process \"%{public}s\"", v3);
}

void sub_10071AEE8(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "Unable to acquire process assertion for application \"%{public}s\"", v3);
}

void sub_10071AF20()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate format for LE_POWER_OFF_HEADER: %@", v2);
  sub_1000726A0();
}

void sub_10071AF84(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to create power notification for application \"%{public}s\"", v3);
}

void sub_10071AFBC(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to create power notification run loop for application \"%{public}s\"", v3);
}

void sub_10071AFF4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate format for LE_DENYLIST_ENABLED_HEADER: %@", v2);
  sub_1000726A0();
}

void sub_10071B058()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate UserNotificationTypeDeviceDisconnection format string: %@", v2);
  sub_1000726A0();
}

void sub_10071B0BC(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to create app notification for application \"%{public}s\"", v3);
}

void sub_10071B0F4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100337DB4(a1, a2, 4.8751e-34);
  sub_100072744((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to create app notification run loop for application \"%{public}s\"", v3);
}

void sub_10071B12C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received app launch notification callback for unknown notification - ignoring...", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B158()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10009720C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unsupported pairing type for pairing notification", v1, 2u);
  sub_10007266C();
}

void sub_10071B190(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  sub_100337DB4((uint64_t)a1, a2, 5.7779e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Failed to create pairing notification for device \"%@\"", v4);

}

void sub_10071B1D8(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  sub_100337DB4((uint64_t)a1, a2, 5.7779e-34);
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Failed to create run loop source for device \"%@\"", v4);

}

void sub_10071B220()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate JUST_WORKS_MESSAGE format string: %@", v2);
  sub_1000726A0();
}

void sub_10071B284()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate JUST_WORKS_MESSAGE_HID_OLD format string: %@", v2);
  sub_1000726A0();
}

void sub_10071B2E8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate PASSKEY_DISPLAY_MESSAGE format string: %@", v2);
  sub_1000726A0();
}

void sub_10071B34C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate PASSKEY_ENTRY_MESSAGE format string: %@", v2);
  sub_1000726A0();
}

void sub_10071B3B0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to validate NUMERIC_MESSAGE format string: %@", v2);
  sub_1000726A0();
}

void sub_10071B414()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received pairing notification callback for unknown notification - ignoring...", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B440()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "displayAirWaveLaunchNotification: Ignoring. An alert was shown less than 24 hours ago.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B46C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "displayAirWaveLaunchNotification: Invalid productID: %u", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B4CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "showFoundAccessoryCrashAlert: Invalid productID: %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B52C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "showFoundAccessoryCrashAlert: No response", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B558()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "showFoundAccessoryLogAlert: called with no filenames", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B584()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "showFoundAccessoryLogAlert: Invalid Product ID: %lu", v2);
  sub_1000726A0();
}

void sub_10071B5E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "showFileRadarNotification: Unhandled reason %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B648()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "openTapToRadarWithAccessoryLogs: Unhandled reason %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B6A8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "openTapToRadarWithAccessoryLogs: Failed to launch TTR with error %@", v2);
  sub_1000726A0();
}

void sub_10071B70C(char *a1, uint8_t *buf, os_log_t log)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create device from address \"%{public}s\"", buf, 0xCu);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_10071B77C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on DisconnectClassicDevice", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B7A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on ClassicPairStateRequest", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B7D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on ClassicPairStateResponse", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B800()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid link key on StoreClassicLinkKeyRequest", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B82C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Device is not valid or already un-paired", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B858()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received StoreClassicLinkKeyRequest, remove magic pairing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B884()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received StoreClassicLinkKeyRequest to trigger unpairing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B8B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on StoreClassicLinkKeyRequest", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B8DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on StoreClassicLinkKeyResponse", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B908(char *a1, _QWORD *a2, os_log_t log)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  _QWORD *v7;

  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 141558275;
  v5 = 1752392040;
  v6 = 2081;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received StoreClassicDeviceSettings for device %{private, mask.hash}s that is not paired", (uint8_t *)&v4, 0x16u);
}

void sub_10071B9A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on StoreClassicDeviceSettings", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B9D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Device not valid or not paired", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071B9FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on ClassicDeviceUnexpectedDisconnection", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BA28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "ConnectClassicDevice: No magnet link UUID", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BA54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on ConnectClassicDevice", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BA80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid device address on LeaEasyPairRequest", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BAAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid rand on LeaStoreBondingInfoRequest", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BAD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid LTK on LeaStoreBondingInfoRequest", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BB04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Received invalid IRK on LeaStoreBondingInfoRequest", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BB30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "UARPDataOverAACP - device doesn't exist!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BB5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "UARPDataOverAACP - Received invalid data from BTLEServer", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BB88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "UARPDataOverAACP - Error allocating memory for uarpData", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BBB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "UARPDataOverAACP - AACPClient::sendUARPData failed", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BBE0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Session is empty in getConnectionUseCase.", v1, 2u);
}

void sub_10071BC20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "WirelessCoexManager not available, not creating service", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BC4C(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, a2, v3, "PurpleCoexManager XPC connection error: %{public}s", v4);
  sub_100072694();
}

void sub_10071BCCC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "PurpleCoexManager Unexpected XPC connection event: %{public}s", v2);
  sub_1000726A0();
}

void sub_10071BD30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "WirelessCoexManager not available, not checking in", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BD5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "WirelessCoexManager not available", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BD88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "UpdateWifiState arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BDB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "UCMBTConnectionScanDutyCycle default", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BDE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "UCMBTConnectionScanDutyCycle kWCMWiFiStateDesiredBtDc_30_40_", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BE0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "UCMBTConnectionScanDutyCycle kWCMWiFiStateDesiredBtDc_30_60_", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BE38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "UCMBTConnectionScanDutyCycle kWCMWiFiStateDesiredBtDc_30_90_", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BE64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "UCMBTConnectionScanDutyCycle kWCMWiFiStateDesiredBtDc_30_300_", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BE90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_1000727FC((void *)&_mh_execute_header, v0, v1, "UCMBTConnectionScanDutyCycle kWCMWiFiStateDesiredBtDc_30_30_", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BEBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Failed to set LE AFH map.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BEE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No arguments passed to set diversity host assisted AFH maps", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BF14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid diversity channel maps", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BF40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid size of the period type array", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071BF6C(unsigned __int8 a1, xpc_object_t xarray, NSObject *a3)
{
  _DWORD v4[2];
  __int16 v5;
  size_t count;

  v4[0] = 67109376;
  v4[1] = a1;
  v5 = 2048;
  count = xpc_array_get_count(xarray);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Invalid size of the period duration array(numPeriods: %d, period count %zu)", (uint8_t *)v4, 0x12u);
  sub_100072694();
}

void sub_10071C000()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Invalid parameters", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C02C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Invalid value of numPeriods: %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10071C094()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "No classic device for %@", v2);
  sub_1000726A0();
}

void sub_10071C0F8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Failed to parse LTE Link Quality mode addr %@", v2);
  sub_1000726A0();
}

void sub_10071C15C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No arguments passed to antenna preference", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C188()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000EEFE4();
  sub_100072744((void *)&_mh_execute_header, v0, v1, "Invalid antenna action %llu", v2);
  sub_1000726A0();
}

void sub_10071C1EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100072710((void *)&_mh_execute_header, a2, a3, "Invalid value of command.numScanFreq: %d", a5, a6, a7, a8, 0);
  sub_10007266C();
}

void sub_10071C254()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Number of Scan Frequencies don't match scan freq array sent", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C280()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SetCoexRxMode arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C2AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SetAWDLActive arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C2D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SetLowWiFiRate arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C304()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SetAWDLRTGActive arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C330()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SetUWB5GHzActive arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C35C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SetNANActive arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C388()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Set5GHzHostAPActive arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C3B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "SetBTCoexParameters arguments missing", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C3E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No arguments passed to setGrantRC2Medium", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C40C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "RC2 is not supported", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C438()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "No arguments passed to setWifiCriticalBuffering", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C464(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "void BT::PurpleCoexManager::SetHRBChannelMap(xpc_object_t)";
  sub_100072744((void *)&_mh_execute_header, a1, a3, "%s, Error: While reading in HRB AFH Map from UCM", (uint8_t *)&v3);
  sub_1000726A0();
}

void sub_10071C4D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Error: UCM message WCMBTSetAntennaRequest received is null", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "PurpleCoexManager Error: SPMI Type 60 Config Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Error: SPMI Type 53 Config Command : %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C5C4()
{
  os_log_t v0;
  uint8_t v1[8];
  __int16 v2;
  int v3;

  sub_100097230();
  v2 = 1024;
  v3 = 144;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "WCMWifiState undefined for window=%d interval=%d", v1, 0xEu);
  sub_1000726A0();
}

void sub_10071C640()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to get connection handle %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C6A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to get Voice connection info, status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C700()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Failed to get ACL connection info, status %d", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C760()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Bandwidth: Audio connection type 0x%1X, is already in the map", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C7C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100097230();
  sub_100072710((void *)&_mh_execute_header, v0, v1, "Bandwidth: Audio Audio connection type 0x%1X, is not in the map", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C820()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Bandwidth: Connection type not in the ActiveAudioConnectionType enum!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C84C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Bandwidth: Audio connection type unknown!!!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C878(uint64_t a1, NSObject *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(_QWORD *)(a1 + 4) = "Null Object!";
  sub_100072744((void *)&_mh_execute_header, a2, a3, "Bandwidth: Error obtaining HFP Audio Device %{public}s", (uint8_t *)a1);
}

void sub_10071C8B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136446210;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Bandwidth: Error obtaining HFP Audio Device %{public}s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
}

void sub_10071C910()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Bandwidth: Error - a second A2DP Audio Connection was received while one was already active.", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C93C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Bandwidth: LEA Hearing device is operating at an unrecognized LEA connection interval", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  sub_10007276C();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100072744((void *)&_mh_execute_header, v3, (uint64_t)v3, "Bandwidth: Received LEA Audio Disconnect for device %s, when none of the LEA Audio profiles were running", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
}

void sub_10071C9C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Bandwidth: Classic device recived was null!", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void sub_10071C9EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10009720C();
  sub_10007265C((void *)&_mh_execute_header, v0, v1, "Bandwidth: LE Connection Recived had a null NSUUID", v2, v3, v4, v5, v6);
  sub_10007266C();
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_BluetoothGATTSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BluetoothGATTSession");
}

id objc_msgSend_BluetoothPowerEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BluetoothPowerEnabled");
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Device");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_PHYOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PHYOptions");
}

id objc_msgSend_UID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UID");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:relativeToURL:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUID128(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID128");
}

id objc_msgSend_UUID128_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID128:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_UUIDWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDWithBytes:length:");
}

id objc_msgSend_UUIDWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDWithData:");
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDWithString:");
}

id objc_msgSend_Wireless(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Wireless");
}

id objc_msgSend__accessoryDaemonEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessoryDaemonEnsureStarted");
}

id objc_msgSend__accessoryDaemonEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessoryDaemonEnsureStopped");
}

id objc_msgSend__accessoryDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessoryDiscoveryEnsureStarted");
}

id objc_msgSend__accessoryDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessoryDiscoveryEnsureStopped");
}

id objc_msgSend__accessoryDiscoveryFoundDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accessoryDiscoveryFoundDevice:");
}

id objc_msgSend__activate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activate:");
}

id objc_msgSend__addBufferedTypesIfNeeded_scanRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addBufferedTypesIfNeeded:scanRequest:");
}

id objc_msgSend__addMfgScanIfNeeded_scanRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addMfgScanIfNeeded:scanRequest:");
}

id objc_msgSend__addServiceUUIDsWithParametersToScanRequestIfNeeded_matchFlags_matchTypes_uuids_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addServiceUUIDsWithParametersToScanRequestIfNeeded:matchFlags:matchTypes:uuids:");
}

id objc_msgSend__addTypeIfNeeded_matchFlags_matchTypes_scanRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:");
}

id objc_msgSend__addTypeWithParamsIfNeeded_matchFlags_matchTypes_scanRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTypeWithParamsIfNeeded:matchFlags:matchTypes:scanRequest:");
}

id objc_msgSend__addUUIDIfNeeded_matchFlags_matchTypes_uuids_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addUUIDIfNeeded:matchFlags:matchTypes:uuids:");
}

id objc_msgSend__addUUIDIfNeededWithParams_matchFlags_matchTypes_scanRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addUUIDIfNeededWithParams:matchFlags:matchTypes:scanRequest:");
}

id objc_msgSend__addressBookToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addressBookToString:");
}

id objc_msgSend__answerCall_uid_behavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_answerCall:uid:behavior:");
}

id objc_msgSend__appearsToBeEmailAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appearsToBeEmailAddress:");
}

id objc_msgSend__bleAddressMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAddressMonitorEnsureStarted");
}

id objc_msgSend__bleAddressMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAddressMonitorEnsureStopped");
}

id objc_msgSend__bleAdvertiserAddressChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAdvertiserAddressChanged:");
}

id objc_msgSend__bleAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAdvertiserEnsureStarted");
}

id objc_msgSend__bleAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAdvertiserEnsureStopped");
}

id objc_msgSend__bleAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAdvertiserShouldRun");
}

id objc_msgSend__bleAdvertiserUpdateSpatialInteraction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAdvertiserUpdateSpatialInteraction");
}

id objc_msgSend__bleAdvertiserUpdateWithAuthTagNC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleAdvertiserUpdateWithAuthTagNC");
}

id objc_msgSend__bleBTVCLinkAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleBTVCLinkAdvertiserEnsureStarted");
}

id objc_msgSend__bleBTVCLinkAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleBTVCLinkAdvertiserEnsureStopped");
}

id objc_msgSend__bleBTVCLinkAdvertiserShouldAdvertise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleBTVCLinkAdvertiserShouldAdvertise");
}

id objc_msgSend__bleBTVCLinkScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleBTVCLinkScannerEnsureStarted");
}

id objc_msgSend__bleBTVCLinkScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleBTVCLinkScannerEnsureStopped");
}

id objc_msgSend__bleBTVCLinkScannerShouldScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleBTVCLinkScannerShouldScan");
}

id objc_msgSend__bleUpdateScanner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bleUpdateScanner:");
}

id objc_msgSend__btDeviceWithID_createIfNeeded_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_btDeviceWithID:createIfNeeded:error:");
}

id objc_msgSend__btDeviceWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_btDeviceWithID:error:");
}

id objc_msgSend__btUUIDWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_btUUIDWithID:error:");
}

id objc_msgSend__callForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callForIdentifier:");
}

id objc_msgSend__cleanupAdvertiser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupAdvertiser");
}

id objc_msgSend__cleanupBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupBrowser");
}

id objc_msgSend__completePerformDeviceRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completePerformDeviceRequest:error:");
}

id objc_msgSend__connectDeviceCompleteRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectDeviceCompleteRequest:error:");
}

id objc_msgSend__connectDeviceUpdateRequests_btResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectDeviceUpdateRequests:btResult:");
}

id objc_msgSend__connectionMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionMonitorEnsureStarted");
}

id objc_msgSend__connectionMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionMonitorEnsureStopped");
}

id objc_msgSend__connectionMonitorFoundDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionMonitorFoundDevice:");
}

id objc_msgSend__connectionMonitorUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionMonitorUpdate");
}

id objc_msgSend__dataWithBTAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dataWithBTAddress:");
}

id objc_msgSend__deleteAllDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteAllDevices");
}

id objc_msgSend__deleteDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteDevice:error:");
}

id objc_msgSend__deviceFilterUUIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceFilterUUIDs:");
}

id objc_msgSend__deviceFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceFound:");
}

id objc_msgSend__deviceFound_deviceUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceFound:deviceUUID:");
}

id objc_msgSend__deviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceLost:");
}

id objc_msgSend__deviceSegmentFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceSegmentFound:");
}

id objc_msgSend__deviceSegmentLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceSegmentLost:");
}

id objc_msgSend__dialNumber_uid_providerIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dialNumber:uid:providerIdentifier:");
}

id objc_msgSend__disconnectAllDevicesWithServiceFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disconnectAllDevicesWithServiceFlags:");
}

id objc_msgSend__disconnectDevice_serviceFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disconnectDevice:serviceFlags:error:");
}

id objc_msgSend__encryptInvitationPayload_payloadLength_authTag_irkData_keyInfo_keyInfoLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:");
}

id objc_msgSend__endpointForUniqueID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endpointForUniqueID:");
}

id objc_msgSend__entitledAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entitledAndReturnError:");
}

id objc_msgSend__entitledCBAdvertiserAndReturnError_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entitledCBAdvertiserAndReturnError:error:");
}

id objc_msgSend__extensionsEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionsEnsureStarted");
}

id objc_msgSend__extensionsEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionsEnsureStopped");
}

id objc_msgSend__findExtensionsStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findExtensionsStart");
}

id objc_msgSend__firstUnlockedOrAllowedBefore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_firstUnlockedOrAllowedBefore");
}

id objc_msgSend__generateCloudPairingIDWithResponse_localKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateCloudPairingIDWithResponse:localKeys:from:forProtocolID:");
}

id objc_msgSend__generateKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateKeys");
}

id objc_msgSend__genericExecute_inDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_genericExecute:inDatabase:");
}

id objc_msgSend__getBTVCLinkAdvertiserSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getBTVCLinkAdvertiserSet:");
}

id objc_msgSend__getPairedDeviceForIDSIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getPairedDeviceForIDSIdentifier:");
}

id objc_msgSend__getPowerObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getPowerObserver");
}

id objc_msgSend__getServerRemoteUUIDFromConnectionMetadata_isAdvToBrowserConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getServerRemoteUUIDFromConnectionMetadata:isAdvToBrowserConnection:");
}

id objc_msgSend__getSubscriptionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSubscriptionContext");
}

id objc_msgSend__handleConnection_isAdvToBrowserConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleConnection:isAdvToBrowserConnection:");
}

id objc_msgSend__handleMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleMsg:");
}

id objc_msgSend__handleUUIDHeaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleUUIDHeaders");
}

id objc_msgSend__identifierForCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identifierForCall:");
}

id objc_msgSend__identitiesEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identitiesEnsureStarted");
}

id objc_msgSend__identitiesEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identitiesEnsureStopped");
}

id objc_msgSend__identitiesGet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identitiesGet");
}

id objc_msgSend__identitiesReevaluateDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identitiesReevaluateDevices");
}

id objc_msgSend__identitiesResolveNearbyDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identitiesResolveNearbyDevice:");
}

id objc_msgSend__identitiesShouldRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identitiesShouldRun");
}

id objc_msgSend__incrementOI_UINT128_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incrementOI_UINT128:");
}

id objc_msgSend__incrementPrimaryFolderVersionForAddressBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incrementPrimaryFolderVersionForAddressBook:");
}

id objc_msgSend__incrementSecondaryFolderVersionForAddressBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_incrementSecondaryFolderVersionForAddressBook:");
}

id objc_msgSend__initializeDatabaseIdentifer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeDatabaseIdentifer");
}

id objc_msgSend__initializePrimaryFolderVersions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializePrimaryFolderVersions");
}

id objc_msgSend__initializeSecondaryFolderVersions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeSecondaryFolderVersions");
}

id objc_msgSend__invalidateUserController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateUserController");
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidated");
}

id objc_msgSend__invokeBlockActivateSafe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invokeBlockActivateSafe:");
}

id objc_msgSend__ios_meContactWithKeysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ios_meContactWithKeysToFetch:error:");
}

id objc_msgSend__isAdvertisingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isAdvertisingEnabled");
}

id objc_msgSend__listenForBTVCBonjourEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_listenForBTVCBonjourEvents");
}

id objc_msgSend__modifyDeviceCompleteRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_modifyDeviceCompleteRequest:error:");
}

id objc_msgSend__myNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_myNumber");
}

id objc_msgSend__oobKeysRemoveAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_oobKeysRemoveAll");
}

id objc_msgSend__oobKeysUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_oobKeysUpdate");
}

id objc_msgSend__packetTypeForDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_packetTypeForDiscovery:");
}

id objc_msgSend__pairingAgentTearDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pairingAgentTearDown");
}

id objc_msgSend__performUserControllerActionWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performUserControllerActionWithCompletion:");
}

id objc_msgSend__powerSourceUpdateWithPartID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_powerSourceUpdateWithPartID:");
}

id objc_msgSend__powerStateForClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_powerStateForClient");
}

id objc_msgSend__prefsChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prefsChanged");
}

id objc_msgSend__preparePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preparePayload:");
}

id objc_msgSend__proxyOOBKeysUpdateOnDeviceFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_proxyOOBKeysUpdateOnDeviceFound:");
}

id objc_msgSend__receivedAdvReport_withData_fromPeer_peerInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_receivedAdvReport:withData:fromPeer:peerInfo:");
}

id objc_msgSend__redialNumberWhileScreening_uid_providerIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_redialNumberWhileScreening:uid:providerIdentifier:");
}

id objc_msgSend__remoteEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteEnsureStarted");
}

id objc_msgSend__remoteEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteEnsureStopped");
}

id objc_msgSend__remoteInvalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteInvalidate");
}

id objc_msgSend__remoteInvalidateInactiveXPC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteInvalidateInactiveXPC");
}

id objc_msgSend__reportAggressiveScanIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportAggressiveScanIfNeeded");
}

id objc_msgSend__reportDeviceFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDeviceFound:");
}

id objc_msgSend__reportDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDeviceLost:");
}

id objc_msgSend__reportDevicesBuffered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDevicesBuffered:");
}

id objc_msgSend__reportEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportEvents");
}

id objc_msgSend__reportLostDevicesForController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportLostDevicesForController:");
}

id objc_msgSend__rescanTimerUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rescanTimerUpdate:");
}

id objc_msgSend__resetAdvertisingEnable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetAdvertisingEnable");
}

id objc_msgSend__restartIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restartIfNeeded:");
}

id objc_msgSend__scanRequestCreate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanRequestCreate");
}

id objc_msgSend__scanSummary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanSummary:");
}

id objc_msgSend__scheduleReport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleReport");
}

id objc_msgSend__sendAdvMessageWithData_isStart_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAdvMessageWithData:isStart:completionHandler:");
}

id objc_msgSend__sendMessage_withType_toDevice_completionCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendMessage:withType:toDevice:completionCallback:");
}

id objc_msgSend__sendMessage_withType_toEndpoint_completionCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendMessage:withType:toEndpoint:completionCallback:");
}

id objc_msgSend__sensorTrackingUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sensorTrackingUpdate");
}

id objc_msgSend__setupAggressiveScanMetricExportTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupAggressiveScanMetricExportTimer");
}

id objc_msgSend__spatialInteractionDecodePeerTokenRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_spatialInteractionDecodePeerTokenRequest:error:");
}

id objc_msgSend__spatialInteractionDeviceFound_checkOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_spatialInteractionDeviceFound:checkOnly:");
}

id objc_msgSend__spatialInteractionDeviceLost_removeUnmatched_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_spatialInteractionDeviceLost:removeUnmatched:reason:");
}

id objc_msgSend__spatialInteractionReevaluateDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_spatialInteractionReevaluateDevices");
}

id objc_msgSend__stackAccessoryMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackAccessoryMonitorEnsureStarted");
}

id objc_msgSend__stackAccessoryMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackAccessoryMonitorEnsureStopped");
}

id objc_msgSend__stackAccessoryMonitorShouldRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackAccessoryMonitorShouldRun");
}

id objc_msgSend__stackAppleTypeUpdateAdvertising_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackAppleTypeUpdateAdvertising:");
}

id objc_msgSend__stackBLEScannerDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackBLEScannerDeviceLost:");
}

id objc_msgSend__stackBLEScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackBLEScannerEnsureStarted");
}

id objc_msgSend__stackBLEScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackBLEScannerEnsureStopped");
}

id objc_msgSend__stackBLEScannerShouldRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackBLEScannerShouldRun");
}

id objc_msgSend__stackBLEScannerUpdateProxControlIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackBLEScannerUpdateProxControlIfNeeded:");
}

id objc_msgSend__stackClassicScannerDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackClassicScannerDeviceLost:");
}

id objc_msgSend__stackClassicScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackClassicScannerEnsureStarted");
}

id objc_msgSend__stackClassicScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackClassicScannerEnsureStopped");
}

id objc_msgSend__stackClassicScannerShouldRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackClassicScannerShouldRun");
}

id objc_msgSend__stackControllerEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackControllerEnsureStarted");
}

id objc_msgSend__stackControllerEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackControllerEnsureStopped");
}

id objc_msgSend__stackDeviceMonitorDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackDeviceMonitorDeviceLost:");
}

id objc_msgSend__stackDeviceMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackDeviceMonitorEnsureStarted");
}

id objc_msgSend__stackDeviceMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackDeviceMonitorEnsureStopped");
}

id objc_msgSend__stackDeviceMonitorShouldRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stackDeviceMonitorShouldRun");
}

id objc_msgSend__startAdvertiser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startAdvertiser");
}

id objc_msgSend__startBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startBrowser");
}

id objc_msgSend__startConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startConnection");
}

id objc_msgSend__startIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startIfNeeded");
}

id objc_msgSend__startTimeoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startTimeoutIfNeeded");
}

id objc_msgSend__stopAdvertising(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAdvertising");
}

id objc_msgSend__stopBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopBrowser");
}

id objc_msgSend__supportsProxControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportsProxControl");
}

id objc_msgSend__triggerPendingExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_triggerPendingExtension");
}

id objc_msgSend__typeToRssiThresholdUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_typeToRssiThresholdUpdate");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_update");
}

id objc_msgSend__updateAdvertiserState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAdvertiserState");
}

id objc_msgSend__updateAirDropPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAirDropPayload:");
}

id objc_msgSend__updateAirPlaySourcePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAirPlaySourcePayload:");
}

id objc_msgSend__updateAirPlayTargetPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAirPlayTargetPayload:");
}

id objc_msgSend__updateAudioAccessoryDeviceInfo_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAudioAccessoryDeviceInfo:flags:");
}

id objc_msgSend__updateBrowserState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateBrowserState");
}

id objc_msgSend__updateCalls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCalls");
}

id objc_msgSend__updateConnectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateConnectable");
}

id objc_msgSend__updateConnectedAudioAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateConnectedAudioAccessories");
}

id objc_msgSend__updateDSInfoPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDSInfoPayload:");
}

id objc_msgSend__updateDeviceBLE_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeviceBLE:flags:");
}

id objc_msgSend__updateDeviceClassic_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeviceClassic:flags:");
}

id objc_msgSend__updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:device:");
}

id objc_msgSend__updateDevicesConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDevicesConnected");
}

id objc_msgSend__updateDevicesPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDevicesPaired");
}

id objc_msgSend__updateFIDOAdvertising(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFIDOAdvertising");
}

id objc_msgSend__updateFIDOPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFIDOPayload");
}

id objc_msgSend__updateHeySiriPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateHeySiriPayload:");
}

id objc_msgSend__updateIfNeededWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateIfNeededWithBlock:");
}

id objc_msgSend__updateNearbyActionNoWakePayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNearbyActionNoWakePayload:");
}

id objc_msgSend__updateNearbyActionV1Payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNearbyActionV1Payload:");
}

id objc_msgSend__updateNearbyActionV2Payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNearbyActionV2Payload:");
}

id objc_msgSend__updateNearbyInfoPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNearbyInfoPayload:");
}

id objc_msgSend__updateNearbyInfoV2Payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNearbyInfoV2Payload:");
}

id objc_msgSend__updateNonConnectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNonConnectable");
}

id objc_msgSend__updateNonConnectableContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNonConnectableContact");
}

id objc_msgSend__updatePowerSources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePowerSources");
}

id objc_msgSend__updateRSSIFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateRSSIFilter");
}

id objc_msgSend__updateSafetyAlertsAdvertising(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSafetyAlertsAdvertising");
}

id objc_msgSend__updateSafetyAlertsPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSafetyAlertsPayload");
}

id objc_msgSend__updateSelfAuthTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSelfAuthTag");
}

id objc_msgSend__updateSpatialInteractionAdvertising_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSpatialInteractionAdvertising:");
}

id objc_msgSend__updateSpatialInteractionPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSpatialInteractionPayload:");
}

id objc_msgSend__updateUserControllerCloudDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUserControllerCloudDevices");
}

id objc_msgSend__updateWatchSetupAdvertising(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWatchSetupAdvertising");
}

id objc_msgSend__updateWatchSetupPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWatchSetupPayload");
}

id objc_msgSend__userControllerCloudUpdateWithDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userControllerCloudUpdateWithDevices:");
}

id objc_msgSend__userControllerUploadLocalControllerInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userControllerUploadLocalControllerInfo");
}

id objc_msgSend__verifyNearbyInfoV2IntegrityTag_rapportIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_verifyNearbyInfoV2IntegrityTag:rapportIdentity:");
}

id objc_msgSend__whbDiscoveryDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_whbDiscoveryDeviceLost:");
}

id objc_msgSend__whbDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_whbDiscoveryEnsureStarted");
}

id objc_msgSend__whbDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_whbDiscoveryEnsureStopped");
}

id objc_msgSend__whbDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_whbDiscoveryShouldRun");
}

id objc_msgSend__wiProxInvalidate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wiProxInvalidate:");
}

id objc_msgSend__wiProxUpdateAdvertising_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wiProxUpdateAdvertising:");
}

id objc_msgSend__wiProxUpdateLinger_active_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wiProxUpdateLinger:active:");
}

id objc_msgSend__wiProxUpdatePayload_payloadData_advertiseRate_advertiseEnableEPA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:");
}

id objc_msgSend__wiproxAppendDescription_context_verbose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wiproxAppendDescription:context:verbose:");
}

id objc_msgSend__xpcAdvertisingAddressChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcAdvertisingAddressChanged");
}

id objc_msgSend__xpcCBAdvertiserActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBAdvertiserActivate:");
}

id objc_msgSend__xpcCBAdvertiserUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBAdvertiserUpdate:");
}

id objc_msgSend__xpcCBConnectionActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBConnectionActivate:");
}

id objc_msgSend__xpcCBConnectionDisconnect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBConnectionDisconnect:");
}

id objc_msgSend__xpcCBConnectionPairingContinue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBConnectionPairingContinue:");
}

id objc_msgSend__xpcCBControllerActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBControllerActivate:");
}

id objc_msgSend__xpcCBDiscoveryActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBDiscoveryActivate:");
}

id objc_msgSend__xpcCBDiscoveryActivateLocal_discovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBDiscoveryActivateLocal:discovery:");
}

id objc_msgSend__xpcCBDiscoveryActivateWHB_discovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBDiscoveryActivateWHB:discovery:");
}

id objc_msgSend__xpcCBDiscoveryClearDuplicateFilterCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBDiscoveryClearDuplicateFilterCache:");
}

id objc_msgSend__xpcCBDiscoveryFinish_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBDiscoveryFinish:");
}

id objc_msgSend__xpcCBDiscoveryGetDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBDiscoveryGetDevices:");
}

id objc_msgSend__xpcCBDiscoveryUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBDiscoveryUpdate:");
}

id objc_msgSend__xpcCBSpatialInteractionSessionActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBSpatialInteractionSessionActivate:");
}

id objc_msgSend__xpcCBSpatialInteractionSessionAddPeerToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBSpatialInteractionSessionAddPeerToken:");
}

id objc_msgSend__xpcCBSpatialInteractionSessionRemovePeerToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBSpatialInteractionSessionRemovePeerToken:");
}

id objc_msgSend__xpcCBSpatialInteractionSessionUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcCBSpatialInteractionSessionUpdate:");
}

id objc_msgSend__xpcConnectionAccept_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcConnectionAccept:");
}

id objc_msgSend__xpcDeleteDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDeleteDevice:");
}

id objc_msgSend__xpcDiagnosticAdvertiser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticAdvertiser");
}

id objc_msgSend__xpcDiagnosticAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticAssertion");
}

id objc_msgSend__xpcDiagnosticControl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticControl:");
}

id objc_msgSend__xpcDiagnosticDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticDiscovery");
}

id objc_msgSend__xpcDiagnosticLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticLog:");
}

id objc_msgSend__xpcDiagnosticShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticShow:");
}

id objc_msgSend__xpcDiagnosticTipiChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticTipiChanged");
}

id objc_msgSend__xpcDiscoverableStateChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiscoverableStateChanged:");
}

id objc_msgSend__xpcGetControllerInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetControllerInfo:");
}

id objc_msgSend__xpcGetControllerSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetControllerSettings:");
}

id objc_msgSend__xpcGetDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetDevices:");
}

id objc_msgSend__xpcGetPowerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetPowerState:");
}

id objc_msgSend__xpcInquiryStateChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcInquiryStateChanged:");
}

id objc_msgSend__xpcModifyControllerSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcModifyControllerSettings:");
}

id objc_msgSend__xpcModifyDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcModifyDevice:");
}

id objc_msgSend__xpcPerformDeviceRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcPerformDeviceRequest:");
}

id objc_msgSend__xpcPowerStateChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcPowerStateChanged:");
}

id objc_msgSend__xpcPublisherConnectionsAddToken_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcPublisherConnectionsAddToken:info:");
}

id objc_msgSend__xpcPublisherConnectionsRemoveToken_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcPublisherConnectionsRemoveToken:reason:");
}

id objc_msgSend__xpcPublisherDiscoveryAddToken_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcPublisherDiscoveryAddToken:info:");
}

id objc_msgSend__xpcPublisherDiscoveryRemoveToken_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcPublisherDiscoveryRemoveToken:reason:");
}

id objc_msgSend__xpcReadPrefs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcReadPrefs:");
}

id objc_msgSend__xpcReceivedMessage_remoteDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcReceivedMessage:remoteDevice:");
}

id objc_msgSend__xpcResetCBExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcResetCBExtension:");
}

id objc_msgSend__xpcSendAudioAccessoryConfigMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendAudioAccessoryConfigMessage:");
}

id objc_msgSend__xpcSendAudioAccessoryEventMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendAudioAccessoryEventMessage:");
}

id objc_msgSend__xpcSendConversationDetectMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendConversationDetectMessage:");
}

id objc_msgSend__xpcSendEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendEvent:");
}

id objc_msgSend__xpcSendRelayMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendRelayMessage:");
}

id objc_msgSend__xpcSendReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendReply:");
}

id objc_msgSend__xpcSendReplyError_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendReplyError:request:");
}

id objc_msgSend__xpcSendSmartRoutingInformation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendSmartRoutingInformation:");
}

id objc_msgSend__xpcSetLowPowerMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSetLowPowerMode:");
}

id objc_msgSend__xpcSetPowerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSetPowerState:");
}

id objc_msgSend__xpcUpdateIdentities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcUpdateIdentities:");
}

id objc_msgSend__xpcWritePref_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcWritePref:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessoryDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDaemon");
}

id objc_msgSend_accessoryHint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryHint");
}

id objc_msgSend_accessoryKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryKey");
}

id objc_msgSend_accessoryMonitorClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryMonitorClass");
}

id objc_msgSend_accessoryOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryOptions");
}

id objc_msgSend_accessoryStatusFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryStatusFlags");
}

id objc_msgSend_accessoryStatusOBCTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryStatusOBCTime");
}

id objc_msgSend_aclPriority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aclPriority");
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquire");
}

id objc_msgSend_acquireWithHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWithHandler:invalidationHandler:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionType");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateAssertionWithFlags_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateAssertionWithFlags:completion:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_activateWithSystemMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithSystemMonitor:");
}

id objc_msgSend_activatedAdvertiser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activatedAdvertiser");
}

id objc_msgSend_activatedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activatedConnection");
}

id objc_msgSend_activatedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activatedController");
}

id objc_msgSend_activatedDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activatedDiscovery");
}

id objc_msgSend_activatedDiscoveryWHB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activatedDiscoveryWHB");
}

id objc_msgSend_activatedSpatialInteractionSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activatedSpatialInteractionSession");
}

id objc_msgSend_activeDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDevices");
}

id objc_msgSend_adaptiveVolumeCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adaptiveVolumeCapability");
}

id objc_msgSend_adaptiveVolumeConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adaptiveVolumeConfig");
}

id objc_msgSend_addAdvertisingRequest_forDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAdvertisingRequest:forDaemon:");
}

id objc_msgSend_addBTVCBonjourLinkDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBTVCBonjourLinkDelegate:");
}

id objc_msgSend_addDiscoverableController_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDiscoverableController:error:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addLostDeviceToLostCBSpatialDevicesIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLostDeviceToLostCBSpatialDevicesIfNeeded:");
}

id objc_msgSend_addMonitor_subjectMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMonitor:subjectMask:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addPairingClient_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPairingClient:error:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addTimestampWithMachAbsolute_andDomainTime_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimestampWithMachAbsolute:andDomainTime:error:");
}

id objc_msgSend_addUserFilteredClockWithMachInterval_domainInterval_usingFilterShift_isAdaptive_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUserFilteredClockWithMachInterval:domainInterval:usingFilterShift:isAdaptive:error:");
}

id objc_msgSend_addressMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addressMonitor");
}

id objc_msgSend_addressMonitorClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addressMonitorClass");
}

id objc_msgSend_addressType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addressType");
}

id objc_msgSend_advReportReceiveHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advReportReceiveHandler");
}

id objc_msgSend_advToBrowserNwToSFendpoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advToBrowserNwToSFendpoints");
}

id objc_msgSend_advToBrowserUuidToSFendpoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advToBrowserUuidToSFendpoints");
}

id objc_msgSend_advertiseRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertiseRate");
}

id objc_msgSend_advertiserAdvs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertiserAdvs");
}

id objc_msgSend_advertiserArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertiserArray");
}

id objc_msgSend_advertiserEnableEPA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertiserEnableEPA");
}

id objc_msgSend_advertiserState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertiserState");
}

id objc_msgSend_advertisingAddressChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingAddressChanged");
}

id objc_msgSend_advertisingAddressChangedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingAddressChangedHandler");
}

id objc_msgSend_advertisingAddressData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingAddressData");
}

id objc_msgSend_advertisingAddressDataConnectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingAddressDataConnectable");
}

id objc_msgSend_advertisingAddressDataNonConnectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingAddressDataNonConnectable");
}

id objc_msgSend_advertisingEnable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingEnable:");
}

id objc_msgSend_advertisingManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingManager");
}

id objc_msgSend_advertisingRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingRate");
}

id objc_msgSend_advertisingStateUpdateHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingStateUpdateHandler");
}

id objc_msgSend_aggregateDiscoveryFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregateDiscoveryFlags");
}

id objc_msgSend_aggregateDiscoveryTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregateDiscoveryTypes");
}

id objc_msgSend_airdropConfigData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropConfigData");
}

id objc_msgSend_airdropFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropFlags");
}

id objc_msgSend_airdropHash1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropHash1");
}

id objc_msgSend_airdropHash2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropHash2");
}

id objc_msgSend_airdropHash3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropHash3");
}

id objc_msgSend_airdropHash4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropHash4");
}

id objc_msgSend_airdropModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropModel");
}

id objc_msgSend_airdropTempAuthTagData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropTempAuthTagData");
}

id objc_msgSend_airdropVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airdropVersion");
}

id objc_msgSend_airplaySourceAuthTagData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplaySourceAuthTagData");
}

id objc_msgSend_airplaySourceFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplaySourceFlags");
}

id objc_msgSend_airplaySourceUWBConfigData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplaySourceUWBConfigData");
}

id objc_msgSend_airplayTargetConfigSeed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayTargetConfigSeed");
}

id objc_msgSend_airplayTargetFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayTargetFlags");
}

id objc_msgSend_airplayTargetIPv4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayTargetIPv4");
}

id objc_msgSend_airplayTargetPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayTargetPort");
}

id objc_msgSend_alertOptionsWithConnectionAlerts_disconnectionAlerts_notificationAlerts_delay_bridgeTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertOptionsWithConnectionAlerts:disconnectionAlerts:notificationAlerts:delay:bridgeTransport:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowedSessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedSessions");
}

id objc_msgSend_allowsAutoRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsAutoRoute");
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alphanumericCharacterSet");
}

id objc_msgSend_ancAssetVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ancAssetVersion");
}

id objc_msgSend_ancsRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ancsRequired");
}

id objc_msgSend_answerIncomingCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "answerIncomingCall:");
}

id objc_msgSend_answerWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "answerWithRequest:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_aopDataHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aopDataHandler");
}

id objc_msgSend_aopMessageReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aopMessageReceived:");
}

id objc_msgSend_appAccessInfoMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appAccessInfoMap");
}

id objc_msgSend_appID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appID");
}

id objc_msgSend_appInfoWithPID_isApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appInfoWithPID:isApp:");
}

id objc_msgSend_appLaunchCallback_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appLaunchCallback:flags:");
}

id objc_msgSend_appearanceValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearanceValue");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applePayloadType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applePayloadType");
}

id objc_msgSend_appleTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleTypes");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationStateChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationStateChanged:");
}

id objc_msgSend_applicationStateForApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationStateForApplication:");
}

id objc_msgSend_applicationStateForProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationStateForProcess:");
}

id objc_msgSend_applicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationWithBundleIdentifier:");
}

id objc_msgSend_applicationsDidUninstall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationsDidUninstall:");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionFlags");
}

id objc_msgSend_assertionInvalidationCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionInvalidationCallback:");
}

id objc_msgSend_assertionWithStatusBarStyleOverrides_forPID_exclusive_showsWhenForeground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:");
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetId");
}

id objc_msgSend_attributeInternalFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeInternalFlags");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_audioAccessorySmartChargeDeadlineHasChangedFromCloud_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioAccessorySmartChargeDeadlineHasChangedFromCloud:");
}

id objc_msgSend_audioAccessorySmartChargeStatusHasChangedFromCloud_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioAccessorySmartChargeStatusHasChangedFromCloud:");
}

id objc_msgSend_audioAndVideoCallsWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioAndVideoCallsWithStatus:");
}

id objc_msgSend_audioOrVideoCallWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioOrVideoCallWithStatus:");
}

id objc_msgSend_audioRouteHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioRouteHidden");
}

id objc_msgSend_audioStreamState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioStreamState");
}

id objc_msgSend_authTagForData_type_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authTagForData:type:error:");
}

id objc_msgSend_authorizationStatusForBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationStatusForBundle:");
}

id objc_msgSend_autoANCCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoANCCapability");
}

id objc_msgSend_autoANCStrength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoANCStrength");
}

id objc_msgSend_autoAncCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoAncCapability");
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automotive");
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoupdatingCurrentCalendar");
}

id objc_msgSend_availableDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableDevices");
}

id objc_msgSend_bars(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bars");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_batteryInfoCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryInfoCase");
}

id objc_msgSend_batteryInfoLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryInfoLeft");
}

id objc_msgSend_batteryInfoMain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryInfoMain");
}

id objc_msgSend_batteryInfoRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryInfoRight");
}

id objc_msgSend_batteryLevelCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryLevelCase");
}

id objc_msgSend_batteryLevelLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryLevelLeft");
}

id objc_msgSend_batteryLevelRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryLevelRight");
}

id objc_msgSend_batteryStateCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryStateCase");
}

id objc_msgSend_batteryStateLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryStateLeft");
}

id objc_msgSend_batteryStateMain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryStateMain");
}

id objc_msgSend_batteryStateRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryStateRight");
}

id objc_msgSend_beaconIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beaconIdentifier");
}

id objc_msgSend_bleAdvRSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleAdvRSSI");
}

id objc_msgSend_bleAdvertiserClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleAdvertiserClass");
}

id objc_msgSend_bleRSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleRSSI");
}

id objc_msgSend_bleRSSIThresholdHint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleRSSIThresholdHint");
}

id objc_msgSend_bleRSSIThresholdOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleRSSIThresholdOrder");
}

id objc_msgSend_bleScanRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleScanRate");
}

id objc_msgSend_bleScanRateOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleScanRateOverride");
}

id objc_msgSend_bleScanRateScreenOff(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleScanRateScreenOff");
}

id objc_msgSend_bleScannerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleScannerClass");
}

id objc_msgSend_bleSensorEnableRssiIncreaseScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleSensorEnableRssiIncreaseScan");
}

id objc_msgSend_bleSensorIncreaseScanRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleSensorIncreaseScanRate");
}

id objc_msgSend_bleSensorIncreaseScanTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleSensorIncreaseScanTimeout");
}

id objc_msgSend_bleSensorRssiIncreaseScanThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleSensorRssiIncreaseScanThreshold");
}

id objc_msgSend_bleSensorTimeoutBetweenIncreaseScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleSensorTimeoutBetweenIncreaseScan");
}

id objc_msgSend_blobData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blobData");
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothAddress");
}

id objc_msgSend_bluetoothAddressKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothAddressKey");
}

id objc_msgSend_bluetoothDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothDevices");
}

id objc_msgSend_bluetoothIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothIdentifier");
}

id objc_msgSend_bluetoothModificationAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothModificationAllowed");
}

id objc_msgSend_bluetoothNameKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothNameKey");
}

id objc_msgSend_bluetoothStateChangedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothStateChangedHandler");
}

id objc_msgSend_bobbleCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bobbleCapability");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_browserState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "browserState");
}

id objc_msgSend_browserToAdvNwToSFendpoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "browserToAdvNwToSFendpoints");
}

id objc_msgSend_browserToAdvUuidToSFendpoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "browserToAdvUuidToSFendpoints");
}

id objc_msgSend_btAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btAddress");
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btAddressData");
}

id objc_msgSend_btAddressType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btAddressType");
}

id objc_msgSend_btControllerTapToRadar_reason_cid_cname_cvers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btControllerTapToRadar:reason:cid:cname:cvers:");
}

id objc_msgSend_btSessionHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btSessionHandle");
}

id objc_msgSend_btVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btVersion");
}

id objc_msgSend_btvcBonjourLink_didConnectToPeer_transport_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didConnectToPeer:transport:error:");
}

id objc_msgSend_btvcBonjourLink_didDeferAdvertisingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didDeferAdvertisingType:");
}

id objc_msgSend_btvcBonjourLink_didDisconnectFromPeer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didDisconnectFromPeer:error:");
}

id objc_msgSend_btvcBonjourLink_didDiscoverType_withData_fromPeer_peerInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didDiscoverType:withData:fromPeer:peerInfo:");
}

id objc_msgSend_btvcBonjourLink_didFailToStartAdvertisingOfType_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didFailToStartAdvertisingOfType:withError:");
}

id objc_msgSend_btvcBonjourLink_didFailToStartScanningForType_WithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didFailToStartScanningForType:WithError:");
}

id objc_msgSend_btvcBonjourLink_didLosePeer_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didLosePeer:type:");
}

id objc_msgSend_btvcBonjourLink_didReceiveData_fromPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didReceiveData:fromPeer:");
}

id objc_msgSend_btvcBonjourLink_didSendData_toPeer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didSendData:toPeer:error:");
}

id objc_msgSend_btvcBonjourLink_didStartAdvertisingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didStartAdvertisingType:");
}

id objc_msgSend_btvcBonjourLink_didStartScanningForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didStartScanningForType:");
}

id objc_msgSend_btvcBonjourLink_didStopAdvertisingType_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLink:didStopAdvertisingType:withError:");
}

id objc_msgSend_btvcBonjourLinkDidUpdateState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcBonjourLinkDidUpdateState:");
}

id objc_msgSend_btvcLinkClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btvcLinkClient");
}

id objc_msgSend_budsFirmwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "budsFirmwareVersion");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleId");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifiers");
}

id objc_msgSend_bundleInfoValueForKey_PID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleInfoValueForKey:PID:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_buttonModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonModes");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_calculateMetricforDevice_onHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateMetricforDevice:onHost:");
}

id objc_msgSend_callCenterWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callCenterWithQueue:");
}

id objc_msgSend_callMgmtMsg(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callMgmtMsg");
}

id objc_msgSend_callServicesClientCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callServicesClientCapabilities");
}

id objc_msgSend_callWithUniqueProxyIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callWithUniqueProxyIdentifier:");
}

id objc_msgSend_calls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calls");
}

id objc_msgSend_canGroupCall_withCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canGroupCall:withCall:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAppLaunchAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAppLaunchAlert:");
}

id objc_msgSend_cancelPairingAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPairingAlert:");
}

id objc_msgSend_caseFirmwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseFirmwareVersion");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_caseName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseName");
}

id objc_msgSend_caseSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseSerialNumber");
}

id objc_msgSend_caseSoundCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseSoundCapability");
}

id objc_msgSend_caseVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseVersion");
}

id objc_msgSend_cbPeripheralManagementSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cbPeripheralManagementSession");
}

id objc_msgSend_change(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "change");
}

id objc_msgSend_changeFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeFlags");
}

id objc_msgSend_changedTypesContainCBDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedTypesContainCBDiscovery:");
}

id objc_msgSend_changedTypesContainTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedTypesContainTypes:");
}

id objc_msgSend_changedTypesNeedsIdentify(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedTypesNeedsIdentify");
}

id objc_msgSend_changedTypesRemoveAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedTypesRemoveAll");
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "charValue");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_chipsetID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chipsetID");
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "city");
}

id objc_msgSend_classicRSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classicRSSI");
}

id objc_msgSend_classicScannerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classicScannerClass");
}

id objc_msgSend_clearAllDatabases(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAllDatabases");
}

id objc_msgSend_clearDuplicateFilterCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearDuplicateFilterCache:");
}

id objc_msgSend_clickHoldModeLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clickHoldModeLeft");
}

id objc_msgSend_clickHoldModeRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clickHoldModeRight");
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientBundleID");
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientID");
}

id objc_msgSend_clientIdentifierData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientIdentifierData");
}

id objc_msgSend_clientIrkData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientIrkData");
}

id objc_msgSend_clientProcessID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientProcessID");
}

id objc_msgSend_clockWithClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockWithClockIdentifier:");
}

id objc_msgSend_cloneDatabaseTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloneDatabaseTo:");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_cloudClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudClient");
}

id objc_msgSend_cloudSyncStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudSyncStatus");
}

id objc_msgSend_cloudpairdMsg_args_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudpairdMsg:args:");
}

id objc_msgSend_cloudpairdReplyMsg_args_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudpairdReplyMsg:args:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_coexUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coexUsage");
}

id objc_msgSend_coexUsageOfWHBHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coexUsageOfWHBHost:");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "color");
}

id objc_msgSend_colorInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorInfo");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_compareWithRPIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compareWithRPIdentity:");
}

id objc_msgSend_completedFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedFlags");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidence");
}

id objc_msgSend_configureXPCListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureXPCListener");
}

id objc_msgSend_connectDevice_connectionFlags_serviceFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectDevice:connectionFlags:serviceFlags:error:");
}

id objc_msgSend_connectTimeoutSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectTimeoutSeconds");
}

id objc_msgSend_connectToDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToDevice:");
}

id objc_msgSend_connectWithCBConnection_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectWithCBConnection:completionHandler:");
}

id objc_msgSend_connectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectable");
}

id objc_msgSend_connectableAddressData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectableAddressData");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_connectedDeviceCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedDeviceCount");
}

id objc_msgSend_connectedServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedServices");
}

id objc_msgSend_connectedTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedTime");
}

id objc_msgSend_connectingClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectingClients");
}

id objc_msgSend_connectingToPANServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectingToPANServices");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionAlerts");
}

id objc_msgSend_connectionFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionFlags");
}

id objc_msgSend_connectionHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionHandle");
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionUUID");
}

id objc_msgSend_connectionUseCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionUseCase");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contact");
}

id objc_msgSend_contactProperty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactProperty");
}

id objc_msgSend_contactType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactType");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlFlags");
}

id objc_msgSend_controllerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerClass");
}

id objc_msgSend_controllerDataChangedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerDataChangedHandler");
}

id objc_msgSend_controllerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerID");
}

id objc_msgSend_controllerInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerInfo");
}

id objc_msgSend_conversationDetectCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationDetectCapability");
}

id objc_msgSend_conversationDetectConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationDetectConfig");
}

id objc_msgSend_convertFromDomainToMachAbsoluteTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertFromDomainToMachAbsoluteTime:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyLastKnownMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyLastKnownMobileCountryCode:error:");
}

id objc_msgSend_copyMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyMobileCountryCode:error:");
}

id objc_msgSend_copyRegistrationDisplayStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyRegistrationDisplayStatus:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "country");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCode");
}

id objc_msgSend_createAssertionForBundleID_duration_isUrgent_withPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAssertionForBundleID:duration:isUrgent:withPid:");
}

id objc_msgSend_createConnectionParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createConnectionParameters");
}

id objc_msgSend_createDatabase_type_path_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDatabase:type:path:flags:");
}

id objc_msgSend_createDeviceRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDeviceRecord:completion:");
}

id objc_msgSend_createDeviceSupportInformationRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDeviceSupportInformationRecord:completion:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createForSubmission_metadata_options_error_writing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createForSubmission:metadata:options:error:writing:");
}

id objc_msgSend_createMagicSettingsRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createMagicSettingsRecord:completion:");
}

id objc_msgSend_createQuerySessionWithAttenuationThreshold_queue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createQuerySessionWithAttenuationThreshold:queue:error:");
}

id objc_msgSend_createTablesForDatabase_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTablesForDatabase:type:");
}

id objc_msgSend_crownRotationDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crownRotationDirection");
}

id objc_msgSend_ctClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ctClient");
}

id objc_msgSend_ctServerConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ctServerConnection");
}

id objc_msgSend_ctkdChosenTransport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ctkdChosenTransport");
}

id objc_msgSend_cuFilteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cuFilteredArrayUsingBlock:");
}

id objc_msgSend_currentAudioAndVideoCalls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAudioAndVideoCalls");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentEstimates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentEstimates");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentIDSUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentIDSUser");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_currentStoreType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStoreType");
}

id objc_msgSend_currentUserRandomAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserRandomAddress");
}

id objc_msgSend_customPropertiesJSONFromDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customPropertiesJSONFromDevice:");
}

id objc_msgSend_customPropertiesToDevice_fromJSON_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customPropertiesToDevice:fromJSON:");
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cycling");
}

id objc_msgSend_daemonServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonServer");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_databaseContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseContainerURL");
}

id objc_msgSend_databaseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseIdentifier");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decimalDigitCharacterSet");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decryptApplePayloadWithIdentity_forType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decryptApplePayloadWithIdentity:forType:error:");
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCStringEncoding");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delay");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteDevice:error:");
}

id objc_msgSend_deleteDeviceRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteDeviceRecord:completion:");
}

id objc_msgSend_deleteDeviceSupportInformationRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteDeviceSupportInformationRecord:completion:");
}

id objc_msgSend_deleteMagicSettingsRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteMagicSettingsRecord:completion:");
}

id objc_msgSend_denyLowPowerModeScans(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyLowPowerModeScans");
}

id objc_msgSend_denyScreenLockedScans(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyScreenLockedScans");
}

id objc_msgSend_departmentName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "departmentName");
}

id objc_msgSend_deregisterEventID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterEventID:");
}

id objc_msgSend_deregisterRequestID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterRequestID:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionInternalDebug(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionInternalDebug");
}

id objc_msgSend_descriptionWithLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionWithLevel:");
}

id objc_msgSend_descriptionWithLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionWithLocale:");
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceControllerMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceControllerMap");
}

id objc_msgSend_deviceDidConnectHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDidConnectHandler");
}

id objc_msgSend_deviceDidDisconnectHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDidDisconnectHandler");
}

id objc_msgSend_deviceDidReceiveDataHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDidReceiveDataHandler");
}

id objc_msgSend_deviceDidStartScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDidStartScanning");
}

id objc_msgSend_deviceDidStopScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDidStopScanning");
}

id objc_msgSend_deviceFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFilter");
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFlags");
}

id objc_msgSend_deviceFlagsMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFlagsMask");
}

id objc_msgSend_deviceFlagsValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFlagsValue");
}

id objc_msgSend_deviceFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFound:");
}

id objc_msgSend_deviceFound_remoteController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFound:remoteController:");
}

id objc_msgSend_deviceFoundHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFoundHandler");
}

id objc_msgSend_deviceIDFeatureBitsV1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIDFeatureBitsV1");
}

id objc_msgSend_deviceIDFeatureBitsV2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIDFeatureBitsV2");
}

id objc_msgSend_deviceIRKData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIRKData");
}

id objc_msgSend_deviceList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceList");
}

id objc_msgSend_deviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLost:");
}

id objc_msgSend_deviceLost_remoteController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLost:remoteController:");
}

id objc_msgSend_deviceLostHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLostHandler");
}

id objc_msgSend_deviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMap");
}

id objc_msgSend_deviceMonitorClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMonitorClass");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceOrientationBlocking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceOrientationBlocking");
}

id objc_msgSend_deviceRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceRecord:completion:");
}

id objc_msgSend_deviceSetupState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSetupState");
}

id objc_msgSend_deviceSupportInformationRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSupportInformationRecord:completion:");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUUID");
}

id objc_msgSend_devicesBufferedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicesBufferedHandler");
}

id objc_msgSend_diagnosticAccessoryFakeWithIdentifier_leftPercent_leftState_rightPercent_rightState_casePercent_caseState_lidClosed_obcMinutes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercent:caseState:lidClosed:obcMinutes:error:");
}

id objc_msgSend_diagnosticControl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticControl:");
}

id objc_msgSend_diagnosticControl_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticControl:completion:");
}

id objc_msgSend_diagnosticControl_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticControl:error:");
}

id objc_msgSend_dialNumber_uid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dialNumber:uid:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didConnectHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didConnectHandler");
}

id objc_msgSend_didDisconnectHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didDisconnectHandler");
}

id objc_msgSend_didReceiveDataHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveDataHandler");
}

id objc_msgSend_disableHIP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableHIP");
}

id objc_msgSend_disableLPEMFeature_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableLPEMFeature:error:");
}

id objc_msgSend_disableLeGATT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableLeGATT");
}

id objc_msgSend_disableSmartChargingForDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableSmartChargingForDevice:withError:");
}

id objc_msgSend_disabledActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disabledActive");
}

id objc_msgSend_disabledPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disabledPending");
}

id objc_msgSend_disconnectCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectCall:");
}

id objc_msgSend_disconnectCurrentCallAndActivateHeld(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectCurrentCallAndActivateHeld");
}

id objc_msgSend_disconnectDevice_serviceFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectDevice:serviceFlags:error:");
}

id objc_msgSend_disconnectFromDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectFromDevice:");
}

id objc_msgSend_disconnectionAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectionAlerts");
}

id objc_msgSend_discoverableState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverableState");
}

id objc_msgSend_discoverableStateChangedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverableStateChangedHandler");
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredDevices");
}

id objc_msgSend_discoveryArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryArray");
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryFlags");
}

id objc_msgSend_discoveryInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryInfo");
}

id objc_msgSend_discoveryTypesContainCBDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryTypesContainCBDiscovery:");
}

id objc_msgSend_discoveryTypesContainType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryTypesContainType:");
}

id objc_msgSend_discoveryTypesContainTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryTypesContainTypes:");
}

id objc_msgSend_discoveryTypesInternalPtr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryTypesInternalPtr");
}

id objc_msgSend_discoveryTypesPtr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryTypesPtr");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_displayAirWaveLaunchNotification_forProduct_reason_findMySerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayAirWaveLaunchNotification:forProduct:reason:findMySerialNumber:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_doubleTapActionLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleTapActionLeft");
}

id objc_msgSend_doubleTapActionRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleTapActionRight");
}

id objc_msgSend_doubleTapCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleTapCapability");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_droppedAdvertisementCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "droppedAdvertisementCount");
}

id objc_msgSend_dsActionFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsActionFlags");
}

id objc_msgSend_dsActionMeasuredPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsActionMeasuredPower");
}

id objc_msgSend_dsActionTieBreaker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsActionTieBreaker");
}

id objc_msgSend_dsInfoVehicleConfidence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsInfoVehicleConfidence");
}

id objc_msgSend_dsInfoVehicleState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dsInfoVehicleState");
}

id objc_msgSend_dumpDaemonState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpDaemonState");
}

id objc_msgSend_duplicateCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duplicateCount");
}

id objc_msgSend_duplicatePairedDevicesForAddress_originalUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duplicatePairedDevicesForAddress:originalUuid:");
}

id objc_msgSend_dynamicAlgorithmEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicAlgorithmEnabled");
}

id objc_msgSend_dynamicThrottleDownAdvDensity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicThrottleDownAdvDensity");
}

id objc_msgSend_dynamicThrottleDownDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicThrottleDownDuration");
}

id objc_msgSend_dynamicThrottleDownRSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicThrottleDownRSSI");
}

id objc_msgSend_earTipFitTestCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earTipFitTestCapability");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAddresses");
}

id objc_msgSend_enableAutoReconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableAutoReconnect");
}

id objc_msgSend_enableControllerBTClockUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableControllerBTClockUpdates");
}

id objc_msgSend_enableEPAForLEAdvertisement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableEPAForLEAdvertisement");
}

id objc_msgSend_enableHeartRateMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableHeartRateMonitor");
}

id objc_msgSend_enableLPEMFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLPEMFeature:");
}

id objc_msgSend_enableLPEMFeature_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLPEMFeature:error:");
}

id objc_msgSend_enableScanCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableScanCore");
}

id objc_msgSend_enableSiriMultitone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSiriMultitone");
}

id objc_msgSend_enableSmartChargingForDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSmartChargingForDevice:withError:");
}

id objc_msgSend_enableSystemWakesForUpdate_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSystemWakesForUpdate:completion:");
}

id objc_msgSend_enableTransportBridging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableTransportBridging");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeWithXPCObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeWithXPCObject:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_encryptionKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptionKey");
}

id objc_msgSend_endCallConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endCallConfig");
}

id objc_msgSend_endSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSessionWithCompletion:");
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointUUID");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlements");
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entries");
}

id objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateContactsWithFetchRequest:error:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsWithOptions:usingBlock:");
}

id objc_msgSend_enumerateLinesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateLinesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "environment");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_estimatedConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "estimatedConnections");
}

id objc_msgSend_estimatedConnectionsLastUpdatedTicks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "estimatedConnectionsLastUpdatedTicks");
}

id objc_msgSend_eventConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventConfiguration");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_eventWithName_type_date_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithName:type:date:payload:");
}

id objc_msgSend_evictIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evictIfNeeded:");
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_extensionsDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsDaemon");
}

id objc_msgSend_extraDiscoveryFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extraDiscoveryFlags");
}

id objc_msgSend_failedDirect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedDirect");
}

id objc_msgSend_fakeNonConnectableAddressData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fakeNonConnectableAddressData");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyName");
}

id objc_msgSend_fastLEConnectionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fastLEConnectionAllowed");
}

id objc_msgSend_fastLEConnectionInfoData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fastLEConnectionInfoData");
}

id objc_msgSend_fastLEConnectionInfoVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fastLEConnectionInfoVersion");
}

id objc_msgSend_fetchFindMyNetworkStatusForMACAddress_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchFindMyNetworkStatusForMACAddress:completion:");
}

id objc_msgSend_fetchManateeStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchManateeStatus");
}

id objc_msgSend_fetchSoundProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchSoundProfile");
}

id objc_msgSend_fetchSoundProfileRecordWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchSoundProfileRecordWithCompletion:");
}

id objc_msgSend_fidoPayloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fidoPayloadData");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filepath");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findMyCaseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findMyCaseIdentifier");
}

id objc_msgSend_findMyGroupIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findMyGroupIdentifier");
}

id objc_msgSend_findPrimaryCBDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findPrimaryCBDevice:");
}

id objc_msgSend_findUUIDsWithCustomProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findUUIDsWithCustomProperties:");
}

id objc_msgSend_finishDiscovery_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDiscovery:completionHandler:");
}

id objc_msgSend_firmwareName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareName");
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareRevision");
}

id objc_msgSend_firmwareRevisionActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareRevisionActive");
}

id objc_msgSend_firmwareRevisionPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareRevisionPending");
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareVersion");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstUnlocked");
}

id objc_msgSend_firstUnlockedSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstUnlockedSync");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flags");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flushCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushCache");
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_forwardEvent_forUid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forwardEvent:forUid:");
}

id objc_msgSend_frequencyBand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frequencyBand");
}

id objc_msgSend_freshResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freshResult");
}

id objc_msgSend_friendlyNameForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "friendlyNameForType:");
}

id objc_msgSend_gapaFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gapaFlags");
}

id objc_msgSend_generateCloudPairingIDWithResponse_localKeys_from_forProtocolID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateCloudPairingIDWithResponse:localKeys:from:forProtocolID:");
}

id objc_msgSend_generateKeyDictForTypes_keyLength_forAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateKeyDictForTypes:keyLength:forAddress:");
}

id objc_msgSend_generateKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateKeys");
}

id objc_msgSend_getAccessibilityHeadtrackingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccessibilityHeadtrackingEnabled");
}

id objc_msgSend_getAccountStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccountStatus");
}

id objc_msgSend_getAndClearLPEMBluetoothLogWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAndClearLPEMBluetoothLogWithError:");
}

id objc_msgSend_getAudioAccessoryDeviceArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAudioAccessoryDeviceArray");
}

id objc_msgSend_getAudioSkywalkProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAudioSkywalkProvider");
}

id objc_msgSend_getBluetoothAccessInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBluetoothAccessInfoWithCompletionHandler:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getCBDeviceForStableId_onHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCBDeviceForStableId:onHost:");
}

id objc_msgSend_getClientBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getClientBundleIDs");
}

id objc_msgSend_getCloudPairedDevicesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCloudPairedDevicesWithCompletionHandler:");
}

id objc_msgSend_getComponentIDFromProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentIDFromProductID:");
}

id objc_msgSend_getComponentIDFromRadarReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentIDFromRadarReason:");
}

id objc_msgSend_getComponentNameFromProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentNameFromProductID:");
}

id objc_msgSend_getComponentNameFromRadarReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentNameFromRadarReason:");
}

id objc_msgSend_getComponentVersionFromProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentVersionFromProductID:");
}

id objc_msgSend_getComponentVersionFromRadarReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentVersionFromRadarReason:");
}

id objc_msgSend_getControllerInfoForDevice_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getControllerInfoForDevice:completion:");
}

id objc_msgSend_getCountryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCountryCode");
}

id objc_msgSend_getCountryCodeForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCountryCodeForIdentifier:");
}

id objc_msgSend_getCountryCodeIdentifer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCountryCodeIdentifer");
}

id objc_msgSend_getCurrentDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentDataSubscriptionContextSync:");
}

id objc_msgSend_getCurrentScreeningCalls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentScreeningCalls:");
}

id objc_msgSend_getCurrentUserGivenNameWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentUserGivenNameWithCompletion:");
}

id objc_msgSend_getDeviceForUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceForUID:");
}

id objc_msgSend_getDevicesWithFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDevicesWithFlags:error:");
}

id objc_msgSend_getIRKForRandomStaticAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIRKForRandomStaticAddress:");
}

id objc_msgSend_getIdentitiesWithFlags_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIdentitiesWithFlags:completion:");
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalFileUrl");
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalUrl");
}

id objc_msgSend_getLocalizedOperatorName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalizedOperatorName:error:");
}

id objc_msgSend_getPairedDeviceForIDSIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairedDeviceForIDSIdentifier:");
}

id objc_msgSend_getPrimaryFolderVersionForAddressBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPrimaryFolderVersionForAddressBook:");
}

id objc_msgSend_getProductNameFromProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProductNameFromProductID:");
}

id objc_msgSend_getRegistrationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRegistrationStatus");
}

id objc_msgSend_getReport_reportLength_withIdentifier_forType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReport:reportLength:withIdentifier:forType:error:");
}

id objc_msgSend_getSecondaryFolderVersionForAddressBook_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSecondaryFolderVersionForAddressBook:");
}

id objc_msgSend_getSignalStrengthInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSignalStrengthInfo:error:");
}

id objc_msgSend_getSpatialInteractionDeviceTimestampArrayForClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSpatialInteractionDeviceTimestampArrayForClientID:");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getUniqueServiceNameForAdvertiser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUniqueServiceNameForAdvertiser");
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValue:");
}

id objc_msgSend_getXpcQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getXpcQueue");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "givenName");
}

id objc_msgSend_groupCall_withOtherCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupCall:withOtherCall:");
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupIdentifier");
}

id objc_msgSend_groupsMatchingPredicate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupsMatchingPredicate:error:");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handle");
}

id objc_msgSend_handleBrowseResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBrowseResults:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleRedialCommandWhileScreening_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRedialCommandWhileScreening:");
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleWithDestinationID:");
}

id objc_msgSend_handleXPCUnpairCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleXPCUnpairCommand:");
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardwareRevision");
}

id objc_msgSend_hardwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardwareVersion");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSentInvitation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSentInvitation");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hciTransportType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hciTransportType");
}

id objc_msgSend_heartRateMonitorEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heartRateMonitorEnabled");
}

id objc_msgSend_heySiriConfidence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heySiriConfidence");
}

id objc_msgSend_heySiriDeviceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heySiriDeviceClass");
}

id objc_msgSend_heySiriPerceptualHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heySiriPerceptualHash");
}

id objc_msgSend_heySiriProductType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heySiriProductType");
}

id objc_msgSend_heySiriRandom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heySiriRandom");
}

id objc_msgSend_heySiriSNR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heySiriSNR");
}

id objc_msgSend_hid3ppLELegacyMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hid3ppLELegacyMode");
}

id objc_msgSend_hideEarDetectionCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideEarDetectionCapability");
}

id objc_msgSend_hideFromBTSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideFromBTSettings");
}

id objc_msgSend_holdActiveCalls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdActiveCalls:");
}

id objc_msgSend_holdCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdCall:");
}

id objc_msgSend_hostConnectionInterruptedOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostConnectionInterruptedOn:");
}

id objc_msgSend_hostMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostMap");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_iCloudSignedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iCloudSignedIn");
}

id objc_msgSend_iOSLegacyIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iOSLegacyIdentifier");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierData");
}

id objc_msgSend_identityArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityArray");
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsDeviceID");
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsDeviceIdentifier");
}

id objc_msgSend_indexForCBApprovedAppID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexForCBApprovedAppID:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initPHYs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPHYs");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBTStackDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBTStackDevice:error:");
}

id objc_msgSend_initWithBluetoothAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBluetoothAddress:");
}

id objc_msgSend_initWithBundleID_serviceUUID_sessionType_sessionState_supportsBackgrounding_supportsStateRestoration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:serviceUUID:sessionType:sessionState:supportsBackgrounding:supportsStateRestoration:");
}

id objc_msgSend_initWithBundleIDs_states_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIDs:states:");
}

id objc_msgSend_initWithBundleIdentifier_flags_reason_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:flags:reason:name:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCBStackAdaptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCBStackAdaptor:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCall:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClientName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientName:");
}

id objc_msgSend_initWithConnection_isAdvToBrowserConnection_localUniqueID_withQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:isAdvToBrowserConnection:localUniqueID:withQueue:");
}

id objc_msgSend_initWithContactStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContactStore:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabaseFolderPath_cacheCount_errorMetricReporter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabaseFolderPath:cacheCount:errorMetricReporter:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithDevice_andBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevice:andBundleIdentifier:");
}

id objc_msgSend_initWithDevice_type_timeoutValue_targetCore_rssiThreshold_rssiThresholdGone_invalidRssiHandling_rssiPrecision_rssiPrecisionGone_eventConfiguration_vseBuffering_rssiIncreaseScanThreshold_rssiIncreaseScanWindowThreshold_rssiIncreaseScanIntervalThreshold_rssiIncreaseScanTimeoutThreshold_sensorTimeoutBetweenIncreaseScan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevice:type:timeoutValue:targetCore:rssiThreshold:rssiThresholdGone:invalidRssiHandling:rssiPrecision:rssiPrecisionGone:eventConfiguration:vseBuffering:rssiIncreaseScanThreshold:rssiIncreaseScanWindowThreshold:rssiIncreaseScanIntervalThreshold:rssiIncreaseScanTimeoutThreshold:sensorTimeoutBetweenIncreaseScan:");
}

id objc_msgSend_initWithDisplayType_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisplayType:handler:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIdentifier_handle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:handle:");
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKeyOptions:valueOptions:capacity:");
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKeysToFetch:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithMsg_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMsg:arguments:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:count:");
}

id objc_msgSend_initWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:forKeys:");
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:forKeys:count:");
}

id objc_msgSend_initWithOldResult_freshResult_change_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOldResult:freshResult:change:");
}

id objc_msgSend_initWithPID_flags_reason_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPID:flags:reason:name:");
}

id objc_msgSend_initWithPID_isApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPID:isApp:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRPI_encryptedAEM_timestamp_scanInterval_typicalRSSI_maxRSSI_saturated_counter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRPI:encryptedAEM:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithStarting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStarting:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_safe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:safe:");
}

id objc_msgSend_initWithStringValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStringValue:");
}

id objc_msgSend_initWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSince1970:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithType_device_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:device:bundleID:");
}

id objc_msgSend_initWithType_passkey_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:passkey:device:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedInt:");
}

id objc_msgSend_initWithXPCObject_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCObject:error:");
}

id objc_msgSend_initializeDatabases_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeDatabases:queue:");
}

id objc_msgSend_inquiryState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inquiryState");
}

id objc_msgSend_inquiryStateChangedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inquiryStateChangedHandler");
}

id objc_msgSend_insertIntoDeviceTableWithKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertIntoDeviceTableWithKey:value:");
}

id objc_msgSend_insertIntoWHBHostTableWithKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertIntoWHBHostTableWithKey:value:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instance");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_integerValueForField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValueForField:");
}

id objc_msgSend_interestedBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interestedBundleIDs");
}

id objc_msgSend_internalFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalFlags");
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interval");
}

id objc_msgSend_invalidRssiHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidRssiHandling");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAssertionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAssertionTimer");
}

id objc_msgSend_invalidateDirect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateDirect");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_irk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "irk");
}

id objc_msgSend_irkData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "irkData");
}

id objc_msgSend_isAdvToBrowserConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAdvToBrowserConnection");
}

id objc_msgSend_isAdvertisingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAdvertisingEnabled:");
}

id objc_msgSend_isAlive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAlive");
}

id objc_msgSend_isAlwaysOnEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAlwaysOnEnabled");
}

id objc_msgSend_isApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApp");
}

id objc_msgSend_isBackgroundingSupported_central_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackgroundingSupported:central:");
}

id objc_msgSend_isBluetoothModificationAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBluetoothModificationAllowed");
}

id objc_msgSend_isConferenced(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConferenced");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isDeviceConnected_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceConnected:error:");
}

id objc_msgSend_isDeviceSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceSupported:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEquivalentToCBDevice_compareFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEquivalentToCBDevice:compareFlags:");
}

id objc_msgSend_isHoldAndAnswerAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHoldAndAnswerAllowed");
}

id objc_msgSend_isKeyAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeyAvailable:");
}

id objc_msgSend_isLatencyCritical(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLatencyCritical");
}

id objc_msgSend_isLocalEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocalEndpoint:");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLowPowerModeEnabled");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_isNSArray__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSArray__");
}

id objc_msgSend_isNSData__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSData__");
}

id objc_msgSend_isNSDictionary__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSDictionary__");
}

id objc_msgSend_isNSNumber__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSNumber__");
}

id objc_msgSend_isNSString__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSString__");
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOutgoing");
}

id objc_msgSend_isPrivilegedBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPrivilegedBundleID:");
}

id objc_msgSend_isRestrictedCharacteristicsAccessAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRestrictedCharacteristicsAccessAllowed");
}

id objc_msgSend_isRunningInRecovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningInRecovery");
}

id objc_msgSend_isScanningEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isScanningEnabled");
}

id objc_msgSend_isScreening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isScreening");
}

id objc_msgSend_isSmartChargingCurrentlyEnabledForDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSmartChargingCurrentlyEnabledForDevice:withError:");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_jobTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jobTitle");
}

id objc_msgSend_json_hasAllProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "json:hasAllProperties:");
}

id objc_msgSend_json_hasAnyProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "json:hasAnyProperty:");
}

id objc_msgSend_keepAlive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keepAlive");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keyLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyLength");
}

id objc_msgSend_keyPathWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathWithKey:");
}

id objc_msgSend_keyType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyType");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_lastConnectedLEMAC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastConnectedLEMAC");
}

id objc_msgSend_lastKnownEstimates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKnownEstimates");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastSeenTicks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSeenTicks");
}

id objc_msgSend_launchAppForDialRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchAppForDialRequest:completion:");
}

id objc_msgSend_launchApplication_restoringCentrals_peripherals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchApplication:restoringCentrals:peripherals:");
}

id objc_msgSend_leSetAdvertisingSetRandomAddress_address_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leSetAdvertisingSetRandomAddress:address:");
}

id objc_msgSend_leSetExtendedAdvertisingData_advertisingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leSetExtendedAdvertisingData:advertisingData:");
}

id objc_msgSend_leSetExtendedAdvertisingEnable_numSets_advertisingHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leSetExtendedAdvertisingEnable:numSets:advertisingHandles:");
}

id objc_msgSend_leSetExtendedAdvertisingParameters_advertisingParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leSetExtendedAdvertisingParameters:advertisingParameters:");
}

id objc_msgSend_leSetExtendedScanEnable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leSetExtendedScanEnable:");
}

id objc_msgSend_leftBudSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftBudSerialNumber");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningMode");
}

id objc_msgSend_listeningModeConfigs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningModeConfigs");
}

id objc_msgSend_listeningServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningServices");
}

id objc_msgSend_listeningServicesV2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningServicesV2");
}

id objc_msgSend_loadDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadDatabase:");
}

id objc_msgSend_loadPairedDevice_address_ifMissing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadPairedDevice:address:ifMissing:");
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDevice");
}

id objc_msgSend_localDeviceForStableId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDeviceForStableId:");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTimeZone");
}

id objc_msgSend_localWhbDeviceForStableId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localWhbDeviceForStableId:");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedNameForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedNameForContext:");
}

id objc_msgSend_localizedStandardContainsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStandardContainsString:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:localization:");
}

id objc_msgSend_localizedStringForLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForLabel:");
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockState");
}

id objc_msgSend_logAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logAsset");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longTermKeyMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longTermKeyMap");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "macAddress");
}

id objc_msgSend_magicSettingsRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "magicSettingsRecord:completion:");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_managedByFindMy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedByFindMy");
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manufacturer");
}

id objc_msgSend_maskData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maskData");
}

id objc_msgSend_masterHint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "masterHint");
}

id objc_msgSend_masterKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "masterKey");
}

id objc_msgSend_matchesInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchesInString:options:range:");
}

id objc_msgSend_matchesWithDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchesWithDevice:");
}

id objc_msgSend_maxAllowedConnectionDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxAllowedConnectionDelay");
}

id objc_msgSend_maxConnectedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxConnectedDevices");
}

id objc_msgSend_maxSeenDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxSeenDevices");
}

id objc_msgSend_memoryPressureFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memoryPressureFlags");
}

id objc_msgSend_mergeStoresFromFolderPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeStoresFromFolderPath:");
}

id objc_msgSend_mergeTemporaryStores(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeTemporaryStores");
}

id objc_msgSend_microphoneMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "microphoneMode");
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "middleName");
}

id objc_msgSend_migratePlistData_database_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migratePlistData:database:type:");
}

id objc_msgSend_minRSSILevelForConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minRSSILevelForConnection");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_mixesVoiceWithMedia(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mixesVoiceWithMedia");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_modelUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelUser");
}

id objc_msgSend_modifyDevice_btDevice_settings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDevice:btDevice:settings:error:");
}

id objc_msgSend_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:");
}

id objc_msgSend_modifyDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDevice:error:");
}

id objc_msgSend_modifyDevice_leDevice_settings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDevice:leDevice:settings:error:");
}

id objc_msgSend_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:error:");
}

id objc_msgSend_modifyDevice_settings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDevice:settings:error:");
}

id objc_msgSend_modifyDeviceSupportInformationRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDeviceSupportInformationRecord:completion:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mrcEnable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mrcEnable");
}

id objc_msgSend_msgId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "msgId");
}

id objc_msgSend_multipleAdvInitialized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multipleAdvInitialized");
}

id objc_msgSend_multipleAdvInstancesInitialized_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multipleAdvInstancesInitialized:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_muteControlConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "muteControlConfig");
}

id objc_msgSend_myNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "myNumber");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nameFromSanitizedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameFromSanitizedName:");
}

id objc_msgSend_namePrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "namePrefix");
}

id objc_msgSend_nameSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameSuffix");
}

id objc_msgSend_nearbyActionAuthTagData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionAuthTagData");
}

id objc_msgSend_nearbyActionFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionFlags");
}

id objc_msgSend_nearbyActionNWPrecisionFindingStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionNWPrecisionFindingStatus");
}

id objc_msgSend_nearbyActionNoWakeAuthTagData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionNoWakeAuthTagData");
}

id objc_msgSend_nearbyActionNoWakeConfigData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionNoWakeConfigData");
}

id objc_msgSend_nearbyActionNoWakeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionNoWakeType");
}

id objc_msgSend_nearbyActionTargetData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionTargetData");
}

id objc_msgSend_nearbyActionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionType");
}

id objc_msgSend_nearbyActionV2Flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionV2Flags");
}

id objc_msgSend_nearbyActionV2TargetData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionV2TargetData");
}

id objc_msgSend_nearbyActionV2Type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionV2Type");
}

id objc_msgSend_nearbyAuthTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyAuthTag");
}

id objc_msgSend_nearbyInfoFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoFlags");
}

id objc_msgSend_nearbyInfoStatusProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoStatusProgress");
}

id objc_msgSend_nearbyInfoStatusTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoStatusTime");
}

id objc_msgSend_nearbyInfoStatusType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoStatusType");
}

id objc_msgSend_nearbyInfoV2AuthIntegrityTagData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2AuthIntegrityTagData");
}

id objc_msgSend_nearbyInfoV2AuthTagData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2AuthTagData");
}

id objc_msgSend_nearbyInfoV2DecryptedFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2DecryptedFlags");
}

id objc_msgSend_nearbyInfoV2EncryptedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2EncryptedData");
}

id objc_msgSend_nearbyInfoV2EncryptedFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2EncryptedFlags");
}

id objc_msgSend_nearbyInfoV2Flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2Flags");
}

id objc_msgSend_nearbyInfoV2InvitationCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2InvitationCounter");
}

id objc_msgSend_nearbyInfoV2InvitationRouteType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2InvitationRouteType");
}

id objc_msgSend_nearbyInfoV2RapportIRKData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyInfoV2RapportIRKData");
}

id objc_msgSend_needsAdvertisingAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsAdvertisingAddress");
}

id objc_msgSend_needsBLEScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsBLEScan");
}

id objc_msgSend_needsIdentify(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsIdentify");
}

id objc_msgSend_needsToRun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsToRun");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nickname");
}

id objc_msgSend_nonConnectableAddressData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonConnectableAddressData");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationAlerts");
}

id objc_msgSend_notificationWithName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationWithName:object:");
}

id objc_msgSend_notifyConnectedDeviceUUID_name_servicesUUIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyConnectedDeviceUUID:name:servicesUUIDs:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numLEConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numLEConnection");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfMatchesInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfMatchesInString:options:range:");
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfRanges");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithChar:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldDiscoveryFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldDiscoveryFlags");
}

id objc_msgSend_oldResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldResult");
}

id objc_msgSend_oobKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oobKeys");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openBundle_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openBundle:options:");
}

id objc_msgSend_openBundle_options_attempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openBundle:options:attempt:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openTapToRadarWithAccessoryLogs_reason_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openTapToRadarWithAccessoryLogs:reason:pid:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_openURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:");
}

id objc_msgSend_openWithOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openWithOptions:error:");
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operatingSystemVersionString");
}

id objc_msgSend_opportunistic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "opportunistic");
}

id objc_msgSend_optimalHostIdForStableId_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optimalHostIdForStableId:result:");
}

id objc_msgSend_optimalWHBHostForStableIdentifier_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optimalWHBHostForStableIdentifier:result:");
}

id objc_msgSend_optimalWhbDeviceForStableIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optimalWhbDeviceForStableIdentifier:completion:");
}

id objc_msgSend_optimizedBatteryCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optimizedBatteryCharging");
}

id objc_msgSend_optimizedBatteryFullChargeDeadline(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optimizedBatteryFullChargeDeadline");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_orderedSetWithOrderedSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSetWithOrderedSet:");
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationName");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientation");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputs");
}

id objc_msgSend_ownerSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownerSession");
}

id objc_msgSend_pairingAlertCallback_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingAlertCallback:flags:");
}

id objc_msgSend_pairingCompletedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingCompletedHandler");
}

id objc_msgSend_pairingContinueWithPairingInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingContinueWithPairingInfo:error:");
}

id objc_msgSend_pairingPromptHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPromptHandler");
}

id objc_msgSend_pairingType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingType");
}

id objc_msgSend_partIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partIdentifier");
}

id objc_msgSend_passkey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passkey");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_peerDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerDevice");
}

id objc_msgSend_peerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerID");
}

id objc_msgSend_performDeviceRequest_device_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performDeviceRequest:device:completionHandler:");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumbers");
}

id objc_msgSend_phoneticFamilyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneticFamilyName");
}

id objc_msgSend_phoneticGivenName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneticGivenName");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_pin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pin");
}

id objc_msgSend_pipeHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pipeHandle");
}

id objc_msgSend_placementMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placementMode");
}

id objc_msgSend_playDTMFToneForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playDTMFToneForKey:");
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portType");
}

id objc_msgSend_postComponentStatusEventFor_status_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postComponentStatusEventFor:status:withReply:");
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postNotificationName_object_userInfo_deliverImmediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:deliverImmediately:");
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postalAddresses");
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postalCode");
}

id objc_msgSend_powerAlertCallback_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerAlertCallback:flags:");
}

id objc_msgSend_powerSourceUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerSourceUpdate");
}

id objc_msgSend_powerState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerState");
}

id objc_msgSend_poweredOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poweredOn");
}

id objc_msgSend_predicateForContactsInGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForContactsInGroupWithIdentifier:");
}

id objc_msgSend_predicateForContactsMatchingName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForContactsMatchingName:");
}

id objc_msgSend_predicateForContactsMatchingPhoneNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForContactsMatchingPhoneNumber:");
}

id objc_msgSend_predicateForLegacyIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForLegacyIdentifier:");
}

id objc_msgSend_predicateForiOSLegacyIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForiOSLegacyIdentifier:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prefEnforceApprovedExtensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefEnforceApprovedExtensions");
}

id objc_msgSend_prefEnforceApprovedList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefEnforceApprovedList");
}

id objc_msgSend_prefSystemReferenceTimeDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefSystemReferenceTimeDisabled");
}

id objc_msgSend_prefWiProxAdvertising(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefWiProxAdvertising");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_prefsChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefsChanged");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "present");
}

id objc_msgSend_primaryBudSide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryBudSide");
}

id objc_msgSend_primaryCBDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryCBDevice");
}

id objc_msgSend_primaryFolderVersions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryFolderVersions");
}

id objc_msgSend_primaryPlacement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryPlacement");
}

id objc_msgSend_printDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printDatabase:");
}

id objc_msgSend_printDebug(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printDebug");
}

id objc_msgSend_processAllowedWithAuditToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAllowedWithAuditToken:error:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productID");
}

id objc_msgSend_productInfoWithProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productInfoWithProductID:");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productName");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_providerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerWithIdentifier:");
}

id objc_msgSend_proximityPairingProductID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proximityPairingProductID");
}

id objc_msgSend_publicAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicAddress");
}

id objc_msgSend_publishAndRegisterDevice_withArgs_uid_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishAndRegisterDevice:withArgs:uid:device:");
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "punctuationCharacterSet");
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purge:");
}

id objc_msgSend_purgeAdvertismentsSeenBeforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeAdvertismentsSeenBeforeDate:");
}

id objc_msgSend_purgeAllStoresInActiveDatabasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeAllStoresInActiveDatabasePath");
}

id objc_msgSend_purgeAllStoresInPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeAllStoresInPath:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queryMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryMetaData:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_randomUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "randomUUID");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfComposedCharacterSequencesForRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rankWHBHosts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankWHBHosts:");
}

id objc_msgSend_ratchet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ratchet");
}

id objc_msgSend_readCustomPropertiesJSONForDevice_inDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readCustomPropertiesJSONForDevice:inDatabase:");
}

id objc_msgSend_readCustomPropertiesJSONForDeviceUUID_inDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readCustomPropertiesJSONForDeviceUUID:inDatabase:");
}

id objc_msgSend_readDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDevice:");
}

id objc_msgSend_readDeviceByAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDeviceByAddress:");
}

id objc_msgSend_readDeviceFromDatabase_statement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDeviceFromDatabase:statement:");
}

id objc_msgSend_readIntFromDatabase_statement_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readIntFromDatabase:statement:value:");
}

id objc_msgSend_readPrefKeys_source_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readPrefKeys:source:error:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_receiveNextMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveNextMessage");
}

id objc_msgSend_receivedUpdateEvent_hostID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedUpdateEvent:hostID:");
}

id objc_msgSend_recordEventWithDeviceIdentifier_initiator_starting_useCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordEventWithDeviceIdentifier:initiator:starting:useCase:");
}

id objc_msgSend_recordEventWithStarting_useCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordEventWithStarting:useCase:");
}

id objc_msgSend_redialLastNumberWithUid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redialLastNumberWithUid:");
}

id objc_msgSend_registerApplication_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerApplication:pid:");
}

id objc_msgSend_registerEventID_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEventID:options:handler:");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_registerSmartCoverStateObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerSmartCoverStateObserver:");
}

id objc_msgSend_registerWithCloudPairedDevices_identifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWithCloudPairedDevices:identifiers:");
}

id objc_msgSend_registrationDisplayStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registrationDisplayStatus");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_relayMessageHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relayMessageHandler");
}

id objc_msgSend_releaseActiveCalls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseActiveCalls:");
}

id objc_msgSend_relinquishAudioRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relinquishAudioRoute");
}

id objc_msgSend_remoteAdvDataSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteAdvDataSet");
}

id objc_msgSend_remoteAlertAllowedAndReturnReason_extension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteAlertAllowedAndReturnReason:extension:");
}

id objc_msgSend_remoteAlertStartWithCBExtension_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteAlertStartWithCBExtension:device:error:");
}

id objc_msgSend_remoteControllersChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteControllersChanged");
}

id objc_msgSend_remoteDeregisterConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteDeregisterConnection:");
}

id objc_msgSend_remoteDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteDevice");
}

id objc_msgSend_remoteEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteEndpoint");
}

id objc_msgSend_remoteHostID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteHostID");
}

id objc_msgSend_remoteRegisterConnection_clientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteRegisterConnection:clientID:");
}

id objc_msgSend_remoteUniqueIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteUniqueIDString");
}

id objc_msgSend_removeAdvertisingRequest_forDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAdvertisingRequest:forDaemon:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeBTVCBonjourLinkDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBTVCBonjourLinkDelegate:");
}

id objc_msgSend_removeCustomPropertiesJSONForDeviceUUID_inDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCustomPropertiesJSONForDeviceUUID:inDatabase:");
}

id objc_msgSend_removeDevice_internal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDevice:internal:");
}

id objc_msgSend_removeDeviceFromDeviceTable_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeviceFromDeviceTable:value:");
}

id objc_msgSend_removeDevicesDuplicatesOf_originalUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDevicesDuplicatesOf:originalUuid:");
}

id objc_msgSend_removeDiscoverableController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDiscoverableController:");
}

id objc_msgSend_removeFromDeviceTableWithKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromDeviceTableWithKey:value:");
}

id objc_msgSend_removeInternalFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeInternalFlags:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePairingClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePairingClient:");
}

id objc_msgSend_removeUserFilteredClockWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUserFilteredClockWithIdentifier:error:");
}

id objc_msgSend_removeXpcClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeXpcClient:");
}

id objc_msgSend_removefromRemoteHostMapWithKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removefromRemoteHostMapWithKey:");
}

id objc_msgSend_removefromRemoteHostMapWithKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removefromRemoteHostMapWithKey:value:");
}

id objc_msgSend_removeuserPreference_sync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeuserPreference:sync:");
}

id objc_msgSend_replaceBytesInRange_withBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:");
}

id objc_msgSend_replaceBytesInRange_withBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:length:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reportAggressiveScan_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportAggressiveScan:action:");
}

id objc_msgSend_reportAuthTagType_authTagStatus_integrityTagStatus_resolutionWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportAuthTagType:authTagStatus:integrityTagStatus:resolutionWindow:");
}

id objc_msgSend_reportCBDiscovery_daemonCnx_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportCBDiscovery:daemonCnx:action:");
}

id objc_msgSend_reportDeviceFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDeviceFound:");
}

id objc_msgSend_reportDeviceLost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDeviceLost:");
}

id objc_msgSend_reportDevicesBuffered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDevicesBuffered:");
}

id objc_msgSend_reportWhbMetric_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportWhbMetric:");
}

id objc_msgSend_reportxpcCBAdvertiserUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportxpcCBAdvertiserUpdate:");
}

id objc_msgSend_republishAllAudioDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "republishAllAudioDevices");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestFlags");
}

id objc_msgSend_requestForClientType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestForClientType:");
}

id objc_msgSend_requiresLowLatency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresLowLatency");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetCBExtension_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetCBExtension:error:");
}

id objc_msgSend_resetDisconnectionHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetDisconnectionHistory");
}

id objc_msgSend_resetNearbyInfoV2SensitiveProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetNearbyInfoV2SensitiveProperties");
}

id objc_msgSend_resetServerConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetServerConnection");
}

id objc_msgSend_resetSyncServiceWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetSyncServiceWithError:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_resultChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultChanges");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rightBudSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightBudSerialNumber");
}

id objc_msgSend_roaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roaming");
}

id objc_msgSend_roomName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roomName");
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssi");
}

id objc_msgSend_rssiIncreaseScanIntervalThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiIncreaseScanIntervalThreshold");
}

id objc_msgSend_rssiIncreaseScanThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiIncreaseScanThreshold");
}

id objc_msgSend_rssiIncreaseScanTimeoutThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiIncreaseScanTimeoutThreshold");
}

id objc_msgSend_rssiIncreaseScanWindowThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiIncreaseScanWindowThreshold");
}

id objc_msgSend_rssiPrecision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiPrecision");
}

id objc_msgSend_rssiPrecisionGone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiPrecisionGone");
}

id objc_msgSend_rssiThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiThreshold");
}

id objc_msgSend_rssiThresholdGone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiThresholdGone");
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "running");
}

id objc_msgSend_safetyAlertsAlertData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsAlertData");
}

id objc_msgSend_safetyAlertsAlertID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsAlertID");
}

id objc_msgSend_safetyAlertsSegmentSegmentNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsSegmentSegmentNumber");
}

id objc_msgSend_safetyAlertsSegmentSegmentsTotal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsSegmentSegmentsTotal");
}

id objc_msgSend_safetyAlertsSignature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsSignature");
}

id objc_msgSend_safetyAlertsVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsVersion");
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "save");
}

id objc_msgSend_saveContactTracingAdvertisement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveContactTracingAdvertisement:");
}

id objc_msgSend_scanEnable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanEnable:");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanRate");
}

id objc_msgSend_scanRateScreenOff(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanRateScreenOff");
}

id objc_msgSend_scanRateScreenOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanRateScreenOn");
}

id objc_msgSend_scanScreenOffCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanScreenOffCount");
}

id objc_msgSend_scanScreenOnCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanScreenOnCount");
}

id objc_msgSend_scanWithRetainDuplicates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanWithRetainDuplicates");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheduleAdvertiserUpdateImmediate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleAdvertiserUpdateImmediate:");
}

id objc_msgSend_scheduleControlUpdateImmediate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleControlUpdateImmediate:");
}

id objc_msgSend_scheduleDiscoveryUpdateImmediate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleDiscoveryUpdateImmediate:");
}

id objc_msgSend_scheduleSpatialUpdateImmediate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleSpatialUpdateImmediate:");
}

id objc_msgSend_scheduleUpdateImmediate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleUpdateImmediate:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenLocked");
}

id objc_msgSend_screenLockedSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenLockedSync");
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenOn");
}

id objc_msgSend_screenStateChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenStateChanged:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_secondaryFolderVersions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryFolderVersions");
}

id objc_msgSend_secondaryPlacement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryPlacement");
}

id objc_msgSend_secondsLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsLeft");
}

id objc_msgSend_seenDeviceCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seenDeviceCount");
}

id objc_msgSend_selectiveSpeechListeningCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectiveSpeechListeningCapability");
}

id objc_msgSend_selectiveSpeechListeningConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectiveSpeechListeningConfig");
}

id objc_msgSend_selfAuthTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selfAuthTag");
}

id objc_msgSend_selfAuthTagNonConnectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selfAuthTagNonConnectable");
}

id objc_msgSend_sendAudioAccessoryConfig_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAudioAccessoryConfig:device:error:");
}

id objc_msgSend_sendAudioAccessoryEventMessage_eventType_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAudioAccessoryEventMessage:eventType:device:error:");
}

id objc_msgSend_sendCloudKitPush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCloudKitPush");
}

id objc_msgSend_sendCloudpairingRetry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCloudpairingRetry:");
}

id objc_msgSend_sendCoexUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCoexUpdate:");
}

id objc_msgSend_sendConversationDetectMessage_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendConversationDetectMessage:device:error:");
}

id objc_msgSend_sendData_toDevice_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendData:toDevice:completionHandler:");
}

id objc_msgSend_sendDataMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDataMessage:completion:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendEventID_event_destinationID_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventID:event:destinationID:options:completion:");
}

id objc_msgSend_sendMsg_withArgs_uid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMsg:withArgs:uid:");
}

id objc_msgSend_sendRelayMessageType_messageData_conduitDevice_destinationDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRelayMessageType:messageData:conduitDevice:destinationDevice:error:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_sendSmartRoutingInformation_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSmartRoutingInformation:device:error:");
}

id objc_msgSend_sensorTimeoutBetweenIncreaseScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorTimeoutBetweenIncreaseScan");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serialNumberLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumberLeft");
}

id objc_msgSend_serialNumberRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumberRight");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverConnection");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceData");
}

id objc_msgSend_serviceFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceFlags");
}

id objc_msgSend_serviceTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceTypes");
}

id objc_msgSend_serviceUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceUUID");
}

id objc_msgSend_serviceUUID16(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceUUID16");
}

id objc_msgSend_serviceUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceUUIDs");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_sessionHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionHandle");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessibilityHeadTrackingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityHeadTrackingEnabled:");
}

id objc_msgSend_setAccessoryHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryHint:");
}

id objc_msgSend_setAccessoryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryKey:");
}

id objc_msgSend_setAccessoryStatusFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryStatusFlags:");
}

id objc_msgSend_setAccessoryStatusOBCTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryStatusOBCTime:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActivatedAdvertiser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivatedAdvertiser:");
}

id objc_msgSend_setActivatedConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivatedConnection:");
}

id objc_msgSend_setActivatedController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivatedController:");
}

id objc_msgSend_setActivatedDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivatedDiscovery:");
}

id objc_msgSend_setActivatedSpatialInteractionSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivatedSpatialInteractionSession:");
}

id objc_msgSend_setAdaptiveVolumeCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdaptiveVolumeCapability:");
}

id objc_msgSend_setAdaptiveVolumeConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdaptiveVolumeConfig:");
}

id objc_msgSend_setAddressChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddressChangedHandler:");
}

id objc_msgSend_setAdvReportReceiveHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvReportReceiveHandler:");
}

id objc_msgSend_setAdvertiseEnableEPA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertiseEnableEPA:");
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertiseRate:");
}

id objc_msgSend_setAdvertiserArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertiserArray:");
}

id objc_msgSend_setAdvertiserEnableEPA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertiserEnableEPA:");
}

id objc_msgSend_setAdvertiserState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertiserState:");
}

id objc_msgSend_setAdvertisingAddressChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisingAddressChangedHandler:");
}

id objc_msgSend_setAdvertisingAddressData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisingAddressData:");
}

id objc_msgSend_setAdvertisingAddressDataConnectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisingAddressDataConnectable:");
}

id objc_msgSend_setAdvertisingAddressDataNonConnectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisingAddressDataNonConnectable:");
}

id objc_msgSend_setAdvertisingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisingData:");
}

id objc_msgSend_setAdvertisingRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisingRate:");
}

id objc_msgSend_setAdvertisingStateUpdateHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertisingStateUpdateHandler:");
}

id objc_msgSend_setAirplaySourceAuthTagData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirplaySourceAuthTagData:");
}

id objc_msgSend_setAncAssetVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAncAssetVersion:");
}

id objc_msgSend_setAncsRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAncsRequired:");
}

id objc_msgSend_setAopDataHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAopDataHandler:");
}

id objc_msgSend_setAosState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAosState:");
}

id objc_msgSend_setAppID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppID:");
}

id objc_msgSend_setAppearanceValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppearanceValue:");
}

id objc_msgSend_setAppleTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppleTypes:");
}

id objc_msgSend_setAssertionFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssertionFlags:");
}

id objc_msgSend_setAudioAccessoryEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioAccessoryEventHandler:");
}

id objc_msgSend_setAudioAccessoryInfoChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioAccessoryInfoChangedHandler:");
}

id objc_msgSend_setAudioLinkQualityArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioLinkQualityArray:");
}

id objc_msgSend_setAudioSourceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioSourceIdentifier:");
}

id objc_msgSend_setAudioStreamState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioStreamState:");
}

id objc_msgSend_setAutoANCCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoANCCapability:");
}

id objc_msgSend_setAutoANCStrength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoANCStrength:");
}

id objc_msgSend_setAutoAncCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoAncCapability:");
}

id objc_msgSend_setBatteryInfoCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryInfoCase:");
}

id objc_msgSend_setBatteryInfoLeft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryInfoLeft:");
}

id objc_msgSend_setBatteryInfoMain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryInfoMain:");
}

id objc_msgSend_setBatteryInfoRight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryInfoRight:");
}

id objc_msgSend_setBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBehavior:");
}

id objc_msgSend_setBitRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBitRate:");
}

id objc_msgSend_setBleAddressData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleAddressData:");
}

id objc_msgSend_setBleAdvRSSI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleAdvRSSI:");
}

id objc_msgSend_setBleAdvertisementTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleAdvertisementTimestamp:");
}

id objc_msgSend_setBleAdvertisementTimestampMachContinuous_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleAdvertisementTimestampMachContinuous:");
}

id objc_msgSend_setBleAppleManufacturerData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleAppleManufacturerData:");
}

id objc_msgSend_setBleChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleChannel:");
}

id objc_msgSend_setBleRSSI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleRSSI:");
}

id objc_msgSend_setBleRSSIThresholdHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleRSSIThresholdHint:");
}

id objc_msgSend_setBleRSSIThresholdOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleRSSIThresholdOrder:");
}

id objc_msgSend_setBleScanRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleScanRate:");
}

id objc_msgSend_setBleScanRateOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleScanRateOverride:");
}

id objc_msgSend_setBleScanRateScreenOff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleScanRateScreenOff:");
}

id objc_msgSend_setBluetoothState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothState:");
}

id objc_msgSend_setBluetoothStateChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothStateChangedHandler:");
}

id objc_msgSend_setBobbleCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBobbleCapability:");
}

id objc_msgSend_setBrowser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrowser:");
}

id objc_msgSend_setBrowserState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrowserState:");
}

id objc_msgSend_setBtAddressData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtAddressData:");
}

id objc_msgSend_setBtBand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtBand:");
}

id objc_msgSend_setBtSessionHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtSessionHandle:");
}

id objc_msgSend_setBtVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtVersion:");
}

id objc_msgSend_setBudsFirmwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBudsFirmwareVersion:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setButtonModes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonModes:");
}

id objc_msgSend_setCallMgmtMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallMgmtMsg:");
}

id objc_msgSend_setCalls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalls:");
}

id objc_msgSend_setCancelHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelHandler:");
}

id objc_msgSend_setCaseFirmwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaseFirmwareVersion:");
}

id objc_msgSend_setCaseName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaseName:");
}

id objc_msgSend_setCaseSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaseSerialNumber:");
}

id objc_msgSend_setCaseSoundCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaseSoundCapability:");
}

id objc_msgSend_setCaseVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaseVersion:");
}

id objc_msgSend_setCbDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCbDevice:");
}

id objc_msgSend_setCentralBackgroundingSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCentralBackgroundingSupported:");
}

id objc_msgSend_setChangeFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChangeFlags:");
}

id objc_msgSend_setChipsetID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChipsetID:");
}

id objc_msgSend_setClassicRSSI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassicRSSI:");
}

id objc_msgSend_setClickHoldModeLeft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClickHoldModeLeft:");
}

id objc_msgSend_setClickHoldModeRight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClickHoldModeRight:");
}

id objc_msgSend_setClientBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientBundleID:");
}

id objc_msgSend_setClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientID:");
}

id objc_msgSend_setClientProcessID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientProcessID:");
}

id objc_msgSend_setCodecType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCodecType:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setColorInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorInfo:");
}

id objc_msgSend_setCompletedFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedFlags:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConnectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectable:");
}

id objc_msgSend_setConnectedDeviceCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectedDeviceCount:");
}

id objc_msgSend_setConnectedServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectedServices:");
}

id objc_msgSend_setConnectingClients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectingClients:");
}

id objc_msgSend_setConnectingToPANServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectingToPANServices:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConnectionAlerts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionAlerts:");
}

id objc_msgSend_setConnectionFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionFlags:");
}

id objc_msgSend_setConnectionHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionHandle:");
}

id objc_msgSend_setConnectionScanDutyCycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionScanDutyCycle:");
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionUUID:");
}

id objc_msgSend_setConnectionUseCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionUseCase:");
}

id objc_msgSend_setControllerDataChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControllerDataChangedHandler:");
}

id objc_msgSend_setControllerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControllerID:");
}

id objc_msgSend_setConversationDetectCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConversationDetectCapability:");
}

id objc_msgSend_setConversationDetectConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConversationDetectConfig:");
}

id objc_msgSend_setCore0TargetPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCore0TargetPower:");
}

id objc_msgSend_setCore1TargetPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCore1TargetPower:");
}

id objc_msgSend_setCrownRotationDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCrownRotationDirection:");
}

id objc_msgSend_setCtkdChosenTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCtkdChosenTransport:");
}

id objc_msgSend_setCurrentPCAP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPCAP:");
}

id objc_msgSend_setCurrentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentState:");
}

id objc_msgSend_setCurrentUserRandomAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentUserRandomAddress:");
}

id objc_msgSend_setDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaemon:");
}

id objc_msgSend_setDaemonServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaemonServer:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDatabaseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatabaseIdentifier:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceChangedHandler:");
}

id objc_msgSend_setDeviceControllerMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceControllerMap:");
}

id objc_msgSend_setDeviceDidConnectHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDidConnectHandler:");
}

id objc_msgSend_setDeviceDidDisconnectHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDidDisconnectHandler:");
}

id objc_msgSend_setDeviceDidReceiveDataHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDidReceiveDataHandler:");
}

id objc_msgSend_setDeviceDidStartScanning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDidStartScanning:");
}

id objc_msgSend_setDeviceFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFilter:");
}

id objc_msgSend_setDeviceFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFlags:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceIDFeatureBitsV1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceIDFeatureBitsV1:");
}

id objc_msgSend_setDeviceIDFeatureBitsV2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceIDFeatureBitsV2:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDeviceMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMap:");
}

id objc_msgSend_setDeviceMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMatching:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDeviceNotificationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceNotificationHandler:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setDevicesBufferedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevicesBufferedHandler:");
}

id objc_msgSend_setDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDictionary:");
}

id objc_msgSend_setDidConnectHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidConnectHandler:");
}

id objc_msgSend_setDidDisconnectHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidDisconnectHandler:");
}

id objc_msgSend_setDidReceiveDataHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidReceiveDataHandler:");
}

id objc_msgSend_setDisableLeGATT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableLeGATT:");
}

id objc_msgSend_setDisabledActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisabledActive:");
}

id objc_msgSend_setDisabledPending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisabledPending:");
}

id objc_msgSend_setDisconnectionAlerts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisconnectionAlerts:");
}

id objc_msgSend_setDiscoverableState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoverableState:");
}

id objc_msgSend_setDiscoverableStateChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoverableStateChangedHandler:");
}

id objc_msgSend_setDiscoveryArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryArray:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDiscoveryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryInfo:");
}

id objc_msgSend_setDiscoveryTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryTypes:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setDoNotBlockOnNetworkStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoNotBlockOnNetworkStatus:");
}

id objc_msgSend_setDockKitAccessoryPayloadData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDockKitAccessoryPayloadData:");
}

id objc_msgSend_setDoubleTapActionLeft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoubleTapActionLeft:");
}

id objc_msgSend_setDoubleTapActionRight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoubleTapActionRight:");
}

id objc_msgSend_setDoubleTapCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoubleTapCapability:");
}

id objc_msgSend_setDuplicateCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuplicateCount:");
}

id objc_msgSend_setEarTipFitTestCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEarTipFitTestCapability:");
}

id objc_msgSend_setEnableAutoReconnect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableAutoReconnect:");
}

id objc_msgSend_setEnableControllerBTClockUpdates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableControllerBTClockUpdates:");
}

id objc_msgSend_setEnableEPAForAdvertising_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableEPAForAdvertising:");
}

id objc_msgSend_setEnableScanCore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableScanCore:");
}

id objc_msgSend_setEnableTransportBridging_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableTransportBridging:");
}

id objc_msgSend_setEncryptionKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptionKey:");
}

id objc_msgSend_setEndCallCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndCallCapability:");
}

id objc_msgSend_setEndCallConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndCallConfig:");
}

id objc_msgSend_setEndpointUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndpointUUID:");
}

id objc_msgSend_setEntitled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEntitled:");
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorHandler:");
}

id objc_msgSend_setEstimatedConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedConnections:");
}

id objc_msgSend_setEstimatedConnectionsLastUpdatedTicks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedConnectionsLastUpdatedTicks:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setExtensionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionID:");
}

id objc_msgSend_setExtensionsDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionsDaemon:");
}

id objc_msgSend_setExtraDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtraDiscoveryFlags:");
}

id objc_msgSend_setFastLEConnectionInfoData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFastLEConnectionInfoData:");
}

id objc_msgSend_setFastLEConnectionInfoVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFastLEConnectionInfoVersion:");
}

id objc_msgSend_setFidoPayloadData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFidoPayloadData:");
}

id objc_msgSend_setFindMyCaseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFindMyCaseIdentifier:");
}

id objc_msgSend_setFindMyGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFindMyGroupIdentifier:");
}

id objc_msgSend_setFirmwareName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirmwareName:");
}

id objc_msgSend_setFirmwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirmwareVersion:");
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirstUnlockHandler:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setFormatOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatOptions:");
}

id objc_msgSend_setFrequencyBand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrequencyBand:");
}

id objc_msgSend_setGapaFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGapaFlags:");
}

id objc_msgSend_setGfpPayloadData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGfpPayloadData:");
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandle:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHardwareAddressData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHardwareAddressData:");
}

id objc_msgSend_setHardwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHardwareVersion:");
}

id objc_msgSend_setHciTransportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHciTransportType:");
}

id objc_msgSend_setHeartRateMonitorEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeartRateMonitorEnabled:");
}

id objc_msgSend_setHid3ppLELegacyMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHid3ppLELegacyMode:");
}

id objc_msgSend_setHideEarDetectionCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHideEarDetectionCapability:");
}

id objc_msgSend_setHideFromBTSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHideFromBTSettings:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setICloudSignedIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setICloudSignedIn:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentifierData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifierData:");
}

id objc_msgSend_setIdsDeviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdsDeviceID:");
}

id objc_msgSend_setInitPHYs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitPHYs:");
}

id objc_msgSend_setInputReportHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputReportHandler:");
}

id objc_msgSend_setInquiryState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInquiryState:");
}

id objc_msgSend_setInquiryStateChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInquiryStateChangedHandler:");
}

id objc_msgSend_setInternalFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalFlags:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIrk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIrk:");
}

id objc_msgSend_setIrkData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIrkData:");
}

id objc_msgSend_setIsAlive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAlive:");
}

id objc_msgSend_setIsApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsApp:");
}

id objc_msgSend_setIsConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsConnected:");
}

id objc_msgSend_setIsLatencyCritical_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLatencyCritical:");
}

id objc_msgSend_setIsRanging_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRanging:");
}

id objc_msgSend_setJitterBufferSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setJitterBufferSeconds:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLastChipsetInitError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastChipsetInitError:");
}

id objc_msgSend_setLastSeenTicks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSeenTicks:");
}

id objc_msgSend_setLatestDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLatestDevice:");
}

id objc_msgSend_setLeAdvName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeAdvName:");
}

id objc_msgSend_setLeaVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeaVersion:");
}

id objc_msgSend_setLeeway_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeeway:");
}

id objc_msgSend_setLeftBudSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBudSerialNumber:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLinkKeyData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkKeyData:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setListeningMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeningMode:");
}

id objc_msgSend_setListeningModeConfigs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeningModeConfigs:");
}

id objc_msgSend_setListeningServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeningServices:");
}

id objc_msgSend_setListeningServicesV2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeningServicesV2:");
}

id objc_msgSend_setLmpVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLmpVersion:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLowPowerModeWithReason_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowPowerModeWithReason:completionHandler:");
}

id objc_msgSend_setLowPowerModeWithReason_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowPowerModeWithReason:error:");
}

id objc_msgSend_setLtkData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLtkData:");
}

id objc_msgSend_setManufacturer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManufacturer:");
}

id objc_msgSend_setMasterHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasterHint:");
}

id objc_msgSend_setMasterKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasterKey:");
}

id objc_msgSend_setMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatching:");
}

id objc_msgSend_setMaxAllowedConnectionDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxAllowedConnectionDelay:");
}

id objc_msgSend_setMaxDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxDelay:");
}

id objc_msgSend_setMessagesAppLockState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessagesAppLockState:");
}

id objc_msgSend_setMicrophoneMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMicrophoneMode:");
}

id objc_msgSend_setMinDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinDelay:");
}

id objc_msgSend_setMinRSSILevelForConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinRSSILevelForConnection:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setModelNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModelNumber:");
}

id objc_msgSend_setModelUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModelUser:");
}

id objc_msgSend_setMrcEnable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMrcEnable:");
}

id objc_msgSend_setMultipleAdvInitialized_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMultipleAdvInitialized:");
}

id objc_msgSend_setMuteControlCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMuteControlCapability:");
}

id objc_msgSend_setMuteControlConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMuteControlConfig:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNearbyActionData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNearbyActionData:");
}

id objc_msgSend_setNearbyInfoV2AuthIntegrityTagData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNearbyInfoV2AuthIntegrityTagData:");
}

id objc_msgSend_setNearbyInfoV2AuthTagData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNearbyInfoV2AuthTagData:");
}

id objc_msgSend_setNearbyInfoV2RapportIRKData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNearbyInfoV2RapportIRKData:");
}

id objc_msgSend_setNickname_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNickname:");
}

id objc_msgSend_setNoiseFloor90_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoiseFloor90:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNotificationAlerts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationAlerts:");
}

id objc_msgSend_setNumLEConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumLEConnection:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOldDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOldDiscoveryFlags:");
}

id objc_msgSend_setOobKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOobKeys:");
}

id objc_msgSend_setOpportunistic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpportunistic:");
}

id objc_msgSend_setOptimizedBatteryCharging_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptimizedBatteryCharging:");
}

id objc_msgSend_setOptimizedBatteryFullChargeDeadline_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptimizedBatteryFullChargeDeadline:");
}

id objc_msgSend_setPHYOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPHYOptions:");
}

id objc_msgSend_setPairingCompletedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingCompletedHandler:");
}

id objc_msgSend_setPairingPromptHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingPromptHandler:");
}

id objc_msgSend_setPairingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingType:");
}

id objc_msgSend_setPasskey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasskey:");
}

id objc_msgSend_setPayloadFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadFields:");
}

id objc_msgSend_setPeerDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerDevice:");
}

id objc_msgSend_setPeerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerID:");
}

id objc_msgSend_setPeripheralBackgroundingSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeripheralBackgroundingSupported:");
}

id objc_msgSend_setPeripheralsUpdatedCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeripheralsUpdatedCallback:");
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPid:");
}

id objc_msgSend_setPin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPin:");
}

id objc_msgSend_setPlacementMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlacementMode:");
}

id objc_msgSend_setPowerChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerChangedHandler:");
}

id objc_msgSend_setPowerState_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerState:error:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresent:");
}

id objc_msgSend_setPrimaryBudSide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryBudSide:");
}

id objc_msgSend_setPrimaryCBDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryCBDevice:");
}

id objc_msgSend_setPrimaryFolderVersions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryFolderVersions:");
}

id objc_msgSend_setPrimaryPlacement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryPlacement:");
}

id objc_msgSend_setProductID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductID:");
}

id objc_msgSend_setProductName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductName:");
}

id objc_msgSend_setProximityServiceData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProximityServiceData:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRatchet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRatchet:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRelayMessageHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelayMessageHandler:");
}

id objc_msgSend_setRemoteAccepted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteAccepted:");
}

id objc_msgSend_setRemoteClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteClient:");
}

id objc_msgSend_setRemoteClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteClientID:");
}

id objc_msgSend_setRemoteDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteDevice:");
}

id objc_msgSend_setRemoteHostID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteHostID:");
}

id objc_msgSend_setRemoteUniqueIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteUniqueIDString:");
}

id objc_msgSend_setReport_reportLength_withIdentifier_forType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReport:reportLength:withIdentifier:forType:error:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequiresLowLatency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresLowLatency:");
}

id objc_msgSend_setResetDisconnectionHistory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResetDisconnectionHistory:");
}

id objc_msgSend_setResetHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResetHandler:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponse:");
}

id objc_msgSend_setRetransmitRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetransmitRate:");
}

id objc_msgSend_setRightBudSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBudSerialNumber:");
}

id objc_msgSend_setRoaming_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRoaming:");
}

id objc_msgSend_setRssi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssi:");
}

id objc_msgSend_setRssiAverage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssiAverage:");
}

id objc_msgSend_setRssiIncreaseScanIntervalThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssiIncreaseScanIntervalThreshold:");
}

id objc_msgSend_setRssiIncreaseScanThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssiIncreaseScanThreshold:");
}

id objc_msgSend_setRssiIncreaseScanTimeoutThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssiIncreaseScanTimeoutThreshold:");
}

id objc_msgSend_setRssiIncreaseScanWindowThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRssiIncreaseScanWindowThreshold:");
}

id objc_msgSend_setRunLoopSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunLoopSource:");
}

id objc_msgSend_setSaAddressDataArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSaAddressDataArray:");
}

id objc_msgSend_setSaServiceDataArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSaServiceDataArray:");
}

id objc_msgSend_setSafetyAlertsSegmentServiceData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSafetyAlertsSegmentServiceData:");
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanRate:");
}

id objc_msgSend_setScanRateScreenOff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanRateScreenOff:");
}

id objc_msgSend_setScanRateScreenOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanRateScreenOn:");
}

id objc_msgSend_setScanScreenOffCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanScreenOffCount:");
}

id objc_msgSend_setScanScreenOnCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanScreenOnCount:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setScreenLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenLocked:");
}

id objc_msgSend_setScreenLockedChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenLockedChangedHandler:");
}

id objc_msgSend_setScreenOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenOn:");
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenOnChangedHandler:");
}

id objc_msgSend_setScreeningCall_isScreening_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreeningCall:isScreening:");
}

id objc_msgSend_setSecondaryFolderVersions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryFolderVersions:");
}

id objc_msgSend_setSecondaryPlacement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryPlacement:");
}

id objc_msgSend_setSecondsLeft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondsLeft:");
}

id objc_msgSend_setSeenDeviceCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeenDeviceCount:");
}

id objc_msgSend_setSelectiveSpeechListeningCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectiveSpeechListeningCapability:");
}

id objc_msgSend_setSelectiveSpeechListeningConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectiveSpeechListeningConfig:");
}

id objc_msgSend_setSelfAuthTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelfAuthTag:");
}

id objc_msgSend_setSelfAuthTagNonConnectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelfAuthTagNonConnectable:");
}

id objc_msgSend_setSensorTimeoutBetweenIncreaseScan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSensorTimeoutBetweenIncreaseScan:");
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumber:");
}

id objc_msgSend_setSerialNumberLeft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumberLeft:");
}

id objc_msgSend_setSerialNumberRight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumberRight:");
}

id objc_msgSend_setServerConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServerConnection:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceData:");
}

id objc_msgSend_setServiceDataArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceDataArray:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setServiceUUID16_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceUUID16:");
}

id objc_msgSend_setSettingsMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSettingsMask:");
}

id objc_msgSend_setSetupAssistantIfNoKeyboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupAssistantIfNoKeyboard:");
}

id objc_msgSend_setSetupAssistantIfNoPointingDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupAssistantIfNoPointingDevice:");
}

id objc_msgSend_setSignalToNoiseRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSignalToNoiseRatio:");
}

id objc_msgSend_setSiriMultitoneCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiriMultitoneCapability:");
}

id objc_msgSend_setSmartRoutingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmartRoutingMode:");
}

id objc_msgSend_setSniffInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSniffInterval:");
}

id objc_msgSend_setSortOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortOrder:");
}

id objc_msgSend_setSourceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceIdentifier:");
}

id objc_msgSend_setSpatialAudioMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialAudioMode:");
}

id objc_msgSend_setSpatialInteractionAdvertiseRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionAdvertiseRate:");
}

id objc_msgSend_setSpatialInteractionDeviceTimestampArrayClientIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionDeviceTimestampArrayClientIDs:");
}

id objc_msgSend_setSpatialInteractionDeviceTimestampArrayDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionDeviceTimestampArrayDictionary:");
}

id objc_msgSend_setSpatialInteractionDeviceTimestampArrayForClientID_clientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionDeviceTimestampArrayForClientID:clientID:");
}

id objc_msgSend_setSpatialInteractionFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionFlags:");
}

id objc_msgSend_setSpatialInteractionIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionIdentifiers:");
}

id objc_msgSend_setSpatialInteractionPeerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionPeerID:");
}

id objc_msgSend_setSpatialInteractionUWBConfigData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialInteractionUWBConfigData:");
}

id objc_msgSend_setSpatialSoundProfileAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpatialSoundProfileAllowed:");
}

id objc_msgSend_setStackAdaptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStackAdaptor:");
}

id objc_msgSend_setStartTicks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartTicks:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStateChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateChangedHandler:");
}

id objc_msgSend_setStatusString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusString:");
}

id objc_msgSend_setStopOnAdvertisingAddressChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStopOnAdvertisingAddressChange:");
}

id objc_msgSend_setStreamStateAoS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamStateAoS:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSupportedServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedServices:");
}

id objc_msgSend_setSupportsBackgroundedCentrals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsBackgroundedCentrals:");
}

id objc_msgSend_setSupportsBackgroundedPeripherals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsBackgroundedPeripherals:");
}

id objc_msgSend_setSystemFlags_mask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemFlags:mask:");
}

id objc_msgSend_setSystemLockStateChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemLockStateChangedHandler:");
}

id objc_msgSend_setSystemMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemMonitor:");
}

id objc_msgSend_setSystemOverrideFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemOverrideFlags:");
}

id objc_msgSend_setSystemOverrideHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemOverrideHandler:");
}

id objc_msgSend_setSystemUIChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemUIChangedHandler:");
}

id objc_msgSend_setTargetUserSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetUserSession:");
}

id objc_msgSend_setTemporaryIRK_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTemporaryIRK:");
}

id objc_msgSend_setTemporaryIdentityAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTemporaryIdentityAddress:");
}

id objc_msgSend_setTemporaryLTK_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTemporaryLTK:");
}

id objc_msgSend_setTestAdvertiser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestAdvertiser:");
}

id objc_msgSend_setTestAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestAssertion:");
}

id objc_msgSend_setTestDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestDiscovery:");
}

id objc_msgSend_setTestListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestListenerEndpoint:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTipiChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTipiChangedHandler:");
}

id objc_msgSend_setTipiConnectionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTipiConnectionStatus:");
}

id objc_msgSend_setTipiDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTipiDevices:");
}

id objc_msgSend_setTipiState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTipiState:");
}

id objc_msgSend_setTokenData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTokenData:");
}

id objc_msgSend_setTriggerTicks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTriggerTicks:");
}

id objc_msgSend_setTxAddressData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTxAddressData:");
}

id objc_msgSend_setTxPower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTxPower:");
}

id objc_msgSend_setTxPowerAuxConnectReq_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTxPowerAuxConnectReq:");
}

id objc_msgSend_setTxPowerConnectInd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTxPowerConnectInd:");
}

id objc_msgSend_setTxPowerMax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTxPowerMax:");
}

id objc_msgSend_setUiTicks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUiTicks:");
}

id objc_msgSend_setUseCaseList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseCaseList:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVendorID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVendorID:");
}

id objc_msgSend_setVendorIDSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVendorIDSource:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setViewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllerClassName:");
}

id objc_msgSend_setWaitForConnectionPoll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitForConnectionPoll:");
}

id objc_msgSend_setWantsObjectDiscoveryData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsObjectDiscoveryData:");
}

id objc_msgSend_setWantsToScreenCalls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsToScreenCalls:");
}

id objc_msgSend_setWhbDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWhbDaemon:");
}

id objc_msgSend_setWifiCriticalOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWifiCriticalOverride:");
}

id objc_msgSend_setWifiStateChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWifiStateChangedHandler:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setXpcCnx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcCnx:");
}

id objc_msgSend_setXpcDiscoveryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcDiscoveryInfo:");
}

id objc_msgSend_setXpcSendEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcSendEventHandler:");
}

id objc_msgSend_setXpcToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcToken:");
}

id objc_msgSend_settingsMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsMask");
}

id objc_msgSend_setupAssistantIfNoKeyboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAssistantIfNoKeyboard");
}

id objc_msgSend_setupAssistantIfNoPointingDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAssistantIfNoPointingDevice");
}

id objc_msgSend_setuserPreference_value_sync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setuserPreference:value:sync:");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedBTVCLinkAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBTVCLinkAgent");
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBacklight");
}

id objc_msgSend_sharedCBMetricsDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCBMetricsDaemon");
}

id objc_msgSend_sharedClockManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedClockManager");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedDaemonBridge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDaemonBridge");
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDefaults");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPreferences");
}

id objc_msgSend_shouldAdvertiseSafetyAlerts_advData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAdvertiseSafetyAlerts:advData:");
}

id objc_msgSend_showAppLaunchAlert_device_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAppLaunchAlert:device:type:");
}

id objc_msgSend_showFileRadarNotification_reason_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showFileRadarNotification:reason:pid:");
}

id objc_msgSend_showFoundAccessoryCrashAlert_productID_accessoryName_firmwareVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showFoundAccessoryCrashAlert:productID:accessoryName:firmwareVersion:");
}

id objc_msgSend_showFoundAccessoryLogAlert_isCrash_pid_accessoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showFoundAccessoryLogAlert:isCrash:pid:accessoryName:");
}

id objc_msgSend_showPairingAlert_type_passkey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showPairingAlert:type:passkey:");
}

id objc_msgSend_showPowerAlert_forDenylistMode_validateBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showPowerAlert:forDenylistMode:validateBundle:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_siriMultitoneCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriMultitoneCapability");
}

id objc_msgSend_smartRoutingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smartRoutingMode");
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:reply:");
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortOrder");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_soundProfileChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundProfileChanged");
}

id objc_msgSend_soundProfileData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundProfileData");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_sourceVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceVersion");
}

id objc_msgSend_spatialAudioAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialAudioAllowed");
}

id objc_msgSend_spatialAudioMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialAudioMode");
}

id objc_msgSend_spatialInteractionAdvertiseRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialInteractionAdvertiseRate");
}

id objc_msgSend_spatialInteractionDeviceTimestampArrayClientIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialInteractionDeviceTimestampArrayClientIDs");
}

id objc_msgSend_spatialInteractionDeviceTimestampArrayDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialInteractionDeviceTimestampArrayDictionary");
}

id objc_msgSend_spatialInteractionFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialInteractionFlags");
}

id objc_msgSend_spatialInteractionIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialInteractionIdentifiers");
}

id objc_msgSend_spatialInteractionPeerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialInteractionPeerID");
}

id objc_msgSend_spatialInteractionUWBConfigData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialInteractionUWBConfigData");
}

id objc_msgSend_spatialSoundProfileAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialSoundProfileAllowed");
}

id objc_msgSend_stableIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stableIdentifier");
}

id objc_msgSend_stackBLEScanner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackBLEScanner");
}

id objc_msgSend_stackController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackController");
}

id objc_msgSend_startActivityUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startActivityUpdatesToQueue:withHandler:");
}

id objc_msgSend_startAdvertisingOfType_withData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAdvertisingOfType:withData:");
}

id objc_msgSend_startAdvertisingWithData_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAdvertisingWithData:completionHandler:");
}

id objc_msgSend_startAssertionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAssertionTimer");
}

id objc_msgSend_startCatalogDownload_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCatalogDownload:then:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDeviceOrientationUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeviceOrientationUpdatesToQueue:withHandler:");
}

id objc_msgSend_startDirect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDirect");
}

id objc_msgSend_startDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiscovery");
}

id objc_msgSend_startDownload_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownload:then:");
}

id objc_msgSend_startLPEMConfigSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLPEMConfigSession:");
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startListening");
}

id objc_msgSend_startListeningToPowerUIStatusChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startListeningToPowerUIStatusChanges");
}

id objc_msgSend_startScanningForType_data_mask_peers_scanMode_rssi_duplicates_scanCache_useCaseList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:");
}

id objc_msgSend_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSessionForUserIdentifier:bundleId:vendorIdentifierList:completion:");
}

id objc_msgSend_startTicks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTicks");
}

id objc_msgSend_startUpServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUpServices");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stationary");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopActivityUpdates");
}

id objc_msgSend_stopAdvertisingForData_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAdvertisingForData:completionHandler:");
}

id objc_msgSend_stopAdvertisingOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAdvertisingOfType:");
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDiscovery");
}

id objc_msgSend_stopScanningForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopScanningForType:");
}

id objc_msgSend_stopSessionForUserIdentifier_bundleId_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSessionForUserIdentifier:bundleId:completion:");
}

id objc_msgSend_storeControllerInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeControllerInfo:completion:");
}

id objc_msgSend_storedAdvertisementCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storedAdvertisementCount");
}

id objc_msgSend_streamStateAoS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamStateAoS");
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "street");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromContact:style:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subjectMonitorRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subjectMonitorRegistry");
}

id objc_msgSend_subscribeToCoexStateUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribeToCoexStateUpdates");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptions");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_succeededDirect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "succeededDirect");
}

id objc_msgSend_successfulConnectionForPeripheral_leMAC_ltk_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successfulConnectionForPeripheral:leMAC:ltk:completion:");
}

id objc_msgSend_supportedServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedServices");
}

id objc_msgSend_supportsBackgroundedCentrals(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBackgroundedCentrals");
}

id objc_msgSend_supportsBackgroundedPeripherals(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBackgroundedPeripherals");
}

id objc_msgSend_supportsDTMF(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDTMF");
}

id objc_msgSend_supportsHolding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsHolding");
}

id objc_msgSend_supportsUngrouping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsUngrouping");
}

id objc_msgSend_swapCalls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swapCalls");
}

id objc_msgSend_switchToCentralStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToCentralStore");
}

id objc_msgSend_symbolCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "symbolCharacterSet");
}

id objc_msgSend_syncSendConnectionEvent_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncSendConnectionEvent:completion:");
}

id objc_msgSend_systemLockStateSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLockStateSync");
}

id objc_msgSend_systemOverrideFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemOverrideFlags");
}

id objc_msgSend_systemOverrideHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemOverrideHandler");
}

id objc_msgSend_systemUIFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemUIFlags");
}

id objc_msgSend_tableNameForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableNameForType:");
}

id objc_msgSend_takeAssertionForProcess_duration_isUrgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takeAssertionForProcess:duration:isUrgent:");
}

id objc_msgSend_targetCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetCore");
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephonyProvider");
}

id objc_msgSend_temporarilyDisableSmartChargingForDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporarilyDisableSmartChargingForDevice:withError:");
}

id objc_msgSend_temporarilyEnableChargingForDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporarilyEnableChargingForDevice:withError:");
}

id objc_msgSend_temporaryIRK(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryIRK");
}

id objc_msgSend_temporaryIdentityAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryIdentityAddress");
}

id objc_msgSend_temporaryLTK(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryLTK");
}

id objc_msgSend_temporaryStoresPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryStoresPresent");
}

id objc_msgSend_testAdvertiser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAdvertiser");
}

id objc_msgSend_testAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAssertion");
}

id objc_msgSend_testDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testDiscovery");
}

id objc_msgSend_thumbnailImageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailImageData");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeoutSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutSeconds");
}

id objc_msgSend_timeoutValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutValue");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timer");
}

id objc_msgSend_timerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithTimeInterval:repeats:block:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_tipiChangedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tipiChangedHandler");
}

id objc_msgSend_tokenData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenData");
}

id objc_msgSend_translateApplicationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "translateApplicationState:");
}

id objc_msgSend_triggerIfPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerIfPending");
}

id objc_msgSend_triggerTicks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerTicks");
}

id objc_msgSend_triggeredDeviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggeredDeviceMap");
}

id objc_msgSend_tryLoadProtectedCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tryLoadProtectedCache");
}

id objc_msgSend_tuCallCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuCallCenter");
}

id objc_msgSend_txPowerAuxConnectReq(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txPowerAuxConnectReq");
}

id objc_msgSend_txPowerConnectInd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txPowerConnectInd");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_typeToRssiThresholds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeToRssiThresholds");
}

id objc_msgSend_uiTicks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uiTicks");
}

id objc_msgSend_unSubscribeFromCoexStateUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unSubscribeFromCoexStateUpdates");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unfilteredDeadlineForDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unfilteredDeadlineForDevice:withError:");
}

id objc_msgSend_ungroupCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ungroupCall:");
}

id objc_msgSend_unholdCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unholdCall:");
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:");
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueProxyIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueProxyIdentifier");
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unknown");
}

id objc_msgSend_unregisterApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterApplication:");
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterObserver:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateApplicationAliveStatus_isAlive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateApplicationAliveStatus:isAlive:");
}

id objc_msgSend_updateApplicationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateApplicationState:");
}

id objc_msgSend_updateCoexUpdate_whbHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCoexUpdate:whbHost:");
}

id objc_msgSend_updateControllerInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateControllerInfo:error:");
}

id objc_msgSend_updateCountryConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCountryConfiguration:");
}

id objc_msgSend_updateDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDevices");
}

id objc_msgSend_updateIdentities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateIdentities:");
}

id objc_msgSend_updateInterestedBundleIDs_states_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateInterestedBundleIDs:states:");
}

id objc_msgSend_updateOBCDeadline_forDevice_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateOBCDeadline:forDevice:withError:");
}

id objc_msgSend_updateProtectedCacheMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProtectedCacheMetrics");
}

id objc_msgSend_updateRandomAddressContinuityAdvInstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRandomAddressContinuityAdvInstance:");
}

id objc_msgSend_updateWithBLEDevice_btAddr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithBLEDevice:btAddr:");
}

id objc_msgSend_updateWithCBAdvertiser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithCBAdvertiser:");
}

id objc_msgSend_updateWithCBDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithCBDevice:");
}

id objc_msgSend_updateWithCBDeviceIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithCBDeviceIdentity:");
}

id objc_msgSend_updateWithCBDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithCBDiscovery:");
}

id objc_msgSend_updateWithClassicDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithClassicDevice:");
}

id objc_msgSend_updateWithClassicDevice_deviceUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithClassicDevice:deviceUUID:");
}

id objc_msgSend_updateWithPowerSourceDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithPowerSourceDescription:");
}

id objc_msgSend_updateWithRPIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithRPIdentity:");
}

id objc_msgSend_updateWithReceivedAuthTag_forType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithReceivedAuthTag:forType:");
}

id objc_msgSend_updateWithSafetyAlertsSegments_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithSafetyAlertsSegments:error:");
}

id objc_msgSend_updateWithSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithSession:");
}

id objc_msgSend_updateWithXPCDiscoveryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithXPCDiscoveryInfo:");
}

id objc_msgSend_updateWithXPCSubscriberInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithXPCSubscriberInfo:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_urgentAssertionInvalidationCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urgentAssertionInvalidationCallback:");
}

id objc_msgSend_urlAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlAddresses");
}

id objc_msgSend_useCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useCase");
}

id objc_msgSend_useCaseList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useCaseList");
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userContext");
}

id objc_msgSend_userControllerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userControllerClass");
}

id objc_msgSend_userDefaultVoice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDefaultVoice");
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userIdentifier");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_utf8ValueSafe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utf8ValueSafe");
}

id objc_msgSend_uwbConfigData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uwbConfigData");
}

id objc_msgSend_uwbTokenFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uwbTokenFlags");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_value_withObjCType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value:withObjCType:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorID");
}

id objc_msgSend_vendorIDSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorIDSource");
}

id objc_msgSend_verifyAuthTag_data_type_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyAuthTag:data:type:error:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_viewControllerClassName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerClassName");
}

id objc_msgSend_voiceTriggerEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceTriggerEnabled");
}

id objc_msgSend_vseBuffering(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vseBuffering");
}

id objc_msgSend_waitForConnectionPoll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForConnectionPoll");
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walking");
}

id objc_msgSend_wantsObjectDiscoveryData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wantsObjectDiscoveryData");
}

id objc_msgSend_wasLocal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasLocal");
}

id objc_msgSend_watchSetupData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchSetupData");
}

id objc_msgSend_whbDeviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whbDeviceMap");
}

id objc_msgSend_whbDiscoveryDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whbDiscoveryDaemon");
}

id objc_msgSend_whbStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whbStop");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_wifiCriticalOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiCriticalOverride");
}

id objc_msgSend_wifiFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiFlags");
}

id objc_msgSend_wipeDatabaseNameOrigin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wipeDatabaseNameOrigin:");
}

id objc_msgSend_writeCustomPropertiesJSONForDevice_inDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeCustomPropertiesJSONForDevice:inDatabase:");
}

id objc_msgSend_writeDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDevice:");
}

id objc_msgSend_writePrefKey_value_source_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePrefKey:value:source:error:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_xpcCnx(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcCnx");
}

id objc_msgSend_xpcConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnections");
}

id objc_msgSend_xpcDiscoveryInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcDiscoveryInfo");
}

id objc_msgSend_xpcEventAllowedInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEventAllowedInfo:");
}

id objc_msgSend_xpcEventRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEventRepresentation");
}

id objc_msgSend_xpcListenerEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcListenerEndpoint");
}

id objc_msgSend_xpcObjectRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcObjectRepresentation");
}

id objc_msgSend_xpcReceivedAudioAccessoryDeviceInfoChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceivedAudioAccessoryDeviceInfoChange:");
}

id objc_msgSend_xpcReceivedAudioAccessoryEventType_messageData_sourceDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceivedAudioAccessoryEventType:messageData:sourceDevice:");
}

id objc_msgSend_xpcReceivedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceivedEvent:");
}

id objc_msgSend_xpcReceivedForwardedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceivedForwardedEvent:");
}

id objc_msgSend_xpcReceivedRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceivedRequest:");
}

id objc_msgSend_xpcToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcToken");
}

