void sub_1003D2940(char *a1, _QWORD *a2, os_log_t log)
{
  int v3;
  _QWORD *v4;

  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315138;
  v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pruneLogFiles: directory %s does not exist", (uint8_t *)&v3, 0xCu);
}

void sub_1003D29C4()
{
  __assert_rtn("-[NIServerRangingAuthSession configure]", "NIServerRangingAuthSession.mm", 93, "_configuration");
}

void sub_1003D29EC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("Missing entitlement");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#ses-secure-ranging,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003D2A60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-secure-ranging,Discovery token doesn't contain an AWDL mac address", a5, a6, a7, a8, 0);
}

void sub_1003D2A94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-secure-ranging,Discovery token doesn't contain a secure ranging key", a5, a6, a7, a8, 0);
}

void sub_1003D2AC8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("Failed to start WiFi service. session is nil");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#ses-secure-ranging,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003D2B3C(char *a1, _QWORD *a2, NSObject *a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;

  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136380675;
  v5 = v3;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#ses-secure-ranging,WiFi ranging error:%{private}s", (uint8_t *)&v4);
  sub_10000BFC4();
}

void sub_1003D2BB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "regulatory,geof,qm,default,fUwbOnDelay, %.1f", a5, a6, a7, a8, 0);
}

void sub_1003D2C24()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 90, "handler && \"invalid handler\"");
}

void sub_1003D2C4C()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 91, "fIniitalized && \"must call initialize(state) first\"");
}

void sub_1003D2C74()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 94, "handlerFn != std::end(state_handlers)");
}

void sub_1003D2C9C()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 112, "retState == newState");
}

void sub_1003D2CC4()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 109, "retState == oldState");
}

void sub_1003D2CEC()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 99, "newState == oldState");
}

void sub_1003D2D14()
{
  __assert_rtn("setTimeoutEventInternal", "PRStateMachine.h", 156, "false");
}

void sub_1003D2D3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-devicepresence,error triggering enhanced discovery", a5, a6, a7, a8, 0);
}

void sub_1003D2D70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-devicepresence,error invalidating deviceDiscovery", a5, a6, a7, a8, 0);
}

void sub_1003D2DA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,enhanced discovery failed with error %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D2E04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,Invalid sample provided: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D2E64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,Invalid model provided: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D2EC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,#QE_Log This shouldn't happen partIdentifierHash is 0 for sample: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D2F24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,#QE_Log Pairable device presence accepting sample: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D2F84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,invalid btaddress length: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D2FE4()
{
  __assert_rtn("-[NIServerDevicePresenceSession configure]", "NIServerDevicePresenceSession.mm", 572, "_configuration");
}

void sub_1003D300C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#ses-devicepresence,Failed to get object from identifier: %llx", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003D3074()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: SystemHealth library not available", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D30A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: Game mode notification fired after destruct", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D30CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#system-health,_tryToSendScheduledHealthReport: No scheduled report. Possible race condition in sending it?", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D30F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#system-health,_tryToSendScheduledHealthReport: Failed to create SystemHealthManager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D3124()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: Background activity fired after destruct", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D3150()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: Background activity dispatch after destruct", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D317C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#system-health,_tryToSendScheduledHealthReport: Failed to notify SystemHealthManager of HW status. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1003D31F0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100029D1C((void *)&_mh_execute_header, a2, a3, "#ses-ecosystem,Error adding service client: %@", (uint8_t *)&v3);
}

void sub_1003D325C()
{
  __assert_rtn("-[NIServerNearbyAccessorySession configure]", "NIServerNearbyAccessorySession.mm", 221, "_configuration");
}

void sub_1003D3284()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#ses-ecosystem,Configuration does not have a discovery token.", v1, 2u);
  sub_10000991C();
}

void sub_1003D32BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceDidGenerateShareableConfigurationData while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D32E8(uint64_t a1)
{
  sub_10003E3F0(a1 + 672, *(_QWORD **)(a1 + 680));
}

void sub_1003D3308()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceDidReceiveNewSolution while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D3334()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,skipping measurement due to a lack of mach continuous timestamp.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D3360(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#ses-ecosystem,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
  sub_10000991C();
}

void sub_1003D33D4(uint64_t a1)
{
  sub_10003E3F0(a1 + 672, *(_QWORD **)(a1 + 680));
}

void sub_1003D33E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceRequestDidUpdateStatus while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D3410()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceDidInvalidateWithReason while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D343C(char *a1, uint64_t a2, NSObject *a3)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = v4;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#ses-ecosystem,Rose session invalidated unexpectedly. Reason: %s", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_1003D34A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,accessoryGATTServiceFailedWithError while session disabled. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D34D0(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-ecosystem,Bluetooth device %@. Error: %@", buf, 0x16u);

}

void sub_1003D3534()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,accessoryGATTServiceAuthorizedBackgroundOperation while session invalidated. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D3560(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#bt-accessory,BackgroundAuthorization: not tracking listener [%@]", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D35C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#bt-accessory,BackgroundAuthorization: listener is nil [%@]", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D3630(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_10001B0D0((void *)&_mh_execute_header, a2, a3, "#bt-accessory,BackgroundAuthorization: tracking listener [%@] but not peer [%@]", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_10000BFC4();
}

void sub_1003D36A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#bt-accessory,ConnectToPeer [%@]: BT not available", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D3704()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#bt-accessory,ConnectToPeer [%@]: not paired", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D3764()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#bt-accessory,ConnectToPeer [%@]: not already connected", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D37C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didConnectPeripheral [%@]: No matching peer", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D3824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didConnectPeripheral [%@]: Unexpected connection success", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D3884()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didFailToConnectPeripheral [%@]: No matching peer. Error: %@");
  sub_10000BFC4();
}

void sub_1003D38E4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didFailToConnectPeripheral [%@]: Unexpected connection failure: %@");
  sub_10000BFC4();
}

void sub_1003D3944()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didDisconnectPeripheral [%@]: No matching peer. Error: %@");
  sub_10000BFC4();
}

void sub_1003D39A4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: No matching peer. Error: %@");
  sub_10000BFC4();
}

void sub_1003D3A04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: Service not discovered", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D3A64()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: Error discovering service: %@");
  sub_10000BFC4();
}

void sub_1003D3AC4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: Unexpected service discovery. Error: %@");
  sub_10000BFC4();
}

void sub_1003D3B24()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: No matching peer. Error: %@");
  sub_10000BFC4();
}

void sub_1003D3B84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: Characteristics not discovered", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D3BE4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: Error discovering characteristics: %@");
  sub_10000BFC4();
}

void sub_1003D3C44()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: Unexpected characteristic discovery. Error: %@");
  sub_10000BFC4();
}

void sub_1003D3CA4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: No matching peer. Error: %@");
  sub_10000BFC4();
}

void sub_1003D3D04()
{
  uint64_t v0;
  os_log_t v1;

  sub_10019198C();
  sub_1001919AC((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Unexpectedly large");
  sub_10000BFC4();
}

void sub_1003D3D64()
{
  uint64_t v0;
  os_log_t v1;

  sub_10019198C();
  sub_1001919AC((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Could not read config count");
  sub_10000BFC4();
}

void sub_1003D3DC4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Error: %@");
  sub_10000BFC4();
}

void sub_1003D3E24()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B0E4();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Unexpected characteristic update. Error: %@");
  sub_10000BFC4();
}

void sub_1003D3E84()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001B110();
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,BackgroundAuthorization: listener [%@] for peer [%@] NOT authorized");
  sub_10000BFC4();
}

void sub_1003D3EF4()
{
  __assert_rtn("+[NIUtils NISessionBackgroundModeToString:]", "NIUtils.mm", 169, "false");
}

void sub_1003D3F1C()
{
  __assert_rtn("+[NIUtils NINearbyObjectUpdateRateToString:]", "NIUtils.mm", 185, "false");
}

void sub_1003D3F44()
{
  __assert_rtn("+[NIUtils NINearbyObjectUpdateRateToShortString:]", "NIUtils.mm", 201, "false");
}

void sub_1003D3F6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "~PRRosePowerManager()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D3F98(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PRRosePowerManager: Invalid roseDefaultPowerVoteCount, using system default %d", (uint8_t *)v1, 8u);
  sub_10000991C();
}

void sub_1003D4010()
{
  __assert_rtn("releasePower_block_invoke", "PRRosePowerManager.mm", 92, "fPowerVoteCount >= 0");
}

void sub_1003D4038()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRosePowerManager: Failed to start RoseIdleTimer, aborting.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4064()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRosePowerManager: RoseIdleTimer timeout unexpected, aborting", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4090()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "PRRosePowerManager: fRoseIdleTimer Timeout Callback.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D40BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a2, a3, "#nisessmgr,no signing identity for pid: %d. Rejecting connection.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003D4120(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#nisessmgr,Observation session was not permitted.", v1, 2u);
  sub_10000991C();
}

void sub_1003D415C(os_log_t log)
{
  int v1;
  const __CFString *v2;

  v1 = 138477827;
  v2 = CFSTR("nil session is not allowed to activate.");
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#nisessmgr,%{private}@", (uint8_t *)&v1, 0xCu);
}

void sub_1003D41DC(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  const __CFString *v4;

  v2[0] = 67174915;
  v2[1] = a1;
  v3 = 2113;
  v4 = CFSTR("exceeded kMaxActivatedSessionsPerProcess");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#nisessmgr,pid %{private}d %{private}@.", (uint8_t *)v2, 0x12u);
}

void sub_1003D4264()
{
  __assert_rtn("onRoseStateEvent", "PRRoseProvider.mm", 1306, "reason.has_value()");
}

void sub_1003D428C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::Error", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D42B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got measurement ticket id: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D431C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::NewMeasurement", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4348()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::RequestStatus", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,======================================================================", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D43A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#roseprovider,Rx2SOI_RSSIChain3_dBm: %f", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003D4408()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx1SOI_RSSIChain3_dBm: %f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D446C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx2SOI_RSSIChain2_dBm: %f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D44D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx1SOI_RSSIChain2_dBm: %f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D4534()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx2SOI_RSSIChain1_dBm: %f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D4598()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx1SOI_RSSIChain1_dBm: %f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D45FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "#roseprovider,Cycle Index: %hu", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4660()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "#roseprovider,Session ID: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D46C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,RangeDebugEvent:", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D46F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,tat_r: %llu", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D4750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,rtt_r: %llu", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D47B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,tat_i: %llu", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D4810()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#roseprovider,rtt_i: %llu", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D4870(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a1, a3, "#roseprovider,Anchor Time Offset: %u", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003D48D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,RangeDebugV2Event:", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::RangeResultDebugEvent", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::CIRDataEvent", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D495C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got AOACIRDataEvent ticket id: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D49C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::AOACIRDataEvent", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D49EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got TOACIRDataEvent ticket id: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4A50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::TOACIRDataEvent", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4A7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got TOACIRDataV2Event ticket id: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4AE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::TOACIRDataV2Event", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4B0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,cannot parse hello response for unknown HSI", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4B38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::HelloResponse", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4B64(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#roseprovider,Rose event of unknown opcode : %d", (uint8_t *)v2, 8u);
  sub_10000991C();
}

void sub_1003D4BD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::CoexEventData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4C00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::SuperframeComplete", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4C2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::PowerStatsResponse", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4C58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::SessionStartReport", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4C84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - SessionDataReport", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4CB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::SubrateUpdate", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D4CDC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#roseprovider,LPEM enable response status %d is not RoseFWErrorCode::Success", (uint8_t *)v2, 8u);
  sub_10000991C();
}

void sub_1003D4D4C()
{
  __assert_rtn("onRoseReport", "PRRoseProvider.mm", 1754, "false");
}

void sub_1003D4D74()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[18];
  __int16 v4;
  int v5;

  sub_10019EAAC();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-bt-rssi: timestamp = %llu, connHandle = %d, rssi = %d", v3, 0x18u);
  sub_10000BFC4();
}

void sub_1003D4DF4()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10019EAAC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#roseprovider,#aop-disp-error: ioReportTimeDeltaUs = %llu, state = %d", v1, 0x12u);
  sub_10000BFC4();
}

void sub_1003D4E6C()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10019EAAC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-displacement: timestamp = %llu, state = %d", v1, 0x12u);
  sub_10000BFC4();
}

void sub_1003D4EE4()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;

  sub_100154B28();
  v3 = 1024;
  v4 = v0;
  v5 = 1024;
  v6 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-sf-update: updateType = %u, btConnHandle = 0x%04x (%u)", v2, 0x14u);
  sub_10000BFC4();
}

void sub_1003D4F6C()
{
  __int16 v0;
  uint64_t v1;
  int v2;
  int v3;
  os_log_t v4;
  uint8_t v5[48];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  sub_10019EA7C();
  v6 = v0;
  v7 = v1;
  v8 = 1024;
  v9 = v2;
  v10 = 1024;
  v11 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-bt-rssi: connHandle = %d, bubbleEnterdBm = %2.1f, bubbleExitThresholddBm = %2.1f, displacingProcessStd = %2.1f, staticProcessStd = %2.1f, measStd = %2.1f, negativeMeasurementRejectionThreshold = %d, txPowerdBm = %d", v5, 0x46u);
}

void sub_1003D5018()
{
  int v0;
  int v1;
  int v2;
  os_log_t v3;
  uint8_t v4[48];
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;

  sub_10019EA7C();
  v5 = 1024;
  v6 = v0;
  v7 = 1024;
  v8 = v1;
  v9 = 1024;
  v10 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-bt-rssi: connHandle = %d, timestamp = %llu, filter state: rssi = %3.1f, variance = %3.2f, lastAOPTimestamp = %llu, isInBubble: %d, isInitialized: %d, isDisplacing: %d", v4, 0x42u);
}

void sub_1003D50C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,~PRRoseProvider()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D50F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,_getPreflightInfo, powerOnAndWaitForReady failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D511C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,_getChipInfo, powerOnAndWaitForReady failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,_getChipPublicKey, powerOnAndWaitForReady failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5174()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_10019EAD0(__stack_chk_guard);
  sub_10019EAE4();
  HIWORD(v3) = 36;
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#roseprovider,Unexpected outputBuffer size (%zu) for AOPRoseError (%zu)", v2, v3);
  sub_10000BFC4();
}

void sub_1003D51DC()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10015ABE4((void *)&_mh_execute_header, v7, v8, "#roseprovider,%s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D5224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Timed out while waiting for hello response.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5250()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10015ABE4((void *)&_mh_execute_header, v7, v8, "#roseprovider,Rose returned error. Command type: %s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D5298()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Failed to probe AOP activity report.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D52C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#roseprovider,#aop-activity Requested AOP activity summary, but timed out waiting for part 1.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D52F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#roseprovider,#aop-activity Requested AOP activity summary, but timed out waiting for part 2.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D531C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#roseprovider,#time-convert Requested time conversion, but timed out waiting for report.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5348()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#roseprovider,#time-convert Rose failed to request time conversion.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha capabilities.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D53A0()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10015ABE4((void *)&_mh_execute_header, v7, v8, "#roseprovider,#alisha Rose returned error. Command type: %s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D53E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha key.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5414()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha key (temporary workaround to prewarm Rose-SE secure channel).", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5440()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha debug set key response.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D546C()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10015ABE4((void *)&_mh_execute_header, v7, v8, "#roseprovider,#aop-sf Rose returned error. Command type: %s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D54B4()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_10019EAD0(__stack_chk_guard);
  sub_10019EAE4();
  HIWORD(v3) = 1;
  sub_10001B0D0((void *)&_mh_execute_header, v0, v1, "#roseprovider,#deep-slp Unexpected outputBuffer size (%zu) for DeepSleepState (%zu)", v2, v3);
  sub_10000BFC4();
}

void sub_1003D551C()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10015ABE4((void *)&_mh_execute_header, v7, v8, "#roseprovider,#deep-slp Rose returned error while sending command. Command type:%s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D5564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha delete keys response.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5590(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;

  if ((a1 - 1) > 2u)
    v2 = "GetKeyResponse";
  else
    v2 = off_10080B338[(char)(a1 - 1)];
  v3 = 136315138;
  v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#roseprovider,#alisha delete keys - got %s report type.", (uint8_t *)&v3, 0xCu);
  sub_10000BFC4();
}

void sub_1003D562C()
{
  __assert_rtn("_sendAlishaDeleteKeysCommandSync", "PRRoseProvider.mm", 814, "inBuffer.size() == sizeof(aop::SupervisorCommandPackets::AlishaDeleteKeysPacket)");
}

void sub_1003D5654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Timed out while waiting for power stats response.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Unable to query the chip power state. Can't query the power stats.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D56AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayToProvider -- Command", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D56D8()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10015ABE4((void *)&_mh_execute_header, v7, v8, "#roseprovider,Rose returned error while sending command. Command type:%s", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D5720()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building new service request packet", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D574C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- CreateRequest", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building user trigger start packet", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D57A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- StartRequest", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D57D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building user trigger stop packet", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D57FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- StopRequest", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building cancel service packet", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- CancelRequest", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5880()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- UpdateSessionData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D58AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- Unspecified", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D58D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayToProvider -- Property", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5904()
{
  __assert_rtn("relayPropertyMessage", "PRRoseProvider.mm", 1150, "msg.mac_address.has_value()");
}

void sub_1003D592C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got unspecified AOPRosePropertyMessageType", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5958()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10001B110();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#roseprovider,%@", v2);
  sub_10000BFC4();
}

void sub_1003D59BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "#roseprovider,%s", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D5A30(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("pushBeaconAllowlist: may only push BLE or UUID identified beacons.");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#roseprovider,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003D5AA4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("Given vector of different types beacons. All beacons must be of the same identifer type.");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#roseprovider,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003D5B18()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10001B110();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#roseprovider,LE thresholds array does not have exactly 2 values. %@", v2);
  sub_10000BFC4();
}

void sub_1003D5B7C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  *a1 = 0;
  if (v3)
    operator delete();
  v4 = *a2;
  *a2 = 0;
  if (v4)
    operator delete();
  sub_100029D60();
}

uint64_t sub_1003D5BE0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
    operator delete();
  return result;
}

void sub_1003D5C08(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ignoring identifier-less sample", v1, 2u);
}

void sub_1003D5C48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,requesting session while another session request is still active", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5C74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (sessionStarted)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5CA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (sessionEnded)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5CCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (rangingWasDisallowed)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5CF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (dckErrorSendEventNotification)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5D24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (dckErrorReturnErrorCode)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5D50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (reportVehicleLocked)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5D7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (reportVehicleUnlocked)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5DA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (reportVehicleReadyToDrive)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5DD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (getKeyStarted)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5E00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (getKeyFinished)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5E2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (sessionStatsUpdated)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D5E58()
{
  __assert_rtn("sessionStatsUpdated", "NIServerCarKeyAnalyticsManager.mm", 361, "sessionStats.numBlocksWithAnchors.size() >= kMaxAnchorsToCount");
}

void sub_1003D5E80(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ni-assertion,Failed to acquire %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1003D5F04(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#bg-continuation,Measurement received. Session identifier: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1003D5F7C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#bg-continuation,NotAuthorized is a terminal state. Dropping state change", v1, 2u);
}

void sub_1003D5FBC()
{
  __assert_rtn("-[NIServerBackgroundContinuationManager _changeSessionAuthStateTo:]", "NIServerBackgroundContinuationManager.mm", 254, "false");
}

void sub_1003D5FE4()
{
  __assert_rtn("-[NIServerBackgroundContinuationManager monitoredApp:didChangeState:]", "NIServerBackgroundContinuationManager.mm", 400, "false");
}

void sub_1003D600C()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 39, "azDeg >= fMinAzDeg");
}

void sub_1003D6034()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 40, "azDeg <= fMaxAzDeg");
}

void sub_1003D605C()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 41, "elDeg >= fMinElDeg");
}

void sub_1003D6084()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 42, "elDeg <= fMaxElDeg");
}

void sub_1003D60AC()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 50, "azDeg >= fMinAzDeg");
}

void sub_1003D60D4()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 51, "azDeg <= fMaxAzDeg");
}

void sub_1003D60FC()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 52, "elDeg >= fMinElDeg");
}

void sub_1003D6124()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 53, "elDeg <= fMaxElDeg");
}

void sub_1003D614C()
{
  __assert_rtn("operator+=", "RoseAOAtoPDOAMapping.cpp", 248, "ch9CalAvailable() && rhs.ch9CalAvailable()");
}

void sub_1003D6174()
{
  __assert_rtn("operator+=", "RoseAOAtoPDOAMapping.cpp", 247, "checkCalBlobIntegrity() && rhs.checkCalBlobIntegrity() && fChannelAvailabilityMask == rhs.getChannelAvailabilityMask()");
}

void sub_1003D619C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#obsrvr, Unpermitted client attempting to start an observation session.", v1, 2u);
}

void sub_1003D61DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D624C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D62BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D632C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D639C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D640C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D647C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-acwg,lockIdentifier is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D64A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-acwg,lockIdentifier is not a valid UUID", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D64D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6544()
{
  __assert_rtn("-[NIServerAcwgSession configure]", "NIServerAcwgSession.mm", 461, "_configuration");
}

void sub_1003D656C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-acwg,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D65DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-acwg,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D664C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D66BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,run() but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D66E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-acwg,%@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D6748(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D67B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-acwg,_pauseOwnerSession but no Acwg manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D67E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Pause Source Invalid", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6810(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6880()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processAcwgM1Msg but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D68AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session reason stack cannot be empty on M1 error", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D68D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6948()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processAcwgM3Msg but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6974(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D69E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,suspendAcwgRanging but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6A10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,clients are not allowed to use NI surfaced suspend reasons", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6A3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6AAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processAcwgRangingSessionResumeRequestMsg but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6AD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session reason stack cannot be empty on resume error", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6B04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6B74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,prefetchAcwgUrsk but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6BA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6C10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processBluetoothHostTimeSyncWithType but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6C3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-acwg,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6CAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6CD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6D48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,deleteURSKs but no ACWG manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D6D74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6DE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-acwg,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6E54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6EC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D6F34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;

  sub_1001B3534();
  if (v7 != v8)
    v9 = v6;
  else
    v9 = v2;
  *(_DWORD *)v3 = 136315138;
  *(_QWORD *)(v3 + 4) = v9;
  sub_100029D1C((void *)&_mh_execute_header, v4, (uint64_t)v4, "#ses-acwg,Failed to allocate Acwg session (%s)", v5);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  sub_100029D60();
}

void sub_1003D6F90(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  uint64_t v3;
  int v4;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    sub_1001B3514(p_shared_owners);
  while (v4);
  if (!v3)
  {
    sub_1001B3524();
    std::__shared_weak_count::__release_weak(a1);
  }
  sub_100029D60();
}

void sub_1003D6FC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D7034(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;

  sub_1001B3534();
  if (v7 != v8)
    v9 = v6;
  else
    v9 = v2;
  *(_DWORD *)v3 = 136315138;
  *(_QWORD *)(v3 + 4) = v9;
  sub_100029D1C((void *)&_mh_execute_header, v4, (uint64_t)v4, "#ses-acwg,Alisha session invalidated unexpectedly. Reason: %s", v5);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  sub_100029D60();
}

void sub_1003D7090(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D7100(std::__shared_weak_count **a1, std::__shared_weak_count **a2, std::__shared_weak_count *this)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  uint64_t v7;
  int v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  uint64_t v11;
  int v12;
  void *v13;

  v5 = *a1;
  if (*a1)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      sub_1001B3514(p_shared_owners);
    while (v8);
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v9 = *a2;
  if (v9)
  {
    v10 = (unint64_t *)&v9->__shared_owners_;
    do
      sub_1001B3514(v10);
    while (v12);
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  std::__shared_weak_count::~__shared_weak_count(this);
  operator delete(v13);
}

void sub_1003D7194(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D7204(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D7274(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D72E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session suspend timestamp isn't valid", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session reason stack cannot be empty here", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D733C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D73AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D741C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D748C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D74FC()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  sub_1001B3534();
  if (v3 != v4)
    v5 = v2;
  else
    v5 = v0;
  v6 = 136315138;
  v7 = v5;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "#ses-acwg,timeout event %s unsupported", (uint8_t *)&v6, 0xCu);
  sub_10000BFC4();
}

void sub_1003D7574(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D75E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D7654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session destroyed when receiving AopSensorFusionUpdate", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7680(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#ses-acwg,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003D76F0()
{
  __assert_rtn("AcwgConfigProvider", "NIServerAcwgSession.mm", 134, "minRanMultiplier > 0");
}

void sub_1003D7718()
{
  __assert_rtn("AcwgConfigProvider", "NIServerAcwgSession.mm", 135, "minRanMultiplier <= std::numeric_limits<decltype(_minRanMultiplier)>::max()");
}

void sub_1003D7740()
{
  __assert_rtn("AcwgConfigProvider", "NIServerAcwgSession.mm", 144, "startTimeOffsetSeconds > 0.0");
}

void sub_1003D7768()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Existing service request does not have tx_preamble. Cannot add it to running count.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7794()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Not supported tx_preamble in service request", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D77C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Failed to create acwg session.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D77EC(os_log_t log)
{
  int v1;
  const __CFString *v2;

  v1 = 138412290;
  v2 = CFSTR("Not authorized.");
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-system,%@", (uint8_t *)&v1, 0xCu);
}

void sub_1003D786C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[PRAppStateMonitor] error creating handle for identifier. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1003D78E0(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[PRAppStateMonitor] pid (%d) != _monitoredPID (%d)", (uint8_t *)v4, 0xEu);
}

void sub_1003D7968()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#peer-gr,Run called without a successful configuration.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7994()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#peer-gr,sending data from GR session to rose base session", v1, 2u);
  sub_10000991C();
}

void sub_1003D79CC(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#peer-gr,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
  sub_10000991C();
}

void sub_1003D7A40()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_10015ABE4((void *)&_mh_execute_header, v2, v3, "#peer-gr,Rose session invalidated unexpectedly. Reason: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D7A8C()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_10015ABE4((void *)&_mh_execute_header, v2, v3, "#peer-gr,Failed to allocate a UWB session. Error: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D7AD8(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
  sub_100029D60();
}

void sub_1003D7B20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-gr,Configuration Manager error", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7B4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-gr,Resource manager did not provide discovery token", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7B78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#peer-gr,Unable to determine UWB channels", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7BA4()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_10015ABE4((void *)&_mh_execute_header, v2, v3, "#peer-gr,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D7BF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-proxy,UpdatesEngine init failed with error %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D7C50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error after notifying device unlocked since boot: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D7CB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: could not get current boot UUID", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7CDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: reset failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7D08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AD4();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: error restoring from cache: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D7D70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: not ready", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error enabling interaction after setting new tokens: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D7DFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error setting token cache: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D7E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping ranging with peer: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D7EBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping advertising to peer: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D7F1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create location manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7F48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create PDR manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7F74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create motion activity manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7FA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create pedometer manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7FCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create altimeter manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D7FF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create motion manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8024()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Couldn't activate OS transaction while findable", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8050(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001CCDD4((void *)&_mh_execute_header, a2, a3, "#find-proxy,Couldn't activate power assertion while interacting. Return code %d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003D80B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Couldn't activate OS transaction while interacting", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D80E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001CCDD4((void *)&_mh_execute_header, a2, a3, "#find-proxy,Couldn't deactivate power assertion while interacting. Return code %d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003D8144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Ranging error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D81A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to start advertising: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D8204()
{
  __assert_rtn("-[NIServerFindableDeviceProxySessionManager _shouldHoldOSTransactionWhileFindable]", "NIServerFindableDeviceProxySessionManager.mm", 1558, "false");
}

void sub_1003D822C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to stop ranging: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D828C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to stop advertising: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D82EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error setting eligible discovery peers: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D834C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,shouldInteract returned NO, not going to enable interaction", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-proxy,shouldInteract returned YES, not going to disable interaction", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D83A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping scanning: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D840C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001CCDE4(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping ranging: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D846C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001CCDE4(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping advertising: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D84CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,didRangeWithPeer with nil token. Possible race condition.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D84F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,didAttemptRangingWithPeer with nil token. Possible race condition.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8524(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "#find-proxy,%@", (uint8_t *)a2);

}

void sub_1003D8570()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10001B110();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "#find-proxy,%@", v2);
  sub_10000BFC4();
}

void sub_1003D85D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Ranging terminated callback with nil token. Possible race condition.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8600()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,altitudeData is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D862C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving altimeter data: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D868C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,pedometerData is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D86B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving pedometer data: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D871C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving pedometer event: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D8780()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,motion activity is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D87AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,device motion is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D87D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Could not convert pdr state time to mach continuous", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8804()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10001B110();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "#find-proxy,pdr state received: %@", v2);
  sub_10000BFC4();
}

void sub_1003D8868()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving PDRState: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D88C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-proxy, #findalgs pdr handler", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D88F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Could not convert device motion time to mach continuous", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8920()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving DeviceMotion: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D8980()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-proxy,didUpdateFindeeData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D89AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,locations array is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D89D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-proxy,current location not updated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8A04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-proxy,unexpected location manager error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D8A64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-proxy,user denied request to monitor location and heading updates", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8A90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nimd,Trying to switch to motion detector type DeviceMotionGravity which is current motion detector type", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8ABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nimd,Trying to switch to motion detector type MotionActivity which is current motion detector type", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8AE8()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#nimd,MotionActivity is not available, return", v1, 2u);
  sub_10000991C();
}

void sub_1003D8B20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nimd,Cannot start activity updates because fMotionActivityMgr is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8B4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nimd,Cannot start device motion updates because fMotionManager is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8B78()
{
  __assert_rtn("processGravityVector", "NIServerMotionDetector.mm", 415, "_gxBuf.size() == kDequeSize");
}

void sub_1003D8BA0()
{
  __assert_rtn("processGravityVector", "NIServerMotionDetector.mm", 409, "_gyBuf.size() == _gzBuf.size()");
}

void sub_1003D8BC8()
{
  __assert_rtn("processGravityVector", "NIServerMotionDetector.mm", 408, "_gxBuf.size() == _gyBuf.size()");
}

void sub_1003D8BF0()
{
  __assert_rtn("_computeMaxAngle", "NIServerMotionDetector.mm", 443, "z.size() == M");
}

void sub_1003D8C18()
{
  __assert_rtn("_computeMaxAngle", "NIServerMotionDetector.mm", 442, "y.size() == M");
}

void sub_1003D8C40(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Device %@ does not have token data and it is not a known device", (uint8_t *)&v2, 0xCu);
}

void sub_1003D8CB4()
{
  __assert_rtn("-[PRBluetoothDevice btAdvertisingAddress]", "PRBluetoothDevice.mm", 54, "_cbDevice.btAddressData");
}

void sub_1003D8CDC()
{
  __assert_rtn("-[PRBluetoothDevice u64Identifier]", "PRBluetoothDevice.mm", 62, "_cbDevice.btAddressData");
}

void sub_1003D8D04()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,maxLocationAge,%.1f", v2);
  sub_10000BFC4();
}

void sub_1003D8D74()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,maxMccAge,%.1f", v2);
  sub_10000BFC4();
}

void sub_1003D8DE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "regulatory,geo,sm,extendRetriesBackToCount:%d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8E48()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;

  sub_100154B28();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "regulatory,geo,sm,retryLocation,total:%d,left:%d", v2, 0xEu);
  sub_10000BFC4();
}

void sub_1003D8ECC(os_log_t log)
{
  _DWORD v1[2];
  __int16 v2;
  int v3;
  __int16 v4;
  int v5;

  v1[0] = 67109632;
  v1[1] = HIDWORD(qword_100852920);
  v2 = 1024;
  v3 = qword_100852920;
  v4 = 1024;
  v5 = dword_100852928;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "defaults,locationTimeout:%d,queryInterval:%d,maxRetries:%d", (uint8_t *)v1, 0x14u);
  sub_10000BFC4();
}

void sub_1003D8F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "regulatory,geo,sm,timeoutValueForBackoff:%d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D8FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_1001DA77C(a1, a2, a3, 4.8151e-34);
  sub_1001DA794((void *)&_mh_execute_header, "regulatory,geo,mon,setIsLocationNeeded,locationIsRecent,iso:%s,age:%.2f,skipped", v3, v4);
}

void sub_1003D9000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_1001DA77C(a1, a2, a3, 4.8151e-34);
  sub_1001DA794((void *)&_mh_execute_header, "regulatory,geo,mon,setIsLocationNeeded,locationIsEmptyOrStale,iso:%s,age:%.2f,done", v3, v4);
}

void sub_1003D9038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  sub_1001DA77C(a1, a2, a3, 4.8151e-34);
  sub_1001DA794((void *)&_mh_execute_header, "regulatory,geo,mon,clearIsLocationNeeded,locationIsEmptyOrStale,iso:%s,age:%.2f,needsRefresh", v3, v4);
}

void sub_1003D9070()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,gm,mon,locationMonitoringNotNeeded,NotStarting", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D909C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,gm,mon,locationMonitoringNeeded,starting", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D90C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,gm,mon,locationMonitoringStopped", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D90F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startGeoMonitorAnalyticsTimer, null timerCB passed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9120()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startGeoMonitorAnalyticsTimer, Failed to create timer.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D914C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startGeoMonitorAnalyticsTimer, Started Analytics timer.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fLocationMonitor startMonitoring done, success, %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D91DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fIsoQueryManager start done", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9208()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startMonitoring done, success, %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D926C(char *a1, _QWORD *a2, NSObject *a3)
{
  int v3;
  _QWORD *v4;

  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315138;
  v4 = a2;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "regulatory,geo,monitor,clearStoredRegulatoryArea:%s", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003D92E4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,refreshCurrentGeoArea,bestMccCandidate,oneIsValidOtherIsnt,chosen:%s", v2);
  sub_10000BFC4();
}

void sub_1003D9348()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,refreshCurrentGeoArea,bestMccCandidate:%s,reason,oneOrBothMccInvalid", v2);
  sub_10000BFC4();
}

void sub_1003D93AC()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "regulatory,geo,monitor,refreshCurrentGeoArea,device is neither a UWB phone or watch.", v1, 2u);
  sub_10000991C();
}

void sub_1003D93E4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "geo,monitor,chooseBestMccForHomepod,chooseBestMccForHomepod:%s", v2);
  sub_10000BFC4();
}

void sub_1003D9448()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,refreshCurentGeoArea,cannotGetStoredParams", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9474()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processLocationAvailable", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D94A0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processRegulatoryAreaKnown:%s", v2);
  sub_10000BFC4();
}

void sub_1003D9514()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processRegulatoryAreaLastKnown:%s", v2);
  sub_10000BFC4();
}

void sub_1003D9588()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processLocation,clearStoredSpecialRegion", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D95B4()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10017A068((void *)&_mh_execute_header, v7, (uint64_t)v7, "regulatory,geo,monitor,forwardTestMcc,mccSource:%s.", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D9600()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,forwardTestMcc:%s", v2);
  sub_10000BFC4();
}

void sub_1003D9664()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processIsoCountryFromPhone - Early return. This method is only supported for non-phone platforms.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9690()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10017A068((void *)&_mh_execute_header, v7, (uint64_t)v7, "regulatory,geo,monitor,processIsoCountryFromPhone,isoCountrySource:%s.", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003D96DC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processIsoCountryFromPhone:%s", v2);
  sub_10000BFC4();
}

void sub_1003D9740()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,processTriggerLocation", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D976C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRGeoMonitor failed to take assertion during backoff period, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9798()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_10017A058((void *)&_mh_execute_header, v0, v1, "regulatory,geo,processLocationAuthorized:%d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D97FC()
{
  __assert_rtn("processAirplaneMode", "PRGeoMonitor.mm", 1030, "airplaneMode != Rose::AirplaneMode::UNKNOWN");
}

void sub_1003D9824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,processAirplaneMode called with invalid input argument value.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9850()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processAirplaneMode,clearStoredRegionAndMccs", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D987C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,airplaneOff,clearStoredRegulatoryArea", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D98A8(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  int v3;
  _QWORD *v4;

  if (*(char *)(a1 + 399) < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315138;
  v4 = a2;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "regulatory,geo,monitor,setStoredRegulatoryArea:%s", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003D9920()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100010AD4();
  v3 = 2080;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "geo,mon fCurrentWifiIso current:%s new:%s", v2, 0x16u);
  sub_10000BFC4();
}

void sub_1003D99E4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PRAlishaLEPMQueryCrashSummaryLog token write failed", v1, 2u);
}

void sub_1003D9A24(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PRAlishaLEPMQueryCrashSummaryLog write token", v1, 2u);
}

void sub_1003D9A64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "failed to clear Alisha LPEM crash summary: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9AC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "Failed to get Alisha LPEM crash summary: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9B24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "Failed to get SE (as part of getting Alisha LPEM logs): %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9B84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "Failed to start NFHardwareManager logging session with error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9BE4(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#alisha-tom,invalidate() must be called before destructing CarKeyTimeoutManager for session identifier %@", (uint8_t *)&v3, 0xCu);
}

void sub_1003D9C5C()
{
  __assert_rtn("-[NIServerHomeDeviceSession configure]", "NIServerHomeDeviceSession.mm", 440, "_configuration");
}

void sub_1003D9C84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-home,Run called without a successful configuration.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9CB0()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10001B110();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#ses-home,starting BT advertise with high rate err: %@", v1, 0xCu);
  sub_10000BFC4();
}

void sub_1003D9D1C()
{
  __assert_rtn("-[NIServerHomeDeviceSession setupBackoffResumeManager]", "NIServerHomeDeviceSession.mm", 747, "_configuration");
}

void sub_1003D9D44()
{
  uint64_t v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;

  sub_10001B110();
  v4 = 2112;
  v5 = v0;
  sub_1001EAF28((void *)&_mh_execute_header, v1, v2, "#ses-home,Failed to add peers %@. Session identifier: %@", v3);
  sub_10000BFC4();
}

void sub_1003D9DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,%@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9E20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,cbDevice model unavailable for systemKeyRelationship. Will not attempt to range", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9E4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,#allow-list peer device model %@ disallowed from UWB ranging", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9EAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-home,NINearbyObject objectFromBluetoothDevice returned nil.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9ED8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to allocate responder session. Resources are not available.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9F04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to start responder session. Error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Unexpectedly failed to emplace session for identitifer: 0x%llx", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003D9FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to determine an appropriate tech for ranging.  ", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003D9FF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,The system will not respond to %@ at this time.", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA050(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1001EAF1C(a1, a2, 4.8149e-34);
  sub_100029D1C((void *)&_mh_execute_header, v2, (uint64_t)v2, "#ses-home,#allow-list unable to parse audio accessory model: %s", v3);
}

void sub_1003DA088(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1001EAF1C(a1, a2, 4.8149e-34);
  sub_100029D1C((void *)&_mh_execute_header, v2, (uint64_t)v2, "#ses-home,#allow-list unable to parse phone model: %s", v3);
}

void sub_1003DA0C0(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1001EAF1C(a1, a2, 4.8149e-34);
  sub_100029D1C((void *)&_mh_execute_header, v2, (uint64_t)v2, "#ses-home,#allow-list unable to parse watch model: %s", v3);
}

void sub_1003DA0F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,#warning. Device re-discovered, but no responder session. Expected responder session. Session failed the first time?", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA124()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to re-start responder session. Error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA184()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,skipping measurement due to a lack of mach continuous timestamp.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA1B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, no discovery token for macAddr: 0x%llx", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,responder measurement dropped due to missing processing information for 0x%llx", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA270()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, not tracking peer with token: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA2D0(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#ses-home,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
  sub_10000991C();
}

void sub_1003DA344()
{
  __assert_rtn("pushSample", "NIServerHomeDeviceSession.mm", 139, "magneticField.size() == timestamps.size()");
}

void sub_1003DA36C(_DWORD *a1, _DWORD *a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1 - *a2;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-home,Received unexpected remote data: too small (%d < %d)", (uint8_t *)v4, 0xEu);
  sub_10000BFC4();
}

void sub_1003DA3FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,Received unexpected remote data: incorrect type", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA428()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,Received didChangeRangingUpdateRate but session could not be found.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA454()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle Adjusting throttle rate failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Invalid sample provided: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA4E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Invalid model provided: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-home,Empty string is generating a non zero hash, this will break device part logic -- INVESTIGATE", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA56C()
{
  __assert_rtn("-[NIServerHomeDeviceSession rangingServiceDidUpdateState:cause:]", "NIServerHomeDeviceSession.mm", 1705, "false");
}

void sub_1003DA594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,UWB system readiness updated after session invalidated. Ignore it.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA5C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to re-run session to handle UWB state change. Error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA620()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to re-configure session to handle UWB state change. Error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to pause session to handle UWB state change. Error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA6E0()
{
  __assert_rtn("-[NIServerHomeDeviceSession _prepareServiceRequestWithConfig:]", "NIServerHomeDeviceSession.mm", 1787, "_configuration");
}

void sub_1003DA708()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,Configuration Manager error", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA734(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  sub_1001EAF1C((uint64_t)a1, a2, 5.7779e-34);
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Session key has invalid length. %@", v4);

  sub_100029D60();
}

void sub_1003DA778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,Unknown HSI Version, use default cipher blob", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA7A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-home,Unable to determine UWB channels", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DA7D0(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    sub_1001B3524();
    std::__shared_weak_count::__release_weak(a1);
  }
  sub_100029D60();
}

void sub_1003DA80C()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Failed to allocate a UWB session. Error: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DA85C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,#hangup Address 0x%{private}llx has no mapping to a discovery token.", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DA8BC(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-home,Active session limit exceeded (%d)", (uint8_t *)v1, 8u);
  sub_10000991C();
}

void sub_1003DA934()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Rose session invalidated unexpectedly. Reason: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DA984()
{
  __assert_rtn("-[NIServerHomeDeviceSession _triggerInitiatorRanging]", "NIServerHomeDeviceSession.mm", 2196, "_initiatorSession");
}

void sub_1003DA9AC()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DA9FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,#warning, failed to remove peer discovery token: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DAA5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,attempt to remove non-existent tracked object", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DAA88()
{
  __assert_rtn("-[NIServerHomeDeviceSession _calculateMagneticFieldBias]", "NIServerHomeDeviceSession.mm", 2485, "latestRawMagneticFieldTime.has_value()");
}

void sub_1003DAAB0()
{
  __assert_rtn("-[NIServerHomeDeviceSession _calculateMagneticFieldBias]", "NIServerHomeDeviceSession.mm", 2487, "latestCalMagneticFieldTime.has_value()");
}

void sub_1003DAAD8()
{
  __assert_rtn("size", "NIServerHomeDeviceSession.mm", 131, "timestamps.size() == magneticField.size()");
}

void sub_1003DAB00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,Discovery token cannot be parsed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DAB2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,#Discovery token doesn't contain an identifier", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DAB58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,#Discovery token doesn't contain IRK", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DAB84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,invalid value for HomeAnchorVariant", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DABB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to get object from identifier: %llx", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DAC10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - no uwbIdentifier. Object: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DAC70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - no session. Object: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DACD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - session is null. Object: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DAD30(uint64_t *a1, uint64_t a2, NSObject *a3, float a4)
{
  double v5;
  uint64_t *v6;

  v5 = a4;
  if (*((char *)a1 + 23) >= 0)
    v6 = a1;
  else
    v6 = (uint64_t *)*a1;
  *(_DWORD *)a2 = 134218242;
  *(double *)(a2 + 4) = v5;
  *(_WORD *)(a2 + 12) = 2080;
  *(_QWORD *)(a2 + 14) = v6;
  sub_1001EAF28((void *)&_mh_execute_header, a2, a3, "#ses-home,#throttle failed to schedule throttling request for rate %0.2f. Error: %s", (uint8_t *)a2);
  if (*((char *)a1 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DAD9C()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10001B110();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Update rate 'None' not supported. Object: %@", v1, 0xCu);
  sub_10000BFC4();
}

void sub_1003DAE08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - not a responder.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DAE34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, no discovery token for identifier: %llu", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DAE94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, not tracking peer with token: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DAEF4()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, (uint64_t)v0, "#ses-home,WiFi ranging error:%{private}s", v1);
  sub_10000BFC4();
}

void sub_1003DAF6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-ses,FindingServicePool replace non-nil service for token: %{public}@. Race condition (probably not OK)", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DAFCC(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  sub_1001F74C0((uint64_t)a1, a2, a3, 5.8081e-34);
  sub_1001DA794((void *)&_mh_execute_header, "#find-ses,Service processSelfLocation [%{private}@]: %{private}@", v4, v5);

  sub_100029D60();
}

void sub_1003DB010(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  sub_1001F74C0((uint64_t)a1, a2, a3, 5.8081e-34);
  sub_1001DA794((void *)&_mh_execute_header, "#find-ses,Service processSelfHeading [%{private}@]: %{private}@", v4, v5);

  sub_100029D60();
}

void sub_1003DB054(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 88);
  v4 = *a2;
  v5 = 138478083;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#find-ses,Providers could not be initialized for token: %{private}@ with configuration: %@", (uint8_t *)&v5, 0x16u);
  sub_10000BFC4();
}

void sub_1003DB0DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,failed creating CMPDRManager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB108()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-ses,Failed to create altimeter manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB134()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-ses,UpdatesEngine init failed with error %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB194()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,device motion is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB1C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,Could not convert device motion time to mach continuous", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB1EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-ses,error receiving DeviceMotion: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB24C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,altitudeData is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-ses,error receiving altimeter data: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB2D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#find-ses,pdr state received: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB338()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-ses,error receiving PDRState: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB398(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#find-ses,Skipping range solution (%0.2f m) due to a lack of mach continuous timestamp.", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003DB400(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;

  v3 = *a1;
  v4[0] = 67109379;
  v4[1] = v3;
  v5 = 2113;
  v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#find-ses,didRangeWithPeer:newSolution: unexpected RoseSolutionType: %d. Token: %{private}@", (uint8_t *)v4, 0x12u);
  sub_10000BFC4();
}

void sub_1003DB484()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,Range solution, but does not match finding token. Possible race condition.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB4B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,Unsuccessful attempt does not match finding token. Possible race condition.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB4DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#find-ses,%{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB53C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#find-ses,%{public}@", buf, 0xCu);

  sub_100029D60();
}

void sub_1003DB58C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-ses,Failed to stop ranging: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB5EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-ses,Failed to stop advertising: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB64C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-ses,Failed to stop scanning: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB6AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,Ranging terminated callback, but does not match finding token. Possible race condition.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB6D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#find-ses,Ranging error: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB738()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-ses,locations array is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB764()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#find-ses,didUpdateLocations: %{private}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB7C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-ses,heading is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB7F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#find-ses,didUpdateHeading: %{private}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB850()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#find-ses,received unexpected error from location manager: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DB8B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,heading could not be determined", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB8DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-ses,user denied request to monitor location and heading updates", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB908()
{
  __assert_rtn("-[NIServerFindingSession configure]", "NIServerFindingSession.mm", 2459, "_configuration");
}

void sub_1003DB930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-ses,Dropping event, configuration is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DB95C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#crypto,Invalid configuration (1)", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DB98C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#crypto,Invalid configuration (2)", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DB9BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#crypto,Invalid configuration (3)", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DB9EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001F9E40(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] not configured correctly", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DBA4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001F9E40(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] nonce expired", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DBAAC()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] get auth tag failed %d");
  sub_10000BFC4();
}

void sub_1003DBB0C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] cryptor-update failed %d");
  sub_10000BFC4();
}

void sub_1003DBB6C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] add auth data failed %d");
  sub_10000BFC4();
}

void sub_1003DBBCC()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] add nonce failed %d");
  sub_10000BFC4();
}

void sub_1003DBC2C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] set MAC size failed %d");
  sub_10000BFC4();
}

void sub_1003DBC8C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] set data size failed %d");
  sub_10000BFC4();
}

void sub_1003DBCEC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1001F9E4C(a1, a2, a3, 5.8082e-34);
  *(_DWORD *)(v3 + 20) = 1;
  sub_1001F9E68((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_1003DBD2C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1001F9E4C(a1, a2, a3, 5.8082e-34);
  *(_DWORD *)(v3 + 20) = 5;
  sub_1001F9E68((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_1003DBD6C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1001F9E4C(a1, a2, a3, 5.8082e-34);
  *(_DWORD *)(v3 + 20) = 11;
  sub_1001F9E68((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_1003DBDAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001F9E40(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] no ciphertext", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DBE0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001F9E40(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] auth tags don't match", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DBE6C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] get auth tag failed %d");
  sub_10000BFC4();
}

void sub_1003DBECC()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] cryptor-update failed %d");
  sub_10000BFC4();
}

void sub_1003DBF2C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] add auth data failed %d");
  sub_10000BFC4();
}

void sub_1003DBF8C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] add nonce failed %d");
  sub_10000BFC4();
}

void sub_1003DBFEC()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] set MAC size failed %d");
  sub_10000BFC4();
}

void sub_1003DC04C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] set data size failed %d");
  sub_10000BFC4();
}

void sub_1003DC0AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001F9E40(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] unsupported version", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DC10C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001F9E40(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] not configured correctly", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DC16C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1001F9E40(__stack_chk_guard);
  sub_1001F9E28();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][KDF] derive key failed %d");
  sub_10000BFC4();
}

void sub_1003DC1CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#regulatory,isoquerymgr,registerIsoQueryListener register rapport link", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC1F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#regulatory,isoquerymgr,connectWithActiveDevice, invalid rpDevice!", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC224(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#regulatory,isoquerymgr,start,discovery client activation error %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003DC288()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#regulatory,isoquerymgr,PRIsoQueryManager: fNoDeviceFoundErrorSubmissionTimer Timeout Callback.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC2B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#regulatory,isoquerymgr,sendIsoRequest, activation error = %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003DC318()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#regulatory,isoquerymgr,sendIsoRequest,response received but couldn't parse inResponse", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC344(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#regulatory,isoquerymgr,sendIsoRequest,response, error = %@ ", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003DC3A8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "regulatory,download,Unexpected activity state %ld", (uint8_t *)&v2, 0xCu);
}

void sub_1003DC41C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a1, a3, "regulatory,download,unable to set state, %u", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DC488(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a1, a3, "regulatory,download,unable to set state, %u", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DC4F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "regulatory,download,dstIsNull", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DC524(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "regulatory,download,srcIsNull", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DC554()
{
  __assert_rtn("PRGetDeviceModelName_block_invoke", "PRUtilities.m", 40, "CFGetTypeID(answer) == CFStringGetTypeID()");
}

void sub_1003DC57C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#vision,Session failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1003DC5F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "We shouldn't be here! abort!!!", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC61C()
{
  int v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;

  sub_100010AD4();
  v4 = 1024;
  v5 = v0;
  v6 = 1024;
  v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Crash Reason: %s for core: %d and isFatal: %d", v3, 0x18u);
  sub_10000BFC4();
}

void sub_1003DC6B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "FW crash string reason wasn't extracted", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC6E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Crashlog received is corrupted", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC70C()
{
  NSObject *v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;

  sub_10019EAD0(__stack_chk_guard);
  sub_100010AD4();
  v2 = 2048;
  v3 = 155;
  sub_100010AC8((void *)&_mh_execute_header, v0, (uint64_t)v0, "HID event size [%lu] != expected size [%lu]", v1);
  sub_10000BFC4();
}

void sub_1003DC784(unsigned int *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_1002113D4(a1, __stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v1, v2, "Called PRRose::deactivate while in state %s", v3);
  sub_10000BFC4();
}

void sub_1003DC804()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to send AP Goodbye", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC830()
{
  uint64_t v0;

  v0 = abort_report_np("Invalid context");
  sub_1003DC844(v0);
}

void sub_1003DC844()
{
  __assert_rtn("activateInternal", "PRRose.mm", 242, "fRoseEventsHandler");
}

void sub_1003DC86C()
{
  __assert_rtn("activateInternal", "PRRose.mm", 243, "fRoseReportHandler");
}

void sub_1003DC894()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "Called PRRose::activate while in state == %s", v2);
  sub_10000BFC4();
}

void sub_1003DC91C(unsigned int *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_1002113D4(a1, __stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v1, v2, "PRRose Power Off Failed  while in state: %s ", v3);
  sub_10000BFC4();
}

void sub_1003DC99C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Rose failed to update. Setting state to UNAVAILABLE.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC9C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Heal attempt token write failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DC9F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Rose failed to heal. Caching heal attempt token.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCA20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to connect to Rose AOP services. Setting state to OFF.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCA4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Device does not have chip. Setting state to UNAVAILABLE.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

uint64_t sub_1003DCA78()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to create the notification port");
  return sub_1003DCA8C(v0);
}

void sub_1003DCA8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "failed to determine firmware update status", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCAB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: failed to send a APGoodbye command.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCAE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose:: Failed to Power off Rose. Aborting", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCB10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,Failed to apply config parameters.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCB3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,Failed to produce valid rose config parameters.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCB68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::setConfigParameters: setRoseConnectionlessMacAddress failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCB94(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100029D74(a1, a2);
  sub_100029D00((void *)&_mh_execute_header, v2, (uint64_t)v2, "PRRose::setConfigParameters: failed to set UWB power table.", v3);
}

void sub_1003DCBC0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100029D74(a1, a2);
  sub_100029D00((void *)&_mh_execute_header, v2, (uint64_t)v2, "PRRose::setConfigParameters: failed to set NB SAR power table.", v3);
}

void sub_1003DCBEC(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100029D74(a1, a2);
  sub_100029D00((void *)&_mh_execute_header, v2, (uint64_t)v2, "PRRose::setConfigParameters: failed to set NB UNII3 power table.", v3);
}

void sub_1003DCC18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "PRRose::applyConfigOptions unsupported HSI", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCC44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::setConfigParameters: _updateCoexGlobalEventStatus failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCC70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::setConfigParameters: setRoseConfigParameters failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCC9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose failed to take assertion after triggering fatal log collection, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCCC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#halt-exec-PRRose halt PRRose execution due to HaltPRRoseOnFatalError override", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCCF4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#halt-exec-PRRose halt PRRose execution due to HaltPRRoseOnFatalErrorReason override: %@", (uint8_t *)&v2, 0xCu);
  sub_10000BFC4();
}

void sub_1003DCD64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::TriggerFailed (non-fatal). Promoting to fatal.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCD90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to trigger fatal log collection, aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCDBC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a2, a3, "Returned TriggeredFailed for log collection type: %d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DCE20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::BusyNonFatalInProgress: Unexpected BusyNonFatalInProgress after triggering fatal log collection. Aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCE4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::BusyNonFatalInProgress.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCE78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::BusyFatalInProgress.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCEA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Bad argument triggering log collection.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCED0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Not ready while triggering log collection.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCEFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: sending deep sleep exit request to RoseSupervisor failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCF28()
{
  __assert_rtn("setRoseReportHandler", "PRRose.mm", 574, "nullptr != handler");
}

void sub_1003DCF50()
{
  __assert_rtn("setRoseStateEventsHandler", "PRRose.mm", 580, "nullptr != handler");
}

void sub_1003DCF78()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "Command %s not allowed in deep sleep", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DCFC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to get deep sleep state", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DCFF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Tried to send command to rose, but not ready for comms.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Tried to set rose property, but not ready for comms.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD04C(char a1)
{
  os_log_t v1;
  uint8_t v2[8];

  if ((a1 & 1) != 0)
  {
    sub_100154B28();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "PRRose::_handleRoseControlReport unknown type %hhu", v2, 8u);
  }
  __assert_rtn("_handleRoseControlReport", "PRRose.mm", 730, "false");
}

void sub_1003DD0D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to reset supervisor jobs", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD0FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to trigger jobs report.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD128()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "PRRose: probeAOPActivityReport", v1, 2u);
  sub_10000991C();
}

void sub_1003DD160()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to activate AOP timesync", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD18C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10019EAD0(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, (uint64_t)v0, "CalDataPushed property has unexpected size %zu", v1);
  sub_10000BFC4();
}

void sub_1003DD1F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to get CalDataPushed property", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: RoseSupervisor unexpected size for last known rose time", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD24C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to get last known rose time.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

uint64_t sub_1003DD278()
{
  uint64_t v0;

  v0 = abort_report_np("failed to find rose service");
  return sub_1003DD28C(v0);
}

void sub_1003DD28C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "unable to extract data from the use-internal-32k-clock property", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD2B8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "property data type %lu or property length is invalid", (uint8_t *)a1);
}

void sub_1003DD2F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Coex: invalid config parameters from getConfig response", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD320()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Called setRoseDebugLevel but not ready for comms.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD34C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "fRoseCommMgr.sendSetConfigCommand returned false.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "getLeadingEdgeThresholdsBytes failed.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD3A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "getRoseAlishaTestMode failed: couldn't send command", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD3D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "getRoseAlishaTestMode failed: config not received", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD3FC()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "getRoseAlishaTestMode failed: response not successful (%s)", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DD44C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "getNBUWBePAeLNAModes failed: couldn't send command", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD478()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "getNBUWBePAeLNAModes failed: response not successful (%s)", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DD4C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Unable to set AOP UserDefaults property", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to download firmware", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD520()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Device does not have rose chip.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD54C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to connect to fRoseCommMgr", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD578()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to deassert interface 0 path ownership.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD5A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsSetMACAddressFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD608()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsSendPowerTableFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD66C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsCoExStatusFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD6D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsCIRVersionFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD734()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "AOPActivateTimeSyncEnableFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD798()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "FWTimeSyncEnableFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD7FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "DisableFWLogsFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD860()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "ConfigureFWSleepFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD8C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "ExtClockSettingFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD928()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "PushCalFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD98C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "PingFWFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DD9F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "PushFWFailure: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDA54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "BootFailure Breakdown:", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDA80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a1, a3, "fResetCounter exceeded kMaxChipResets (%d), aborting nearbyd", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DDAEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Unable to power on Rose", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDB18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Unable to power off Rose", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDB44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: chip reset failed, falling back to power cycle", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDB70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "fRoseCommMgr.getPreflightInfo() failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDB9C(unsigned int *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_1002113D4(a1, __stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v1, v2, "Called getPreflightInfo but not in a compatible state: %s", v3);
  sub_10000BFC4();
}

void sub_1003DDC1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Called getPreflightInfo but there is no chip", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDC48(unsigned int *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_1002113D4(a1, __stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v1, v2, "Called getChipInfo but in state: [%s]", v3);
  sub_10000BFC4();
}

void sub_1003DDCC8()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10019EAD0(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, (uint64_t)v0, "PRRose: RoseSupervisor returned unexpected size %zu for deep sleep state. Aborting nearbyd.", v1);
  sub_10000BFC4();
}

void sub_1003DDD30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: sending deep sleep state query to RoseSupervisor failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDD5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to generate AOP activity report.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDD88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Chip is not present or failed to connect to RoseCommMgr. Ignoring attempt to trigger log collection", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDDB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to trigger log collection", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDDE0(unsigned int *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_1002113D4(a1, __stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v1, v2, "Tried to trigger fatal or nonfatal logs, but state is in [%s]", v3);
  sub_10000BFC4();
}

void sub_1003DDE60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "fRoseCommMgr.getChipPublicKey() failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDE8C(unsigned int *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_1002113D4(a1, __stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v1, v2, "Called getChipPublicKey but not in a compatible state: %s", v3);
  sub_10000BFC4();
}

void sub_1003DDF0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Called getChipPublicKey but there is no chip", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDF38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost: failed to clear AOP command queue.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDF64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose AOP reset did not finish in time.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDF90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost: failed to get AOP property CmdQueueClearAllowed.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDFBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: failed to get deep sleep state during startup", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DDFE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: failed to exit deep sleep during startup, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE014()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "PRRose failed to take assertion - setStateFromUnknownToHost: FWState::%s", v2);
  sub_10000BFC4();
}

void sub_1003DE09C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to dump existing logs, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE0C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to trigger fatal crashLog, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE0F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to dump exisiting logs, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE120()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Unable to power on R1", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE14C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost: Failed to trigger fatal crashLog, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to reset AOP jobs.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE1A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost failed to assert UWB comms ownership", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE1D0(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[24];

  sub_100211390(a1, __stack_chk_guard);
  sub_1002113E8();
  sub_100010B2C();
  sub_100010AC8((void *)&_mh_execute_header, v1, (uint64_t)v1, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v2);
  sub_10000BFC4();
}

void sub_1003DE274(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[24];

  sub_100211390(a1, __stack_chk_guard);
  sub_1002113E8();
  sub_100010B2C();
  sub_100010AC8((void *)&_mh_execute_header, v1, (uint64_t)v1, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v2);
  sub_10000BFC4();
}

void sub_1003DE318()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to send hello.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE344()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to apply config parameters.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE370()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to produce valid rose config parameters.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE39C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to activate AOP timesync.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE3C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to enable timesync on the FW", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE3F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to disable firmware logging", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE420()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "Unable to set AOP SleepBetweenRangingCycles property", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE44C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to enable UWB sleep between ranging cycles", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE478()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Unable to disable UWB power table", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE4A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Disabling sleep failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE4D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Unable to set OTPWorkaroundCompleted property", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE4FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Enabling sleep failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE528()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to enable internal clock on the FW", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE554()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to configure Rose to use host GTB", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE580()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to set RX LP mode", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE5AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to enforce NB/UWB eLNA mode on the FW", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE5D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to set NB ePA/eLNA mode on the FW", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE604()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "firmware is indicating a bad calibration file", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Resetting chip since cal data has not been pushed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE65C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#deep-slp Disabling deep sleep on unsupported Rose HW rev", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE688()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Unexpected chip reset event received while booting", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE6B4(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[24];

  sub_100211390(a1, __stack_chk_guard);
  sub_1002113E8();
  sub_100010B2C();
  sub_100010AC8((void *)&_mh_execute_header, v1, (uint64_t)v1, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v2);
  sub_10000BFC4();
}

void sub_1003DE758(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[24];

  sub_100211390(a1, __stack_chk_guard);
  sub_1002113E8();
  sub_100010B2C();
  sub_100010AC8((void *)&_mh_execute_header, v1, (uint64_t)v1, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v2);
  sub_10000BFC4();
}

void sub_1003DE7FC(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;

  sub_1002113A8(a1, __stack_chk_guard);
  sub_1002113C0();
  v4 = "FatalChipError";
  sub_100010AC8((void *)&_mh_execute_header, v1, v2, "PRRose failed to take assertion. state %s, event: %s, aborting nearbyd", v3);
  sub_10000BFC4();
}

void sub_1003DE888(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;

  sub_1002113A8(a1, __stack_chk_guard);
  sub_1002113C0();
  v4 = "ChipReset";
  sub_100010AC8((void *)&_mh_execute_header, v1, v2, "PRRose failed to take assertion. state %s, event: %s, aborting nearbyd", v3);
  sub_10000BFC4();
}

void sub_1003DE914(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[24];

  sub_100211390(a1, __stack_chk_guard);
  sub_100010B2C();
  sub_100010AC8((void *)&_mh_execute_header, v1, (uint64_t)v1, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v2);
  sub_10000BFC4();
}

void sub_1003DE9BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Error state - FatalChipError. Start error handling.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DE9E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to dump firmware logs, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEA14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Rose Service Handshake Error. Cannot proceeed. Aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEA40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Error state - FatalChipError. Already in ErrorHandling state, ignoring.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEA6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Event - ChipReset. Already in ErrorHandling state, ignoring.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEA98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Event - BootError. Already in ErrorHandling state, ignoring.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEAC4(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[24];

  sub_100211390(a1, __stack_chk_guard);
  sub_1002113E8();
  sub_100010B2C();
  sub_100010AC8((void *)&_mh_execute_header, v1, (uint64_t)v1, "PRRose unexpected event while in state: %s, event: %s, ignoring", v2);
  sub_10000BFC4();
}

void sub_1003DEB68(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  sub_100211390(a1, __stack_chk_guard);
  sub_1002113E8();
  sub_100010B2C();
  sub_1002113F4((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4);
  sub_10000BFC4();
}

void sub_1003DEC04(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;

  sub_1002113A8(a1, __stack_chk_guard);
  sub_1002113C0();
  v4 = "PowerOn";
  sub_100010AC8((void *)&_mh_execute_header, v1, v2, "PRRose Power On Failed  while in state: %s, event: %s, aborting nearbyd", v3);
  sub_10000BFC4();
}

void sub_1003DEC90(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;

  sub_1002113A8(a1, __stack_chk_guard);
  sub_1002113C0();
  v4 = "Configure";
  sub_100010AC8((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3);
  sub_10000BFC4();
}

void sub_1003DED1C(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  sub_100211390(a1, __stack_chk_guard);
  sub_1002113E8();
  sub_100010B2C();
  sub_1002113F4((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4);
  sub_10000BFC4();
}

void sub_1003DEDB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: timed out waiting for deep sleep exit", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEDE4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "PRRose: invalid deep sleep state %s after requesting deep sleep exit. Aborting nearbyd.", v2);
  sub_10000BFC4();
}

void sub_1003DEE60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose::errorHandlingRoutine: Failed to promote error to fatal. Aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEE8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to start secureROM Timer.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEEB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: sending deep sleep entry request to RoseSupervisor failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: sending LPEM Enable command to Rose failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEF10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to trigger fatal crash logs, aborting nearbyd", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEF3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose is no longer in Error. Ignoring the event.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEF68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to start LogCollectionCompleted Timer.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEF94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::Dead", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEFC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::RoseSecureROM. No longer in SecureROM. Ignoring the event", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DEFEC(unsigned int *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_1002113D4(a1, __stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v1, v2, "PRRose: DebugManagerEvent::RoseSecureROM. Current state: [%s]", v3);
  sub_10000BFC4();
}

void sub_1003DF06C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::LogCollectionFatalFailed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::LogCollectionNonFatalFailed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF0C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::InterfaceError", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF0F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::FilesystemError", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF11C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: null timeoutCB.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to create LogCollectionCompleted timer.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to create timer.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF1A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose is unavailable to provide services", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF1CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRose: powerOnAndWaitForReady timed out while waiting for response.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF1F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "PRRose:applyConfigOptions,regulatory,sendingConfig, rangingGroupMessageID != SET_CONFIG (%hx)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF25C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "PRRose:applyConfigOptions,regulatory,sendingConfig, groupID != Ranging (%hhx)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF2C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "UWB sleep between ranging set config failure - unexpected response type", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF2EC()
{
  os_log_t v0;
  uint8_t v1[8];

  sub_100154B28();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "UWB sleep between ranging set config failure - status %d", v1, 8u);
  sub_10000991C();
}

void sub_1003DF35C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#handoffca rangingRateChanged() called without active session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF388()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_10019EAC4();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#handoffca rangingRateChanged() monotonicTimeSeconds: %f s, rangingIntervalMilliseconds %d s", v2, 0x12u);
  sub_10000BFC4();
}

void sub_1003DF400()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#handoffca regionChanged() called without active session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF42C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca regionChanged() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF490()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca updateTimeSpentRangingWithNumberOfDevices() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#handoffca addedDevice() called without active session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF520()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca adding device in addedDevice(), monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF584()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca addedDevice() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF5E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#handoffca removedDevice() called without active session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF614()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca removing object in removedDevice() monotonicTimeSeconds: %f s,", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF678()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca removedDevice() monotonicTimeSeconds: %f s,", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF6DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca sessionStarted() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF740()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#handoffca sessionEnded() called without active session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DF76C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#handoffca sessionEnded() monotonicTimeSeconds: %f, s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003DF7D0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#handoffca resetStatistics()", v1, 2u);
  sub_10000991C();
}

void sub_1003DF808(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Registered for vision input but does not support camera assistance.", v1, 2u);
}

void sub_1003DF848(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "FindingFrame,Measured velocity change and measured displacement are both available", a5, a6, a7, a8, 0);
}

void sub_1003DF87C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "FindingFrame,Contents are larger than space allocated to it. Wrapping around.", a5, a6, a7, a8, 0);
}

float sub_1003DF8B0(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  float result;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;

  v2 = a1[8];
  v3 = a1[9];
  v4 = a1[10];
  v5 = a1[11];
  v7[0] = 67109888;
  v7[1] = v2;
  v8 = 1024;
  v9 = v3;
  v10 = 1024;
  v11 = v4;
  v12 = 1024;
  v13 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#type19,Parsed. Flag FE: %d. FS: %d. FC: %d. FC2: %d", (uint8_t *)v7, 0x1Au);
  return result;
}

void sub_1003DF94C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#type19,Data to parse: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1003DF9C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100154B18((void *)&_mh_execute_header, a1, a3, "#type19,Commit change (empty payload). But no actual change.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DF9F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100154B18((void *)&_mh_execute_header, a1, a3, "#type19,Commit change (empty payload). Using dummy data.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DFA20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100154B18((void *)&_mh_execute_header, a1, a3, "#type19,Commit change (non-empty payload), but no actual change", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003DFA50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid argument - token is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFA7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid argument - client is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFAA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Failed to build nbamms ranging session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFAD4()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#find-range,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003DFB24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Cannot attached client to existing NBAMMS session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFB50(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#find-range,Shared protocol not matching - new protocol: %d, existing protocol: %d", (uint8_t *)v4, 0xEu);
  sub_10000BFC4();
}

void sub_1003DFBD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Reciprocal -> one-way: couldn't get ranging token or parameters", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFC00()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10022E250(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#find-range,%@, cannot set findee data if not findee", v2);
  sub_10000BFC4();
}

void sub_1003DFC64()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_10022E2AC();
  sub_10022E294(v1, 5.8081e-34, v2, v3);
  sub_10022E224((void *)&_mh_execute_header, "#find-range,#crypto Failed to encrypt (self ID %{private}@), id: %@", v4, v5);

  sub_100029D60();
}

void sub_1003DFCA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,#crypto Aiding and signalling encryption failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFCCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-range,#data TX: aiding / signalling", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFCF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,FindingDataFrameFormat::encode failed in NBAMMSSessionManager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFD24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Malformed findee data detected", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFD50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-range,#data RX: aiding / signalling", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003DFD7C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10022E250(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _serviceRequestStatusUpdate but nothing attached, possible race condition. %@", v2);
  sub_10000BFC4();
}

void sub_1003DFDE0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10022E250(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceiveNewSolution but nothing attached, possible race condition. %@", v2);
  sub_10000BFC4();
}

void sub_1003DFE44(uint64_t a1)
{
  sub_10022E234(*(_QWORD **)(a1 + 680), a1 + 672);
}

void sub_1003DFE60(uint64_t a1)
{
  sub_1003CEFB8(a1);
}

void sub_1003DFE74(uint64_t a1)
{
  sub_10022E234(*(_QWORD **)(a1 + 680), a1 + 672);
}

void sub_1003DFE80()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10022E250(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceiveUnsuccessfulSolution but nothing attached, possible race condition. %@", v2);
  sub_10000BFC4();
}

void sub_1003DFEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10022E250(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceivePeerData but nothing attached, possible race condition. %@", v2);
  sub_10000BFC4();
}

void sub_1003DFF48()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10022E280();
  sub_100154B28();
  sub_10022E23C((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid peer data size %d", v2);
  sub_10000991C();
}

void sub_1003DFFA8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_10022E2AC();
  sub_10022E294(v1, 5.8081e-34, v2, v3);
  sub_10022E224((void *)&_mh_execute_header, "#find-range,#crypto Failed to decrypt (peer ID %{private}@). %@", v4, v5);

  sub_100029D60();
}

void sub_1003DFFE4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10022E280();
  sub_100154B28();
  sub_10022E23C((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid message size %d", v2);
  sub_10000991C();
}

void sub_1003E0044()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10022E250(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceiveInvalidation but nothing attached, possible race condition. %@", v2);
  sub_10000BFC4();
}

void sub_1003E00A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  const char *v5;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  sub_10022E250(__stack_chk_guard);
  v4 = *(unsigned __int8 *)(v3 + 1672);
  if (*(_BYTE *)(v3 + 936))
    v5 = "yes";
  else
    v5 = "no";
  v7 = 138412802;
  if (v4)
    v6 = "yes";
  else
    v6 = "no";
  v8 = v2;
  v9 = 2080;
  v10 = v5;
  v11 = 2080;
  v12 = v6;
  sub_10022E2D4((void *)&_mh_execute_header, v0, v1, "#find-range,Rose service request of %@, finder: %s, findee: %s", (uint8_t *)&v7);
}

void sub_1003E0150()
{
  NSObject *v0;
  uint64_t v1;
  _BYTE *v2;
  const char *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  sub_10022E250(__stack_chk_guard);
  v3 = "yes";
  v5 = *(unsigned __int8 *)(v4 + 1672);
  if (*v2)
    v6 = "yes";
  else
    v6 = "no";
  v7 = 138412802;
  if (!v5)
    v3 = "no";
  v8 = v1;
  v9 = 2080;
  v10 = v6;
  v11 = 2080;
  v12 = v3;
  sub_10022E2D4((void *)&_mh_execute_header, v0, (uint64_t)v0, "#find-range,Start ranging options of %@, finder: %s, findee: %s", (uint8_t *)&v7);
}

void sub_1003E01FC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_10022E2C0();
  sub_10022E25C(v1, v2, v3, 5.778e-34);
  sub_10022E224((void *)&_mh_execute_header, "#find-range,Failed to initialize a NBAMMS session for %@. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E0240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-range,#data TX: crypto session config", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E026C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-range,#data RX: crypto session config", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0298()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 697, "finderOutboundAuthStateRawValue <= 0x0F");
}

void sub_1003E02C0()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 698, "finderInboundAuthStateRawValue <= 0x0F");
}

void sub_1003E02E8()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 712, "findeeOutboundAuthStateRawValue <= 0x0F");
}

void sub_1003E0310()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 713, "findeeInboundAuthStateRawValue <= 0x0F");
}

void sub_1003E0338()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10022E250(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#find-range,#crypto #auth encryption failed, %@", v2);
  sub_10000BFC4();
}

void sub_1003E039C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-range,#data TX: mutual auth", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E03C8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  sub_10022E280();
  sub_100154B28();
  sub_10022E23C((void *)&_mh_execute_header, v0, v1, "#find-range,#auth Invalid message size %d", v2);
  sub_10000991C();
}

void sub_1003E0428(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#find-range,#auth Message could not be parsed for peer %s state", buf, 0xCu);
}

void sub_1003E046C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-range,#data RX: mutual auth", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0498(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315394;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  sub_10022E224((void *)&_mh_execute_header, "#find-range,#auth IGNORED peer [%s] mutual auth:      %@", (uint8_t *)a3, a4);

  sub_100029D60();
}

void sub_1003E04EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,#auth Can't advance resync on a non-resync state", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0518()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,#auth Can't start resync on a non-resync state", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0544()
{
  os_log_t v0;
  uint8_t v1[8];

  sub_100154B28();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#find-range,Cannot start ranging because shared protocol version (%d) does not support group finding", v1, 8u);
  sub_10000991C();
}

void sub_1003E05B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Unrecognized NMI session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E05E0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#find-range,Consumer provided incomplete ranging availability callbacks", v1, 2u);
  sub_10000991C();
}

void sub_1003E0618()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,startRangingWithPeer: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0644()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Failed to build service request", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0670()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,StopRangingWithPeer: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E069C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,setAlgorithmAidingData, not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E06C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,setAlgorithmAidingData, not ranging with specified peer", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E06F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,setSignallingData, not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0720()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,setSignallingData, not ranging with specified peer", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E074C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Reset ranging state for nil token in ranging provider", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,NewSolution, not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E07A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Unsuccessful solution: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E07D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Session status update, not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E07FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Consumer unexpectedly set to null", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,didReceiveNbammsPeerAlgorithmAidingData:signallingData: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,didInvalidateNbammsSessionWithReason: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0880()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_10022E2C0();
  sub_10022E25C(v1, v2, v3, 4.8151e-34);
  sub_10022E224((void *)&_mh_execute_header, "#find-range,[%s] Rose session invalidated unexpectedly. Reason: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E08C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,didFailCrypto: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E08F0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#find-range,[%s] #crypto Failed (reached maximum)", (uint8_t *)a2);
}

void sub_1003E092C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,didFailMutualAuth: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0958(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#find-range,[%s] #auth Failed mutual auth", (uint8_t *)a2);
}

void sub_1003E0994()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,_didReceiveUWBSessionStatusUpdate: not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E09C0()
{
  __assert_rtn("-[NIServerFindingRangingProvider rangingServiceDidUpdateState:cause:]_block_invoke", "NIServerFindingRanging.mm", 4039, "false");
}

void sub_1003E09E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-range,Secondary scheduling duty cycle > Primary scheduling duty cycle, do not process backoff acquisition policy", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0A14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#find-range,Secondary acquisiton scheme not enabled for initiator", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0A40(uint64_t a1)
{
  sub_10022E234(*(_QWORD **)(a1 + 672), a1 + 664);
}

void sub_1003E0A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1 - 24;
  do
  {
    sub_10003E3F0(v3, *(_QWORD **)(v3 + 8));
    if (*(char *)(v3 - 1) < 0)
      operator delete(*(void **)(v3 - 24));
    v3 -= 48;
  }
  while (v3 + 24 != a2);
}

void sub_1003E0AA8()
{
  __assert_rtn("-[NIServerNearbyPeerSession requiresNarrowbandToRun]", "NIServerNearbyPeerSession.mm", 199, "_subspecializedPeerSession");
}

void sub_1003E0AD0()
{
  __assert_rtn("-[NIServerNearbyPeerSession configure]", "NIServerNearbyPeerSession.mm", 213, "_configuration");
}

void sub_1003E0AF8()
{
  __assert_rtn("-[NIServerNearbyPeerSession configure]", "NIServerNearbyPeerSession.mm", 228, "_peerTokenDict != nil");
}

void sub_1003E0B20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Nearby Peer does not support BG mode with known devices", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0B4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Discovery token failed validation %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E0BAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Discovery token doesn't contain an identifier", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0BD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Discovery token doesn't contain IRK", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0C04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Identical LocalNumber and PeerNumber using legacy initiator selection logic", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0C30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,skipping measurement due to a lack of mach continuous timestamp.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0C5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Solution mac_addr = %llu", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E0CBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Address 0x%{private}llx has no mapping to a discovery token.", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E0D1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Malformed findee data detected", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0D48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Received remote data", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0D74(_DWORD *a1, _DWORD *a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1 - *a2;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-nrby-peer,Received unexpected remote data: too small (%d < %d)", (uint8_t *)v4, 0xEu);
  sub_10000BFC4();
}

void sub_1003E0E04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Received unexpected remote data: incorrect type", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0E30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Sending hangup signal", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,#warning, failed to pause session inside _peerInactivityPeriodExceeded: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E0EBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,kInternalTrackingStopReason_LocalForceRemoved is not supported for this session type.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0EE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,#warning, _peerInactivityPeriodExceeded but peer token is not cached %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E0F48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,FindingDataFrameFormat::encode failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0F74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Invalid token. Token provided does not match peer discovery token", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0FA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,altitudeData is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E0FCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving altimeter data: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E102C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Pedometer data update", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,pedometerData is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1084()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,sending pedometer data to NUE", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E10B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving pedometer data: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E1110()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Pedometer event update", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E113C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving pedometer event: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E119C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,motion activity is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E11C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,sending motion activity to NUE", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E11F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Motion activity update", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,device motion is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E124C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Could not convert pdr state time to mach continuous", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,pdr state received: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E12D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving PDRState: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E1338()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,PDR update", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1364()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Could not convert device motion time to mach continuous", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1390()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving DeviceMotion: %{public}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E13F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,failed creating CMPDRManager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E141C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create motion activity manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1448()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create pedometer manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1474()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create altimeter manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E14A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create motion manager", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E14CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,didUpdateFindeeData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E14F8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#alisha-cert,Error serializing to JSON", v1, 2u);
}

void sub_1003E1538(int a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  int v6;
  __CFString *v7;

  v3 = CFSTR("Unknown");
  if (a1 == 1)
    v3 = CFSTR("AlishaURSKRetrievalFailed");
  if (!a1)
    v3 = CFSTR("AlishaGetKeyTimedOut");
  v4 = v3;
  v6 = 138412290;
  v7 = v4;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#ttr,Another alert is being presented. Do not present alert for event %@", (uint8_t *)&v6, 0xCu);

}

void sub_1003E1600(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create nw monitor path", v1, 2u);
}

void sub_1003E1640()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-carkey,#lab-test Test mode wasn't disabled on invalidation", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E166C()
{
  __assert_rtn("-[NIServerCarKeySession configure]", "NIServerCarKeySession.mm", 415, "_configuration");
}

void sub_1003E1694(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1704(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1774(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E17E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-carkey,%@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E18B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1924(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1994(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1A04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1A74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-carkey,_processCarKeyEvent: event is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1AA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-carkey,_processCarKeyEvent: event type key not found or invalid", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1ACC(int a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(_QWORD *)(buf + 10) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-carkey,_processCarKeyEvent: unknown event type %d for vehicle identifier: %@", buf, 0x12u);

  sub_100029D60();
}

void sub_1003E1B2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-carkey,_processCarKeyEvent: invalid ranging intent reason", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E1B58(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_10025DEF0((void *)&_mh_execute_header, a2, a3, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging terminated sub-event. Vehicle identifier: %@. No Alisha manager, nothing to do here.", (uint8_t *)a2);

  sub_100029D60();
}

void sub_1003E1B9C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_10025DEF0((void *)&_mh_execute_header, a2, a3, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging suspension sub-event. Vehicle identifier: %@. No Alisha manager, nothing to do here.", (uint8_t *)a2);

  sub_100029D60();
}

void sub_1003E1BE0()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-carkey,Failed to allocate Alisha session. Error: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
  sub_100029D60();
}

void sub_1003E1C34()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-carkey,Alisha session invalidated unexpectedly. Reason: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
  sub_100029D60();
}

void sub_1003E1C88()
{
  __assert_rtn("-[NIServerCarKeySession _configureForOwnerDevice]", "NIServerCarKeySession.mm", 880, "_passthroughParams.anchorSimulation == false");
}

void sub_1003E1CB0()
{
  __assert_rtn("-[NIServerCarKeySession _configureForOwnerDevice]", "NIServerCarKeySession.mm", 879, "_passthroughParams.isPassthroughSession == false");
}

void sub_1003E1CD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1D48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1DB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1E28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1E98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,#lab-test %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1F08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,#lab-test %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E1F78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-carkey,#lab-test %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E1FD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,#lab-test %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E2048(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,#lab-test %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E20B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,#lab-test %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E2128(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,#lab-test %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E2198()
{
  __assert_rtn("-[NIServerCarKeySession _runOwnerSession]", "NIServerCarKeySession.mm", 1216, "_alishaManager");
}

void sub_1003E21C0()
{
  uint64_t v0;
  os_log_t v1;

  sub_10025DED8();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Result raw: %u, Error string: %@");
  sub_10000BFC4();
}

void sub_1003E2220()
{
  __assert_rtn("-[NIServerCarKeySession _runPassthroughSession]", "NIServerCarKeySession.mm", 1238, "_standaloneAlishaSession");
}

void sub_1003E2248()
{
  __assert_rtn("-[NIServerCarKeySession _runPassthroughSession]", "NIServerCarKeySession.mm", 1239, "_passthroughParams.passthroughUwbSessionId.has_value()");
}

void sub_1003E2270()
{
  __assert_rtn("-[NIServerCarKeySession _runPassthroughSession]", "NIServerCarKeySession.mm", 1257, "_passthroughParams.dckTimeSyncBtEvent.has_value()");
}

void sub_1003E2298()
{
  __assert_rtn("-[NIServerCarKeySession _runPassthroughSession]", "NIServerCarKeySession.mm", 1258, "_passthroughParams.dckTimeSyncUwbDeviceTimeUsec.has_value()");
}

void sub_1003E22C0()
{
  __assert_rtn("-[NIServerCarKeySession _runPassthroughSession]", "NIServerCarKeySession.mm", 1259, "_passthroughParams.passthroughUwbTime0.has_value()");
}

void sub_1003E22E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-carkey,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E2358()
{
  uint64_t v0;
  os_log_t v1;

  sub_10025DED8();
  sub_10001B0FC((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Result raw: %u, %@");
  sub_10000BFC4();
}

void sub_1003E23B8()
{
  __assert_rtn("ticksInMicroseconds", "AlishaCommon.h", 83, "bluetoothTicks.has_value()");
}

void sub_1003E23E0()
{
  __assert_rtn("ticksInMicroseconds", "AlishaCommon.h", 86, "gtbTicks.has_value()");
}

void sub_1003E2408()
{
  __assert_rtn("-[NIServerCarKeySession _pausePassthroughOrLabTestModeSession]", "NIServerCarKeySession.mm", 1310, "_standaloneAlishaSession");
}

void sub_1003E2430()
{
  __assert_rtn("AlishaConfigProvider", "NIServerCarKeySession.mm", 142, "minRanMultiplier > 0");
}

void sub_1003E2458()
{
  __assert_rtn("AlishaConfigProvider", "NIServerCarKeySession.mm", 143, "minRanMultiplier <= std::numeric_limits<decltype(_minRanMultiplier)>::max()");
}

void sub_1003E2480()
{
  __assert_rtn("AlishaConfigProvider", "NIServerCarKeySession.mm", 152, "startTimeOffsetSeconds > 0.0");
}

void sub_1003E24A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Existing service request does not have tx_preamble. Cannot add it to running count.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E24D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Not supported tx_preamble in service request", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E2500()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Failed to create alisha session.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E252C(uint64_t a1)
{
  sub_1001DB2DC(a1);
  operator delete();
}

void sub_1003E2554()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#configurator,Add client %@ but client already registered", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E25B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#configurator,Remove client %@ but client not found", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E2614()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#configurator,Client %@ requested prewarm but client not found", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E2674()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#configurator,Client %@ notified resource usage but client not found", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E26D4(unsigned __int8 a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(_QWORD *)(buf + 10) = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#configurator,Client notified resource usage limit exceeded (%d) for unsupported configuration type %@", buf, 0x12u);

}

void sub_1003E273C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#configurator,Client %@ notified passive access but client not found", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E279C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "#configurator,UWB system state is Off with unspecified reason", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E27CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "#configurator,UWB system state can't be Off with reason ErrorHandling", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E27FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "#configurator,UWB system state is unspecified", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E282C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementCategory::STATIC", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E2858()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementCategory::SLOWLY_MOVING", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E2884()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementCategory::WALKING_OR_UNKNOWN", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E28B0(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;

  v4 = 134217984;
  v5 = a2;
  sub_10017A068((void *)&_mh_execute_header, a1, a4, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementEnterTimestamp=%lf", (uint8_t *)&v4);
}

void sub_1003E2920()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E294C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData BoundedDisplacementCategory::STATIC", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E2978()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData BoundedDisplacementCategory::SLOWLY_MOVING", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E29A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData BoundedDisplacementCategory::WALKING_OR_UNKNOWN", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E29D0(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;

  v4 = 134217984;
  v5 = a2;
  sub_10017A068((void *)&_mh_execute_header, a1, a4, "#convertToAlgorithmFindeeData BoundedDisplacementEnterTimestamp=%lf", (uint8_t *)&v4);
}

void sub_1003E2A40(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;

  v3 = *a1;
  *(_DWORD *)a2 = 134217984;
  *(_QWORD *)(a2 + 4) = v3;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "#convertToAlgorithmFindeeData mach_absolute_receipt_timestamp=%lf", (uint8_t *)a2);
}

void sub_1003E2A80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E2AAC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100264FD8((void *)&_mh_execute_header, a2, a3, "regulatory,geof,processLocation,%{private}.6f,%{private}.6f,%{private}.2f,age,%.3f,logInterval,%.2f", a5, a6, a7, a8, 1u);
}

void sub_1003E2B4C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,geof,default,cleared geof sites", v1, 2u);
  sub_10000991C();
}

void sub_1003E2B88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "regulatory,geof,default,fLocationAgeThreshold, %.1f", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E2BF0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "regulatory,geof,default,fUwbOffDelay, %.1f", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E2C58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "regulatory,geof,default,fUwbOnDelay, %.1f", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E2CC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a2, a3, "regulatory,geof,ls:%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E2D28()
{
  int v0;
  uint64_t v1;
  os_log_t v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  sub_10014BC8C(__stack_chk_guard);
  v3[0] = 67109378;
  v3[1] = v0;
  v4 = 2080;
  v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "regulatory,geof,processIsoChange,slot:%d,iso:%s", (uint8_t *)v3, 0x12u);
  sub_10000BFC4();
}

void sub_1003E2DA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a2, a3, "regulatory,geof,processAirplaneMode:%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E2E10()
{
  __assert_rtn("_updateRecommendationAndDeliverIfPossible", "NIServerBackoffResumeManager.mm", 421, "timeSinceLastRecommendationSeconds >= 0");
}

void sub_1003E2E38(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#backoff,Got FBSDisplayLayoutMonitor callback with nil layout.", v1, 2u);
}

void sub_1003E2E78(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#backoff,Unhandled branch in _getRecommendation()", v1, 2u);
}

void sub_1003E2EB8()
{
  __assert_rtn("_deliverCurrentRecommendation", "NIServerBackoffResumeManager.mm", 440, "fCurrentRecommendation.has_value()");
}

void sub_1003E2EE0()
{
  __assert_rtn("NIRegionSizeCategoryToString", "NIRegionPredicate.mm", 205, "false");
}

void sub_1003E2F08()
{
  __assert_rtn("NIDevicePresencePresetToString", "NIRegionPredicate.mm", 193, "false");
}

void sub_1003E2F30(char *a1, uint64_t a2, NSObject *a3)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = v4;
  sub_10015ABE4((void *)&_mh_execute_header, a2, a3, "pblogger, protobuf Trying to log before opening log file. %s", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_1003E2F94()
{
  __assert_rtn("logContextEvent", "PRProtobufLogger.cpp", 267, "event.accessoryEvent.has_value()");
}

void sub_1003E2FBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "pblogger, PRProtobufLogger failed to populate logEntry timestamps", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E2FE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceCancelEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3014()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceCancelEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3040()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStopEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E306C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStopEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStartEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E30C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStartEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E30F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029D84();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "pblogger, Error code not supported by protobuf %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3150()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloCommand end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E317C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloCommand start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E31A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029D84();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "pblogger, Session type not supported by protobuf %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3208()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029D84();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "pblogger, Session role not supported by protobuf %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloResponse end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3294()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloResponse start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E32C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger log Test NMI Range Enable Command end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E32EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger log Test NMI Range Enable Command start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3318()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResultEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3344()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100029D84();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "pblogger, Band select not supported by protobuf %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E33A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResult start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E33D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeCIRData end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E33FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "pblogger, logRangeCIREvent failure 2", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3428(char *a1, uint64_t a2, NSObject *a3, _QWORD *a4)
{
  char *v6;

  if (a1[23] >= 0)
    v6 = a1;
  else
    v6 = *(char **)a1;
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = v6;
  sub_10015ABE4((void *)&_mh_execute_header, a2, a3, "pblogger, getPbCIRPacketType: unrecognized CIR packet type: %s", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
  *a4 = qword_10085F520;
}

void sub_1003E34A0(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pblogger, logRangeCIREvent failure 3", buf, 2u);
}

void sub_1003E34DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "pblogger, logRangeCIREvent failure 1", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeCIRData start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3534()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logAOACIRDataEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logAOACIRDataEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E358C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E35B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E35E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataV2Event end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3610()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataV2Event start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E363C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResultDebugEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3668()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "pblogger, Failed to populate range debug event session type.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3694()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResultDebugEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E36C0()
{
  __assert_rtn("logLocalP2PTimestampEvent", "PRProtobufLogger.cpp", 1198, "localP2PTimestampEvent.rawLocalEvent().has_value()");
}

void sub_1003E36E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logLocalP2PTimestampEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3714()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logLocalP2PTimestampEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3740()
{
  __assert_rtn("logLocalP2PTimestampEvent", "PRProtobufLogger.cpp", 1197, "localP2PTimestampEvent.eventSource() == RangeTimestampEvent::Source::Local");
}

void sub_1003E3768()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRemoteP2PTimestampEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3794()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRemoteP2PTimestampEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E37C0()
{
  __assert_rtn("logRemoteP2PTimestampEvent", "PRProtobufLogger.cpp", 1275, "remoteP2PTimestampEvent.eventSource() == RangeTimestampEvent::Source::Remote");
}

void sub_1003E37E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logResponderSuperframeCompleteEvent end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3814()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logResponderSuperframeCompleteEvent start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3840()
{
  __assert_rtn("extendedPreambleToCLPRosePreamble", "PRProtobufLogger.cpp", 191, "false");
}

void sub_1003E3868(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;

  v3 = *a1;
  v2 = a1[1];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = 134219008;
  v8 = v2;
  v9 = 2048;
  v10 = v3;
  v11 = 2048;
  v12 = v4;
  v13 = 2048;
  v14 = v5;
  v15 = 2048;
  v16 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "pblogger, RoseSensorFusion: logSensorFusionInputAndOutputWithMotion. Solution = ID: 0x%llx Timestamp: %f Range: %f El: %f Az: %f", (uint8_t *)&v7, 0x34u);
}

void sub_1003E390C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logDeviceType", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logMeasurementEngineDefaultsWrites", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3964()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "pblogger, PRProtobufLogger logCalForwardLUTs fails: calBlob misses one or more calibration files!", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3990(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;

  v2 = 134218240;
  v3 = a1;
  v4 = 1024;
  v5 = 11;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "pblogger, outputProbabilities size (%lu) does not match expected size (%d). Some fields in RangeBiasEstimatorUpdate will not be logged", (uint8_t *)&v2, 0x12u);
}

void sub_1003E3A14()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "pblogger, Logger::logLocationInputData, shouldn't get kCLLocationType_Max as a case", v1, 2u);
  sub_10000991C();
}

void sub_1003E3A4C()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 945, "data_ != __null");
}

void sub_1003E3A74()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 946, "idx >= 0");
}

void sub_1003E3A9C()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 947, "idx < num_elements_");
}

void sub_1003E3AC4()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 815, "data_ != __null");
}

void sub_1003E3AEC()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 816, "idx >= 0");
}

void sub_1003E3B14()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 817, "idx < num_elements_");
}

void sub_1003E3B3C()
{
  operator delete((void *)qword_10085AE10);
}

void sub_1003E3B58()
{
  operator delete((void *)qword_10085ADB0);
}

void sub_1003E3B74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-nba,Resource manager did not provide discovery token", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3BA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#peer-nba,Cannot configure session, service request is nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3BCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#peer-nba,Session cannot be configured", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3BF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-nba,Attempted NBAMMS session without request from configuration", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3C24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-nba,NBAMMS session already exists. exiting.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3C50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#peer-nba,Run called without a successful configuration.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3C7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#peer-nba,sending data from nbamms session to rose base session", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3CA8(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#peer-nba,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
  sub_10000991C();
}

void sub_1003E3D1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#peer-nba,nbamms session received remote data", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3D48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#peer-nba,Session does not exists, cannot trigger ranging start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3D74()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_10015ABE4((void *)&_mh_execute_header, v2, v3, "#peer-nba,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E3DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-nba,Secondary scheduling duty cycle > Primary scheduling duty cycle, do not process backoff acquisition policy", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3DEC()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_10015ABE4((void *)&_mh_execute_header, v2, v3, "#peer-nba,Rose session invalidated unexpectedly. Reason: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E3E38()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_10015ABE4((void *)&_mh_execute_header, v2, v3, "#peer-nba,Failed to allocate a UWB session. Error: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E3E84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-nba,Discovery token doesn't contain valid IRK", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3EB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-nba,Could not create a valid combination IRK with local and peer IRKs", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3EDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#peer-nba,Invalid inputs provided for creating combination IRK of local and peer IRKs", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3F08()
{
  __assert_rtn("-[NIServerNearbyPeerNbammsSession _getRangingTriggerType]", "NIServerNearbyPeerNbammsSession.mm", 805, "_useTestNbammsMode == false");
}

void sub_1003E3F30()
{
  __assert_rtn("-[NIServerNearbyPeerNbammsSession _getRangingAcquisitionType]", "NIServerNearbyPeerNbammsSession.mm", 841, "_useTestNbammsMode == false");
}

void sub_1003E3F58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#peer-nba,Secondary acquisiton scheme not enabled for initiator", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E3F84(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#peer-nba,NIDiscoveryTokenToDictionary errored out, using default nap channel index: %d", (uint8_t *)v1, 8u);
  sub_10000991C();
}

void sub_1003E3FFC(uint64_t a1)
{
  sub_1003CF364(a1);
}

void sub_1003E4010(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("Add client fail - UWB session ID could not be generated");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003E4084(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("Add client fail - ranging service request could not be generated");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003E40F8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("Add client fail - ranging start options could not be generated");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003E416C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("Add client fail - raw data could not be parsed");
  sub_100029D1C((void *)&_mh_execute_header, a1, a3, "#accessory-service,%@", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003E41E0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100029D1C((void *)&_mh_execute_header, a2, a3, "#accessory-service,Generate UWB session ID - failed to generate for process %@, accessory data invalid", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003E4248()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Waiting for rdar://129298922 to support this mode [1]", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4274()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: can't parse accessory configuration data", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E42A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: Configuration Manager error", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E42CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: Unable to determine ISO country code", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E42F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: Unable to determine UWB channels", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: responder role not supported for this configuration", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4350()
{
  __assert_rtn("ComputeRangingIntervalMs", "NIFiRaDefinitions.h", 628, "fractional == 0");
}

void sub_1003E4378()
{
  __assert_rtn("ComputeRangingIntervalMs", "NIFiRaDefinitions.h", 631, "integral <= std::numeric_limits<uint16_t>::max()");
}

void sub_1003E43A0()
{
  __assert_rtn("AppleShareableConfigurationDataTotalLengthBytes", "NIFiRaDefinitions.h", 607, "false");
}

void sub_1003E43C8()
{
  __assert_rtn("CreateAppleShareableConfigurationData", "NIFiRaDefinitions.h", 717, "IsSupportedUWBInteropSpecVersion(uwbInteropSpecVersion)");
}

void sub_1003E43F0()
{
  __assert_rtn("CreateAppleShareableConfigurationData", "NIFiRaDefinitions.h", 716, "isoCountryCode.length() == sizeof(AppleShareableConfigurationData::V10_Fields::regulatoryCountryCode)");
}

void sub_1003E4418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  os_log_t v7;
  uint8_t *v8;

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "#accessory-service,Not able to convert preamble %s to FiRa preamble index", v8, 0xCu);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E446C()
{
  __assert_rtn("EncodeAppleShareableConfigurationData", "NIFiRaDefinitions.h", 765, "IsSupportedUWBInteropSpecVersion(shareableConfigData.uwbInteropVersion)");
}

void sub_1003E4494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Couldn't decode UWB channel override", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E44C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Failed to add subrate config 0 override", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E44EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Failed to add subrate config 1 override", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4518()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Waiting for rdar://129298922 to support this mode [2]", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4544()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,One or more required debug parameters were missing, unable to prep UWB session objects", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4570(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100029D1C((void *)&_mh_execute_header, a2, a3, "#accessory-service,Required debug parameter %@ is missing", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003E45D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#accessory-service,Build and run session: Failed to allocate", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4604()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_100029D1C((void *)&_mh_execute_header, v7, (uint64_t)v7, "#accessory-service,Build and run session: Failed to start. Error: %s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E4650()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_100029D1C((void *)&_mh_execute_header, v7, (uint64_t)v7, "#accessory-service,Build and run session: Failed to initalize. Error: %s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E469C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#accessory-service,Update session state - should be tracking but not currently tracking - unexpected!", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E46C8()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_100029D1C((void *)&_mh_execute_header, v7, (uint64_t)v7, "#accessory-service,Failed to restart ranging. Error: %s", v8);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E4714(uint64_t a1)
{
  sub_10022E234(*(_QWORD **)(a1 + 632), a1 + 624);
}

void sub_1003E4730(uint64_t a1)
{
  sub_10022E234(*(_QWORD **)(a1 + 664), a1 + 656);
}

void sub_1003E474C(uint64_t a1)
{
  sub_10022E234(*(_QWORD **)(a1 + 664), a1 + 656);
}

void sub_1003E4758()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter constructor:", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "updateTimes: offsets missing or inconsistent; setting fStartTimes = newTimes and fEndTimes = invalid",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000991C();
}

void sub_1003E47B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "updateTimes: offsetsConsistent(fEndTimes, newTimes); setting fStartTimes = fEndTimes and fEndTimes = newTimes",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000991C();
}

void sub_1003E47DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "updateTimes: offsetsConsistent(fStartTimes, newTimes); setting fEndTimes = newTimes",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000991C();
}

void sub_1003E4808()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter::updateTimes", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4834()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "getMachContinuousTimeSec: offset %.9f machCont %.9f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E4898(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "PRMachTimeConverter::getMachContinuousTimeSec(%.9f):", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E4900()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "getMachAbsoluteTimeSec: offset %.9f machAbs %.9f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E4964(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "PRMachTimeConverter::getMachAbsoluteTimeSec(%.9f):", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E49CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "getCFAbsoluteTimeSec: offset %.9f cfAbs %.9f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E4A30()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "getAllTimes() failed", v1, 2u);
  sub_10000991C();
}

void sub_1003E4A68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "PRMachTimeConverter::getCFAbsoluteTimeSec(%.9f):", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E4AD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter: endTimes invalid", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4AFC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "PRMachTimeConverter: endCont: %.9f", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E4B64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter: startTimes invalid", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4B90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "PRMachTimeConverter: startCont: %.9f", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E4BF8(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-base,Error while invalidating session. Session identifier: %@. Error: %@", buf, 0x16u);

}

void sub_1003E4C5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#ses-base,No device for identifier: 0x%llx", a5, a6, a7, a8, 0);
}

void sub_1003E4CC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-base,Failed to decode discovery token.", a5, a6, a7, a8, 0);
}

void sub_1003E4CF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-base,Failed to encode discovery token.", a5, a6, a7, a8, 0);
}

void sub_1003E4D2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Connection to wireless Coex manager fails", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4D58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#coex,onIncomingUCMEvent-Coex Event: XPC_ERROR_CONNECTION_INTERRUPTED", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4D84(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#coex,onIncomingUCMEvent-XPC connection error: %{public}s", (uint8_t *)a2);
}

void sub_1003E4DC0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 136446210;
  v4 = a1;
  sub_100029D1C((void *)&_mh_execute_header, a2, a3, "#coex,onIncomingUCMEvent-Unexpected XPC connection event: %{public}s", (uint8_t *)&v3);
}

void sub_1003E4E2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#coex,recieved incorrect channel to trigger blanking on, returning", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4E58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#coex,parseIncomingEvent-Received wrong message from UCM", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4E84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#coex,relayToProvider-Invalid message type", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4EB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#coex,relayToProvider,ChannelChange", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E4EDC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#GestureFileUtils Resource bundle '%s' does not exist in system volume.", (uint8_t *)a2);
}

void sub_1003E4F18(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#GestureFileUtils System volume folder '%s' does not exist.", (uint8_t *)a2);
}

void sub_1003E4F54(uint64_t *a1, NSObject *a2, uint64_t a3)
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
  sub_100029D1C((void *)&_mh_execute_header, a2, a3, "#GestureFileUtils Model weights file '%s' does not exist.", (uint8_t *)&v4);
}

void sub_1003E4FD0(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_1003E4FE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#fu,writeHeader failed, file not open.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E5014()
{
  NSObject *v0;
  uint8_t v1[14];
  int v2;

  sub_1002924CC(__stack_chk_guard);
  sub_1002924E4();
  v2 = 128;
  sub_1002924C0((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,writeHeader failed, header copyright size %zu, expected %d", v1);
  sub_10000BFC4();
}

void sub_1003E5088()
{
  NSObject *v0;
  uint8_t v1[14];
  int v2;

  sub_1002924CC(__stack_chk_guard);
  sub_1002924E4();
  v2 = 30;
  sub_1002924C0((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,writeHeader failed, header typeStr size %zu, expected %d", v1);
  sub_10000BFC4();
}

void sub_1003E50FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#fu,getHeader,failed,attemptOnInvalidFileHandle", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E512C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a2, a3, "#fu,getHeader,failed,invalidHeaderVersion,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E5194(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a2, a3, "#fu,getHeader,failed,invalidFileVersion,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E51FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a2, a3, "#fu,getHeader,failed,badEndianValue,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E5264(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = 178;
  sub_1002924C0((void *)&_mh_execute_header, a2, a3, "#fu,getHeader,failed,fileToSmall,size,%lu,expected,%d", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003E52DC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1002924A8(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,file,%s,notFound", v1);
  sub_10000BFC4();
}

void sub_1003E5344()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1002924A8(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,file,%s,failedToOpen", v1);
  sub_10000BFC4();
}

void sub_1003E53AC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1002924A8(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,doesNotExist,%s", v1);
  sub_10000BFC4();
}

void sub_1003E5414()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_10001B0D0((void *)&_mh_execute_header, v1, v2, "#fu,calcCrc called from %s,file,%s,cantOpen", v3, v4);
  sub_10000BFC4();
}

void sub_1003E5490()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#fu,isCrcOkay,getHeaderFailed,%s", v2);
  sub_10000BFC4();
}

void sub_1003E54F4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#fu,crc check fails for %s", v2);
  sub_10000BFC4();
}

void sub_1003E5558(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134349312;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2050;
  *(_QWORD *)&v3[14] = a2;
  sub_10001B0D0((void *)&_mh_execute_header, a2, a3, "#fu,expected file size %{public}zu, actual file size %{public}zu", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_10000BFC4();
}

void sub_1003E55C8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#ni-km,Delete all failed", v1, 2u);
}

void sub_1003E5608(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#ni-km,Write failed for %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E566C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#ni-km,Delete failed for %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E56D0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FATAL CLIENT ERROR: Client hasn't dequeued %zu xpc messages. Invalidating connection.", (uint8_t *)&v2, 0xCu);
}

void sub_1003E5744()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  sub_10014BC8C(__stack_chk_guard);
  v2 = 136315138;
  v3 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "#ota,file %s did not contain a dictionary as expected", (uint8_t *)&v2, 0xCu);
}

void sub_1003E57B8()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  sub_10014BC8C(__stack_chk_guard);
  v3 = 136315394;
  v4 = v0;
  v5 = 2112;
  v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "#ota,error reading file %s (%@)", (uint8_t *)&v3, 0x16u);
}

void sub_1003E583C(uint64_t a1, void **a2)
{
  void **v3;
  void **v4;

  v3 = (void **)(a1 - 24);
  do
  {
    v4 = v3;
    sub_10029C508(&v4);
    if (*((char *)v3 - 1) < 0)
      operator delete(*(v3 - 3));
    v3 -= 6;
  }
  while (v3 + 3 != a2);
}

void sub_1003E5890(uint64_t a1, void **a2)
{
  void **v3;
  void **v4;

  v3 = (void **)(a1 - 24);
  do
  {
    v4 = v3;
    sub_10029C508(&v4);
    if (*((char *)v3 - 1) < 0)
      operator delete(*(v3 - 3));
    v3 -= 6;
  }
  while (v3 + 3 != a2);
}

void sub_1003E58E4(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  v2 = a1 + 8;
  v3 = v4;
  if (*(char *)(v2 + 23) >= 0)
    v3 = v2;
  v5 = 136315138;
  v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Did fail with error: %s", (uint8_t *)&v5, 0xCu);
}

void sub_1003E5968()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRSystemSettingsMonitor: Failed to create _radioPrefs.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5994()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,ap,Failed to schedule Airplane Mode notifications.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E59C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,ap,Failed to set Airplane Mode notifications client.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E59EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "regulatory,ap,fetchAndUpdateAirplaneModeStatus failed - _radioPrefs is nil.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5A18()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, (uint64_t)v0, "fileutil,decompress,cantOpenSrcFile,%s", v1);
  sub_10000BFC4();
}

void sub_1003E5A90()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantOpenDstFile,%s", v2);
  sub_10000BFC4();
}

void sub_1003E5AF4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  v3 = 2080;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "fileutil,decompress,src,%s,dst,%s,done", v2, 0x16u);
  sub_10000BFC4();
}

void sub_1003E5B80()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantReadCompressedFile,%s", v2);
  sub_10000BFC4();
}

void sub_1003E5BE4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantWriteDecompressedFile,%s", v2);
  sub_10000BFC4();
}

void sub_1003E5C48()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10014BC8C(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantWriteDecompressedFile,%s, fstream write error", v2);
  sub_10000BFC4();
}

void sub_1003E5CAC(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v5 = 136315138;
  v6 = v3;
  sub_100029D1C((void *)&_mh_execute_header, a2, v4, "Caught Exception: %s", (uint8_t *)&v5);
}

void sub_1003E5D34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "PRConfigurationManager: UWB is not allowed.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E5D64(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[PRConfigurationManager] %d is invalid value for preferred channel in default write.", (uint8_t *)v2, 8u);
  sub_10000991C();
}

void sub_1003E5DD4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[PRConfigurationManager] At least one of Ch5 or Ch9 must be allowed.", v1, 2u);
  sub_10000991C();
}

void sub_1003E5E10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "[PRConfigurationManager] No valid RF channel.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E5E40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,startMonitoring,done", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5E6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,startMonitoring,skipped,reason,alreadyStarted", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5E98(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a2, a3, "regulatory,geo,locmgr,startMonitoring,_isMonitoringLocation,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E5F00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,startMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5F2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,stopMonitoring,skipped,reason,alreadyStopped", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5F58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,stopMonitoring,done.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5F84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,stopMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5FB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,upgradeToBestAccuracyMonitoring,skipped,reason,alreadyStopped", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E5FDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,upgradeToBestAccuracyMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6008()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,dowgradeToBystanderMonitoring,skipped,reason,alreadyStopped", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6034()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,dowgradeToBystanderMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6060(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "regulatory,geo,locmgr,didFailWithError,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E60C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,didChangeAuthorizationStatus,skipped,reason,notMonitoring", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E60F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a2, a3, "regulatory,geo,locmgr,didChangeAuthorizationStatus,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E6154(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a2, a3, "regulatory,geo,loc,processLocationAuthorized,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E61BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,startMonitoring", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E61E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,upgradeMonitoring", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6214()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,downgradeMonitoring", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6240()
{
  __assert_rtn("checkRegulatoryIso", "PRLocationMonitor.mm", 264, "currentMachContTimeSeconds > fLastIsoCheckMachContinuousTimeSeconds");
}

void sub_1003E6268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionRefCountTooLarge", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6294()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionAlreadyAcquired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E62C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, a3, "regulatory,geo,loc,checkRegulatoryIso,geoServices,results,%{private}@", a5, a6, a7, a8, 3u);
  sub_10000BFC4();
}

void sub_1003E6324(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "regulatory,geo,loc,checkRegulatoryIso,geoServices,error,%{private}@", (uint8_t *)&v2, 0xCu);
  sub_10000BFC4();
}

void sub_1003E6394()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionRefCountTooSmall", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E63C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionAlreadyReleased", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E63EC()
{
  __assert_rtn("getNextTLV", "roseCalFileParser.cpp", 161, "isVersion1 || isVersion2");
}

void sub_1003E6414()
{
  __assert_rtn("decodeSystemFactoryCalVersion", "roseCalFileParser.cpp", 310, "tlv.val.size() >= 2");
}

void sub_1003E643C()
{
  __assert_rtn("decodeSystemFactoryCalVersion", "roseCalFileParser.cpp", 309, "tlv.tagId == toUnderlyingType(TagId::System_Factory_Cal_Version)");
}

void sub_1003E6464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10036CAF0("RoseCalFileParser::getUnsignedIntVal called with invalid numBytes = %zu", a2, a3, a4, a5, a6, a7, a8, a1);
  __assert_rtn("getUnsignedIntVal", "roseCalFileParser.cpp", 338, "false");
}

void sub_1003E64A0()
{
  __assert_rtn("getUnsignedIntVal", "roseCalFileParser.cpp", 323, "idx + 2 <= data.size()");
}

void sub_1003E64C8()
{
  __assert_rtn("getUnsignedIntVal", "roseCalFileParser.cpp", 331, "idx + 4 <= data.size()");
}

void sub_1003E64F0()
{
  __assert_rtn("getPDOA_Forward_LUT", "roseCalFileParser.cpp", 297, "startIdx + numEntries * kNumBytesPerTableEntry <= byteVec.size()");
}

void sub_1003E6518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002AAD3C();
  sub_1002AAD60(4.8151e-34, v1, v2, v3);
  sub_10022E224((void *)&_mh_execute_header, "#rlm,Ignoring duplicate indicateRangingStarted for '%s' with sessionIdentifier %@", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E655C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002AAD3C();
  sub_1002AAD60(4.8151e-34, v1, v2, v3);
  sub_10022E224((void *)&_mh_execute_header, "#rlm,Ignoring duplicate indicateRangingStopped for '%s' with sessionIdentifier %@", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E65A0()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_1002AAD78((void *)&_mh_execute_header, v7, v8, "#rlm,RangingDurationTracker(%s): ranging started, first one", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E65E8()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_1002AAD78((void *)&_mh_execute_header, v7, v8, "#rlm,RangingDurationTracker(%s): ranging started, subsequent one", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E6630()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10025DEF0((void *)&_mh_execute_header, v7, v8, "#rlm,Attempt to stop ranging for '%s' when there is none ongoing", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E6678(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#rlm,useCases empty", v1, 2u);
}

void sub_1003E66B8()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10025DEF0((void *)&_mh_execute_header, v7, v8, "#rlm,RangingBudgetTracker not setup for use case '%s'", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E6700()
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

  sub_10015ABF4();
  if (v4 != v5)
    v6 = v3;
  else
    v6 = v1;
  sub_10019EA70(v2, v6, 4.8149e-34);
  sub_10025DEF0((void *)&_mh_execute_header, v7, v8, "#rlm,Unsupported use case '%s'", v9);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E6748(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "Motion is also nil", a5, a6, a7, a8, 0);
}

void sub_1003E677C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error receiving DeviceMotion: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1003E67F0()
{
  __assert_rtn("relayToProvider", "PRMotionProvider.mm", 82, "msg.update_interval.has_value()");
}

void sub_1003E6818(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "Message type RoseMotionMessageType::Unspecified", a5, a6, a7, a8, 0);
}

void sub_1003E684C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,fServiceTicketId does not have value", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,Unable to obtain configuration manager.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E68A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,Unable to register for service.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E68D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,Cannot initialize() an already initialized session object.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E68FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,STATE ERROR: using session after invalidation.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6928()
{
  __assert_rtn("isInitiator", "NIServerRoseSession.mm", 117, "fServiceRequest.role != serviceattributes::Role::Unspecified");
}

void sub_1003E6950()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,#throttle got didReceiveRangingRateUpdateEvent but fServiceTicketId == std::nullopt", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E697C(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;

  v3 = *a1;
  v4 = atomic_load(a2);
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#rose-ses,state inconsistency: mismatching subrates %d != %d.", (uint8_t *)v5, 0xEu);
  sub_10000BFC4();
}

void sub_1003E6A04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,logic error: notify reason must be FW event.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6A30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,logic error: mismatching tickets.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6A5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a1, a3, "#rose-ses,%{private}s called from an initiator.", a5, a6, a7, a8, 3u);
  sub_10000BFC4();
}

void sub_1003E6ACC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,Unexpected Alisha update.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6AF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,Converting aop alisha health to nearbyd alisha health failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6B24(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  const char *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t *v13;
  __int16 v14;
  const char *v15;

  v3 = *a1;
  v4 = *((char *)a1 + 31);
  v7 = (uint64_t *)a1[1];
  v5 = a1 + 1;
  v6 = v7;
  if (v4 >= 0)
    v8 = v5;
  else
    v8 = v6;
  v10 = 134218498;
  v11 = v3;
  if ((a2 & 1) != 0)
    v9 = "Notify";
  else
    v9 = "Invalidate";
  v12 = 2080;
  v13 = v8;
  v14 = 2080;
  v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#rose-ses,Failed with error. Code: %ld, Description: %s. Action: %s", (uint8_t *)&v10, 0x20u);
}

void sub_1003E6BDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a1, a3, "#rose-ses,%{private}s called from an initiator", a5, a6, a7, a8, 3u);
  sub_10000BFC4();
}

void sub_1003E6C4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,Given negative throttle rate.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6C78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,Throttle rate must be between 0 and 1.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6CA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,#throttle no ticket.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6CD0()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136380675;
  *(_QWORD *)(v2 + 4) = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#rose-ses,updatePeerData: %{private}s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
  sub_100029D60();
}

void sub_1003E6D2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#rose-ses,Got %s in AlishaSubsystem::getKey.", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E6DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,Did not expect successful KeyResponse in AlishaSubsystem::getKey.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6DEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: conversion failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6E18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: #time-convert wrong conversion result. Original time doesn't match", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: #time-convert wrong conversion result. Timebase-to not Rose", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6E70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: #time-convert wrong conversion result. Timebase-from not BT", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6E9C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#rose-ses,Got %s in AlishaSubsystem::_debugSetKey.", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E6F2C()
{
  __assert_rtn("getUwbSessionId", "NIServerRoseSession.mm", 858, "fServiceRequest.range_enable_params.alisha.uwb_ses_id.has_value()");
}

void sub_1003E6F54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,Called Alisha range enable but does not have a service ticket.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E6F80()
{
  __assert_rtn("rangeEnable", "NIServerRoseSession.mm", 938, "rangeEnableResult.payload.has_value()");
}

void sub_1003E6FA8()
{
  __assert_rtn("_alishaSendRangeEnableCommand", "NIServerRoseSession.mm", 1009, "fServiceTicketId.has_value()");
}

void sub_1003E6FD0(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void sub_1003E6FF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,Called Alisha range disable, but already invalidated.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,Called Alisha range disable, but invalidate failed. Service request likely speculatively cleaned up.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E704C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#rose-ses,Timed out waiting for alisha session stats with reason ResponseToCommand", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7078()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#rose-ses,triggerAlishaSessionStats failed with status code %s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
  sub_100029D60();
}

void sub_1003E70D4()
{
  __assert_rtn("getUwbSessionId", "NIServerRoseSession.mm", 1157, "fServiceRequest.range_enable_params.fira.uwb_ses_id.has_value()");
}

void sub_1003E70FC()
{
  __assert_rtn("toString", "NIServerRoseSession.mm", 1173, "false");
}

void sub_1003E7124()
{
  __assert_rtn("toString", "NIServerRoseSession.mm", 1184, "false");
}

void sub_1003E714C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void sub_1003E7164(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_1003E7184()
{
  __assert_rtn("useCaseSpecificAdvOOBRefreshPeriodSeconds", "NIServerFindingCommon.mm", 210, "false");
}

void sub_1003E71AC()
{
  __assert_rtn("useCaseSpecificFindableDeviceKeepAliveTimeoutSeconds", "NIServerFindingCommon.mm", 250, "false");
}

void sub_1003E71D4()
{
  __assert_rtn("useCaseSpecificUWBDiscoveryTimeoutSeconds", "NIServerFindingCommon.mm", 275, "false");
}

void sub_1003E71FC()
{
  __assert_rtn("useCaseSpecificUWBReacquisitionTimeoutSeconds", "NIServerFindingCommon.mm", 300, "false");
}

void sub_1003E7224()
{
  __assert_rtn("-[NIServerSpatialBrowsingSession configure]", "NIServerSpatialBrowsingSession.mm", 65, "_configuration");
}

void sub_1003E724C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-sptbrows,Could not get recently observed objects cache session.", v1, 2u);
}

void sub_1003E728C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "DiscoveryToken getter returning nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E72B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "DelegateProxy: session failed with error: %{private}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E7318()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "DelegateProxy: session invalidated with error: %{private}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E7378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Suspension end does not match any stored suspensions.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E73A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "ARSession: failed with error: %{private}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E7404()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "ARSession: running with invalid config: %{private}@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E7464()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "External ARSession provided but camera assistance requested in server", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7490()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "No cached suspensions found.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E74BC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{private}@", buf, 0xCu);

}

void sub_1003E7510()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10001B110();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Delegate: notify invalidation: %@. Sanitized: %@", v2, 0x16u);
  sub_10000BFC4();
}

void sub_1003E758C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#regulatory,regulatory,geo,mcc,onCellMonitorUpdate,invalidSimSlot", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E75BC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#regulatory,regulatory,geo,mcc,copyCellInfo,error:%@", (uint8_t *)&v2, 0xCu);
}

void sub_1003E7630()
{
  __assert_rtn("setAirplaneMode", "PRMccMonitor.mm", 132, "airplaneMode != Rose::AirplaneMode::UNKNOWN");
}

void sub_1003E7658(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#regulatory,regulatory,geo,mcc,setAirplaneMode called with invalid input argument value.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E7688(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#regulatory,regulatory,geo,mcc,processMcc,ignoreInAirplaneMode", v1, 2u);
  sub_10000991C();
}

void sub_1003E76C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "BT Advertising Address was nullopt. CBManager state is %s", a5, a6, a7, a8, 2u);
}

void sub_1003E773C(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 6;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "advertisingAddress.length (%lu) != rose::kBtAdvAddressByteLength (%d)", buf, 0x12u);
}

void sub_1003E7790(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "PRBluetoothProvider: cannot get BT advertising address because CBManager is not powered on.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E77C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "Failed to enable SPMI messages via WiProx with error: %@", a5, a6, a7, a8, 2u);
}

void sub_1003E7828(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "RoseBluetoothMessage GetAdvAddress - not yet implemented", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E7858(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "Got RoseBluetoothMessage::Type::Unspecified.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E7888(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "Remote object error: %@", a5, a6, a7, a8, 2u);
}

void sub_1003E78F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "Synchronous remote object error: %@", a5, a6, a7, a8, 2u);
}

void sub_1003E7958()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to register as power budget client.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7984()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Was not able to log device meta information after protobuf log creation.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E79B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to open protobuf logger upon creation.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E79DC()
{
  __assert_rtn("setSystemErrorHandler", "PRRangingManager.mm", 172, "handler");
}

void sub_1003E7A04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to write protobuf device meta information after first unlock.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7A30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Failed to open protobuf log on first unlock.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7A5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "protoLogDeviceMetaInformation protobuf no pbLogger", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7A88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Caller to probe has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7AB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Caller to registerForService has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7AE0(uint64_t *a1, uint8_t *buf, os_log_t log)
{
  uint64_t *v4;

  if (*((char *)a1 + 23) >= 0)
    v4 = a1;
  else
    v4 = (uint64_t *)*a1;
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to place service request: %s", buf, 0xCu);
  if (*((char *)a1 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E7B48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10016A9EC();
  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "fRequestToClientMap.find(ticketId (%d)) != fRequestToClientMap.end()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7BA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Caller to unregisterForService has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7BD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Client asked to cancel service, but has no registered requests.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7C00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Client asked to cancel service with invalid ticket id.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7C2C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002D0934();
  sub_1002D0908(1.5047e-36, v1, v2, v3);
  sub_1002D094C((void *)&_mh_execute_header, "Failed to unregister for service. Ticket ID: %d. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E7C70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Caller to startUserTriggeredRanging has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7C9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Client asked to trigger service, but has no registered requests.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7CC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Client asked to trigger service with invalid ticket id %d.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7D2C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002D0934();
  sub_1002D0908(1.5047e-36, v1, v2, v3);
  sub_1002D094C((void *)&_mh_execute_header, "Failed to trigger ranging. Ticket ID: %d. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E7D70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#throttle Caller to startUserTriggeredRanging has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#throttle Client asked to trigger service, but has no registered requests.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7DC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10016A9EC();
  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "#throttle Client asked to trigger service with invalid ticket id %d.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7E28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Caller to stopRanging has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7E54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Client asked to stop service with invalid ticket id.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7E80()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1002D0934();
  sub_1002D0908(1.5047e-36, v1, v2, v3);
  sub_1002D094C((void *)&_mh_execute_header, "Failed to stop ranging. Ticket ID: %d. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0)
    sub_10019EA68();
  sub_100029D60();
}

void sub_1003E7EC4()
{
  __assert_rtn("pushBeaconAllowlist", "PRRangingManager.mm", 545, "handler");
}

void sub_1003E7EEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRangingManager: Failed to push beacon allowlist.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7F18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "PRRangingManager: Failed to clear beacon allowlist.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7F44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Received solution, but nullptr client. Ticket_id %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E7FA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Received session start notification, but nullptr client. Ticket_id %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E800C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10016A9EC();
  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Received remote data for ticket_id %d but nullptr client", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E806C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10016A9EC();
  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Received subrate event for ticket_id %d but nullptr client", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E80CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10016A9EC();
  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Received alisha update for ticket_id %u but nullptr client", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E812C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10016A9EC();
  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Received fira update for ticket_id %u but nullptr client", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E818C()
{
  __assert_rtn("handleServiceResponse", "PRRangingManager.mm", 1003, "service_response.status_update.has_value()");
}

void sub_1003E81B4()
{
  __assert_rtn("handleServiceResponse", "PRRangingManager.mm", 1010, "service_response.error.has_value()");
}

void sub_1003E81DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Received service request status update, but nullptr client. Ticket_id %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10016A9EC();
  sub_100154B28();
  sub_100010B04((void *)&_mh_execute_header, v0, v1, "Speculative Cleanup: nullptr client for ticket: %d", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E82A0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Speculative Cleanup: no requests for client %p.", (uint8_t *)&v3, 0xCu);
}

void sub_1003E8318()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Caller to connect() has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8344()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Caller to disconnect() has expired", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8370()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "disconnect called", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E839C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "cleanupAfterClientDisconnection but client is nullptr", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E83C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "cleanupAfterClientDisconnection called", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E83F4()
{
  std::__shared_weak_count *v0;
  unint64_t *v1;
  uint64_t v2;
  int v3;

  sub_1002D095C();
  do
    sub_1001B3514(v1);
  while (v3);
  if (v2)
  {
    sub_100029D60();
  }
  else
  {
    sub_1001B3524();
    sub_1002D092C(v0);
  }
}

void sub_1003E8428()
{
  __assert_rtn("-[_NIServerTestWiFiOnlySession configure]", "_NIServerTestWiFiOnlySession.mm", 98, "_configuration");
}

void sub_1003E8450()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-wifi-test,[Session] failed to add peers. %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E84B0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#ses-wifi-test,NINearbyObject objectFromBluetoothDevice returned nil.", v1, 2u);
  sub_10000991C();
}

void sub_1003E84EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-wifi-test,device is nil for triggering wifi ranging", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E851C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-wifi-test,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E858C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#ses-wifi-test,Configuration did not contain expected role: %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E85F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#ses-wifi-test,Invalid ranging role: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E8654(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#ses-wifi-test,device is nil for stopping wifi ranging", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E8684(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a1, a3, "#ses-wifi-test,%@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E86F4(char *a1, _QWORD *a2, os_log_t log)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;

  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136380675;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-wifi-test,WiFi ranging error:%{private}s", (uint8_t *)&v4, 0xCu);
  sub_10000BFC4();
}

void sub_1003E8778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-wifi-test,failed to pause session inside _peerInactivityPeriodExceeded: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E87D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#ses-wifi-test,_peerInactivityPeriodExceeded but peer token is not cached %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E8838(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;

  v3 = CFSTR("YES");
  if ((a1 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Accessory notify is attached: %@ accessory: %@ but modelNumber is nil", (uint8_t *)&v4, 0x16u);
}

void sub_1003E88D4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "regulatory,acc,Accessory detached, but was not connected. UUID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1003E8948()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#reg-prov,using default regulatory group: US", v1, 2u);
  sub_10000991C();
}

void sub_1003E8980(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#reg-prov,user provided regulatory group: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1003E89F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#reg-prov,received invalid message", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8A20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#reg-prov,PRRegulatoryNBUWBState is disallowed, but does not have a reason.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8A4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#reg-prov,PRRegulatoryUWBState is disallowed with reason UwbSwitch.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8A78(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t *v3;
  int v4;
  uint64_t *v5;
  __int16 v6;
  int v7;

  if (*((char *)a1 + 23) >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  v4 = 136315394;
  v5 = v3;
  v6 = 1024;
  v7 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#reg-prov,injectIsoCode,isoCountryCode:%s,success:%d", (uint8_t *)&v4, 0x12u);
}

void sub_1003E8B10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#reg-prov,injectNarrowbandSARState,exited early,device does not support SAR", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8B3C()
{
  __assert_rtn("-[_FindingAdvertiser stopAdvertisingAsFinder:toPeer:]", "NIServerFindingDiscovery.mm", 181, "token");
}

void sub_1003E8B64()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 345, "(*outPeers).count == 0 || _spatialInteractionCurrentPeerIndex < (*outPeers).count");
}

void sub_1003E8B8C()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 344, "(*outPeers).count == (*outAdvertisements).count");
}

void sub_1003E8BB4()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 352, "(*outPeers).count == 0 || _nearbyActionNoWakeCurrentPeerIndex < (*outPeers).count");
}

void sub_1003E8BDC()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 351, "(*outPeers).count == (*outAdvertisements).count");
}

void sub_1003E8C04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-disc,NearbyActionNoWake: could not generate auth tag for advertiser", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8C30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10017D318();
  sub_1002E5674((void *)&_mh_execute_header, v0, v1, "#find-disc,NearbyActionNoWake: advertiser activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E8C90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-disc,Invalid key for auth tag", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8CBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: could not extract token contents", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8CE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10017D318();
  sub_1002E5674((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: advertiser activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E8D48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10017D318();
  sub_1002E5674((void *)&_mh_execute_header, v0, v1, "#find-disc,Controller activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E8DA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10017D318();
  sub_1002E5674((void *)&_mh_execute_header, v0, v1, "#find-disc,Address observer activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E8E08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#find-disc,Start advertising error: %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E8E6C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#find-disc,Stop advertising error: %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E8ED0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,Race condition (scan peer was removed before device found)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8EFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,Device found, but scanner nil / not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8F28(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315395;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2113;
  *(_QWORD *)(a3 + 14) = a2;
  sub_10022E224((void *)&_mh_execute_header, "#find-disc,[%s] Found device (BT) but does not contain advertisement. Device: %{private}@", (uint8_t *)a3, a4);
}

void sub_1003E8F70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,Address changed, but observer nil / not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8F9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,State changed, but controller nil / not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E8FC8(unint64_t a1, NSObject *a2)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = sub_1002E0420(a1);
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#find-disc,Unexpected BT state: %s", (uint8_t *)&v3, 0xCu);
}

void sub_1003E9050()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,BT interrupted, but controller nil / not activated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E907C(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315394;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  sub_10022E224((void *)&_mh_execute_header, "#find-disc,[%s] BT error: %@", (uint8_t *)a3, a4);
}

void sub_1003E90C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10017D318();
  sub_1002E5674((void *)&_mh_execute_header, v0, v1, "#find-disc,NearbyActionNoWake: scanner activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E9124()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10017D318();
  sub_1002E5674((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: scanner activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E9184()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10017D318();
  sub_1002E5674((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: error adding token [%0.6f s]: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E91E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice doesn't contain address", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice doesn't contain token data", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E923C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice doesn't contain auth tag", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9268()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice spatialInteractionUWBConfigData doesn't contain expected number of bytes", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9294()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice spatialInteractionUWBConfigData PrecisionFindingEnabled flag not set", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E92C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#find-disc,Couldn't generate advertisement from byte representation: too big", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E92EC(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#find-disc,Couldn't generate advertisement from byte representation: decode error: %d", (uint8_t *)v3, 8u);
  sub_10000991C();
}

void sub_1003E9360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Could not configure bias estimator, bypassing bias estimation.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E938C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#spatialGesturesPredictor unexpected gesture type provided. defaulting to no predictor", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E93B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#spatialGesturesPredictor Error in obtaining trained model weights filepath, defaulting to no intent predictor", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E93E4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "#nrby-eng,#region-class elements in regionDict: %lu", (uint8_t *)a1);
}

void sub_1003E9420(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010B04((void *)&_mh_execute_header, a2, a3, "#nrby-eng,#intentPredictorDefaultsWrite Invalid defaults write value of %d for type of user intent predictor, defaulting to Spatial Gestures predictor.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003E9484()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#nrby-eng,Unexpected call to provideFindingSolution", v1, 2u);
  sub_10000991C();
}

void sub_1003E94BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptRoseSolution - rejected due to missing timestamp.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E94E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Solution does not have raw rose measurement.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#pb-bias Logging bias est input", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptRoseSolution - OTHER", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E956C()
{
  __assert_rtn("-[NINearbyUpdatesEngine acceptUnsuccessfulRoseSolution:]", "NIServerNearbyUpdatesEngine.mm", 1495, "solution.raw_rose_measurement.value().cycleSkipping().has_value()");
}

void sub_1003E9594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Can not create a token, skipping fetching peer data from container", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E95C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Fetching peer data from container using cached finding peer token", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E95EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Fetching peer data from container using token derived from missed range mac addr", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9618()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptMissedRangeResult", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9644()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,unsuccessful ranging solution received", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9670(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#nrby-eng,#devicepresence, acceptBluetoothSample failed to convert identifier (%llx) to object.", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003E96D8()
{
  __assert_rtn("-[NINearbyUpdatesEngine _consolidateInputToMLModel:]", "NIServerNearbyUpdatesEngine.mm", 1669, "solution.toa_cir_v2_event.has_value()");
}

void sub_1003E9700()
{
  __assert_rtn("-[NINearbyUpdatesEngine _consolidateInputToMLModel:]", "NIServerNearbyUpdatesEngine.mm", 1671, "solution_raw_rose_measurement_value.remoteTxAntennaMask().has_value()");
}

void sub_1003E9728()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#bias-est Did not receive RTT-TAT info, cannot estimate bias.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9754()
{
  __assert_rtn("-[NINearbyUpdatesEngine _handleRangeAndAoASolution:]", "NIServerNearbyUpdatesEngine.mm", 1751, "solution.sensor_fusion_solution.has_value()");
}

void sub_1003E977C()
{
  __assert_rtn("-[NINearbyUpdatesEngine _handleRangeOnlySolution:]", "NIServerNearbyUpdatesEngine.mm", 1798, "solution.raw_rose_measurement.has_value()");
}

void sub_1003E97A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_handleRangeOnlySolution failed to convert identifier to object.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E97D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Solution input to _shouldConsumeRoseSolution has no raw rose measurement.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E97FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Session type does not support mmsValStatus info.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#regions, no object for identifier 0x%llx", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E9888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10001C964((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#regions no region for key: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E98E8()
{
  __assert_rtn("-[NINearbyUpdatesEngine _handleDeviceMonitorActivation:forDevice:timestamp:regionSizeCategory:regions:predictorType:]", "NIServerNearbyUpdatesEngine.mm", 1976, "regionsVector.has_value()");
}

void sub_1003E9910(char a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;

  v3 = "activated";
  if ((a1 & 1) == 0)
    v3 = "deactivated";
  v4 = 134218242;
  v5 = a2;
  v6 = 2080;
  v7 = v3;
  sub_1002F25F4((void *)&_mh_execute_header, a3, (uint64_t)a3, "#nrby-eng,#region-class device monitor for device 0x%llx was %s", (uint8_t *)&v4);
  sub_10000BFC4();
}

void sub_1003E99A0(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;

  v3 = *a1;
  *(_DWORD *)a2 = 134217984;
  *(_QWORD *)(a2 + 4) = v3;
  sub_100029D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "#nrby-eng,no object for identifier 0x%llx", (uint8_t *)a2);
}

void sub_1003E99E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#nrby-eng,#sa_algo,Skipping measurement due to a lack of mach continuous timestamp. Unique identifier: %s", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003E9A54(uint64_t *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = *a1;
  v5 = (_QWORD *)(a2 + 104);
  if (*(char *)(a2 + 127) < 0)
    v5 = (_QWORD *)*v5;
  *(_DWORD *)a3 = 134218242;
  *(_QWORD *)(a3 + 4) = v4;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = v5;
  sub_1002F25F4((void *)&_mh_execute_header, a4, a3, "#nrby-eng,#sa_algo,New measurement for SA with timestamp %f - unaccepted type for SA. Unique identifier: %s", (uint8_t *)a3);
}

void sub_1003E9AB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,CLGnssExtensions,acceptGnssSatelliteData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9AE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptPedometerData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9B0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptPedometerEvent", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9B38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptMotionActivity", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9B64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptPDRInput", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9B90(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#nrby-eng,Mismatching finding peer token: %@ != %@", (uint8_t *)&v4, 0x16u);
  sub_10000BFC4();
}

void sub_1003E9C14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromSolution:ForPeer - failed to create NI Object", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9C40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromToken - no data source", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003E9C6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromToken - no identifier for token: %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E9CCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromToken - no NINearbyObject for identifier: %lld", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E9D2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,nearbyObjectFromDeviceIdentifier - convert token %@ to object", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003E9D8C(char *a1, uint64_t a2, NSObject *a3)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = v4;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "#nrby-eng,%s", (uint8_t *)a2);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_1003E9DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10001B110();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Peer data token hash %{private}llu", v2);
  sub_10000BFC4();
}

void sub_1003E9E58()
{
  operator delete((void *)qword_10085DA10);
}

void sub_1003E9E74()
{
  operator delete((void *)qword_10085D9B0);
}

void sub_1003E9E90(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to format protobuf file name", v1, 2u);
}

void sub_1003E9ED0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to observe default. defaultName or callback is nil", v1, 2u);
}

void sub_1003E9F10(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No subscription for user default change: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1003E9F84()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 232, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_1003E9FAC()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 240, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_1003E9FD4()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 250, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_1003E9FFC()
{
  __assert_rtn("readAndAdvance", "AlishaDCKCoder.cpp", 182, "msg.size() <= kMaxMessageSize");
}

void sub_1003EA024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1002FE954("readAndAdvance", "AlishaDCKCoder.cpp", a3, "offset + sizeof(val) <= msg.size()");
}

void sub_1003EA048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1002FE964("readAndAdvance", "AlishaDCKCoder.cpp", a3, "offset + sizeof(val) <= msg.size()");
}

void sub_1003EA06C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1002FE95C("readAndAdvance", "AlishaDCKCoder.cpp", a3, "offset + sizeof(val) <= msg.size()");
}

void sub_1003EA090()
{
  __assert_rtn("decodeRangingSessionRQ", "AlishaDCKCoder.cpp", 741, "offset == msg.size()");
}

void sub_1003EA0B8()
{
  __assert_rtn("decodeRangingSessionSetupRQ", "AlishaDCKCoder.cpp", 805, "offset == msg.size()");
}

void sub_1003EA0E0()
{
  __assert_rtn("decodeRangingSuspendRQ", "AlishaDCKCoder.cpp", 857, "offset == msg.size()");
}

void sub_1003EA108()
{
  __assert_rtn("decodeRangingSuspendRS", "AlishaDCKCoder.cpp", 876, "offset == msg.size()");
}

void sub_1003EA130()
{
  __assert_rtn("decodeRangingRecoveryRQ", "AlishaDCKCoder.cpp", 895, "offset == msg.size()");
}

void sub_1003EA158()
{
  __assert_rtn("decodeConfigurableRangingRecoveryRQ", "AlishaDCKCoder.cpp", 937, "offset == msg.size()");
}

void sub_1003EA180(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

void sub_1003EA198(int a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint8_t v23;

  sub_1003048C8(a1, a2);
  sub_10016AA14();
  sub_1003048BC();
  sub_10016A9F8((void *)&_mh_execute_header, v2, v3, "#alisha-sm,Session RQ Get Key Failure (%s)", v4, v5, v6, v7, v16, v18, v20, v21, v23);
  if (v22 < 0)
    sub_1003048A0(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  sub_10016AA28();
}

void sub_1003EA218(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 24) = v2;
    operator delete(v2);
  }
}

void sub_1003EA23C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint8_t v25;

  sub_1003048F8(a1, "SecureRangingSetupFlow", a3);
  sub_1003048E4();
  sub_1003048BC();
  sub_1003048A8((void *)&_mh_execute_header, v4, v5, "#alisha-sm,%s is not a recovery flow", v6, v7, v8, v9, v18, v20, v22, v23, v25);
  if (v24 < 0)
    sub_1003048A0(v10, v11, v12, v13, v14, v15, v16, v17, v19, v21);
  *a2 = qword_10085F520;
  sub_1003048D4();
}

void sub_1003EA2DC(int a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint8_t v23;

  sub_1003048C8(a1, a2);
  sub_10016AA14();
  sub_1003048BC();
  sub_10016A9F8((void *)&_mh_execute_header, v2, v3, "#alisha-sm,Recovery RQ Get Key Failure (%s)", v4, v5, v6, v7, v16, v18, v20, v21, v23);
  if (v22 < 0)
    sub_1003048A0(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  sub_10016AA28();
}

void sub_1003EA35C()
{
  __assert_rtn("processDCKConfigurableRecoveryRQ", "AlishaStateMachine.cpp", 363, "recoveryResponse.payload.value().parameterResponse.selectedRanMultiplier.has_value()");
}

void sub_1003EA384(int a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint8_t v23;

  sub_1003048C8(a1, a2);
  sub_10016AA14();
  sub_1003048BC();
  sub_10016A9F8((void *)&_mh_execute_header, v2, v3, "#alisha-sm,processDCKSuspendRS error: disable ranging failed (%s)", v4, v5, v6, v7, v16, v18, v20, v21, v23);
  if (v22 < 0)
    sub_1003048A0(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  sub_10016AA28();
}

void sub_1003EA404(char a1, NSObject *a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint8_t buf[24];

  sub_100302388(a1, &v12);
  sub_10016AA14();
  sub_1003048BC();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#alisha-sm,processDCKSuspendRS error: not expecting suspend response in state %s", buf, 0xCu);
  if (v13 < 0)
    sub_1003048A0(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  sub_10016AA28();
}

void sub_1003EA4A0(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint8_t v25;

  sub_1003048F8(a1, "SessionRequested", a3);
  sub_1003048E4();
  sub_1003048BC();
  sub_1003048A8((void *)&_mh_execute_header, v4, v5, "#alisha-sm,Unexpected alisha timeout event %s is sent to alisha state machine", v6, v7, v8, v9, v18, v20, v22, v23, v25);
  if (v24 < 0)
    sub_1003048A0(v10, v11, v12, v13, v14, v15, v16, v17, v19, v21);
  *a2 = qword_10085F520;
  sub_1003048D4();
}

void sub_1003EA540(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA5B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA620(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA690(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA700(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA770()
{
  __assert_rtn("stopRanging", "AcwgManager.cpp", 138, "_stateMachine");
}

void sub_1003EA798(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA808(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA878(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA8E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA958(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EA9C8()
{
  __assert_rtn("deleteKeysForThisLock", "AcwgManager.cpp", 252, "_uwbSystem");
}

void sub_1003EA9F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EAA60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#acwg-mgr,In method: '%s'", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EAAD0()
{
  __assert_rtn("operator()", "AcwgManager.cpp", 85, "_constructSessionCallback");
}

void sub_1003EAAF8()
{
  __assert_rtn("stopRanging", "AlishaManager.cpp", 130, "_stateMachine");
}

void sub_1003EAB20()
{
  __assert_rtn("deleteKeysForThisVehicle", "AlishaManager.cpp", 397, "_system");
}

void sub_1003EAB48()
{
  __assert_rtn("operator()", "AlishaManager.cpp", 81, "_constructSessionCallback");
}

void sub_1003EAB70()
{
  __assert_rtn("processErrorCodeFromDCKMessageProcessing", "AlishaDCKEventNotificationGenerator.cpp", 23, "errorCode != StatusCode::SUCCESS");
}

void sub_1003EAB98()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10019EAC4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#sa_algo,Received pose earlier than the last pose in history with timestamp: %f - pose rejected", v1, 0xCu);
  sub_10000BFC4();
}

void sub_1003EAC08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo,Rejected measurement without AoA for the AoA cache", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EAC34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range output with range filter, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EAC98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range output from AoA meas without VIO, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EACFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Not populating direction or range output from AoA meas without VIO, measurement time %f s is too stale compared to current time %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EAD60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range output from AoA meas with VIO, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EADC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Not populating direction from AoA meas with VIO, timestamp: %f s, calculated range %5.4f is too small to calculate direction", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EAE28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating horizontal angle output with SA, angle: %3.2f deg, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

double sub_1003EAE8C(uint64_t a1, float *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4;
  double v5;
  double result;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *a2;
  *(_DWORD *)buf = 134218240;
  *(double *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo,Populating range output with SA, range: %0.2f m, timestamp: %f s", buf, 0x16u);
  return result;
}

void sub_1003EAEEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateUnknown, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EAF50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateSame, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EAFB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateAbove, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EB018()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateBelow, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EB07C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateAboveOrBelow, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EB0E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: empty", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EB10C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: no world position", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EB138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: NotPossibleToInterpolate", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EB164()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: Interpolatable", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EB190()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: Interpolated", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EB1BC(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v3 = a1[49];
  v2 = a1[50];
  v5 = a1[47];
  v4 = a1[48];
  v6 = 134218752;
  v7 = v5;
  v8 = 2048;
  v9 = v4;
  v10 = 2048;
  v11 = v3;
  v12 = 2048;
  v13 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#sa_algo,AoA cache: time %f s, distance: %0.2f m, az: %3.2f rad, el: %3.2f rad", (uint8_t *)&v6, 0x2Au);
}

void sub_1003EB254()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating stale range filter solution, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EB2B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range filter solution, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EB31C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10028DB58((void *)&_mh_execute_header, v0, v1, "#sa_algo,Not populating range filter solution, filter time %f s is too stale compared to current time %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EB380(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 24) = v2;
    operator delete(v2);
  }
}

void sub_1003EB398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10030F1E4("TransposeDataFootprint", "cnmatrix.h", a3, "scratch != nullptr");
}

void sub_1003EB3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10030F1DC("TransposeDataFootprint", "cnmatrix.h", a3, "lead_dim > 0");
}

void sub_1003EB3E0()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2337, "in_nr >= 0");
}

void sub_1003EB408()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2339, "in_nr <= max_nr");
}

void sub_1003EB430()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2340, "in_nc >= 0");
}

void sub_1003EB458()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2342, "in_nc <= max_nc");
}

void sub_1003EB480()
{
  __assert_rtn("WriteValue", "cnmatrixbase.h", 1104, "data_ != __null");
}

void sub_1003EB4A8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 913, "data_ != __null");
}

void sub_1003EB4D0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 914, "idx >= 0");
}

void sub_1003EB4F8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 915, "idx < num_elements_");
}

void sub_1003EB520()
{
  __assert_rtn("Transpose", "cnmatrixbase.h", 5010, "&(A) != &(B)");
}

void sub_1003EB548()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 782, "data_ != __null");
}

void sub_1003EB570()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 783, "idx >= 0");
}

void sub_1003EB598()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 784, "idx < num_elements_");
}

void sub_1003EB5C0()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3677, "&(A) != &(C)");
}

void sub_1003EB5E8()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3678, "&(B) != &(C)");
}

void sub_1003EB610()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3675, "A.num_cols_ == B.num_cols_");
}

void sub_1003EB638()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3674, "A.num_rows_ == B.num_rows_");
}

void sub_1003EB660()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3887, "&(A) != &(C)");
}

void sub_1003EB688()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3888, "&(B) != &(C)");
}

void sub_1003EB6B0()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3885, "A.num_cols_ == B.num_rows_");
}

void sub_1003EB6D8()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4504, "&A != &Acopy");
}

void sub_1003EB700()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4505, "&A != &Work");
}

void sub_1003EB728()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4506, "&A != &S");
}

void sub_1003EB750()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4507, "&Acopy != &Work");
}

void sub_1003EB778()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4508, "&Acopy != &S");
}

void sub_1003EB7A0()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4509, "&Work != &S");
}

void sub_1003EB7C8()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4512, "Acopy.num_elements_ >= A.num_elements_");
}

void sub_1003EB7F0()
{
  sub_10030F1EC();
  __assert_rtn("Norm", "cnmatrixbase.h", 4640, "false");
}

void sub_1003EB83C()
{
  sub_10030F1EC();
  __assert_rtn("Norm", "cnmatrixbase.h", 4716, "ret == 1");
}

void sub_1003EB888()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7028, "&A != &Acopy");
}

void sub_1003EB8B0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7029, "&A != &Work");
}

void sub_1003EB8D8()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7030, "&A != &S");
}

void sub_1003EB900()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7031, "&Acopy != &Work");
}

void sub_1003EB928()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7032, "&Acopy != &S");
}

void sub_1003EB950()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7033, "&Work != &S");
}

void sub_1003EB978()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7036, "ne >= 1");
}

void sub_1003EB9A0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7037, "ne >= 3*minnrnc + maxnrnc");
}

void sub_1003EB9C8()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7038, "ne >= 5*minnrnc");
}

void sub_1003EB9F0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7040, "Acopy.max_num_rows_ >= nrA");
}

void sub_1003EBA18()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7041, "Acopy.max_num_cols_ >= ncA");
}

void sub_1003EBA40()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7042, "S.max_num_rows_ >= minnrnc");
}

void sub_1003EBA68()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7043, "S.max_num_cols_ >= 1");
}

void sub_1003EBA90()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7111, "info == 0");
}

void sub_1003EBAB8()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 619, "this->max_num_rows_ >= A.num_rows_");
}

void sub_1003EBAE0()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 620, "this->max_num_cols_ >= A.num_cols_");
}

void sub_1003EBB08()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3536, "&(A) != &(C)");
}

void sub_1003EBB30()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3537, "&(B) != &(C)");
}

void sub_1003EBB58()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3534, "A.num_cols_ == B.num_cols_");
}

void sub_1003EBB80()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3533, "A.num_rows_ == B.num_rows_");
}

void sub_1003EBBA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100154B18((void *)&_mh_execute_header, a1, a3, "#threshold-detector, Instantiated KALMAN_FILTER for bounded region range estimation", a5, a6, a7, a8, 0);
}

void sub_1003EBBDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100154B18((void *)&_mh_execute_header, a1, a3, "#threshold-detector, Instantiated MAX_OF_MEAN_OF_CHAN_FILTER for bounded region range estimation", a5, a6, a7, a8, 0);
}

void sub_1003EBC10(os_log_t log, __n128 a2)
{
  int v2;
  double v3;
  __int16 v4;
  double v5;
  __int16 v6;
  double v7;
  __int16 v8;
  double v9;

  v2 = 134218752;
  v3 = a2.n128_f32[3];
  v4 = 2048;
  v5 = a2.n128_f32[0];
  v6 = 2048;
  v7 = a2.n128_f32[1];
  v8 = 2048;
  v9 = a2.n128_f32[2];
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo_finder_io,io propagated pose, quatw: %f, quatx: %f, quaty: %f, quatz: %f", (uint8_t *)&v2, 0x2Au);
}

void sub_1003EBCC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::WALKING_OR_UNKNOWN due to unknown motion state", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EBCEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::SLOWLY_MOVING", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EBD18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::WALKING_OR_UNKNOWN due to walking", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EBD44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::STATIC", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EBD70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Velocity change applicability time %3.1f is larger than max - not providing velocity change", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EBDD4()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint8_t v5[14];
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  sub_100313350();
  v6 = v0;
  v7 = v1;
  v8 = v2;
  v9 = v1;
  v10 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#findalgs-findee, Providing measured delta v, H1: %f, H2: %f , applicable time: %f, transmission time: %f", v5, 0x2Au);
}

void sub_1003EBE64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, PDR displacement applicability time %3.1f is larger than max - not providing PDR displacement", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EBEC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, VIO applicability time %3.1f is larger than max - not providing VIO", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EBF2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, providePeerData()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EBF58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated easterly offset %.1f is larger than max that can be sent over", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EBFBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated easterly offset %.1f is smaller than min that can be sent over", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EC020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated northerly offset %.1f is larger than max that can be sent over", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EC084()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated northerly offset %.1f is smaller than min that can be sent over", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EC0E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, FindeeAlgorithms::buildLocationData() Location recency = %f", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EC14C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, FindeeAlgorithms::buildLocationData() Conversion of peer location time to mach continuous time failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC178()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#findalgs-findee, cycleSkipping not populated in common::RangeResult", v1, 2u);
  sub_10000991C();
}

void sub_1003EC1B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAAC();
  sub_100313340((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Got range result at timestamp %f, cycleIndex %u", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EC228()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAAC();
  sub_100313340((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Got missed range result at timestamp %f, cycleIndex %u", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EC290()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Received pose earlier than the last pose in peer history with timestamp: %f - pose rejected", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EC2F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const common::Pose &pose)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC320()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const common::DeviceMotion &deviceMotion)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC34C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-findee, Walking set to true, steps since last deleted step count: %d", (uint8_t *)v2, 8u);
  sub_10000991C();
}

void sub_1003EC3BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const AltimeterInput &altData)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC3E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Received peer data on findee, unexpected.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC414()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const LocationInput &loc)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC440()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, #gri,findee,process(const std::vector<nearby::algorithms::finding::GnssSatelliteData> &gnssSatelliteData)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC46C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const MotionActivityInput &activity)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, missing a delta velocity input", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC4C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, no pdr input, processing delta velocity input", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC4F0()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;

  sub_100313350();
  v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#findalgs-findee, pdr mach time: %f, pdr cont time: %f", v2, 0x16u);
  sub_10000BFC4();
}

void sub_1003EC564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const PDRInput &pdr)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC590()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const WatchOrientationInput &watchOrientation)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC5BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const PedometerDataInput &pedData)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC5E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const PedometerEventInput &pedEvent)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EC61C(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#sa_algo_batchfilter_with,Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncertainty passed: %f m", (uint8_t *)&v4, 0x16u);
}

void sub_1003EC6A0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 749, "data_ != __null");
}

void sub_1003EC6C8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 750, "idx >= 0");
}

void sub_1003EC6F0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 751, "idx < num_elements_");
}

_QWORD *sub_1003EC718(_QWORD *result, _QWORD *a2)
{
  do
  {
    result[61] = off_100807398;
    result[47] = off_100807398;
    result[26] = off_100807398;
    result[18] = off_100807398;
    result[10] = off_100807398;
    result[1] = off_100807398;
    result += 77;
  }
  while (result != a2);
  return result;
}

_QWORD *sub_1003EC748(_QWORD *result, _QWORD *a2)
{
  do
  {
    result[62] = off_100807398;
    result[54] = off_100807398;
    result[38] = off_100807398;
    result[17] = off_100807398;
    result[9] = off_100807398;
    *result = off_100807398;
    result += 70;
  }
  while (result != a2);
  return result;
}

void sub_1003EC778()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6077, "&A != &Work");
}

void sub_1003EC7A0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6078, "&A != &B");
}

void sub_1003EC7C8()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6081, "&Work != &B");
}

void sub_1003EC7F0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6086, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

void sub_1003EC818()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6088, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

void sub_1003EC840()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6090, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003EC868()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6091, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003EC890()
{
  sub_10030F1EC();
  __assert_rtn("Inv", "cnmatrixbase.h", 6127, "info >= 0");
}

void sub_1003EC8E0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6159, "info >= 0");
}

void sub_1003EC908()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6084, "A.num_rows_ == A.num_cols_");
}

void sub_1003EC930()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3818, "&(B) != &(C)");
}

void sub_1003EC958()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5690, "&A != &Acopy");
}

void sub_1003EC980()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5691, "&A != &Dr");
}

void sub_1003EC9A8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5692, "&A != &Di");
}

void sub_1003EC9D0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5693, "&A != &Vr");
}

void sub_1003EC9F8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5694, "&A != &Vi");
}

void sub_1003ECA20()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5695, "&A != &Swork");
}

void sub_1003ECA48()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5696, "&A != &Rwork");
}

void sub_1003ECA70()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5697, "&A != &Work");
}

void sub_1003ECA98()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5698, "&Acopy != &Dr");
}

void sub_1003ECAC0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5699, "&Acopy != &Di");
}

void sub_1003ECAE8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5700, "&Acopy != &Vr");
}

void sub_1003ECB10()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5701, "&Acopy != &Vi");
}

void sub_1003ECB38()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5702, "&Acopy != &Swork");
}

void sub_1003ECB60()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5703, "&Acopy != &Rwork");
}

void sub_1003ECB88()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5704, "&Acopy != &Work");
}

void sub_1003ECBB0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5705, "&Dr != &Di");
}

void sub_1003ECBD8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5706, "&Dr != &Vr");
}

void sub_1003ECC00()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5707, "&Dr != &Vi");
}

void sub_1003ECC28()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5708, "&Dr != &Swork");
}

void sub_1003ECC50()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5709, "&Dr != &Rwork");
}

void sub_1003ECC78()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5710, "&Dr != &Work");
}

void sub_1003ECCA0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5711, "&Di != &Vr");
}

void sub_1003ECCC8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5712, "&Di != &Vi");
}

void sub_1003ECCF0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5713, "&Di != &Swork");
}

void sub_1003ECD18()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5714, "&Di != &Rwork");
}

void sub_1003ECD40()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5715, "&Di != &Work");
}

void sub_1003ECD68()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5716, "&Vr != &Vi");
}

void sub_1003ECD90()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5717, "&Vr != &Swork");
}

void sub_1003ECDB8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5718, "&Vr != &Rwork");
}

void sub_1003ECDE0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5719, "&Vr != &Work");
}

void sub_1003ECE08()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5720, "&Vi != &Swork");
}

void sub_1003ECE30()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5721, "&Vi != &Rwork");
}

void sub_1003ECE58()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5722, "&Vi != &Work");
}

void sub_1003ECE80()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5723, "&Swork != &Rwork");
}

void sub_1003ECEA8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5724, "&Swork != &Work");
}

void sub_1003ECED0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5725, "&Rwork != &Work");
}

void sub_1003ECEF8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5730, "Swork.max_num_rows_ * Swork.max_num_cols_ >= nrA");
}

void sub_1003ECF20()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5731, "Rwork.max_num_rows_ * Rwork.max_num_cols_ >= nrA");
}

void sub_1003ECF48()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5732, "ne >= 3*nrA");
}

void sub_1003ECF70()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5734, "Acopy.max_num_rows_ >= nrA");
}

void sub_1003ECF98()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5735, "Acopy.max_num_cols_ >= ncA");
}

void sub_1003ECFC0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5736, "Dr.max_num_rows_ >= nrA");
}

void sub_1003ECFE8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5737, "Dr.max_num_cols_ >= ncA");
}

void sub_1003ED010()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5738, "Di.max_num_rows_ >= nrA");
}

void sub_1003ED038()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5739, "Di.max_num_cols_ >= ncA");
}

void sub_1003ED060()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5740, "Vr.max_num_rows_ >= nrA");
}

void sub_1003ED088()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5741, "Vr.max_num_cols_ >= ncA");
}

void sub_1003ED0B0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5742, "Vi.max_num_rows_ >= nrA");
}

void sub_1003ED0D8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5743, "Vi.max_num_cols_ >= ncA");
}

void sub_1003ED100()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5744, "Swork.max_num_rows_ >= nrA");
}

void sub_1003ED128()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5745, "Rwork.max_num_rows_ >= nrA");
}

void sub_1003ED150()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5834, "info == 0");
}

void sub_1003ED178()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5728, "nrA == ncA");
}

void sub_1003ED1A0()
{
  __assert_rtn("configure", "NRBYSpatialGesturePredictor.cpp", 29, "_lpfConfiguration[0] > 0");
}

void sub_1003ED1C8()
{
  __assert_rtn("configure", "NRBYSpatialGesturePredictor.cpp", 31, "_lpfConfiguration[1] > 0");
}

void sub_1003ED1F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Unable to initialize Espresso Model, plan error.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED21C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Unable to initialize Espresso Model", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED248()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Unable to locate model weights filepath.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED274()
{
  __assert_rtn("makePrediction", "NRBYSpatialGesturePredictor.cpp", 129, "status == ESPRESSO_STATUS_SUCCESS");
}

void sub_1003ED29C()
{
  __assert_rtn("_preProcessInputData", "NRBYSpatialGesturePredictor.cpp", 208, "inputObject.deviceMotionBufferPrimary.has_value()");
}

void sub_1003ED2C4()
{
  __assert_rtn("_preProcessInputData", "NRBYSpatialGesturePredictor.cpp", 209, "inputObject.uwbBufferPrimary.has_value()");
}

void sub_1003ED2EC()
{
  __assert_rtn("_preProcessInputData", "NRBYSpatialGesturePredictor.cpp", 210, "inputObject.yprBufferPrimary.has_value()");
}

void sub_1003ED314()
{
  __assert_rtn("_preProcessInputData", "NRBYSpatialGesturePredictor.cpp", 233, "inputObject.deviceMotionBufferAfterProcessingPrimary.has_value()");
}

void sub_1003ED33C()
{
  __assert_rtn("_preProcessInputData", "NRBYSpatialGesturePredictor.cpp", 234, "inputObject.deltaUwbBufferAfterProcessingPrimary.has_value()");
}

void sub_1003ED364()
{
  __assert_rtn("_preProcessInputData", "NRBYSpatialGesturePredictor.cpp", 249, "inputObject.currentTime_s.has_value()");
}

void sub_1003ED38C()
{
  __assert_rtn("_preProcessInputData", "NRBYSpatialGesturePredictor.cpp", 266, "inputObject.currentTime_s.has_value()");
}

void sub_1003ED3B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Gesture classifier preprocessing device motion and UWB inputs", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED3E0()
{
  __assert_rtn("_refineModelPrediction", "NRBYSpatialGesturePredictor.cpp", 316, "inputObject.uwbBufferPrimary.has_value()");
}

void sub_1003ED408()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Calculating handoff confidence for DualAnchorAntennaPredictor", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED434()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Calculating handoff confidence for SinglePredictor", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED460()
{
  __assert_rtn("_refineModelPrediction", "NRBYSpatialGesturePredictor.cpp", 295, "0");
}

void sub_1003ED488()
{
  __assert_rtn("getHandoffThreshold", "NRBYSpatialGesturePredictor.cpp", 197, "0");
}

void sub_1003ED4B0()
{
  __assert_rtn("_evaluateHeuristics", "NRBYSpatialGesturePredictor.cpp", 411, "0");
}

void sub_1003ED4D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Gesture classifier was not configured, not consuming device motion data", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor GesturePredictor consumed device motion input and filtered", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED530()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor GesturePredictor device motion input filtered", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED55C()
{
  __assert_rtn("consumeRangeResult", "NRBYSpatialGesturePredictor.cpp", 550, "currentRangeResult.soi_rssi_dbm.has_value()");
}

void sub_1003ED584()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor GesturePredictor necessary sampling done for device motion input", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED5B0()
{
  __assert_rtn("consumeRangeResult", "NRBYSpatialGesturePredictor.cpp", 574, "0");
}

void sub_1003ED5D8(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 134217984;
  v2 = 0x3FF0000000000000;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#spatialGesturesPredictor Gesture classifier was not configured, returning intent score = %f, no AoA and no Spatial Gestures predictor involved", (uint8_t *)&v1, 0xCu);
}

void sub_1003ED654()
{
  __assert_rtn("predictIntent", "NRBYSpatialGesturePredictor.cpp", 755, "inpObj.deviceMotionBufferAfterProcessingPrimary.has_value()");
}

void sub_1003ED67C()
{
  __assert_rtn("predictIntent", "NRBYSpatialGesturePredictor.cpp", 758, "inpObj.deltaUwbBufferAfterProcessingPrimary.has_value()");
}

void sub_1003ED6AC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#boundedregiongrange-estimator, Filter is initialized", v1, 2u);
}

void sub_1003ED6EC(uint64_t a1, uint64_t **a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 - 24);
  v4 = **a2;
  v5 = a1 - (_QWORD)*a2;
  v6 = 134218496;
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  v10 = 2048;
  v11 = v5 / 24;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#boundedregiongrange-estimator, Buffer start and end after pruning: %3.2f - %3.2f s, size: %zu", (uint8_t *)&v6, 0x20u);
}

void sub_1003ED790(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#sa_algo_batchfilter,Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncertainty passed: %f m", (uint8_t *)&v4, 0x16u);
}

_QWORD *sub_1003ED814(_QWORD *result, _QWORD *a2)
{
  do
  {
    result[46] = off_100807398;
    result[30] = off_100807398;
    result[16] = off_100807398;
    result[8] = off_100807398;
    *result = off_100807398;
    result += 54;
  }
  while (result != a2);
  return result;
}

void sub_1003ED840(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a1, a3, "#hist-unlock, WRTT: rangeThreshold %{private}f resulted in 0 unlock probability, not unlocking", a5, a6, a7, a8, 1u);
}

void sub_1003ED8AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a1, a3, "#hist-unlock, Measurement %{private}f outside of histogram range", a5, a6, a7, a8, 1u);
}

void sub_1003ED918()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#bias-est, Issues with loading range bias estimator data transformer model", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003ED944(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#bias-est, Errored when loading range bias estimator data transformer model, error = %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003ED9A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#bias-est, Unable to standardize input to bias estimator %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EDA0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#bias-est, Unable to obtain resource handler, bypassing bias estimation.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDA38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, inputFeatures to consume input features is nil, returning nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDA64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in creating estimator input, returning nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDA90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, inputFeatures to preprocessing are nil, returning nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#bias-est, Didnt receive expected antenna mask", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDAE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Model errored when applying NN standardization on input data, returning nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDB14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, input features to prediction are nil, returning nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDB40(os_log_t log, double a2)
{
  int v2;
  double v3;

  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#bias-est, totalProbability = %f", (uint8_t *)&v2, 0xCu);
  sub_10000BFC4();
}

void sub_1003EDBB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Model errored when predicting, returning nil", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDBE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#bias-est, Model resource path not available", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDC0C(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#bias-est, Bundle path '%s' does not exist.", buf, 0xCu);
}

void sub_1003EDC50(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100029D74(a1, a2);
  sub_100029D00((void *)&_mh_execute_header, v2, (uint64_t)v2, "#bias-est, Unable to build Espresso model plan, bypassing bias estimation.", v3);
}

void sub_1003EDC7C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100029D74(a1, a2);
  sub_100029D00((void *)&_mh_execute_header, v2, (uint64_t)v2, "#bias-est, Unable to initialize Espresso Model, bypassing bias estimation", v3);
}

void sub_1003EDCA8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100029D74(a1, a2);
  sub_100029D00((void *)&_mh_execute_header, v2, (uint64_t)v2, "#bias-est, Unable to load data transformer model, bypassing bias estimation.", v3);
}

void sub_1003EDCD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, All CIR components are 0, not computing bias estimation for this range result event.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDD00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Sum of CIR values is 0, implying DC component of CIR FFT will be 0, not computing bias estimation for this range result event.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDD2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C964((void *)&_mh_execute_header, a2, a3, "#bias-est, unable to create biasEstimatorInputMLArray, error = %@", a5, a6, a7, a8, 2u);
  sub_10000BFC4();
}

void sub_1003EDD90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in executing espresso plan", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDDBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in binding outputs to espresso network", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDDE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in binding inputs to espresso network", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDE14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in defining input buffer to espresso network", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDE40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#bias-est, Invalid CIRs, unable to scale values", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDE6C()
{
  operator delete((void *)xmmword_10085E248);
}

void sub_1003EDE88()
{
  operator delete((void *)xmmword_10085E1E8);
}

void sub_1003EDEA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,CL arrow doesn't have horizontal angle and/or horizontal angle uncertainty fields", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDED0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,last event timestamp should always have value if we have a particle filter state", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDEFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,ingesting delayed pose", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EDF28(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v3 = a1[15];
  v4 = a1[16];
  v5 = a1[17];
  v6 = a1[18];
  v7 = 134218752;
  v8 = v3;
  v9 = 2048;
  v10 = v4;
  v11 = 2048;
  v12 = v5;
  v13 = 2048;
  v14 = v6;
  sub_1003431F4((void *)&_mh_execute_header, a2, a3, "#sa_algo_particlefilter,ingesting current finder deltav IO data: quatw: %f, quatx: %f, quaty: %f, quatz: %f", (uint8_t *)&v7);
}

void sub_1003EDFB8(os_log_t log, double a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  __int16 v7;
  double v8;

  v3 = 134218496;
  v4 = 0x3FB999999999999ALL;
  v5 = 2048;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo_particlefilter,ingesting finder kinematic data: deltaT: %f, delta Vx: %f, delta Vz: %f", (uint8_t *)&v3, 0x20u);
}

void sub_1003EE050(uint64_t a1, NSObject *a2)
{
  __n128 v3;
  uint64_t v4;
  uint8_t v5[56];

  v3.n128_f64[0] = sub_1003431C4(a1, __stack_chk_guard);
  sub_100343194(v3);
  sub_1003431F4((void *)&_mh_execute_header, a2, v4, "#sa_algo_particlefilter,particle filter current pose, source: deltav , quatw: %f, quatx: %f, quaty: %f, quatz: %f", v5);
  sub_10016AA28();
}

void sub_1003EE0C0(uint64_t a1, _BYTE *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v3, v4, "#sa_algo_particlefilter,ingesting delayed pose", v5, v6, v7, v8, v9);
  if (!*a2)
    sub_10000BA44();
}

void sub_1003EE108(uint64_t a1, NSObject *a2)
{
  __n128 v3;
  uint64_t v4;
  uint8_t v5[56];

  v3.n128_f64[0] = sub_1003431C4(a1, __stack_chk_guard);
  sub_100343194(v3);
  sub_1003431F4((void *)&_mh_execute_header, a2, v4, "#sa_algo_particlefilter,particle filter current pose, source: pose , quatw: %f, quatx: %f, quaty: %f, quatz: %f", v5);
  sub_10016AA28();
}

void sub_1003EE178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,ingesting spliced vio pose", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE1A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,peer pdr data ingested", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE1D0(os_log_t log, _BYTE *a2, double a3)
{
  int v4;
  double v5;

  v4 = 134217984;
  v5 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo_particlefilter,ingesting measurement: %f m", (uint8_t *)&v4, 0xCu);
  if (!*a2)
    __assert_rtn("ingestMeasurement", "ParticleFilter.cpp", 907, "_currentPose.has_value()");
}

void sub_1003EE284()
{
  __assert_rtn("measurementUpdate", "ParticleFilter.cpp", 1140, "_particles.has_value()");
}

void sub_1003EE2AC()
{
  __assert_rtn("systematicResample", "ParticleFilter.cpp", 1290, "_particles.has_value()");
}

void sub_1003EE2DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Estimator: filter not initialized", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE308()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "Estimator: innovation negative", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE334()
{
  __assert_rtn("processMeasurement", "NRBYEstimator.cpp", 322, "aidingInfo.has_value()");
}

void sub_1003EE35C()
{
  __assert_rtn("processMeasurement", "NRBYEstimator.cpp", 334, "aiding.remoteTxAntennaMask.has_value()");
}

void sub_1003EE384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "unexpected remote tx antenna mask. dropping calculation", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE3B0()
{
  __assert_rtn("_filterMeasurement", "NRBYEstimator.cpp", 425, "aidingInfo.has_value()");
}

void sub_1003EE3D8()
{
  __assert_rtn("_filterMeasurement", "NRBYEstimator.cpp", 437, "aiding.remoteTxAntennaMask.has_value()");
}

void sub_1003EE400()
{
  __assert_rtn("_filterMeasurement", "NRBYEstimator.cpp", 463, "filteredRange.has_value()");
}

void sub_1003EE428()
{
  __assert_rtn("_filterMeasurement", "NRBYEstimator.cpp", 464, "aiding.expectedRange.has_value()");
}

void sub_1003EE450(int a1, char *a2)
{
  __assert_rtn("SetMatrixSize", "cnmatrixbase.h", a1, a2);
}

void sub_1003EE474()
{
  __assert_rtn("_measurementUpdate", "NRBYEstimator.cpp", 573, "remoteTxAntMask == kAnt1Mask || remoteTxAntMask == kAnt2Mask");
}

void sub_1003EE49C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "null filter pointers", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE4C8()
{
  __assert_rtn("processMeasurement", "NRBYEstimator.cpp", 691, "efOutput.has_value()");
}

void sub_1003EE4F0()
{
  __assert_rtn("processMeasurement", "NRBYEstimator.cpp", 685, "aidingInfo.value().remoteTxAntennaMask.has_value()");
}

void sub_1003EE518()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 711, "data_ != __null");
}

void sub_1003EE540()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 712, "idx >= 0");
}

void sub_1003EE568()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 713, "idx < num_elements_");
}

void sub_1003EE590()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3641, "&(B) != &(C)");
}

void sub_1003EE5B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, SA (range only)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE5E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, PF", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE610()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, SA", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE63C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, SA with findee VIO", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE668()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provideSolution()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE694()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, CL", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE6C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,getFusionSolution()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE6EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, empty", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE718()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#negativeBiasRangeRejection, rejected first range measurement", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE744()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#negativeBiasRangeRejection, no measurements in the buffer to accept the new measurement", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE770()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#negativeBiasRangeRejection, accepted measurement with stricter mms validation status", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE79C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,cycleSkipping not populated in common::RangeResult", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE7C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const common::RangeResult &result)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE7F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,ignoring finder IO since it is disabled by config", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE820()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,no pdr attitude input, not processing finder pdr", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE84C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const PDRInput &pdr)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const common::Pose &pose)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EE8A4(NSObject *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#findalgs-peoplefinder,#gri,findee,Pass peer location to CL arrow filter, timestamp: %f", a5, a6, a7, a8, 0);
  if (!*a2)
    sub_10000BA44();
  sub_10034D7E8();
}

void sub_1003EE92C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#findalgs-peoplefinder,Unhandled value for _lastSignalEnvironment,%d", (uint8_t *)v2, 8u);
  sub_10000991C();
}

void sub_1003EE99C(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;

  v2 = "Self";
  if ((a1 & 1) != 0)
    v2 = "Peer";
  v3 = 136315138;
  v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#findalgs-peoplefinder,Conversion of %s location time to mach continuous time failed", (uint8_t *)&v3, 0xCu);
  sub_10000BFC4();
}

void sub_1003EEA24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const LocationInput &loc, const BOOL isPeerData", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EEA50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Conversion of heading time to mach continuous time failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EEA7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const HeadingInput &head)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EEAA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a2, a3, "#findalgs-peoplefinder,#clcc,Failed arrow range cross check,_isLastSolFromCL,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003EEB10(unsigned __int8 *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = 1;
  v5 = 1024;
  v6 = v3;
  sub_10034D7DC((void *)&_mh_execute_header, a2, a3, "#findalgs-peoplefinder,#clcc,unable to perform arrow range cross check,not failing,_isLastSolFromCL,%d,DO_NOT_FAIL_CROSS_CHECK_IF_UNAVAILABLE,%d", (uint8_t *)v4);
  sub_10000BFC4();
}

void sub_1003EEB8C(unsigned __int8 *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = 0;
  v5 = 1024;
  v6 = v3;
  sub_10034D7DC((void *)&_mh_execute_header, a2, a3, "#findalgs-peoplefinder,#clcc,Failed arrow range cross check,_isLastSolFromCL,%d,DO_NOT_FAIL_CROSS_CHECK_IF_UNAVAILABLE,%d", (uint8_t *)v4);
  sub_10000BFC4();
}

void sub_1003EEC04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Unhandled signal environment, convertSignalEnvironmentToBucketIndex", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EEC30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#gri,process(const std::vector<nearby::algorithms::finding::GnssSatelliteData> &gnssSatelliteData)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EEC5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#findalgs-peoplefinder,processDiscoveryEvent,time,%.1lf", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003EECC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Peer data does not have receipt time and container hasn't received any time tuples, peer data can not be used", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EECF0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10017A058((void *)&_mh_execute_header, a2, a3, "#findalgs-peoplefinder,#gri,findee,processPeerLocation,good_gnss_conditions_detected,%d", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003EED68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10017D330((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#findeeVIO Received findee VIO start date %f s later than one stored %f s - VIO reset happened in between", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EEDCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,delta position caculation invalid, waiting for addtional PDR input before processing delta position", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EEDF8(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  double v10;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = 134218496;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  v9 = 2048;
  v10 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-peoplefinder,integrated H1: %f, integrated H2: %f, deltaT: %f", (uint8_t *)&v5, 0x20u);
  sub_10034D7E8();
}

void sub_1003EEE80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10028DB40();
  sub_10017D330((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Received findee static info with start date %f s later than one stored %f s - motion happened in between", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EEEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Received bounded displacement with max enter timestamp again.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EEF10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a1, a3, "#findalgs-peoplefinder,Peer data does not have receipt time, using mach continuous from last time tuple: %.3f", a5, a6, a7, a8, 0);
  sub_10000BFC4();
}

void sub_1003EEF78(uint64_t a1, NSObject *a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100161C8C((void *)&_mh_execute_header, a2, (uint64_t)a3, "#findalgs-peoplefinder,Peer data contains mach absolute receipt time: %.3f s", a5, a6, a7, a8, 0);
  if (!*a3)
    sub_10000BA44();
  sub_10034D7E8();
}

void sub_1003EF000()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const FindeeData &peer)", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF02C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Handing SA w/ findee VIO solution to PF when findee VIO reset/revoke is detected", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Handing SA solution to PF when findee motion is detected", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF084(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;

  v3 = *(unsigned __int8 *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a2 + 8208);
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  sub_10034D7DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "#findalgs-peoplefinder,processPeerLocation,peerLoc.has_value(),%d,_lastSelfLocation.has_value(),%d", (uint8_t *)v5);
  sub_10000BFC4();
}

void sub_1003EF108()
{
  __assert_rtn("getAverage", "NRBYUserIntentPredictor.cpp", 48, "_buffer.size() <= _maxBufLength");
}

void sub_1003EF130(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#handoffPredictor delta time between range results is non positive", v1, 2u);
}

void sub_1003EF170()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::provideSolution unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF19C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::providePeerData unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF1C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const common::Pose &pose) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF1F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const AltimeterInput &altData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const LocationInput &loc, const BOOL isPeerData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF24C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const HeadingInput &head) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const std::vector<nearby::algorithms::finding::GnssSatelliteData> &gnssSatelliteData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF2A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const MotionActivityInput &activity) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF2D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const PedometerDataInput &pedData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF2FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const PedometerEventInput &pedEvent) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF328()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const PDRInput &pdr) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF354()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const FindeeData &peer) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF380()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const WatchOrientationInput &watchOrientation) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF3AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::processDiscoveryEvent(const double mach_absolute_time_s) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF3D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const common::MissedRangeResult &missedResult) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF404()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_1000553C0((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::dismiss() unexpectedly called but not overridden", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF430()
{
  __assert_rtn("_checkInterRegionTransition", "NRBYDeviceMonitor.cpp", 206, "false");
}

void sub_1003EF458()
{
  __assert_rtn("_checkInterRegionTransition", "NRBYDeviceMonitor.cpp", 213, "_currentRegion.has_value()");
}

void sub_1003EF480(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon technology mapping not found for ranging technology", v1, 2u);
}

void sub_1003EF4C0()
{
  __assert_rtn("processRangeResult", "NRBYDeviceMonitor.cpp", 446, "result.remoteTxAntennaMask.has_value()");
}

void sub_1003EF4E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BFB4((void *)&_mh_execute_header, a2, a3, "#regionmon unexpected remote antenna mask in SG prediction for dev 0x%llx. skipping intent prediction", a5, a6, a7, a8, 0);
}

void sub_1003EF554()
{
  __assert_rtn("processRangeResult", "NRBYDeviceMonitor.cpp", 398, "result.remoteTxAntennaMask.has_value()");
}

void sub_1003EF57C(uint8_t *buf, uint64_t a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon Error unexpected BT threshold detector early return with out of bubble estimate, RSSI: %f, numSamples: %d", buf, 0x12u);
}

void sub_1003EF5D0(uint64_t a1, NSObject *a2)
{
  double v2;
  int v3;
  double v4;

  v2 = *(float *)(a1 + 24);
  v3 = 134217984;
  v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#regionmon more than one region with radius: %f\n", (uint8_t *)&v3, 0xCu);
  sub_10000BFC4();
}

void sub_1003EF648()
{
  __assert_rtn("_validateRegionSet", "NRBYRegionMonitor.cpp", 120, "outerRadius > innerRadius");
}

void sub_1003EF670(os_log_t log, float a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  double v5;

  v2 = 134218240;
  v3 = 0x3FB99999A0000000;
  v4 = 2048;
  v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon Region spaced by less than %fm (%fm)\n", (uint8_t *)&v2, 0x16u);
  sub_10000BFC4();
}

void sub_1003EF700(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon region categories in same RegionSet don't match", v1, 2u);
  sub_10000991C();
}

void sub_1003EF73C(int *a1, uint64_t *a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;

  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 2048;
  v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#regionmon #region-class region for class %d not found. will not create a device monitor for 0x%llx", (uint8_t *)v5, 0x12u);
  sub_10000BFC4();
}

void sub_1003EF7C4(uint64_t *a1, int a2, os_log_t log)
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
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#regionmon #region-class using class %d regions for device 0x%llx", (uint8_t *)v4, 0x12u);
  sub_10000BFC4();
}

void sub_1003EF848(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#regionmon ERROR: Ideally should NOT enter this switch case since initStateForDevice in case of Bluetooth device is handled separately in a different function: RegionMonitor::initStateForBluetoothDevice(). Returning false.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003EF878(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#regionmon Location-based region monitoring not supported.", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003EF8A8(_BYTE *a1, uint64_t a2)
{
  if (*a1)
  {
    if (*(char *)(a2 + 23) < 0)
      operator delete(*(void **)a2);
  }
}

void sub_1003EF8D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#findalgs-devicefinder,didUpdatePreciseDevicePosition called after invalidate. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF8FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#findalgs-devicefinder,didUpdateAnalytics called after invalidate. Possible race condition", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003EF928(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#findalgs-devicefinder,Unknown motion state: %d", buf, 8u);
}

void sub_1003EF96C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#findalgs-devicefinder,Sending peer data to CMA", v1, 2u);
  sub_10000991C();
}

void sub_1003EF9A4()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#findalgs-devicefinder,Failed to convert receipt time from mach absolute to mach continuous while updating peer data", v1, 2u);
  sub_10000991C();
}

void sub_1003EF9DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Received pose earlier than the last pose in history with timestamp: %f - pose rejected", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EFA40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "#sa_algo_moving_findee,Peer VIO history empty after pruning", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003EFA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_10000BFB4((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Received peer pose earlier than the last pose in history with timestamp: %f - pose rejected", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EFAD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "#sa_algo_moving_findee,Peer VIO history is empty", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003EFB04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000553C0((void *)&_mh_execute_header, a1, a3, "#sa_algo_moving_findee,Self VIO history is empty", a5, a6, a7, a8, 0);
  sub_10000991C();
}

void sub_1003EFB34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10035F79C((void *)&_mh_execute_header, a2, a3, "#sa_algo_moving_findee,Populating world position output with SA, object position is [%4.2f, %4.2f, %4.2f] m", a5, a6, a7, a8, 0);
}

void sub_1003EFBB8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10028DB40();
  sub_1002F25F4((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating horizontal angle output with SA, angle: %3.2f deg, timestamp: %f s", v2);
  sub_10000BFC4();
}

double sub_1003EFC20(uint64_t a1, float *a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;
  double v5;
  double result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *a2;
  *(_DWORD *)a3 = 134218240;
  *(double *)(a3 + 4) = v5;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = v4;
  sub_1002F25F4((void *)&_mh_execute_header, a4, a3, "#sa_algo_moving_findee,Populating range output with SA, range: %0.2f m, timestamp: %f s", (uint8_t *)a3);
  return result;
}

void sub_1003EFC78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10035F778();
  sub_10035F79C((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,#stalePeerVIO Peer VIO is too stale %f compared to threshold %f s BUT arrow uncertainty is %4.1f deg is sufficiently small - yielding the solution", v2, v3, v4, v5, v6);
}

void sub_1003EFCE0()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[32];
  __int16 v3;
  uint64_t v4;

  sub_10035F778();
  v3 = v0;
  v4 = 0x4036800000000000;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#sa_algo_moving_findee,#stalePeerVIO Peer VIO is too stale %f compared to threshold %f s AND arrow uncertainty is %4.1f deg is larger than threshold %4.1f deg - not yielding the solution", v2, 0x2Au);
}

void sub_1003EFD64()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10028DB40();
  sub_1002F25F4((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,#stalePeerVIO worstCaseSideMovement: %0.2f m, horizontal distance: %0.2f m", v2);
  sub_10000BFC4();
}

void sub_1003EFDD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateUnknown, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EFE34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateSame, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EFE98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateAbove, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EFEFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateBelow, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EFF60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10019EAC4();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateAboveOrBelow, timestamp: %f s", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003EFFC4()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100010AE0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[RoseSupervisorInterface] IOServiceGetMatchingService failed.", v1, 2u);
  sub_10000991C();
}

void sub_1003EFFFC(char *a1, uint8_t *buf, os_log_t log)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[RoseSupervisorInterface] IOServiceOpen failed. Error: %s", buf, 0xCu);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void sub_1003F006C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::connectSupervisor", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F0098()
{
  __assert_rtn("setHIDEventsHandler", "RoseSupervisorInterface.mm", 90, "hidEventHandler");
}

void sub_1003F00C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::setHIDEventsHandler", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F00EC()
{
  __assert_rtn("sendCommandToRose", "RoseSupervisorInterface.mm", 103, "buffLen <= kRoseSupervisorOutPayloadLengthMax");
}

void sub_1003F0114()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::sendCommandToRose", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F0140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::setRoseProperty", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F016C()
{
  __assert_rtn("getRoseProperty", "RoseSupervisorInterface.mm", 161, "outPayloadLength <= kRoseSupervisorOutPayloadLengthMax");
}

void sub_1003F0194()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::getRoseProperty", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F01C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::onHIDEvent", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F01EC()
{
  __assert_rtn("decodeCoexCriticalEvent", "roseEventHandler.cpp", 1025, "packet.size() == EXPECTED_PACKET_SIZE");
}

void sub_1003F0214()
{
  __assert_rtn("decodeResponderSuperframeCompleteEvent", "roseEventHandler.cpp", 1138, "channelBand.has_value() && channelBand.value().uwbChannel.has_value()");
}

void sub_1003F023C()
{
  __assert_rtn("decodeCIRSampleSet", "roseCIRDataDecoderV2.cpp", 422, "len == numCIRs * cirSizeBytes");
}

void sub_1003F0264()
{
  __assert_rtn("getNBMaskOOB", "roseSharedTypes.cpp", 1012, "unii5_subbands == 0 || unii5_subbands == 4");
}

void sub_1003F028C()
{
  __assert_rtn("nbMaskAllowsUNII3", "roseSharedTypes.cpp", 1019, "nb_mask <= 3");
}

void sub_1003F02B4()
{
  __assert_rtn("nbMaskAllowsUNII5", "roseSharedTypes.cpp", 1025, "nb_mask <= 3");
}

void sub_1003F02DC()
{
  __assert_rtn("loadBooterLibrary_block_invoke", "RoseControllerInterface.cpp", 146, "!roseBooterLibHandle");
}

uint64_t sub_1003F0304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;

  sub_10036ED18(a1, a2, a3, a4, a5, a6, a7, a8, v10);
  v8 = sub_10036ED10();
  return sub_1003F0320(v8);
}

uint64_t sub_1003F0320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;

  sub_10036ED18(a1, a2, a3, a4, a5, a6, a7, a8, v10);
  v8 = sub_10036ED10();
  return sub_1003F033C(v8);
}

uint64_t sub_1003F033C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;

  sub_10036ED18(a1, a2, a3, a4, a5, a6, a7, a8, v10);
  v8 = sub_10036ED10();
  return sub_1003F0358(v8);
}

uint64_t sub_1003F0358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  sub_10036ED18(a1, a2, a3, a4, a5, a6, a7, a8, a1);
  v8 = sub_10036ED10();
  return sub_1003F0384(v8);
}

uint64_t sub_1003F0384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;

  sub_10036ED18(a1, a2, a3, a4, a5, a6, a7, a8, v10);
  v8 = sub_10036ED10();
  return sub_1003F03A0(v8);
}

uint64_t sub_1003F03A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  sub_10036ED18(a1, a2, a3, a4, a5, a6, a7, a8, a1);
  v8 = sub_10036ED10();
  return sub_1003F03CC(v8);
}

uint64_t sub_1003F03CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;

  sub_10036ED18(a1, a2, a3, a4, a5, a6, a7, a8, v10);
  v8 = sub_10036ED10();
  return sub_1003F03E8(v8);
}

void sub_1003F03E8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  double v3;

  sub_100393914(__stack_chk_guard);
  sub_1003938D0();
  sub_10017A074((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,unlock,read,fRegulatoryArea,%s,ts,%.1f", v2, v3);
  sub_10000BFC4();
}

void sub_1003F0454()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100393904(__stack_chk_guard);
  sub_10017A088();
  sub_1002F25F4((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,unlock,write,fRegulatoryArea,%s,ts,%.1f", v2);
  sub_10000BFC4();
}

void sub_1003F04C4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100393904(__stack_chk_guard);
  sub_10017A088();
  sub_1002F25F4((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,unlock,fRegulatoryArea,%s,ts,%.1f", v2);
  sub_10000BFC4();
}

void sub_1003F0534()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,locked,notWriting", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F0560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,Cannot serialize regulatory settings, error,%@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003F05C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,written,%@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003F0620()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,Cant write to regulatory settings file, error, %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003F0680()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  double v3;

  sub_100393914(__stack_chk_guard);
  sub_1003938D0();
  sub_10017A074((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,fRegulatoryArea,%s,ts,%.1f", v2, v3);
  sub_10000BFC4();
}

void sub_1003F06EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,noCache,locked,returnNothing", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F0718()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,Cant read from regulatory settings file, error, %@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003F0778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,Cannot deserialize regulatory settings, error,%@", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003F07D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,nsIsoCode,null", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F0804()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100393904(__stack_chk_guard);
  sub_10017A088();
  sub_1002F25F4((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,fromFile,fRegulatoryArea,%s,ts,%.1f", v2);
  sub_10000BFC4();
}

void sub_1003F0874()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,nsTimestamp,null", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F08A0()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  double v3;

  sub_100393914(__stack_chk_guard);
  sub_1003938D0();
  sub_10017A074((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,fromCache,fRegulatoryArea,%s,ts,%.1f", v2, v3);
  sub_10000BFC4();
}

void sub_1003F090C()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  sub_1003938E8(__stack_chk_guard);
  sub_1003938B8();
  sub_100146A9C((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,%s,%d", v2, v3);
  sub_10000BFC4();
}

void sub_1003F096C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001B110();
  sub_100161C8C((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,%s,undefined", v2, v3, v4, v5, v6);
  sub_10000BFC4();
}

void sub_1003F09CC()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  double v3;

  sub_1003938D0();
  sub_10017A074((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,%s,%.2f", v2, v3);
  sub_10000BFC4();
}

void sub_1003F0A30(char a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1 & 1) != 0)
    sub_1003938F4((void *)&_mh_execute_header, a2, a3, "regulatory,comp,getRegulatoryCountryParams,cantFind,kUnknownCountry", a5, a6, a7, a8, 0);
  __assert_rtn("getRegulatoryCountryParams", "roseRegulatoryCompliance.mm", 559, "false");
}

void sub_1003F0A78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "rdar://130935626 - CN Ch5 mitigation", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F0AA4(char *a1, _QWORD *a2, NSObject *a3)
{
  int v3;
  _QWORD *v4;

  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315138;
  v4 = a2;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "regulatory,comp,getRegulatoryCountryParams,found,country,%s", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003F0B1C(char a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1 & 1) != 0)
    sub_1003938F4((void *)&_mh_execute_header, a2, a3, "regulatory,comp,getRegulatoryNBCountryParams,cantFind,kUnknownCountry", a5, a6, a7, a8, 0);
  __assert_rtn("getRegulatoryNBCountryParams", "roseRegulatoryCompliance.mm", 613, "false");
}

void sub_1003F0B64(char *a1, _QWORD *a2, NSObject *a3)
{
  int v3;
  _QWORD *v4;

  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315138;
  v4 = a2;
  sub_10017A068((void *)&_mh_execute_header, a3, (uint64_t)a3, "regulatory,comp,getRegulatoryNBCountryParams,found,country,%s", (uint8_t *)&v3);
  sub_10000BFC4();
}

void sub_1003F0BDC(char *a1, _QWORD *a2, os_log_t log)
{
  int v3;
  _QWORD *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;

  if (*a1 < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315906;
  v4 = a2;
  v5 = 1024;
  v6 = 0;
  v7 = 1024;
  v8 = 0;
  v9 = 2080;
  v10 = "unknownCountry for UWB query";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,comp,getDesignatedRfChannels,country,%s,ch5,%d,ch9,%d,note,%s", (uint8_t *)&v3, 0x22u);
}

void sub_1003F0C88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "unknownCountry for NB query", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F0CB4()
{
  uint64_t v0;
  os_log_t v1;
  double v2;
  double v3;

  sub_10017A088();
  sub_10017A074((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,testLocation,lat,%.6f,lon,%.6f", v2, v3);
  sub_10000BFC4();
}

void sub_1003F0D1C(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,defaults,backoffDuration,%d", (uint8_t *)v3, 8u);
  sub_10000991C();
}

void sub_1003F0D90()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  sub_10001B110();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_10017A074((void *)&_mh_execute_header, v1, v2, "regulatory,defaults,%s,%s", v3, v4);
  sub_10000BFC4();
}

void sub_1003F0E0C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000051BC("error getting system group container: %llu", a2, a3, a4, a5, a6, a7, a8, *a1);
  abort_report_np("error getting system group container: %llu", *a1);
  sub_1003F0E48();
}

void sub_1003F0E48()
{
  __assert_rtn("x_write", "json.hpp", 8295, "x == 0");
}

void sub_1003F0E70()
{
  __assert_rtn("x_write", "json.hpp", 8300, "i < m_buf.size() - 2");
}

void sub_1003F0E98()
{
  __assert_rtn("x_write", "json.hpp", 8331, "written_bytes > 0");
}

void sub_1003F0EC0()
{
  __assert_rtn("x_write", "json.hpp", 8337, "loc != nullptr");
}

void sub_1003F0EE8()
{
  __assert_rtn("x_write", "json.hpp", 8386, "m_buf[i - 1] != '\\0'");
}

void sub_1003F0F10()
{
  __assert_rtn("x_write", "json.hpp", 8393, "m_buf[i + 2] == '\\0'");
}

void sub_1003F0F38()
{
  __assert_rtn("x_write", "json.hpp", 8383, "(i + 2) < m_buf.size()");
}

void sub_1003F0F60()
{
  __assert_rtn("x_write", "json.hpp", 8333, "static_cast<size_t>(written_bytes) < m_buf.size()");
}

void sub_1003F0F88()
{
  __assert_rtn("assert_invariant", "json.hpp", 1787, "m_type != value_t::object or m_value.object != nullptr");
}

void sub_1003F0FB0()
{
  __assert_rtn("assert_invariant", "json.hpp", 1788, "m_type != value_t::array or m_value.array != nullptr");
}

void sub_1003F0FD8()
{
  __assert_rtn("assert_invariant", "json.hpp", 1789, "m_type != value_t::string or m_value.string != nullptr");
}

void sub_1003F1000()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error:: add IMU data to MHT failed", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F102C(_QWORD *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1[10];
  v5 = *(_QWORD *)(*(_QWORD *)(v4 + ((a1[13] >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (a1[13] & 0x1FFLL));
  v6 = *(_QWORD *)(*(_QWORD *)(v4 + (((unint64_t)(a1[13] + a1[14] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * ((a1[13] + a1[14] - 1) & 0x1FF));
  *(_DWORD *)buf = 134218496;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = v5;
  *((_WORD *)buf + 11) = 2048;
  *((_QWORD *)buf + 3) = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sf,RoseSensorFusionManager::addIMUdata: IMU buffer size is %lu, time stamps from %f to %f", buf, 0x20u);
}

void sub_1003F10C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error: empty rose measurement vector.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F10EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error: Rose measurement rejected because no IMU data has been received yet.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1118()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error: rose measurements vector contains measurements from different targets.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager::addRoseMeasurementsToTrackingTargetSet failed: IMU buffer is empty", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1170(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v5 = sub_1003C8354(a1);
  v6 = a2[10];
  v7 = *(_QWORD *)(*(_QWORD *)(v6 + ((a2[13] >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (a2[13] & 0x1FFLL));
  v8 = *(_QWORD *)(*(_QWORD *)(v6 + (((unint64_t)(a2[13] + a2[14] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * ((a2[13] + a2[14] - 1) & 0x1FF));
  v9 = 134218496;
  v10 = v5;
  v11 = 2048;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "#sf,RoseSensorFusionManager::addRoseMeasurementsToTrackingTargetSet failed: IMU buffer size is %lu, time stamps from %f to %f", (uint8_t *)&v9, 0x20u);
}

void sub_1003F1248()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager: Attempt to clear IMU history is aborted because there are targets being tracked.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1274(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#sf,[RoseSensorFusionTrackingTargetSet: get empty rose measurements vector]", a5, a6, a7, a8, 0);
}

void sub_1003F12A8()
{
  __assert_rtn("addRoseMeasurements", "RoseSensorFusionTrackingTargetSet.cpp", 139, "fTrackingParams.has_value()");
}

void sub_1003F12D0()
{
  __assert_rtn("getTrackScoreIncrement", "RoseSensorFusionTrackingTargetSet.cpp", 39, "thres2 > thres1");
}

void sub_1003F12F8()
{
  __assert_rtn("computeAssignmentMatrix", "RoseSensorFusionTrackingTargetSet.cpp", 466, "fTrackingParams.has_value()");
}

void sub_1003F1320()
{
  __assert_rtn("computeAssignmentMatrix", "RoseSensorFusionTrackingTargetSet.cpp", 469, "assignmentMat.size() > 0 && assignmentMat[0].size() > assignmentMat.size()");
}

void sub_1003F1348()
{
  __assert_rtn("computeAssignmentMatrix", "RoseSensorFusionTrackingTargetSet.cpp", 481, "trackingParams.betaExternal > 0");
}

void sub_1003F1370()
{
  __assert_rtn("processTrackingTargetsWithAssignedMeasurements", "RoseSensorFusionTrackingTargetSet.cpp", 506, "roseMeasurements.size() > 0");
}

void sub_1003F1398()
{
  __assert_rtn("processTrackingTargetsWithAssignedMeasurements", "RoseSensorFusionTrackingTargetSet.cpp", 507, "fTrackingParams.has_value()");
}

void sub_1003F13C0()
{
  __assert_rtn("getSolutionInternalsFromTrackingTargetSet", "RoseSensorFusionTrackingTargetSet.cpp", 297, "fTrackingParams.has_value()");
}

void sub_1003F13E8()
{
  __assert_rtn("calculateGatingMetric", "RoseSensorFusionTrackingTargetSet.cpp", 600, "fTrackingParams.has_value()");
}

void sub_1003F1410()
{
  __assert_rtn("operator double", "cnmatrixbase.h", 979, "num_elements_ == 1");
}

void sub_1003F1438(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010AB8((void *)&_mh_execute_header, a1, a3, "#sf,RoseSensorFusionTrackingTargetSet::findOptimalAssociation: assignment matrix is empty, return now", a5, a6, a7, a8, 0);
}

void sub_1003F146C()
{
  __assert_rtn("getAoaScaleFactor", "RoseSensorFusionTrackingTargetSet.cpp", 709, "fTrackingParams.has_value()");
}

void sub_1003F1494()
{
  __assert_rtn("getAoaScaleFactor", "RoseSensorFusionTrackingTargetSet.cpp", 717, "probability_vector.size() == fNNClassifierPtr->getOutputSize()");
}

void sub_1003F14BC()
{
  __assert_rtn("getAoaScaleFactor", "RoseSensorFusionTrackingTargetSet.cpp", 714, "azimuth_rose_deg >=0 && azimuth_rose_deg <= 180 && elevation_rose_deg >= 0 && elevation_rose_deg <= 180");
}

void sub_1003F14E4()
{
  __assert_rtn("updateTrackStatus", "RoseSensorFusionTrackingTargetSet.cpp", 675, "fTrackingParams.has_value()");
}

void sub_1003F150C()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5349, "Ipiv.max_num_rows_ >= A.num_rows_");
}

void sub_1003F1534()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5351, "Work.max_num_rows_ >= A.num_rows_");
}

void sub_1003F155C()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5352, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_1003F1584()
{
  sub_10030F1EC();
  __assert_rtn("Det", "cnmatrixbase.h", 5381, "info >= 0");
}

void sub_1003F15D4()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5347, "A.num_rows_ == A.num_cols_");
}

void sub_1003F15FC()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4076, "a.num_rows_ == 1 || a.num_cols_ == 1");
}

void sub_1003F1624()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4077, "b.num_rows_ == 1 || b.num_cols_ == 1");
}

void sub_1003F164C()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4079, "a.num_elements_ == b.num_elements_");
}

void sub_1003F1674()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,Error: trying to normalize a zero quanternion - Setting the quaternion to a unit quaternion instead.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F16A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,EKF is not initialized", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F16CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,Attempted to propagate state to the past - Filter time is ahead of the most current IMU time", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F16F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,propagateEKF fails", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1724()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,Propagating state vector X fails", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1003C6734("operator=", "cnsubmatrix.h", a3, "this->num_cols_ == A.num_cols_");
}

void sub_1003F1774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1003C672C("operator=", "cnsubmatrix.h", a3, "this->num_rows_ == A.num_rows_");
}

void sub_1003F1798(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5;
  double v6;
  __int16 v7;
  double v8;

  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  sub_100010AC8((void *)&_mh_execute_header, a1, a5, "#sf,RoseEKF error: Trying to propagate state backward from time %f to time %f", (uint8_t *)&v5);
  sub_10000BFC4();
}

void sub_1003F1810()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_100029D1C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#sf,%s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
}

void sub_1003F1868()
{
  __assert_rtn("operator=", "cnsubvector.h", 347, "this->num_elements_ == A.num_elements_");
}

void sub_1003F1890()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF-rangeElAz2x: Az angle close to singularity - converting the covariance matrix without measurement Jacobian", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F18BC(const char *a1, const char *a2, int a3, const char *a4)
{
  __assert_rtn(a1, a2, a3, a4);
}

void sub_1003F18C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1003C673C("operator()", "cnmatrix.h", a3, "strcmp(c, \":\") == 0");
}

void sub_1003F18EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1003C6744("Chol", "cnmatrix.h", a3, "false");
}

void sub_1003F1910(std::string *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *__p;
  void *__pa;
  char v14;
  int v15;
  uint64_t v16;

  sub_1003C6754(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v11, (uint64_t)__p);
  sub_10016AA14();
  v15 = 136315138;
  v16 = v9;
  sub_10017A068((void *)&_mh_execute_header, a2, v10, "#sf,RoseEKF measUpdateAlt R: %s", (uint8_t *)&v15);
  if (v14 < 0)
    operator delete(__pa);
  sub_10016AA28();
}

void sub_1003F19A0(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  double v5;

  v4 = 134217984;
  v5 = sub_1003C674C(a1, 0);
  sub_10017A068((void *)&_mh_execute_header, a2, v3, "#sf,RoseEKF: measUpdateRange R: %f", (uint8_t *)&v4);
}

void sub_1003F1A24()
{
  __assert_rtn("SetMatrixSize", "cnmatrixbase.h", 422, "this->max_num_rows_ >= num_rows");
}

void sub_1003F1A4C()
{
  __assert_rtn("operator()", "cnmatrix.h", 992, "strcmp(c, \":\") == 0");
}

void sub_1003F1A74(uint64_t a1, NSObject *a2)
{
  int v4;
  double v5;
  __int16 v6;
  double v7;
  __int16 v8;
  double v9;
  __int16 v10;
  double v11;

  v4 = 134218752;
  v5 = sub_1003C674C(a1, 0);
  v6 = 2048;
  v7 = sub_10027C1DC(a1, 0, 1);
  v8 = 2048;
  v9 = sub_1003C674C(a1, 1);
  v10 = 2048;
  v11 = sub_10027C1DC(a1, 1, 1);
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#sf,RoseEKF: measUpdateAoA R: %f, %f; %f, %f",
    (uint8_t *)&v4,
    0x2Au);
}

void sub_1003F1B68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose AoA measurement rejected - Filter not initialized.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1B94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose AoA measurement rejected - Invalid angles.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1BC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sf,RoseEFK: to start propagate and measurement update", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1BEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range measurement rejected - Filter not initialized.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1C18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range measurement rejected - Invalid range.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1C44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range&Aoa measurement rejected - Filter not initialized.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1C70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range&Aoa measurement rejected - Invalid angles or range.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1C9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sf,RoseEFK: to start propagate and measurement update with alternative measurement model", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1CC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sf,propAndMeasUpdateMain end", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1CF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Trying to initialize EKF but IMU buffer is empty", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1D20()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_10017A088();
  sub_100010AC8((void *)&_mh_execute_header, v0, (uint64_t)v0, "#sf,RoseEKF error: The measurement timestamp (%f) is older than the oldest IMU timestamp (%f) - rejecting the measurement for initialization", v1);
  sub_10000BFC4();
}

void sub_1003F1DA4()
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

  sub_10015ABF4();
  if (v6 != v7)
    v8 = v5;
  else
    v8 = v1;
  *(_DWORD *)v2 = 136315138;
  *(_QWORD *)(v2 + 4) = v8;
  sub_10017A068((void *)&_mh_execute_header, v3, (uint64_t)v3, "#sf,RoseEKF: initial P matrix %s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
}

void sub_1003F1DFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: imuHistory is empty in propAndMeasUpdateMain()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1E28()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Aborting measurement update with a delayed measurement at t = %f s", v2);
  sub_10000BFC4();
}

void sub_1003F1E8C()
{
  __assert_rtn("propAndMeasUpdateMain", "RoseSensorFusionEKF.cpp", 1622, "indexFirstIMUDataToAdvanceTo > 0");
}

void sub_1003F1EB4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Delayed Rose range measurement with negative range rejected at t = %f s", v2);
  sub_10000BFC4();
}

void sub_1003F1F18()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: range measurement update done in the delayed measurement at t = %f s", v2);
  sub_10000BFC4();
}

void sub_1003F1F7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Delayed rose range&Aoa measurement to be used in the alternative measurement update rejected - Invalid angles or range.", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F1FA8()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_10017A088();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#sf,RoseEKF: Rewinding back to the last measurement at t = %f s from t = %f s", v1, 0x16u);
  sub_10000BFC4();
}

void sub_1003F201C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_100029D1C((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range measurement with negative range rejected at t = %f s", v2);
  sub_10000BFC4();
}

void sub_1003F2080()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: range measurement update done in the non-delayed measurement at t = %f s", v2);
  sub_10000BFC4();
}

void sub_1003F20E4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1001EAF38(__stack_chk_guard);
  sub_100010AD4();
  sub_10017A068((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: AoA measurement update done in the non-delayed measurement at t = %f s", v2);
  sub_10000BFC4();
}

void sub_1003F2148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: fetch last IMU data done", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F2174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: fetch last IMU data", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F21A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100154B18((void *)&_mh_execute_header, v0, v1, "#sf,propAndMeasUpdateMain start", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F21CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100010AE0();
  sub_100010AB8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: imuHistory is empty in dynamicPropMain()", v2, v3, v4, v5, v6);
  sub_10000991C();
}

void sub_1003F21F8()
{
  __assert_rtn("Colon", "cnmatrixbase.h", 1762, "idx.MaxNumRows() > 0");
}

void sub_1003F2220()
{
  __assert_rtn("Colon", "cnmatrixbase.h", 1763, "idx.MaxNumCols() > 0");
}

void sub_1003F2248()
{
  __assert_rtn("Colon", "cnmatrixbase.h", 1788, "static_cast<s32>(idx.MaxNumCols()) >= n");
}

void sub_1003F2270()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 848, "data_ != __null");
}

void sub_1003F2298()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 849, "idx >= 0");
}

void sub_1003F22C0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 850, "idx < num_elements_");
}

void sub_1003F22E8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 881, "data_ != __null");
}

void sub_1003F2310()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 882, "idx >= 0");
}

void sub_1003F2338()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 883, "idx < num_elements_");
}

void sub_1003F2360()
{
  __assert_rtn("AllocateMemoryBacking", "cnmatrix.h", 284, "this->allocated_data_");
}

void sub_1003F2388()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6212, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

void sub_1003F23B0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6214, "Iwork.max_num_rows_ * Iwork.max_num_cols_ >= A.num_rows_");
}

void sub_1003F23D8()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6216, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

void sub_1003F2400()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6218, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003F2428()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6219, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003F2450()
{
  sub_10030F1EC();
  __assert_rtn("Inv", "cnmatrixbase.h", 6258, "info >= 0");
}

void sub_1003F24A0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6311, "info == 0");
}

void sub_1003F24C8()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6343, "info >= 0");
}

void sub_1003F24F0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6210, "A.num_rows_ == A.num_cols_");
}

void sub_1003F2518()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3749, "&(A) != &(C)");
}

void sub_1003F2540()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3401, "&A != &B");
}

void sub_1003F2568()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3403, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003F2590()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3404, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003F25B8()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5103, "B.max_num_rows_ >= A.num_rows_");
}

void sub_1003F25E0()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5104, "B.max_num_cols_ >= A.num_cols_");
}

void sub_1003F2608()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5102, "A.num_rows_ == A.num_cols_");
}

void sub_1003F2630()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6541, "&A != &Tau");
}

void sub_1003F2658()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6542, "&A != &Work");
}

void sub_1003F2680()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6543, "&A != &R");
}

void sub_1003F26A8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6544, "&Tau != &Work");
}

void sub_1003F26D0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6545, "&Tau != &R");
}

void sub_1003F26F8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6546, "&Work != &R");
}

void sub_1003F2720()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6549, "R.max_num_rows_ >= A.num_rows_");
}

void sub_1003F2748()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6550, "R.max_num_cols_ >= A.num_cols_");
}

void sub_1003F2770()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6553, "Tau.max_num_rows_ >= A.num_rows_");
}

void sub_1003F2798()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6559, "Work.max_num_rows_ >= A.num_cols_");
}

void sub_1003F27C0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6560, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_1003F27E8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6599, "info == 0");
}

void sub_1003F2810()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6557, "Tau.max_num_rows_ >= A.num_cols_");
}

void sub_1003F2838()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6659, "&A != &Tau");
}

void sub_1003F2860()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6660, "&A != &Work");
}

void sub_1003F2888()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6661, "&A != &Q");
}

void sub_1003F28B0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6662, "&A != &R");
}

void sub_1003F28D8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6663, "&Tau != &Work");
}

void sub_1003F2900()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6664, "&Tau != &Q");
}

void sub_1003F2928()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6665, "&Tau != &R");
}

void sub_1003F2950()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6666, "&Work != &Q");
}

void sub_1003F2978()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6667, "&Work != &R");
}

void sub_1003F29A0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6668, "&Q != &R");
}

void sub_1003F29C8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6671, "Q.max_num_rows_ >= A.num_rows_");
}

void sub_1003F29F0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6672, "Q.max_num_rows_ >= A.num_cols_");
}

void sub_1003F2A18()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6673, "Q.max_num_cols_ >= A.num_rows_");
}

void sub_1003F2A40()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6674, "Q.max_num_cols_ >= A.num_cols_");
}

void sub_1003F2A68()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6675, "R.max_num_rows_ >= A.num_rows_");
}

void sub_1003F2A90()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6676, "R.max_num_cols_ >= A.num_cols_");
}

void sub_1003F2AB8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6679, "Tau.max_num_rows_ >= A.num_rows_");
}

void sub_1003F2AE0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6685, "Work.max_num_rows_ >= A.num_cols_");
}

void sub_1003F2B08()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6686, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_1003F2B30()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6769, "info == 0");
}

void sub_1003F2B58()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6725, "info == 0");
}

void sub_1003F2B80()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6683, "Tau.max_num_rows_ >= A.num_cols_");
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

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
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

id objc_msgSend_AONSENSE_FRAMEWORK_AVAILABLE(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AONSENSE_FRAMEWORK_AVAILABLE");
}

id objc_msgSend_AntennaDiversityOverrideToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AntennaDiversityOverrideToString:");
}

id objc_msgSend_DataCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DataCallback:");
}

id objc_msgSend_ErrorCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ErrorCallback:");
}

id objc_msgSend_NINearbyObjectUpdateRateToShortString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NINearbyObjectUpdateRateToShortString:");
}

id objc_msgSend_NINearbyObjectUpdateRateToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NINearbyObjectUpdateRateToString:");
}

id objc_msgSend_NIRelationshipSpecifierToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NIRelationshipSpecifierToString:");
}

id objc_msgSend_NISessionBackgroundModeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NISessionBackgroundModeToString:");
}

id objc_msgSend_NISystemPassiveAccessIntentToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NISystemPassiveAccessIntentToString:");
}

id objc_msgSend_NISystemResourceAvailabilityToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NISystemResourceAvailabilityToString:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDWithString:");
}

id objc_msgSend__NIDevicePresenceMonitoringOptionToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_NIDevicePresenceMonitoringOptionToString:");
}

id objc_msgSend__acquireClientAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acquireClientAssertionIfNecessary");
}

id objc_msgSend__activateAssertionsWhileFindable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateAssertionsWhileFindable");
}

id objc_msgSend__activateAssertionsWhileInteracting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateAssertionsWhileInteracting");
}

id objc_msgSend__activateBluetoothResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateBluetoothResource");
}

id objc_msgSend__activateProvidersLazy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateProvidersLazy");
}

id objc_msgSend__activateSensors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateSensors");
}

id objc_msgSend__addAlgorithmOutputFlagsToPeerTrackingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAlgorithmOutputFlagsToPeerTrackingState:");
}

id objc_msgSend__addObject_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addObject:reply:");
}

id objc_msgSend__addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addObserver:");
}

id objc_msgSend__addPeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPeers:");
}

id objc_msgSend__adjustDutyCycleForInterfaceDelays_schedulingInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustDutyCycleForInterfaceDelays:schedulingInterval:");
}

id objc_msgSend__advertiseAndRangeWithPeer_peerAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_advertiseAndRangeWithPeer:peerAdvertisement:");
}

id objc_msgSend__advertisementCacheEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_advertisementCacheEnabled");
}

id objc_msgSend__algorithmSourceToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_algorithmSourceToString:");
}

id objc_msgSend__aopJobConfigWithTimeouts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aopJobConfigWithTimeouts");
}

id objc_msgSend__armMutualAuthTimerForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_armMutualAuthTimerForFinder:");
}

id objc_msgSend__assignDebugParametersIfAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assignDebugParametersIfAvailable:");
}

id objc_msgSend__augmentDiscoveryToken_withHomeAnchorVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentDiscoveryToken:withHomeAnchorVariant:");
}

id objc_msgSend__augmentDiscoveryTokenWithDeviceCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentDiscoveryTokenWithDeviceCapabilities:");
}

id objc_msgSend__augmentDiscoveryTokenWithNbUwbAcquisitionChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:");
}

id objc_msgSend__biasCorrectionRequirementFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_biasCorrectionRequirementFromDiscoveryToken:");
}

id objc_msgSend__biasCorrectionRequirementFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_biasCorrectionRequirementFromModelString:");
}

id objc_msgSend__buildAlishaSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildAlishaSession:");
}

id objc_msgSend__buildAndRunRangingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildAndRunRangingSession:");
}

id objc_msgSend__buildNbammsSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildNbammsSession:");
}

id objc_msgSend__buildRoseSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildRoseSession:");
}

id objc_msgSend__buildWifiSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildWifiSession");
}

id objc_msgSend__calculateAndLogErrorsFromIODeltaP_vioDeltaP_vioPos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateAndLogErrorsFromIODeltaP:vioDeltaP:vioPos:");
}

id objc_msgSend__calculateErrorStatsFromVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateErrorStatsFromVector:");
}

id objc_msgSend__calculateIOMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateIOMetrics:");
}

id objc_msgSend__calculateMagneticFieldBias(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateMagneticFieldBias");
}

id objc_msgSend__calculateStraightLineDistance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateStraightLineDistance");
}

id objc_msgSend__cancelScanRateAdjustmentTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelScanRateAdjustmentTimer");
}

id objc_msgSend__cancelStateTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelStateTimer");
}

id objc_msgSend__cbAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbAdvertisingAddress");
}

id objc_msgSend__cbAdvertisingAddressChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbAdvertisingAddressChanged");
}

id objc_msgSend__cbAdvertisingAddressChangedHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbAdvertisingAddressChangedHandler");
}

id objc_msgSend__cbBluetoothStateChangedHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbBluetoothStateChangedHandler");
}

id objc_msgSend__cbDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbDeviceFoundHandler:");
}

id objc_msgSend__cbErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbErrorHandler:");
}

id objc_msgSend__cbInterruptionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cbInterruptionHandler");
}

id objc_msgSend__changeSessionAuthStateTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeSessionAuthStateTo:");
}

id objc_msgSend__checkAndExerciseAuthorizationForBundleID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndExerciseAuthorizationForBundleID:error:");
}

id objc_msgSend__cleanupExcessiveDetachedPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanupExcessiveDetachedPeers");
}

id objc_msgSend__cleanupExcessiveDetachedSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanupExcessiveDetachedSessions");
}

id objc_msgSend__cleanupStaleObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanupStaleObservers");
}

id objc_msgSend__configureAdvertisementOOBRefreshTimerForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAdvertisementOOBRefreshTimerForToken:");
}

id objc_msgSend__configureAdvertisementTimeout_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAdvertisementTimeout:forToken:");
}

id objc_msgSend__configureAdvertiserForType_toPeer_withAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAdvertiserForType:toPeer:withAdvertisement:");
}

id objc_msgSend__configureAndRunInternalARSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAndRunInternalARSession");
}

id objc_msgSend__configureCBSpatialSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureCBSpatialSession");
}

id objc_msgSend__configureDiscoveryTimeout_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureDiscoveryTimeout:forToken:");
}

id objc_msgSend__configureForLabTestModeSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureForLabTestModeSession");
}

id objc_msgSend__configureForOwnerDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureForOwnerDevice");
}

id objc_msgSend__configureForPassthroughSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureForPassthroughSession");
}

id objc_msgSend__configureForRegionMonitoring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureForRegionMonitoring:");
}

id objc_msgSend__configureKeepAliveTimeoutForPeer_useCase_isKeepAliveBluetooth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:");
}

id objc_msgSend__configureNearbyActionNoWakeAdvertiserWithPeer_advertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:");
}

id objc_msgSend__configureNearbyActionNoWakeScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureNearbyActionNoWakeScannerAndRequestScan:");
}

id objc_msgSend__configureRangeBiasEstimator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureRangeBiasEstimator");
}

id objc_msgSend__configureSpatialInteractionAdvertiserWithPeer_advertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureSpatialInteractionAdvertiserWithPeer:advertisement:");
}

id objc_msgSend__configureSpatialInteractionScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureSpatialInteractionScannerAndRequestScan:");
}

id objc_msgSend__connectToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectToPeer:");
}

id objc_msgSend__consolidateInputToMLModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_consolidateInputToMLModel:");
}

id objc_msgSend__convertFromPointingCoordinatesToSpatial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertFromPointingCoordinatesToSpatial:");
}

id objc_msgSend__createDeviceFinderAlgoContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDeviceFinderAlgoContainer");
}

id objc_msgSend__createFindeeAlgoContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createFindeeAlgoContainer");
}

id objc_msgSend__createPeerFindingAlgoContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createPeerFindingAlgoContainer");
}

id objc_msgSend__createPeopleFinderAlgoContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createPeopleFinderAlgoContainer");
}

id objc_msgSend__createSyntheticApertureAlgoContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSyntheticApertureAlgoContainer");
}

id objc_msgSend__deactivateAssertionsWhileFindable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deactivateAssertionsWhileFindable");
}

id objc_msgSend__deactivateAssertionsWhileInteracting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deactivateAssertionsWhileInteracting");
}

id objc_msgSend__deactivateSensors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deactivateSensors");
}

id objc_msgSend__decrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_decrypt:");
}

id objc_msgSend__deltaDistanceFromVIOPoses::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deltaDistanceFromVIOPoses::");
}

id objc_msgSend__deriveSessionKeyFromKeyDerivationKey_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deriveSessionKeyFromKeyDerivationKey:sessionIdentifier:");
}

id objc_msgSend__disableAllServicesAndSendHangupSignal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableAllServicesAndSendHangupSignal:");
}

id objc_msgSend__disableInteractionAndKeepPersistedTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableInteractionAndKeepPersistedTokens");
}

id objc_msgSend__disableWiFiAndReturnError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableWiFiAndReturnError");
}

id objc_msgSend__displayPermissionsPromptIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_displayPermissionsPromptIfNeeded");
}

id objc_msgSend__doesClientWantFinderObserverSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doesClientWantFinderObserverSession");
}

id objc_msgSend__doesWantTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doesWantTriggeredDutyCycledAcquisition");
}

id objc_msgSend__dumpInterruptionsMapWithDebugString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dumpInterruptionsMapWithDebugString:");
}

id objc_msgSend__enableInteractionWithPersistedTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableInteractionWithPersistedTokens");
}

id objc_msgSend__encodeSignallingDataInMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodeSignallingDataInMessageID:");
}

id objc_msgSend__encrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encrypt:");
}

id objc_msgSend__encryptAndUpdateAidingAndSignallingPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encryptAndUpdateAidingAndSignallingPayload");
}

id objc_msgSend__encryptAndUpdateMutualAuthPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encryptAndUpdateMutualAuthPayload");
}

id objc_msgSend__executeActivationPendingOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeActivationPendingOperations");
}

id objc_msgSend__fatalErrorForUwbServiceState_cause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fatalErrorForUwbServiceState:cause:");
}

id objc_msgSend__finalizeRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finalizeRunning");
}

id objc_msgSend__finderTimeFromFirstPoseTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finderTimeFromFirstPoseTo:");
}

id objc_msgSend__flagsFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flagsFromDiscoveryToken:");
}

id objc_msgSend__generateUwbSessionIdForNewServiceClientWithProcessName_parsedAccessoryConfigData_debugParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateUwbSessionIdForNewServiceClientWithProcessName:parsedAccessoryConfigData:debugParameters:");
}

id objc_msgSend__getAdvertisementFromCBDevice_advertisementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAdvertisementFromCBDevice:advertisementType:");
}

id objc_msgSend__getAuthenticatedFinderFindeeClients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAuthenticatedFinderFindeeClients");
}

id objc_msgSend__getCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCapabilities");
}

id objc_msgSend__getCommonConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCommonConfiguration");
}

id objc_msgSend__getDefaultNbammsRangingConfigParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDefaultNbammsRangingConfigParameters");
}

id objc_msgSend__getDiscoveryTokenFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDiscoveryTokenFlags");
}

id objc_msgSend__getDiscoveryTokenFromCBDevice_advertisementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDiscoveryTokenFromCBDevice:advertisementType:");
}

id objc_msgSend__getDitherConst(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDitherConst");
}

id objc_msgSend__getDutyCycleForTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDutyCycleForTriggeredDutyCycledAcquisition");
}

id objc_msgSend__getExpandedCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getExpandedCapabilities");
}

id objc_msgSend__getFindeeAlgorithmConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getFindeeAlgorithmConfig");
}

id objc_msgSend__getFindingSecondarySchedulingParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getFindingSecondarySchedulingParameters");
}

id objc_msgSend__getNbUwbAcquisitionBandChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNbUwbAcquisitionBandChannel:");
}

id objc_msgSend__getPeopleFinderAlgorithmConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getPeopleFinderAlgorithmConfig");
}

id objc_msgSend__getPeopleFinderAlgorithmConfigForPeerSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getPeopleFinderAlgorithmConfigForPeerSessions");
}

id objc_msgSend__getRangeUncertaintyWhenBiasEstimateNotAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRangeUncertaintyWhenBiasEstimateNotAvailable");
}

id objc_msgSend__getRangingAcquisitionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRangingAcquisitionType");
}

id objc_msgSend__getRangingTimeoutWithKey_timeoutIfNoOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRangingTimeoutWithKey:timeoutIfNoOverride:");
}

id objc_msgSend__getRangingTriggerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRangingTriggerType");
}

id objc_msgSend__getSchedulingIntervalForTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
}

id objc_msgSend__getSecondarySchedulingParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSecondarySchedulingParameters");
}

id objc_msgSend__getSessionFailureError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSessionFailureError");
}

id objc_msgSend__getState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getState");
}

id objc_msgSend__handleARSession_willRunWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleARSession:willRunWithConfiguration:");
}

id objc_msgSend__handleARSessionInterruptionEnded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleARSessionInterruptionEnded");
}

id objc_msgSend__handleActivationError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActivationError:");
}

id objc_msgSend__handleActivationSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActivationSuccess:");
}

id objc_msgSend__handleBluetoothBecameAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBluetoothBecameAvailable");
}

id objc_msgSend__handleBluetoothBecameUnavailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBluetoothBecameUnavailable");
}

id objc_msgSend__handleBoundedRegionRange_forDevice_rangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBoundedRegionRange:forDevice:rangeResult:");
}

id objc_msgSend__handleCryptoFailure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCryptoFailure");
}

id objc_msgSend__handleDeviceMonitorActivation_forDevice_timestamp_regionSizeCategory_regions_predictorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDeviceMonitorActivation:forDevice:timestamp:regionSizeCategory:regions:predictorType:");
}

id objc_msgSend__handleFailedToAddPeer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFailedToAddPeer");
}

id objc_msgSend__handleInitiatorRangingBlockUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleInitiatorRangingBlockUpdate:");
}

id objc_msgSend__handleNonMutualAuthMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNonMutualAuthMessage");
}

id objc_msgSend__handleObserverSessionXPCDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleObserverSessionXPCDisconnection:");
}

id objc_msgSend__handlePauseSessionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePauseSessionError:");
}

id objc_msgSend__handlePauseSessionSuccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePauseSessionSuccess");
}

id objc_msgSend__handleRangeAndAoASolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRangeAndAoASolution:");
}

id objc_msgSend__handleRangeOnlySolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRangeOnlySolution:");
}

id objc_msgSend__handleRangingTerminatedCallbackForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRangingTerminatedCallbackForPeer:");
}

id objc_msgSend__handleRegionChangeForDevice_currentRegion_prevRegion_timestamp_rangeResult_intentPrediction_regionTransitionSuppressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRegionChangeForDevice:currentRegion:prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:");
}

id objc_msgSend__handleRunSessionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRunSessionError:");
}

id objc_msgSend__handleRunSessionSuccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRunSessionSuccess");
}

id objc_msgSend__handleSessionBackgroundContinuationAuth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSessionBackgroundContinuationAuth:");
}

id objc_msgSend__handleSessionStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSessionStats:");
}

id objc_msgSend__handleSpecializedSessionBackgroundSupportUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSpecializedSessionBackgroundSupportUpdate:");
}

id objc_msgSend__handleSpecializedSessionInvalidation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSpecializedSessionInvalidation:");
}

id objc_msgSend__handleWifiRangingAvailableUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWifiRangingAvailableUpdate:");
}

id objc_msgSend__handleXPCDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleXPCDisconnection:");
}

id objc_msgSend__homeAnchorVariantFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeAnchorVariantFromDiscoveryToken:");
}

id objc_msgSend__identifyingSequenceFromBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifyingSequenceFromBytes:");
}

id objc_msgSend__initAndConnectToServerWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initAndConnectToServerWithOptions:");
}

id objc_msgSend__initInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initInternal");
}

id objc_msgSend__initInternalWithConfigType_isFinder_isObserver_specifiedToken_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:");
}

id objc_msgSend__initLowPowerModeListner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initLowPowerModeListner");
}

id objc_msgSend__initPrivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initPrivate");
}

id objc_msgSend__initializeEncryptionSessionIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeEncryptionSessionIfNecessary");
}

id objc_msgSend__intentPredictorConfigFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intentPredictorConfigFromDiscoveryToken:");
}

id objc_msgSend__intentPredictorConfigFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intentPredictorConfigFromModelString:");
}

id objc_msgSend__internalBuildShouldDenyConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalBuildShouldDenyConnection");
}

id objc_msgSend__internalIsCameraAssistanceEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalIsCameraAssistanceEnabled");
}

id objc_msgSend__internalIsCameraAssistanceInClientProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalIsCameraAssistanceInClientProcess");
}

id objc_msgSend__internalIsExtendedDistanceMeasurementEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalIsExtendedDistanceMeasurementEnabled");
}

id objc_msgSend__internalPrepareTokenCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalPrepareTokenCache");
}

id objc_msgSend__internalPrintableState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalPrintableState");
}

id objc_msgSend__internalReadItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalReadItemWithService:account:synchronizable:systemKeychain:");
}

id objc_msgSend__internalSetFindableDiscoveryTokens_tokenGroup_logInEventBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalSetFindableDiscoveryTokens:tokenGroup:logInEventBuffer:");
}

id objc_msgSend__interruptSessionWithInternalReason_cachedInterruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interruptSessionWithInternalReason:cachedInterruption:");
}

id objc_msgSend__interruptionsMapAsString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interruptionsMapAsString");
}

id objc_msgSend__invalidateInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateInternal");
}

id objc_msgSend__invalidateInternalARSessionIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateInternalARSessionIfNeeded");
}

id objc_msgSend__invalidateSessionAndNotifyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateSessionAndNotifyError:");
}

id objc_msgSend__isAnyClientRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAnyClientRunning");
}

id objc_msgSend__isClientInternalTool(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isClientInternalTool");
}

id objc_msgSend__isClientOnGeneralEntitlementAllowlist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isClientOnGeneralEntitlementAllowlist");
}

id objc_msgSend__isClientOnSystemShutdownAllowlist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isClientOnSystemShutdownAllowlist");
}

id objc_msgSend__isCryptoDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCryptoDisabled");
}

id objc_msgSend__isInternalClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isInternalClient");
}

id objc_msgSend__isListener_backgroundAuthorizedForPeer_useCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isListener:backgroundAuthorizedForPeer:useCache:");
}

id objc_msgSend__isPDRAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPDRAvailable:");
}

id objc_msgSend__isReciprocalFindingPossibleRoleIsFinder_rangingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isReciprocalFindingPossibleRoleIsFinder:rangingSession:");
}

id objc_msgSend__isSemiStaticFromVIO_::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSemiStaticFromVIO:::");
}

id objc_msgSend__isTokenFindable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTokenFindable:");
}

id objc_msgSend__isValidARSession_andConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidARSession:andConfiguration:");
}

id objc_msgSend__isWifiRangingAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isWifiRangingAllowed");
}

id objc_msgSend__kickKeepAliveForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kickKeepAliveForPeer:");
}

id objc_msgSend__localDeviceLogger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localDeviceLogger");
}

id objc_msgSend__logDurationAndSubmit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logDurationAndSubmit:");
}

id objc_msgSend__logSessionSummary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logSessionSummary");
}

id objc_msgSend__logStatisticsIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logStatisticsIfNecessary");
}

id objc_msgSend__logSuccessfulRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logSuccessfulRange:");
}

id objc_msgSend__logTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logTime");
}

id objc_msgSend__logUnsuccessfulRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logUnsuccessfulRange");
}

id objc_msgSend__longRangeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_longRangeEnabled");
}

id objc_msgSend__macAddressForIRK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_macAddressForIRK:");
}

id objc_msgSend__magneticFieldStrengthCheckOptionFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_magneticFieldStrengthCheckOptionFromDiscoveryToken:");
}

id objc_msgSend__magneticFieldStrengthCheckOptionFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_magneticFieldStrengthCheckOptionFromModelString:");
}

id objc_msgSend__nearbyActionNoWakeDisableScanDupesIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbyActionNoWakeDisableScanDupesIfNecessary");
}

id objc_msgSend__nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers");
}

id objc_msgSend__nearbydLogRange_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbydLogRange:token:");
}

id objc_msgSend__niFrameworkBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_niFrameworkBundle");
}

id objc_msgSend__niLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_niLocalizedStringFromFrameworkBundleWithKey:");
}

id objc_msgSend__notifyDidInvalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyDidInvalidateWithError:");
}

id objc_msgSend__notifyPeerRemoval_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyPeerRemoval:withReason:");
}

id objc_msgSend__onVIOReset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onVIOReset");
}

id objc_msgSend__osLogNearbyObjectUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_osLogNearbyObjectUpdate:");
}

id objc_msgSend__ownerDeviceServiceRequestDebugParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ownerDeviceServiceRequestDebugParams:");
}

id objc_msgSend__parseData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseData:");
}

id objc_msgSend__passthroughSessionServiceRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passthroughSessionServiceRequest:");
}

id objc_msgSend__pauseInternalARSessionIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pauseInternalARSessionIfNeeded");
}

id objc_msgSend__pauseOwnerSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pauseOwnerSession");
}

id objc_msgSend__pausePassthroughOrLabTestModeSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pausePassthroughOrLabTestModeSession");
}

id objc_msgSend__pauseServiceDueToClientTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pauseServiceDueToClientTimeout:");
}

id objc_msgSend__pauseWifiRanging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pauseWifiRanging");
}

id objc_msgSend__peer_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peer:didFailWithError:");
}

id objc_msgSend__peerHungUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peerHungUp:");
}

id objc_msgSend__peerIndexReferenceForAdvertisementType_outPeers_outAdvertisements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:");
}

id objc_msgSend__peerSupportsLongRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peerSupportsLongRange");
}

id objc_msgSend__performBlockOnDelegateQueue_ifRespondsToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlockOnDelegateQueue:ifRespondsToSelector:");
}

id objc_msgSend__populateClientEntitlements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_populateClientEntitlements");
}

id objc_msgSend__prepareNbammsServiceRequestForDiscoveryToken_technology_useCase_nbMask_nbUwbAcquisitionBandChannel_mmsSlotSizeMsec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:");
}

id objc_msgSend__prepareServiceRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareServiceRequest");
}

id objc_msgSend__prepareServiceRequestForDiscoveryToken_nbUwbAcquisitionBandChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:");
}

id objc_msgSend__prepareServiceRequestForDiscoveryToken_technology_useCase_nbMask_nbUwbAcquisitionBandChannel_mmsSlotSizeMsec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:");
}

id objc_msgSend__prepareServiceRequestWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareServiceRequestWithConfig:");
}

id objc_msgSend__prepareUwbSessionTrackingObjectsForClientTracking_outServiceRequest_outStartOptions_outShareableConfigData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareUwbSessionTrackingObjectsForClientTracking:outServiceRequest:outStartOptions:outShareableConfigData:");
}

id objc_msgSend__prepareUwbSessionTrackingObjectsFromDebugParameters_outServiceRequest_outStartOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:");
}

id objc_msgSend__printStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_printStats");
}

id objc_msgSend__process_didTerminate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_process:didTerminate:");
}

id objc_msgSend__process_didUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_process:didUpdateState:");
}

id objc_msgSend__processBluetoothSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processBluetoothSample:");
}

id objc_msgSend__processCarKeyEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCarKeyEvent:");
}

id objc_msgSend__processCarKeyEvent_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCarKeyEvent:reply:");
}

id objc_msgSend__processCommonConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCommonConfiguration");
}

id objc_msgSend__processFindingEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processFindingEvent:");
}

id objc_msgSend__processFindingEvent_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processFindingEvent:reply:");
}

id objc_msgSend__processNonMutualAuthMessageForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processNonMutualAuthMessageForFinder:");
}

id objc_msgSend__processPeerMessage_machAbsTimestamp_wasEncrypted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processPeerMessage:machAbsTimestamp:wasEncrypted:");
}

id objc_msgSend__processPeerMutualAuthState_peerIsFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processPeerMutualAuthState:peerIsFinder:");
}

id objc_msgSend__processReceivedAdvertisement_fromPeer_overBluetooth_cbDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:");
}

id objc_msgSend__processSystemEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processSystemEvent:");
}

id objc_msgSend__processSystemEvent_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processSystemEvent:reply:");
}

id objc_msgSend__processUpdatedCommonConfigurationIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processUpdatedCommonConfigurationIfNecessary");
}

id objc_msgSend__provideTruthTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_provideTruthTag:");
}

id objc_msgSend__queryAndCacheCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryAndCacheCapabilities");
}

id objc_msgSend__queryNumPairedFinderWatches_r121951698(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryNumPairedFinderWatches_r121951698");
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue");
}

id objc_msgSend__radiusFromDevicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_radiusFromDevicePresencePreset:");
}

id objc_msgSend__receivedAidingAndSignallingMessage_machAbsTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedAidingAndSignallingMessage:machAbsTimestamp:");
}

id objc_msgSend__receivedCryptoSessionConfigMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedCryptoSessionConfigMessage:");
}

id objc_msgSend__receivedMutualAuthMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedMutualAuthMessage:");
}

id objc_msgSend__regionCategoryFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionCategoryFromDiscoveryToken:");
}

id objc_msgSend__regionCategoryFromModelString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionCategoryFromModelString:");
}

id objc_msgSend__registerObserverSessionWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerObserverSessionWithConnection:");
}

id objc_msgSend__registerSessionWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerSessionWithConnection:");
}

id objc_msgSend__reinterruptSessionWithCachedInterruption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reinterruptSessionWithCachedInterruption");
}

id objc_msgSend__relayBlockToClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayBlockToClients:");
}

id objc_msgSend__relayDCKMessageInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayDCKMessageInternal:");
}

id objc_msgSend__relayToClientsOfUWBSessionId_blockToRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayToClientsOfUWBSessionId:blockToRelay:");
}

id objc_msgSend__remoteObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteObject");
}

id objc_msgSend__removeAlgorithmOutputFlagsFromPeerTrackingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAlgorithmOutputFlagsFromPeerTrackingState:");
}

id objc_msgSend__removeAllPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAllPeers");
}

id objc_msgSend__removeObject_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeObject:reply:");
}

id objc_msgSend__removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeObserver:");
}

id objc_msgSend__removePeerObject_uwbIdentifier_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePeerObject:uwbIdentifier:withReason:");
}

id objc_msgSend__removePeerObject_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePeerObject:withReason:");
}

id objc_msgSend__reportMutualAuthStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportMutualAuthStates");
}

id objc_msgSend__resetAdvertiserForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetAdvertiserForType:");
}

id objc_msgSend__resetAdvertisingStateForAllPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetAdvertisingStateForAllPeers");
}

id objc_msgSend__resetCryptoStateIncludingFailures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetCryptoStateIncludingFailures:");
}

id objc_msgSend__resetDiscoveryStateForAllPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetDiscoveryStateForAllPeers");
}

id objc_msgSend__resetDiscoveryStateForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetDiscoveryStateForPeer:");
}

id objc_msgSend__resetRangingStateForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetRangingStateForToken:");
}

id objc_msgSend__resetServiceStateForOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetServiceStateForOperation:");
}

id objc_msgSend__resetSessionStateForOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetSessionStateForOperation:");
}

id objc_msgSend__resetStatistics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetStatistics");
}

id objc_msgSend__resetUpdatesEngine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetUpdatesEngine");
}

id objc_msgSend__resumeWifiRanging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resumeWifiRanging");
}

id objc_msgSend__reverse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reverse");
}

id objc_msgSend__roseMotionStateToNIMotionActivityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_roseMotionStateToNIMotionActivityState:");
}

id objc_msgSend__roseSession_didChangeRangingUpdateRate_newThrottleRate_prevThrottleRate_effectiveSinceCycleInde_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_roseSession:didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:");
}

id objc_msgSend__roseSession_invalidatedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_roseSession:invalidatedWithReason:");
}

id objc_msgSend__roundRobinTimerHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_roundRobinTimerHandler");
}

id objc_msgSend__runLabTestModeSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runLabTestModeSession");
}

id objc_msgSend__runOwnerSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runOwnerSession");
}

id objc_msgSend__runPassthroughSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPassthroughSession");
}

id objc_msgSend__selectedTechnology(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectedTechnology");
}

id objc_msgSend__sendAnalyticsOnRangingComplete_suspendReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendAnalyticsOnRangingComplete:suspendReason:");
}

id objc_msgSend__sendHangup_finderGone_findeeGone_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendHangup:finderGone:findeeGone:token:");
}

id objc_msgSend__sendHangupSignalForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendHangupSignalForSession:");
}

id objc_msgSend__sendTimeTupleToAlgorithms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendTimeTupleToAlgorithms");
}

id objc_msgSend__serverConnectionInterrupted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverConnectionInterrupted");
}

id objc_msgSend__serverConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverConnectionInvalidated");
}

id objc_msgSend__sessionConfiguredToRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionConfiguredToRange");
}

id objc_msgSend__sessionStoppedWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionStoppedWithTimestamp:");
}

id objc_msgSend__setARSessionInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setARSessionInternal:");
}

id objc_msgSend__setAdditionalXPCActivityProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAdditionalXPCActivityProperties:");
}

id objc_msgSend__setContainerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerState:");
}

id objc_msgSend__setDebugURSK_transactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDebugURSK:transactionIdentifier:");
}

id objc_msgSend__setDebugURSK_transactionIdentifier_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDebugURSK:transactionIdentifier:reply:");
}

id objc_msgSend__setInitiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInitiator");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setReadValidateDefaultsWriteForTypeOfPredictor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setReadValidateDefaultsWriteForTypeOfPredictor");
}

id objc_msgSend__setTokenCacheForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTokenCacheForGroup:");
}

id objc_msgSend__setURSKTTL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setURSKTTL:");
}

id objc_msgSend__setURSKTTL_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setURSKTTL:reply:");
}

id objc_msgSend__setUpARSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUpARSession");
}

id objc_msgSend__setUpAlgorithmsContainerForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUpAlgorithmsContainerForToken:");
}

id objc_msgSend__shouldApplyBTScanMitigation_r121951698(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldApplyBTScanMitigation_r121951698");
}

id objc_msgSend__shouldBypassBluetoothDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldBypassBluetoothDiscovery");
}

id objc_msgSend__shouldConsumeRoseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldConsumeRoseSolution:");
}

id objc_msgSend__shouldEncodeSignallingDataInMessageID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldEncodeSignallingDataInMessageID");
}

id objc_msgSend__shouldHoldOSTransactionWhileFindable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldHoldOSTransactionWhileFindable");
}

id objc_msgSend__shouldInteract(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldInteract");
}

id objc_msgSend__shouldLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldLog");
}

id objc_msgSend__shouldRespondToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldRespondToDevice:");
}

id objc_msgSend__shouldSendMutualAuthMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSendMutualAuthMessage");
}

id objc_msgSend__shouldUseFinderToken_findeeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUseFinderToken:findeeToken:");
}

id objc_msgSend__startAltitudeUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startAltitudeUpdates");
}

id objc_msgSend__startDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDeviceMotionUpdates");
}

id objc_msgSend__startDevicePDRUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDevicePDRUpdates");
}

id objc_msgSend__startMonitoringPeersActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startMonitoringPeersActivity:");
}

id objc_msgSend__startMotionActivityUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startMotionActivityUpdates");
}

id objc_msgSend__startObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startObserving:");
}

id objc_msgSend__startOrUpdateAdvertising(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startOrUpdateAdvertising");
}

id objc_msgSend__startPedometerDataUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startPedometerDataUpdates");
}

id objc_msgSend__startPedometerEventUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startPedometerEventUpdates");
}

id objc_msgSend__startRoundRobinTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startRoundRobinTimer");
}

id objc_msgSend__startRunawayFindingBackstopTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startRunawayFindingBackstopTimer");
}

id objc_msgSend__startService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startService");
}

id objc_msgSend__startStateTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startStateTimer:");
}

id objc_msgSend__stateTimerExpired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stateTimerExpired");
}

id objc_msgSend__stopObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopObserving:");
}

id objc_msgSend__stopRoundRobinTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopRoundRobinTimer");
}

id objc_msgSend__stopWiFiSessionsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopWiFiSessionsWithReason:");
}

id objc_msgSend__submitErrorMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitErrorMetric:");
}

id objc_msgSend__submitFindingSessionEndStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitFindingSessionEndStats");
}

id objc_msgSend__supportedPlatform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportedPlatform");
}

id objc_msgSend__supportedPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportedPlatform:");
}

id objc_msgSend__synchronousRemoteObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronousRemoteObject");
}

id objc_msgSend__tearDownARSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tearDownARSession");
}

id objc_msgSend__tearDownAlgorithmsContainerForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tearDownAlgorithmsContainerForToken:");
}

id objc_msgSend__tokensFromAllGroups(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tokensFromAllGroups");
}

id objc_msgSend__totalPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_totalPeers");
}

id objc_msgSend__triggerInitiatorRanging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerInitiatorRanging");
}

id objc_msgSend__triggerRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerRanging:");
}

id objc_msgSend__triggerRanging_peerDiscoveryToken_technology_sharedProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerRanging:peerDiscoveryToken:technology:sharedProtocol:");
}

id objc_msgSend__triggerResponderRangingForSession_initiatorDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerResponderRangingForSession:initiatorDevice:");
}

id objc_msgSend__triggerWiFiRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerWiFiRanging:");
}

id objc_msgSend__tryToStartRangingWithPeerAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tryToStartRangingWithPeerAdvertisement:");
}

id objc_msgSend__unitTest1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unitTest1");
}

id objc_msgSend__unitTest2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unitTest2");
}

id objc_msgSend__updateAdvertisementAfterActivationForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAdvertisementAfterActivationForType:");
}

id objc_msgSend__updateAggregatedClientInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAggregatedClientInfo");
}

id objc_msgSend__updateAlignedPDRMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAlignedPDRMetrics:");
}

id objc_msgSend__updateAnalyticsAboutRangingRateForDevice_responseSkipRatio_cycleRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnalyticsAboutRangingRateForDevice:responseSkipRatio:cycleRate:");
}

id objc_msgSend__updateAnalyticsWithFailedRangingRequestToken_isFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnalyticsWithFailedRangingRequestToken:isFinder:");
}

id objc_msgSend__updateAnalyticsWithSuccessfulRangingRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnalyticsWithSuccessfulRangingRequest");
}

id objc_msgSend__updateClientAppVisibilityInterruption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateClientAppVisibilityInterruption");
}

id objc_msgSend__updateCryptoSessionConfigPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCryptoSessionConfigPayload");
}

id objc_msgSend__updateInterruptionForUWBServiceState_cause_requiresNarrowBand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterruptionForUWBServiceState:cause:requiresNarrowBand:");
}

id objc_msgSend__updateInterruptionForUWBSystemError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterruptionForUWBSystemError");
}

id objc_msgSend__updateInterruptionForUWBSystemOffWithCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterruptionForUWBSystemOffWithCause:");
}

id objc_msgSend__updateInterruptionForUWBSystemReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterruptionForUWBSystemReady");
}

id objc_msgSend__updateLaunchOnDemandScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLaunchOnDemandScannerAndRequestScan:");
}

id objc_msgSend__updateMinMaxRangeAndRSSI_uwbRSSI_nbRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:");
}

id objc_msgSend__updatePeerTrackingAdvertisingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingAdvertisingState:");
}

id objc_msgSend__updatePeerTrackingClientWantsUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingClientWantsUpdates:");
}

id objc_msgSend__updatePeerTrackingDiscoveryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingDiscoveryState:");
}

id objc_msgSend__updatePeerTrackingForToken_newAdvertisingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newAdvertisingState:");
}

id objc_msgSend__updatePeerTrackingForToken_newDiscoveryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newDiscoveryState:");
}

id objc_msgSend__updatePeerTrackingForToken_newNbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newNbUwbAcquisitionChannelIdx:");
}

id objc_msgSend__updatePeerTrackingForToken_newRangingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newRangingState:");
}

id objc_msgSend__updatePeerTrackingForToken_newTrackingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingForToken:newTrackingState:");
}

id objc_msgSend__updatePeerTrackingOverallState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingOverallState:");
}

id objc_msgSend__updatePeerTrackingRangingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePeerTrackingRangingState:");
}

id objc_msgSend__updateReceivedSignalFlags_toPeerTrackingForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateReceivedSignalFlags:toPeerTrackingForToken:");
}

id objc_msgSend__updateRegionDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRegionDescription");
}

id objc_msgSend__updateSessionPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSessionPayload");
}

id objc_msgSend__updateUserMovedDistanceWithPose_lastPoseInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUserMovedDistanceWithPose:lastPoseInfo:");
}

id objc_msgSend__updateUwbSessionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUwbSessionState:");
}

id objc_msgSend__useCase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_useCase");
}

id objc_msgSend__validateDiscoveryTokenDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateDiscoveryTokenDict:");
}

id objc_msgSend__validateLockAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateLockAttributes");
}

id objc_msgSend__validateRegionIsPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateRegionIsPreset:");
}

id objc_msgSend__validateRegionPredicates_outer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateRegionPredicates:outer:");
}

id objc_msgSend__validateTokensAndRangingParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateTokensAndRangingParameters");
}

id objc_msgSend__verifyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyError:");
}

id objc_msgSend_acceptAltimeterData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptAltimeterData:");
}

id objc_msgSend_acceptBluetoothSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptBluetoothSample:");
}

id objc_msgSend_acceptDeviceMotion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptDeviceMotion:");
}

id objc_msgSend_acceptDeviceMotionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptDeviceMotionInput:");
}

id objc_msgSend_acceptDevicePDRInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptDevicePDRInput:");
}

id objc_msgSend_acceptDiscoveryEventForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptDiscoveryEventForPeer:");
}

id objc_msgSend_acceptGnssSatelliteData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptGnssSatelliteData:");
}

id objc_msgSend_acceptHeadingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptHeadingData:");
}

id objc_msgSend_acceptMagneticFieldStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptMagneticFieldStrength:");
}

id objc_msgSend_acceptMotionActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptMotionActivity:");
}

id objc_msgSend_acceptPedometerData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPedometerData:");
}

id objc_msgSend_acceptPedometerEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPedometerEvent:");
}

id objc_msgSend_acceptPeerData_fromPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPeerData:fromPeer:");
}

id objc_msgSend_acceptPeerDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPeerDeviceType:");
}

id objc_msgSend_acceptPeerLocationData_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPeerLocationData:forPeer:");
}

id objc_msgSend_acceptRoseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptRoseSolution:");
}

id objc_msgSend_acceptRoseSolution_withProcessingOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptRoseSolution:withProcessingOptions:");
}

id objc_msgSend_acceptSelfLocationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptSelfLocationData:");
}

id objc_msgSend_acceptUnsuccessfulRoseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptUnsuccessfulRoseSolution:");
}

id objc_msgSend_acceptVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptVisionInput:");
}

id objc_msgSend_acceptWiFiRangeResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptWiFiRangeResults:");
}

id objc_msgSend_accessWithAccessor_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessWithAccessor:forService:");
}

id objc_msgSend_accessoryConfigData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryConfigData");
}

id objc_msgSend_accessoryDiscoveryToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryDiscoveryToken");
}

id objc_msgSend_accessoryGATTServiceFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryGATTServiceFailedWithError:");
}

id objc_msgSend_accessoryNotify_isAttached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryNotify:isAttached:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_actOnRemoteObjectAndScheduleBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actOnRemoteObjectAndScheduleBarrierBlock:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate:");
}

id objc_msgSend_activateCBDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateCBDiscovery");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activateWithDelegate_delegateQueue_sessionIRK_sessionIdentifier_controlFlags_tokenFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithDelegate:delegateQueue:sessionIRK:sessionIdentifier:controlFlags:tokenFlags:");
}

id objc_msgSend_activationGuard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationGuard");
}

id objc_msgSend_activationResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationResponse");
}

id objc_msgSend_acwgRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acwgRangingLimitExceeded");
}

id objc_msgSend_addBundleNameToModelResourcePackage_andBundleDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBundleNameToModelResourcePackage:andBundleDirectory:");
}

id objc_msgSend_addClient_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClient:identifier:");
}

id objc_msgSend_addClient_identifier_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClient:identifier:configuration:");
}

id objc_msgSend_addDiscoveryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDiscoveryType:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_identifier_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:identifier:token:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObservers:");
}

id objc_msgSend_addPayloadChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPayloadChangeObserver:");
}

id objc_msgSend_addPeerDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPeerDiscoveryToken:");
}

id objc_msgSend_addPeerToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPeerToken:completion:");
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSample:");
}

id objc_msgSend_addServiceClient_identifier_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceClient:identifier:configuration:");
}

id objc_msgSend_addServiceClient_identifier_processName_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceClient:identifier:processName:configuration:");
}

id objc_msgSend_addServiceListener_withIdentifier_forBluetoothPeer_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceListener:withIdentifier:forBluetoothPeer:withConfiguration:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "address");
}

id objc_msgSend_adjustResponderThrottleRateIfNeeded_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustResponderThrottleRateIfNeeded:object:");
}

id objc_msgSend_advertiseRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertiseRate");
}

id objc_msgSend_advertisement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisement");
}

id objc_msgSend_advertisementForFinder_address_statusFlags_payload_uniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:");
}

id objc_msgSend_advertisementFromByteRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisementFromByteRepresentation:");
}

id objc_msgSend_advertisingAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisingAddress");
}

id objc_msgSend_advertisingAddressData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisingAddressData");
}

id objc_msgSend_advertisingAddressDataConnectable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisingAddressDataConnectable");
}

id objc_msgSend_advertisingAddressDataNonConnectable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisingAddressDataNonConnectable");
}

id objc_msgSend_advertisingPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisingPeers");
}

id objc_msgSend_advertisingState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisingState");
}

id objc_msgSend_aggregatedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregatedData");
}

id objc_msgSend_airPodsProxCardSampleTooOld_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPodsProxCardSampleTooOld:");
}

id objc_msgSend_airplaneModeStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airplaneModeStatus");
}

id objc_msgSend_algorithmOutputFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "algorithmOutputFlags");
}

id objc_msgSend_algorithmSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "algorithmSource");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allSamples(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allSamples");
}

id objc_msgSend_allSessionsPrintableState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allSessionsPrintableState");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowScreenOffOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowScreenOffOperation:");
}

id objc_msgSend_allowedDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedDevices");
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "altitude");
}

id objc_msgSend_ambientIntensity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ambientIntensity");
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analytics");
}

id objc_msgSend_analyticsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsManager");
}

id objc_msgSend_antennaDiversityOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "antennaDiversityOverride");
}

id objc_msgSend_antennaMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "antennaMask");
}

id objc_msgSend_appBecameNotVisibleWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appBecameNotVisibleWithTimestamp:");
}

id objc_msgSend_appBecameVisibleWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appBecameVisibleWithTimestamp:");
}

id objc_msgSend_appStateMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appStateMonitor");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyTransformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTransformation:");
}

id objc_msgSend_arSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arSession");
}

id objc_msgSend_arSessionDidFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arSessionDidFailWithError:");
}

id objc_msgSend_arSessionInterruptionEnded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arSessionInterruptionEnded");
}

id objc_msgSend_arSessionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arSessionState");
}

id objc_msgSend_arSessionWasInterrupted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arSessionWasInterrupted");
}

id objc_msgSend_arSessionWillRunWithInvalidConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arSessionWillRunWithInvalidConfiguration");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithContentsOfFile:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachedRoles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachedRoles");
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attitude");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_audioRouteToSARState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioRouteToSARState:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authorizationStatusForSession_promptUserIfUndetermined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatusForSession:promptUserIfUndetermined:");
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automotive");
}

id objc_msgSend_azimuth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "azimuth");
}

id objc_msgSend_backgroundContinuationDiscoveryTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundContinuationDiscoveryTimeout");
}

id objc_msgSend_backgroundContinuationInteractionTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundContinuationInteractionTimeout");
}

id objc_msgSend_backgroundMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundMode");
}

id objc_msgSend_beginIntervalForAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginIntervalForAccess:");
}

id objc_msgSend_biasCorrectionEstimate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "biasCorrectionEstimate");
}

id objc_msgSend_bleAdvertisementTimestampMachContinuous(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleAdvertisementTimestampMachContinuous");
}

id objc_msgSend_bleChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleChannel");
}

id objc_msgSend_bleRSSIThresholdHint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleRSSIThresholdHint");
}

id objc_msgSend_bleScanRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleScanRate");
}

id objc_msgSend_bluetoothAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothAdvertisingAddress");
}

id objc_msgSend_bluetoothAdvertisingAddressChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothAdvertisingAddressChanged");
}

id objc_msgSend_bluetoothAdvertisingAddressChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothAdvertisingAddressChanged:");
}

id objc_msgSend_bluetoothConnectionEventCounterValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothConnectionEventCounterValue");
}

id objc_msgSend_bluetoothDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothDeviceIdentifier");
}

id objc_msgSend_bluetoothDidChangeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothDidChangeState:");
}

id objc_msgSend_bluetoothDiscoveryBecameAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothDiscoveryBecameAvailable");
}

id objc_msgSend_bluetoothDiscoveryBecameUnavailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothDiscoveryBecameUnavailable");
}

id objc_msgSend_bluetoothDiscoveryFinishedActivating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothDiscoveryFinishedActivating");
}

id objc_msgSend_bluetoothPeerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothPeerIdentifier");
}

id objc_msgSend_bluetoothServiceInterrupted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothServiceInterrupted");
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothState");
}

id objc_msgSend_bluetoothStateChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothStateChanged");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boundedRegionRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundedRegionRange");
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btAddressData");
}

id objc_msgSend_btAdvAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btAdvAddress");
}

id objc_msgSend_btAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btAdvertisingAddress");
}

id objc_msgSend_btResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btResource");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleInfoValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleInfoValueForKey:");
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleName");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_byteRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "byteRepresentation");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cacheCharacteristics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheCharacteristics");
}

id objc_msgSend_cacheDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheDevice:");
}

id objc_msgSend_cachedConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedConfigCharacteristics");
}

id objc_msgSend_cachedPlatformCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedPlatformCapabilities");
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "camera");
}

id objc_msgSend_canHandleAcwgMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canHandleAcwgMsg:");
}

id objc_msgSend_canInteract(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canInteract");
}

id objc_msgSend_canRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRange");
}

id objc_msgSend_canRangeWithPeer_technology_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRangeWithPeer:technology:");
}

id objc_msgSend_canUpdateToConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canUpdateToConfiguration:");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_cancelPeripheralConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPeripheralConnection:");
}

id objc_msgSend_carKeyRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carKeyRangingLimitExceeded");
}

id objc_msgSend_cbDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cbDevice");
}

id objc_msgSend_changeConnectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeConnectionState:");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channel");
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characteristics");
}

id objc_msgSend_checkCirsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkCirsValid:");
}

id objc_msgSend_checkCurrentAudioRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkCurrentAudioRoute");
}

id objc_msgSend_checkForUnlockSinceBoot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForUnlockSinceBoot");
}

id objc_msgSend_checkInForActivityWithCriteria_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkInForActivityWithCriteria:identifier:");
}

id objc_msgSend_cirPacket1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cirPacket1");
}

id objc_msgSend_cirPacket2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cirPacket2");
}

id objc_msgSend_cleanupPowerState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupPowerState");
}

id objc_msgSend_cleanupRangingManagerAndCompanionAfterError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupRangingManagerAndCompanionAfterError:");
}

id objc_msgSend_clearLogs_forSEID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLogs:forSEID:");
}

id objc_msgSend_clearStateForPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStateForPid:");
}

id objc_msgSend_clearStateForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStateForToken:");
}

id objc_msgSend_clearWifiRangingActiveAdvertisement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearWifiRangingActiveAdvertisement");
}

id objc_msgSend_clientAuditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientAuditToken");
}

id objc_msgSend_clientConnectionQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientConnectionQueue");
}

id objc_msgSend_clientIdentifierData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIdentifierData");
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientInfo");
}

id objc_msgSend_clientIrkData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIrkData");
}

id objc_msgSend_clientPid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientPid");
}

id objc_msgSend_clientProcessNameBestGuess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientProcessNameBestGuess");
}

id objc_msgSend_clientProcessSigningIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientProcessSigningIdentity");
}

id objc_msgSend_clientQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientQueue");
}

id objc_msgSend_clientWantsUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWantsUpdates");
}

id objc_msgSend_clientWithIdentifier_notifiedPassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:notifiedPassiveAccessIntent:");
}

id objc_msgSend_clientWithIdentifier_notifiedResourceUsageLimitExceeded_forSessionConfigurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:notifiedResourceUsageLimitExceeded:forSessionConfigurationType:");
}

id objc_msgSend_clientWithIdentifier_requestedPrewarmUWB_prewarmSecureElementChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:requestedPrewarmUWB:prewarmSecureElementChannel:");
}

id objc_msgSend_clientWithIdentifier_updatedStateToRunning_dueToTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:updatedStateToRunning:dueToTimeout:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_combineAndReportLocalAndCompanionRangingRequestStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineAndReportLocalAndCompanionRangingRequestStatus");
}

id objc_msgSend_commitChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitChange");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confidence");
}

id objc_msgSend_configType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configType");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationForContainerObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationForContainerObjects");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_configurationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationType");
}

id objc_msgSend_configure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configure");
}

id objc_msgSend_configure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configure:");
}

id objc_msgSend_configureBTMaxRateScanningForPrototypeHomeSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureBTMaxRateScanningForPrototypeHomeSession");
}

id objc_msgSend_configureCBDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCBDiscovery");
}

id objc_msgSend_configureCBDiscoveryAirPodsLeech(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCBDiscoveryAirPodsLeech");
}

id objc_msgSend_configureCBDiscoveryScreenOff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCBDiscoveryScreenOff");
}

id objc_msgSend_configureCompanionForRanging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCompanionForRanging");
}

id objc_msgSend_configureRangingOnDevice_macAddress_countryCode_uwbChannel_acqPreamble_trackingPreamble_interval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureRangingOnDevice:macAddress:countryCode:uwbChannel:acqPreamble:trackingPreamble:interval:");
}

id objc_msgSend_configureWithResourceFileHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithResourceFileHandler:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connect");
}

id objc_msgSend_connectDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectDevice:");
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectPeripheral:options:");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionQueue");
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionState");
}

id objc_msgSend_consumeBluetoothSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeBluetoothSample:");
}

id objc_msgSend_consumeInputFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeInputFeatures:");
}

id objc_msgSend_consumeProtobufBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeProtobufBytes:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlFlags");
}

id objc_msgSend_convergence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convergence");
}

id objc_msgSend_convergenceStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convergenceStatus");
}

id objc_msgSend_convertCBAddressToRoseAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertCBAddressToRoseAddress:");
}

id objc_msgSend_convertToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertToString:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyCellInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCellInfo:completion:");
}

id objc_msgSend_copyLastKnownMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyLastKnownMobileCountryCode:error:");
}

id objc_msgSend_copyMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileCountryCode:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_correctedRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "correctedRange");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_course(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "course");
}

id objc_msgSend_courseAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseAccuracy");
}

id objc_msgSend_createAndPopulateBiasEstimatorInput_ofDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndPopulateBiasEstimatorInput:ofDimension:");
}

id objc_msgSend_createBeaconListenerJob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBeaconListenerJob:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createOneShotConnectionAndResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOneShotConnectionAndResume:");
}

id objc_msgSend_createServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createServices");
}

id objc_msgSend_createWithBluetoothConnectionEventCounterValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithBluetoothConnectionEventCounterValue:");
}

id objc_msgSend_currentAppState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentAppState");
}

id objc_msgSend_currentCadence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCadence");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentPace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPace");
}

id objc_msgSend_currentPeerCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPeerCount");
}

id objc_msgSend_currentPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPeers");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentServiceState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentServiceState");
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cycling");
}

id objc_msgSend_daemonJobLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonJobLabel");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataExchangeDisabledAndUsingParameterOverrides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataExchangeDisabledAndUsingParameterOverrides");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_debugDisplayInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDisplayInfo");
}

id objc_msgSend_debugOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugOptions");
}

id objc_msgSend_debugParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugParameters");
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFloatForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeMatrix4x4ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeMatrix4x4ForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decodeQuatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeQuatForKey:");
}

id objc_msgSend_decodeVector3ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeVector3ForKey:");
}

id objc_msgSend_decrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decrypt:");
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCStringEncoding");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_deinitCompanion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deinitCompanion");
}

id objc_msgSend_deinitRangingOnDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deinitRangingOnDevice:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateProxyWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateProxyWithConnection:");
}

id objc_msgSend_deleteAllItemsWithService_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllItemsWithService:synchronizable:systemKeychain:");
}

id objc_msgSend_deleteItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItemWithService:account:synchronizable:systemKeychain:");
}

id objc_msgSend_deleteURSKs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteURSKs");
}

id objc_msgSend_deleteURSKs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteURSKs:");
}

id objc_msgSend_deltaPositionX(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deltaPositionX");
}

id objc_msgSend_deltaPositionY(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deltaPositionY");
}

id objc_msgSend_deltaPositionZ(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deltaPositionZ");
}

id objc_msgSend_deltaVelocityX(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deltaVelocityX");
}

id objc_msgSend_deltaVelocityY(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deltaVelocityY");
}

id objc_msgSend_deltaVelocityZ(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deltaVelocityZ");
}

id objc_msgSend_deregisterTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterTaskWithIdentifier:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionInternal");
}

id objc_msgSend_descriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptions");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptor");
}

id objc_msgSend_deserialize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserialize:");
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationDevice");
}

id objc_msgSend_device_rediscovered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device:rediscovered:");
}

id objc_msgSend_deviceCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceCache");
}

id objc_msgSend_deviceCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceCapabilities");
}

id objc_msgSend_deviceDiscovered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDiscovered:");
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceFlags");
}

id objc_msgSend_deviceForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForIdentifier:");
}

id objc_msgSend_deviceForTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForTokenData:");
}

id objc_msgSend_deviceHasUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceHasUnlockedSinceBoot");
}

id objc_msgSend_deviceIdentifer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIdentifer");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_deviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceLost:");
}

id objc_msgSend_devicePose(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePose");
}

id objc_msgSend_devicePresencePreset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePresencePreset");
}

id objc_msgSend_devicePresenceResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePresenceResource");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAttemptRangingWithPeer_unsuccessfulSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAttemptRangingWithPeer:unsuccessfulSolution:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didConnectDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didConnectDevice:error:");
}

id objc_msgSend_didDiscoverDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDiscoverDevice:");
}

id objc_msgSend_didDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDiscoverNearbyObject:");
}

id objc_msgSend_didDiscoverPeer_advertisement_overBluetooth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDiscoverPeer:advertisement:overBluetooth:");
}

id objc_msgSend_didDiscoverSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDiscoverSample:");
}

id objc_msgSend_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailWithError:");
}

id objc_msgSend_didFailWithErrorCode_errorString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailWithErrorCode:errorString:");
}

id objc_msgSend_didFetchTxPower_fromDevice_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchTxPower:fromDevice:withError:");
}

id objc_msgSend_didFinishActivatingWithDiscoveryTokenData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishActivatingWithDiscoveryTokenData:error:");
}

id objc_msgSend_didGenerateAdvertisement_toSendOOBToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didGenerateAdvertisement:toSendOOBToPeer:");
}

id objc_msgSend_didGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_didGenerateShareableConfigurationData_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didGenerateShareableConfigurationData:forToken:");
}

id objc_msgSend_didInvalidateUWBSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didInvalidateUWBSession");
}

id objc_msgSend_didLoseDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLoseDevice:");
}

id objc_msgSend_didLosePeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLosePeer:");
}

id objc_msgSend_didPrefetchAcwgUrsk_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPrefetchAcwgUrsk:error:");
}

id objc_msgSend_didProcessAcwgM1MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessAcwgM1MsgWithResponse:error:");
}

id objc_msgSend_didProcessAcwgM3MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessAcwgM3MsgWithResponse:error:");
}

id objc_msgSend_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");
}

id objc_msgSend_didRangeWithPeer_newSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRangeWithPeer:newSolution:");
}

id objc_msgSend_didRangingAuthorizationFailForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRangingAuthorizationFailForPeer:");
}

id objc_msgSend_didReceiveAopSensorFusionUpdate_withBtConnHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAopSensorFusionUpdate:withBtConnHandle:");
}

id objc_msgSend_didReceiveMagnetometerData_at_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveMagnetometerData:at:");
}

id objc_msgSend_didReceiveNewBTRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveNewBTRSSI:");
}

id objc_msgSend_didReceiveNewSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveNewSolution:");
}

id objc_msgSend_didReceiveNewSolutions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveNewSolutions:");
}

id objc_msgSend_didReceiveRangingAuthRecommendation_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRangingAuthRecommendation:forObject:");
}

id objc_msgSend_didReceiveRangingDataForPeer_algorithmAidingData_signallingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRangingDataForPeer:algorithmAidingData:signallingData:");
}

id objc_msgSend_didReceiveRemoteData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRemoteData:");
}

id objc_msgSend_didReceiveSessionStartNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveSessionStartNotification:");
}

id objc_msgSend_didReceiveUnsuccessfulSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveUnsuccessfulSolution:");
}

id objc_msgSend_didRemoveNearbyObjects_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRemoveNearbyObjects:withReason:");
}

id objc_msgSend_didServiceRequestUpdateStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didServiceRequestUpdateStatus:");
}

id objc_msgSend_didStartAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartAcwgRanging:");
}

id objc_msgSend_didStartRangingOnDevice_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartRangingOnDevice:withError:");
}

id objc_msgSend_didStopAdvertisingToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStopAdvertisingToPeer:");
}

id objc_msgSend_didStopOwnerRangingOnDevice_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStopOwnerRangingOnDevice:withError:");
}

id objc_msgSend_didStopRangingWithPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStopRangingWithPeer:");
}

id objc_msgSend_didSuspendAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSuspendAcwgRanging:");
}

id objc_msgSend_didUpdateAlgorithmState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateAlgorithmState:forObject:");
}

id objc_msgSend_didUpdateHealthStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateHealthStatus:");
}

id objc_msgSend_didUpdateHomeDeviceUWBRangingAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateHomeDeviceUWBRangingAvailability:");
}

id objc_msgSend_didUpdateLocalDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateLocalDiscoveryToken:");
}

id objc_msgSend_didUpdateMinimumPreferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateMinimumPreferredUpdateRate:");
}

id objc_msgSend_didUpdateMotionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateMotionState:");
}

id objc_msgSend_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateNearbyObjects:");
}

id objc_msgSend_didUpdatePassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdatePassiveAccessIntent:");
}

id objc_msgSend_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:");
}

id objc_msgSend_didUpdateSystemState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateSystemState:");
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "direction");
}

id objc_msgSend_disableAllServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAllServices");
}

id objc_msgSend_disablePTSInitiating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disablePTSInitiating:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnect");
}

id objc_msgSend_disconnectDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectDevice:");
}

id objc_msgSend_discoverCharacteristics_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverCharacteristics:forService:");
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverServices:");
}

id objc_msgSend_discoveredDevice_didUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveredDevice:didUpdate:");
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveredDevices");
}

id objc_msgSend_discoveredPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveredPeers");
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryFlags");
}

id objc_msgSend_discoveryState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryState");
}

id objc_msgSend_discoveryToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryToken");
}

id objc_msgSend_discoveryTokenData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryTokenData");
}

id objc_msgSend_discoveryTokenFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryTokenFromIdentifier:");
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayBacklightLevel");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distance");
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromLocation:");
}

id objc_msgSend_distanceMeasurementQuality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceMeasurementQuality");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_doesClientWantSessionToRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesClientWantSessionToRun");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_effectiveIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveIdentifier");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elements");
}

id objc_msgSend_elevation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elevation");
}

id objc_msgSend_ellipsoidalAltitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ellipsoidalAltitude");
}

id objc_msgSend_embeddedSecureElementWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embeddedSecureElementWithError:");
}

id objc_msgSend_enableInternalObserverSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableInternalObserverSession");
}

id objc_msgSend_enablePTSInitiating_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enablePTSInitiating:reply:");
}

id objc_msgSend_enableRanging_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableRanging:reply:");
}

id objc_msgSend_enableSPMIMessagingWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSPMIMessagingWithHandler:");
}

id objc_msgSend_enabledGestures(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledGestures");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeFloat:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeMatrix4x4_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeMatrix4x4:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeQuat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeQuat:forKey:");
}

id objc_msgSend_encodeVector3_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeVector3:forKey:");
}

id objc_msgSend_encrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encrypt:");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "end");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDate");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSession");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_entitlementGranted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitlementGranted:");
}

id objc_msgSend_entryWithActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryWithActivityType:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exportedObjectClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exportedObjectClass");
}

id objc_msgSend_fOnCellMonitorUpdateCb(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fOnCellMonitorUpdateCb");
}

id objc_msgSend_failedToAddPeer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedToAddPeer");
}

id objc_msgSend_failedToRemovePeer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedToRemovePeer");
}

id objc_msgSend_fallbackBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackBundle");
}

id objc_msgSend_fallbackBundleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackBundleWithBundle:");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_featureValueWithMultiArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueWithMultiArray:");
}

id objc_msgSend_fetchAndUpdateAirplaneModeStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndUpdateAirplaneModeStatus");
}

id objc_msgSend_fetchPossibleTerritoriesForLocation_responseQueue_responseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:");
}

id objc_msgSend_fetchTxPowerFromDevice_asOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTxPowerFromDevice:asOwner:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fillNearbyObject_fromRangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillNearbyObject:fromRangeResult:");
}

id objc_msgSend_fillNearbyObject_fromSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillNearbyObject:fromSolution:");
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterUsingPredicate:");
}

id objc_msgSend_findableDiscoveryTokensForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findableDiscoveryTokensForGroup:");
}

id objc_msgSend_findingConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findingConfig");
}

id objc_msgSend_findingConfig2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findingConfig2");
}

id objc_msgSend_findingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findingEnabled");
}

id objc_msgSend_findingStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findingStatus");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstPathIndexPacket1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstPathIndexPacket1");
}

id objc_msgSend_firstPathIndexPacket2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstPathIndexPacket2");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flags");
}

id objc_msgSend_floatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatForKey:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_floor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floor");
}

id objc_msgSend_floorsAscended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floorsAscended");
}

id objc_msgSend_floorsDescended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floorsDescended");
}

id objc_msgSend_fromStruct_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromStruct:");
}

id objc_msgSend_generateDiscoveryToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateDiscoveryToken");
}

id objc_msgSend_generateFindingDiscoveryTokenWithSharedSecret_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateFindingDiscoveryTokenWithSharedSecret:");
}

id objc_msgSend_generateFindingTokenWithIRK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateFindingTokenWithIRK:");
}

id objc_msgSend_getActivelyInteractingDiscoveryTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActivelyInteractingDiscoveryTokens:");
}

id objc_msgSend_getAlgorithmAidingData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAlgorithmAidingData");
}

id objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllDevicesWithArchivedAltAccountDevicesMatching:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getContainerUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContainerUniqueIdentifier");
}

id objc_msgSend_getGnssSatelliteDataVecFromDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getGnssSatelliteDataVecFromDict:");
}

id objc_msgSend_getIRK(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIRK");
}

id objc_msgSend_getInteractableDiscoveryTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInteractableDiscoveryTokens:");
}

id objc_msgSend_getInternalConnectionQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInternalConnectionQueue");
}

id objc_msgSend_getInternalIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInternalIdentifier");
}

id objc_msgSend_getInternalLogObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInternalLogObject");
}

id objc_msgSend_getLocalDevicePrintableState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalDevicePrintableState:");
}

id objc_msgSend_getLogs_forSEID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLogs:forSEID:error:");
}

id objc_msgSend_getMostRecentObjectsWithMaxAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMostRecentObjectsWithMaxAge:");
}

id objc_msgSend_getNIConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNIConfiguration");
}

id objc_msgSend_getNormalizedCirAndPeakMagnitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNormalizedCirAndPeakMagnitude:");
}

id objc_msgSend_getNormalizedFftCir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNormalizedFftCir:");
}

id objc_msgSend_getPeerDataFromFindingContainerWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPeerDataFromFindingContainerWithToken:");
}

id objc_msgSend_getQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getQueue");
}

id objc_msgSend_getQueueForInputingData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getQueueForInputingData");
}

id objc_msgSend_getRangingActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRangingActive");
}

id objc_msgSend_getResourcePathWithBundleName_bundleDir_resourceName_resourceExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourcePathWithBundleName:bundleDir:resourceName:resourceExtension:");
}

id objc_msgSend_getResourcesManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourcesManager");
}

id objc_msgSend_getSessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSessionIdentifier");
}

id objc_msgSend_getSignallingData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSignallingData");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gravity");
}

id objc_msgSend_handleCBDiscoveryInterrupted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCBDiscoveryInterrupted");
}

id objc_msgSend_handleCBDiscoveryStateChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCBDiscoveryStateChanged");
}

id objc_msgSend_handleCBDiscoverySystemOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCBDiscoverySystemOverride");
}

id objc_msgSend_handleError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleError:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleXPCDisconnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleXPCDisconnection");
}

id objc_msgSend_handleXPCDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleXPCDisconnection:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasReceivedRangingData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasReceivedRangingData");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_headingAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headingAccuracy");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAccuracy");
}

id objc_msgSend_horizontalAngle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAngle");
}

id objc_msgSend_horizontalAngleAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAngleAccuracy");
}

id objc_msgSend_horizontalAngleAccuracyNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAngleAccuracyNumber");
}

id objc_msgSend_horizontalAngleNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAngleNumber");
}

id objc_msgSend_horizontalDistanceNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalDistanceNumber");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hour");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierFromDiscoveryToken:");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_identityString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityString");
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceID");
}

id objc_msgSend_imag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imag");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_informDelegateOwnerRangeStoppedonDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informDelegateOwnerRangeStoppedonDevice:");
}

id objc_msgSend_informMutualAuthFailuresToClients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informMutualAuthFailuresToClients");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initCompanion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initCompanion:");
}

id objc_msgSend_initForFinder_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForFinder:address:");
}

id objc_msgSend_initInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initInternal");
}

id objc_msgSend_initLabTestModeConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initLabTestModeConfiguration:");
}

id objc_msgSend_initNarrowbandSARListner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initNarrowbandSARListner");
}

id objc_msgSend_initPrivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPrivate");
}

id objc_msgSend_initRadioSCPreferencesRef(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRadioSCPreferencesRef");
}

id objc_msgSend_initRangingOnDevice_macAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRangingOnDevice:macAddress:");
}

id objc_msgSend_initTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initTime");
}

id objc_msgSend_initVehicleSimConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initVehicleSimConfiguration:");
}

id objc_msgSend_initWithAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdvertisement:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithBeaconUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBeaconUUID:");
}

id objc_msgSend_initWithBiasEstimatorFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBiasEstimatorFeatures:");
}

id objc_msgSend_initWithBiasEstimatorOutputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBiasEstimatorOutputs:");
}

id objc_msgSend_initWithBitmap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBitmap:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCBDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCBDevice:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:");
}

id objc_msgSend_initWithClient_clientInfo_connection_authorizationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:clientInfo:connection:authorizationManager:");
}

id objc_msgSend_initWithClientInfo_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientInfo:connection:");
}

id objc_msgSend_initWithClientPid_signingIdentity_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientPid:signingIdentity:sessionIdentifier:");
}

id objc_msgSend_initWithClientReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientReference:");
}

id objc_msgSend_initWithConfiguration_queue_delegate_dataSource_analyticsManager_protobufLogger_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:queue:");
}

id objc_msgSend_initWithConsumerBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConsumerBlock:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithConvergenceStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConvergenceStatus:");
}

id objc_msgSend_initWithCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCurrentTime:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:error:");
}

id objc_msgSend_initWithDataSource_delegate_clientQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:delegate:clientQueue:");
}

id objc_msgSend_initWithDelegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:delegateQueue:");
}

id objc_msgSend_initWithDelegate_dispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:dispatchQueue:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithDeviceAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceAddress:");
}

id objc_msgSend_initWithDeviceEventCount_uwbDeviceTimeUs_uwbDeviceTimeUncertainty_uwbClockSkewMeasurementAvailable_deviceMaxPpm_success_retryDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithECID_chipID_boardID_bootMode_prodMode_secureMode_securityDomain_chipRevision_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:");
}

id objc_msgSend_initWithEffectiveBundleIdentifier_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundleIdentifier:delegate:onQueue:");
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundlePath:delegate:onQueue:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExportedObject:");
}

id objc_msgSend_initWithFindingManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFindingManager:");
}

id objc_msgSend_initWithFineRangingSupport_aoaSupport_extendedDistanceMeasurementSupport_syntheticApertureSupport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:");
}

id objc_msgSend_initWithFineRangingSupport_coarseRangingSupport_aoaSupport_extendedDistanceMeasurementSupport_syntheticApertureSupport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:");
}

id objc_msgSend_initWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFloat:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithGEOCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGEOCoordinate:");
}

id objc_msgSend_initWithGetPowerStatsResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGetPowerStatsResponse:");
}

id objc_msgSend_initWithHelloResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHelloResponse:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_isFinder_consumer_queue_pbLogger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:isFinder:consumer:queue:pbLogger:");
}

id objc_msgSend_initWithIdentifier_isFinder_enableBluetooth_launchOnDemand_scanRate_discoveryTimeout_oobRefreshPeriod_consumer_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:isFinder:enableBluetooth:launchOnDemand:scanRate:discoveryTimeout:oobRefreshPeriod:consumer:queue:");
}

id objc_msgSend_initWithIdentifier_observer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:observer:");
}

id objc_msgSend_initWithInnerBoundary_outerBoundary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInnerBoundary:outerBoundary:error:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithKeyDerivationKey_sessionIdentifier_encrypt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyDerivationKey:sessionIdentifier:encrypt:");
}

id objc_msgSend_initWithLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLabel:");
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:");
}

id objc_msgSend_initWithLockIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLockIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithNIConfiguration_parsedAccessoryConfigData_processName_uwbSessionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNIConfiguration:parsedAccessoryConfigData:processName:uwbSessionId:");
}

id objc_msgSend_initWithName_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:devicePresencePreset:");
}

id objc_msgSend_initWithName_radius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:");
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:preferredUpdateRate:");
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_requiresUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:preferredUpdateRate:requiresUserIntent:");
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_requiresUserIntent_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:");
}

id objc_msgSend_initWithName_regionSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:regionSizeCategory:");
}

id objc_msgSend_initWithNeuralNetworkModel_andDataTransformer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNeuralNetworkModel:andDataTransformer:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPID:");
}

id objc_msgSend_initWithParentSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParentSession:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_bundle_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:bundle:reason:");
}

id objc_msgSend_initWithQueue_bundleId_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:bundleId:reason:");
}

id objc_msgSend_initWithQueue_identityString_stateUpdateHandler_mutualAuthHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:");
}

id objc_msgSend_initWithQueue_stateChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:stateChangeHandler:");
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_partIdentifier_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:");
}

id objc_msgSend_initWithRealPart_imagPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRealPart:imagPart:");
}

id objc_msgSend_initWithResourceBundleDirectory_bundleName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResourceBundleDirectory:bundleName:");
}

id objc_msgSend_initWithResourcesManager_configuration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResourcesManager:configuration:error:");
}

id objc_msgSend_initWithRole_discoveryToken_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRole:discoveryToken:preferredUpdateRate:");
}

id objc_msgSend_initWithSelectedRanMultiplier_selectedNumChapsPerSlot_numResponders_numSlotsPerRound_supportedSyncCodeIndexBitmask_selectedHoppingConfigBitmask_macMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSelectedRanMultiplier:selectedNumChapsPerSlot:numResponders:numSlotsPerRound:supportedSyncCodeIndexBitmask:selectedHoppingConfigBitmask:macMode:");
}

id objc_msgSend_initWithSelectedUwbConfigId_selectedPulseShapeCombo_selectedChannelBitmask_supportedSyncCodeIndexBitmask_minRanMultiplier_supportedSlotBitmask_supportedHoppingConfigBitmask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSelectedUwbConfigId:selectedPulseShapeCombo:selectedChannelBitmask:supportedSyncCodeIndexBitmask:minRanMultiplier:supportedSlotBitmask:supportedHoppingConfigBitmask:");
}

id objc_msgSend_initWithService_account_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:account:data:");
}

id objc_msgSend_initWithServiceRequest_startOptions_shareableConfigData_processName_accessoryConfigData_persistWhileDetached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceRequest:startOptions:shareableConfigData:processName:accessoryConfigData:persistWhileDetached:");
}

id objc_msgSend_initWithSessionID_queue_exportedObject_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionID:queue:exportedObject:options:");
}

id objc_msgSend_initWithSessionIdentifier_appStateMonitor_queue_analyticsManager_backgroundAuthHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionIdentifier:appStateMonitor:queue:analyticsManager:backgroundAuthHandler:");
}

id objc_msgSend_initWithSessionIdentifier_cycleRate_updatesQueue_analyticsManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionIdentifier:cycleRate:updatesQueue:analyticsManager:");
}

id objc_msgSend_initWithSettings_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSettings:queue:");
}

id objc_msgSend_initWithShape_dataType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShape:dataType:error:");
}

id objc_msgSend_initWithSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSlot:");
}

id objc_msgSend_initWithStatus_andReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatus:andReasons:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStsIndex0_uwbTime0_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStsIndex0:uwbTime0:");
}

id objc_msgSend_initWithStsIndex0_uwbTime0_hopKey_selectedSyncCodeIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStsIndex0:uwbTime0:hopKey:selectedSyncCodeIndex:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithSystemStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemStatus:");
}

id objc_msgSend_initWithTCCIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTCCIdentity:");
}

id objc_msgSend_initWithTimeStamp_rssi_dbm_channel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeStamp:rssi_dbm:channel:");
}

id objc_msgSend_initWithTimestamp_devicePose_trackingState_lightEstimate_majorRelocalization_minorRelocalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:");
}

id objc_msgSend_initWithTimestamp_latitude_longitude_altitude_ellipsoidalAltitude_horizontalAccuracy_verticalAccuracy_speed_speedAccuracy_course_courseAccuracy_floor_locationType_signalEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:");
}

id objc_msgSend_initWithTimestamp_trueHeading_magneticHeading_headingAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:");
}

id objc_msgSend_initWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithToken:");
}

id objc_msgSend_initWithToken_queue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithToken:queue:delegate:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUWBPreciseDistanceAvailability_uwbExtendedDistanceAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:");
}

id objc_msgSend_initWithVariant_macAddr_machAbsTime_sec_machContTimeValid_machContTime_sec_range_m_rangeUnc_m_azValid_elValid_az_deg_el_deg_azUnc_deg_elUnc_deg_fovConfidence_soiRssiValid_soiRssi_dBm_antennaType_prevSolutionIsBad_trackScoreValid_trackScore_sweepAngleValid_sweepAngle_deg_multipathProbabilityValid_multipathProbability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:");
}

id objc_msgSend_initWithVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVehicleIdentifier:");
}

id objc_msgSend_initialWorldMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialWorldMap");
}

id objc_msgSend_injectNarrowbandSARState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "injectNarrowbandSARState:");
}

id objc_msgSend_innerBoundary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "innerBoundary");
}

id objc_msgSend_inputFeatures(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputFeatures");
}

id objc_msgSend_insufficientHorizontalSweep(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insufficientHorizontalSweep");
}

id objc_msgSend_insufficientLighting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insufficientLighting");
}

id objc_msgSend_insufficientMovement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insufficientMovement");
}

id objc_msgSend_insufficientSignalStrength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insufficientSignalStrength");
}

id objc_msgSend_insufficientVerticalSweep(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insufficientVerticalSweep");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_integerValueForField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValueForField:");
}

id objc_msgSend_interactingFinderDiscoveryTokensForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactingFinderDiscoveryTokensForGroup:");
}

id objc_msgSend_interestedClients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestedClients");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalObserver");
}

id objc_msgSend_internalState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalState");
}

id objc_msgSend_interruptSessionWithReason_monotonicTimeSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptSessionWithReason:monotonicTimeSeconds:");
}

id objc_msgSend_interruptionReasonEnded_monotonicTimeSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptionReasonEnded:monotonicTimeSeconds:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateCalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateCalled");
}

id objc_msgSend_invalidationError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidationError");
}

id objc_msgSend_isARSessionInClientProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isARSessionInClientProcess");
}

id objc_msgSend_isARSessionInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isARSessionInternal");
}

id objc_msgSend_isActivityAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActivityAvailable");
}

id objc_msgSend_isAirPods_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAirPods:");
}

id objc_msgSend_isAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnchor");
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplication");
}

id objc_msgSend_isAttemptingToRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAttemptingToRange");
}

id objc_msgSend_isBackgroundOperationAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBackgroundOperationAllowed");
}

id objc_msgSend_isCachedByTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCachedByTokenData:");
}

id objc_msgSend_isCameraAssistanceEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCameraAssistanceEnabled");
}

id objc_msgSend_isCameraAssistanceInClientProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCameraAssistanceInClientProcess");
}

id objc_msgSend_isCoastalWaters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCoastalWaters");
}

id objc_msgSend_isCollaborationEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCollaborationEnabled");
}

id objc_msgSend_isDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDaemon");
}

id objc_msgSend_isDoingAnything(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDoingAnything");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExtendedDistanceMeasurementAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExtendedDistanceMeasurementAllowed:");
}

id objc_msgSend_isExtendedDistanceMeasurementEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExtendedDistanceMeasurementEnabled");
}

id objc_msgSend_isFinder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFinder");
}

id objc_msgSend_isIntValidAntennaDiversityOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIntValidAntennaDiversityOverride:");
}

id objc_msgSend_isIntValidNearbyObjectUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIntValidNearbyObjectUpdateRate:");
}

id objc_msgSend_isIntValidRelationshipSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIntValidRelationshipSpecifier:");
}

id objc_msgSend_isInteresetedInSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInteresetedInSample:");
}

id objc_msgSend_isInterestedInSamplesForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInterestedInSamplesForDevice:");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isLegacyDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLegacyDiscoveryToken:");
}

id objc_msgSend_isLongRangeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLongRangeEnabled");
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLowPowerModeEnabled");
}

id objc_msgSend_isObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObserver");
}

id objc_msgSend_isPreciseRangingAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreciseRangingAllowed:");
}

id objc_msgSend_isRangingEnabledReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRangingEnabledReply:");
}

id objc_msgSend_isRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRangingLimitExceeded");
}

id objc_msgSend_isRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRangingLimitExceeded:");
}

id objc_msgSend_isResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isResponder");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isRunningBoardApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningBoardApp");
}

id objc_msgSend_isSampleInCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSampleInCache:");
}

id objc_msgSend_isSessionAllowedToActivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSessionAllowedToActivate:");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTracking");
}

id objc_msgSend_isTrackingPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTrackingPeer:");
}

id objc_msgSend_isUIBackgroundModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUIBackgroundModeEnabled");
}

id objc_msgSend_isUwbCapable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUwbCapable");
}

id objc_msgSend_isWifiRangingCapable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWifiRangingCapable");
}

id objc_msgSend_isXPCService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isXPCService");
}

id objc_msgSend_iso3166CountryCode2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iso3166CountryCode2");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_lastConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastConfiguration");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_latestARFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestARFrame");
}

id objc_msgSend_latestActivityTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestActivityTimestamp");
}

id objc_msgSend_latestActivityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestActivityType");
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latitude");
}

id objc_msgSend_launchdJobLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchdJobLabel");
}

id objc_msgSend_leadingEdgePacket1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingEdgePacket1");
}

id objc_msgSend_leadingEdgePacket2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingEdgePacket2");
}

id objc_msgSend_legacyInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyInfo");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "level");
}

id objc_msgSend_lifecycleSupervisor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifecycleSupervisor");
}

id objc_msgSend_lifecycleTimeoutAfterTrackingForDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifecycleTimeoutAfterTrackingForDiscoveryToken:");
}

id objc_msgSend_lifecycleTimeoutBeforeTrackingForDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifecycleTimeoutBeforeTrackingForDiscoveryToken:");
}

id objc_msgSend_lightEstimate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightEstimate");
}

id objc_msgSend_lightEstimateFromARLightEstimate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightEstimateFromARLightEstimate:");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listener");
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listeners");
}

id objc_msgSend_loadResourcesWithResourceIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadResourcesWithResourceIndex:");
}

id objc_msgSend_localDeviceConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localDeviceConfiguration");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedBundle");
}

id objc_msgSend_localizedBundleWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedBundleWithBundle:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_locationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationType");
}

id objc_msgSend_lockBtConnHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockBtConnHandle");
}

id objc_msgSend_lockIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockIdentifier");
}

id objc_msgSend_logSessionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSessionEvent:");
}

id objc_msgSend_logSessionSummary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSessionSummary:");
}

id objc_msgSend_logSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSolution:");
}

id objc_msgSend_logUnservableRangingRequestWithToken_isFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logUnservableRangingRequestWithToken:isFinder:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longRangeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longRangeEnabled");
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longitude");
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "macAddress");
}

id objc_msgSend_mac_addr(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mac_addr");
}

id objc_msgSend_machContinuousTimeSeconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "machContinuousTimeSeconds");
}

id objc_msgSend_machServicesNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "machServicesNames");
}

id objc_msgSend_magneticField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "magneticField");
}

id objc_msgSend_magneticHeading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "magneticHeading");
}

id objc_msgSend_majorRelocalization(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "majorRelocalization");
}

id objc_msgSend_maxAllowedOutgoingMessages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxAllowedOutgoingMessages");
}

id objc_msgSend_maxInactivityAfterTrackingBeganSeconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxInactivityAfterTrackingBeganSeconds");
}

id objc_msgSend_maxInactivityBeforeTrackingBeganSeconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxInactivityBeforeTrackingBeganSeconds");
}

id objc_msgSend_maxNearbyObjectAge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxNearbyObjectAge");
}

id objc_msgSend_measurementReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measurementReceived");
}

id objc_msgSend_measurementReceivedForToken_contTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measurementReceivedForToken:contTimestamp:");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "member:");
}

id objc_msgSend_minimumPreferredUpdatedRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumPreferredUpdatedRate");
}

id objc_msgSend_minorRelocalization(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minorRelocalization");
}

id objc_msgSend_mmsRxStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mmsRxStatus");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "model");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:error:");
}

id objc_msgSend_monitorForDeath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorForDeath:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_monitoredProcessName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoredProcessName");
}

id objc_msgSend_monitoredRegions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoredRegions");
}

id objc_msgSend_monitoringOption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoringOption");
}

id objc_msgSend_motionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "motionState");
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiArrayValue");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_narrowBandMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "narrowBandMask");
}

id objc_msgSend_nbRssi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nbRssi");
}

id objc_msgSend_nbRxStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nbRxStatus");
}

id objc_msgSend_nbSARStateToSARIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nbSARStateToSARIndex:");
}

id objc_msgSend_nbUwbAcquisitionChannelIdx(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nbUwbAcquisitionChannelIdx");
}

id objc_msgSend_nearbyActionNWPrecisionFindingStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyActionNWPrecisionFindingStatus");
}

id objc_msgSend_nearbyActionNoWakeAuthTagData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyActionNoWakeAuthTagData");
}

id objc_msgSend_nearbyActionNoWakeConfigData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyActionNoWakeConfigData");
}

id objc_msgSend_nearbyActionNoWakeType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyActionNoWakeType");
}

id objc_msgSend_nearbyObjectFromDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromDeviceIdentifier:");
}

id objc_msgSend_nearbyObjectFromRangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromRangeResult:");
}

id objc_msgSend_nearbyObjectFromSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromSolution:");
}

id objc_msgSend_nearbyObjectFromSolution_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromSolution:forPeer:");
}

id objc_msgSend_nearbyObjectFromToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectFromToken:");
}

id objc_msgSend_nearbyObjectUpdateRate_isGreaterThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectUpdateRate:isGreaterThan:");
}

id objc_msgSend_nearbyObjectUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyObjectUpdated:");
}

id objc_msgSend_neuralNetworkModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "neuralNetworkModel");
}

id objc_msgSend_newAssertionForBundle_withReason_withCallbackQueue_andBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAssertionForBundle:withReason:withCallbackQueue:andBlock:");
}

id objc_msgSend_newAssertionForBundleIdentifier_withReason_withCallbackQueue_andBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAssertionForBundleIdentifier:withReason:withCallbackQueue:andBlock:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObject");
}

id objc_msgSend_niConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "niConfiguration");
}

id objc_msgSend_niConvergenceStateFromSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "niConvergenceStateFromSolution:");
}

id objc_msgSend_niVisionInputTrackingStateFromARTRackingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "niVisionInputTrackingStateFromARTRackingState:");
}

id objc_msgSend_nominalCycleRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nominalCycleRate");
}

id objc_msgSend_nonConnectableAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nonConnectableAdvertisingAddress");
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationType");
}

id objc_msgSend_notifyDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDeviceUnlockedSinceBoot");
}

id objc_msgSend_notifyServiceClientWithIdentifier_isRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyServiceClientWithIdentifier:isRunning:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numCharacteristicsLeftToRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numCharacteristicsLeftToRead");
}

id objc_msgSend_numberOfSteps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSteps");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_object_didUpdateRegion_previousRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object:didUpdateRegion:previousRegion:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectFromBluetoothDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectFromBluetoothDevice:");
}

id objc_msgSend_objectFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectFromIdentifier:");
}

id objc_msgSend_objectInRawTokenOPACKDictForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectInRawTokenOPACKDictForKey:");
}

id objc_msgSend_observationRegistrar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observationRegistrar");
}

id objc_msgSend_observerTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observerTokens");
}

id objc_msgSend_oobKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oobKeys");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_outProbabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outProbabilities");
}

id objc_msgSend_outerBoundary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outerBoundary");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputs");
}

id objc_msgSend_overrideSpatialScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideSpatialScore:");
}

id objc_msgSend_overrideTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideTimestamp:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameters");
}

id objc_msgSend_parsedAccessoryConfigData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parsedAccessoryConfigData");
}

id objc_msgSend_partIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "partIdentifier");
}

id objc_msgSend_passiveAccessIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passiveAccessIntent");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathForResource_ofType_inDirectory_forLocalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:inDirectory:forLocalization:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pause");
}

id objc_msgSend_pause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pause:");
}

id objc_msgSend_pauseCalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseCalled");
}

id objc_msgSend_pauseWithSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseWithSource:");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payload");
}

id objc_msgSend_payloadChangeObserverQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payloadChangeObserverQueue");
}

id objc_msgSend_peerDiscoveryToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerDiscoveryToken");
}

id objc_msgSend_peerHangupReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerHangupReceived:");
}

id objc_msgSend_peerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerIdentifier");
}

id objc_msgSend_peerInactivityPeriodExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerInactivityPeriodExceeded:");
}

id objc_msgSend_peerToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerToken");
}

id objc_msgSend_peerTrackingInitialState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerTrackingInitialState");
}

id objc_msgSend_peerTrackingTerminalState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerTrackingTerminalState");
}

id objc_msgSend_peerTrackingWithDiscoveryState_advertisingState_rangingState_algorithmOutputFlags_receivedSignalFlags_tellClientAboutPeer_clientWantsUpdates_nbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:");
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peripheral");
}

id objc_msgSend_persistWhileDetached(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistWhileDetached");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_populateOrderedBiasEstimatorOutputs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateOrderedBiasEstimatorOutputs");
}

id objc_msgSend_populateOrderedInputFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateOrderedInputFeature");
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "portType");
}

id objc_msgSend_positioningSensorSessionStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positioningSensorSessionStarted");
}

id objc_msgSend_positioningSensorSessionStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positioningSensorSessionStopped");
}

id objc_msgSend_postComponentStatusEventFor_status_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postComponentStatusEventFor:status:withReply:");
}

id objc_msgSend_powerBudgetProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerBudgetProvider");
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingIdentifier:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predictBiasEstimate_scaledInputFeatures_output_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictBiasEstimate:scaledInputFeatures:output:");
}

id objc_msgSend_predictOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictOutput:");
}

id objc_msgSend_predictionFromFeatures_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionFromFeatures:error:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_preferredUpdateRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredUpdateRate");
}

id objc_msgSend_prefetchAcwgUrsk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefetchAcwgUrsk:");
}

id objc_msgSend_prepareRangingOnDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareRangingOnDevice:");
}

id objc_msgSend_preprocessInputFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preprocessInputFeatures:");
}

id objc_msgSend_presentUserAuthorizationPrompt_forAuditToken_withBundleRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentUserAuthorizationPrompt:forAuditToken:withBundleRecord:");
}

id objc_msgSend_pressure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pressure");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousState");
}

id objc_msgSend_prewarmSecureElementChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prewarmSecureElementChannel");
}

id objc_msgSend_prewarmUWB(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prewarmUWB");
}

id objc_msgSend_printableState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printableState");
}

id objc_msgSend_printableStateOnQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printableStateOnQueue");
}

id objc_msgSend_probeAuthorizationForServiceListenerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "probeAuthorizationForServiceListenerWithIdentifier:");
}

id objc_msgSend_probeRegions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "probeRegions");
}

id objc_msgSend_proceedWithPowerStatsQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proceedWithPowerStatsQuery");
}

id objc_msgSend_processAcwgM1Msg_withSessionTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAcwgM1Msg:withSessionTriggerReason:");
}

id objc_msgSend_processAcwgM3Msg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAcwgM3Msg:");
}

id objc_msgSend_processAcwgRangingSessionResumeRequestMsg_withResumeTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:");
}

id objc_msgSend_processAdvertisement_receivedOOBFromPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAdvertisement:receivedOOBFromPeer:");
}

id objc_msgSend_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_monotonicTimeSec_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:");
}

id objc_msgSend_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:reply:");
}

id objc_msgSend_processClientDiscoveryEventForToken_sharedConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processClientDiscoveryEventForToken:sharedConfigurationData:");
}

id objc_msgSend_processClientDiscoveryEventWithSharedConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processClientDiscoveryEventWithSharedConfigurationData:");
}

id objc_msgSend_processClientRemovePeerEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processClientRemovePeerEvent");
}

id objc_msgSend_processClientRemovePeerEventForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processClientRemovePeerEventForToken:");
}

id objc_msgSend_processDCKMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDCKMessage:");
}

id objc_msgSend_processDCKMessage_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDCKMessage:reply:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processLostEventReceivedOOBFromPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLostEventReceivedOOBFromPeer:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processName");
}

id objc_msgSend_processNameBestGuess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processNameBestGuess");
}

id objc_msgSend_processPeerLocation_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPeerLocation:forPeer:");
}

id objc_msgSend_processSelfHeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processSelfHeading:");
}

id objc_msgSend_processSelfLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processSelfLocation:");
}

id objc_msgSend_processUWBResultForRegionMonitoring_roseSolution_processingOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUWBResultForRegionMonitoring:roseSolution:processingOptions:");
}

id objc_msgSend_processUWBResultForSyntheticAperture_roseSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUWBResultForSyntheticAperture:roseSolution:");
}

id objc_msgSend_processUpdatedConfiguration_forClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUpdatedConfiguration:forClientIdentifier:");
}

id objc_msgSend_processVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processVisionInput:");
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productID");
}

id objc_msgSend_productInfoWithProductID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productInfoWithProductID:");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productName");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protobufLogger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protobufLogger");
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolVersion");
}

id objc_msgSend_provideFindingSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provideFindingSolution:");
}

id objc_msgSend_proximityPairingProductID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proximityPairingProductID");
}

id objc_msgSend_publishBytes_amount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishBytes:amount:");
}

id objc_msgSend_publishWithAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishWithAuditToken:");
}

id objc_msgSend_publisherForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherForClient:");
}

id objc_msgSend_quaternion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quaternion");
}

id objc_msgSend_quaternionW(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quaternionW");
}

id objc_msgSend_quaternionX(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quaternionX");
}

id objc_msgSend_quaternionY(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quaternionY");
}

id objc_msgSend_quaternionZ(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quaternionZ");
}

id objc_msgSend_queryDeviceCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryDeviceCapabilities:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radius");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeBiasEstimate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeBiasEstimate");
}

id objc_msgSend_rangeBiasEstimatorModelDataTransformer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeBiasEstimatorModelDataTransformer");
}

id objc_msgSend_rangeUncertainty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeUncertainty");
}

id objc_msgSend_rangingAcquisitionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingAcquisitionType");
}

id objc_msgSend_rangingBecameUnavailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingBecameUnavailable");
}

id objc_msgSend_rangingRequestDidUpdateStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingRequestDidUpdateStatus:");
}

id objc_msgSend_rangingRetryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingRetryCount");
}

id objc_msgSend_rangingRetryTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingRetryTimer");
}

id objc_msgSend_rangingServiceDidUpdateState_cause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingServiceDidUpdateState:cause:");
}

id objc_msgSend_rangingSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingSession");
}

id objc_msgSend_rangingState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingState");
}

id objc_msgSend_rangingTriggerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangingTriggerType");
}

id objc_msgSend_rawRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rawRange");
}

id objc_msgSend_rawToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rawToken");
}

id objc_msgSend_readAllItemsWithService_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readAllItemsWithService:synchronizable:systemKeychain:");
}

id objc_msgSend_readItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readItemWithService:account:synchronizable:systemKeychain:");
}

id objc_msgSend_readValueForCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readValueForCharacteristic:");
}

id objc_msgSend_readingMultiConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readingMultiConfigCharacteristics");
}

id objc_msgSend_real(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "real");
}

id objc_msgSend_reasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reasons");
}

id objc_msgSend_receivedSignalFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedSignalFlags");
}

id objc_msgSend_recentlyObservedObjectsCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentlyObservedObjectsCache");
}

id objc_msgSend_refreshRangingForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshRangingForToken:");
}

id objc_msgSend_regionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regionName");
}

id objc_msgSend_regionSizeCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regionSizeCategory");
}

id objc_msgSend_registerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDelegate:");
}

id objc_msgSend_registerForActivityWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForActivityWithIdentifier:");
}

id objc_msgSend_registerForInternalBluetoothSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForInternalBluetoothSamples:");
}

id objc_msgSend_registerForInternalBluetoothSamples_reportCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForInternalBluetoothSamples:reportCache:");
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForLocalNotifications");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerForVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForVisionInput:");
}

id objc_msgSend_registerNBAMMSSessionWithToken_isFinder_client_serviceRequest_startRangingOptions_sharedProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:");
}

id objc_msgSend_registerObserver_withIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:withIdentifier:");
}

id objc_msgSend_registerObserversForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserversForSession:");
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_registerSessionWithConnection_observerSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSessionWithConnection:observerSession:");
}

id objc_msgSend_registerWithQueue_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithQueue:callback:");
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relationship");
}

id objc_msgSend_relativeAltitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relativeAltitude");
}

id objc_msgSend_relayDCKMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayDCKMessage:");
}

id objc_msgSend_relayInfoToNewObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayInfoToNewObserver:");
}

id objc_msgSend_relayToObserversForToken_blockToRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayToObserversForToken:blockToRelay:");
}

id objc_msgSend_remote(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remote");
}

id objc_msgSend_remoteDevice_didChangeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDevice:didChangeState:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteTxAntennaMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteTxAntennaMask");
}

id objc_msgSend_removeAllDiscoveryTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllDiscoveryTypes");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeClientWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeClientWithIdentifier:");
}

id objc_msgSend_removeClientWithIdentifier_dueToTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeClientWithIdentifier:dueToTimeout:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeObserverWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserverWithIdentifier:");
}

id objc_msgSend_removeObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObservers:");
}

id objc_msgSend_removePayloadChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePayloadChangeObserver:");
}

id objc_msgSend_removePeerDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePeerDiscoveryToken:");
}

id objc_msgSend_removePeerToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePeerToken:completion:");
}

id objc_msgSend_removeServiceClientWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeServiceClientWithIdentifier:");
}

id objc_msgSend_removeServiceListenerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeServiceListenerWithIdentifier:");
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_reportAndLogNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportAndLogNearbyObject:");
}

id objc_msgSend_reportRangingRequestStatusUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportRangingRequestStatusUpdate:");
}

id objc_msgSend_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
}

id objc_msgSend_requestAsyncServiceStatusUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAsyncServiceStatusUpdate");
}

id objc_msgSend_requiresBiasCorrection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresBiasCorrection");
}

id objc_msgSend_requiresLargeRegions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresLargeRegions");
}

id objc_msgSend_requiresNarrowbandToRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresNarrowbandToRun");
}

id objc_msgSend_requiresSpatialInteractionBluetoothResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresSpatialInteractionBluetoothResource");
}

id objc_msgSend_requiresUWBToRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresUWBToRun");
}

id objc_msgSend_requiresUserIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresUserIntent");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetARSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetARSession");
}

id objc_msgSend_resetAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAnalytics");
}

id objc_msgSend_resourceBundleDir(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceBundleDir");
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourcePath");
}

id objc_msgSend_resourcesManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourcesManager");
}

id objc_msgSend_resultConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultConfigCharacteristics");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_allowAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveConnectedPeripheralsWithServices:allowAll:");
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePairedPeers");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_revokeFindingExperience(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokeFindingExperience");
}

id objc_msgSend_revokeReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokeReason");
}

id objc_msgSend_roseMACAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roseMACAddress");
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotationRate");
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rssi");
}

id objc_msgSend_rssiDbm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rssiDbm");
}

id objc_msgSend_rttInitiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rttInitiator");
}

id objc_msgSend_rttResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rttResponder");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_runWithConfiguration_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithConfiguration:options:");
}

id objc_msgSend_runWithConfiguration_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithConfiguration:reply:");
}

id objc_msgSend_runWithConfigurationCalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithConfigurationCalled");
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "running");
}

id objc_msgSend_rxAntennaPacket1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxAntennaPacket1");
}

id objc_msgSend_rxAntennaPacket2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxAntennaPacket2");
}

id objc_msgSend_scaleCirValuesIfRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaleCirValuesIfRequired:");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanRate");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSendBarrierBlock:");
}

id objc_msgSend_scheduleWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleWithBlock:");
}

id objc_msgSend_secureKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureKey");
}

id objc_msgSend_selectedTechnology(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedTechnology");
}

id objc_msgSend_sendAnalyticsHeartbeatWasSuccessful_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAnalyticsHeartbeatWasSuccessful:");
}

id objc_msgSend_sendDataToPeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataToPeers:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serialNumberLeft(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumberLeft");
}

id objc_msgSend_serialNumberRight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumberRight");
}

id objc_msgSend_serialize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialize:");
}

id objc_msgSend_serverSessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverSessionIdentifier");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service");
}

id objc_msgSend_serviceDidDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidDiscoverNearbyObject:");
}

id objc_msgSend_serviceDidGenerateShareableConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidGenerateShareableConfigurationData:");
}

id objc_msgSend_serviceDidGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_serviceDidRemoveNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidRemoveNearbyObject:");
}

id objc_msgSend_serviceDidUpdateAlgorithmConvergenceState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidUpdateAlgorithmConvergenceState:forObject:");
}

id objc_msgSend_serviceDidUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidUpdateNearbyObjects:");
}

id objc_msgSend_serviceForToken_createIfNotExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceForToken:createIfNotExists:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceRequest");
}

id objc_msgSend_serviceRequestDidUpdateStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceRequestDidUpdateStatus:");
}

id objc_msgSend_serviceWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithQueue:");
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "services");
}

id objc_msgSend_session_didDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didDiscoverNearbyObject:");
}

id objc_msgSend_session_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didFailWithError:");
}

id objc_msgSend_session_didGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_session_didInvalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didInvalidateWithError:");
}

id objc_msgSend_session_didPrefetchAcwgUrsk_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didPrefetchAcwgUrsk:error:");
}

id objc_msgSend_session_didProcessAcwgM1MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessAcwgM1MsgWithResponse:error:");
}

id objc_msgSend_session_didProcessAcwgM3MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessAcwgM3MsgWithResponse:error:");
}

id objc_msgSend_session_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");
}

id objc_msgSend_session_didProcessBluetoothHostTimeSyncWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didProcessBluetoothHostTimeSyncWithResponse:error:");
}

id objc_msgSend_session_didReceiveRangingAuthRecommendation_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didReceiveRangingAuthRecommendation:forObject:");
}

id objc_msgSend_session_didRemoveNearbyObjects_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didRemoveNearbyObjects:withReason:");
}

id objc_msgSend_session_didStartAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didStartAcwgRanging:");
}

id objc_msgSend_session_didSuspendAcwgRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didSuspendAcwgRanging:");
}

id objc_msgSend_session_didUpdateAlgorithmConvergence_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateAlgorithmConvergence:forObject:");
}

id objc_msgSend_session_didUpdateAlgorithmState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateAlgorithmState:forObject:");
}

id objc_msgSend_session_didUpdateHealthStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateHealthStatus:");
}

id objc_msgSend_session_didUpdateHomeDeviceUWBRangingAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateHomeDeviceUWBRangingAvailability:");
}

id objc_msgSend_session_didUpdateLocalMotionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateLocalMotionState:");
}

id objc_msgSend_session_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:didUpdateNearbyObjects:");
}

id objc_msgSend_session_object_didUpdateRegion_previousRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:object:didUpdateRegion:previousRegion:");
}

id objc_msgSend_session_relayDCKMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:relayDCKMessage:");
}

id objc_msgSend_session_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
}

id objc_msgSend_session_suspendedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:suspendedWithReason:");
}

id objc_msgSend_session_suspensionReasonEnded_isNoLongerSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session:suspensionReasonEnded:isNoLongerSuspended:");
}

id objc_msgSend_sessionClientForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionClientForFinder:");
}

id objc_msgSend_sessionClientsStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionClientsStatus");
}

id objc_msgSend_sessionDidStartRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidStartRunning:");
}

id objc_msgSend_sessionDidUpdateDiscoveryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidUpdateDiscoveryToken:");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifier");
}

id objc_msgSend_sessionInterruptedWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionInterruptedWithTimestamp:");
}

id objc_msgSend_sessionKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionKey");
}

id objc_msgSend_sessionPausedWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionPausedWithTimestamp:");
}

id objc_msgSend_sessionRegistered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionRegistered");
}

id objc_msgSend_sessionServiceRequestForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionServiceRequestForFinder:");
}

id objc_msgSend_sessionShouldAttemptRelocalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionShouldAttemptRelocalization:");
}

id objc_msgSend_sessionShouldAttemptRelocalization_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionShouldAttemptRelocalization:completion:");
}

id objc_msgSend_sessionStartRangingOptionsForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStartRangingOptionsForFinder:");
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionState");
}

id objc_msgSend_sessionSuccessfullyRanWithConfig_withTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionSuccessfullyRanWithConfig:withTimestamp:");
}

id objc_msgSend_sessionSuspensionEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionSuspensionEnded:");
}

id objc_msgSend_sessionTokenForFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionTokenForFinder:");
}

id objc_msgSend_sessionWasSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWasSuspended:");
}

id objc_msgSend_setAcceleration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceleration:");
}

id objc_msgSend_setActivationGuard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationGuard:");
}

id objc_msgSend_setActivationResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationResponse:");
}

id objc_msgSend_setActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityType:");
}

id objc_msgSend_setAcwgRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcwgRangingLimitExceeded:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseRate:");
}

id objc_msgSend_setAdvertiseRate_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseRate:timeout:");
}

id objc_msgSend_setAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisement:");
}

id objc_msgSend_setAdvertisingAddressChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisingAddressChangedHandler:");
}

id objc_msgSend_setAdvertisingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisingState:");
}

id objc_msgSend_setAggregateStateProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAggregateStateProvider:");
}

id objc_msgSend_setAirplaneModeChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirplaneModeChangedHandler:");
}

id objc_msgSend_setAirplaneModeStatusInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirplaneModeStatusInternal:");
}

id objc_msgSend_setAlgorithmAidingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmAidingData:");
}

id objc_msgSend_setAlgorithmAidingData_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmAidingData:forPeer:");
}

id objc_msgSend_setAlgorithmOutputFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmOutputFlags:");
}

id objc_msgSend_setAlgorithmSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithmSource:");
}

id objc_msgSend_setAllowedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedDevices:");
}

id objc_msgSend_setAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchor:");
}

id objc_msgSend_setAntennaDiversityOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAntennaDiversityOverride:");
}

id objc_msgSend_setAntennaMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAntennaMask:");
}

id objc_msgSend_setAppStateMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppStateMonitor:");
}

id objc_msgSend_setArSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArSession:");
}

id objc_msgSend_setArSessionInClientProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArSessionInClientProcess:");
}

id objc_msgSend_setArSessionInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArSessionInternal:");
}

id objc_msgSend_setArSessionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArSessionState:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAzimuth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAzimuth:");
}

id objc_msgSend_setBackgroundMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundMode:");
}

id objc_msgSend_setBackgroundSupportUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundSupportUpdateHandler:");
}

id objc_msgSend_setBleRSSIThresholdHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleRSSIThresholdHint:");
}

id objc_msgSend_setBleRSSIThresholdOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleRSSIThresholdOrder:");
}

id objc_msgSend_setBleScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleScanRate:");
}

id objc_msgSend_setBluetoothAdvertisingAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothAdvertisingAddress:");
}

id objc_msgSend_setBluetoothDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothDeviceIdentifier:");
}

id objc_msgSend_setBluetoothStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothStateChangedHandler:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBoundedRegionRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoundedRegionRange:");
}

id objc_msgSend_setBtAddressData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtAddressData:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCachedPlatformCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedPlatformCapabilities:");
}

id objc_msgSend_setCameraAssistanceEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraAssistanceEnabled:");
}

id objc_msgSend_setCameraAssistanceInClientProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraAssistanceInClientProcess:");
}

id objc_msgSend_setCanRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanRange:");
}

id objc_msgSend_setCancelHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelHandler:");
}

id objc_msgSend_setCarKeyRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarKeyRangingLimitExceeded:");
}

id objc_msgSend_setCirPacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCirPacket1:");
}

id objc_msgSend_setCirPacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCirPacket2:");
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientIdentifierData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifierData:");
}

id objc_msgSend_setClientIrkData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIrkData:");
}

id objc_msgSend_setClientVoucher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientVoucher:");
}

id objc_msgSend_setClientWantsUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientWantsUpdates:");
}

id objc_msgSend_setConfigType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigType:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setCorrectedRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorrectedRange:");
}

id objc_msgSend_setCrown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCrown:");
}

id objc_msgSend_setCurrentSolutionMacAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSolutionMacAddress:");
}

id objc_msgSend_setCurrentTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTask:");
}

id objc_msgSend_setCycleIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCycleIndex:");
}

id objc_msgSend_setDataFrame_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataFrame:forPeer:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDebugDisplayInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugDisplayInfo:");
}

id objc_msgSend_setDebugOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugOptions:");
}

id objc_msgSend_setDebugParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugParameters:");
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateQueue:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDeviceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFilter:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIdentifier:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceMotionUpdateInterval:");
}

id objc_msgSend_setDevicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevicePresencePreset:");
}

id objc_msgSend_setDeviceRelationshipFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceRelationshipFlags:");
}

id objc_msgSend_setDevicesBufferedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevicesBufferedHandler:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDiscoveryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryState:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistance:");
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceFilter:");
}

id objc_msgSend_setDistanceMeasurementQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceMeasurementQuality:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setElevation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElevation:");
}

id objc_msgSend_setEnableEPAForLEAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableEPAForLEAdvertisement:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setEnteredFromActiveFindingUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnteredFromActiveFindingUI:");
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorHandler:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExportedObjectClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObjectClass:");
}

id objc_msgSend_setFOnCellMonitorUpdateCb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFOnCellMonitorUpdateCb:");
}

id objc_msgSend_setFindableDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindableDiscoveryTokens:tokenGroup:");
}

id objc_msgSend_setFindingConfig2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingConfig2:");
}

id objc_msgSend_setFindingConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingConfig:");
}

id objc_msgSend_setFindingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingEnabled:");
}

id objc_msgSend_setFindingPeerToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingPeerToken:");
}

id objc_msgSend_setFindingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingStatus:");
}

id objc_msgSend_setFirstPathIndexPacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstPathIndexPacket1:");
}

id objc_msgSend_setFirstPathIndexPacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstPathIndexPacket2:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setHeadingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadingFilter:");
}

id objc_msgSend_setHorizontalAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAccuracy:");
}

id objc_msgSend_setHorizontalAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAngle:");
}

id objc_msgSend_setHorizontalAngleAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAngleAccuracy:");
}

id objc_msgSend_setImag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImag:");
}

id objc_msgSend_setInputFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputFeatures:");
}

id objc_msgSend_setInsufficientHorizontalSweep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientHorizontalSweep:");
}

id objc_msgSend_setInsufficientLighting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientLighting:");
}

id objc_msgSend_setInsufficientMovement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientMovement:");
}

id objc_msgSend_setInsufficientVerticalSweep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientVerticalSweep:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInternalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalState:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationError:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIrkData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIrkData:");
}

id objc_msgSend_setIsFinder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFinder:");
}

id objc_msgSend_setIsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsObserver:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyType:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLatestARFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestARFrame:");
}

id objc_msgSend_setLatestActivityTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestActivityTimestamp:");
}

id objc_msgSend_setLatestActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestActivityType:");
}

id objc_msgSend_setLatestBluetoothState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestBluetoothState:");
}

id objc_msgSend_setLeadingEdgePacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingEdgePacket1:");
}

id objc_msgSend_setLeadingEdgePacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingEdgePacket2:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setLocalDeviceCanInteract_withDiscoveryTokens_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceCanInteract:withDiscoveryTokens:reply:");
}

id objc_msgSend_setLocalDeviceDebugParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceDebugParameters:");
}

id objc_msgSend_setLocalDeviceDebugParameters_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceDebugParameters:reply:");
}

id objc_msgSend_setLocalDeviceInteractableDiscoveryTokens_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceInteractableDiscoveryTokens:reply:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLockBtConnHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockBtConnHandle:");
}

id objc_msgSend_setLockIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockIdentifier:");
}

id objc_msgSend_setLongRangeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongRangeEnabled:");
}

id objc_msgSend_setMachAbsoluteTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMachAbsoluteTimestamp:");
}

id objc_msgSend_setMagnetometerUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMagnetometerUpdateInterval:");
}

id objc_msgSend_setMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatching:");
}

id objc_msgSend_setMaxInactivityAfterTrackingBeganSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxInactivityAfterTrackingBeganSeconds:");
}

id objc_msgSend_setMaxInactivityBeforeTrackingBeganSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxInactivityBeforeTrackingBeganSeconds:");
}

id objc_msgSend_setMaxNearbyObjectAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxNearbyObjectAge:");
}

id objc_msgSend_setMinDurationBetweenInstances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinDurationBetweenInstances:");
}

id objc_msgSend_setMinimumPreferredUpdatedRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumPreferredUpdatedRate:");
}

id objc_msgSend_setMmsRxStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMmsRxStatus:");
}

id objc_msgSend_setMonitoredRegions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitoredRegions:");
}

id objc_msgSend_setMonitoringOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitoringOption:");
}

id objc_msgSend_setMotionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMotionState:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNarrowBandMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNarrowBandMask:");
}

id objc_msgSend_setNbRssi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNbRssi:");
}

id objc_msgSend_setNbRxStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNbRxStatus:");
}

id objc_msgSend_setNbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNbUwbAcquisitionChannelIdx:");
}

id objc_msgSend_setNearbyActionFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionFlags:");
}

id objc_msgSend_setNearbyActionNWPrecisionFindingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNWPrecisionFindingStatus:");
}

id objc_msgSend_setNearbyActionNoWakeAuthTagData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNoWakeAuthTagData:");
}

id objc_msgSend_setNearbyActionNoWakeConfigData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNoWakeConfigData:");
}

id objc_msgSend_setNearbyActionNoWakeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionNoWakeType:");
}

id objc_msgSend_setNearbyActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionType:");
}

id objc_msgSend_setNumCharacteristicsLeftToRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumCharacteristicsLeftToRead:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObservationRegistrar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservationRegistrar:");
}

id objc_msgSend_setOdometryUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOdometryUpdateInterval:");
}

id objc_msgSend_setOobKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOobKeys:");
}

id objc_msgSend_setOutProbabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutProbabilities:");
}

id objc_msgSend_setOutputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputs:");
}

id objc_msgSend_setPassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassiveAccessIntent:");
}

id objc_msgSend_setPeerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerIdentifier:");
}

id objc_msgSend_setPeerLostCallbackReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerLostCallbackReceived:");
}

id objc_msgSend_setPeersEligibleForDiscovery_requestScan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeersEligibleForDiscovery:requestScan:");
}

id objc_msgSend_setPeripheral_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeripheral:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPreferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredUpdateRate:");
}

id objc_msgSend_setPressure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPressure:");
}

id objc_msgSend_setPreventsDeviceSleep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventsDeviceSleep:");
}

id objc_msgSend_setPrewarmSecureElementChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrewarmSecureElementChannel:");
}

id objc_msgSend_setPrewarmUWB_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrewarmUWB:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtocolVersion:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQuaternion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuaternion:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRange:");
}

id objc_msgSend_setRangeBiasEstimate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangeBiasEstimate:");
}

id objc_msgSend_setRangeError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangeError:");
}

id objc_msgSend_setRangeUncertainty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangeUncertainty:");
}

id objc_msgSend_setRangingActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingActive:");
}

id objc_msgSend_setRangingRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingRetryCount:");
}

id objc_msgSend_setRangingRetryTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingRetryTimer:");
}

id objc_msgSend_setRangingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingSession:");
}

id objc_msgSend_setRangingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRangingState:");
}

id objc_msgSend_setRawRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawRange:");
}

id objc_msgSend_setReadingMultiConfigCharacteristics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadingMultiConfigCharacteristics:");
}

id objc_msgSend_setReal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReal:");
}

id objc_msgSend_setReceivedSignalFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedSignalFlags:");
}

id objc_msgSend_setRegionSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegionSizeCategory:");
}

id objc_msgSend_setRegulatoryLocationAuthorized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegulatoryLocationAuthorized:");
}

id objc_msgSend_setRegulatoryLocationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegulatoryLocationHandler:");
}

id objc_msgSend_setRelationship_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelationship:");
}

id objc_msgSend_setRelativeAltitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelativeAltitude:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteTxAntennaMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteTxAntennaMask:");
}

id objc_msgSend_setRepeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeats:");
}

id objc_msgSend_setRequiresBiasCorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresBiasCorrection:");
}

id objc_msgSend_setRequiresUserIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresUserIntent:");
}

id objc_msgSend_setResetARSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResetARSession:");
}

id objc_msgSend_setResetHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResetHandler:");
}

id objc_msgSend_setResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponder:");
}

id objc_msgSend_setRevokeFindingExperience_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRevokeFindingExperience:");
}

id objc_msgSend_setRotationRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotationRate:");
}

id objc_msgSend_setRssi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssi:");
}

id objc_msgSend_setRssiDbm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssiDbm:");
}

id objc_msgSend_setRttInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRttInitiator:");
}

id objc_msgSend_setRttResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRttResponder:");
}

id objc_msgSend_setRxAntennaPacket1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRxAntennaPacket1:");
}

id objc_msgSend_setRxAntennaPacket2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRxAntennaPacket2:");
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanRate:");
}

id objc_msgSend_setService_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:forToken:");
}

id objc_msgSend_setSessionKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionKey:");
}

id objc_msgSend_setShouldWakeDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldWakeDevice:");
}

id objc_msgSend_setSignalStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalStrength:");
}

id objc_msgSend_setSignallingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignallingData:");
}

id objc_msgSend_setSignallingData_forPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignallingData:forPeer:");
}

id objc_msgSend_setSoiRssiDbm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoiRssiDbm:");
}

id objc_msgSend_setSpecifiedToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiedToken:");
}

id objc_msgSend_setStateChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateChangeHandler:");
}

id objc_msgSend_setStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateChangedHandler:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setSupportedTechnologies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedTechnologies:");
}

id objc_msgSend_setSupportsCameraAssistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsCameraAssistance:");
}

id objc_msgSend_setSystemOverrideHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemOverrideHandler:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setTatInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTatInitiator:");
}

id objc_msgSend_setTatResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTatResponder:");
}

id objc_msgSend_setTellClientAboutPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTellClientAboutPeer:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeoutOnPeerInactivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutOnPeerInactivity:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setToaNoiseRms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToaNoiseRms:");
}

id objc_msgSend_setToaPpwinPeak_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToaPpwinPeak:");
}

id objc_msgSend_setToaPpwinRms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToaPpwinRms:");
}

id objc_msgSend_setTofPicSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTofPicSecond:");
}

id objc_msgSend_setTolerance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTolerance:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUUID:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUpdatesPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatesPolicy:");
}

id objc_msgSend_setUseCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseCase:");
}

id objc_msgSend_setUwbConfigData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbConfigData:");
}

id objc_msgSend_setUwbExtendedDistanceAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbExtendedDistanceAvailability:");
}

id objc_msgSend_setUwbPreciseDistanceAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbPreciseDistanceAvailability:");
}

id objc_msgSend_setUwbSignalFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbSignalFeatures:");
}

id objc_msgSend_setUwbTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbTime:");
}

id objc_msgSend_setUwbTokenFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUwbTokenFlags:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVehicleIdentifier:");
}

id objc_msgSend_setVerticalDirectionEstimate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalDirectionEstimate:");
}

id objc_msgSend_setWifiRangingActiveAdvertisement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiRangingActiveAdvertisement");
}

id objc_msgSend_setWiproxStateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWiproxStateHandler:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorldPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorldPosition:");
}

id objc_msgSend_setWrist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrist:");
}

id objc_msgSend_setupActivityInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupActivityInterval");
}

id objc_msgSend_setupBackoffResumeManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupBackoffResumeManager");
}

id objc_msgSend_setupXPCListeners(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupXPCListeners");
}

id objc_msgSend_shareableConfigData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareableConfigData");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedObserver");
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPairingAgent");
}

id objc_msgSend_sharedProtocol(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedProtocol");
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedProvider");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_sharedServicePrintableState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedServicePrintableState");
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSettings");
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortDescription");
}

id objc_msgSend_shortDeviceAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortDeviceAddress");
}

id objc_msgSend_shouldAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptNewConnection:");
}

id objc_msgSend_shouldAttemptMerging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAttemptMerging");
}

id objc_msgSend_shouldBypassBleDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldBypassBleDiscovery");
}

id objc_msgSend_shouldInformMutualAuthFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInformMutualAuthFailure:");
}

id objc_msgSend_shouldInitiate_peerDiscoveryToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInitiate:peerDiscoveryToken:error:");
}

id objc_msgSend_signalEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalEnvironment");
}

id objc_msgSend_signalEnvironmentType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalEnvironmentType");
}

id objc_msgSend_signalStrength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalStrength");
}

id objc_msgSend_signingIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingIdentity");
}

id objc_msgSend_sipHashForIRK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sipHashForIRK:");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slotID");
}

id objc_msgSend_soiRssiDbm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "soiRssiDbm");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_spatialInteractionFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spatialInteractionFlags");
}

id objc_msgSend_spatialInteractionTokenData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spatialInteractionTokenData");
}

id objc_msgSend_spatialInteractionUWBConfigData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spatialInteractionUWBConfigData");
}

id objc_msgSend_spatialInteractionUWBTokenFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spatialInteractionUWBTokenFlags");
}

id objc_msgSend_spatialScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spatialScore");
}

id objc_msgSend_specifiedToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiedToken");
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speed");
}

id objc_msgSend_speedAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speedAccuracy");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startActivityUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startActivityUpdatesToQueue:withHandler:");
}

id objc_msgSend_startAdvertising(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAdvertising");
}

id objc_msgSend_startAdvertisingAsFinder_toPeer_withAdvertisement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAdvertisingAsFinder:toPeer:withAdvertisement:");
}

id objc_msgSend_startAdvertisingToPeer_advertisement_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAdvertisingToPeer:advertisement:timeout:");
}

id objc_msgSend_startAggressiveAdvertisingOnDevice_withTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAggressiveAdvertisingOnDevice:withTimeout:");
}

id objc_msgSend_startBTScanningWithMaxRateForPrototypeHomeSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBTScanningWithMaxRateForPrototypeHomeSession:");
}

id objc_msgSend_startBeingFindableWithDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBeingFindableWithDiscoveryTokens:tokenGroup:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDeviceFindingUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDeviceFindingUpdates");
}

id objc_msgSend_startDeviceMotionUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDeviceMotionUpdatesToQueue:withHandler:");
}

id objc_msgSend_startDeviceMotionUpdatesUsingReferenceFrame_toQueue_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:");
}

id objc_msgSend_startEventCounterForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEventCounterForDevice:");
}

id objc_msgSend_startHighPriorityScanningForToken_forConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startHighPriorityScanningForToken:forConsumer:");
}

id objc_msgSend_startLeechingForConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLeechingForConsumer:");
}

id objc_msgSend_startMagnetometerUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMagnetometerUpdatesToQueue:withHandler:");
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoring");
}

id objc_msgSend_startMonitoringForAvengerAdvertisementsForBTFinding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringForAvengerAdvertisementsForBTFinding");
}

id objc_msgSend_startObserving_observeImmediately_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObserving:observeImmediately:callback:");
}

id objc_msgSend_startOdometryUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOdometryUpdatesToQueue:withHandler:");
}

id objc_msgSend_startOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOptions");
}

id objc_msgSend_startPedometerEventUpdatesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPedometerEventUpdatesWithHandler:");
}

id objc_msgSend_startPedometerUpdatesFromDate_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPedometerUpdatesFromDate:withHandler:");
}

id objc_msgSend_startRangingMangager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRangingMangager");
}

id objc_msgSend_startRangingMangagerAndCompanion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRangingMangagerAndCompanion:");
}

id objc_msgSend_startRangingOnDevice_targetEventCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRangingOnDevice:targetEventCounter:");
}

id objc_msgSend_startRangingWithPeer_technology_peerAdvertisement_OOBRangingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:");
}

id objc_msgSend_startRelativeAltitudeUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRelativeAltitudeUpdatesToQueue:withHandler:");
}

id objc_msgSend_startScanning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startScanning");
}

id objc_msgSend_startScanningWithBurstPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startScanningWithBurstPeriod:");
}

id objc_msgSend_startSecureElementLoggingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSecureElementLoggingSession:");
}

id objc_msgSend_startServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startServices");
}

id objc_msgSend_startUnauthorizedAggressiveAdvertisingOnDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUnauthorizedAggressiveAdvertisingOnDevice:");
}

id objc_msgSend_startUpdatingHeading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdatingHeading");
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdatingLocation");
}

id objc_msgSend_startedDiscoveringPeersWithTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedDiscoveringPeersWithTokens:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stationary");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "status");
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusFlags");
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopActivityUpdates");
}

id objc_msgSend_stopAdvertising(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAdvertising");
}

id objc_msgSend_stopAdvertisingAsFinder_toPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAdvertisingAsFinder:toPeer:");
}

id objc_msgSend_stopAdvertisingToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAdvertisingToPeer:");
}

id objc_msgSend_stopAggressiveAdvertisingOnDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAggressiveAdvertisingOnDevice:");
}

id objc_msgSend_stopAndClearState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAndClearState");
}

id objc_msgSend_stopBTScanningWithMaxRateForPrototypeHomeSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBTScanningWithMaxRateForPrototypeHomeSession");
}

id objc_msgSend_stopBeingFindableWithDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBeingFindableWithDiscoveryTokens:tokenGroup:");
}

id objc_msgSend_stopDeviceFindingUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopDeviceFindingUpdates");
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopDeviceMotionUpdates");
}

id objc_msgSend_stopEventCounterForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopEventCounterForDevice:");
}

id objc_msgSend_stopHighPriorityScanning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopHighPriorityScanning");
}

id objc_msgSend_stopLeechingForConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopLeechingForConsumer:");
}

id objc_msgSend_stopMagnetometerUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMagnetometerUpdates");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stopMonitoringForAvengerAdvertisementsForBTFinding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringForAvengerAdvertisementsForBTFinding");
}

id objc_msgSend_stopObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObserving:");
}

id objc_msgSend_stopOdometryUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopOdometryUpdates");
}

id objc_msgSend_stopPedometerEventUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPedometerEventUpdates");
}

id objc_msgSend_stopPedometerUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPedometerUpdates");
}

id objc_msgSend_stopRanging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRanging");
}

id objc_msgSend_stopRangingMangagerAndCompanion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRangingMangagerAndCompanion:");
}

id objc_msgSend_stopRangingOnDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRangingOnDevice:");
}

id objc_msgSend_stopRangingWithPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRangingWithPeer:");
}

id objc_msgSend_stopRelativeAltitudeUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRelativeAltitudeUpdates");
}

id objc_msgSend_stopScanningAndRemovePeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopScanningAndRemovePeers:");
}

id objc_msgSend_stopUpdatingHeading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUpdatingHeading");
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUpdatingLocation");
}

id objc_msgSend_stoppedDiscoveringAllPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stoppedDiscoveringAllPeers");
}

id objc_msgSend_stoppedDiscoveringPeersWithTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stoppedDiscoveringPeersWithTokens:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strongToWeakObjectsMapTable");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_submitAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitAnalytics");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_supportedTechnologies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedTechnologies");
}

id objc_msgSend_supportsAoA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsAoA");
}

id objc_msgSend_supportsBackgroundedClients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsBackgroundedClients");
}

id objc_msgSend_supportsCameraAssistance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCameraAssistance");
}

id objc_msgSend_supportsDevicePresence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsDevicePresence");
}

id objc_msgSend_supportsDirectionMeasurement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsDirectionMeasurement");
}

id objc_msgSend_supportsExtendedDistanceMeasurement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsExtendedDistanceMeasurement");
}

id objc_msgSend_supportsNBAMMS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsNBAMMS");
}

id objc_msgSend_supportsPreciseDistanceMeasurement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsPreciseDistanceMeasurement");
}

id objc_msgSend_supportsSessionObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsSessionObservers");
}

id objc_msgSend_supportsSyntheticAperture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsSyntheticAperture");
}

id objc_msgSend_supportsUWB(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsUWB");
}

id objc_msgSend_suspendAcwgRanging_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendAcwgRanging:withSuspendTriggerReason:");
}

id objc_msgSend_suspensionPolicy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspensionPolicy");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemConfigurator_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemConfigurator:didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:");
}

id objc_msgSend_systemConfigurator_didUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemConfigurator:didUpdateState:");
}

id objc_msgSend_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:");
}

id objc_msgSend_systemDidUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDidUpdateState:");
}

id objc_msgSend_systemKeyRelationship(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemKeyRelationship");
}

id objc_msgSend_systemOverrideFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemOverrideFlags");
}

id objc_msgSend_systemOverrideNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemOverrideNotification");
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskRequestForIdentifier:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskState");
}

id objc_msgSend_tatInitiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tatInitiator");
}

id objc_msgSend_tatResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tatResponder");
}

id objc_msgSend_tellClientAboutPeer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tellClientAboutPeer");
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminate");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeOfLatestConnectionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeOfLatestConnectionState");
}

id objc_msgSend_timeOfLatestSessionLifecycleChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeOfLatestSessionLifecycleChange");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timeoutOnPeerInactivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutOnPeerInactivity");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestamp");
}

id objc_msgSend_toBitmap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toBitmap");
}

id objc_msgSend_toStruct(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toStruct");
}

id objc_msgSend_toaNoiseRms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toaNoiseRms");
}

id objc_msgSend_toaPpwinPeak(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toaPpwinPeak");
}

id objc_msgSend_toaPpwinRms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toaPpwinRms");
}

id objc_msgSend_tofPicSecond(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tofPicSecond");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "token");
}

id objc_msgSend_tokenData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenData");
}

id objc_msgSend_tokenVariant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenVariant");
}

id objc_msgSend_trackingState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackingState");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transform");
}

id objc_msgSend_transmitPowerOne(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transmitPowerOne");
}

id objc_msgSend_transmitPowerThree(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transmitPowerThree");
}

id objc_msgSend_transmitPowerTwo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transmitPowerTwo");
}

id objc_msgSend_triggerEnhancedDiscovery_useCase_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerEnhancedDiscovery:useCase:completion:");
}

id objc_msgSend_trueHeading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trueHeading");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_u64Identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "u64Identifier");
}

id objc_msgSend_uncacheDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uncacheDevice:");
}

id objc_msgSend_uncacheDeviceByTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uncacheDeviceByTokenData:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_uniqueIdentifierForEngine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifierForEngine:");
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unknown");
}

id objc_msgSend_unpublish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unpublish");
}

id objc_msgSend_unregisterForInternalBluetoothSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForInternalBluetoothSamples:");
}

id objc_msgSend_unregisterForVisionInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForVisionInput:");
}

id objc_msgSend_unregisterNBAMMSSessionForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterNBAMMSSessionForToken:");
}

id objc_msgSend_unregisterObserverWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterObserverWithIdentifier:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateAlgorithmAidingData_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAlgorithmAidingData:token:");
}

id objc_msgSend_updateAltimeterData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAltimeterData:");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateDeviceMotion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDeviceMotion:");
}

id objc_msgSend_updateDistanceAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDistanceAnalytics:");
}

id objc_msgSend_updateLocationAuthorized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocationAuthorized");
}

id objc_msgSend_updatePeerData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeerData:");
}

id objc_msgSend_updatePeerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeerState:");
}

id objc_msgSend_updateRanging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRanging:");
}

id objc_msgSend_updateSignallingData_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSignallingData:token:");
}

id objc_msgSend_updateTimeAnalytics_currentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimeAnalytics:currentTime:");
}

id objc_msgSend_updateWatchOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWatchOrientation:");
}

id objc_msgSend_updateWithAcquisitionReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithAcquisitionReason:");
}

id objc_msgSend_updateWithFindeePeerData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeePeerData:");
}

id objc_msgSend_updateWithFindeeRequestAt0Finder2Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeeRequestAt0Finder2Findee:");
}

id objc_msgSend_updateWithFindeeRequestAt1Finder1Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeeRequestAt1Finder1Findee:");
}

id objc_msgSend_updateWithFindeeRequestAt1Finder2Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFindeeRequestAt1Finder2Findee:");
}

id objc_msgSend_updateWithFinderPeerData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFinderPeerData:");
}

id objc_msgSend_updateWithFinderRequestAt0Finder2Findee_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFinderRequestAt0Finder2Findee:");
}

id objc_msgSend_updateWithMissedRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithMissedRange");
}

id objc_msgSend_updateWithMostRecentDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithMostRecentDistance:");
}

id objc_msgSend_updateWithMostRecentRawDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithMostRecentRawDistance:");
}

id objc_msgSend_updateWithPDR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPDR:");
}

id objc_msgSend_updateWithPeerLocationFromFMF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPeerLocationFromFMF");
}

id objc_msgSend_updateWithPose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPose:");
}

id objc_msgSend_updateWithRangeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRangeResult:");
}

id objc_msgSend_updateWithSASolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSASolution:");
}

id objc_msgSend_updateWithSolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSolution:");
}

id objc_msgSend_updateWithSuccessfulRange_uwbRSSI_nbRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSuccessfulRange:uwbRSSI:nbRSSI:");
}

id objc_msgSend_updateWithVIOPose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithVIOPose:");
}

id objc_msgSend_updatesEngine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine");
}

id objc_msgSend_updatesEngine_didUpdateAlgorithmConvergenceState_forObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:");
}

id objc_msgSend_updatesEngine_didUpdateFindeeData_forToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:didUpdateFindeeData:forToken:");
}

id objc_msgSend_updatesEngine_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:didUpdateNearbyObjects:");
}

id objc_msgSend_updatesEngine_object_didUpdateRegion_previousRegion_regionTransitionSuppressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:");
}

id objc_msgSend_updatesPolicy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesPolicy");
}

id objc_msgSend_updatesQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesQueue");
}

id objc_msgSend_useCase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useCase");
}

id objc_msgSend_userAcceleration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAcceleration");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_uwbConfigData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbConfigData");
}

id objc_msgSend_uwbExtendedDistanceAvailability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbExtendedDistanceAvailability");
}

id objc_msgSend_uwbPreciseDistanceAvailability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbPreciseDistanceAvailability");
}

id objc_msgSend_uwbProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbProvider");
}

id objc_msgSend_uwbResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbResource");
}

id objc_msgSend_uwbSessionDidFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionDidFailWithError:");
}

id objc_msgSend_uwbSessionDidInvalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionDidInvalidateWithError:");
}

id objc_msgSend_uwbSessionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionId");
}

id objc_msgSend_uwbSessionInterruptedWithReason_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionInterruptedWithReason:timestamp:");
}

id objc_msgSend_uwbSessionInterruptionReasonEnded_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSessionInterruptionReasonEnded:timestamp:");
}

id objc_msgSend_uwbSignalFeatures(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbSignalFeatures");
}

id objc_msgSend_uwbTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbTime");
}

id objc_msgSend_uwbTokenFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uwbTokenFlags");
}

id objc_msgSend_validateClientEntitlements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateClientEntitlements:");
}

id objc_msgSend_validateClientPermissions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateClientPermissions");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_vehicleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleIdentifier");
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalAccuracy");
}

id objc_msgSend_verticalDirectionEstimate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalDirectionEstimate");
}

id objc_msgSend_verticalState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalState");
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "walking");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_wifiProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiProvider");
}

id objc_msgSend_wifiRangingRangeError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiRangingRangeError:");
}

id objc_msgSend_wifiRangingReadiness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiRangingReadiness:");
}

id objc_msgSend_wifiResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiResource");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_worldAlignment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "worldAlignment");
}

id objc_msgSend_worldPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "worldPosition");
}

id objc_msgSend_worldTrackingState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "worldTrackingState");
}

id objc_msgSend_writeItem_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeItem:synchronizable:systemKeychain:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

