void sub_100005EEC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  BOOL v33;
  void *v34;
  unsigned int v35;
  uint64_t pid;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  int v45;
  BOOL v46;
  char v47;
  unsigned __int8 uu[8];
  uint64_t v49;

  v5 = a2;
  v6 = a3;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v7 = (void *)nw_agent_client_copy_endpoint(v5);
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke", 30, "FLOW: Start flow request from agent_client=%@ to endpoint=%@\n", v5, v7);

  }
  v8 = (void *)nw_agent_client_copy_parameters(v5);
  if (v8)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke", 30, "FLOW: NWParameters=%@\n", v8);
    }
    v35 = objc_msgSend(*(id *)(a1 + 32), "_isTCPTransport:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:](RPNWAgentClient, "findAgentClient:tryPort:isTCP:isFlowHandler:", v5, 1));
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "type") != (id)1
        || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flowClient")), v11, !v11))
      {
        v34 = v6;
        v12 = v10;
        v10 = 0;
        goto LABEL_31;
      }
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke", 30, "FLOW: Existing agent client is a listener, creating new agent client\n");
      }
    }
    else if (dword_1001315C0 <= 30
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke", 30, "FLOW: Failed to find agent client, creating new agent client\n");
    }
    v13 = objc_claimAutoreleasedReturnValue(+[RPNWAgentClient addAgentClient](RPNWAgentClient, "addAgentClient"));
    if (!v13)
    {
      if (dword_1001315C0 <= 90
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke", 90, "FLOW: Failed to create client\n");
      }
      goto LABEL_58;
    }
    v12 = (void *)v13;
    v34 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationService"));
    objc_msgSend(v12, "setApplicationService:", v14);

LABEL_31:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_quicProtocolOptionsFromParameters:", v8));
    v33 = v15 != 0;

    pid = nw_parameters_get_pid(v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getPersonaFromParameters:", v8));
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      if (v15)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      if (v35)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringToIndex:", 8));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke", 30, "FLOW: Parameters from agent_client PID=%d, QUIC=%@ isTCP=%@ persona=%@", pid, v17, v18, v19);

    }
    *(_QWORD *)uu = 0;
    v49 = 0;
    v20 = nw_agent_client_copy_endpoint(v5);
    v21 = v20;
    if (v20 && nw_endpoint_get_type(v20) == (nw_endpoint_type_url|nw_endpoint_type_host))
      nw_endpoint_get_service_identifier(v21, uu);
    v32 = v21;
    if (uuid_is_null(uu)
      || (v23 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", uu)) == 0)
    {
      v22 = 0;
    }
    else
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNearbyInvitationEndpoint findEndpoint:](RPNWNearbyInvitationEndpoint, "findEndpoint:", v23));

      v22 = v25 != 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyInvitationConnection"));

    if (v26)
      v27 = 1;
    else
      v27 = v22;
    v28 = *(void **)(a1 + 32);
    if (v27)
      v29 = 0;
    else
      v29 = v16;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10007D114;
    v37[3] = &unk_100113BD0;
    v38 = v12;
    v39 = v5;
    v10 = v10;
    v46 = v33;
    v47 = v35;
    v45 = pid;
    v40 = v10;
    v41 = v16;
    v42 = *(_QWORD *)(a1 + 32);
    v6 = v34;
    v43 = v8;
    v44 = v34;
    v30 = v16;
    v31 = v12;
    objc_msgSend(v28, "executeAgentLogicInPersona:pid:handlerDescription:handler:", v29, pid, CFSTR("Flow Request"), v37);

LABEL_58:
    goto LABEL_59;
  }
  if (dword_1001315C0 <= 90 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke", 90, "FLOW: Failed to copy parameters from agent_client=%@\n", v5);
LABEL_59:

}

void sub_1000077A8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "launchInstanceID"));
  LODWORD(v4) = objc_msgSend(v4, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v6, v5, 0);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void sub_100008878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

void sub_100008FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_100009374(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  CFTypeID v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != objc_msgSend(v5, "state"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "event"));
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("type"), TypeID, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (objc_msgSend(v10, "isEqual:", CFSTR("discovery")))
    {
      v11 = CFStringGetTypeID();
      v12 = CFDictionaryGetTypedValue(v7, CFSTR("serviceType"), v11, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (objc_msgSend(v13, "isEqual:", CFSTR("_companion-link._tcp")))
      {
        objc_msgSend(v5, "setState:", *(unsigned __int8 *)(a1 + 32));
        v14 = objc_msgSend(v19, "unsignedLongLongValue");
        if (dword_100130248 <= 30)
        {
          v15 = v14;
          if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30))
            LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCLink]_block_invoke", 30, "LaunchOnDemand: Discovery CLink, token %llu, state %d\n", v15, *(unsigned __int8 *)(a1 + 32));
        }
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handler"));
        v17 = (void *)v16;
        if (v16)
        {
          if (*(_BYTE *)(a1 + 32))
            v18 = 6;
          else
            v18 = 5;
          (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v16 + 16))(v16, v18, 0, 0);
        }

      }
    }

  }
}

void sub_1000098C8(uint64_t a1, uint64_t a2, void *a3)
{
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v6;
  CFTypeID v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "event"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v11, CFSTR("type"), TypeID, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (objc_msgSend(v6, "isEqual:", CFSTR("discovery")))
  {
    v7 = CFStringGetTypeID();
    v8 = CFDictionaryGetTypedValue(v11, CFSTR("serviceType"), v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_msgSend(v9, "isEqual:", CFSTR("RPUserNotificationAppSignIn")) & 1) != 0)
    {
      v10 = 0x4000000;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqual:", CFSTR("com.apple.CompanionAuthentication")))
      {
LABEL_7:

        goto LABEL_8;
      }
      v10 = 0x2000000000;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v10;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_7;
  }
LABEL_8:

}

void sub_10000F044(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F1B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F294(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_DWORD *sub_10000F924(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[27] == *(_DWORD *)(a1 + 40))
    return objc_msgSend(result, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:", a2, 0, 1);
  return result;
}

void sub_10000F950(uint64_t a1)
{

}

void sub_10000F958(uint64_t a1)
{

}

void sub_10000F960(uint64_t a1)
{

}

void sub_10000F968(uint64_t a1)
{

}

void sub_10000F970(uint64_t a1)
{

}

void sub_10000F978(uint64_t a1)
{

}

void sub_10000F980(uint64_t a1)
{

}

uint64_t sub_10000F988(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F998(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F9A8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F9B8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F9C8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F9D8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F9E8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F9F8(uint64_t result)
{
  _QWORD *v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = (_QWORD *)result;
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]_block_invoke", 90, "### Activate client failed: %@, from %#{pid}, %{error}\n", v1[4], objc_msgSend(*(id *)(v1[5] + 200), "processIdentifier"), *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 40));
    }
    result = v1[6];
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 40));
  }
  return result;
}

id sub_10000FAC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

_DWORD *sub_10000FAD4(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[27] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_clientBLEDiscoveryDeviceFound:deviceFlags:", a2, 1);
  return result;
}

_DWORD *sub_10000FAFC(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[27] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_clientBLEDiscoveryDeviceFound:deviceFlags:", a2, 1);
  return result;
}

void sub_10000FB24(id a1)
{
  +[RPNWEndpoint endpointTimerFired](RPNWEndpoint, "endpointTimerFired");
}

void sub_10000FFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100010DD0()
{
  Class result;

  if (qword_100131F08 != -1)
    dispatch_once(&qword_100131F08, &stru_1001110B0);
  result = objc_getClass("LSApplicationWorkspace");
  qword_100131F00 = (uint64_t)result;
  off_10012FF90 = (uint64_t (*)())sub_100010E2C;
  return result;
}

id sub_100010E2C()
{
  return (id)qword_100131F00;
}

void sub_100010E38(id a1)
{
  qword_100131F10 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

void sub_100011CF0(id a1)
{
  RPCloudDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPCloudDaemon);
  v2 = (void *)qword_100131F18;
  qword_100131F18 = (uint64_t)v1;

}

id sub_10001212C(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  uint64_t v11;
  _QWORD v12[4];
  uint64_t v13;

  if (dword_100130118 <= 30 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon activate]_block_invoke", 30, "Activate\n");
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[15])
  {
    v3 = objc_alloc_init((Class)CUSystemMonitor);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001227C;
    v12[3] = &unk_1001110F8;
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v13 + 120), "setFirstUnlockHandler:", v12);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012284;
    v10[3] = &unk_1001110F8;
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v11 + 120), "setPrimaryAppleIDChangedHandler:", v10);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 120);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001228C;
    v9[3] = &unk_1001110F8;
    v9[4] = v6;
    objc_msgSend(v7, "activateWithCompletion:", v9);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "prefsChanged");
}

id sub_10001227C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_100012284(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_primaryAppleIDChanged");
}

id sub_10001228C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_1000122EC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_100012E80(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 128));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 0;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v3;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v26;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "senderCorrelationIdentifier"));

              if (v15)
              {
                v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "senderCorrelationIdentifier"));
                if (dword_100130118 <= 30
                  && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
                {
                  LogPrintF(&dword_100130118, "-[RPCloudDaemon idsCorrelationIdentifier]_block_invoke", 30, "Self IDS Correlation Identifier for primary AppleID: %@ changed from %@ -> %@\n", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v16);
                }
                v17 = *(_QWORD *)(a1 + 32);
                v18 = *(void **)(v17 + 8);
                *(_QWORD *)(v17 + 8) = v16;

                goto LABEL_21;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_21:

        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
          break;
        if ((id)++v7 == v5)
        {
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }

    v3 = v19;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
      && dword_100130118 <= 30
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon idsCorrelationIdentifier]_block_invoke", 30, "Failed to get self IDS Correlation Identifier\n");
    }
  }

}

void sub_1000131EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013354(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001350C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001376C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v32 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 0;
  if (dword_100130118 <= 30 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 30)))
    LogPrintF(&dword_100130118, "-[RPCloudDaemon idsFamilyEndpointsUpdateWithForce:]_block_invoke", 30, "Family IDS query completed.\n");
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 128));
  v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = v6;

  if (v5)
  {
    if (dword_100130118 <= 90
      && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
    {
      LogPrintF(&dword_100130118, "-[RPCloudDaemon idsFamilyEndpointsUpdateWithForce:]_block_invoke", 90, "Error with family endpoint query: %@", v5);
    }
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(v27 + 80);
    *(_QWORD *)(v27 + 80) = 0;

  }
  else
  {
    v29 = a1;
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allKeys"));
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v33)
    {
      v31 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v31)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endpoints"));

          if (v14)
          {
            v34 = v13;
            v35 = i;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endpoints"));
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v17; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v37 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(v9, "addObject:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "familyEndpointData"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deviceUniqueID"));

                  if (v22)
                  {
                    objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v22);
                  }
                  else if (dword_100130118 <= 90
                         && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
                  {
                    LogPrintF(&dword_100130118, "-[RPCloudDaemon idsFamilyEndpointsUpdateWithForce:]_block_invoke", 90, "Family endpoint IDS ID is nil");
                  }

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v17);
            }

            v13 = v34;
            i = v35;
          }
          else if (dword_100130118 <= 90
                 && (dword_100130118 != -1 || _LogCategory_Initialize(&dword_100130118, 90)))
          {
            LogPrintF(&dword_100130118, "-[RPCloudDaemon idsFamilyEndpointsUpdateWithForce:]_block_invoke", 90, "Family infoResult.endpoints is nil for uri: %@", v12);
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v33);
    }

    v23 = *(_QWORD *)(v29 + 32);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v10;
    v25 = v10;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v26, "postDaemonInfoChanges:", 2048);

    v5 = 0;
  }

}

void sub_100013CF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013E98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001408C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014234(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000143DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014584(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *sub_100014B50(int a1)
{
  const char *result;

  if (a1 > 47)
  {
    if (a1 <= 63)
    {
      if (a1 == 48)
        return "WatchIdentityRequest";
      if (a1 == 49)
        return "WatchIdentityResponse";
    }
    else
    {
      switch(a1)
      {
        case '@':
          return "FriendIdentityRequest";
        case 'A':
          return "FriendIdentityResponse";
        case 'B':
          return "FriendIdentityUpdate";
      }
    }
    return "?";
  }
  else
  {
    result = "Invalid";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "NoOp";
        break;
      case 3:
        result = "PS_Start";
        break;
      case 4:
        result = "PS_Next";
        break;
      case 5:
        result = "PV_Start";
        break;
      case 6:
        result = "PV_Next";
        break;
      case 7:
        result = "U_OPACK";
        break;
      case 8:
        result = "E_OPACK";
        break;
      case 9:
        result = "P_OPACK";
        break;
      case 10:
        result = "PA_Req";
        break;
      case 11:
        result = "PA_Rsp";
        break;
      case 16:
        result = "SessionStartRequest";
        break;
      case 17:
        result = "SessionStartResponse";
        break;
      case 18:
        result = "SessionData";
        break;
      case 32:
        result = "FamilyIdentityRequest";
        break;
      case 33:
        result = "FamilyIdentityResponse";
        break;
      case 34:
        result = "FamilyIdentityUpdate";
        break;
      default:
        return "?";
    }
  }
  return result;
}

void sub_1000172F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t *RPBonjourFlagsUpdateWithRPCompanionLinkFlags(unint64_t *result, unsigned int a2)
{
  *result = *result & 0xFFFFFFFFFFFFF803 | (a2 >> 1) & 4 | (2 * a2) & 0x68 | (16 * ((a2 >> 1) & 1)) | (a2 >> 1) & 0x80 | (a2 >> 2) & 0x700;
  return result;
}

BOOL sub_100017404()
{
  if (qword_100131F30 != -1)
    dispatch_once(&qword_100131F30, &stru_100111280);
  return byte_100131F28 && IsAppleInternalBuild() != 0;
}

void sub_10001745C(id a1)
{
  byte_100131F28 = MGGetBoolAnswer(CFSTR("IsVirtualDevice"));
}

id RPErrorF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  v9 = NSErrorV(CFSTR("RPErrorDomain"), a1, a2, &a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id sub_1000174BC(void *a1)
{
  void *v1;
  void *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(",")));
  if ((unint64_t)objc_msgSend(v1, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", 0));
    v3 = (char *)objc_msgSend(v2, "rangeOfString:", CFSTR("iPad"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringFromIndex:", &v3[v4]));

      v6 = objc_msgSend(v5, "intValue");
      v2 = v5;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

id sub_100017564(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(",")));
  if ((unint64_t)objc_msgSend(v1, "count") < 2)
  {
    v3 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", 1));
    if (objc_msgSend(v2, "length"))
      v3 = objc_msgSend(v2, "intValue");
    else
      v3 = 0;

  }
  return v3;
}

id sub_1000175E8(void *a1)
{
  void *v1;
  void *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(",")));
  if ((unint64_t)objc_msgSend(v1, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", 0));
    v3 = (char *)objc_msgSend(v2, "rangeOfString:", CFSTR("AppleTV"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringFromIndex:", &v3[v4]));

      v6 = objc_msgSend(v5, "intValue");
      v2 = v5;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

id RPNestedErrorF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  v9 = NSErrorNestedV(CFSTR("RPErrorDomain"), a2, a1, a3, &a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id RPVersionToSourceVersionString(uint64_t a1)
{
  void *v1;
  _BYTE v3[16];

  v3[0] = 0;
  SourceVersionToCString(a1, v3);
  if (v3[0])
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  else
    v1 = 0;
  return v1;
}

id sub_100017740(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned __int16 v8;
  id v9;
  void *v10;

  v3 = GestaltProductTypeStringToDeviceClass();
  v4 = *a2;
  v5 = a2[2];
  v6 = a2[4];
  if ((DeviceOSVersionAtOrLaterEx(v3, *a2, v5, v6, 180000, 150000, 180000, 110000, 20000) & 1) != 0)
  {
    v7 = 6000000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLaterEx(v3, *a2, a2[2], a2[4], 170600, 140600, 170600, 100600, 10300) & 1) != 0)
  {
    v7 = 5600000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLaterEx(v3, *a2, a2[2], a2[4], 170500, 140500, 170500, 100500, 10200) & 1) != 0)
  {
    v7 = 5500000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLaterEx(v3, *a2, a2[2], a2[4], 170400, 140400, 170400, 100400, 10100) & 1) != 0)
  {
    v7 = 5420000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLaterEx(v3, *a2, a2[2], a2[4], 170300, 140300, 170300, 100300, 10000) & 1) != 0)
  {
    v7 = 5300000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLaterEx(v3, *a2, a2[2], a2[4], 170200, 140200, 170200, 100200, 10000) & 1) != 0)
  {
    v7 = 5220000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLaterEx(v3, *a2, a2[2], a2[4], 170100, 140100, 170100, 100100, 10000) & 1) != 0)
  {
    v7 = 5100000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 170000, 140000, 170000, 100000) & 1) != 0)
  {
    v7 = 5000000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 160400, 130300, 160400, 90400) & 1) != 0)
  {
    v7 = 4400000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 160300, 130200, 160300, 90300) & 1) != 0)
  {
    v7 = 4300000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 160200, 130100, 160200, 90200) & 1) != 0)
  {
    v7 = 4200000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 160100, 130000, 160100, 90100) & 1) != 0)
  {
    v7 = 4100000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 160000, 130000, 160000, 90000) & 1) != 0)
  {
    v7 = 4000000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 150400, 120300, 150400, 80500) & 1) != 0)
  {
    v7 = 3400000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 150300, 120200, 150300, 80300) & 1) != 0)
  {
    v7 = 3300000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 150200, 120100, 150200, 80300) & 1) != 0)
  {
    v7 = 3200000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 150100, 120001, 150100, 80100) & 1) != 0)
  {
    v7 = 3100000;
    goto LABEL_58;
  }
  if (DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 150000, 120000, 150000, 80000))
  {
    if ((_DWORD)v3 == 100)
      v7 = 3050000;
    else
      v7 = 3000000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 140700, 110500, 140700, 70600) & 1) != 0)
  {
    v7 = 2600000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 140600, 110400, 140600, 70500) & 1) != 0)
  {
    v7 = 2500000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 140500, 110300, 140500, 70400) & 1) != 0)
  {
    v7 = 2400000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 140400, 110200, 140400, 70300) & 1) != 0)
  {
    v7 = 2300000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 140300, 110100, 140300, 70200) & 1) != 0)
  {
    v7 = 2200000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 140200, 110000, 140200, 70100) & 1) != 0)
  {
    v7 = 2100000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 140000, 101600, 140000, 70000) & 1) != 0)
  {
    v7 = 2000000;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 130202, 101504, 130202, 60102) & 1) != 0)
  {
    v8 = -16080;
LABEL_57:
    v7 = v8 | 0x1D0000u;
    goto LABEL_58;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 130201, 101502, 130201, 60101) & 1) != 0)
  {
    v8 = 19456;
    goto LABEL_57;
  }
  if ((DeviceOSVersionAtOrLater(v3, *a2, a2[2], a2[4], 130200, 101501, 130200, 60100) & 1) != 0)
  {
    v7 = 1900000;
  }
  else if (NADyFF4UGjtVGBmEW6h(v3, *a2, a2[2], a2[4]))
  {
    if (((v3 & 0xFFFFFFFD) == 1 || (_DWORD)v3 == 2) && 10000 * v4 + 100 * v5 + v6 > 0x1FC33)
      v7 = 1820000;
    else
      v7 = 1800000;
  }
  else if ((TN6sBSnEP2(v3, *a2, a2[2], a2[4]) & 1) != 0)
  {
    v7 = 1660000;
  }
  else
  {
    if (!wInTP56r94EFs9NAAi(v3, *a2, a2[2], a2[4]))
    {
      v10 = 0;
      return v10;
    }
    v7 = 1600000;
  }
LABEL_58:
  v9 = RPVersionToSourceVersionString(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  return v10;
}

id sub_100017F40(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (*a1 < 1)
  {
    v11 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a1[1]));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a1[2]));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(".%@"), v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(".%@"), v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v10));

  }
  return v11;
}

void sub_10001807C(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(".")));
  v3 = objc_msgSend(v8, "count");
  if (v3)
  {
    v4 = (unint64_t)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    *a2 = objc_msgSend(v5, "integerValue");

    if (v4 != 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
      a2[1] = objc_msgSend(v6, "integerValue");

      if (v4 >= 3)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 2));
        a2[2] = objc_msgSend(v7, "integerValue");

      }
    }
  }

}

BOOL sub_100018144(int a1)
{
  return a1 == 4 || a1 == 7;
}

BOOL sub_100018154()
{
  if (qword_100131F40 != -1)
    dispatch_once(&qword_100131F40, &stru_1001112A0);
  return (byte_100131F38 & 1) == 0;
}

void sub_10001819C(id a1)
{
  int v1;

  if ((os_variant_has_internal_content("com.apple.rapport") & 1) == 0)
    byte_100131F38 = 1;
  v1 = 0;
  if (CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("privateLoggingEnabled"), &v1))
    byte_100131F38 = 0;
}

id sub_1000181FC(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCString:encoding:](NSMutableString, "stringWithCString:encoding:", a1, 4));
  v4 = v3;
  if (a2)
    v5 = CFSTR("'%@'");
  else
    v5 = CFSTR("'%~@'");
  objc_msgSend(v3, "appendString:", v5);
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");

  return v7;
}

void sub_100018538(id a1)
{
  RPCompanionLinkDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPCompanionLinkDaemon);
  v2 = (void *)qword_100131F48;
  qword_100131F48 = (uint64_t)v1;

}

BOOL sub_100018750(id a1, NSString *a2)
{
  return -[NSString hasPrefix:](a2, "hasPrefix:", CFSTR("AppleTV"));
}

BOOL sub_100018760(id a1, NSString *a2)
{
  NSString *v2;
  unsigned __int8 v3;

  v2 = a2;
  if (-[NSString hasPrefix:](v2, "hasPrefix:", CFSTR("AudioAccessory1,"))
    || -[NSString hasPrefix:](v2, "hasPrefix:", CFSTR("AudioAccessory5,"))
    || -[NSString hasPrefix:](v2, "hasPrefix:", CFSTR("AudioAccessory6,")))
  {
    v3 = 1;
  }
  else
  {
    v3 = -[NSString hasPrefix:](v2, "hasPrefix:", CFSTR("HomePod"));
  }

  return v3;
}

BOOL sub_1000187E4(id a1, NSString *a2)
{
  return -[NSString containsString:](a2, "containsString:", CFSTR("Mac"));
}

BOOL sub_1000187F4(id a1, NSString *a2)
{
  return -[NSString hasPrefix:](a2, "hasPrefix:", CFSTR("iPad"));
}

BOOL sub_100018804(id a1, NSString *a2)
{
  return -[NSString hasPrefix:](a2, "hasPrefix:", CFSTR("iPhone"));
}

BOOL sub_100018814(id a1, NSString *a2)
{
  return -[NSString hasPrefix:](a2, "hasPrefix:", CFSTR("iPod"));
}

BOOL sub_100018824(id a1, NSString *a2)
{
  return -[NSString hasPrefix:](a2, "hasPrefix:", CFSTR("Watch"));
}

BOOL sub_100018834(id a1, unint64_t a2)
{
  return (a2 >> 19) & 1;
}

BOOL sub_10001883C(id a1, unint64_t a2)
{
  return (a2 >> 14) & 1;
}

BOOL sub_100018844(id a1, unint64_t a2)
{
  return (a2 >> 17) & 1;
}

BOOL sub_10001884C(id a1, unint64_t a2)
{
  return (a2 >> 13) & 1;
}

void sub_1000189A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000189BC(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v5 = a2;
  v19 = v5;
  if (dword_100130248 <= 30)
  {
    if (dword_100130248 != -1 || (v9 = _LogCategory_Initialize(&dword_100130248, 30), v5 = v19, v9))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerDeviceInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDeviceIdentifier"));
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon findServerClientFromID:senderIDS:]_block_invoke", 30, "Checking peerIdentifier=%@, idsDeviceIdentifier=%@\n", v6, v8);

      v5 = v19;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerIdentifier"));
  if (objc_msgSend(v10, "isEqualToString:", a1[4]))
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerDeviceInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceIdentifier"));
    v13 = objc_msgSend(v12, "isEqual:", a1[5]);

    if (!v13)
      goto LABEL_13;
  }
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerDeviceInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon findServerClientFromID:senderIDS:]_block_invoke", 30, "Found match, returning device='%@'\n", v15);

  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerDeviceInfo"));
  v17 = *(_QWORD *)(a1[6] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  *a3 = 1;
LABEL_13:

}

void sub_100018D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018D38(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peerDeviceInfo"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

void sub_10001A2B4(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Block_object_dispose(&STACK[0x568], 8);
  _Unwind_Resume(a1);
}

void sub_10001A364(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id obj;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bleDevice"));
  v6 = CUDescriptionWithLevel(v5, *(unsigned int *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  NSAppendPrintF(&obj, "    %@\n", v7);
  objc_storeStrong((id *)(v4 + 40), obj);

}

void sub_10001A3E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "    %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

void sub_10001A450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "   %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

void sub_10001A4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "    %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

void sub_10001A520(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(&obj, "    %@\n", v8);
  objc_storeStrong((id *)(v6 + 40), obj);

  v9 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 >= 0x11)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(id *)(v10 + 40);
    NSAppendPrintF(&v11, "    ... %d more not shown\n", *(_DWORD *)(a1 + 48) - v9);
    objc_storeStrong((id *)(v10 + 40), v11);
    *a4 = 1;
  }
}

void sub_10001A600(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(&obj, "    %@\n", v8);
  objc_storeStrong((id *)(v6 + 40), obj);

  v9 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 >= 0x11)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(id *)(v10 + 40);
    NSAppendPrintF(&v11, "    ... %d more not shown\n", *(_DWORD *)(a1 + 48) - v9);
    objc_storeStrong((id *)(v10 + 40), v11);
    *a4 = 1;
  }
}

void sub_10001A6E0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(&obj, "    %@\n", v8);
  objc_storeStrong((id *)(v6 + 40), obj);

  v9 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 >= 0x11)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(id *)(v10 + 40);
    NSAppendPrintF(&v11, "    ... %d more not shown\n", *(_DWORD *)(a1 + 48) - v9);
    objc_storeStrong((id *)(v10 + 40), v11);
    *a4 = 1;
  }
}

void sub_10001A7C0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(&obj, "    %@\n", v8);
  objc_storeStrong((id *)(v6 + 40), obj);

  v9 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 >= 0x11)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(id *)(v10 + 40);
    NSAppendPrintF(&v11, "    ... %d more not shown\n", *(_DWORD *)(a1 + 48) - v9);
    objc_storeStrong((id *)(v10 + 40), v11);
    *a4 = 1;
  }
}

void sub_10001A8A0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(&obj, "    %@\n", v8);
  objc_storeStrong((id *)(v6 + 40), obj);

  v9 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 >= 0x11)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(id *)(v10 + 40);
    NSAppendPrintF(&v11, "    ... %d more not shown\n", *(_DWORD *)(a1 + 48) - v9);
    objc_storeStrong((id *)(v10 + 40), v11);
    *a4 = 1;
  }
}

void sub_10001A980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "    %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

void sub_10001A9E8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  id obj;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("serviceType")));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v5, "state");

  NSAppendPrintF(&obj, "    %@ : %@, state %d, token %@\n", v8, v9, v11, v6);
  objc_storeStrong((id *)(v10 + 40), obj);

}

void sub_10001AACC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id obj;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
  v8 = objc_msgSend(v5, "sessionID");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_msgSend(v5, "startTicks");

  v11 = UpTicksToSeconds(v9 - (_QWORD)v10);
  NSAppendPrintF(&obj, "    Service %@, PeerID %@, ID 0x%llX, %ll{dur}\n", v6, v7, v8, v11);
  objc_storeStrong((id *)(v4 + 40), obj);

}

id sub_10001ABE8(id result)
{
  uint64_t v1;

  v1 = *((_QWORD *)result + 4);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    return _objc_msgSend(*((id *)result + 4), "_activate");
  }
  return result;
}

id sub_10001AE60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prefsChanged");
}

_QWORD *sub_10001AE68(uint64_t a1)
{
  const char *v2;
  _QWORD *result;

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 504))
      v2 = "yes";
    else
      v2 = "no";
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activate]_block_invoke_2", 30, "HomeKit wait ending: LTPK %s\n", v2);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 528) = 0;
  result = *(_QWORD **)(a1 + 32);
  if (!result[63])
    return objc_msgSend(result, "_update");
  return result;
}

id sub_10001AF24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void sub_10001AF2C(uint64_t a1)
{
  id v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 564) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_localDeviceUpdate");
  v1 = (id)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v1, "updateSharedTVIdentities");

}

id sub_10001AFCC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_10001CF08(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  CFTypeID v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "event"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("type"), TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (objc_msgSend(v10, "isEqual:", CFSTR("discovery")))
  {
    v11 = CFStringGetTypeID();
    v12 = CFDictionaryGetTypedValue(v7, CFSTR("serviceType"), v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (objc_msgSend(v13, "isEqual:", CFSTR("RPUserNotificationAppSignIn")))
    {
      v20[0] = CFSTR("type");
      v20[1] = CFSTR("serviceType");
      v21[0] = v10;
      v21[1] = v13;
      v20[2] = CFSTR("deviceID");
      v21[2] = *(_QWORD *)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v15 = objc_msgSend(v5, "unsignedLongLongValue");
        v16 = CUDescriptionWithLevel(*(_QWORD *)(a1 + 40), 20);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryUINoteDevice:]_block_invoke", 30, "LaunchOnDemand: Discovery UINote, token %llu, service %@, Device %@\n", v15, v13, v17);

      }
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handler"));
      v19 = (void *)v18;
      if (v18)
        (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v18 + 16))(v18, 0, v14, 0);

    }
  }

}

void sub_10001D1B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v10;
  CFTypeID v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "event"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v7, CFSTR("type"), TypeID, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (objc_msgSend(v10, "isEqual:", CFSTR("discovery")))
  {
    v11 = CFStringGetTypeID();
    v12 = CFDictionaryGetTypedValue(v7, CFSTR("serviceType"), v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (objc_msgSend(v13, "isEqual:", CFSTR("com.apple.CompanionAuthentication")))
    {
      v20[0] = CFSTR("type");
      v20[1] = CFSTR("serviceType");
      v21[0] = v10;
      v21[1] = v13;
      v20[2] = CFSTR("deviceID");
      v21[2] = *(_QWORD *)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v15 = objc_msgSend(v5, "unsignedLongLongValue");
        v16 = CUDescriptionWithLevel(*(_QWORD *)(a1 + 40), 20);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _reportXPCMatchingDiscoveryCompanionAuthenticationDevice:]_block_invoke", 30, "LaunchOnDemand: Discovery Companion Authentication, token %llu, service %@, Device %@\n", v15, v13, v17);

      }
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handler"));
      v19 = (void *)v18;
      if (v18)
        (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v18 + 16))(v18, 0, v14, 0);

    }
  }

}

id sub_10001D3B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10001D3B8(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  const char *v4;

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "meDeviceName"));
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "meDeviceIsMe");
    v4 = "no";
    if (v3)
      v4 = "yes";
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _update]_block_invoke_2", 30, "Me device changed to %@ meDeviceIsMe: %s\n", v2, v4);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10001D470(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10001D478(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 601) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10001D48C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10001D494(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10001D49C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void sub_10001D4A4(uint64_t a1)
{
  id v2;

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "bluetoothAddressData")));
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _update]_block_invoke_8", 30, "Bluetooth address changed to: %.6a", COERCE_DOUBLE(objc_msgSend(v2, "bytes")));

  }
}

void sub_10001D548(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (v2
    && dword_100130248 <= 90
    && ((v5 = v2, dword_100130248 != -1) || (v4 = _LogCategory_Initialize(&dword_100130248, 90), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _update]_block_invoke_9", 90, "Failed to start CBAdvertiser: %@", v3);

  }
  else
  {

  }
}

void sub_10001D5CC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDeviceMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nsuuid"));
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nsuuid"));
    objc_msgSend(v7, "addObject:", v8);
LABEL_3:

    goto LABEL_8;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "client"));
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateForXPCClientChange]_block_invoke", 90, "Could not find BT ID for IDS DeviceID: %@ from client %@", v9, v8);
    goto LABEL_3;
  }
LABEL_8:

}

void sub_10001D9C4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[4];
  void *v37;
  _QWORD v38[4];
  _QWORD v39[2];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v35 = a1;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 856);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "xpcCnx"));
        v9 = objc_msgSend(v8, "processIdentifier");

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
        v11 = objc_msgSend(v2, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
          objc_msgSend(v2, "addObject:", v12);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v5);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = v2;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "intValue")));
        v40 = 0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v19, &v40));
        v21 = v40;
        v22 = v21;
        if (v20)
          v23 = v21 == 0;
        else
          v23 = 0;
        if (v23 && objc_msgSend(v20, "isApplication"))
          objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "count"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingIdentifiers:](RBSProcessPredicate, "predicateMatchingIdentifiers:", v13));
    if (*(_QWORD *)(*(_QWORD *)(v35 + 32) + 648))
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateRBSMonitorStateForXPCClients]_block_invoke", 30, "Updating RBS process monitor\n");
      }
      v27 = *(void **)(*(_QWORD *)(v35 + 32) + 648);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10001E1DC;
      v36[3] = &unk_100111740;
      v28 = &v37;
      v37 = v24;
      v29 = v24;
      objc_msgSend(v27, "updateConfiguration:", v36);
    }
    else
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateRBSMonitorStateForXPCClients]_block_invoke", 30, "Starting RBS process monitor\n");
      }
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10001DE08;
      v38[3] = &unk_100111718;
      v28 = (id *)v39;
      v30 = *(_QWORD *)(v35 + 32);
      v39[0] = v24;
      v39[1] = v30;
      v31 = v24;
      v32 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v38));
      v33 = *(_QWORD *)(v35 + 32);
      v34 = *(void **)(v33 + 648);
      *(_QWORD *)(v33 + 648) = v32;

    }
    goto LABEL_39;
  }
  v25 = *(void **)(*(_QWORD *)(v35 + 32) + 648);
  if (v25)
  {
    objc_msgSend(v25, "invalidate");
    v26 = *(_QWORD *)(v35 + 32);
    v24 = *(void **)(v26 + 648);
    *(_QWORD *)(v26 + 648) = 0;
LABEL_39:

  }
}

void sub_10001DE08(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  v4 = objc_alloc_init((Class)RBSProcessStateDescriptor);
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(v3, "setPredicates:", v5);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DED4;
  v6[3] = &unk_1001116F0;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "setUpdateHandler:", v6);

}

void sub_10001DED4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v11 = objc_msgSend(v8, "pid");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previousState"));
    v13 = NSStringFromRBSTaskState(objc_msgSend(v12, "taskState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "state"));
    v16 = NSStringFromRBSTaskState(objc_msgSend(v15, "taskState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _updateRBSMonitorStateForXPCClients]_block_invoke_3", 30, "Process %@:%d state update %@ -> %@\n", v10, v11, v14, v17);

  }
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(NSObject **)(v18 + 1000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E074;
  block[3] = &unk_1001116C8;
  block[4] = v18;
  v23 = v8;
  v24 = v9;
  v20 = v9;
  v21 = v8;
  dispatch_async(v19, block);

}

void sub_10001E074(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 856);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcCnx", (_QWORD)v14));
        v9 = objc_msgSend(v8, "processIdentifier");
        v10 = objc_msgSend(*(id *)(a1 + 40), "pid");

        if (v9 == v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "state"));
          v12 = objc_msgSend(v11, "taskState");

          if (v12 == 3)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcCnx"));
            objc_msgSend(v13, "invalidate");

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void sub_10001E1DC(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v2));
  objc_msgSend(v3, "setPredicates:", v4);

}

void sub_10001E2E4(id a1, NSString *a2, RPConnection *a3, BOOL *a4)
{
  -[RPConnection invalidate](a3, "invalidate");
}

void sub_10001E2EC(id a1, NSString *a2, RPConnection *a3, BOOL *a4)
{
  -[RPConnection invalidate](a3, "invalidate");
}

void sub_10001E2F4(id a1, NSString *a2, RPConnection *a3, BOOL *a4)
{
  -[RPConnection invalidate](a3, "invalidate");
}

_DWORD *sub_10001E2FC(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[18] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_clientBLEDiscoveryDeviceFound:deviceFlags:", a2, 2);
  return result;
}

_DWORD *sub_10001E324(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[18] == *(_DWORD *)(a1 + 40))
    return objc_msgSend(result, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:", a2, 0, 2);
  return result;
}

_DWORD *sub_10001E350(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[18] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_clientBLEDiscoveryDeviceFound:deviceFlags:", a2, 2);
  return result;
}

uint64_t sub_10001E378(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(*(_QWORD *)(result + 32) + 72);
  if (v1 == *(_DWORD *)(result + 40) && dword_100130248 <= 30)
  {
    if (dword_100130248 != -1)
      return LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted]_block_invoke_4", 30, "BLE action discovery interrupted ID %u\n", v1);
    v2 = result;
    result = _LogCategory_Initialize(&dword_100130248, 30);
    if ((_DWORD)result)
    {
      v1 = *(_DWORD *)(v2 + 40);
      return LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted]_block_invoke_4", 30, "BLE action discovery interrupted ID %u\n", v1);
    }
  }
  return result;
}

void sub_10001E40C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted]_block_invoke_5", 90, "### BLE action discovery start failed: %{error}\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = 0;

    goto LABEL_10;
  }
  if (dword_100130248 <= 30)
  {
    v8 = 0;
    if (dword_100130248 != -1 || (v7 = _LogCategory_Initialize(&dword_100130248, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEActionDiscoveryEnsureStarted]_block_invoke_5", 30, "BLE action discovery started\n");
LABEL_10:
      v4 = v8;
    }
  }

}

uint64_t sub_10001E6C0(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(*(_QWORD *)(result + 32) + 108);
  if (v1 == *(_DWORD *)(result + 40) && dword_100130248 <= 30)
  {
    if (dword_100130248 != -1)
      return LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]_block_invoke_4", 30, "BLE discovery interrupted ID %u\n", v1);
    v2 = result;
    result = _LogCategory_Initialize(&dword_100130248, 30);
    if ((_DWORD)result)
    {
      v1 = *(_DWORD *)(v2 + 40);
      return LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]_block_invoke_4", 30, "BLE discovery interrupted ID %u\n", v1);
    }
  }
  return result;
}

void sub_10001E754(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]_block_invoke_5", 90, "### BLE discovery start failed: %{error}\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = 0;

    goto LABEL_10;
  }
  if (dword_100130248 <= 30)
  {
    v8 = 0;
    if (dword_100130248 != -1 || (v7 = _LogCategory_Initialize(&dword_100130248, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLEDiscoveryEnsureStarted]_block_invoke_5", 30, "BLE discovery started\n");
LABEL_10:
      v4 = v8;
    }
  }

}

void sub_10001EB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001EB3C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    if (dword_100130248 <= 90)
    {
      if (dword_100130248 != -1 || (v5 = _LogCategory_Initialize(&dword_100130248, 90), v4 = v7, v5))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLETriggerEnhancedDiscovery:useCase:error:]_block_invoke", 90, "### BLE triger enhanced discovery failed: %{error}\n", v4);
        v4 = v7;
      }
    }
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = objc_retainAutorelease(v4);
      v4 = v7;
      **(_QWORD **)(a1 + 40) = v6;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

id sub_10001ECF4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 624));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 624);
  *(_QWORD *)(v2 + 624) = 0;

  return _objc_msgSend(*(id *)(a1 + 32), "_processPendingLostBLEDevices");
}

void sub_10001FB44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v11 = v3;
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]_block_invoke", 90, "### BLE NeedsCLink advertiser failed: %@\n", v11);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "invalidate");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 168);
    *(_QWORD *)(v8 + 168) = 0;

LABEL_15:
    v4 = v11;
    goto LABEL_16;
  }
  if (dword_100130248 <= 30)
  {
    v11 = 0;
    if (dword_100130248 != -1 || (v10 = _LogCategory_Initialize(&dword_100130248, 30), v4 = 0, v10))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = "yes";
      if (*(_BYTE *)(v5 + 204))
        v7 = "yes";
      else
        v7 = "no";
      if (!*(_BYTE *)(v5 + 400))
        v6 = "no";
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientBLENeedsCLinkAdvertiserEnsureStarted]_block_invoke", 30, "BLE NeedsCLink advertiser started. ScreenOff: %s, AWDLGuestDiscovery %s, targeting %@ \n", v7, v6, *(_QWORD *)(v5 + 176));
      goto LABEL_15;
    }
  }
LABEL_16:

}

void sub_1000202C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = 0;

  }
}

void sub_1000207D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000207F8(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      goto LABEL_11;
    v10 = 0;
    v5 = *(void **)(a1[4] + 584);
    if (!v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v7 = a1[4];
      v8 = *(void **)(v7 + 584);
      *(_QWORD *)(v7 + 584) = v6;

      v5 = *(void **)(a1[4] + 584);
    }
    objc_msgSend(v5, "addObject:", a1[5]);
LABEL_9:
    v4 = v10;
    goto LABEL_11;
  }
  if (dword_100130248 <= 30)
  {
    v10 = v3;
    if (dword_100130248 != -1 || (v9 = _LogCategory_Initialize(&dword_100130248, 30), v4 = v10, v9))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientSendNeedsAWDLOverWiFi:]_block_invoke", 30, "### Failed to send NeedsAWDL event: %@\n", v4);
      goto LABEL_9;
    }
  }
LABEL_11:

}

_QWORD *sub_1000208DC(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[34])
    return objc_msgSend(result, "_clientBonjourFoundDevice:reevaluate:", a2, 0);
  return result;
}

_QWORD *sub_1000208F8(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[34])
    return objc_msgSend(result, "_clientBonjourLostDevice:", a2);
  return result;
}

_QWORD *sub_100020910(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[34])
    return objc_msgSend(result, "_clientBonjourFoundDevice:reevaluate:", a2, 0);
  return result;
}

id sub_1000213B8(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector(v1, "shortDescription") & 1) != 0)
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "shortDescription"));
  }
  else if ((objc_opt_respondsToSelector(v1, "descriptionWithLevel:") & 1) != 0)
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "descriptionWithLevel:", 50));
  }
  else
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
  }
  v3 = (void *)v2;

  return v3;
}

_QWORD *sub_100022328(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v1 = result[5];
  if (result[4] == *(_QWORD *)(v1 + 304))
  {
    v2 = result;
    *(_QWORD *)(v1 + 296) = 0;
    v3 = *(void **)(result[5] + 304);
    if (v3)
    {
      v4 = v3;
      dispatch_source_cancel(v4);
      v5 = v2[5];
      v6 = *(void **)(v5 + 304);
      *(_QWORD *)(v5 + 304) = 0;

    }
    return objc_msgSend((id)v2[5], "_clientBonjourReevaluateAllDevices");
  }
  return result;
}

_QWORD *sub_100022734(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[35])
    return _objc_msgSend(result, "_clientBonjourAWDLBrowserFoundDevice:", a2);
  return result;
}

_QWORD *sub_10002274C(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[35])
    return _objc_msgSend(result, "_clientBonjourAWDLBrowserLostDevice:", a2);
  return result;
}

_QWORD *sub_100022764(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[35])
    return _objc_msgSend(result, "_clientBonjourAWDLBrowserFoundDevice:", a2);
  return result;
}

id sub_100024060(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clientConnectionEnded:uniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_clientBonjourReevaluateAllDevices");
}

void sub_10002408C(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_stereoDeviceUpdate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_personalDeviceUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerDeviceInfo"));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_activeDeviceChanged:changes:", v2, 2);
    v2 = v3;
  }

}

id sub_1000240F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedEventID:event:options:unauth:cnx:", a2, a3, a4, 0, *(_QWORD *)(a1 + 40));
}

id sub_10002410C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedRequestID:request:options:responseHandler:unauth:cnx:", a2, a3, a4, a5, 0, *(_QWORD *)(a1 + 40));
}

id sub_10002412C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionStateChanged:cnx:", a2, *(_QWORD *)(a1 + 40));
}

void sub_10002413C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeKitUserIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_filterHomeKitUserIdentifiers:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  objc_msgSend(v5, "setHomeKitUserIdentifiers:", v4);

}

void sub_1000241C0(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerIdentifier"));
  objc_msgSend(v1, "_sendProxyDeviceUpdateToPeer:", v2);

}

id sub_100024EE0(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "authCompletion:", a2);
}

id sub_100024EEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "promptForPasswordType:flags:throttleSeconds:", objc_msgSend(*(id *)(a1 + 40), "passwordTypeActual"), a2, a3);
}

void sub_100024F2C(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  objc_msgSend(*(id *)(a1 + 32), "_clientOnDemandConnectionEnded:uniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 856);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "netCnx", (_QWORD)v13));
        v9 = v8;
        if (v8 == *(void **)(a1 + 40))
        {

        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cnx"));
          v12 = *(void **)(a1 + 40);

          if (v11 != v12)
            continue;
        }
        objc_msgSend(v7, "handleDisconnect");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

id sub_100025094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedEventID:event:options:unauth:cnx:", a2, a3, a4, 0, *(_QWORD *)(a1 + 40));
}

id sub_1000250B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedRequestID:request:options:responseHandler:unauth:cnx:", a2, a3, a4, a5, 0, *(_QWORD *)(a1 + 40));
}

id sub_1000250D0(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToDevice:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152)))
      objc_msgSend(*(id *)(a1 + 40), "_clientBLENearbyActionV2AdvertiserRestart");
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToDevice:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176)))
      objc_msgSend(*(id *)(a1 + 40), "_clientBLENeedsCLinkAdvertiserRestart");
  }
  return objc_msgSend(*(id *)(a1 + 40), "_connectionStateChanged:cnx:", a2, *(_QWORD *)(a1 + 48));
}

void sub_100025130(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeKitUserIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_filterHomeKitUserIdentifiers:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  objc_msgSend(v5, "setHomeKitUserIdentifiers:", v4);

}

void sub_1000251B4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerIdentifier"));
  objc_msgSend(v1, "_sendProxyDeviceUpdateToPeer:", v2);

}

id sub_100025B80(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "authCompletion:", a2);
}

id sub_100025B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "promptForPasswordType:flags:throttleSeconds:", objc_msgSend(*(id *)(a1 + 40), "passwordTypeActual"), a2, a3);
}

id sub_100025BCC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clientConnectionEndedUnauth:publicID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "handleDisconnect");
}

id sub_100025BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedEventID:event:options:unauth:cnx:", a2, a3, a4, 1, *(_QWORD *)(a1 + 40));
}

id sub_100025C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedRequestID:request:options:responseHandler:unauth:cnx:", a2, a3, a4, a5, 1, *(_QWORD *)(a1 + 40));
}

id sub_100025C34(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionStateChanged:cnx:", a2, *(_QWORD *)(a1 + 40));
}

void sub_100025C44(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeKitUserIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_filterHomeKitUserIdentifiers:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  objc_msgSend(v5, "setHomeKitUserIdentifiers:", v4);

}

void sub_100025CC8(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerIdentifier"));
  objc_msgSend(v1, "_sendProxyDeviceUpdateToPeer:", v2);

}

id sub_100026038(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return _objc_msgSend(*(id *)(a1 + 40), "_clientOnDemandAWDLDiscoveryTimedOutForDevice:xpcCnx:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

id sub_100026260(uint64_t a1)
{
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryStartForXPC:]_block_invoke", 90, "### Start on-demand AWDL guest discovery timed out");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setDiscoveryTimer:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setNeedsCLink:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 400) = 0;
  return objc_msgSend(*(id *)(a1 + 48), "_update");
}

void sub_100026AD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100026B00(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "uiTriggered") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

id sub_100026B64(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(a3, "appSignIn");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

id *sub_100026E00(id *result, uint64_t a2, uint64_t a3)
{
  if (result[4] == *((id *)result[5] + 101))
    return (id *)_objc_msgSend(result[5], "_clientUINoteAction:error:device:", a2, a3, result[6]);
  return result;
}

id sub_100027394(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 1000));
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

_QWORD *sub_1000273C0(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
  {
    v2 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result[4] + 1000));
    return objc_msgSend((id)v2[4], "_serverNearbyActionV2DiscoveryEnsureStopped");
  }
  return result;
}

void sub_10002754C(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1000);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  objc_msgSend(*(id *)(a1 + 32), "_serverNearbyInfoV2DeviceFound:deviceFlags:", v4, 4);

}

void sub_10002759C(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1000);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  objc_msgSend(*(id *)(a1 + 32), "_serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:", v4, 0, 0, 4);

}

void sub_1000275F4(uint64_t a1, uint64_t a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 1000));
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_serverNearbyInfoV2DiscoveryEnsureStopped");
}

_DWORD *sub_100027838(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD *result;

  v2 = *(_DWORD *)(a1 + 40);
  result = *(_DWORD **)(a1 + 32);
  if (v2 == result[50])
    return _objc_msgSend(result, "_serverBLENeedsCLinkScannerDeviceFound:", a2);
  return result;
}

_DWORD *sub_100027858(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD *result;

  v2 = *(_DWORD *)(a1 + 40);
  result = *(_DWORD **)(a1 + 32);
  if (v2 == result[50])
    return _objc_msgSend(result, "_serverBLENeedsCLinkScannerDeviceLost:", a2);
  return result;
}

_DWORD *sub_100027878(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD *result;

  v2 = *(_DWORD *)(a1 + 40);
  result = *(_DWORD **)(a1 + 32);
  if (v2 == result[50])
    return _objc_msgSend(result, "_serverBLENeedsCLinkScannerDeviceFound:", a2);
  return result;
}

void sub_100027898(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStarted]_block_invoke_4", 90, "### BLE NeedsCLink scanner start failed: %{error}\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 192);
    *(_QWORD *)(v5 + 192) = 0;

    goto LABEL_10;
  }
  if (dword_100130248 <= 30)
  {
    v8 = 0;
    if (dword_100130248 != -1 || (v7 = _LogCategory_Initialize(&dword_100130248, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverBLENeedsCLinkScannerEnsureStarted]_block_invoke_4", 30, "BLE NeedsCLink scanner started\n");
LABEL_10:
      v4 = v8;
    }
  }

}

id sub_100028104(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 632));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 632);
  *(_QWORD *)(v2 + 632) = 0;

  return _objc_msgSend(*(id *)(a1 + 32), "_processPendingLostNeedsCLinkDevices");
}

void sub_100029B48(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 592);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 592);
    *(_QWORD *)(v4 + 592) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 576))
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _serverReceivedNeedsAWDLEvent:event:]_block_invoke", 90, "### Removing expired NeedsAWDL requests\n");
    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 576);
    *(_QWORD *)(v6 + 576) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_update");
  }
}

void sub_100029C18(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldReceiveActivityLevelOverWiFi:", objc_msgSend(v5, "deviceType")))
  {
    v3 = *(void **)(a1 + 40);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueID"));
    objc_msgSend(v3, "addObject:", v4);

  }
}

void sub_100029C84(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (v2
    && dword_100130248 <= 30
    && ((v5 = v2, dword_100130248 != -1) || (v4 = _LogCategory_Initialize(&dword_100130248, 30), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _clientSendActivityLevelOverWiFiIfNecessary]_block_invoke_2", 30, "### Failed to send ActivityLevelUpdate event: %@\n", v3);

  }
  else
  {

  }
}

id sub_100029E18(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_serverBTAddressChanged");
}

id sub_100029E20(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_serverBTAddressChanged");
}

void sub_10002A300(id a1, CUTCPConnection *a2)
{
  -[CUTCPConnection setDataTimeoutSecs:](a2, "setDataTimeoutSecs:", 20.0);
}

_QWORD *sub_10002A30C(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[99])
    return objc_msgSend(result, "_serverTCPHandleConnectionStarted:", a2);
  return result;
}

id sub_10002A600(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidationHandled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_serverTCPHandleConnectionEnded:", *(_QWORD *)(a1 + 32));
  return result;
}

void sub_10002A638(uint64_t a1)
{
  void *v2;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "controlFlags") & 0x200) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_stereoDeviceUpdate:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_personalDeviceUpdate");
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
    if (v2)
    {
      v3 = v2;
      objc_msgSend(*(id *)(a1 + 40), "_activeDeviceChanged:changes:", v2, 2);
      v2 = v3;
    }

  }
}

void sub_10002A6B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_receivedEventID:event:options:unauth:cnx:", v10, v9, v8, (unint64_t)objc_msgSend(v7, "flags") & 1, *(_QWORD *)(a1 + 32));

}

void sub_10002A73C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_receivedRequestID:request:options:responseHandler:unauth:cnx:", v13, v12, v11, v10, (unint64_t)objc_msgSend(v9, "flags") & 1, *(_QWORD *)(a1 + 32));

}

id sub_10002A7D4(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidationHandled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_connectionStateChanged:cnx:", a2, *(_QWORD *)(a1 + 32));
  return result;
}

void sub_10002A814(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeKitUserIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_filterHomeKitUserIdentifiers:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  objc_msgSend(v5, "setHomeKitUserIdentifiers:", v4);

}

void sub_10002A898(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerIdentifier"));
  objc_msgSend(v1, "_sendProxyDeviceUpdateToPeer:", v2);

}

void sub_10002A948(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "pairVerifyAuthType") == 9)
    objc_msgSend(v3, "setCopyIdentityHandler:", &stru_100111B80);

}

CUPairingIdentity *__cdecl sub_10002A998(id a1, unint64_t a2, id *a3)
{
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _configureConnectionForPairing:]_block_invoke_2", 30, "Copy identity handler options %lu\n", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identityOfTemporarySelfAndReturnError:", &v16));
  v7 = v16;

  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _configureConnectionForPairing:]_block_invoke_2", 90, "### Failed to get temporary self identity: %@\n.", v7);
    }
    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = objc_alloc_init((Class)CUPairingIdentity);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "adHocPairingIdentifier"));
    objc_msgSend(v9, "setIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIRKData"));
    objc_msgSend(v9, "setAltIRK:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "edPKData"));
    objc_msgSend(v9, "setPublicKey:", v13);

    if ((a2 & 2) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "edSKData"));
      objc_msgSend(v9, "setSecretKey:", v14);

    }
  }

  return (CUPairingIdentity *)v9;
}

id sub_10002AF54(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_bleServerHandleConnectionStarted:", a2);
}

void sub_10002AF60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _bleServerEnsureStarted]_block_invoke_2", 90, "### BLE server start failed: %@\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 216);
    *(_QWORD *)(v5 + 216) = 0;

    goto LABEL_10;
  }
  if (dword_100130248 <= 30)
  {
    v8 = 0;
    if (dword_100130248 != -1 || (v7 = _LogCategory_Initialize(&dword_100130248, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _bleServerEnsureStarted]_block_invoke_2", 30, "BLE server started, PSM 0x%X\n", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "listeningPSM"));
LABEL_10:
      v4 = v8;
    }
  }

}

id sub_10002B418(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidationHandled");
  if ((result & 1) == 0)
    return _objc_msgSend(*(id *)(a1 + 40), "_bleServerHandleConnectionEnded:", *(_QWORD *)(a1 + 32));
  return result;
}

void sub_10002B450(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_receivedEventID:event:options:unauth:cnx:", v10, v9, v8, (unint64_t)objc_msgSend(v7, "flags") & 1, *(_QWORD *)(a1 + 32));

}

void sub_10002B4D4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_receivedRequestID:request:options:responseHandler:unauth:cnx:", v13, v12, v11, v10, (unint64_t)objc_msgSend(v9, "flags") & 1, *(_QWORD *)(a1 + 32));

}

id sub_10002B56C(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidationHandled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_connectionStateChanged:cnx:", a2, *(_QWORD *)(a1 + 32));
  return result;
}

void sub_10002B5AC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeKitUserIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_filterHomeKitUserIdentifiers:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  objc_msgSend(v5, "setHomeKitUserIdentifiers:", v4);

}

void sub_10002B630(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerIdentifier"));
  objc_msgSend(v1, "_sendProxyDeviceUpdateToPeer:", v2);

}

id *sub_10002B824(id *result)
{
  if (result[4])
    return (id *)_objc_msgSend(result[5], "_btPipeHandleStateChanged:");
  return result;
}

void sub_10002B838(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      if (dword_100130248 <= 90)
      {
        v6 = v3;
        if (dword_100130248 != -1 || (v5 = _LogCategory_Initialize(&dword_100130248, 90), v4 = v6, v5))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _btPipeSetup:withPriority:]_block_invoke_2", 90, "### BTPipe %s priority start failed: %{error}\n", v4);
          v4 = v6;
        }
      }
    }
  }

}

void sub_10002B8D0(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  BOOL v4;
  char v5;
  id v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "state") == 1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "peerDeviceInfo"));
    if (v2)
    {
      v6 = v2;
      v3 = (unint64_t)objc_msgSend(v2, "statusFlags");
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "peerHostState") == 1;
      v2 = v6;
      v5 = v4;
      if ((v3 & 0xFFFFFFFFFFFFFFDFLL | (32 * (v5 & 1))) != v3)
      {
        objc_msgSend(v6, "setStatusFlags:");
        objc_msgSend(*(id *)(a1 + 32), "_activeDeviceChanged:changes:", v6, 2);
        v2 = v6;
      }
    }

  }
}

id sub_10002B97C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleContextCollectorRequest:responseHandler:", a2);
}

id sub_10002BC34(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_btPipeConnectionStart");
}

id sub_10002BEFC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_btPipeConnectionEnded:", *(_QWORD *)(a1 + 40));
}

void sub_10002BF08(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v6 = v3;
    v5 = GestaltGetDeviceClass(v3, v4) == 6;
    v3 = v6;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_btPipeSyncKeysIfNeeded");
      v3 = v6;
    }
  }

}

void sub_10002BF54(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "_activeDeviceChanged:changes:", v2, 2);
    v2 = v3;
  }

}

id sub_10002BFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedEventID:event:options:unauth:cnx:", a2, a3, a4, 0, *(_QWORD *)(a1 + 40));
}

id sub_10002BFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedRequestID:request:options:responseHandler:unauth:cnx:", a2, a3, a4, a5, 0, *(_QWORD *)(a1 + 40));
}

id sub_10002BFE0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionStateChanged:cnx:", a2, *(_QWORD *)(a1 + 40));
}

void sub_10002BFF0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeKitUserIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_filterHomeKitUserIdentifiers:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerDeviceInfo"));
  objc_msgSend(v5, "setHomeKitUserIdentifiers:", v4);

}

void sub_10002C074(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerIdentifier"));
  objc_msgSend(v1, "_sendProxyDeviceUpdateToPeer:", v2);

}

void sub_10002C7A0(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a2;
  v7 = a3;
  v8 = v7;
  if (*(id *)(a1 + 32) != v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerDeviceInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDeviceIdentifier"));
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v11)
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        v18 = CUDescriptionWithLevel(*(_QWORD *)(a1 + 32), 20);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = CUDescriptionWithLevel(v8, 20);
        v24 = (uint64_t)v19;
        v25 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _activeDeviceRemoved:cnx:]_block_invoke", 30, "Invalidating disconnected duplicate: %@ -> %@\n");

      }
      v21 = *(void **)(a1 + 32);
      v22 = RPErrorF(4294960566, (uint64_t)"Disconnected Duplicate", v12, v13, v14, v15, v16, v17, v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      objc_msgSend(v21, "invalidateWithError:", v23);

      *a4 = 1;
    }
  }

}

void sub_10002D088(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "showPasswordHandler"));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);

}

void sub_10002D0E8(uint64_t a1, uint64_t a2)
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hidePasswordHandler"));
  if (v3)
  {
    v4 = v3;
    v3[2](v3, a2);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

void sub_10002D9D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identityResolved"));
  if (objc_msgSend(v4, "type") == 9)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "identifier"));
          v12 = objc_msgSend(v11, "isEqual:", v5);

          if ((v12 & 1) != 0)
          {

            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v13 = CUDescriptionWithLevel(v3, 20);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _disconnectRemovedSharedHomeDevices]_block_invoke", 30, "Disconnect removed SharedHome device: %@\n", v14);

    }
    objc_msgSend(v3, "invalidate");
LABEL_16:

  }
}

void sub_10002DD9C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identityVerified"));
  if (objc_msgSend(v4, "type") == 8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "identifier"));
          v12 = objc_msgSend(v11, "isEqual:", v5);

          if ((v12 & 1) != 0)
          {

            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    if (dword_100130248 <= 30
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    {
      v13 = CUDescriptionWithLevel(v3, 20);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _disconnectUnpairedDevices]_block_invoke", 30, "Disconnect unpaired device: %@\n", v14);

    }
    objc_msgSend(v3, "invalidate");
LABEL_16:

  }
}

void sub_10002E328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002E340(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  unsigned int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  unsigned int v26;
  id *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = a2;
  v7 = objc_msgSend(v6, "linkType");
  v8 = *(_QWORD *)(a1 + 56);
  if (((v8 & 0x400000) == 0 || v7 != 4)
    && ((v8 & 0x200000) == 0 || (v7 & 0xFFFFFFFE) != 6)
    && (((v8 & 0x200000) == 0 || !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 905)) && ((v8 >> 42) & 1) == 0 || v7 != 8)
    && ((v8 & 0x10000000) == 0 || v7 == 10)
    && ((v8 & 0x20000000000) == 0 || v7 != 1))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDeviceInfo"));
    if (!v9)
      goto LABEL_18;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerIdentifier"));
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

    if ((v11 & 1) != 0
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier")),
          v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40)),
          v12,
          (v13 & 1) != 0)
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDeviceIdentifier")),
          v15 = objc_msgSend(v14, "isEqual:", *(_QWORD *)(a1 + 40)),
          v14,
          (v15 & 1) != 0))
    {
      v16 = 1;
    }
    else
    {
LABEL_18:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identityVerified"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsDeviceID"));
      v16 = objc_msgSend(v18, "isEqual:", *(_QWORD *)(a1 + 40));

    }
    if ((*(_BYTE *)(a1 + 60) & 4) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "proxyDevices"));

      if (!v19)
      {
        if (!v16)
        {
LABEL_37:

          goto LABEL_38;
        }
LABEL_34:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);
        v27 = *(id **)(a1 + 64);
        if (v27)
          objc_storeStrong(v27, a2);
        *a3 = 1;
        goto LABEL_37;
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "proxyDevices"));
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v21)
      {
        v22 = v21;
        v28 = v9;
        v23 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v23)
              objc_enumerationMutation(v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "identifier"));
            v26 = objc_msgSend(v25, "isEqual:", *(_QWORD *)(a1 + 40));

            if (v26)
            {

              v9 = v28;
              goto LABEL_34;
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v22)
            continue;
          break;
        }

        v9 = v28;
        goto LABEL_37;
      }

    }
    if ((v16 & 1) == 0)
      goto LABEL_37;
    goto LABEL_34;
  }
LABEL_38:

}

void sub_10002E6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002E6F8(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDeviceInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceIdentifier"));
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8 && objc_msgSend(v9, "linkType") == 6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void sub_10002EA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002EA8C(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  unsigned int v7;
  id obj;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peerDeviceInfo"));
  if (v5)
  {
    obj = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publicIdentifier"));
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

    v5 = obj;
    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
      v5 = obj;
      *a3 = 1;
    }
  }

}

void sub_10002EE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002EE54(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t sub_10002EEA8(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t sub_10002EEFC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

void sub_10002EFF4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_destinationID:matchesCnx:", *(_QWORD *)(a1 + 40)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10002F10C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerDeviceInfo"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerDeviceInfo"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceIdentifier"));

  if (!(v4 | v6))
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _forEachUniqueMatchingDestinationID:handler:]_block_invoke", 90, "Skipping connection without identifier or IDS identifier (%@) \n", v8);
    }
    goto LABEL_17;
  }
  if (!v4)
  {
    v7 = 0;
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  if (v6)
LABEL_7:
    v7 |= objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
LABEL_8:
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  if ((v7 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:

}

void sub_100030048(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "server"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceType"));

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

id sub_100030344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_interestSendEventID:event:", a2, a3);
}

void sub_100030428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  int v12;
  id v13;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 561) = 0;
  if (a2 && !a3)
  {
    v5 = MRPairedDeviceCopyIdentifier(a2);
    v6 = (void *)v5;
    if (!v5)
    {
      if (dword_100130248 > 90)
        goto LABEL_28;
      v13 = 0;
      if (dword_100130248 == -1)
      {
        v12 = _LogCategory_Initialize(&dword_100130248, 90);
        v6 = 0;
        if (!v12)
          goto LABEL_28;
      }
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaRemoteIDGet]_block_invoke", 90, "### MRPairedDeviceCopyIdentifier failed\n");
LABEL_27:
      v6 = v13;
LABEL_28:

      return;
    }
    v13 = (id)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "mediaRemoteIdentifier"));
    v8 = v13;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      if (v9)
      {
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if ((v11 & 1) != 0)
          goto LABEL_26;
      }
      else
      {

      }
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaRemoteIDGet]_block_invoke", 30, "MediaRemoteIdentifier changed: %@ -> %@\n", v10, v8);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setMediaRemoteIdentifier:", v8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setChanged:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_update");
      v8 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
      objc_msgSend(v8, "postDaemonInfoChanges:", 0x20000);
    }

LABEL_26:
    goto LABEL_27;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaRemoteIDGet]_block_invoke", 90, "### MRMediaRemoteGetDeviceInfo failed: %{error}\n", a3);
}

void sub_1000306D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 562) = 0;
  if (v13 && !v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "mediaRouteIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

    if (v8)
    {
      v9 = v8;
      v10 = v6;
      v11 = v10;
      if (v9 == v10)
      {

      }
      else
      {
        if (v10)
        {
          v12 = objc_msgSend(v9, "isEqual:", v10);

          if ((v12 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaRouteIDGet]_block_invoke", 30, "MediaRouteIdentifier changed: %@ -> %@\n", v11, v9);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "setMediaRouteIdentifier:", v9);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "setChanged:", 1);
        objc_msgSend(*(id *)(a1 + 40), "_update");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
        objc_msgSend(v11, "postDaemonInfoChanges:", 0x20000);
      }

    }
LABEL_21:

    goto LABEL_22;
  }
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _mediaRouteIDGet]_block_invoke", 90, "### Get pairing identifier for media route failed: %{error}\n", v5);
LABEL_22:

}

id sub_1000308C4(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_miscHandleLaunchAppRequest:responseHandler:", a2);
}

id sub_1000308D0(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_miscHandleSpeakRequest:responseHandler:", a2);
}

id sub_1000308DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_sessionHandleStartRequest:options:cnx:responseHandler:", a3, a4, a2, a5);
}

id sub_1000308EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_sessionHandleStopRequest:options:cnx:responseHandler:", a3, a4, a2, a5);
}

uint64_t sub_100030BD4(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = -[objc_class defaultWorkspace](off_1001302D0(), "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "openApplicationWithBundleID:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100030C2C(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;

  v2 = -[objc_class defaultWorkspace](off_1001302D0(), "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  v5 = objc_msgSend(v3, "openURL:withOptions:error:", v4, &__NSDictionary0__struct, &v16);
  v6 = v16;

  if ((v5 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _miscHandleLaunchAppRequest:responseHandler:]_block_invoke_2", 90, "### Launch URL failed: %@, %{error}\n", *(_QWORD *)(a1 + 32), v6);
    }
    v12 = *(_QWORD *)(a1 + 40);
    v13 = RPNestedErrorF((uint64_t)v6, 4294960541, (uint64_t)"Open URL failed", v7, v8, v9, v10, v11, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, v14);

  }
}

id sub_100030ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    v5 = 0;
  else
    v5 = &__NSDictionary0__struct;
  (*(void (**)(uint64_t, void *, _QWORD, uint64_t))(v4 + 16))(v4, v5, 0, a2);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

id sub_100031100(id result)
{
  uint64_t v1;

  v1 = *((_QWORD *)result + 4);
  if (*(_BYTE *)(v1 + 721))
  {
    *(_BYTE *)(v1 + 720) = *((_BYTE *)result + 40);
    return objc_msgSend(*((id *)result + 4), "_stereoDeviceUpdate:", 0);
  }
  return result;
}

_BYTE *sub_100031124(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[560])
    return objc_msgSend(result, "_serverBonjourUpdateTXT");
  return result;
}

void sub_10003128C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000312A4(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "statusFlags") & 0x80000) != 0
    && (objc_msgSend(v7, "controlFlags") & 0x200) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerDeviceInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
    if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      if ((objc_msgSend(v4, "isPersonal") & 1) == 0)
      {
        objc_msgSend(v4, "setPersonal:", 1);
LABEL_8:
        objc_msgSend(v4, "setStatusFlags:", (unint64_t)objc_msgSend(v4, "statusFlags") | 0x80);
        objc_msgSend(*(id *)(a1 + 40), "_activeDeviceChanged:changes:", v4, 2);
      }
    }
    else
    {
      v6 = (unint64_t)objc_msgSend(v4, "statusFlags") & 0x10000080000;
      if (objc_msgSend(v4, "isPersonal") != (v6 == 0x10000080000))
      {
        objc_msgSend(v4, "setPersonal:", v6 == 0x10000080000);
        if (v6 != 0x10000080000)
        {
          objc_msgSend(v4, "setStatusFlags:", (unint64_t)objc_msgSend(v4, "statusFlags") & 0xFFFFFFFFFFFFFF7FLL);
          objc_msgSend(*(id *)(a1 + 40), "_activeDeviceChanged:changes:", v4, 2);
          goto LABEL_11;
        }
        goto LABEL_8;
      }
      if (v6 != 0x10000080000)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    goto LABEL_11;
  }
LABEL_12:

}

void sub_100031F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_100031F94(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(v9, "statusFlags") & 0x80000) != 0
    && (objc_msgSend(v9, "controlFlags") & 0x200) == 0
    && objc_msgSend(v9, "state") == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDeviceInfo"));
    if (objc_msgSend(v4, "mediaSystemRole") == *(_DWORD *)(a1 + 56))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaSystemIdentifier"));
      v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

      if (v6)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerIdentifier"));
        v8 = v7;
        if (v7
          && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
          && ((unint64_t)objc_msgSend(v7, "caseInsensitiveCompare:") & 0x8000000000000000) != 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
        }

      }
    }

  }
}

id sub_1000320A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

_QWORD *sub_1000321E8(_QWORD *result)
{
  _QWORD *v1;
  void *v2;
  void *v3;

  if (*(_QWORD *)(result[4] + 512))
  {
    v1 = result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1[4] + 512), "resolvableAccessories"));
    objc_msgSend(v2, "resolvableAccessoriesUpdated:", v3);

    return objc_msgSend((id)v1[4], "_clientBonjourReevaluateUnauthDevices");
  }
  return result;
}

_QWORD *sub_100032268(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[64])
    return _objc_msgSend(result, "_homeKitSelfAccessoryMediaAccessUpdated");
  return result;
}

_QWORD *sub_10003227C(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[64])
    return objc_msgSend(result, "_homeKitSelfAccessoryMediaSystemUpdated:", 0);
  return result;
}

_QWORD *sub_100032294(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[64])
    return _objc_msgSend(result, "_homeKitSelfAccessoryUpdated");
  return result;
}

_QWORD *sub_1000322A8(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[64])
    return _objc_msgSend(result, "_homeKitSelfAccessoryUpdated");
  return result;
}

_QWORD *sub_1000322BC(_QWORD *result, int a2)
{
  _QWORD *v2;

  if (a2 == 1)
  {
    v2 = result;
    result = (_QWORD *)result[4];
    if (result[64])
    {
      if (!*((_BYTE *)result + 488) && !*((_BYTE *)result + 489))
      {
        if (dword_100130248 <= 30
          && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
        {
          LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeKitEnsureStarted]_block_invoke_6", 30, "HomeKit identity force get\n");
        }
        *(_BYTE *)(v2[4] + 488) = 1;
        result = (_QWORD *)v2[4];
      }
      return objc_msgSend(result, "_homeKitEnsureStarted");
    }
  }
  return result;
}

id sub_100032368(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePersonalRequestsStateForHomeHubDevices");
}

id sub_100032370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_updateRoomInfoForHomeHubDevice:roomName:", a2, a3);
}

id sub_10003253C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_homeKitGetPairingIdentities");
}

_QWORD *sub_100032618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 489) = 0;
  result = *(_QWORD **)(a1 + 32);
  if (result[64])
    return _objc_msgSend(result, "_homeKitIdentityUpdated:error:", a2, a3);
  return result;
}

void sub_100032D34(id a1, RPConnection *a2, BOOL *a3)
{
  RPConnection *v3;

  v3 = a2;
  if ((-[RPConnection controlFlags](v3, "controlFlags") & 0x200) == 0)
    -[RPConnection homeKitIdentityUpdated](v3, "homeKitIdentityUpdated");

}

void sub_10003475C(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (v2
    && dword_100130248 <= 90
    && ((v5 = v2, dword_100130248 != -1) || (v4 = _LogCategory_Initialize(&dword_100130248, 90), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeHubDeviceAdded:]_block_invoke", 90, "### Failed to send device list for newly added proxy devices: %@\n", v3);

  }
  else
  {

  }
}

void sub_100034964(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (v2
    && dword_100130248 <= 90
    && ((v5 = v2, dword_100130248 != -1) || (v4 = _LogCategory_Initialize(&dword_100130248, 90), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _homeHubDeviceRemoved:]_block_invoke", 90, "### Failed to send device list for deleted proxy devices: %@\n", v3);

  }
  else
  {

  }
}

void sub_1000354B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a68;

  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

void sub_1000354F0(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(unsigned int *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100035594;
  v10[3] = &unk_100111FC0;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v8;
  objc_msgSend(v4, "sendEncryptedEventID:data:xid:options:completion:", v9, v6, v5, v7, v10);

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
}

void sub_100035594(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_1000355EC(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(unsigned int *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100035690;
  v10[3] = &unk_100111FC0;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v8;
  objc_msgSend(v4, "sendEncryptedEventID:data:xid:options:completion:", v9, v6, v5, v7, v10);

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
}

void sub_100035690(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t sub_1000356E8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void sub_100036370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_100036388(_QWORD *result, void *a2, _BYTE *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result[8] + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    result = objc_msgSend(a2, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", result[4], result[5], *((unsigned int *)result + 18), result[6], result[7]);
    *a3 = 1;
  }
  return result;
}

void sub_100037C78(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (v2
    && dword_100130248 <= 90
    && ((v5 = v2, dword_100130248 != -1) || (v4 = _LogCategory_Initialize(&dword_100130248, 90), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sendProxyDeviceUpdateToPeer:]_block_invoke", 90, "### Failed to send proxy device list: %@\n", v3);

  }
  else
  {

  }
}

void sub_100038560(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 536), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v13, "setTimer:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 536), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
  v2 = mach_absolute_time();
  UpTicksToSecondsF(v2 - (_QWORD)objc_msgSend(v13, "sendTicks"));
  if (dword_100130248 <= 90 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "requestID"));

  }
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "responseHandler"));
  v10 = RPErrorF(4294960574, (uint64_t)"Request timed out on loopback", v4, v5, v6, v7, v8, v9, (uint64_t)v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  ((void (**)(_QWORD, _QWORD, _QWORD, void *))v3)[2](v3, 0, 0, v11);

}

void sub_100038BB4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];

  v6 = a2;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timer"));
    objc_msgSend(v8, "setTimer:", 0);
    if (v9)
      dispatch_source_cancel(v9);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "responseHandler"));
    if (v7)
    {
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        v11 = *(unsigned int *)(a1 + 64);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "identifier"));
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]_block_invoke", 90, "### Received response XID 0x%x, error %(error), from proxy device %@ \n", v11, v7, v12);

      }
      ((void (**)(_QWORD, _QWORD, _QWORD, id))v10)[2](v10, 0, 0, v7);
    }
    else
    {
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]_block_invoke", 30, "Received response XID 0x%x over loopback\n", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
      }
      v16[0] = CFSTR("dlt");
      v16[1] = CFSTR("senderID");
      v14 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v17[0] = &off_10011AA40;
      v17[1] = v13;
      v16[2] = CFSTR("xid");
      v17[2] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
      ((void (**)(_QWORD, id, void *, _QWORD))v10)[2](v10, v6, v15, 0);

    }
  }
  else if (dword_100130248 <= 90
         && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _proxyDevice:loopbackRequestID:request:options:responseHandler:]_block_invoke", 90, "### Received response XID 0x%x, with no request from %@", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"), *(_QWORD *)(a1 + 48));
  }

}

void sub_1000392D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t Int64;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void (*v24)(void);
  unsigned int v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (dword_100130248 <= 90
      && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
    {
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon sessionStartSend:session:xpcID:completion:]_block_invoke", 90, "### Session start send failed: Service %@, PeerID %@, CSID 0x%llX, %{error}\n", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v9);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v25 = 0;
    Int64 = CFDictionaryGetInt64(v7, CFSTR("_sid"), &v25);
    if (Int64)
    {
      v17 = *(_QWORD *)(a1 + 72) | (Int64 << 32);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17));
      objc_msgSend(*(id *)(a1 + 48), "setPeerID:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "setSessionID:", v17);
      v19 = *(void **)(*(_QWORD *)(a1 + 56) + 1032);
      if (!v19)
      {
        v20 = objc_alloc_init((Class)NSMutableDictionary);
        v21 = *(_QWORD *)(a1 + 56);
        v22 = *(void **)(v21 + 1032);
        *(_QWORD *)(v21 + 1032) = v20;

        v19 = *(void **)(*(_QWORD *)(a1 + 56) + 1032);
      }
      objc_msgSend(v19, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v18);
      if (dword_100130248 <= 30
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon sessionStartSend:session:xpcID:completion:]_block_invoke", 30, "Session start response: Service %@, PeerID %@, SID 0x%llX\n", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v17);
      }
      v24 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      v23 = RPErrorF(4294960591, (uint64_t)"Bad response sessionID: %#m", v11, v12, v13, v14, v15, v16, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (dword_100130248 <= 90
        && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90)))
      {
        LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon sessionStartSend:session:xpcID:completion:]_block_invoke", 90, "### Session start send failed: Service %@, PeerID %@, CSID 0x%llX, %{error}\n", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v18);
      }
      v24 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v24();

  }
}

void sub_1000397F0(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (dword_100130248 <= 30 && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 30)))
    LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon sessionStopSend:session:xpcID:completion:]_block_invoke", 30, "Session stop response: Service %@, PeerID %@, SID 0x%llX, %{error}\n", a1[4], a1[5], a1[7], v8);
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_100039F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a50, 8);
  (*(void (**)(void))(a13 + 16))();
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003A008(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
  {
    v2 = result;
    if (dword_100130248 <= 90)
    {
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 90))
          return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
        v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40);
      }
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sessionHandleStartRequest:options:cnx:responseHandler:]_block_invoke", 90, "### Session start receive failed: %{error}\n", v1);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

void sub_10003A0CC(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "server"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
  v9 = objc_msgSend(v8, "isEqual:", a1[4]);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
    *a4 = 1;
  }

}

void sub_10003A174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;

  if (a3)
  {
    v9 = *(_QWORD *)(a1 + 56);
    v10 = RPNestedErrorF(a3, 4294960584, (uint64_t)"LaunchOnDemand response failed", a4, a5, a6, a7, a8, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }
  else
  {
    v15 = CFSTR("_sid");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64)));
    v16 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void sub_10003A698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003A6D8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
  {
    v2 = result;
    if (dword_100130248 <= 90)
    {
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 90))
          return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
        v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40);
      }
      LogPrintF(&dword_100130248, "-[RPCompanionLinkDaemon _sessionHandleStopRequest:options:cnx:responseHandler:]_block_invoke", 90, "### Session stop failed: %{error}\n", v1);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

void sub_10003AB30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10003AB48(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = (id)a1[4];
  if (v4)
    v5 = v4 == v3;
  else
    v5 = 0;
  if (!v5)
  {
    v11 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cnx"));
    v8 = v7;
    if (v7 == (void *)a1[5])
    {

      v3 = v11;
LABEL_9:
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      goto LABEL_10;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "netCnx"));
    v10 = (void *)a1[5];

    v3 = v11;
    if (v9 == v10)
      goto LABEL_9;
  }
LABEL_10:

}

void sub_10003AC08(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cnx"));
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void sub_10003B8BC(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3
    && dword_100130248 <= 20
    && (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 20)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection connectionInvalidated]_block_invoke", 20, "Session stop for session %@ received error %{error}\n", *(_QWORD *)(a1 + 32), v3);
  }
  objc_msgSend(*(id *)(a1 + 40), "connectionInvalidatedCore");

}

void sub_10003BA64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "_connectionHasActiveSessions:", v5) & 1) == 0
    && (objc_msgSend(v5, "controlFlags") & 0x200) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "client"));
    if (!v6
      || (v7 = (void *)v6,
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "client")),
          v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48),
          v8,
          v7,
          v8 == v9))
    {
      objc_msgSend(v5, "invalidate");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
    }
  }

}

void sub_10003BB28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "identifier"));
  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "destinationDevice")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier")),
        v4,
        v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "interestDeregisterEventID:peerIdentifier:owner:", v5, v3);

  }
}

void sub_10003BBB8(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (dword_100130248 <= 30
    && ((v5 = v2, dword_100130248 != -1) || (v4 = _LogCategory_Initialize(&dword_100130248, 30), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection connectionInvalidatedCore]_block_invoke_2", 30, "Removing local device as context collector upon invalidation. Error: '%@'\n", v3);

  }
  else
  {

  }
}

void sub_10003BD68(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "launchInstanceID"));
  LODWORD(v4) = objc_msgSend(v4, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v6, v5, 0);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void sub_10003BDDC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "launchInstanceID"));
  LODWORD(v4) = objc_msgSend(v4, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v6, v5, 0);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void sub_10003BE50(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "launchInstanceID"));
  LODWORD(v4) = objc_msgSend(v4, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v6, v5, 0);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void sub_10003BEC4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "launchInstanceID"));
  LODWORD(v4) = objc_msgSend(v4, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v6, v5, 0);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void sub_10003BF38(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "launchInstanceID"));
  LODWORD(v4) = objc_msgSend(v4, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:", v6, v5, 0);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void sub_10003C228(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v3 = a2;
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "cnx"));
    v5 = (unint64_t)objc_msgSend(v4, "statusFlags");

    v6 = objc_msgSend(*(id *)(a1 + 40), "flags");
    if ((v5 & 0x70000AE000) == 0 && (v6 & 1) == 0)
    {
      if (dword_100130248 <= 90)
      {
        v14 = v6;
        if (dword_100130248 != -1 || _LogCategory_Initialize(&dword_100130248, 90))
          LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]_block_invoke_2", 90, "### Session for service type '%@' and client flags %#{flags} started on unauthenticated connection with status flags %#ll{flags}\n", *(_QWORD *)(a1 + 48), v14, &unk_100109AEE, v5, &unk_10010992F);
      }
      v15 = RPErrorF(4294960542, (uint64_t)"Session started on unauthenticated connection", v7, v8, v9, v10, v11, v12, v18);
      v3 = (id)objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      v3 = 0;
    }
  }
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
  {
    if (v3)
      v17 = 0;
    else
      v17 = &__NSArray0__struct;
    v19 = v3;
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
    v3 = v19;
  }

}

void sub_10003DC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003DC88(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
  {
    v2 = result;
    if (dword_100130248 <= 90)
    {
      if (dword_100130248 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130248, 90))
          return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
        v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40);
      }
      LogPrintF(&dword_100130248, "-[RPCompanionLinkXPCConnection xpcServerActivate:completion:]_block_invoke", 90, "### Activate server failed: %{error}\n", v1);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

void sub_10003DD44(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));
  objc_msgSend(v6, "xpcServerShowPassword:flags:", v5, a2);

}

void sub_10003DDA4(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "remoteObjectProxy"));
  objc_msgSend(v3, "xpcServerHidePassword:", a2);

}

Class sub_10003E3A4()
{
  Class result;

  if (qword_100131F60 != -1)
    dispatch_once(&qword_100131F60, &stru_1001122C8);
  result = objc_getClass("SFDeviceDiscovery");
  qword_100131F58 = (uint64_t)result;
  off_1001302B8 = (uint64_t (*)())sub_10003E400;
  return result;
}

id sub_10003E400()
{
  return (id)qword_100131F58;
}

void sub_10003E40C(id a1)
{
  qword_100131F68 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_10003E434()
{
  Class result;

  if (qword_100131F60 != -1)
    dispatch_once(&qword_100131F60, &stru_1001122C8);
  result = objc_getClass("SFService");
  qword_100131F70 = (uint64_t)result;
  off_1001302C0 = (uint64_t (*)())sub_10003E490;
  return result;
}

id sub_10003E490()
{
  return (id)qword_100131F70;
}

Class sub_10003E49C()
{
  Class result;

  if (qword_100131F60 != -1)
    dispatch_once(&qword_100131F60, &stru_1001122C8);
  result = objc_getClass("SFClient");
  qword_100131F78 = (uint64_t)result;
  off_1001302C8 = (uint64_t (*)())sub_10003E4F8;
  return result;
}

id sub_10003E4F8()
{
  return (id)qword_100131F78;
}

Class sub_10003E504()
{
  Class result;

  if (qword_100131F88 != -1)
    dispatch_once(&qword_100131F88, &stru_1001122E8);
  result = objc_getClass("LSApplicationWorkspace");
  qword_100131F80 = (uint64_t)result;
  off_1001302D0 = (uint64_t (*)())sub_10003E560;
  return result;
}

id sub_10003E560()
{
  return (id)qword_100131F80;
}

void sub_10003E56C(id a1)
{
  qword_100131F90 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

void sub_10003E674(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  char *v4;

  nw_framer_write_output(*(nw_framer_t *)(a1 + 32), (const uint8_t *)(a1 + 40), 0x10uLL);
  if (*(_BYTE *)(a1 + 60))
  {
    if (dword_100130458 <= 30
      && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 30)))
    {
      v2 = +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned int *)(a1 + 56));
      v3 = *(unsigned __int8 *)(a1 + 60);
      v4 = strerror(*(unsigned __int8 *)(a1 + 60));
      LogPrintF(&dword_100130458, "+[RPNWFramer writeControlOnFramer:type:error:]_block_invoke", 30, "Wrote CTRL message %s, error=%d (%s) on framer=%@\n", v2, v3, v4, *(_QWORD *)(a1 + 32));
    }
  }
  else if (dword_100130458 <= 30
         && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 30)))
  {
    LogPrintF(&dword_100130458, "+[RPNWFramer writeControlOnFramer:type:error:]_block_invoke", 30, "Wrote CTRL message %s on framer=%@\n", +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned int *)(a1 + 56)), *(_QWORD *)(a1 + 32));
  }
}

void sub_10003E88C(uint64_t a1)
{
  id v2;
  const uint8_t *v3;
  uint8_t output_buffer[8];
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = (const uint8_t *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  *(_QWORD *)output_buffer = 0;
  v5 = v2;
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), output_buffer, 0x10uLL);
  if (dword_100130458 <= 30 && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 30)))
    LogPrintF(&dword_100130458, "+[RPNWFramer writeDataOnFramer:data:]_block_invoke", 30, "Wrote header, %d bytes", 16);
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), v3, (size_t)v2);
  if (dword_100130458 <= 30 && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 30)))
    LogPrintF(&dword_100130458, "+[RPNWFramer writeDataOnFramer:data:]_block_invoke", 30, "Wrote body, %d bytes", (_DWORD)v2);
}

void sub_10003EC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003EC44(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  int v6;
  char *v7;
  uint64_t v8;
  size_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD parse[6];
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a2;
  while (1)
  {
    do
    {
      v4 = *(_QWORD *)(a1 + 56);
      if (*(_BYTE *)(*(_QWORD *)(v4 + 8) + 24))
        break;
      v21 = 0;
      v22 = &v21;
      v23 = 0x3010000000;
      v24 = &unk_1000F040E;
      v25 = 0;
      v26 = 0;
      parse[0] = _NSConcreteStackBlock;
      parse[1] = 3221225472;
      parse[2] = sub_10003F050;
      parse[3] = &unk_100112548;
      v20 = 16;
      parse[4] = &v21;
      parse[5] = v4;
      v19 = *(_OWORD *)(a1 + 64);
      if (!nw_framer_parse_input(v3, 0x10uLL, 0x10uLL, 0, parse))
      {
        _Block_object_dispose(&v21, 8);
        v12 = 16;
        goto LABEL_41;
      }
      if (dword_100130458 <= 40
        && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 40)))
      {
        v5 = +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
        v6 = *((unsigned __int8 *)v22 + 33);
        v7 = strerror(v6);
        LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke", 40, "Daemon RX framer msg header={%s error: %d (%s), length: %zu}", v5, v6, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      }
      _Block_object_dispose(&v21, 8);
    }
    while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 3)
      {
        if (dword_100130458 <= 40
          && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 40)))
        {
          LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke", 40, "Received CLOSE message");
        }
      }
      else
      {
        if (dword_100130458 <= 90
          && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 90)))
        {
          LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke", 90, "Invalid message type, closing connection");
        }
        nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 57);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_40;
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      break;
    if (dword_100130458 <= 40
      && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 40)))
    {
      LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke", 40, "Daemon framer reading data message");
    }
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003F0C0;
    v14[3] = &unk_100112570;
    v16 = v8;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    v15 = v10;
    v17 = v11;
    if (!nw_framer_parse_input(v3, 1uLL, v9, 0, v14))
    {
      if (dword_100130458 <= 40
        && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 40)))
      {
        LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke", 40, "Requesting more body bytes");
      }

LABEL_40:
      v12 = 0;
      goto LABEL_41;
    }

  }
  if (dword_100130458 <= 40 && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 40)))
    LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke", 40, "Daemon framer reading empty message");
  v12 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_41:

  return v12;
}

void sub_10003F038(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003F050(_QWORD *a1, _OWORD *a2, unint64_t a3)
{
  if (!a2 || a1[8] > a3)
    return 0;
  *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 32) = *a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 32);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  return a1[8];
}

uint64_t sub_10003F0C0(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  if (!a2)
    return 0;
  v3 = a3;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) <= a3)
  {
    if (dword_100130458 <= 40
      && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 40)))
    {
      LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke_3", 40, "Received %zu bytes of remaining data from agent client", v3);
    }
    (*(void (**)(void))(a1[4] + 16))();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    if (dword_100130458 <= 40
      && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 40)))
    {
      LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke_3", 40, "Received %zu bytes of partial data from agent client", v3);
    }
    (*(void (**)(void))(a1[4] + 16))();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) -= v3;
  }
  return v3;
}

void sub_10003F218(id a1, OS_nw_framer *a2, OS_nw_protocol_metadata *a3, unint64_t a4, BOOL a5)
{
  OS_nw_protocol_metadata *v6;
  OS_nw_framer *v7;

  v7 = a2;
  v6 = a3;
  if (dword_100130458 <= 90 && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 90)))
    LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke_4", 90, "Cannot write on framer");

}

void sub_10003F2A4(id a1, OS_nw_framer *a2)
{
  OS_nw_framer *v2;
  OS_nw_framer *v3;
  int v4;
  OS_nw_framer *v5;

  v2 = a2;
  v3 = v2;
  if (dword_100130458 <= 30
    && ((v5 = v2, dword_100130458 != -1) || (v4 = _LogCategory_Initialize(&dword_100130458, 30), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130458, "+[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:]_block_invoke_5", 30, "Cleaning up connection framer=%@\n", v3);

  }
  else
  {

  }
}

nw_protocol_definition_t nwrapport_copy_protocol_definition()
{
  nw_protocol_definition_t definition;
  uint8_t v2[16];

  definition = nw_framer_create_definition("rapport-client-peer", 0, &stru_100112658);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "registering rapport peer protocol", v2, 2u);
  }
  return definition;
}

int sub_10003F3A4(id a1, OS_nw_framer *a2)
{
  OS_nw_framer *v2;
  nw_framer_message_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v7[4];
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[6];
  _QWORD v13[3];
  char v14;

  v2 = a2;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3010000000;
  v12[4] = 0;
  v12[5] = 0;
  v12[3] = &unk_1000F040E;
  v3 = nw_framer_message_create((nw_framer_t)v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F4F4;
  v7[3] = &unk_1001126A8;
  v10 = v13;
  v11 = v12;
  v4 = v2;
  v8 = v4;
  v5 = v3;
  v9 = v5;
  nw_framer_set_input_handler(v4, v7);
  nw_framer_set_output_handler(v4, &stru_1001126C8);
  nw_framer_set_stop_handler(v4, &stru_100112708);
  nw_framer_set_cleanup_handler(v4, &stru_100112728);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  return 2;
}

void sub_10003F4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003F4F4(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  int *v8;
  id v9;
  int v10;
  char *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD parse[7];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  int v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  uint64_t v42;

  v3 = a2;
  v4 = a1 + 56;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) == 0;
  v7 = 16;
  v8 = &OBJC_IVAR___RPCompanionLinkDaemon__bleNeedsCLinkDevice;
  do
  {
    if (!v6)
      break;
    parse[0] = _NSConcreteStackBlock;
    parse[1] = 3221225472;
    parse[2] = sub_10003F850;
    parse[3] = &unk_100112680;
    parse[5] = v5;
    parse[6] = 16;
    parse[4] = *(_QWORD *)v4;
    if (!nw_framer_parse_input(v3, 0x10uLL, 0x10uLL, 0, parse))
      goto LABEL_31;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v8 + 968, "controlCodeToString:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 32));
      v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 33);
      v11 = strerror(v10);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v36 = v9;
      v8 = &OBJC_IVAR___RPCompanionLinkDaemon__bleNeedsCLinkDevice;
      v37 = 1024;
      v38 = v10;
      v39 = 2080;
      v40 = v11;
      v41 = 2048;
      v42 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Client RX framer msg header={%s error: %d (%s), length: %zu}", buf, 0x26u);
    }
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 1;
  }
  while (!*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24));
  v13 = (void *)nw_framer_connection_state_copy_object_value(v3, "started");
  v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v14)
      sub_1000B1788(a1 + 56);
    v15 = *(_QWORD *)(*(_QWORD *)v4 + 8);
    if (!*(_BYTE *)(v15 + 32) && *(_QWORD *)(v15 + 40))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_1000B1710(a1 + 56, v25, v26, v27, v28, v29, v30, v31);
      nw_framer_deliver_input_no_copy(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(nw_framer_message_t *)(a1 + 40), 0);
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_1000B1698(a1 + 56, v16, v17, v18, v19, v20, v21, v22);
    v23 = *(NSObject **)(a1 + 32);
    v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 33);
  }
  else
  {
    if (v14)
      sub_1000B1658();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 36) == 320017171)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_1000B1574();
      nw_framer_connection_state_set_object_value(*(_QWORD *)(a1 + 32), "started", CFSTR("true"));
      nw_framer_mark_ready(*(nw_framer_t *)(a1 + 32));
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000B15E0();
    v32 = *(_QWORD *)(*(_QWORD *)v4 + 8);
    v24 = *(unsigned __int8 *)(v32 + 33);
    if (!*(_BYTE *)(v32 + 33))
    {
      *(_BYTE *)(v32 + 33) = 53;
      v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 33);
    }
    v23 = *(NSObject **)(a1 + 32);
  }
  nw_framer_mark_failed_with_error(v23, v24);
LABEL_30:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

  v7 = 0;
LABEL_31:

  return v7;
}

uint64_t sub_10003F850(_QWORD *a1, _OWORD *a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v4;

  if (!a2 || a1[6] > a3)
    return 0;
  *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 32) = *a2;
  v4 = a1[5];
  result = a1[6];
  *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 1;
  return result;
}

void sub_10003F88C(id a1, OS_nw_framer *a2, OS_nw_protocol_metadata *a3, unint64_t a4, BOOL a5)
{
  OS_nw_framer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v6 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_1000B181C(a4, v7, v8, v9, v10, v11, v12, v13);
  v14[0] = 0;
  v14[1] = a4;
  nw_framer_write_output((nw_framer_t)v6, (const uint8_t *)v14, 0x10uLL);
  nw_framer_write_output_no_copy((nw_framer_t)v6, a4);

}

BOOL sub_10003F8FC(id a1, OS_nw_framer *a2)
{
  OS_nw_framer *v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000B1888((uint64_t)v2);
  +[RPNWFramer writeControlOnFramer:type:error:](RPNWFramer, "writeControlOnFramer:type:error:", v2, 3, 0);

  return 1;
}

void sub_10003F95C(id a1, OS_nw_framer *a2)
{
  int v3;
  OS_nw_framer *v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Cleanup handler called for framer=%@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_10003FA00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10003FA10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10003FA7C(id a1)
{
  void *v1;

  v1 = (void *)qword_100131F98;
  qword_100131F98 = (uint64_t)&off_10011AD68;

}

void sub_100040718(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (dword_1001304C8 <= 90
    && ((v5 = v2, dword_1001304C8 != -1) || (v4 = _LogCategory_Initialize(&dword_1001304C8, 90), v3 = v5, v4)))
  {
    LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController _remoteObjectProxy]_block_invoke", 90, "Failed to retrieve remote object proxy with error:%@\n", v3);

  }
  else
  {

  }
}

void sub_1000408EC(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dispatchQueue"));
  dispatch_assert_queue_V2(v4);

  if (a2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tapEvent"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactID"));

  }
  else
  {
    v8 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tapEvent"));
  objc_msgSend(v6, "setContactID:", v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxy"));
  objc_msgSend(v7, "didUpdateTransaction:", *(_QWORD *)(a1 + 40));

}

void sub_1000410BC(id a1)
{
  void *v1;

  v1 = (void *)qword_100131FA8;
  qword_100131FA8 = (uint64_t)&off_10011AD80;

}

void sub_100041190(id a1)
{
  void *v1;

  v1 = (void *)qword_100131FB8;
  qword_100131FB8 = (uint64_t)&off_10011ADA8;

}

id sub_100042BC0(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;

  if (dword_1001306B8 <= 40 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
  {
    v2 = *(id *)(a1 + 32);
    v3 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v3, "appendFormat:", CFSTR("%p"), v2);

    LogPrintF(&dword_1001306B8, "+[RPNWListener startListenerMappingTimeout:]_block_invoke", 40, "RPNWListener[%@] aged out\n", v3);
  }
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ageOutListenerTimer"));
  dispatch_source_cancel(v4);

  objc_msgSend(*(id *)(a1 + 32), "setAgeOutListenerTimer:", 0);
  return +[RPNWListener removeListenerForApplicationService:](RPNWListener, "removeListenerForApplicationService:", *(_QWORD *)(a1 + 40));
}

void sub_100043B60(id a1)
{
  RPEndpoint *v1;
  void *v2;

  v1 = objc_alloc_init(RPEndpoint);
  v2 = (void *)qword_100131FD8;
  qword_100131FD8 = (uint64_t)v1;

}

uint64_t start(int a1, uint64_t a2)
{
  char v2;
  const char **v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  int *v7;
  int *v8;
  _TtC8rapportd27RPSwiftMemoryTest_objCClass *v9;
  id v10;
  dispatch_queue_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v17[1024];

  if (a1 >= 2)
  {
    v2 = 0;
    v3 = (const char **)(a2 + 8);
    v4 = a1 - 1;
    while (1)
    {
      v5 = *v3;
      if (!strcmp(*v3, "--system"))
      {
        v2 = 1;
      }
      else
      {
        if (!strcmp(v5, "-V") || !strcmp(v5, "--version") || !strcmp(v5, "version"))
        {
          fprintf(__stdoutp, "Rapport daemon version %s\n", "602.1");
          return 0;
        }
        fprintf(__stderrp, "warning: unknown option '%s'\n", v5);
      }
      ++v3;
      if (!--v4)
        goto LABEL_12;
    }
  }
  v2 = 0;
LABEL_12:
  v6 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.rapportd") & 1) == 0
    && dword_100130728 <= 90
    && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
  {
    v7 = __error();
    LogPrintF(&dword_100130728, "int main(int, const char **)", 90, "### _set_user_dir_suffix failed: %#m\n", *v7);
  }
  if (!confstr(65537, v17, 0x400uLL)
    && dword_100130728 <= 90
    && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
  {
    v8 = __error();
    LogPrintF(&dword_100130728, "int main(int, const char **)", 90, "### _CS_DARWIN_USER_TEMP_DIR failed: %#m\n", *v8);
  }
  signal(13, (void (__cdecl *)(int))1);
  LogSetAppID(CFSTR("com.apple.rapport"));
  LogControl("?.*:level=chatty,.*:flags=public");
  if ((v2 & 1) != 0)
  {
    if (dword_100130728 <= 30
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    {
      LogPrintF(&dword_100130728, "int main(int, const char **)", 30, "Started (system) %s\n", "602.1");
    }
  }
  else
  {
    if (dword_100130728 <= 30
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    {
      LogPrintF(&dword_100130728, "int main(int, const char **)", 30, "Started (user) %s\n", "602.1");
    }
    v9 = objc_alloc_init(_TtC8rapportd27RPSwiftMemoryTest_objCClass);
    -[RPSwiftMemoryTest_objCClass performLog](v9, "performLog");
    v10 = objc_alloc_init((Class)CUPairingDaemon);
    v11 = dispatch_queue_create("CUPairingDaemon", 0);
    objc_msgSend(v10, "setDispatchQueue:", v11);

    objc_msgSend(v10, "activate");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    v13 = CUMainQueue();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "setDispatchQueue:", v14);

    objc_msgSend(v12, "activate");
  }
  objc_autoreleasePoolPop(v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v15, "run");

  return 0;
}

void sub_1000472E8(id a1)
{
  RPDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPDaemon);
  v2 = (void *)qword_100131FE8;
  qword_100131FE8 = (uint64_t)v1;

}

void sub_1000475F0(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  objc_msgSend(v1, "postDaemonInfoChanges:", 0x80000);

}

id sub_100048170(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prefsChanged");
}

uint64_t sub_100048178(uint64_t result)
{
  uint64_t v1;

  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 32) != -1)
  {
    v1 = result;
    if (dword_100130728 <= 30)
    {
      if (dword_100130728 != -1 || (result = _LogCategory_Initialize(&dword_100130728, 30), (_DWORD)result))
        result = LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_2", 30, "Language changed...forcing exit\n");
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 144) = 1;
    return xpc_transaction_exit_clean(result);
  }
  return result;
}

void sub_10004820C(uint64_t a1)
{
  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_3", 30, "SIGTERM received\n");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_prefsChanged");
  exit(0);
}

id sub_100048284(uint64_t a1)
{
  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_4", 30, "Manatee state changed\n");
  return objc_msgSend(*(id *)(a1 + 32), "_updateErrorFlags");
}

id sub_1000482F4(uint64_t a1)
{
  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_5", 30, "Primary AppleID changed\n");
  return objc_msgSend(*(id *)(a1 + 32), "_updateErrorFlags");
}

id sub_100048364(uint64_t a1)
{
  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_6", 30, "WiFi state changed\n");
  return objc_msgSend(*(id *)(a1 + 32), "_updateErrorFlags");
}

id sub_1000483D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateErrorFlags");
}

uint64_t sub_1000483DC(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;
  const char *v4;

  result = (uint64_t)xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  v4 = (const char *)result;
  if (result && (result = strcmp((const char *)result, "com.apple.rapport.prefsChanged"), !(_DWORD)result))
  {
    if (dword_100130728 <= 30
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_8", 30, "Prefs changed\n");
    }
    return (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_prefsChanged");
  }
  else if (dword_100130728 <= 60)
  {
    if (dword_100130728 != -1)
      return LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_8", 60, "### Unexpected XPC event: %s\n", v4);
    result = _LogCategory_Initialize(&dword_100130728, 60);
    if ((_DWORD)result)
      return LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_8", 60, "### Unexpected XPC event: %s\n", v4);
  }
  return result;
}

_QWORD *sub_1000484EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[15])
    return _objc_msgSend(result, "_xpcPublisherAction:token:event:", a2, a3, a4);
  return result;
}

uint64_t sub_10004850C(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 120))
  {
    if (dword_100130728 <= 90)
    {
      if (dword_100130728 != -1)
        return LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_10", 90, "### XPC publisher error: %#m\n", a2);
      result = _LogCategory_Initialize(&dword_100130728, 90);
      if ((_DWORD)result)
        return LogPrintF(&dword_100130728, "-[RPDaemon activate]_block_invoke_10", 90, "### XPC publisher error: %#m\n", a2);
    }
  }
  return result;
}

uint64_t sub_100048590(uint64_t a1)
{
  return CUStateDumpWithObject("RPDaemon", *(_QWORD *)(a1 + 32), &dword_100130728);
}

os_state_data_s *__cdecl sub_1000485AC(id a1, os_state_hints_s *a2)
{
  void *v2;
  os_state_data_s *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v3 = (os_state_data_s *)CUStateDumpWithObject("RPIdentities", v2, &dword_100130728);

  return v3;
}

uint64_t sub_1000485FC(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "keychainStateString"));
  v2 = CUStateDumpWithObject("RPKeychain", v1, &dword_100130728);

  return v2;
}

os_state_data_s *__cdecl sub_100048648(id a1, os_state_hints_s *a2)
{
  void *v2;
  os_state_data_s *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPPrivateDaemon sharedPrivateDaemon](RPPrivateDaemon, "sharedPrivateDaemon"));
  v3 = (os_state_data_s *)CUStateDumpWithObject("RPPrivateDiscovery", v2, &dword_100130728);

  return v3;
}

id sub_100048C58(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(*(id *)(a1 + 40), "connectionInvalidated");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(a1 + 40));
}

void sub_100048ED0(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon postDaemonInfoChanges:]_block_invoke", 30, "Daemon info changed: %#ll{flags}\n", *(_QWORD *)(a1 + 40), &unk_10010A382);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "daemonInfoChanged:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void sub_100049654(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v13 = a4;
  switch(a2)
  {
    case 6:
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = 1;
LABEL_7:
      objc_msgSend(v14, "_xpcPublisherStateChangedForToken:state:", v15, v16);
      goto LABEL_12;
    case 5:
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = 0;
      goto LABEL_7;
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "_xpcPublisherTriggeredToken:payload:responseHandler:", *(_QWORD *)(a1 + 40), v20, v13);
      goto LABEL_14;
  }
  if (dword_100130728 <= 90 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
    LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherAddToken:event:]_block_invoke", 90, "### XPC matching handler bad state: %d, token %llu\n", a2, *(_QWORD *)(a1 + 40));
LABEL_12:
  if (v13)
  {
    v17 = RPErrorF(4294960560, (uint64_t)"Not expecting response", v7, v8, v9, v10, v11, v12, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v13[2](v13, 0, v18);

  }
LABEL_14:

}

id sub_100049B60(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_xpcPublisherTriggeredReply:token:responseHandler:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void sub_100049D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100049DD4(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
  {
    v2 = (_QWORD *)result;
    if (dword_100130728 <= 90)
    {
      if (dword_100130728 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130728, 90))
          return (*(uint64_t (**)(void))(v2[4] + 16))();
        v1 = *(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 40);
      }
      LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherTriggeredReply:token:responseHandler:]_block_invoke", 90, "### XPC publisher reply failed: token %llu, %{error}\n", v2[6], v1);
    }
    return (*(uint64_t (**)(void))(v2[4] + 16))();
  }
  return result;
}

BOOL sub_10004BCF8()
{
  int v0;
  id v1;
  void *v2;
  void *v3;
  int v4;

  v0 = dword_100131FF8;
  if (!dword_100131FF8)
  {
    v1 = -[objc_class currentState](off_1001308C8(), "currentState");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    v3 = v2;
    if (v2)
    {
      if (objc_msgSend(v2, "supportsDataTransfer"))
        v4 = 5;
      else
        v4 = 6;
      dword_100131FF8 = v4;
      if (dword_100130858 <= 50
        && (dword_100130858 != -1 || _LogCategory_Initialize(&dword_100130858, 50)))
      {
        LogPrintF(&dword_100130858, "BOOL __isWiFiSingleBandModeRequired(void)", 50, "isWiFiSingleBandModeRequired = %s");
      }
    }
    else if (dword_100130858 <= 90
           && (dword_100130858 != -1 || _LogCategory_Initialize(&dword_100130858, 90)))
    {
      LogPrintF(&dword_100130858, "BOOL __isWiFiSingleBandModeRequired(void)", 90, "### isWiFiSingleBandModeRequired = Invalid, Fail to fetch WiFiP2PAWDLState");
    }

    v0 = dword_100131FF8;
  }
  return v0 == 6;
}

Class sub_10004C618()
{
  Class result;

  if (qword_100132008 != -1)
    dispatch_once(&qword_100132008, &stru_100112A58);
  result = objc_getClass("WiFiP2PAWDLState");
  qword_100132000 = (uint64_t)result;
  off_1001308C8 = (uint64_t (*)())sub_10004C674;
  return result;
}

id sub_10004C674()
{
  return (id)qword_100132000;
}

void sub_10004C680(id a1)
{
  qword_100132010 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/WiFiPeerToPeer.framework/WiFiPeerToPeer", 2);
}

void sub_10004D8B4(id a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_alloc_init((Class)NSDateFormatter);
  v2 = (void *)qword_100132018;
  qword_100132018 = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
  objc_msgSend((id)qword_100132018, "setLocale:", v3);

  objc_msgSend((id)qword_100132018, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend((id)qword_100132018, "setTimeZone:", v4);

}

id sub_10004DCD0(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleCommand:responseHandler:", a2);
}

id sub_10004DCDC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleTouchStart:responseHandler:", a2);
}

id sub_10004DCE8(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleTouchStop:responseHandler:", a2);
}

id sub_10004DCF4(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleTouchEvent:", a2);
}

id sub_10004DD00(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleGameControllerStart:responseHandler:", a2);
}

id sub_10004DD0C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleGameControllerStop:responseHandler:", a2);
}

id sub_10004DD18(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleGameControllerEvent:", a2);
}

void sub_10004F7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_10004F810(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  result = objc_msgSend(a3, "getValue:", &v9);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 6 * (*(_BYTE *)(v7 + 24))++;
  *(_BYTE *)(v8 + 32) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(_BYTE *)(v8 + 33) = (v10 - 1) < 3;
  *(_DWORD *)(v8 + 34) = HIDWORD(v9);
  if (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 2u)
    *a4 = 1;
  return result;
}

id sub_10004F9A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_injectKeyboardEventUsagePage:usageCode:buttonState:", 12, 128, *(unsigned int *)(a1 + 40));
}

void sub_10004FDF4(id a1)
{
  RPNearFieldDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPNearFieldDaemon);
  v2 = (void *)qword_100132028;
  qword_100132028 = (uint64_t)v1;

}

id sub_10004FEC4(id result)
{
  uint64_t v1;

  v1 = *((_QWORD *)result + 4);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    return _objc_msgSend(*((id *)result + 4), "_activate");
  }
  return result;
}

id sub_1000500F0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_100050554(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transactionChangedHandler"));

  if (v2)
  {
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transactionChangedHandler"));
    v3[2]();

  }
}

void sub_1000505BC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nearFieldController"));
  objc_msgSend(v1, "invalidate");

}

uint64_t sub_100050794()
{
  int DeviceClass;
  uint64_t result;

  DeviceClass = GestaltGetDeviceClass();
  LODWORD(result) = _os_feature_enabled_impl("Sharing", "BoopToAction");
  if (DeviceClass == 1 || DeviceClass == 6)
    return result;
  else
    return 0;
}

uint64_t sub_1000507D4(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = a1;
  v2 = (uint64_t)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v11 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v5, "serviceType", (_QWORD)v10) == (id)1)
        {
          v8 = objc_opt_class(RPAWDLBonjourTransportServiceMetadata, v6, v7);
          if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0
            && (objc_msgSend(v5, "isSingleBandModeRequired") & 1) != 0)
          {
            v2 = 1;
            goto LABEL_13;
          }
        }
      }
      v2 = (uint64_t)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_13:

  return v2;
}

BOOL sub_100050908(unint64_t a1)
{
  return a1 < 2;
}

IOPMAssertionID *sub_100050914(IOPMAssertionID *a1)
{
  IOPMAssertionID *v1;
  const __CFDictionary *v2;
  IOPMAssertionID v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v1 = a1;
  if (a1)
  {
    if (*a1)
    {
      return 0;
    }
    else
    {
      v5[0] = CFSTR("AssertType");
      v5[1] = CFSTR("AssertLevel");
      v6[0] = CFSTR("PreventUserIdleSystemSleep");
      v6[1] = &off_10011ABD8;
      v5[2] = CFSTR("AssertName");
      v5[3] = CFSTR("TimeoutSeconds");
      v6[2] = CFSTR("com.apple.rapport.RPNFCTransactionController.potentialInitiator");
      v6[3] = &off_10011ABF0;
      v5[4] = CFSTR("TimeoutAction");
      v6[4] = CFSTR("TimeoutActionTurnOff");
      v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 5));
      if (IOPMAssertionCreateWithProperties(v2, v1) || (v3 = *v1) == 0)
      {
        v3 = 0;
        *v1 = 0;
      }
      v1 = (IOPMAssertionID *)(v3 != 0);

    }
  }
  return v1;
}

uint64_t sub_100050A30(uint64_t result)
{
  _DWORD *v1;

  if (result)
  {
    v1 = (_DWORD *)result;
    result = *(unsigned int *)result;
    if ((_DWORD)result)
    {
      IOPMAssertionRelease(result);
      *v1 = 0;
      return 1;
    }
  }
  return result;
}

const char *sub_1000518A8(int a1)
{
  const char *result;

  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 >= 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589824:
              return "FindNearbyRemote";
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            default:
              return "?";
          }
        }
        else
        {
          switch(a1)
          {
            case 2147418112:
              result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              result = "InternalTestActiveScan";
              break;
            case 2147418118:
              result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }
      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            result = "ADPD";
            break;
          case 524289:
            result = "ADPDBuffer";
            break;
          case 524290:
            result = "MicroLocation";
            break;
          case 524291:
            result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              result = "PrecisionFindingFindee";
            }
            else
            {
              if (a1 != 458754)
                return "?";
              result = "PrecisionFindingFindeeHighPriority";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 393216:
            result = "CaptiveNetworkJoin";
            break;
          case 393217:
            result = "UseCaseSIMTransfer";
            break;
          case 393218:
            result = "MacSetup";
            break;
          case 393219:
            result = "AppleIDSignIn";
            break;
          case 393220:
            result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              result = "RapportThirdParty";
            }
            else
            {
              if (a1 != 458752)
                return "?";
              result = "PrecisionFindingFinder";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            result = "DigitalIDTSA";
          }
          else
          {
            if (a1 != 0x40000)
              return "?";
            result = "DigitalCarKeyThirdParty";
          }
          break;
      }
    }
  }
  else
  {
    result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "HealthKit";
        break;
      case 2:
        result = "HomeKit";
        break;
      case 3:
        result = "FindMyObjectConnection";
        break;
      case 4:
        result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        result = "MIDI";
        break;
      case 6:
        result = "Continuity";
        break;
      case 7:
        result = "InstantHotSpot";
        break;
      case 8:
        result = "NearBy";
        break;
      case 9:
        result = "Sharing";
        break;
      case 10:
        result = "HearingSupport";
        break;
      case 11:
        result = "Magnet";
        break;
      case 12:
        result = "HID";
        break;
      case 13:
        result = "LEA";
        break;
      case 14:
        result = "External";
        break;
      case 15:
        result = "ExternalMedical";
        break;
      case 16:
        result = "ExternalLock";
        break;
      case 17:
        result = "ExternalWatch";
        break;
      case 18:
        result = "SmartRouting";
        break;
      case 19:
        result = "DigitalID";
        break;
      case 20:
        result = "DigitalKey";
        break;
      case 21:
        result = "DigitalCarKey";
        break;
      case 22:
        result = "HeySiri";
        break;
      case 23:
        result = "ThirdPartyApp";
        break;
      case 24:
        result = "CNJ";
        break;
      default:
        switch(a1)
        {
          case 256:
            result = "DevicePresenceDetection";
            break;
          case 257:
            result = "AudioBox";
            break;
          case 258:
            result = "SIMTransfer";
            break;
          case 259:
            result = "ProximityScreenOnLeechScan";
            break;
          case 260:
            result = "MacMigrate";
            break;
          case 263:
            result = "HIDUARTService";
            break;
          case 264:
            result = "AccessibilitySwitchControlPairing";
            break;
          case 265:
            result = "BaseBandFastConnect";
            break;
          case 266:
            result = "SafetyAlerts";
            break;
          case 267:
            result = "LECarPlay";
            break;
          case 268:
            result = "TCCBluetooth";
            break;
          case 269:
            result = "AOPBufferLeech";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  return result;
}

id sub_100051FDC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_deviceFound:", a2);
}

id sub_100051FE8(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_deviceLost:", a2);
}

void sub_100051FF4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    if (dword_100130AF0 <= 90)
    {
      if (dword_100130AF0 != -1 || (v4 = _LogCategory_Initialize(&dword_100130AF0, 90), v3 = v5, v4))
        LogPrintF(&dword_100130AF0, "-[RPNearbyActionV2Discovery activateWithCompletion:]_block_invoke_3", 90, " ### BLE NearbyActionV2 discovery failed to start: %@\n", v3);
    }
  }
  else if (dword_100130AF0 <= 30
         && (dword_100130AF0 != -1 || _LogCategory_Initialize(&dword_100130AF0, 30)))
  {
    LogPrintF(&dword_100130AF0, "-[RPNearbyActionV2Discovery activateWithCompletion:]_block_invoke_3", 30, "BLE NearbyActionV2 discovery started\n");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id sub_10005272C()
{
  if (qword_100132060 != -1)
    dispatch_once(&qword_100132060, &stru_100112C48);
  return (id)qword_100132058;
}

Class sub_100052A38()
{
  Class result;

  if (qword_100132048 != -1)
    dispatch_once(&qword_100132048, &stru_100112C28);
  result = objc_getClass("CBDiscovery");
  qword_100132040 = (uint64_t)result;
  off_100130B60 = (uint64_t (*)())sub_100052A94;
  return result;
}

id sub_100052A94()
{
  return (id)qword_100132040;
}

void sub_100052AA0(id a1)
{
  qword_100132050 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

void sub_100052AC8(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = LogCategoryCopyOSLogHandle(&dword_100130AF0);
  v2 = (void *)qword_100132058;
  qword_100132058 = v1;

}

void sub_100052EFC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NSUUID *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_opt_new(NSUUID);
  objc_msgSend(v2, "addMappingForDevice:endpointID:", v3, v4);

}

id sub_100052F5C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMappingForDevice:", a2);
}

id sub_100052F68(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeDevice:", a2);
}

id sub_100052F74(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "removeAllDevices");
}

void sub_100055308(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v11 = a3;
  if (!v21)
  {
    v18 = RPErrorF(4294960569, (uint64_t)"User's pairing identity was not found.\n", v5, v6, v7, v8, v9, v10, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if (!v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v11)
LABEL_3:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_4:
  v12 = objc_alloc_init((Class)RPIdentity);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "publicKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data"));
  objc_msgSend(v12, "setEdPKData:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "privateKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "data"));
  objc_msgSend(v12, "setEdSKData:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  objc_msgSend(v12, "setIdentifier:", v17);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100055500(uint64_t a1)
{
  void (**v2)(_QWORD);
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  int v6;
  void (**v7)(_QWORD);

  v2 = (void (**)(_QWORD))objc_retainBlock(*(id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = v2;
  if (v2)
  {
    v7 = v2;
    if (dword_100130C48 <= 30)
    {
      if (dword_100130C48 != -1 || (v6 = _LogCategory_Initialize(&dword_100130C48, 30), v3 = v7, v6))
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userID"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "name"));
        LogPrintF(&dword_100130C48, "-[RPHomeKitManager user:didUpdateAssistantAccessControl:forHome:]_block_invoke", 30, "DidUpdateAssistantAccessControl: user %{mask}, home '%@'", v4, v5);

        v3 = v7;
      }
    }
    v3[2](v3);
    v3 = v7;
  }

}

void sub_10005568C(uint64_t a1)
{
  void (**v2)(id, void *, void *);
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, void *);

  v2 = (void (**)(id, void *, void *))objc_retainBlock(*(id *)(*(_QWORD *)(a1 + 32) + 48));
  if (v2)
  {
    v8 = v2;
    if (dword_100130C48 <= 30
      && (dword_100130C48 != -1 || _LogCategory_Initialize(&dword_100130C48, 30)))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "siriEndpointIdentifier"));
      LogPrintF(&dword_100130C48, "-[RPHomeKitManager home:didUpdateRoom:forAccessory:]_block_invoke", 30, "DidUpdateRoom: room name updated to '%@' for HomeHub device %@", v3, v4);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "siriEndpointIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
    v8[2](v8, v6, v7);

    v2 = v8;
  }

}

Class sub_10005589C()
{
  Class result;

  if (qword_100132078 != -1)
    dispatch_once(&qword_100132078, &stru_100112CB8);
  result = objc_getClass("HMHomeManagerConfiguration");
  qword_100132070 = (uint64_t)result;
  off_100130CB8 = (uint64_t (*)())sub_1000558F8;
  return result;
}

id sub_1000558F8()
{
  return (id)qword_100132070;
}

void sub_100055904(id a1)
{
  qword_100132080 = (uint64_t)dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 2);
}

Class sub_10005592C()
{
  Class result;

  if (qword_100132078 != -1)
    dispatch_once(&qword_100132078, &stru_100112CB8);
  result = objc_getClass("HMHomeManager");
  qword_100132088 = (uint64_t)result;
  off_100130CC0 = (uint64_t (*)())sub_100055988;
  return result;
}

id sub_100055988()
{
  return (id)qword_100132088;
}

id sub_100055A4C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_activate");
}

id sub_100055BE8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_100056150(id a1)
{
  RPNearbyInvitationDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPNearbyInvitationDaemon);
  v2 = (void *)qword_100132090;
  qword_100132090 = (uint64_t)v1;

}

id sub_1000566C8(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionDiscoveryDeviceFound:", a2);
}

id sub_1000566D4(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionDiscoveryDeviceLost:", a2);
}

id sub_1000566E0(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionDiscoveryDeviceFound:", a2);
}

void sub_1000566EC(id a1)
{
  if (dword_100130D88 <= 30 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStarted]_block_invoke_4", 30, "BLE action discovery interrupted\n");
}

void sub_10005674C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStarted]_block_invoke_5", 90, "### BLE NearbyAction scanner start failed: %{error}\n", v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionDiscoveryEnsureStopped");
    goto LABEL_10;
  }
  if (dword_100130D88 <= 30)
  {
    v6 = 0;
    if (dword_100130D88 != -1 || (v5 = _LogCategory_Initialize(&dword_100130D88, 30), v4 = 0, v5))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryEnsureStarted]_block_invoke_5", 30, "BLE NearbyAction scanner started\n");
LABEL_10:
      v4 = v6;
    }
  }

}

id sub_1000570A0(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 192);
    *(_QWORD *)(v4 + 192) = 0;

  }
  if (dword_100130D88 <= 50 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionDiscoveryScanRateStartTimer]_block_invoke", 50, "Reducing NearbyAction scan rate\n");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setScanRate:", 20);
}

id sub_1000572A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionEnableDupeFilter");
}

void sub_1000576D4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStarted]_block_invoke", 90, "### BLE NearbyAction advertiser failed: %@\n", v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionAdvertiserEnsureStopped");
  }
  else
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "daemonDevice"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bleTargetData"));
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserEnsureStarted]_block_invoke", 30, "BLE NearbyAction advertiser started. targeting %@ \n", v4);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionAdvertiserStartTimer");
  }

}

void sub_10005797C(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 208);
    *(_QWORD *)(v4 + 208) = 0;

  }
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_idleSessionConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activatedSession"));
  v7 = objc_msgSend(v6, "waitingToConnect");

  if (v7)
  {
    if (dword_100130D88 <= 50
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activatedSession"));
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLENearbyActionAdvertiserStartTimer]_block_invoke", 50, "Timed out waiting for session to start: %@");

    }
    v14 = RPErrorF(4294960574, (uint64_t)"Timed out trying to connect", v8, v9, v10, v11, v12, v13, (uint64_t)v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v17, "sessionActivatedWithError:", v15);
    objc_msgSend(*(id *)(a1 + 32), "_update");

  }
}

void sub_100057C14(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:"));
  if (v5)
  {
    if (dword_100130D88 <= 30
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      v6 = CFSTR("NO");
      if ((_DWORD)a3)
        v6 = CFSTR("YES");
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStarted]_block_invoke", 30, "Proximity region for device ID %@ in region: %@\n", v7, v6);
    }
    objc_msgSend(v5, "setInBubble:", a3);
    if ((_DWORD)a3)
      objc_msgSend(v5, "setWasTriggered:", 1);
    if (objc_msgSend(v5, "inBubble"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_clientReportFoundDevice:", v5);
    }
    else if ((objc_msgSend(v5, "inBubble") & 1) == 0
           && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_clientReportLostDevice:", v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "_update");
  }

}

void sub_100057D48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStarted]_block_invoke_2", 90, "### Proximity estimator start failed: %{error}\n", v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "_clientBLENearbyActionDiscoveryEnsureStopped");
    goto LABEL_10;
  }
  if (dword_100130D88 <= 30)
  {
    v6 = 0;
    if (dword_100130D88 != -1 || (v5 = _LogCategory_Initialize(&dword_100130D88, 30), v4 = 0, v5))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientProximityEstimatorEnsureStarted]_block_invoke_2", 30, "Proximity estimator started\n");
LABEL_10:
      v4 = v6;
    }
  }

}

id sub_1000584AC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_clientBLEServerHandleConnectionStarted:", a2);
}

void sub_1000584B8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLEServerEnsureStarted]_block_invoke_2", 90, "### BLE server start failed: %@\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = 0;

    goto LABEL_10;
  }
  if (dword_100130D88 <= 30)
  {
    v8 = 0;
    if (dword_100130D88 != -1 || (v7 = _LogCategory_Initialize(&dword_100130D88, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLEServerEnsureStarted]_block_invoke_2", 30, "BLE server started, PSM 0x%X\n", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "listeningPSM"));
LABEL_10:
      v4 = v8;
    }
  }

}

void sub_100058904(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "client"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcCnx"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &stru_100112D90));
    objc_msgSend(v5, "nearbyInvitationSessionError:", v3);

  }
}

void sub_100058988(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (dword_100130D88 <= 90
    && ((v5 = v2, dword_100130D88 != -1) || (v4 = _LogCategory_Initialize(&dword_100130D88, 90), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _clientBLEServerHandleConnectionStarted:]_block_invoke_2", 90, "### Failed to send error handler ended call: %@", v3);

  }
  else
  {

  }
}

void sub_100058A08(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client"));
  if ((objc_msgSend(*(id *)(a1 + 32), "invalidationHandled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_clientBLEServerHandleConnectionEnded:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setNetCnx:", 0);
  }

}

void sub_100058A60(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "client"));
  objc_msgSend(*(id *)(a1 + 40), "_receivedEventID:event:options:xpcCnx:sessionID:", v10, v9, v8, v11, 0);

}

void sub_100058AF4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "client"));
  objc_msgSend(*(id *)(a1 + 40), "_receivedRequestID:request:options:responseHandler:xpcCnx:sessionID:", v13, v12, v11, v10, v14, 0);

}

id sub_100058B9C(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidationHandled");
  if ((result & 1) == 0)
    return _objc_msgSend(*(id *)(a1 + 40), "_clientBLEServerHandleConnectionStateChange:cnx:", a2, *(_QWORD *)(a1 + 32));
  return result;
}

id sub_10005912C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyInfoDiscoveryDeviceFound:", a2);
}

id sub_100059138(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyInfoDiscoveryDeviceLost:", a2);
}

id sub_100059144(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyInfoDiscoveryDeviceFound:", a2);
}

void sub_100059150(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStarted]_block_invoke_4", 90, "### BLE NearbyInfo scanner start failed: %{error}\n", v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyInfoDiscoveryEnsureStopped");
    goto LABEL_10;
  }
  if (dword_100130D88 <= 30)
  {
    v6 = 0;
    if (dword_100130D88 != -1 || (v5 = _LogCategory_Initialize(&dword_100130D88, 30), v4 = 0, v5))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyInfoDiscoveryEnsureStarted]_block_invoke_4", 30, "BLE NearbyInfo scanner started\n");
LABEL_10:
      v4 = v6;
    }
  }

}

id sub_100059894(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyActionDiscoveryDeviceFound:", a2);
}

void sub_1000598A0(id a1, SFDevice *a2)
{
  SFDevice *v2;
  SFDevice *v3;
  int v4;
  SFDevice *v5;

  v2 = a2;
  v3 = v2;
  if (dword_100130D88 <= 10
    && ((v5 = v2, dword_100130D88 != -1) || (v4 = _LogCategory_Initialize(&dword_100130D88, 10), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted]_block_invoke_2", 10, "BLE NearbyAction lost device: %@\n", v3);

  }
  else
  {

  }
}

id sub_100059920(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyActionDiscoveryDeviceFound:", a2);
}

void sub_10005992C(id a1)
{
  if (dword_100130D88 <= 30 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted]_block_invoke_4", 30, "BLE action discovery interrupted\n");
}

void sub_10005998C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted]_block_invoke_5", 90, "### BLE NearbyAction scanner start failed: %{error}\n", v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyActionDiscoveryEnsureStopped");
    goto LABEL_10;
  }
  if (dword_100130D88 <= 30)
  {
    v6 = 0;
    if (dword_100130D88 != -1 || (v5 = _LogCategory_Initialize(&dword_100130D88, 30), v4 = 0, v5))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionDiscoveryEnsureStarted]_block_invoke_5", 30, "BLE NearbyAction scanner started\n");
LABEL_10:
      v4 = v6;
    }
  }

}

void sub_100059F84(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    if (dword_100130D88 <= 90
      && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 90)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]_block_invoke", 90, "### BLE NearbyAction advertiser failed: %@\n", v3);
    }
    objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyActionAdvertiserEnsureStopped");
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
    {
      if (dword_100130D88 <= 30
        && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
      {
        LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]_block_invoke", 30, "BLE NearbyAction advertiser started. targeting %@ (%@) \n", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
    }
    else if (dword_100130D88 <= 30
           && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 30)))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserEnsureStarted]_block_invoke", 30, "BLE NearbyAction advertiser started\n");
    }
    objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyActionAdvertiserRestartTimer");
  }

}

void sub_10005A2B0(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 200);
    *(_QWORD *)(v4 + 200) = 0;

  }
  if (dword_100130D88 <= 50 && (dword_100130D88 != -1 || _LogCategory_Initialize(&dword_100130D88, 50)))
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLENearbyActionAdvertiserRestartTimer]_block_invoke", 50, "Stopping NearbyAction HasInvitation advertiser due to timer\n");
  objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyActionAdvertiserEnsureStopped");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bleDeviceWantingInvitations"));

  if (v6)
  {
    v7 = *(_QWORD **)(a1 + 32);
    v8 = (void *)v7[17];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bleDeviceWantingInvitations"));
    objc_msgSend(v8, "removeObject:", v9);

    _objc_msgSend(*(id *)(a1 + 32), "setDevicesWantingInvitations:", 0);
  }
}

void sub_10005A7C4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client"));
  objc_msgSend(*(id *)(a1 + 40), "_bleClientConnectionEnded:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "netCnx"));
  objc_msgSend(v4, "sessionEndedWithID:netCnx:", v2, v3);

  objc_msgSend(v4, "setNetCnx:", 0);
}

void sub_10005A838(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "client"));
  objc_msgSend(*(id *)(a1 + 40), "_receivedEventID:event:options:xpcCnx:sessionID:", v10, v9, v8, v11, *(_QWORD *)(a1 + 48));

}

void sub_10005A8C8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "client"));
  objc_msgSend(*(id *)(a1 + 40), "_receivedRequestID:request:options:responseHandler:xpcCnx:sessionID:", v13, v12, v11, v10, v14, *(_QWORD *)(a1 + 48));

}

id sub_10005A96C(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidationHandled");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_bleClientConnectionStateChanged:cnx:sessionID:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 40), "_update");
  }
  return result;
}

void sub_10005A9B8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "client"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcCnx"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_100112ED8));
    objc_msgSend(v6, "nearbyInvitationSessionError:withID:", v4, *(_QWORD *)(a1 + 40));

  }
}

void sub_10005AA44(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (dword_100130D88 <= 90
    && ((v5 = v2, dword_100130D88 != -1) || (v4 = _LogCategory_Initialize(&dword_100130D88, 90), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _serverBLEClientConnectionEnsureStarted]_block_invoke_6", 90, "### Failed to send error handler call: %@", v3);

  }
  else
  {

  }
}

id sub_10005ADD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

id sub_10005AF20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void sub_10005B0D0(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "xpcCnx"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005B174;
  v4[3] = &unk_100111860;
  v5 = *(id *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4));
  objc_msgSend(v3, "nearbyInvitationReceivedEventID:event:options:sessionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void sub_10005B174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (dword_100130D88 <= 90)
  {
    v6 = v3;
    if (dword_100130D88 != -1 || (v5 = _LogCategory_Initialize(&dword_100130D88, 90), v4 = v6, v5))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _receivedEventID:event:options:xpcCnx:sessionID:]_block_invoke_2", 90, "### Failed to deliver incoming event '%@' error: %@\n", *(_QWORD *)(a1 + 32), v4);
      v4 = v6;
    }
  }

}

void sub_10005B340(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "xpcCnx"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005B3E8;
  v4[3] = &unk_100111860;
  v5 = *(id *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4));
  objc_msgSend(v3, "nearbyInvitationReceivedRequestID:request:options:responseHandler:sessionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

void sub_10005B3E8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (dword_100130D88 <= 90)
  {
    v6 = v3;
    if (dword_100130D88 != -1 || (v5 = _LogCategory_Initialize(&dword_100130D88, 90), v4 = v6, v5))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationDaemon _receivedRequestID:request:options:responseHandler:xpcCnx:sessionID:]_block_invoke_2", 90, "### Failed to deliver incoming request '%@' error: %@\n", *(_QWORD *)(a1 + 32), v4);
      v4 = v6;
    }
  }

}

void sub_10005BC0C(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (dword_100130D88 <= 90)
  {
    if (dword_100130D88 != -1 || (v4 = _LogCategory_Initialize(&dword_100130D88, 90), v3 = v6, v4))
    {
      LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection sessionStartWithID:netCnx:completion:]_block_invoke", 90, "### Failed to send session start message: %@\n", v3);
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void sub_10005BF94(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldReportDevice:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "remoteObjectProxy"));
    objc_msgSend(v4, "nearbyInvitationFoundDevice:", v5);

  }
}

void sub_10005C540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005C578(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
  {
    v2 = result;
    if (dword_100130D88 > 90)
      goto LABEL_6;
    if (dword_100130D88 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100130D88, 90))
      {
LABEL_6:
        result = *(_QWORD *)(v2 + 32);
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40));
        return result;
      }
      v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40);
    }
    LogPrintF(&dword_100130D88, "-[RPNearbyInvitationXPCConnection nearbyInvitationActivateSession:completion:]_block_invoke", 90, "### Activate session failed: %{error}\n", v1);
    goto LABEL_6;
  }
  return result;
}

Class sub_10005CD94()
{
  Class result;

  if (qword_1001320B8 != -1)
    dispatch_once(&qword_1001320B8, &stru_100112F90);
  result = objc_getClass("SFDeviceDiscovery");
  qword_1001320B0 = (uint64_t)result;
  off_100130DF8 = (uint64_t (*)())sub_10005CDF0;
  return result;
}

id sub_10005CDF0()
{
  return (id)qword_1001320B0;
}

void sub_10005CDFC(id a1)
{
  qword_1001320C0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_10005CE24()
{
  Class result;

  if (qword_1001320B8 != -1)
    dispatch_once(&qword_1001320B8, &stru_100112F90);
  result = objc_getClass("SFService");
  qword_1001320C8 = (uint64_t)result;
  off_100130E00 = (uint64_t (*)())sub_10005CE80;
  return result;
}

id sub_10005CE80()
{
  return (id)qword_1001320C8;
}

id sub_10005CE8C()
{
  id *v0;

  if (qword_1001320B8 != -1)
    dispatch_once(&qword_1001320B8, &stru_100112F90);
  v0 = (id *)dlsym((void *)qword_1001320C0, "SFServiceIdentifierAcceptedInvitation");
  if (v0)
    objc_storeStrong((id *)&qword_1001320A8, *v0);
  off_100130E08 = (uint64_t (*)())sub_10005CF04;
  return (id)qword_1001320A8;
}

id sub_10005CF04()
{
  return (id)qword_1001320A8;
}

id sub_10005CF10()
{
  id *v0;

  if (qword_1001320B8 != -1)
    dispatch_once(&qword_1001320B8, &stru_100112F90);
  v0 = (id *)dlsym((void *)qword_1001320C0, "SFServiceIdentifierHasInvitations");
  if (v0)
    objc_storeStrong((id *)&qword_1001320A0, *v0);
  off_100130E10 = (uint64_t (*)())sub_10005CF88;
  return (id)qword_1001320A0;
}

id sub_10005CF88()
{
  return (id)qword_1001320A0;
}

void sub_10005EC1C(id a1)
{
  RPIdentityDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPIdentityDaemon);
  v2 = (void *)qword_1001320E0;
  qword_1001320E0 = (uint64_t)v1;

}

id sub_10005FBDC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_activate");
}

id sub_10005FCFC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10005FD04(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_10005FD64(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_100062B5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100062B88(uint64_t a1, void *a2, _BYTE *a3)
{
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "verifyWithIdentity:", v11);
  v7 = v11;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactID"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountID"));
    v10 = objc_msgSend(v11, "type");
    if (v8 || v10 == 2)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
      goto LABEL_7;
    }
    v7 = v11;
    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v11);
LABEL_7:
      v7 = v11;
    }
  }

}

void sub_100062D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100062D98(_QWORD *a1, void *a2, _BYTE *a3)
{
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(v11, "verifySignature:data:error:", a1[4], a1[5], 0);
  v6 = v11;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountAltDSID"));
    v8 = objc_msgSend(v7, "isEqualToString:", a1[6]);

    v6 = v11;
    if (v8)
    {
      if (objc_msgSend(v11, "type") == 2 || objc_msgSend(v11, "type") == 12)
      {
        v9 = 0x80000;
        v6 = v11;
      }
      else
      {
        v10 = objc_msgSend(v11, "type");
        v6 = v11;
        if (v10 != 4)
          goto LABEL_7;
        v9 = 0x4000;
      }
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= v9;
LABEL_7:
      *a3 = 1;
    }
  }

}

void sub_100063008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006302C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  __int128 v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v6)
  {
    if (dword_100130F48 <= 60
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 60)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contactID"));
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke", 60, "### Contact with ID %@ is invalid: '%{mask}', %{error}\n", v7, v5, v6);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "accountID"));
    objc_msgSend(*(id *)(a1 + 48), "setEmailAddress:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "accountID"));
    objc_msgSend(*(id *)(a1 + 48), "setPhoneNumber:", v9);

    objc_msgSend(*(id *)(a1 + 48), "setContactIdentifier:", 0);
    v10 = objc_alloc_init((Class)off_100130FD0[0]());
    objc_msgSend(v10, "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 160));
    v11 = *(void **)(a1 + 48);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100063274;
    v17[3] = &unk_100113048;
    v18 = v10;
    v19 = v11;
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 56);
    v20 = v12;
    v21 = v13;
    v16 = *(_OWORD *)(a1 + 64);
    v14 = (id)v16;
    v22 = v16;
    v15 = v10;
    objc_msgSend(v15, "findContact:completion:", v11, v17);

  }
  else
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke", 30, "### ContactID for identity is valid: %@ \n", *(_QWORD *)(a1 + 40));
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void sub_100063274(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  id v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (!v6)
  {
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "accountID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke_2", 30, "### Updatating identity: %@ with new contactID: %s \n", v7, v8);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "accountID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
    v15 = objc_msgSend(v12, "updateFriendIdentityWithAppleID:contactID:", v13, v14);

    if ((v15 & 1) != 0)
    {
      if (dword_100130F48 > 30
        || dword_100130F48 == -1 && !_LogCategory_Initialize(&dword_100130F48, 30))
      {
        v18 = 1;
        goto LABEL_33;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "accountID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke_2", 30, "### Updatating identity: %@ succeeded with new contactID: %s \n", v16, v17);
      v18 = 1;
    }
    else
    {
      if (dword_100130F48 > 30
        || dword_100130F48 == -1 && !_LogCategory_Initialize(&dword_100130F48, 30))
      {
        v18 = 0;
        goto LABEL_33;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "accountID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke_2", 30, "### Updatating identity: %@ failed with new contactID: %s \n", v16, v17);
      v18 = 0;
    }

LABEL_33:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v18;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_34;
  }
  if (dword_100130F48 <= 60 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 60)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke_2", 60, "### Contact with email and phone: %@ invalid : %{error}, Removing identity: %@ \n", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48));
  v10 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v20 = 0;
  objc_msgSend(v9, "removeIdentity:error:", v10, &v20);
  v11 = v20;
  if (v11)
  {
    if (dword_100130F48 <= 60
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 60)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke_2", 60, "### Removing identity: %@ failed with: %{error}\n", *(_QWORD *)(a1 + 48), v11);
    }
  }
  else if (dword_100130F48 <= 30
         && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon isContactValidForIdentity:completionBlock:]_block_invoke_2", 30, "### Removed identity: %@ \n", *(_QWORD *)(a1 + 48), v19);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_34:
}

id sub_1000639A8(uint64_t a1)
{
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon regenerateTemporarySelfIdentity]_block_invoke", 30, "Regenerating self temporary identity");
  return objc_msgSend(*(id *)(a1 + 32), "_loadTemporarySelfIdentity");
}

void sub_100063AD4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (*v17)(void);
  id v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (!v20 || v5)
  {
    if (!v5)
    {
      v18 = RPErrorF(4294960569, (uint64_t)"Paired device identity not found", v6, v7, v8, v9, v10, v11, v19);
      v5 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    if (dword_100130F48 <= 90
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon getPairedIdentityWithCompletion:]_block_invoke", 90, "### Get pairing identifier for paired device failed: %{error}\n", v5);
    }
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = objc_alloc_init((Class)RPIdentity);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    objc_msgSend(v5, "setIdentifier:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "publicKey"));
    objc_msgSend(v5, "setEdPKData:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "secretKey"));
    objc_msgSend(v5, "setEdSKData:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "altIRK"));
    objc_msgSend(v5, "setDeviceIRKData:", v16);

    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v17();

}

void sub_100064CAC(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v7;

    if (!v11)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 32), "updateSessionPairedIdentity:", *(_QWORD *)(a1 + 40));
  }
  else
  {
LABEL_9:

LABEL_12:
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    if (!v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 120);
      *(_QWORD *)(v14 + 120) = v13;

      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    }
    objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 40));
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon addSessionPairedIdentity:]_block_invoke", 30, "Added session paired identity: %@\n", *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(*(id *)(a1 + 32), "_postIdentitiesChangedNotification");
    v11 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v11, "postDaemonInfoChanges:", 0x2000);
  }

}

void sub_100064F3C(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v9 & 1) != 0)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v7;

    if (!v10)
      return;
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon removeSessionPairedIdentityWithIdentifier:]_block_invoke", 30, "Removed session paired identity: %@\n", v10);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObject:", v10);
    objc_msgSend(*(id *)(a1 + 32), "_postIdentitiesChangedNotification");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v11, "postDaemonInfoChanges:", 0x2000);

  }
  else
  {
LABEL_9:
    v10 = v2;
  }

}

void sub_1000651F4(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v18;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v4)
        objc_enumerationMutation(v2);
      v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if ((v9 & 1) != 0)
        break;
      if (v3 == (id)++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_28;
      }
    }
    v3 = v6;

    if (!v3)
      goto LABEL_29;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));

      if (!v13)
      {
        v12 = 0;
LABEL_16:
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
        if (v14)
        {

        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "model"));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "model"));
            objc_msgSend(v3, "setModel:", v16);

LABEL_22:
            if (dword_100130F48 <= 30
              && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
            {
              LogPrintF(&dword_100130F48, "-[RPIdentityDaemon updateSessionPairedIdentity:]_block_invoke", 30, "Updated session paired identity: %@\n", v3);
            }
            objc_msgSend(*(id *)(a1 + 32), "_postIdentitiesChangedNotification");
            v2 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
            objc_msgSend(v2, "postDaemonInfoChanges:", 0x2000);
            goto LABEL_28;
          }
        }
        if (!v12)
          goto LABEL_29;
        goto LABEL_22;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
      objc_msgSend(v3, "setName:", v11);
      v12 = 1;
    }

    goto LABEL_16;
  }
LABEL_28:

LABEL_29:
}

id sub_1000654F8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));

  if (!v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    objc_msgSend(*(id *)(a1 + 32), "setIdentifier:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "idsDeviceID"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    objc_msgSend(*(id *)(a1 + 32), "setIdsDeviceID:", v6);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "count"))
  {
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "objectAtIndexedSubscript:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      if (objc_msgSend(v9, "isEqual:", v10))
        break;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "edPKData"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "edPKData"));
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_16;

      if (++v7 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "count"))
        goto LABEL_10;
    }

LABEL_16:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setObject:atIndexedSubscript:", *(_QWORD *)(a1 + 32), v7);
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon addOrUpdateAdHocPairedIdentity:]_block_invoke", 30, "Updating ad-hoc paired identity: %@\n", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
LABEL_10:
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 128);
    if (!v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(v16 + 128);
      *(_QWORD *)(v16 + 128) = v15;

      v14 = *(void **)(*(_QWORD *)(a1 + 40) + 128);
    }
    objc_msgSend(v14, "addObject:", *(_QWORD *)(a1 + 32));
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon addOrUpdateAdHocPairedIdentity:]_block_invoke", 30, "Added ad-hoc paired identity: %@\n", *(_QWORD *)(a1 + 32));
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  objc_msgSend(v18, "postDaemonInfoChanges:", 0x4000);

  return objc_msgSend(*(id *)(a1 + 40), "_postIdentitiesChangedNotification");
}

_QWORD *sub_100065A00(_QWORD *result)
{
  _QWORD *v1;

  if (*(_DWORD *)(result[4] + 8) != -1)
  {
    v1 = result;
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _ensureStarted]_block_invoke", 30, "Home view changed\n");
    }
    return objc_msgSend((id)v1[4], "_updateSameAccountIdentities");
  }
  return result;
}

_QWORD *sub_100065A8C(_QWORD *result)
{
  _QWORD *v1;

  if (*(_DWORD *)(result[4] + 12) != -1)
  {
    v1 = result;
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _ensureStarted]_block_invoke_2", 30, "Home view ready\n");
    }
    objc_msgSend((id)v1[4], "_loadSelfIdentity:", 0);
    return objc_msgSend((id)v1[4], "_updateSameAccountIdentities");
  }
  return result;
}

_QWORD *sub_100065B24(_QWORD *result)
{
  _QWORD *v1;

  if (*(_DWORD *)(result[4] + 48) != -1)
  {
    v1 = result;
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _ensureStarted]_block_invoke_3", 30, "Pairing devices changed\n");
    }
    return objc_msgSend((id)v1[4], "_updatePairedDeviceIdentities");
  }
  return result;
}

void sub_100065DF0(id a1)
{
  if (dword_100130F48 <= 30 && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _postIdentitiesChangedNotification]_block_invoke", 30, "Posting notification: %s\n", "com.apple.rapport.identitiesChanged");
  notify_post("com.apple.rapport.identitiesChanged");
}

void sub_10006600C(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = v2;
  if (dword_100130F48 <= 30
    && ((v5 = v2, dword_100130F48 != -1) || (v4 = _LogCategory_Initialize(&dword_100130F48, 30), v3 = v5, v4)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _triggerKeychainRefetch]_block_invoke", 30, "Keychain refetch end: %{error}\n", v3);

  }
  else
  {

  }
}

void sub_10006615C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v5)
  {
    v7 = objc_alloc_init((Class)NSMutableArray);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "altIRK"));
            if (v16)
            {
              v17 = objc_msgSend(objc_alloc((Class)RPIdentity), "initWithPairedPeer:type:", v13, 8);
              if (v17)
                objc_msgSend(v7, "addObject:", v17);

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), v7);
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updatePairedDeviceIdentities]_block_invoke", 30, "Paired peers updated: %d peer(s)\n", objc_msgSend(v7, "count"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v18, "postDaemonInfoChanges:", 256);

    objc_msgSend(*(id *)(a1 + 40), "_postIdentitiesChangedNotification");
    v5 = v19;
  }
  else if (dword_100130F48 <= 90
         && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 90)))
  {
    LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _updatePairedDeviceIdentities]_block_invoke", 90, "### Get paired peers failed: %{error}\n", v6);
  }

}

_QWORD *sub_100067DD8(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v1 = (void *)result[4];
  if (v1 == *(void **)(result[5] + 152))
  {
    v2 = result;
    if (v1)
    {
      v3 = v1;
      dispatch_source_cancel(v3);
      v4 = v2[5];
      v5 = *(void **)(v4 + 152);
      *(_QWORD *)(v4 + 152) = 0;

    }
    if (dword_100130F48 <= 30
      && (dword_100130F48 != -1 || _LogCategory_Initialize(&dword_100130F48, 30)))
    {
      LogPrintF(&dword_100130F48, "-[RPIdentityDaemon _loadTemporarySelfIdentity]_block_invoke", 30, "Temporary self identity timer fired");
    }
    return objc_msgSend((id)v2[5], "_loadTemporarySelfIdentity");
  }
  return result;
}

Class sub_1000691A0()
{
  Class result;

  if (qword_100132100 != -1)
    dispatch_once(&qword_100132100, &stru_1001130F8);
  result = objc_getClass("CBPeripheralManager");
  qword_1001320F8 = (uint64_t)result;
  off_100130FB8[0] = (uint64_t (*)())sub_1000691FC;
  return result;
}

id sub_1000691FC()
{
  return (id)qword_1001320F8;
}

void sub_100069208(id a1)
{
  qword_100132108 = (uint64_t)dlopen("/System/Library/Frameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

id sub_100069230()
{
  id *v0;

  if (qword_100132100 != -1)
    dispatch_once(&qword_100132100, &stru_1001130F8);
  v0 = (id *)dlsym((void *)qword_100132108, "CBManagerNeedsRestrictedStateOperation");
  if (v0)
    objc_storeStrong((id *)&qword_1001320F0, *v0);
  off_100130FC0[0] = (uint64_t (*)())sub_1000692A8;
  return (id)qword_1001320F0;
}

id sub_1000692A8()
{
  return (id)qword_1001320F0;
}

Class sub_1000692B4()
{
  Class result;

  if (qword_100132118 != -1)
    dispatch_once(&qword_100132118, &stru_100113118);
  result = objc_getClass("SFContactInfo");
  qword_100132110 = (uint64_t)result;
  off_100130FC8[0] = (uint64_t (*)())sub_100069310;
  return result;
}

id sub_100069310()
{
  return (id)qword_100132110;
}

void sub_10006931C(id a1)
{
  qword_100132120 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_100069344()
{
  Class result;

  if (qword_100132118 != -1)
    dispatch_once(&qword_100132118, &stru_100113118);
  result = objc_getClass("SFClient");
  qword_100132128 = (uint64_t)result;
  off_100130FD0[0] = (uint64_t (*)())sub_1000693A0;
  return result;
}

id sub_1000693A0()
{
  return (id)qword_100132128;
}

BOOL sub_1000693AC(uint64_t a1)
{
  return a1 == 1;
}

NSMutableArray *sub_100069F74(void *a1)
{
  id v1;
  NSMutableArray *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v1 = a1;
  v2 = objc_opt_new(NSMutableArray);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPTransportServiceMetadata metadataWithDictionary:](RPTransportServiceMetadata, "metadataWithDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), (_QWORD)v10));
        if (v8)
          -[NSMutableArray addObject:](v2, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

Class sub_10006A414()
{
  Class result;

  if (qword_100132138 != -1)
    dispatch_once(&qword_100132138, &stru_100113290);
  result = objc_getClass("NFConnectionHandoverSelect");
  qword_100132130 = (uint64_t)result;
  off_100130FD8[0] = (uint64_t (*)())sub_10006A470;
  return result;
}

id sub_10006A470()
{
  return (id)qword_100132130;
}

void sub_10006A47C(id a1)
{
  qword_100132140 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
}

Class sub_10006A4A4()
{
  Class result;

  if (qword_100132138 != -1)
    dispatch_once(&qword_100132138, &stru_100113290);
  result = objc_getClass("NFConnectionHandoverRequest");
  qword_100132148 = (uint64_t)result;
  off_100130FE0 = (uint64_t (*)())sub_10006A500;
  return result;
}

id sub_10006A500()
{
  return (id)qword_100132148;
}

id sub_10006A76C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleCommand:responseHandler:", a2);
}

_QWORD *sub_10006AB98(_QWORD *result, int a2)
{
  _QWORD *v3;
  const char *v4;

  if (*(_BYTE *)(result[4] + 48))
  {
    v3 = result;
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      v4 = "yes";
      if (!a2)
        v4 = "no";
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaControlEnsureStarted]_block_invoke", 30, "Volume control available initial: MR %s\n", v4);
    }
    *(_DWORD *)(v3[4] + 44) = a2;
    return _objc_msgSend((id)v3[4], "_mediaRemoteVolumeControlUpdate");
  }
  return result;
}

_QWORD *sub_10006AEEC(_QWORD *result)
{
  _QWORD *v1;

  if (*(_BYTE *)(result[4] + 42))
  {
    v1 = result;
    if (dword_100130FE8 <= 30
      && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    {
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaRemoteSupportedCommandsChanged]_block_invoke", 30, "MediaRemote supported commands changed\n");
    }
    return objc_msgSend((id)v1[4], "_mediaRemoteSupportedCommandsGet");
  }
  return result;
}

void sub_10006B034(uint64_t a1, const __CFArray *a2)
{
  CFIndex Count;
  int v5;
  int v6;
  CFIndex v7;
  uint64_t v8;
  const void *ValueAtIndex;
  int Command;
  uint64_t v11;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 42))
    return;
  if (a2)
    Count = CFArrayGetCount(a2);
  else
    Count = 0;
  v5 = dword_100130FE8;
  if (dword_100130FE8 > 9)
    goto LABEL_42;
  if (dword_100130FE8 != -1)
  {
LABEL_8:
    if (v5 != -1 || _LogCategory_Initialize(&dword_100130FE8, 9))
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaRemoteSupportedCommandsGet]_block_invoke", 9, "MediaRemote supported commands got: %@\n", a2);
    goto LABEL_19;
  }
  v6 = _LogCategory_Initialize(&dword_100130FE8, 9);
  v5 = dword_100130FE8;
  if (!v6)
  {
LABEL_42:
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
      LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaRemoteSupportedCommandsGet]_block_invoke", 30, "MediaRemote supported commands got: %d items\n");
    goto LABEL_19;
  }
  if (dword_100130FE8 <= 9)
    goto LABEL_8;
LABEL_19:
  if (Count < 1)
  {
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, v7);
      if (MRMediaRemoteCommandInfoGetEnabled())
      {
        Command = MRMediaRemoteCommandInfoGetCommand(ValueAtIndex);
        switch(Command)
        {
          case 0:
            v8 |= 1uLL;
            break;
          case 1:
            v8 |= 2uLL;
            break;
          case 2:
          case 3:
          case 6:
          case 7:
          case 9:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
            break;
          case 4:
            v8 |= 4uLL;
            break;
          case 5:
            v8 |= 8uLL;
            break;
          case 8:
            v8 |= 0x10uLL;
            break;
          case 10:
            v8 |= 0x20uLL;
            break;
          case 17:
            v8 |= 0x200uLL;
            break;
          case 18:
            v8 |= 0x400uLL;
            break;
          default:
            v11 = v8 | 0x80;
            if (Command != 26)
              v11 = v8;
            if (Command == 25)
              v8 |= 0x40uLL;
            else
              v8 = v11;
            break;
        }
      }
      ++v7;
    }
    while (Count != v7);
  }
  _objc_msgSend(*(id *)(a1 + 32), "_mediaControlFlagsUpdate:mask:", v8, 1791);
}

void sub_10006B2E0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int Int64Ranged;
  const char *v5;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v2 = kMRAVEndpointVolumeControlCapabilitiesUserInfoKey;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userInfo"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v3, v2, 0, 0xFFFFFFFFLL, 0);

    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) != Int64Ranged)
    {
      if (dword_100130FE8 <= 30
        && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
      {
        v5 = "yes";
        if (!Int64Ranged)
          v5 = "no";
        LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _mediaRemoteVolumeControlChanged:]_block_invoke", 30, "Volume control available changed MR: %s\n", v5);
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = Int64Ranged;
      _objc_msgSend(*(id *)(a1 + 32), "_mediaRemoteVolumeControlUpdate");
    }
  }
}

uint64_t sub_10006BABC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  if (dword_100130FE8 <= 30 && (dword_100130FE8 != -1 || _LogCategory_Initialize(&dword_100130FE8, 30)))
    LogPrintF(&dword_100130FE8, "-[RPMediaControlDaemon _handleMovementCommand:endCommand:]_block_invoke", 30, "Auto-ending movement on timeout\n");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
  result = MRMediaRemoteSendCommand(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 20), 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 3;
  return result;
}

uint64_t sub_10006C190(uint64_t a1)
{
  if (qword_100132150 != -1)
    dispatch_once(&qword_100132150, &stru_100113300);
  off_100131060[0] = (uint64_t (*)())dlsym((void *)qword_100132158, "MACaptionAppearanceGetDisplayType");
  return ((uint64_t (*)(uint64_t))off_100131060[0])(a1);
}

void sub_10006C1F8(id a1)
{
  qword_100132158 = (uint64_t)dlopen("/System/Library/Frameworks/MediaAccessibility.framework/MediaAccessibility", 2);
}

uint64_t sub_10006C220(uint64_t a1, uint64_t a2)
{
  if (qword_100132150 != -1)
    dispatch_once(&qword_100132150, &stru_100113300);
  off_100131068 = (uint64_t (*)())dlsym((void *)qword_100132158, "MACaptionAppearanceSetDisplayType");
  return ((uint64_t (*)(uint64_t, uint64_t))off_100131068)(a1, a2);
}

Class sub_10006C290()
{
  Class result;

  if (qword_100132168 != -1)
    dispatch_once(&qword_100132168, &stru_100113320);
  result = objc_getClass("AVSystemController");
  qword_100132160 = (uint64_t)result;
  off_100131058[0] = (uint64_t (*)())sub_10006C2EC;
  return result;
}

id sub_10006C2EC()
{
  return (id)qword_100132160;
}

void sub_10006C2F8(id a1)
{
  qword_100132170 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 2);
}

uint64_t sub_10006C684(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10006C690(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 2) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t sub_10006C6A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10006C6B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10006C6BC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v6 = v3;
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:]_block_invoke_5", 90, "Error activating RPNearbyInvitationDiscovery: %@", v6);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    v3 = v6;
  }

}

void sub_10006CA40(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;

  v6 = a2;
  v7 = a3;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
  {
    v8 = objc_retainBlock(v7);
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]_block_invoke", 30, "Server: Session start: %@, completion: %@\n", v6, v8);

  }
  v9 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v9 + 32);
  v10 = (id *)(v9 + 32);
  if (v11)
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]_block_invoke", 90, "Server: Received session start callback while session already active.\n");
    }
  }
  else
  {
    objc_storeStrong(v10, a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dispatchQueue"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDispatchQueue:", v13);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006CC6C;
    v18[3] = &unk_100113470;
    v19 = v6;
    v14 = *(id *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = v14;
    objc_msgSend(*(id *)(v20 + 32), "setInvalidationHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidationHandler"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", v15);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006CD10;
    v16[3] = &unk_100111860;
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v17 + 32), "setErrorHandler:", v16);
    objc_msgSend(*(id *)(a1 + 32), "handleConnectionRequest:agentClient:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "handleConnectionData:", 1);

  }
}

void sub_10006CC6C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]_block_invoke_2", 30, "Server: Lost connectivity to '%@'", v2);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

}

void sub_10006CD10(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_100131070 <= 90 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]_block_invoke_3", 90, "Server: Received error on NearbyInvitation session: '%@'. Invalidating session.", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");

}

void sub_10006CDA4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]_block_invoke_4", 30, "Server: Session end: %@, error: %@\n", v9, v5);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v6)
  {
    objc_msgSend(v6, "invalidate");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

  }
}

void sub_10006CE5C(id a1)
{
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]_block_invoke_5", 30, "Server invalidated.\n");
}

void sub_10006CEBC(uint64_t a1)
{
  id v2;

  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "serviceType"));

  }
}

void sub_10006CF54(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]_block_invoke_7", 90, "Server activation failed with error: %@\n", v9);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

    v3 = v9;
  }
  if (dword_100131070 <= 30)
  {
    if (dword_100131070 != -1 || (v7 = _LogCategory_Initialize(&dword_100131070, 30), v3 = v9, v7))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "serviceType"));

      v3 = v9;
    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
    v3 = v9;
  }

}

void sub_10006D328(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  if (v3)
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:]_block_invoke", 90, "Client: Failed to connect to device '%@'. Error - %@", *(_QWORD *)(a1 + 32), v3);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006D518;
    v15[3] = &unk_100113470;
    v16 = *(id *)(a1 + 32);
    v4 = *(id *)(a1 + 80);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = v4;
    objc_msgSend(*(id *)(v17 + 32), "setInvalidationHandler:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "invalidationHandler"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setInterruptionHandler:", v5);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006D5AC;
    v13[3] = &unk_100111860;
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(v14 + 32), "setErrorHandler:", v13);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006D640;
    v10[3] = &unk_100113530;
    v9 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 72);
    objc_msgSend(v9, "sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:", CFSTR("com.apple.oneapi.nearbyinvitation.connection"), 0, 0, v6, v7, v8, v10);

  }
}

void sub_10006D518(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:]_block_invoke_2", 30, "Client: Lost connectivity to '%@'", a1[4]);
  (*(void (**)(void))(a1[6] + 16))();
  v2 = a1[5];
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

void sub_10006D5AC(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_100131070 <= 90 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:]_block_invoke_3", 90, "Client: Received error on NearbyInvitation session: '%@'. Invalidating session.", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");

}

void sub_10006D640(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(void);
  id v6;

  v6 = a3;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:]_block_invoke_4", 30, "Client: Got connection request response %s from device='%@'", +[RPNWPeer responseCodeToString:](RPNWPeer, "responseCodeToString:", a2), *(_QWORD *)(a1 + 32));
  if ((_DWORD)a2 == 2)
  {
    if (dword_100131070 <= 30
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:]_block_invoke_4", 30, "Client: NearbyInvitation connected to device '%@'", *(_QWORD *)(a1 + 32));
    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v5();

}

BOOL sub_10006D910(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
  {
    if (*(_BYTE *)(a1 + 32))
      v13 = "SERVER";
    else
      v13 = "CLIENT";
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer handleConnectionData:]_block_invoke", 30, "RPNW-DATA %s Received data from peer", v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInvitationConnection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "framer"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nearbyInvitationConnection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "framer"));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "listen_framer"));
  }
  v18 = +[RPNWFramer writeDataOnFramer:data:](RPNWFramer, "writeDataOnFramer:data:", v17, v9);

  return v18;
}

void sub_10006DA68(id a1, RPNWAgentClient *a2, NSUUID *a3, int a4)
{
  uint64_t v4;
  NSUUID *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  RPNWAgentClient *v14;

  v4 = *(_QWORD *)&a4;
  v14 = a2;
  v6 = a3;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer handleConnectionData:]_block_invoke_2", 30, "Received connection status %s for connection %@ with AgentClient %@", +[RPNWNearbyInvitationPeer statusCodeToString:](RPNWNearbyInvitationPeer, "statusCodeToString:", v4), v6, v14);
  v7 = objc_claimAutoreleasedReturnValue(-[RPNWAgentClient nearbyInvitationConnection](v14, "nearbyInvitationConnection"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient nearbyInvitationConnection](v14, "nearbyInvitationConnection")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "framer")),
        v10,
        v9,
        v8,
        v10))
  {
    if ((_DWORD)v4 == 1)
    {
      v11 = 53;
      goto LABEL_14;
    }
    if ((_DWORD)v4 == 4)
    {
      v11 = 57;
LABEL_14:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient nearbyInvitationConnection](v14, "nearbyInvitationConnection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "framer"));
      +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v13, v11);

    }
  }
  else if (dword_100131070 <= 90
         && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
  {
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer handleConnectionData:]_block_invoke_2", 90, "Agent client has no nearbyInvitationConnection framer");
  }

}

uint64_t sub_10006DCB8(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;

  v10 = a2;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v11 && v12 && v13)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "findNearbyInvitationListenerAndCreateConnection:applicationService:listenerID:connectionID:agentClient:", *(_QWORD *)(a1 + 40), v11, v12, v13, *(_QWORD *)(a1 + 48)))v15 = 2;
    else
      v15 = 0;
  }
  else
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer handleConnectionRequest:agentClient:]_block_invoke", 90, "Not a valid CONNECT request\n");
    }
    v15 = 0;
  }

  return v15;
}

void sub_10006E1E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("request")));
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
  {
    v34 = objc_msgSend(v10, "length");
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "RX DATA (%d bytes) from peer, requestID=%@\n");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status")));
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "intValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("applicationService")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderID")));
  if (v20)
  {
    v36 = v9;
    v37 = v8;
    v38 = v10;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderIDS")));
    if (dword_100131070 <= 30
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "appSvc=%@, SenderID=%@, SenderIDS='%@'\n", v13, v20, v21);
    }
    v35 = (void *)v21;
    v22 = objc_alloc((Class)NSUUID);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("connectionID")));
    v24 = objc_msgSend(v22, "initWithUUIDString:", v23);

    v25 = objc_alloc((Class)NSUUID);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("listenerID")));
    v27 = objc_msgSend(v25, "initWithUUIDString:", v26);

    v28 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v29 = 0;
    v30 = objc_alloc_init((Class)NSMutableDictionary);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v28));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("response"));
    if (v29)
    {
      if (dword_100131070 <= 30
        && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
      {
        LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "Receive handler response code=%@, listenerID=%@\n", v31, v29);
      }
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("listenerID"));
      v8 = v37;
    }
    else
    {
      v8 = v37;
      if (dword_100131070 <= 30
        && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
      {
        LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "Receive handler response code=%@\n", v31);
      }
    }
    (*((void (**)(id, id, _QWORD, _QWORD))v36 + 2))(v36, v30, 0, 0);

    v9 = v36;
    v10 = v38;
  }
  else
  {
    if (dword_100131070 <= 90
      && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]_block_invoke", 90, "No sender ID, discarding\n");
    }
    v32 = RPErrorF(4294960591, (uint64_t)"Missing sender ID", v14, v15, v16, v17, v18, v19, (uint64_t)v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v33);

  }
}

void sub_10006EA30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (dword_100131070 > 90 || dword_100131070 == -1 && !_LogCategory_Initialize(&dword_100131070, 90))
      goto LABEL_14;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
LABEL_5:

LABEL_14:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  if (!v16)
  {
    if (dword_100131070 > 90 || dword_100131070 == -1 && !_LogCategory_Initialize(&dword_100131070, 90))
      goto LABEL_14;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("response")));
  v12 = objc_msgSend(v11, "intValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("listenerID")));
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:]_block_invoke", 30, "RX RESP from '%@': requestID=%@ appSvc=%@ response=%s bytes listener=%@ error=%@\n", v15, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), +[RPNWNearbyInvitationPeer responseCodeToString:](RPNWNearbyInvitationPeer, "responseCodeToString:", v12), v13, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_17:
}

uint64_t sub_10006ED44(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v12 && v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWAgentClient findAgentClientFromConnectionID:](RPNWAgentClient, "findAgentClientFromConnectionID:", v14));
    if (v16)
    {
      if (v11)
      {
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
          v17 = 2;
        else
          v17 = 0;
        goto LABEL_24;
      }
      if (a3)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v17 = 2;
LABEL_24:

        goto LABEL_25;
      }
      if (dword_100131070 <= 90
        && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
      {
        LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveDataForConnection:statusHandler:]_block_invoke", 90, "Not a valid data request, returning\n");
      }
    }
    else if (dword_100131070 <= 90
           && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    {
      LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveDataForConnection:statusHandler:]_block_invoke", 90, "Failed to find agent client for connection\n");
    }
    v17 = 0;
    goto LABEL_24;
  }
  if (dword_100131070 <= 90 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 90)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer receiveDataForConnection:statusHandler:]_block_invoke", 90, "Not a valid data request, returning\n");
  v17 = 0;
LABEL_25:

  return v17;
}

uint64_t sub_10006F060(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10006F1A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  if (dword_100131070 <= 30 && (dword_100131070 != -1 || _LogCategory_Initialize(&dword_100131070, 30)))
    LogPrintF(&dword_100131070, "-[RPNWNearbyInvitationPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:]_block_invoke", 30, "Status update got response %s", +[RPNWNearbyInvitationPeer responseCodeToString:](RPNWNearbyInvitationPeer, "responseCodeToString:", a2));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);

}

void sub_10006F324(id a1)
{
  uint64_t Int64;
  BOOL v2;
  RPMetrics *v3;
  void *v4;
  int v5;

  v5 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("metricsEnabled"), &v5);
  if (v5)
    v2 = 0;
  else
    v2 = Int64 == 0;
  if (!v2)
  {
    v3 = objc_alloc_init(RPMetrics);
    v4 = (void *)qword_100132178;
    qword_100132178 = (uint64_t)v3;

    objc_msgSend((id)qword_100132178, "activate");
  }
}

id sub_10006F460(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_activate");
}

void sub_10006F4D8(id a1)
{
  if (dword_1001310E0 <= 30 && (dword_1001310E0 != -1 || _LogCategory_Initialize(&dword_1001310E0, 30)))
    LogPrintF(&dword_1001310E0, "-[RPMetrics invalidate]_block_invoke", 30, "Invalidate\n");
}

id sub_10006F690(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_logReceivedMessageType:identifier:options:appID:timeBegin:timeEnd:bytesAdded:messagesAdded:", *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void sub_10006F9AC(id a1)
{
  qword_100132190 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2);
}

uint64_t sub_10006F9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_100132188 != -1)
    dispatch_once(&qword_100132188, &stru_100113750);
  off_100131150 = (uint64_t (*)())dlsym((void *)qword_100132190, "PLLogRegisteredEvent");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))off_100131150)(a1, a2, a3, a4);
}

void sub_10006FA9C(id a1)
{
  RPWiFiP2PTransaction *v1;
  void *v2;

  v1 = objc_alloc_init(RPWiFiP2PTransaction);
  v2 = (void *)qword_1001321A0;
  qword_1001321A0 = (uint64_t)v1;

}

void sub_10006FBEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_10006FC18(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

  if (dword_100131158 <= 30 && (dword_100131158 != -1 || _LogCategory_Initialize(&dword_100131158, 30)))
    LogPrintF(&dword_100131158, "-[RPWiFiP2PTransaction activateForClient:]_block_invoke", 30, "WiFi P2P transaction enabled for client '%@', current clients %@ \n", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void sub_10006FCF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_10006FD04(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
  {
    v2 = result;
    if (dword_100131158 <= 90
      && (dword_100131158 != -1 || _LogCategory_Initialize(&dword_100131158, 90)))
    {
      LogPrintF(&dword_100131158, "-[RPWiFiP2PTransaction activateForClient:]_block_invoke_2", 90, "### Error while enabling WiFi P2P transaction: %ld\n", a2);
    }
    return objc_msgSend(*(id *)(v2[4] + 8), "removeObject:", v2[5]);
  }
  return result;
}

void sub_10006FF98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class sub_10006FFC0()
{
  Class result;

  if (qword_1001321B0 != -1)
    dispatch_once(&qword_1001321B0, &stru_1001137B8);
  result = objc_getClass("WiFiP2PSPITransactionRequestor");
  qword_1001321A8 = (uint64_t)result;
  off_1001311C8 = (uint64_t (*)())sub_10007001C;
  return result;
}

id sub_10007001C()
{
  return (id)qword_1001321A8;
}

void sub_100070028(id a1)
{
  qword_1001321B8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/WiFiPeerToPeer.framework/WiFiPeerToPeer", 2);
}

id sub_100071104(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_deviceFound:", a2);
}

id sub_100071110(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_deviceLost:", a2);
}

void sub_10007111C(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    if (dword_100131240 <= 90)
    {
      if (dword_100131240 != -1 || (v4 = _LogCategory_Initialize(&dword_100131240, 90), v3 = v5, v4))
        LogPrintF(&dword_100131240, "-[RPNearbyInfoV2Discovery activateWithCompletion:]_block_invoke_3", 90, " ### BLE NearbyInfoV2 discovery failed to start: %@\n", v3);
    }
  }
  else if (dword_100131240 <= 30
         && (dword_100131240 != -1 || _LogCategory_Initialize(&dword_100131240, 30)))
  {
    LogPrintF(&dword_100131240, "-[RPNearbyInfoV2Discovery activateWithCompletion:]_block_invoke_3", 30, "BLE NearbyInfoV2 discovery started\n");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

Class sub_10007172C()
{
  Class result;

  if (qword_1001321D0 != -1)
    dispatch_once(&qword_1001321D0, &stru_1001137D8);
  result = objc_getClass("CBDiscovery");
  qword_1001321C8 = (uint64_t)result;
  off_1001312B0 = (uint64_t (*)())sub_100071788;
  return result;
}

id sub_100071788()
{
  return (id)qword_1001321C8;
}

void sub_100071794(id a1)
{
  qword_1001321D8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

id sub_100072374(uint64_t a1)
{
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startPollingCoolDownTimer]_block_invoke", 30, "timer fired: polling cool down completed for %fs\n", COERCE_DOUBLE(10));
  objc_msgSend(*(id *)(a1 + 32), "_stopPollingCoolDownTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolling");
}

void sub_1000725A8(uint64_t a1)
{
  void *v2;
  id v3;

  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startConnectToReceiverTimer]_block_invoke", 30, "timer fired: connect to receiver timed out");
  objc_msgSend(*(id *)(a1 + 32), "_stopConnectToReceiverTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransaction"));
  v3 = objc_msgSend(v2, "role");

  if (v3 != (id)1)
    objc_msgSend(*(id *)(a1 + 32), "_stopInitiator");
}

id sub_1000727A0(uint64_t a1)
{
  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startInitiatorLimitTimer]_block_invoke", 30, "timer fired: initiator reached out maximum time limit of:%f", 60.0);
  return objc_msgSend(*(id *)(a1 + 32), "_stopInitiator");
}

void sub_10007291C(uint64_t a1)
{
  void *v2;

  if (dword_1001312B8 <= 30 && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _startBecomeInitiatorTimer]_block_invoke", 30, "timer fired: becoming initiator after:%.2fs", 0.7);
  objc_msgSend(*(id *)(a1 + 32), "_stopBecomeInitiatorTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransaction"));

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "_startInitiator");
}

void sub_100073D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];

  if (objc_msgSend(*(id *)(a1 + 32), "_didReceiveAuthenticationResponseWithResult:error:", a2, a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransaction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteAuthenticationMessage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payload"));
    v7 = objc_msgSend(v6, "type");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transactionController:requestMessageForType:", *(_QWORD *)(a1 + 32), 2));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransaction"));
        objc_msgSend(v10, "setLocalValidationMessage:", v9);

        if (dword_1001312B8 <= 30
          && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
        {
          LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidConnectToReceiver:]_block_invoke", 30, "send validation request to receiver:%@\n", v9);
        }
        v11 = *(void **)(a1 + 40);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionHandoverRequest"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100074020;
        v20[3] = &unk_100113800;
        v20[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v11, "sendHandoverRequest:responseHandler:", v12, v20);

      }
      else
      {
        if (dword_1001312B8 <= 90
          && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
        {
          LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidConnectToReceiver:]_block_invoke", 90, "error: validation request message is nil.");
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RPNFCTransactionControllerErrorDomain"), 2, 0));
        objc_msgSend(*(id *)(a1 + 32), "_finishCurrentTransactionWithError:", v18);

      }
    }
    else
    {
      if (dword_1001312B8 <= 30
        && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
      {
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controllerDidConnectToReceiver:]_block_invoke", 30, "payload type is unknown. Assuming authentication exchange only and skipping validation payload.");
      }
      v13 = *(void **)(a1 + 32);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentTransaction"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remoteAuthenticationMessage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "applicationLabel"));
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_createTapEventForApplicationLabel:", v16));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransaction"));
      objc_msgSend(v17, "setTapEvent:", v19);

      objc_msgSend(*(id *)(a1 + 32), "_finishCurrentTransactionWithError:", 0);
    }
  }
}

id sub_100074020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_didReceiveValidationResponseWithResult:error:", a2, a3);
}

void sub_10007493C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    if (dword_1001312B8 <= 90)
    {
      v4 = v3;
      if (dword_1001312B8 != -1 || (v7 = _LogCategory_Initialize(&dword_1001312B8, 90), v4 = v8, v7))
        LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController controller:didReceiveRequest:]_block_invoke", 90, "failed to send handover select to initiator:%@", v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "_finishCurrentTransactionWithError:", v8);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v5, "_didReceiveAuthenticationMessage:", v6);
    else
      objc_msgSend(v5, "_didReceiveValidationMessage:", v6);
  }

}

void sub_100074ED0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    if (dword_1001312B8 <= 90
      && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 90)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URL"));
      LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _fileTTRForError:]_block_invoke", 90, "TTR: failed opening schemeURL:%@ error:%@", v6, v5);
LABEL_8:

    }
  }
  else if (dword_1001312B8 <= 30
         && (dword_1001312B8 != -1 || _LogCategory_Initialize(&dword_1001312B8, 30)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URL"));
    LogPrintF(&dword_1001312B8, "-[RPNFCTransactionController _fileTTRForError:]_block_invoke", 30, "TTR: succeeded opening schemeURL:%@ result:%@", v6, v7);
    goto LABEL_8;
  }

}

Class sub_100075198()
{
  Class result;

  if (qword_1001321E8 != -1)
    dispatch_once(&qword_1001321E8, &stru_100113870);
  result = objc_getClass("NFConnectionHandoverInitiator");
  qword_1001321E0 = (uint64_t)result;
  off_100131328 = (uint64_t (*)())sub_1000751F4;
  return result;
}

id sub_1000751F4()
{
  return (id)qword_1001321E0;
}

void sub_100075200(id a1)
{
  qword_1001321F0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
}

Class sub_100075228()
{
  Class result;

  if (qword_1001321E8 != -1)
    dispatch_once(&qword_1001321E8, &stru_100113870);
  result = objc_getClass("NFConnectionHandoverReceiver");
  qword_1001321F8 = (uint64_t)result;
  off_100131330 = (uint64_t (*)())sub_100075284;
  return result;
}

id sub_100075284()
{
  return (id)qword_1001321F8;
}

Class sub_100075290()
{
  Class result;

  if (qword_100132208 != -1)
    dispatch_once(&qword_100132208, &stru_100113890);
  result = objc_getClass("LSApplicationWorkspace");
  qword_100132200 = (uint64_t)result;
  off_100131338 = (uint64_t (*)())sub_1000752EC;
  return result;
}

id sub_1000752EC()
{
  return (id)qword_100132200;
}

void sub_1000752F8(id a1)
{
  qword_100132210 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

void sub_1000753FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void ***v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000754E0;
  v16 = &unk_100111E50;
  v17 = 0;
  v18 = *(id *)(a1 + 40);
  v8 = objc_retainBlock(&v13);
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[2] && v9[4])
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_createAndRunSession", v13, v14, v15, v16, v17));
  }
  else
  {
    v11 = RPErrorF(4294960591, (uint64_t)"Configuration parameters are not specified", v2, v3, v4, v5, v6, v7, (uint64_t)v13);
    v10 = objc_claimAutoreleasedReturnValue(v11);
  }
  v12 = (void *)v10;
  ((void (*)(void ***))v8[2])(v8);

}

void sub_1000754C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000754E0(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (dword_100131400 <= 90)
    {
      if (dword_100131400 != -1
        || (v3 = _LogCategory_Initialize(&dword_100131400, 90), v2 = *(_QWORD *)(a1 + 32), v3))
      {
        LogPrintF(&dword_100131400, "-[RPNIProximityEstimator activateWithCompletion:]_block_invoke_2", 90, "### Activate RPNIProximityEstimator failed: %{error}\n", v2);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000755C8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  if (v2)
  {
    *(_QWORD *)(v1 + 56) = 0;
    v6 = v2;

    objc_msgSend(v6, "invalidate");
    objc_msgSend(v6, "setDelegate:", 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

  }
}

void sub_1000756BC(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 Int64Ranged;
  void *v5;
  unsigned int v6;
  const char *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bleDevice"));
  if (v2)
  {
    v14 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "advertisementFields"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v3, CFSTR("ch"), 0, 255, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "model"));
    if (!v5)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "deviceModelCode") == 5)
      {
        v6 = objc_msgSend(*(id *)(a1 + 32), "deviceModelCode");
        v7 = "Unknown";
        switch(v6)
        {
          case 0u:
            break;
          case 1u:
            v7 = "D22ish";
            break;
          case 2u:
            v7 = "SEish";
            break;
          case 3u:
            v7 = "J3XXish";
            break;
          case 4u:
            v7 = "N112ish";
            break;
          case 5u:
            v7 = "B520ish";
            break;
          case 6u:
            v7 = "B620ish";
            break;
          case 7u:
            v7 = "J255ish";
            break;
          default:
            v7 = "?";
            break;
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
      }
      else
      {
        v5 = 0;
      }
    }
    v8 = objc_alloc(off_100131470());
    v9 = (double)(uint64_t)objc_msgSend(v14, "rssi");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v12 = objc_msgSend(v8, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:", v11, v5, Int64Ranged, v9, (double)mach_continuous_time());

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "devicePresenceNotifier"));
    objc_msgSend(v13, "notifyBluetoothSample:", v12);

    v2 = v14;
  }

}

Class sub_100075F78()
{
  Class result;

  if (qword_100132220 != -1)
    dispatch_once(&qword_100132220, &stru_1001138D8);
  result = objc_getClass("NIBluetoothSample");
  qword_100132218 = (uint64_t)result;
  off_100131470 = (uint64_t (*)())sub_100075FD4;
  return result;
}

id sub_100075FD4()
{
  return (id)qword_100132218;
}

void sub_100075FE0(id a1)
{
  qword_100132228 = (uint64_t)dlopen("/System/Library/Frameworks/NearbyInteraction.framework/NearbyInteraction", 2);
}

Class sub_100076008()
{
  Class result;

  if (qword_100132220 != -1)
    dispatch_once(&qword_100132220, &stru_1001138D8);
  result = objc_getClass("NIRegionPredicate");
  qword_100132230 = (uint64_t)result;
  off_100131478 = (uint64_t (*)())sub_100076064;
  return result;
}

id sub_100076064()
{
  return (id)qword_100132230;
}

Class sub_100076070()
{
  Class result;

  if (qword_100132220 != -1)
    dispatch_once(&qword_100132220, &stru_1001138D8);
  result = objc_getClass("NIDevicePresenceConfiguration");
  qword_100132238 = (uint64_t)result;
  off_100131480 = (uint64_t (*)())sub_1000760CC;
  return result;
}

id sub_1000760CC()
{
  return (id)qword_100132238;
}

Class sub_1000760D8()
{
  Class result;

  if (qword_100132220 != -1)
    dispatch_once(&qword_100132220, &stru_1001138D8);
  result = objc_getClass("NISession");
  qword_100132240 = (uint64_t)result;
  off_100131488 = (uint64_t (*)())sub_100076134;
  return result;
}

id sub_100076134()
{
  return (id)qword_100132240;
}

void sub_100076634(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSUUID *v7;
  id v8;

  v8 = a2;
  if (dword_100131550 <= 30 && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    v4 = *(id *)(a1 + 32);
    v5 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v5, "appendFormat:", CFSTR("%p"), v4);

    LogPrintF(&dword_100131550, "-[RPNWDiscoverySession startDiscovery:controlFlags:deviceFilter:]_block_invoke", 30, "%@ DISCOVER: Found device through RPNWDiscoverySession[%@] - %@", v3, v5, v8);
  }
  v6 = *(void **)(a1 + 32);
  v7 = objc_opt_new(NSUUID);
  objc_msgSend(v6, "addMappingForDevice:endpointID:", v8, v7);

}

void sub_100076740(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v6 = a2;
  if (dword_100131550 <= 30 && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    v4 = *(id *)(a1 + 32);
    v5 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v5, "appendFormat:", CFSTR("%p"), v4);

    LogPrintF(&dword_100131550, "-[RPNWDiscoverySession startDiscovery:controlFlags:deviceFilter:]_block_invoke_2", 30, "%@ DISCOVER: Updated device through RPNWDiscoverySession[%@] - %@", v3, v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateMappingForDevice:", v6);

}

void sub_100076830(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v6 = a2;
  if (dword_100131550 <= 30 && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    v4 = *(id *)(a1 + 32);
    v5 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v5, "appendFormat:", CFSTR("%p"), v4);

    LogPrintF(&dword_100131550, "-[RPNWDiscoverySession startDiscovery:controlFlags:deviceFilter:]_block_invoke_3", 30, "%@ DISCOVER: Lost device through RPNWDiscoverySession[%@] - %@", v3, v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeDevice:", v6);

}

id sub_100076920(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "removeAllDevices");
}

void sub_100076B38(id a1)
{
  RPNWNetworkAgent *v1;
  void *v2;

  v1 = objc_alloc_init(RPNWNetworkAgent);
  v2 = (void *)qword_100132248;
  qword_100132248 = (uint64_t)v1;

}

#error "100076D70: call analysis failed (funcsize=62)"

id sub_100076F14(uint64_t a1)
{
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent activate]_block_invoke", 30, "Activate\n");
  return objc_msgSend(*(id *)(a1 + 32), "prefsChanged");
}

id sub_100076FDC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t sub_100077BD0(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 1));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

int sub_100077D00(id a1, NSData *a2, NSNumber *a3, RPCompanionLinkDevice *a4, int a5, NSString *a6, NSData *a7, id *a8, id *a9, NSUUID *a10, BOOL a11, NSUUID *a12, id *a13)
{
  NSData *v17;
  NSNumber *v18;
  RPCompanionLinkDevice *v19;
  NSString *v20;
  NSData *v21;
  NSUUID *v22;
  NSUUID *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;

  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a12;
  *a13 = 0;
  if (v19 && v20)
  {
    if (dword_1001315C0 <= 40
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice name](v19, "name"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createRapportServer]_block_invoke", 40, "Received BROWSE request for appSvc='%@' from %@", v20, v24);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:](RPNWAgentClient, "findListenerAgentClientFromApplicationServiceName:", v20));
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWListener findListenerForAgentClient:sender:browseRequest:](RPNWListener, "findListenerForAgentClient:sender:browseRequest:", v25, v19, 1));
      v27 = v26;
      if (v26)
        *a13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mappingID"));

      v28 = 2 * (*a13 != 0);
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createRapportServer]_block_invoke", 90, "Not a valid BROWSE request\n");
    }
    v28 = 0;
  }

  return v28;
}

uint64_t sub_100077EE8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, _QWORD *a8, _QWORD *a9, void *a10, uint64_t a11, void *a12)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  const char *v29;
  nw_endpoint_t bonjour_service;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(_QWORD, _QWORD);
  id v40;
  id v41;
  _QWORD *v42;
  id v44;

  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a12;
  if (v19 && v20 && v21)
  {
    v42 = a8;
    if (dword_1001315C0 <= 40
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createRapportServer]_block_invoke_2", 40, "Received RESOLVE request for appSvc='%@' from sender '%@'", v20, v19);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:](RPNWAgentClient, "findListenerAgentClientFromApplicationServiceName:", v20));
    v26 = v25;
    if (v25)
    {
      v40 = v18;
      v41 = v17;
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "agentClientID")));
      *a9 = v27;
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString")));
      v29 = (const char *)objc_msgSend(v28, "cStringUsingEncoding:", 4);

      bonjour_service = nw_endpoint_create_bonjour_service(v29, "_asquic._udp", "local");
      v44 = v21;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
      nw_endpoint_set_public_keys(bonjour_service, v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "idsDeviceIdentifier"));
      if (v32)
      {
        if (dword_1001315C0 <= 40
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "idsDeviceIdentifier"));
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createRapportServer]_block_invoke_2", 40, "RESOLVE: Setting device identifier=%@ for appSvc='%@' from sender '%@'", v33, v20, v19);

        }
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "idsDeviceIdentifier")));
        nw_endpoint_set_device_id(bonjour_service, objc_msgSend(v34, "UTF8String"));

      }
      v35 = *(void **)(a1 + 32);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "browseClient"));
      *v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_localPublicKeyForAgentClient:", v36));

      v37 = (void *)nw_array_create();
      nw_array_append(v37, bonjour_service);
      v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "browseResponse"));
      ((void (**)(_QWORD, void *))v38)[2](v38, v37);

      if (*v42)
        v24 = 2 * (*a9 != 0);
      else
        v24 = 0;
      v18 = v40;
      v17 = v41;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createRapportServer]_block_invoke_2", 90, "Not a valid RESOLVE request\n");
    }
    v24 = 0;
  }

  return v24;
}

id sub_100078284(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, void *a10, char a11, void *a12)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;

  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a12;
  v24 = v23;
  if (v19 && v20 && v22 && v23)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWListener findListenerForID:applicationService:fromPeer:](RPNWListener, "findListenerForID:applicationService:fromPeer:", v22, v20, v19));
    if (!v25 && a11)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:](RPNWListener, "addDeviceToApplicationServiceMapping:device:completion:", v20, v19, 0));
      objc_msgSend(v25, "setAutomapped:", 1);
    }
    v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:", v19, v18, v20, v22, v24);

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createRapportServer]_block_invoke_3", 90, "Not a valid CONNECT request\n");
    }
    v26 = 0;
  }

  return v26;
}

uint64_t sub_100078410(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  _QWORD cleanup_handler[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setListen_framer:", v3);
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "listen_framer"));
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListenerFramer:]_block_invoke", 30, "Creating listener framer=%@\n", v4);

  }
  cleanup_handler[0] = _NSConcreteStackBlock;
  cleanup_handler[1] = 3221225472;
  cleanup_handler[2] = sub_10007850C;
  cleanup_handler[3] = &unk_1001139B0;
  v7 = *(id *)(a1 + 32);
  nw_framer_set_cleanup_handler(v3, cleanup_handler);

  return 1;
}

void sub_10007850C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListenerFramer:]_block_invoke_2", 30, "Cleaning up listening framer=%@\n", v3);
  objc_msgSend(*(id *)(a1 + 32), "setListen_framer:", 0);

}

void sub_100078E20(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  if ((a2 - 1) > 1)
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 90, "Failed to connect to peer\n");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v13, 61);
    goto LABEL_23;
  }
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 30, "Successfully connected to peer='%@'\n", v7, v14);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
  objc_msgSend(v8, "handleConnectionData:", 0);

  v9 = objc_msgSend(*(id *)(a1 + 40), "type");
  if (a2 == 2 && v9 == (id)4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 30, "Outgoing connection ready, starting connection");
    }
    objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer startConnection:](RPNWFramer, "startConnection:", v13);
LABEL_23:

    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type") == (id)3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "version"));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    if (v12 >= 2.0)
    {
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 30, "Incoming connection ready signaling READY");
      }
      objc_msgSend(*(id *)(a1 + 32), "sendStatusUpdate:", 5);
    }
  }
LABEL_24:

}

void sub_1000790BC(uint64_t a1)
{
  id v2;

  if (dword_1001315C0 <= 90 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_2", 90, "Lost connection to peer\n");
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
  +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v2, 50);

}

uint64_t sub_10007915C(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setFramer:", v3);
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_3", 30, "Receiving signal to create connection framer=%@\n", v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000792A0;
  v7[3] = &unk_100113A28;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100079644;
  v5[3] = &unk_1001110F8;
  v6 = *(id *)(a1 + 32);
  +[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:](RPNWFramer, "setupDaemonFramer:receiveHandler:closeHandler:", v3, v7, v5);

  return 2;
}

void sub_1000792A0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  if (dword_1001315C0 <= 10 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 10)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_4", 10, "DATA (%d bytes) from Agent Client, more: %d", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outgoingBuffer"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0x4000));
    objc_msgSend(*(id *)(a1 + 32), "setOutgoingBuffer:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outgoingBuffer"));
  objc_msgSend(v10, "appendBytes:length:", a2, a3);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outgoingBuffer"));
  v12 = (unint64_t)objc_msgSend(v11, "length");

  if (v12 >> 9 > 0x1E || a4 == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outgoingBuffer"));
    objc_msgSend(*(id *)(a1 + 32), "setOutgoingBuffer:", 0);
    if (dword_1001315C0 <= 10
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 10)))
    {
      v15 = objc_msgSend(v14, "length");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destinationDevice"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_4", 10, "RX DATA (%d bytes) from Agent Client, sending to peer '%@'", v15, v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
    v20 = *(_QWORD *)(a1 + 40);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionUUID"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100079578;
    v23[3] = &unk_1001115C8;
    v24 = *(id *)(a1 + 32);
    objc_msgSend(v19, "sendDataForConnection:applicationService:connectionID:responseHandler:", v14, v20, v21, v23);

  }
  else if (dword_1001315C0 <= 10
         && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 10)))
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outgoingBuffer"));
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_4", 10, "RX DATA (%d bytes) from Agent Client, more: %d", objc_msgSend(v22, "length"), 1);

  }
}

void sub_100079578(uint64_t a1, uint64_t a2)
{
  id v4;

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_5", 30, "Received peer response %s", +[RPNWPeer responseCodeToString:](RPNWPeer, "responseCodeToString:", a2));
  if (!(_DWORD)a2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v4, 61);

  }
}

id sub_100079644(uint64_t a1)
{
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_6", 30, "RX close connection status, sending CLOSED status update to peer\n");
  objc_msgSend(*(id *)(a1 + 32), "sendStatusUpdate:", 4);
  return objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 0);
}

void sub_100079D98(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (a2 != 2)
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 90, "Failed to connect to peer\n");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v9, 61);
    goto LABEL_21;
  }
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 30, "Successfully connected to peer='%@'\n", v7, v10);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
  objc_msgSend(v8, "handleConnectionData:", 0);

  if (objc_msgSend(*(id *)(a1 + 40), "type") == (id)4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 30, "Outgoing connection ready, starting connection");
    }
    objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer startConnection:](RPNWFramer, "startConnection:", v9);
LABEL_21:

    goto LABEL_22;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type") == (id)3)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke", 30, "Incoming connection ready signaling READY");
    }
    objc_msgSend(*(id *)(a1 + 32), "sendStatusUpdate:", 5);
  }
LABEL_22:

}

void sub_100079FF8(uint64_t a1)
{
  id v2;

  if (dword_1001315C0 <= 90 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_2", 90, "Lost connection to peer\n");
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
  +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v2, 50);

}

uint64_t sub_10007A098(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setFramer:", v3);
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_3", 30, "Receiving signal to create NearbyInvitation connection framer=%@\n", v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007A1DC;
  v7[3] = &unk_100113A28;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007A410;
  v5[3] = &unk_1001110F8;
  v6 = *(id *)(a1 + 32);
  +[RPNWFramer setupDaemonFramer:receiveHandler:closeHandler:](RPNWFramer, "setupDaemonFramer:receiveHandler:closeHandler:", v3, v7, v5);

  return 2;
}

void sub_10007A1DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a2, a3));
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v5 = objc_msgSend(v4, "length");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationDevice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_4", 30, "RX DATA (%d bytes) from Agent Client, sending to peer '%@'", v5, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionUUID"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007A344;
  v12[3] = &unk_1001115C8;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v9, "sendDataForConnection:applicationService:connectionID:responseHandler:", v4, v10, v11, v12);

}

void sub_10007A344(uint64_t a1, uint64_t a2)
{
  id v4;

  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]_block_invoke_5", 30, "Received peer response %s", +[RPNWPeer responseCodeToString:](RPNWPeer, "responseCodeToString:", a2));
  if (!(_DWORD)a2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v4, 61);

  }
}

id sub_10007A410(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 0);
}

void sub_10007AAB8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t pid;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  int v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  int v30;
  BOOL v31;
  char v32;

  v5 = a2;
  v6 = a3;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]_block_invoke", 30, "BROWSE: Start browse request from agent_client=%@\n", v5);
  v7 = nw_agent_client_copy_browse_descriptor(v5);
  v8 = (void *)v7;
  if (v7 && nw_browse_descriptor_get_type(v7) == 2)
  {
    v9 = (void *)nw_agent_client_copy_parameters(v5);
    if (v9)
    {
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]_block_invoke", 30, "BROWSE: NWParameters=%@\n", v9);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWAgentClient addAgentClient](RPNWAgentClient, "addAgentClient"));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_quicProtocolOptionsFromParameters:", v9));
        v22 = v11 != 0;

        pid = nw_parameters_get_pid(v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getPersonaFromParameters:", v9));
        if (dword_1001315C0 <= 30
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
        {
          v14 = CFSTR("NO");
          if (v11)
            v14 = CFSTR("YES");
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]_block_invoke", 30, "BROWSE: Parameters from agent_client PID=%d, QUIC=%@", pid, v14);
        }
        v15 = pid;
        if (nw_browse_descriptor_get_invitation_scope(v8))
        {
          v16 = _os_feature_enabled_impl("Rapport", "NearbyInvitation");
          v17 = v16;
          if (v16)
            v18 = 0;
          else
            v18 = v13;
          v21 = v18;
        }
        else
        {
          v17 = 0;
          v21 = v13;
        }
        v19 = *(void **)(a1 + 32);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10007AEA4;
        v23[3] = &unk_100113A78;
        v24 = v10;
        v25 = v5;
        v31 = v22;
        v30 = v15;
        v26 = v8;
        v27 = v13;
        v28 = *(_QWORD *)(a1 + 32);
        v29 = v6;
        v32 = v17;
        v20 = v13;
        objc_msgSend(v19, "executeAgentLogicInPersona:pid:handlerDescription:handler:", v21, v15, CFSTR("Browse Request"), v23);

      }
      else if (dword_1001315C0 <= 90
             && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]_block_invoke", 90, "BROWSE: Failed to create client\n");
      }

    }
    else if (dword_1001315C0 <= 90
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]_block_invoke", 90, "BROWSE: Failed to copy parameters from agent_client=%@\n", v5);
    }

  }
  else if (dword_1001315C0 <= 30
         && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]_block_invoke", 30, "BROWSE: Not an application service browse request\n");
  }

}

id sub_10007AEA4(uint64_t a1)
{
  uint64_t v3;

  HIDWORD(v3) = *(_DWORD *)(a1 + 80);
  BYTE2(v3) = 0;
  BYTE1(v3) = *(_BYTE *)(a1 + 84);
  LOBYTE(v3) = 0;
  objc_msgSend(*(id *)(a1 + 32), "updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:", *(_QWORD *)(a1 + 40), 0, 0, 0, 0, *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56));
  return _objc_msgSend(*(id *)(a1 + 64), "discoverDevices:response:nearbyInvitation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 85));
}

void sub_10007AF10(id a1, OS_nw_agent_client *a2)
{
  OS_nw_agent_client *v2;
  int v3;
  OS_nw_agent_client *v4;

  v2 = a2;
  v4 = v2;
  if (dword_1001315C0 <= 30)
  {
    if (dword_1001315C0 != -1 || (v3 = _LogCategory_Initialize(&dword_1001315C0, 30), v2 = v4, v3))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupBrowseHandlers]_block_invoke_3", 30, "BROWSE: Stop browse request from agent_client=%@\n", v2);
      v2 = v4;
    }
  }
  +[RPNWAgentClient removeAgentClient:isFlowHandler:](RPNWAgentClient, "removeAgentClient:isFlowHandler:", v2, 0);

}

void sub_10007B0D8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  int v21;

  v7 = a3;
  v8 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[2] = sub_10007B1BC;
  v15[3] = &unk_100113B08;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v15[1] = 3221225472;
  v21 = a2;
  v16 = v8;
  v17 = v7;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 32);
  v18 = v11;
  v19 = v12;
  v20 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  dispatch_async(v10, v15);

}

void sub_10007B1BC(uint64_t a1)
{
  void *v2;
  id v3;
  const char *v4;
  nw_endpoint_t bonjour_service;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v2 = (void *)nw_array_create();
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString")));
    v4 = (const char *)objc_msgSend(v3, "cStringUsingEncoding:", 4);

    bonjour_service = nw_endpoint_create_bonjour_service(v4, "_asquic._udp", "local");
    v19 = *(_QWORD *)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    nw_endpoint_set_public_keys(bonjour_service, v6);

    if (dword_1001315C0 <= 40
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent resolveRequest:existingEndpoint:controlFlags:clientPublicKey:client:]_block_invoke_2", 40, "%@ RESOLVE: Resolve request succeeded for agent_client=%@\n", v7, *(_QWORD *)(a1 + 48));

    }
    nw_array_append(v2, bonjour_service);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 64)));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));

    }
    bonjour_service = (nw_endpoint_t)nw_error_create_error_with_inferred_domain(4294901743);
    nw_agent_send_error_response(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 24), *(_QWORD *)(a1 + 48), bonjour_service);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "removeObject:", *(_QWORD *)(a1 + 64));

}

void sub_10007B56C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t pid;
  void *error_with_inferred_domain;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[2];

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 80));
  if (dword_1001315C0 <= 40 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 40, "RESOLVE: Start resolve request for agent_client=%@\n", v5);
  v7 = (void *)nw_agent_client_copy_endpoint(v5);
  if (v7)
  {
    if (dword_1001315C0 <= 40
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 40, "RESOLVE: Continue resolve request for agent_client=%@ endpoint=%@\n", v5, v7);
    }
    v36[0] = 0;
    v36[1] = 0;
    nw_endpoint_get_service_identifier(v7, v36);
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v36);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", v8))
    {
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 30, "RESOLVE: Pending resolve request for endpoint ID=%@, agent_client=%@\n", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v5);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v8));
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v8));
        v12 = objc_retainBlock(v6);
        objc_msgSend(v10, "addObject:", v12);

LABEL_59:
        goto LABEL_60;
      }
      if (dword_1001315C0 <= 90
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 90, "RESOLVE: Missing pending response holder for existing endpoint ID=%@ agent_client=%@\n", v8, v5);
      }
      v13 = 4294901747;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWEndpoint findEndpoint:](RPNWEndpoint, "findEndpoint:", v8));
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_localPublicKeyForAgentClient:", v5));
        if (v10)
        {
          v11 = (void *)nw_agent_client_copy_parameters(v5);
          if (v11)
          {
            if (dword_1001315C0 <= 40
              && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 40)))
            {
              LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 40, "RESOLVE: NWParameters=%@\n", v11);
            }
            v29 = objc_msgSend(*(id *)(a1 + 32), "convertConnectionParametersToControlFlags:", v11);
            v14 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
            if (!v14)
            {
              v15 = objc_alloc_init((Class)NSMutableSet);
              v16 = *(_QWORD *)(a1 + 32);
              v17 = *(void **)(v16 + 56);
              *(_QWORD *)(v16 + 56) = v15;

              v14 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
            }
            objc_msgSend(v14, "addObject:", v8);
            v18 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
            if (!v18)
            {
              v19 = objc_alloc_init((Class)NSMutableDictionary);
              v20 = *(_QWORD *)(a1 + 32);
              v21 = *(void **)(v20 + 48);
              *(_QWORD *)(v20 + 48) = v19;

              v18 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
            }
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v8));

            if (!v22)
            {
              v23 = objc_alloc_init((Class)NSMutableSet);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v23, v8);

            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v8));
            v25 = objc_retainBlock(v6);
            objc_msgSend(v24, "addObject:", v25);

            pid = nw_parameters_get_pid(v11);
            error_with_inferred_domain = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getPersonaFromParameters:", v11));
            v28 = *(void **)(a1 + 32);
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10007BC1C;
            v30[3] = &unk_100113B58;
            v30[4] = v28;
            v31 = v8;
            v32 = v9;
            v35 = v29;
            v33 = v10;
            v34 = v5;
            objc_msgSend(v28, "executeAgentLogicInPersona:pid:handlerDescription:handler:", error_with_inferred_domain, pid, CFSTR("Resolve Request"), v30);

          }
          else
          {
            if (dword_1001315C0 <= 90
              && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
            {
              LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 90, "RESOLVE: Failed to copy parameters from agent_client=%@\n", v5);
            }
            error_with_inferred_domain = (void *)nw_error_create_error_with_inferred_domain(4294901756);
            nw_agent_send_error_response(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v5, error_with_inferred_domain);
          }

        }
        else
        {
          if (dword_1001315C0 <= 90
            && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
          {
            LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 90, "RESOLVE: Failed to get local public key from agent_client=%@\n", v5);
          }
          v11 = (void *)nw_error_create_error_with_inferred_domain(4294901735);
          nw_agent_send_error_response(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v5, v11);
        }

        goto LABEL_59;
      }
      if (dword_1001315C0 <= 90
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 90, "RESOLVE: Failed to find existing endpoint with ID=%@, endpoint=%@, agent_client=%@\n", v8, v7, v5);
      }
      v13 = 4294901742;
    }
    v10 = (void *)nw_error_create_error_with_inferred_domain(v13);
    nw_agent_send_error_response(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v5, v10);
    goto LABEL_59;
  }
  if (dword_1001315C0 <= 90 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke", 90, "RESOLVE: Failed to copy endpoint from agent_client=%@\n", v5);
  v8 = (id)nw_error_create_error_with_inferred_domain(4294901747);
  nw_agent_send_error_response(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v5, v8);
LABEL_60:

}

id sub_10007BC1C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "resolveRequest:existingEndpoint:controlFlags:clientPublicKey:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void sub_10007BC30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id error_with_inferred_domain;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[2];

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 80));
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke_3", 30, "RESOLVE: Stop resolve request for agent_client=%@\n", v3);
  v4 = (void *)nw_agent_client_copy_endpoint(v3);
  if (v4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke_3", 30, "RESOLVE: Continue stop resolve request for agent_client=%@ endpoint=%@\n", v3, v4);
    }
    v17[0] = 0;
    v17[1] = 0;
    nw_endpoint_get_service_identifier(v4, v17);
    error_with_inferred_domain = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v17);
    v6 = (void *)nw_array_create();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", error_with_inferred_domain));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", 0, error_with_inferred_domain);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", error_with_inferred_domain);

  }
  else
  {
    if (dword_1001315C0 <= 90
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupResolveHandlers]_block_invoke_3", 90, "RESOLVE: Failed to copy endpoint from agent_client=%@\n", v3);
    }
    error_with_inferred_domain = (id)nw_error_create_error_with_inferred_domain(4294901747);
    nw_agent_send_error_response(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v3, error_with_inferred_domain);
  }

}

void sub_10007C1EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v7 = 0;
    objc_msgSend(*(id *)(a1 + 32), "setNearbyInvitationServer:", *(_QWORD *)(a1 + 40));
    goto LABEL_6;
  }
  if (dword_1001315C0 <= 90)
  {
    v7 = v3;
    if (dword_1001315C0 != -1 || (v6 = _LogCategory_Initialize(&dword_1001315C0, 90), v4 = v7, v6))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListener:nearbyInvitation:]_block_invoke", 90, "%@ LISTEN: Error activating NearbyInvitation server: %@\n", v5, v7);

LABEL_6:
      v4 = v7;
    }
  }

}

void sub_10007C2A8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (dword_1001315C0 <= 90 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent createListener:nearbyInvitation:]_block_invoke_2", 90, "%@ LISTEN: Lost connection to peer\n", v2);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nearbyInvitationConnection"));
  if (v3)
  {
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "framer"));
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v4, 57);

    objc_msgSend(*(id *)(a1 + 40), "setNearbyInvitationSession:", 0);
    v3 = v5;
  }

}

void sub_10007C460(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t pid;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  int invitation_route;
  int invitation_scope;
  int v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  int v38;
  BOOL v39;
  char v40;
  char v41;

  v5 = a2;
  v6 = a3;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]_block_invoke", 30, "LISTEN: Start listen request for agent_client=%@\n", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_applicationServiceAdvertiseDescriptorForClient:", v5));
  if (v7)
  {
    v8 = (void *)nw_agent_client_copy_parameters(v5);
    if (v8)
    {
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]_block_invoke", 30, "LISTEN: NWParameters=%@\n", v8);
      }
      v9 = objc_msgSend(*(id *)(a1 + 32), "_isTCPTransport:", v8);
      v10 = objc_claimAutoreleasedReturnValue(+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:](RPNWAgentClient, "findAgentClient:tryPort:isTCP:isFlowHandler:", v5, 1, v9, 0));
      if (v10
        || (v10 = objc_claimAutoreleasedReturnValue(+[RPNWAgentClient addAgentClient](RPNWAgentClient, "addAgentClient"))) != 0)
      {
        v25 = (void *)v10;
        v29 = v6;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_quicProtocolOptionsFromParameters:", v8));
        v28 = v11 != 0;

        pid = nw_parameters_get_pid(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWUtils getBundleIDForPID:](RPNWUtils, "getBundleIDForPID:", pid));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getPersonaFromParameters:", v8));
        if (dword_1001315C0 <= 30
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
        {
          v14 = CFSTR("NO");
          if (v11)
            v15 = CFSTR("YES");
          else
            v15 = CFSTR("NO");
          if ((_DWORD)v9)
            v14 = CFSTR("YES");
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]_block_invoke", 30, "LISTEN: Parameters from agent_client PID=%d, bundleID=%@, QUIC=%@ isTCP=%@", pid, v13, v15, v14);
        }
        v27 = pid;
        invitation_route = nw_advertise_descriptor_get_invitation_route(v7);
        invitation_scope = nw_advertise_descriptor_get_invitation_scope(v7);
        v18 = 0;
        if (invitation_route && invitation_scope)
          v18 = _os_feature_enabled_impl("Rapport", "NearbyInvitation");
        if (dword_1001315C0 <= 30
          && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
        {
          LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]_block_invoke", 30, "LISTEN: Listen request succeeded for agent_client=%@\n", v5);
        }
        v24 = *(void **)(a1 + 32);
        if (v18)
          v19 = 0;
        else
          v19 = v26;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10007C8D8;
        v30[3] = &unk_100113BA8;
        v31 = v25;
        v32 = v5;
        v6 = v29;
        v37 = v29;
        v33 = v13;
        v39 = v28;
        v40 = (char)v9;
        v38 = v27;
        v34 = v7;
        v35 = v26;
        v36 = *(_QWORD *)(a1 + 32);
        v41 = v18;
        v20 = v26;
        v21 = v13;
        v22 = v25;
        objc_msgSend(v24, "executeAgentLogicInPersona:pid:handlerDescription:handler:", v19, v27, CFSTR("Listen Request"), v30);

      }
      else if (dword_1001315C0 <= 90
             && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
      {
        LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]_block_invoke", 90, "LISTEN: Failed to create agent client\n", v23);
      }
    }
    else if (dword_1001315C0 <= 90
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]_block_invoke", 90, "LISTEN: Failed to copy parameters from agent_client=%@\n", v5);
    }

  }
}

id sub_10007C8D8(uint64_t a1)
{
  uint64_t v3;

  HIDWORD(v3) = *(_DWORD *)(a1 + 88);
  *(_WORD *)((char *)&v3 + 1) = *(_WORD *)(a1 + 92);
  LOBYTE(v3) = 0;
  objc_msgSend(*(id *)(a1 + 32), "updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, v3, *(_QWORD *)(a1 + 64));
  return _objc_msgSend(*(id *)(a1 + 72), "createListener:nearbyInvitation:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 94));
}

void sub_10007C93C(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (dword_1001315C0 <= 30)
  {
    if (dword_1001315C0 != -1 || (v4 = _LogCategory_Initialize(&dword_1001315C0, 30), v3 = v6, v4))
    {
      LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupListenHandlers]_block_invoke_3", 30, "LISTEN: Stop listen request from agent_client=%@\n", v3);
      v3 = v6;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_applicationServiceAdvertiseDescriptorForClient:", v3));
  if (v5)
    +[RPNWAgentClient removeAgentClient:isFlowHandler:](RPNWAgentClient, "removeAgentClient:isFlowHandler:", v6, 0);

}

id sub_10007D114(uint64_t a1)
{
  uint64_t v3;

  HIDWORD(v3) = *(_DWORD *)(a1 + 88);
  *(_WORD *)((char *)&v3 + 1) = *(_WORD *)(a1 + 92);
  LOBYTE(v3) = 1;
  objc_msgSend(*(id *)(a1 + 32), "updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), 0, 0, 0, v3, *(_QWORD *)(a1 + 56));
  return _objc_msgSend(*(id *)(a1 + 64), "startFlow:listener:client:assign:parameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

void sub_10007D184(id a1, OS_nw_agent_client *a2)
{
  void *v2;
  OS_nw_agent_client *v3;

  v3 = a2;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
  {
    v2 = (void *)nw_agent_client_copy_endpoint(v3);
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupFlowHandlers]_block_invoke_3", 30, "FLOW: Stop flow request from agent_client=%@ to endpoint=%@\n", v3, v2);

  }
  +[RPNWAgentClient removeAgentClient:isFlowHandler:](RPNWAgentClient, "removeAgentClient:isFlowHandler:", v3, 1);

}

void sub_10007D2BC(id a1, OS_nw_agent_client *a2, id a3)
{
  id v4;
  OS_nw_agent_client *v5;

  v5 = a2;
  v4 = a3;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30)))
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupAssertHandlers:]_block_invoke", 30, "Start activate request from agent_client=%@\n", v5);

}

void sub_10007D350(id a1, OS_nw_agent_client *a2)
{
  OS_nw_agent_client *v2;
  OS_nw_agent_client *v3;
  int v4;
  OS_nw_agent_client *v5;

  v2 = a2;
  v3 = v2;
  if (dword_1001315C0 <= 30
    && ((v5 = v2, dword_1001315C0 != -1) || (v4 = _LogCategory_Initialize(&dword_1001315C0, 30), v3 = v5, v4)))
  {
    LogPrintF(&dword_1001315C0, "-[RPNWNetworkAgent setupAssertHandlers:]_block_invoke_2", 30, "Stop activate request from agent_client=%@\n", v3);

  }
  else
  {

  }
}

void sub_10007DA7C(uint64_t a1, void *a2)
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 is_quic;
  NSObject *v7;

  v4 = a2;
  v5 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v7 = v4;
    is_quic = nw_protocol_options_is_quic(v4);
    v5 = v7;
    if (is_quic)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v5 = v7;
    }
  }

}

void sub_10007DBDC(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSMutableArray);
  v2 = (void *)qword_100132258;
  qword_100132258 = (uint64_t)v1;

}

id sub_10007E1A0(uint64_t a1)
{
  void *v2;
  void *v3;

  if (dword_100131630 <= 30 && (dword_100131630 != -1 || _LogCategory_Initialize(&dword_100131630, 30)))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));
    LogPrintF(&dword_100131630, "-[RPNWAgentClient stopAgentClient]_block_invoke", 30, "Invalidating requestID=%@ to peer=%@", CFSTR("com.apple.oneapi.data"), v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "deregisterRequestID:", CFSTR("com.apple.oneapi.data"));
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_10007E9A4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (dword_100131630 <= 90)
  {
    v6 = v3;
    if (dword_100131630 != -1 || (v5 = _LogCategory_Initialize(&dword_100131630, 90), v4 = v6, v5))
    {
      LogPrintF(&dword_100131630, "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]_block_invoke", 90, "Application service server %@ received error %@\n", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v4);
      v4 = v6;
    }
  }

}

uint64_t sub_10007EA38(uint64_t result)
{
  uint64_t v1;

  if (dword_100131630 <= 90)
  {
    v1 = result;
    if (dword_100131630 != -1)
      return LogPrintF(&dword_100131630, "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]_block_invoke_2", 90, "Application service server %@ received interruption\n", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 48));
    result = _LogCategory_Initialize(&dword_100131630, 90);
    if ((_DWORD)result)
      return LogPrintF(&dword_100131630, "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]_block_invoke_2", 90, "Application service server %@ received interruption\n", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 48));
  }
  return result;
}

void sub_10007F8F4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  int v10;
  void *v11;
  unsigned int v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  v4 = *(_QWORD *)(a1 + 40) & 0x380000103C00;
  v5 = v4 != 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "model"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "model"));
    v8 = objc_msgSend(v7, "containsString:", CFSTR("?"));

    if (v4)
      v5 = v8;
    else
      v5 = 0;
  }

  v9 = *(_DWORD *)(a1 + 48);
  if (v9 == -1)
    goto LABEL_41;
  v10 = *(_DWORD *)(a1 + 48);
  if ((v9 & 1) == 0)
  {
LABEL_10:
    LOBYTE(v13) = v10;
    v14 = v26;
    if ((v10 & 2) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "model"));
      if ((objc_msgSend(v15, "containsString:", CFSTR("iPad")) & 1) != 0)
      {
        v12 = 1;
LABEL_37:

LABEL_38:
        v11 = v25;
        if ((v9 & 1) == 0)
          goto LABEL_40;
        goto LABEL_39;
      }
      v24 = v15;
      v13 = *(_DWORD *)(a1 + 48);
      v14 = v26;
    }
    LOBYTE(v16) = v13;
    if ((v13 & 4) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
      if ((objc_msgSend(v17, "containsString:", CFSTR("Mac")) & 1) != 0)
      {
        v12 = 1;
LABEL_35:

LABEL_36:
        v15 = v24;
        if ((v10 & 2) == 0)
          goto LABEL_38;
        goto LABEL_37;
      }
      v23 = v17;
      v16 = *(_DWORD *)(a1 + 48);
      v14 = v26;
    }
    LOBYTE(v18) = v16;
    if ((v16 & 8) != 0)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
      if ((objc_msgSend(v2, "containsString:", CFSTR("Watch")) & 1) != 0)
      {
        v12 = 1;
LABEL_33:

LABEL_34:
        v17 = v23;
        if ((v13 & 4) == 0)
          goto LABEL_36;
        goto LABEL_35;
      }
      v18 = *(_DWORD *)(a1 + 48);
      v14 = v26;
    }
    if ((v18 & 0x10) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
      if (objc_msgSend(v19, "containsString:", CFSTR("AppleTV")))
      {

        v12 = 1;
        goto LABEL_32;
      }
      if ((*(_BYTE *)(a1 + 48) & 0x20) == 0)
      {
        v12 = 0;
LABEL_31:

LABEL_32:
        if ((v16 & 8) == 0)
          goto LABEL_34;
        goto LABEL_33;
      }
      v22 = v19;
      v14 = v26;
    }
    else if ((v18 & 0x20) == 0)
    {
      v12 = 0;
      goto LABEL_32;
    }
    v20 = v2;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
    v12 = objc_msgSend(v21, "containsString:", CFSTR("AudioAccessory"));

    v2 = v20;
    v19 = v22;
    if ((v18 & 0x10) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "model"));
  if ((objc_msgSend(v11, "containsString:", CFSTR("iPhone")) & 1) == 0)
  {
    v25 = v11;
    v10 = *(_DWORD *)(a1 + 48);
    goto LABEL_10;
  }
  v12 = 1;
LABEL_39:

LABEL_40:
  if ((v5 | v12) == 1)
LABEL_41:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_10007FB54(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 2) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t sub_10007FB68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10007FB74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    if (dword_1001316A0 <= 90
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:]_block_invoke_4", 90, "Failed to search for Rapport devices...");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  if (dword_1001316A0 <= 30)
  {
    v6 = 0;
    if (dword_1001316A0 != -1 || (v5 = _LogCategory_Initialize(&dword_1001316A0, 30), v4 = 0, v5))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:]_block_invoke_4", 30, "Searching for Rapport devices...");
LABEL_10:
      v4 = v6;
    }
  }

}

void sub_10007FEEC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
LABEL_10:
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100080084;
    v10[3] = &unk_100113DC8;
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(id *)(a1 + 64);
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v8;
    LOBYTE(v9) = 0;
    objc_msgSend(v5, "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:", CFSTR("com.apple.oneapi.resolve"), 0, 0, v6, v7, 0, v9, 0, v10);

    goto LABEL_13;
  }
  if (objc_msgSend(v3, "code") == (id)-6721)
  {
    if (dword_1001316A0 <= 30
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:]_block_invoke", 30, "Ignored error '%@'", v4);
    }
    goto LABEL_10;
  }
  if (dword_1001316A0 <= 90 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:]_block_invoke", 90, "Failed to resolve peer device '%@'. Error - %@", *(_QWORD *)(a1 + 32), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
LABEL_13:

}

id sub_100080084(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_1000801F0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer connectToOneAPIPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:]_block_invoke", 30, "Got response %s from device='%@'", +[RPNWPeer responseCodeToString:](RPNWPeer, "responseCodeToString:", a2), *(_QWORD *)(a1 + 32));
  if ((a2 - 1) > 1)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = a2;
    v12 = v10;
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v12);

}

void sub_100080514(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "code") == (id)-6721)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100080744;
    v8[3] = &unk_100113470;
    v9 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 80);
    v10 = *(id *)(a1 + 40);
    v11 = v5;
    objc_msgSend(v10, "setInvalidationHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "invalidationHandler"));
    objc_msgSend(*(id *)(a1 + 40), "setInterruptionHandler:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "invalidationHandler"));
    objc_msgSend(*(id *)(a1 + 40), "setDisconnectHandler:", v7);

    if (v4)
    {
      if (dword_1001316A0 > 30)
      {
LABEL_15:
        objc_msgSend(*(id *)(a1 + 40), "connectToOneAPIPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 89), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

        goto LABEL_18;
      }
      if (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30))
        LogPrintF(&dword_1001316A0, "-[RPNWPeer connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:]_block_invoke", 30, "Ignored error '%@'", v4);
    }
    if (dword_1001316A0 <= 30
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:]_block_invoke", 30, "CompanionLink connected to device '%@'", *(_QWORD *)(a1 + 32));
    }
    goto LABEL_15;
  }
  if (dword_1001316A0 <= 90 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:]_block_invoke", 90, "Failed to connect to device '%@'. Error - %@", *(_QWORD *)(a1 + 32), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_18:

}

id sub_100080744(uint64_t a1)
{
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:]_block_invoke_2", 30, "Lost connectivity to '%@'", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setInterruptionHandler:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setDisconnectHandler:", 0);
}

void sub_100080DA4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if ((a2 - 1) <= 1 && dword_1001316A0 <= 30)
  {
    v10 = v5;
    if (dword_1001316A0 != -1 || (v9 = _LogCategory_Initialize(&dword_1001316A0, 30), v6 = v10, v9))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destinationDevice"));
      LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]_block_invoke", 30, "Successfully connected to peer='%@'\n", v8);

      v6 = v10;
    }
  }

}

void sub_100080E64(id a1)
{
  if (dword_1001316A0 <= 90 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]_block_invoke_2", 90, "Lost connection to peer\n");
}

BOOL sub_100080F1C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    if (*(_BYTE *)(a1 + 32))
      v13 = "SERVER";
    else
      v13 = "CLIENT";
    LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke", 30, "RPNW-DATA %s Received data from peer", v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "framer"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "framer"));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "listen_framer"));
  }
  v18 = +[RPNWFramer writeDataOnFramer:data:](RPNWFramer, "writeDataOnFramer:data:", v17, v9);

  return v18;
}

void sub_100081074(id a1, RPNWAgentClient *a2, NSUUID *a3, int a4)
{
  uint64_t v4;
  RPNWAgentClient *v6;
  NSUUID *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  RPNWAgentClient *v32;

  v4 = *(_QWORD *)&a4;
  v6 = a2;
  v7 = a3;
  if (dword_1001316A0 <= 40 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 40)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke_2", 40, "Received connection status %s for connection %@", +[RPNWPeer statusCodeToString:](RPNWPeer, "statusCodeToString:", v4), v7);
  v8 = objc_claimAutoreleasedReturnValue(-[RPNWAgentClient connection](v6, "connection"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient connection](v6, "connection")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "framer")),
        v11,
        v10,
        v9,
        v11))
  {
    v12 = v4 - 1;
    v13 = 53;
    switch(v12)
    {
      case 0:
        goto LABEL_18;
      case 2:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient connection](v6, "connection"));
        if (dword_1001316A0 <= 30
          && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peer"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "destinationDevice"));
          LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke_2", 30, "Connection %@ to device '%@' is viable", v14, v16);

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peer"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peer"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "destinationDevice"));
        v25 = objc_msgSend(v14, "inbound");
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationService"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endpointUUID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "connectionUUID"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100081478;
        v30[3] = &unk_100113A00;
        v31 = v14;
        v32 = v6;
        v19 = v14;
        objc_msgSend(v22, "connectToOneAPIPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:", v24, v25, v26, v27, 0, v28, v30);

        goto LABEL_26;
      case 3:
        v13 = 57;
        goto LABEL_18;
      case 4:
        v19 = (id)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient connection](v6, "connection"));
        if (dword_1001316A0 <= 30
          && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peer"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "destinationDevice"));
          LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke_2", 30, "Connection %@ to device '%@' is ready", v19, v21);

        }
        objc_msgSend(v19, "setIsConnected:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "framer"));
        +[RPNWFramer startConnection:](RPNWFramer, "startConnection:", v29);

LABEL_26:
        break;
      default:
        v13 = 50;
LABEL_18:
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient connection](v6, "connection"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "framer"));
        +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v18, v13);

        break;
    }
  }
  else if (dword_1001316A0 <= 90
         && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
  {
    LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke_2", 90, "Agent client has no connection framer");
  }

}

void sub_100081478(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((a2 - 1) > 1)
  {
    if (dword_1001316A0 <= 90
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke_3", 90, "Failed to connect to peer\n");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer writeErrorOnFramer:error:](RPNWFramer, "writeErrorOnFramer:error:", v9, 61);
    goto LABEL_18;
  }
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
    LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke_3", 30, "Successfully connected to peer='%@'\n", v6, v10);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
  objc_msgSend(v7, "handleConnectionData:", 0);

  v8 = objc_msgSend(*(id *)(a1 + 40), "type");
  if (a2 == 2 && v8 == (id)4)
  {
    if (dword_1001316A0 <= 30
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer handleConnectionData:]_block_invoke_3", 30, "Outgoing connection ready, starting connection");
    }
    objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "framer"));
    +[RPNWFramer startConnection:](RPNWFramer, "startConnection:", v9);
LABEL_18:

  }
}

void sub_100081CFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;
  unsigned int v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("request")));
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    objc_msgSend(v10, "length");
    v49 = (uint64_t)v11;
    LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "%@ RX DATA (%d bytes) from peer, requestID=%@\n");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status")));
  v13 = v12;
  v55 = a1;
  if (v12)
    v14 = objc_msgSend(v12, "intValue");
  else
    v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("applicationService")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("clientPublicKey")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderID")));
  if (v24)
  {
    v50 = v14;
    v53 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderIDS")));
    if (dword_1001316A0 <= 30
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "appSvc=%@, SenderID=%@, SenderIDS='%@'\n", v16, v24, v25);
    }
    v57 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "findServerClientFromID:senderIDS:", v24, v25));

    v60 = (void *)v27;
    if (!v27
      && dword_1001316A0 <= 30
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "Could not find client from sender ID\n");
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("connectionID")));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("listenerID")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("automapListener")));
    objc_msgSend(v30, "BOOLValue");

    v54 = v16;
    if (dword_1001316A0 <= 30
      && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "name"));
      v31 = v24;
      v32 = v25;
      v33 = v13;
      v34 = v9;
      v35 = v15;
      v36 = v10;
      v37 = v60;
      v38 = objc_alloc_init((Class)NSMutableString);
      objc_msgSend(v38, "appendFormat:", CFSTR("%p"), v37);

      v10 = v36;
      v15 = v35;
      v9 = v34;
      v13 = v33;
      v25 = v32;
      v24 = v31;
      LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "Request from %@:%@, senderID=%@, connectionID=%@ listenerID=%@\n", v51, v38, v31, v59, v58);

    }
    v39 = *(_QWORD *)(v55 + 40);
    v56 = v10;
    v52 = v15;
    v40 = (*(uint64_t (**)(uint64_t, void *, void *, void *, _QWORD))(v39 + 16))(v39, v10, v15, v60, v50);
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = objc_alloc_init((Class)NSMutableDictionary);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v40));
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v45, CFSTR("response"));
    if (v43)
    {
      if (dword_1001316A0 <= 30
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "Receive handler response code=%@, listenerID=%@\n", v45, v43);
      }
      v46 = CFSTR("listenerID");
      v47 = v44;
      v48 = v43;
    }
    else
    {
      if (!v41 || !v42)
      {
        if (dword_1001316A0 <= 30
          && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
        {
          LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "Receive handler response code=%@\n", v45);
        }
        goto LABEL_44;
      }
      if (dword_1001316A0 <= 30
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 30, "Receive handler response code=%@, serverPublicKey=%zu bytes, bonjourServiceID=%@", v45, objc_msgSend(v41, "length"), v42);
      }
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v41, CFSTR("serverPublicKey"));
      v46 = CFSTR("bonjourServiceID");
      v47 = v44;
      v48 = v42;
    }
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, v46);
LABEL_44:
    (*((void (**)(id, id, _QWORD, _QWORD))v9 + 2))(v9, v44, 0, 0);

    v15 = v52;
    v8 = v53;
    v16 = v54;
    v10 = v56;
    v17 = v57;
    goto LABEL_45;
  }
  if (dword_1001316A0 <= 90 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveWithRequestID:receiveHandler:]_block_invoke", 90, "No sender ID, discarding\n");
  v28 = RPErrorF(4294960591, (uint64_t)"Missing sender ID", v18, v19, v20, v21, v22, v23, v49);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v29);

LABEL_45:
}

void sub_1000827C4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (dword_1001316A0 > 90 || dword_1001316A0 == -1 && !_LogCategory_Initialize(&dword_1001316A0, 90))
      goto LABEL_14;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
LABEL_5:

LABEL_14:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  if (!v18)
  {
    if (dword_1001316A0 > 90 || dword_1001316A0 == -1 && !_LogCategory_Initialize(&dword_1001316A0, 90))
      goto LABEL_14;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("response")));
  v12 = objc_msgSend(v11, "intValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("serverPublicKey")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("bonjourServiceID")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("listenerID")));
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationDevice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
    LogPrintF(&dword_1001316A0, "-[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:]_block_invoke", 30, "RX RESP from '%@': requestID=%@ appSvc=%@ response=%s serverPublicKey=%zu bytes bonjourServiceID=%@ listener=%@ error=%@\n", v16, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), +[RPNWPeer responseCodeToString:](RPNWPeer, "responseCodeToString:", v12), objc_msgSend(v13, "length"), v14, v15, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_17:
}

uint64_t sub_100082B3C(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a6;
  v22 = a7;
  v23 = a10;
  v24 = a12;
  v25 = v24;
  if (v21 && v24)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWAgentClient findAgentClientFromConnectionID:](RPNWAgentClient, "findAgentClientFromConnectionID:", v24));
    if (v26)
    {
      if (v18)
      {
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
          v27 = 2;
        else
          v27 = 0;
        goto LABEL_24;
      }
      if (a5)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v27 = 2;
LABEL_24:

        goto LABEL_25;
      }
      if (dword_1001316A0 <= 90
        && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
      {
        LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveDataForConnection:statusHandler:]_block_invoke", 90, "Not a valid data request, returning\n");
      }
    }
    else if (dword_1001316A0 <= 90
           && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    {
      LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveDataForConnection:statusHandler:]_block_invoke", 90, "Failed to find agent client for connection\n");
    }
    v27 = 0;
    goto LABEL_24;
  }
  if (dword_1001316A0 <= 90 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 90)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer receiveDataForConnection:statusHandler:]_block_invoke", 90, "Not a valid data request, returning\n");
  v27 = 0;
LABEL_25:

  return v27;
}

uint64_t sub_100082E18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100082F5C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  if (dword_1001316A0 <= 30 && (dword_1001316A0 != -1 || _LogCategory_Initialize(&dword_1001316A0, 30)))
    LogPrintF(&dword_1001316A0, "-[RPNWPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:]_block_invoke", 30, "Status update got response %s", +[RPNWPeer responseCodeToString:](RPNWPeer, "responseCodeToString:", a2));
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);

}

void sub_100083150(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    if (dword_100131710 <= 90)
    {
      if (dword_100131710 != -1 || (v4 = _LogCategory_Initialize(&dword_100131710, 90), v3 = v5, v4))
        LogPrintF(&dword_100131710, "-[RPNearbyActionV2Advertiser activateWithCompletion:]_block_invoke", 90, " ### BLE NearbyActionV2 advertiser failed to start: %@\n", v3);
    }
  }
  else if (dword_100131710 <= 30
         && (dword_100131710 != -1 || _LogCategory_Initialize(&dword_100131710, 30)))
  {
    LogPrintF(&dword_100131710, "-[RPNearbyActionV2Advertiser activateWithCompletion:]_block_invoke", 30, "BLE NearbyActionV2 advertiser started\n");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

const char *sub_100083390(unsigned int a1)
{
  if (a1 > 0x55)
    return "?";
  else
    return (&off_100113F80)[(char)a1];
}

Class sub_100083638()
{
  Class result;

  if (qword_100132270 != -1)
    dispatch_once(&qword_100132270, &stru_100113F60);
  result = objc_getClass("CBAdvertiser");
  qword_100132268 = (uint64_t)result;
  off_100131780 = (uint64_t (*)())sub_100083694;
  return result;
}

id sub_100083694()
{
  return (id)qword_100132268;
}

void sub_1000836A0(id a1)
{
  qword_100132278 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreBluetooth.framework/CoreBluetooth", 2);
}

void sub_10008376C(id a1)
{
  RPPeopleDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPPeopleDaemon);
  v2 = (void *)qword_100132280;
  qword_100132280 = (uint64_t)v1;

}

void sub_100083FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a70;

  _Block_object_dispose(&a70, 8);
  _Unwind_Resume(a1);
}

void sub_100084030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "    %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

void sub_100084098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "    Active: %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

void sub_100084100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "    Other: %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

id sub_1000841C0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_activate");
}

id sub_1000843E0(uint64_t a1)
{
  id result;
  int v3;
  const char *v4;
  uint64_t state64;

  result = (id)*(unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
  if ((_DWORD)result != -1)
  {
    state64 = 0;
    notify_get_state((int)result, &state64);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = state64;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
      if ((v3 - 1) > 2)
        v4 = "?";
      else
        v4 = (&off_1001146F0)[v3 - 1];
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _activate]_block_invoke", 30, "AirDrop mode changed: %s (%d)\n", v4, v3);
    }
    objc_msgSend(*(id *)(a1 + 32), "_update");
    return objc_msgSend(*(id *)(a1 + 32), "_rangingResponderUpdateForAirDropChange");
  }
  return result;
}

id sub_1000844BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_1000844C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_primaryAppleID:", 1);
}

id sub_1000844E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_1000844F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_100084550(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_1000849A0(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  RPIdentity *v4;
  id v5;

  v4 = a3;
  -[RPIdentity setDateRequested:](v4, "setDateRequested:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v5, "saveIdentity:error:", v4, 0);

}

void sub_100085320(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  void *v4;
  void *v5;
  void *v6;
  RPIdentity *v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateRemoved](v7, "dateRemoved"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateRequested](v7, "dateRequested"));

    if (v5)
    {
      -[RPIdentity setDateRequested:](v7, "setDateRequested:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v6, "saveIdentity:error:", v7, 0);

    }
  }

}

void sub_1000853A8(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  void *v4;
  void *v5;
  void *v6;
  RPIdentity *v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateRemoved](v7, "dateRemoved"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity dateRequested](v7, "dateRequested"));

    if (v5)
    {
      -[RPIdentity setDateRequested:](v7, "setDateRequested:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v6, "saveIdentity:error:", v7, 0);

    }
  }

}

void sub_1000857DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  (*(void (**)(void))(a4 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_100085830(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40);
  if (v1)
  {
    v2 = result;
    if (dword_100131788 > 90)
      goto LABEL_6;
    if (dword_100131788 == -1)
    {
      result = (_QWORD *)_LogCategory_Initialize(&dword_100131788, 90);
      if (!(_DWORD)result)
      {
LABEL_6:
        if (v2[6])
        {
          result = objc_retainAutorelease(*(id *)(*(_QWORD *)(v2[5] + 8) + 40));
          *(_QWORD *)v2[6] = result;
        }
        return result;
      }
      v1 = *(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 40);
    }
    result = (_QWORD *)LogPrintF(&dword_100131788, "-[RPPeopleDaemon addOrUpdateIdentity:error:]_block_invoke", 90, "### AddOrUpdateIdentity failed: %@, %{error}\n", v2[4], v1);
    goto LABEL_6;
  }
  return result;
}

void sub_100086AB4(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  RPIdentity *v4;
  id v5;

  v4 = a3;
  -[RPIdentity setDateRequested:](v4, "setDateRequested:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v5, "saveIdentity:error:", v4, 0);

}

void sub_100086B0C(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  RPIdentity *v4;
  id v5;

  v4 = a3;
  -[RPIdentity setDateRequested:](v4, "setDateRequested:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  objc_msgSend(v5, "saveIdentity:error:", v4, 0);

}

_DWORD *sub_100087494(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[8] == *(_DWORD *)(a1 + 40))
    return objc_msgSend(result, "_daemonDeviceFound:", a2);
  return result;
}

_DWORD *sub_1000874B8(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[8] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_daemonDeviceLost:", a2);
  return result;
}

_DWORD *sub_1000874DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[8] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_daemonDeviceChanged:changes:", a2, a3);
  return result;
}

uint64_t sub_100087504(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(*(_QWORD *)(result + 32) + 32);
  if (v1 == *(_DWORD *)(result + 40) && dword_100131788 <= 60)
  {
    if (dword_100131788 != -1)
      return LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]_block_invoke_4", 60, "### Device discovery interrupted ID %u\n", v1);
    v2 = result;
    result = _LogCategory_Initialize(&dword_100131788, 60);
    if ((_DWORD)result)
    {
      v1 = *(_DWORD *)(v2 + 40);
      return LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]_block_invoke_4", 60, "### Device discovery interrupted ID %u\n", v1);
    }
  }
  return result;
}

uint64_t sub_100087598(uint64_t result)
{
  uint64_t v1;

  if (dword_100131788 <= 30)
  {
    v1 = result;
    if (dword_100131788 != -1)
      return LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]_block_invoke_5", 30, "Device discovery invalidated ID %u\n", *(_DWORD *)(v1 + 32));
    result = _LogCategory_Initialize(&dword_100131788, 30);
    if ((_DWORD)result)
      return LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]_block_invoke_5", 30, "Device discovery invalidated ID %u\n", *(_DWORD *)(v1 + 32));
  }
  return result;
}

id sub_100087614(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 480);
    *(_QWORD *)(v4 + 480) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void sub_100087660(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;
  int v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (dword_100131788 <= 90)
    {
      v6 = v2;
      if (dword_100131788 != -1 || (v4 = _LogCategory_Initialize(&dword_100131788, 90), v3 = v6, v4))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]_block_invoke_7", 90, "### Device discovery start failed: %{error}\n", v3);
LABEL_8:

        return;
      }
    }
  }
  else if (dword_100131788 <= 30)
  {
    v6 = 0;
    if (dword_100131788 != -1 || (v5 = _LogCategory_Initialize(&dword_100131788, 30), v3 = 0, v5))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _discoveryEnsureStarted]_block_invoke_7", 30, "Device discovery started\n");
      goto LABEL_8;
    }
  }

}

void sub_10008818C(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_update");
  v1 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  objc_msgSend(v1, "postDaemonInfoChanges:", 1024);

}

id sub_1000881CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_1000881D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_1000881DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void sub_1000881E4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_update");
  v1 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
  objc_msgSend(v1, "postDaemonInfoChanges:", 1024);

}

void sub_1000889A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1000889E4(id a1, NSString *a2, RPIdentity *a3, BOOL *a4)
{
  -[RPIdentity setPresent:](a3, "setPresent:", 0, a4);
}

void sub_1000889F0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "present") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateRemoved"));

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v7, "setDateRemoved:", v5);

      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilyAccounts]_block_invoke_2", 30, "Marking family account identity removed: %@\n", v7);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v6, "saveIdentity:error:", v7, 0);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }

}

void sub_1000893E4(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accountID"));
  v6 = objc_msgSend(v5, "isEqualToString:", a1[4]);

  if (v6)
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _pruneFamilyDevices]_block_invoke", 30, "Prune family device account identity: %@\n", a1[5]);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    objc_msgSend(v7, "removeIdentity:error:", a1[5], 0);

    objc_msgSend(*(id *)(a1[6] + 120), "setObject:forKeyedSubscript:", 0, v8);
  }

}

void sub_10008979C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Block_object_dispose((const void *)(v35 - 112), 8);
  _Block_object_dispose((const void *)(v35 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100089804(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  RPCloudMessageContext *v8;
  double v9;
  double v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateRemoved"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateRequested"));
    if (!v7)
      goto LABEL_32;
    v8 = (RPCloudMessageContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateAcknowledged"));
    objc_msgSend(v7, "timeIntervalSinceNow");
    v10 = -v9;
    v11 = arc4random() % 0x3F481 + 1468800;
    if (v8)
    {
      if (v10 >= (double)v11)
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilySyncing]_block_invoke", 30, "Refreshing acknowledged family identity: requested %ll{dur} ago, %@\n", (unint64_t)v10, v5);
        }
        v12 = *(_QWORD *)(a1 + 56);
LABEL_30:
        ++*(_DWORD *)(*(_QWORD *)(v12 + 8) + 24);
LABEL_31:

LABEL_32:
        v8 = objc_alloc_init(RPCloudMessageContext);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_primaryAppleID:", 0));
        -[RPCloudMessageContext setSendersKnownAlias:](v8, "setSendersKnownAlias:", v13);

        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 30;
        if ((objc_msgSend(*(id *)(a1 + 40), "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", 32, v17, 0, v8) & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v5, "setDateRequested:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
          objc_msgSend(v15, "saveIdentity:error:", v5, 0);

          v16 = *(_QWORD *)(a1 + 96);
        }
        else
        {
          v16 = *(_QWORD *)(a1 + 88);
        }
LABEL_37:
        ++*(_DWORD *)(*(_QWORD *)(v16 + 8) + 24);

        goto LABEL_38;
      }
    }
    else if (v10 >= (double)v11)
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilySyncing]_block_invoke", 30, "Retrying unacknowledged family identity: requested %ll{dur} ago, %@\n", (unint64_t)v10, v5);
      }
      v12 = *(_QWORD *)(a1 + 64);
      goto LABEL_30;
    }
    if (!*(_BYTE *)(a1 + 104))
    {
      if (dword_100131788 <= 10
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilySyncing]_block_invoke", 10, "Skipping requested family identity: requested %ll{dur} ago, %@\n", (unint64_t)v10, v5);
      }
      v16 = *(_QWORD *)(a1 + 72);
      goto LABEL_37;
    }
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilySyncing]_block_invoke", 30, "Updating family identity on rename: %{mask}, requested %ll{dur} ago, %@\n", *(_QWORD *)(a1 + 32), (unint64_t)v10, v5);
    }
    goto LABEL_31;
  }
  if (dword_100131788 <= 10 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFamilySyncing]_block_invoke", 10, "Skipping removed family identity: %@\n", v5);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
LABEL_38:

}

void sub_10008A5DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_10008A5F8(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  BOOL v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "model"));
  if (v6)
  {
    v8 = v6;
    v7 = GestaltProductTypeStringToDeviceClass() == 7;
    v6 = v8;
    if (v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 4uLL;
      *a4 = 1;
    }
  }

}

id sub_10008A784(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFriendPrivacy");
}

_QWORD *sub_10008A78C(_QWORD *result)
{
  _QWORD *v1;

  if (*(_DWORD *)(result[4] + 368) != -1)
  {
    v1 = result;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsEnsureStarted]_block_invoke_2", 30, "Privacy changed notified\n");
    }
    return objc_msgSend(*(id *)(v1[4] + 360), "trigger");
  }
  return result;
}

_QWORD *sub_10008AE0C(_QWORD *result)
{
  _QWORD *v1;

  if (*(_DWORD *)(result[4] + 204) != -1)
  {
    v1 = result;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]_block_invoke", 30, "Friends update suggested notified\n");
    }
    *(_BYTE *)(v1[4] + 201) = 1;
    return objc_msgSend((id)v1[4], "_friendsUpdateSuggestedIfNeeded");
  }
  return result;
}

_QWORD *sub_10008AEA4(_QWORD *result)
{
  _QWORD *v1;

  if (result[4] == *(_QWORD *)(result[5] + 208))
  {
    v1 = result;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]_block_invoke_2", 30, "Friends update suggested poll\n");
    }
    objc_msgSend((id)v1[5], "prefsChanged");
    *(_BYTE *)(v1[5] + 201) = 1;
    return objc_msgSend((id)v1[5], "_friendsUpdateSuggestedIfNeeded");
  }
  return result;
}

void sub_10008AF44(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  if (v6)
  {
    if (dword_100131788 <= 90
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]_block_invoke_3", 90, "### Friends update suggested failed: %{error}\n", v6);
    }
  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _friendsUpdateSuggestedIfNeeded]_block_invoke_3", 30, "Friends update suggested got: %d results(s)\n", objc_msgSend(v7, "count"));
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), a2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 276) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_updateFriendIdentities");
  }

}

void sub_10008C32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

void sub_10008C39C(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "userAdded");
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateAdded"));
    v7 = *(double *)(a1 + 32);
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    if (vabdd_f64(v7, v8) >= 86400.0)
      objc_msgSend(v9, "setPresent:", 0);

    v5 = v9;
  }

}

void sub_10008C41C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "present") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateRemoved"));

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v7, "setDateRemoved:", v5);

      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendAccounts]_block_invoke_2", 30, "Marking friend account identity removed: %@\n", v7);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v6, "saveIdentity:error:", v7, 0);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }

}

void sub_10008D06C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contactID"));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v4 = v5;
  }

}

void sub_10008D0B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 0;
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v7 = v5;
  if (!v7 || v6)
  {
    if (dword_100131788 <= 90
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendPrivacy]_block_invoke_2", 90, "### Friends privacy get failed: %{error}\n", v6);
    }
  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendPrivacy]_block_invoke_2", 30, "Friends privacy got: %d results(s)\n", objc_msgSend(v7, "count"));
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateFriendPrivacyResults:", v7);
  }

}

void sub_10008D5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_10008D60C(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a2;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactID"));
  v10 = objc_msgSend(v9, "isEqual:", a1[4]);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_10008DDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 240), 8);
  _Block_object_dispose((const void *)(v53 - 208), 8);
  _Block_object_dispose((const void *)(v53 - 176), 8);
  _Block_object_dispose((const void *)(v53 - 144), 8);
  _Block_object_dispose((const void *)(v53 - 112), 8);
  _Block_object_dispose((const void *)(v53 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10008DE3C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  RPCloudMessageContext *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateRemoved"));

  if (!v6)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      if (dword_100131788 <= 10
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]_block_invoke", 10, "Friend sync: skipping friend identity (max requests reached)", v5);
      }
      v7 = *(_QWORD *)(a1 + 56);
      goto LABEL_17;
    }
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 384))
    {
      if (dword_100131788 <= 30
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]_block_invoke", 30, "Friend sync: making the one-time dateRequested refresh", v5);
      }
      objc_msgSend(v5, "setDateRequested:", 0);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateRequested"));
    v9 = v8;
    if (!v8)
      goto LABEL_48;
    objc_msgSend(v8, "timeIntervalSinceNow");
    v11 = -v10;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateAcknowledged"));
    v14 = (RPCloudMessageContext *)v13;
    if (v12 <= 0)
    {
      if (dword_100131788 <= 10
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]_block_invoke", 10, "Friend sync: friend identity refresh disabled: requested %ll{dur} ago, %@\n", (unint64_t)v11, v5);
      }
    }
    else
    {
      if (v13)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 312) <= (uint64_t)v11)
        {
          if (dword_100131788 <= 30
            && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
          {
            LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]_block_invoke", 30, "Friend sync: refreshing acknowledged friend identity: requested %ll{dur} ago, %@\n", (unint64_t)v11, v5);
          }
          v16 = *(_QWORD *)(a1 + 80);
LABEL_47:
          ++*(_DWORD *)(*(_QWORD *)(v16 + 8) + 24);

LABEL_48:
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sendersKnownAlias"));

          if (!v17)
          {
            objc_msgSend(v5, "setDateRequested:", 0);
            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
            goto LABEL_52;
          }
          v14 = objc_alloc_init(RPCloudMessageContext);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sendersKnownAlias"));
          -[RPCloudMessageContext setSendersKnownAlias:](v14, "setSendersKnownAlias:", v18);

          -[RPCloudMessageContext setNonWakingRequest:](v14, "setNonWakingRequest:", 1);
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 30;
          if (objc_msgSend(*(id *)(a1 + 32), "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", 64, v22, 1, v14))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_msgSend(v5, "setDateRequested:", v19);

            ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 232);
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 385) = 1;
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
            objc_msgSend(v20, "saveIdentity:error:", v5, 0);

            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
LABEL_52:
            if (*(_BYTE *)(a1 + 128))
            {
              v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              if (!*(_BYTE *)(v21 + 24) && *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) >= 64)
                *(_BYTE *)(v21 + 24) = 1;
            }
            goto LABEL_58;
          }
          v15 = *(_QWORD *)(a1 + 104);
LABEL_57:
          ++*(_DWORD *)(*(_QWORD *)(v15 + 8) + 24);

LABEL_58:
          goto LABEL_18;
        }
      }
      else if (v11 >= (double)(arc4random() % 0x3F481 + 1468800))
      {
        if (dword_100131788 <= 30
          && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
        {
          LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]_block_invoke", 30, "Friend sync: retrying unacknowledged friend identity: requested %ll{dur} ago, %@\n", (unint64_t)v11, v5);
        }
        v16 = *(_QWORD *)(a1 + 88);
        goto LABEL_47;
      }
      if (dword_100131788 <= 10
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]_block_invoke", 10, "Friend sync: skipping requested friend identity: requested %ll{dur} ago, %@\n", (unint64_t)v11, v5);
      }
    }
    v15 = *(_QWORD *)(a1 + 72);
    goto LABEL_57;
  }
  if (dword_100131788 <= 10 && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 10)))
    LogPrintF(&dword_100131788, "-[RPPeopleDaemon _updateFriendSyncing]_block_invoke", 10, "Friend sync: skipping removed friend identity: %@\n", v5);
  v7 = *(_QWORD *)(a1 + 40);
LABEL_17:
  ++*(_DWORD *)(*(_QWORD *)(v7 + 8) + 24);
LABEL_18:

}

void sub_10008EAE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v5)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 244);
    ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 256);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 385) = 1;
    if (dword_100131788 <= 60
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]_block_invoke", 60, "### Ignoring friend identity request from unknown peer: '%{mask}', %{error}\n", *(_QWORD *)(a1 + 48), v5);
    }
  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityRequest:msgCtx:]_block_invoke", 30, "Received friend identity request: from '%{mask}', IDS '%.8@'\n", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 260);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 385) = 1;
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = *(void **)(a1 + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactIdentifier"));
    objc_msgSend(v8, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 6, v6, v7, v9, *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 72), "setNonWakingRequest:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:", 65, *(_QWORD *)(a1 + 80), 1, *(_QWORD *)(a1 + 72));
  }

}

void sub_10008EFAC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v5)
  {
    if (dword_100131788 <= 60
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]_block_invoke", 60, "### Ignoring friend identity response from unknown peer: '%{mask}', %{error}\n", *(_QWORD *)(a1 + 40), v5);
    }
  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]_block_invoke", 30, "Received friend identity response: from '%{mask}', IDS '%.8@'\n", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v6, "setDateAcknowledged:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      objc_msgSend(v8, "saveIdentity:error:", v6, 0);

    }
    else if (dword_100131788 <= 60
           && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityResponse:msgCtx:]_block_invoke", 60, "No friend account identity for response: '%{mask}'\n", *(_QWORD *)(a1 + 40));
    }
    v9 = *(void **)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contactIdentifier"));
    objc_msgSend(v9, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 6, v10, v11, v12, *(_QWORD *)(a1 + 72));

  }
}

void sub_10008F4C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v5)
  {
    if (dword_100131788 <= 60
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 60)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]_block_invoke", 60, "### Ignoring friend identity update from unknown peer: '%{mask}', %{error}\n", *(_QWORD *)(a1 + 40), v5);
    }
  }
  else
  {
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon receivedFriendIdentityUpdate:msgCtx:]_block_invoke", 30, "Received friend identity update: from '%{mask}', IDS '%.8@'\n", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactIdentifier"));
    objc_msgSend(v6, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:", 6, v7, v8, v9, *(_QWORD *)(a1 + 64));

  }
}

_QWORD *sub_10008F7E0(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[53])
    return _objc_msgSend(result, "_rangingBLEActionScannerDeviceFound:", a2);
  return result;
}

_QWORD *sub_10008F7FC(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[53])
    return _objc_msgSend(result, "_rangingBLEActionScannerDeviceLost:", a2);
  return result;
}

_QWORD *sub_10008F818(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[53])
    return _objc_msgSend(result, "_rangingBLEActionScannerDeviceFound:", a2);
  return result;
}

void sub_10008F834(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 424))
  {
    if (v3)
    {
      v8 = v3;
      if (dword_100131788 <= 90
        && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerEnsureStarted]_block_invoke_4", 90, "### Ranging BLE action scanner failed: %{error}\n", v8);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "invalidate");
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 424);
      *(_QWORD *)(v5 + 424) = 0;

      goto LABEL_11;
    }
    if (dword_100131788 <= 30)
    {
      v8 = 0;
      if (dword_100131788 != -1 || (v7 = _LogCategory_Initialize(&dword_100131788, 30), v4 = 0, v7))
      {
        LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerEnsureStarted]_block_invoke_4", 30, "Ranging BLE action scanner started\n");
LABEL_11:
        v4 = v8;
      }
    }
  }

}

_QWORD *sub_10008FE74(_QWORD *result)
{
  _QWORD *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  if (result[4] == *(_QWORD *)(result[5] + 400))
  {
    v1 = result;
    if (dword_100131788 <= 30
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 30)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingBLEActionScannerBurst]_block_invoke", 30, "Ranging BLE action scanner burst end\n");
    }
    v2 = *(void **)(v1[5] + 400);
    if (v2)
    {
      v3 = v2;
      dispatch_source_cancel(v3);
      v4 = v1[5];
      v5 = *(void **)(v4 + 400);
      *(_QWORD *)(v4 + 400) = 0;

    }
    result = objc_msgSend(*(id *)(v1[5] + 424), "scanRate");
    if (result != (_QWORD *)20)
      return objc_msgSend(*(id *)(v1[5] + 424), "setScanRate:", 20);
  }
  return result;
}

_QWORD *sub_100090154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v4 == result[55])
    return _objc_msgSend(result, "_rangingInitiatorHandlePeer:measurement:", a2, a3);
  return result;
}

id sub_100090174(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_rangingInitiatorStatusChanged");
}

void sub_10009017C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (v3 && *(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 392))
  {
    v6 = v3;
    if (dword_100131788 <= 90
      && (dword_100131788 != -1 || _LogCategory_Initialize(&dword_100131788, 90)))
    {
      LogPrintF(&dword_100131788, "-[RPPeopleDaemon _rangingInitiatorEnsureStarted]_block_invoke_3", 90, "### Ranging BLE action advertiser failed: %@\n", v6);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 392), "invalidate");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 392);
    *(_QWORD *)(v4 + 392) = 0;

    v3 = v6;
  }

}

void sub_1000903CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000903E4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDeviceAddress"));
  if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void sub_10009072C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bleDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advertisementFields"));
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v5, CFSTR("bdAddr"), TypeID, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v8)
  {
    v9 = objc_alloc_init((Class)CURangingPeer);
    objc_msgSend(v9, "setDeviceAddress:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
    objc_msgSend(v9, "setDeviceModel:", v10);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }

}

id sub_100092408(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

id sub_100093A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientDeviceFound:report:", a3, 0);
}

Class sub_100093CE4()
{
  Class result;

  if (qword_100132298 != -1)
    dispatch_once(&qword_100132298, &stru_100114638);
  result = objc_getClass("MSDKDemoState");
  qword_100132290 = (uint64_t)result;
  off_1001317F8 = (uint64_t (*)())sub_100093D40;
  return result;
}

id sub_100093D40()
{
  return (id)qword_100132290;
}

void sub_100093D4C(id a1)
{
  qword_1001322A0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileStoreDemoKit.framework/MobileStoreDemoKit", 2);
}

Class sub_100093D74()
{
  Class result;

  if (qword_1001322B0 != -1)
    dispatch_once(&qword_1001322B0, &stru_100114658);
  result = objc_getClass("SFDeviceDiscovery");
  qword_1001322A8 = (uint64_t)result;
  off_100131800 = (uint64_t (*)())sub_100093DD0;
  return result;
}

id sub_100093DD0()
{
  return (id)qword_1001322A8;
}

void sub_100093DDC(id a1)
{
  qword_1001322B8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

Class sub_100093E04()
{
  Class result;

  if (qword_1001322B0 != -1)
    dispatch_once(&qword_1001322B0, &stru_100114658);
  result = objc_getClass("SFClient");
  qword_1001322C0 = (uint64_t)result;
  off_100131808 = (uint64_t (*)())sub_100093E60;
  return result;
}

id sub_100093E60()
{
  return (id)qword_1001322C0;
}

Class sub_100093E6C()
{
  Class result;

  if (qword_1001322B0 != -1)
    dispatch_once(&qword_1001322B0, &stru_100114658);
  result = objc_getClass("SFPeopleSuggesterParams");
  qword_1001322C8 = (uint64_t)result;
  off_100131810 = (uint64_t (*)())sub_100093EC8;
  return result;
}

id sub_100093EC8()
{
  return (id)qword_1001322C8;
}

Class sub_100093ED4()
{
  Class result;

  if (qword_1001322B0 != -1)
    dispatch_once(&qword_1001322B0, &stru_100114658);
  result = objc_getClass("SFContactInfo");
  qword_1001322D0 = (uint64_t)result;
  off_100131818 = (uint64_t (*)())sub_100093F30;
  return result;
}

id sub_100093F30()
{
  return (id)qword_1001322D0;
}

Class sub_100093F3C()
{
  Class result;

  if (qword_1001322B0 != -1)
    dispatch_once(&qword_1001322B0, &stru_100114658);
  result = objc_getClass("SFService");
  qword_1001322D8 = (uint64_t)result;
  off_100131820 = (uint64_t (*)())sub_100093F98;
  return result;
}

id sub_100093F98()
{
  return (id)qword_1001322D8;
}

void sub_100093FE4(id a1)
{
  RPPrivateDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPPrivateDaemon);
  v2 = (void *)qword_1001322E0;
  qword_1001322E0 = (uint64_t)v1;

}

id sub_100094360(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  void *v5;

  if (dword_1001318E8 <= 30 && (dword_1001318E8 != -1 || _LogCategory_Initialize(&dword_1001318E8, 30)))
    LogPrintF(&dword_1001318E8, "-[RPPrivateDaemon activate]_block_invoke", 30, "Activate\n");
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
  {
    v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.rapport.private-discovery"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "prefsChanged");
}

id sub_100094480(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_100094E0C(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  RPPrivateXPCConnection *v6;

  v6 = objc_alloc_init(RPPrivateXPCConnection);
  -[RPPrivateXPCConnection setDaemon:](v6, "setDaemon:", a1[4]);
  -[RPPrivateXPCConnection setDirect:](v6, "setDirect:", 1);
  -[RPPrivateXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", *(_QWORD *)(a1[4] + 32));
  -[RPPrivateXPCConnection setEntitled:](v6, "setEntitled:", 1);
  v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    v3 = objc_alloc_init((Class)NSMutableSet);
    v4 = a1[4];
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(a1[4] + 16);
  }
  objc_msgSend(v2, "addObject:", v6);
  -[RPPrivateXPCConnection xpcPrivateAdvertiserActivate:completion:](v6, "xpcPrivateAdvertiserActivate:completion:", a1[5], a1[6]);

}

void sub_100094F60(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activatedAdvertiser", (_QWORD)v11));
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          v10 = v7;

          if (v10)
            objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", v10);
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = 0;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10009515C(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  RPPrivateXPCConnection *v6;

  v6 = objc_alloc_init(RPPrivateXPCConnection);
  -[RPPrivateXPCConnection setDaemon:](v6, "setDaemon:", a1[4]);
  -[RPPrivateXPCConnection setDirect:](v6, "setDirect:", 1);
  -[RPPrivateXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", *(_QWORD *)(a1[4] + 32));
  -[RPPrivateXPCConnection setEntitled:](v6, "setEntitled:", 1);
  v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    v3 = objc_alloc_init((Class)NSMutableSet);
    v4 = a1[4];
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(a1[4] + 16);
  }
  objc_msgSend(v2, "addObject:", v6);
  -[RPPrivateXPCConnection xpcPrivateDiscoveryActivate:completion:](v6, "xpcPrivateDiscoveryActivate:completion:", a1[5], a1[6]);

}

void sub_1000952B0(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activatedDiscovery", (_QWORD)v11));
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          v10 = v7;

          if (v10)
            objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", v10);
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = 0;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id sub_1000955B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

void sub_100096D8C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x360], 8);
  _Unwind_Resume(a1);
}

void sub_100096E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v3 + 40);
  v4 = CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&obj, "    %@\n", v5);
  objc_storeStrong((id *)(v3 + 40), obj);

}

void sub_100096EA8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id obj;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  v5 = *(unsigned int *)(a1 + 40);
  v6 = a2;
  v7 = CUDescriptionWithLevel(a3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(&obj, "    ID %@ %@\n", v6, v8);

  objc_storeStrong((id *)(v4 + 40), obj);
}

void sub_100096F2C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id obj;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v7 + 40);
  v8 = *(unsigned int *)(a1 + 48);
  v9 = a2;
  v10 = CUDescriptionWithLevel(a3, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  NSAppendPrintF(&obj, "    ID %@ %@\n", v9, v11);

  objc_storeStrong((id *)(v7 + 40), obj);
  if ((int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(id *)(v12 + 40);
    NSAppendPrintF(&v13, "Skipping remaining devices ...\n");
    objc_storeStrong((id *)(v12 + 40), v13);
    *a4 = 1;
  }
}

void sub_10009701C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  id obj;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("serviceType")));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v5, "state");

  NSAppendPrintF(&obj, "    %@ : %@, state %d, token %@\n", v8, v9, v11, v6);
  objc_storeStrong((id *)(v10 + 40), obj);

}

void sub_100097100(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  id obj;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("serviceType")));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v5, "state");

  NSAppendPrintF(&obj, "    %@ : %@, state %d, token %@\n", v8, v9, v11, v6);
  objc_storeStrong((id *)(v10 + 40), obj);

}

id sub_10009723C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_activate");
}

id sub_100097438(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_100097440(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_100097448(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

id sub_1000974A8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_100098DA0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(unsigned __int8 *)(a1 + 40);
  if (v7 != objc_msgSend(v6, "state"))
  {
    v8 = *(void **)(a1 + 32);
    v17 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_acquireRBSAssertionForEntry:error:", v6, &v17));
    v10 = v17;
    if (!v10)
    {
      objc_msgSend(v6, "setState:", *(unsigned __int8 *)(a1 + 40));
      v11 = objc_msgSend(v5, "unsignedLongLongValue");
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery]_block_invoke", 30, "Changed discovery XPC matching token %llu, state %d\n", v11, *(unsigned __int8 *)(a1 + 40));
      }
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handler"));
      if (v12)
      {
        if (*(_BYTE *)(a1 + 40))
          v13 = 6;
        else
          v13 = 5;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100098F2C;
        v14[3] = &unk_1001147D0;
        v16 = v11;
        v15 = v9;
        ((void (**)(_QWORD, uint64_t, _QWORD, _QWORD *))v12)[2](v12, v13, 0, v14);

      }
    }

  }
}

void sub_100098F2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _updateXPCMatchingDiscovery]_block_invoke_2", 30, "Received XPC reply for token %llu\n", *(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "invalidate");

}

void sub_1000992B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "showPasswordHandler"));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);

}

void sub_100099318(uint64_t a1, uint64_t a2)
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hidePasswordHandler"));
  if (v3)
  {
    v4 = v3;
    v3[2](v3, a2);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

void sub_100099360(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "peerDeviceInfo"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "verifiedIdentity"));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 296);
    *(_QWORD *)(v5 + 296) = v4;

    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _connectionConfigureCommon:]_block_invoke_3", 30, "Discovery session state change after authenticating session paired device: %@\n", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296));
    }
  }
}

_DWORD *sub_100099AA4(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[14] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_clientBLEDiscoveryDeviceFound:", a2);
  return result;
}

_DWORD *sub_100099AC8(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[14] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_clientBLEDiscoveryDeviceLost:", a2);
  return result;
}

_DWORD *sub_100099AEC(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[14] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_clientBLEDiscoveryDeviceFound:", a2);
  return result;
}

uint64_t sub_100099B10(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(*(_QWORD *)(result + 32) + 56);
  if (v1 == *(_DWORD *)(result + 40) && dword_100131A18 <= 30)
  {
    if (dword_100131A18 != -1)
      return LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]_block_invoke_4", 30, "BLE discovery interrupted ID %u\n", v1);
    v2 = result;
    result = _LogCategory_Initialize(&dword_100131A18, 30);
    if ((_DWORD)result)
    {
      v1 = *(_DWORD *)(v2 + 40);
      return LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]_block_invoke_4", 30, "BLE discovery interrupted ID %u\n", v1);
    }
  }
  return result;
}

void sub_100099BA4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]_block_invoke_5", 90, "### BLE discovery start failed: %{error}\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

    goto LABEL_10;
  }
  if (dword_100131A18 <= 30)
  {
    v8 = 0;
    if (dword_100131A18 != -1 || (v7 = _LogCategory_Initialize(&dword_100131A18, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryEnsureStarted:]_block_invoke_5", 30, "BLE discovery started\n");
LABEL_10:
      v4 = v8;
    }
  }

}

void sub_100099DA0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  const char *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (dword_100131A18 <= 90)
    {
      v8 = v3;
      if (dword_100131A18 != -1 || (v7 = _LogCategory_Initialize(&dword_100131A18, 90), v4 = v8, v7))
      {
        v5 = *(_DWORD *)(a1 + 32);
        if (v5 >= 0x20000)
        {
          if (v5 >= 327680)
          {
            if (v5 >= 589824)
            {
              if (v5 <= 2147418111)
              {
                switch(v5)
                {
                  case 589824:
                    v6 = "FindNearbyRemote";
                    break;
                  case 589825:
                    v6 = "FindNearbyPencil";
                    break;
                  case 655360:
                    v6 = "AccessDigitalHomeKey";
                    break;
                  default:
LABEL_119:
                    v6 = "?";
                    break;
                }
              }
              else
              {
                switch(v5)
                {
                  case 2147418112:
                    v6 = "InternalTestNoLockScan";
                    break;
                  case 2147418113:
                    v6 = "InternalTestNoScreenOffScan";
                    break;
                  case 2147418114:
                    v6 = "InternalTestScanWithNoDups";
                    break;
                  case 2147418115:
                    v6 = "InternalTestScanWithDups";
                    break;
                  case 2147418116:
                    v6 = "InternalTestScanFor20Seconds";
                    break;
                  case 2147418117:
                    v6 = "InternalTestActiveScan";
                    break;
                  case 2147418118:
                    v6 = "InternalTestUUIDScan";
                    break;
                  case 2147418119:
                    v6 = "InternalTestScanFor10ClockSeconds";
                    break;
                  case 2147418120:
                    v6 = "InternalTestScanBoost";
                    break;
                  default:
                    goto LABEL_119;
                }
              }
            }
            else if (v5 > 458752)
            {
              switch(v5)
              {
                case 524288:
                  v6 = "ADPD";
                  break;
                case 524289:
                  v6 = "ADPDBuffer";
                  break;
                case 524290:
                  v6 = "MicroLocation";
                  break;
                case 524291:
                  v6 = "MicroLocationLeech";
                  break;
                default:
                  if (v5 == 458753)
                  {
                    v6 = "PrecisionFindingFindee";
                  }
                  else
                  {
                    if (v5 != 458754)
                      goto LABEL_119;
                    v6 = "PrecisionFindingFindeeHighPriority";
                  }
                  break;
              }
            }
            else
            {
              switch(v5)
              {
                case 393216:
                  v6 = "CaptiveNetworkJoin";
                  break;
                case 393217:
                  v6 = "UseCaseSIMTransfer";
                  break;
                case 393218:
                  v6 = "MacSetup";
                  break;
                case 393219:
                  v6 = "AppleIDSignIn";
                  break;
                case 393220:
                  v6 = "AppleIDSignInSettings";
                  break;
                default:
                  if (v5 == 327680)
                  {
                    v6 = "RapportThirdParty";
                  }
                  else
                  {
                    if (v5 != 458752)
                      goto LABEL_119;
                    v6 = "PrecisionFindingFinder";
                  }
                  break;
              }
            }
          }
          else
          {
            switch(v5)
            {
              case 131072:
                v6 = "SharingDefault";
                break;
              case 131073:
                v6 = "SharingPhoneAutoUnlock";
                break;
              case 131074:
                v6 = "SharingSiriWatchAuth";
                break;
              case 131075:
                v6 = "SharingMacAutoUnlock";
                break;
              case 131076:
                v6 = "SharingEDTScreenOn";
                break;
              case 131077:
                v6 = "SharingEDTWiFiDisabled";
                break;
              case 131078:
                v6 = "SharingEDTWombatEligibleAsDefaultCamera";
                break;
              case 131079:
                v6 = "SharingEDTWombatCameraPicker";
                break;
              case 131080:
                v6 = "SharingWombatBackground";
                break;
              case 131081:
                v6 = "SharingUniversalControl";
                break;
              case 131082:
                v6 = "SharingPeopleProximity";
                break;
              case 131083:
                v6 = "SharingEDTEnsembleOpenDisplayPrefs";
                break;
              case 131084:
                v6 = "SharingEDTNearbydMotionStopped";
                break;
              case 131085:
                v6 = "SharingDoubleBoostGenericScan";
                break;
              case 131086:
                v6 = "SharingEDTIncomingAdvertisement ";
                break;
              case 131087:
                v6 = "SharingEDTWombatStreamStart";
                break;
              case 131088:
                v6 = "SharingOYAutoUnlock";
                break;
              case 131089:
                goto LABEL_119;
              case 131090:
                v6 = "SharingAirDrop";
                break;
              case 131091:
                v6 = "SharingNearbyInvitationHost";
                break;
              case 131092:
                v6 = "SharingNearbyInvitationParticipant";
                break;
              case 131093:
                v6 = "SharingAirDropAskToAirDrop";
                break;
              case 131094:
                v6 = "SharingAirDropTempIdentity";
                break;
              case 131095:
                v6 = "SharingAirDropNeedsCLink";
                break;
              case 131096:
                v6 = "SharingRemoteWidgetUpdate";
                break;
              case 131097:
                v6 = "SharingCountryCodeUpdate";
                break;
              case 131098:
                v6 = "SharingMacPhoneAutoUnlock";
                break;
              case 131099:
                v6 = "SharingVisionProDiscovery";
                break;
              case 131100:
                v6 = "SharingVisionProStateChange";
                break;
              case 131101:
                v6 = "SharingContinuityScreen";
                break;
              case 131102:
                v6 = "SharingEDTRemoteDisplay";
                break;
              default:
                if (v5 == 196608)
                {
                  v6 = "DigitalIDTSA";
                }
                else
                {
                  if (v5 != 0x40000)
                    goto LABEL_119;
                  v6 = "DigitalCarKeyThirdParty";
                }
                break;
            }
          }
        }
        else
        {
          v6 = "Unspecified";
          switch(v5)
          {
            case 0:
              break;
            case 1:
              v6 = "HealthKit";
              break;
            case 2:
              v6 = "HomeKit";
              break;
            case 3:
              v6 = "FindMyObjectConnection";
              break;
            case 4:
              v6 = "FindMyObjectConnectionTransient";
              break;
            case 5:
              v6 = "MIDI";
              break;
            case 6:
              v6 = "Continuity";
              break;
            case 7:
              v6 = "InstantHotSpot";
              break;
            case 8:
              v6 = "NearBy";
              break;
            case 9:
              v6 = "Sharing";
              break;
            case 10:
              v6 = "HearingSupport";
              break;
            case 11:
              v6 = "Magnet";
              break;
            case 12:
              v6 = "HID";
              break;
            case 13:
              v6 = "LEA";
              break;
            case 14:
              v6 = "External";
              break;
            case 15:
              v6 = "ExternalMedical";
              break;
            case 16:
              v6 = "ExternalLock";
              break;
            case 17:
              v6 = "ExternalWatch";
              break;
            case 18:
              v6 = "SmartRouting";
              break;
            case 19:
              v6 = "DigitalID";
              break;
            case 20:
              v6 = "DigitalKey";
              break;
            case 21:
              v6 = "DigitalCarKey";
              break;
            case 22:
              v6 = "HeySiri";
              break;
            case 23:
              v6 = "ThirdPartyApp";
              break;
            case 24:
              v6 = "CNJ";
              break;
            default:
              switch(v5)
              {
                case 256:
                  v6 = "DevicePresenceDetection";
                  break;
                case 257:
                  v6 = "AudioBox";
                  break;
                case 258:
                  v6 = "SIMTransfer";
                  break;
                case 259:
                  v6 = "ProximityScreenOnLeechScan";
                  break;
                case 260:
                  v6 = "MacMigrate";
                  break;
                case 263:
                  v6 = "HIDUARTService";
                  break;
                case 264:
                  v6 = "AccessibilitySwitchControlPairing";
                  break;
                case 265:
                  v6 = "BaseBandFastConnect";
                  break;
                case 266:
                  v6 = "SafetyAlerts";
                  break;
                case 267:
                  v6 = "LECarPlay";
                  break;
                case 268:
                  v6 = "TCCBluetooth";
                  break;
                case 269:
                  v6 = "AOPBufferLeech";
                  break;
                default:
                  goto LABEL_119;
              }
              break;
          }
        }
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _bleDiscoveryTriggerEnhancedDiscovery:useCase:]_block_invoke", 90, "### Failed to trigger enhanced discovery for %s with error: %@", v6, v4);
        v4 = v8;
      }
    }
  }

}

id sub_10009AF98()
{
  if (qword_100132318 != -1)
    dispatch_once(&qword_100132318, &stru_100114C78);
  return (id)qword_100132310;
}

void sub_10009B6EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStarted]_block_invoke", 90, "### BLE NeedsAWDL advertiser failed: %@\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = 0;

    goto LABEL_10;
  }
  if (dword_100131A18 <= 30)
  {
    v8 = 0;
    if (dword_100131A18 != -1 || (v7 = _LogCategory_Initialize(&dword_100131A18, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientBLENeedsAWDLAdvertiserEnsureStarted]_block_invoke", 30, "BLE NeedsAWDL advertiser started\n");
LABEL_10:
      v4 = v8;
    }
  }

}

void sub_10009BC18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = 0;

  }
}

_QWORD *sub_10009C60C(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[19])
    return objc_msgSend(result, "_clientBonjourFoundDevice:reevaluate:", a2, 0);
  return result;
}

void sub_10009C628(uint64_t a1, void *a2)
{
  _QWORD *v2;
  id v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[19])
  {
    v4 = a2;
    objc_msgSend(v2, "_clientBonjourLostDevice:", v4);
    objc_msgSend(*(id *)(a1 + 32), "_clientBonjourLostUnresolvedDevice:", v4);

  }
}

_QWORD *sub_10009C68C(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[19])
    return objc_msgSend(result, "_clientBonjourFoundDevice:reevaluate:", a2, 0);
  return result;
}

id sub_10009D2F4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 496));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 496);
  *(_QWORD *)(v2 + 496) = 0;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "count");
  if (result)
    return _objc_msgSend(*(id *)(a1 + 32), "_processPendingLostDevices");
  return result;
}

_QWORD *sub_10009DD80(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[20])
    return _objc_msgSend(result, "_clientBonjourAWDLBrowserFoundDevice:", a2);
  return result;
}

_QWORD *sub_10009DD98(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[20])
    return _objc_msgSend(result, "_clientBonjourAWDLBrowserLostDevice:", a2);
  return result;
}

_QWORD *sub_10009DDB0(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[20])
    return _objc_msgSend(result, "_clientBonjourAWDLBrowserFoundDevice:", a2);
  return result;
}

void sub_10009F218(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  if (v3)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
    }
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[2] = sub_10009F378;
    v8[3] = &unk_100112E68;
    v12 = *(_BYTE *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = v5;
    v8[1] = 3221225472;
    v11 = v6;
    objc_msgSend(v9, "sendEventID:event:options:completion:", CFSTR("_rdNeedsAWDL"), v4, 0, v8);
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      if (*(_BYTE *)(a1 + 65))
        v7 = "enable";
      else
        v7 = "disable";
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _clientSendNeedsAWDLOverWiFi:]_block_invoke", 30, "Sent NeedsAWDL %s event over WiFi\n", v7);
    }
  }

}

void sub_10009F378(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
    }
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 368);
    if (!v3)
    {
      v4 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 368);
      *(_QWORD *)(v5 + 368) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 368);
    }
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

_DWORD *sub_10009FA2C(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[26] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_serverBLENeedsAWDLScannerDeviceFound:", a2);
  return result;
}

_DWORD *sub_10009FA50(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[26] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_serverBLENeedsAWDLScannerDeviceLost:", a2);
  return result;
}

_DWORD *sub_10009FA74(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[26] == *(_DWORD *)(a1 + 40))
    return _objc_msgSend(result, "_serverBLENeedsAWDLScannerDeviceFound:", a2);
  return result;
}

void sub_10009FA98(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStarted]_block_invoke_4", 90, "### BLE NeedsAWDL scanner start failed: %{error}\n", v8);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "invalidate");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = 0;

    goto LABEL_10;
  }
  if (dword_100131A18 <= 30)
  {
    v8 = 0;
    if (dword_100131A18 != -1 || (v7 = _LogCategory_Initialize(&dword_100131A18, 30), v4 = 0, v7))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENeedsAWDLScannerEnsureStarted]_block_invoke_4", 30, "BLE NeedsAWDL scanner started\n");
LABEL_10:
      v4 = v8;
    }
  }

}

void sub_1000A01E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dispatchQueue"));

    if (v9)
      _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateUseCase:bleScanRate:bleScanRateScreenOff:", a2, a3, a4);
  }
}

id sub_1000A0268(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 568));
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void sub_1000A0294(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 568));
    objc_msgSend(*(id *)(a1 + 32), "_serverBLENearbyActionV2DiscoveryEnsureStopped");
LABEL_3:
    v4 = v6;
    goto LABEL_8;
  }
  if (dword_100131A18 <= 30)
  {
    v6 = 0;
    if (dword_100131A18 != -1 || (v5 = _LogCategory_Initialize(&dword_100131A18, 30), v4 = 0, v5))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverBLENearbyActionV2DiscoveryEnsureStarted]_block_invoke_3", 30, "BLE NearbyActionV2 discovery started\n");
      goto LABEL_3;
    }
  }
LABEL_8:

}

void sub_1000A0F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000A0FB0(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(a3, "linkType");
  if ((_DWORD)result == 4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_1000A1214(id a1, CUTCPConnection *a2)
{
  -[CUTCPConnection setKeepAliveSeconds:](a2, "setKeepAliveSeconds:", 10);
}

_QWORD *sub_1000A1220(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[53])
    return objc_msgSend(result, "_serverTCPHandleConnectionStarted:", a2);
  return result;
}

void sub_1000A1238(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a2;
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
  {
    v10 = v7;
LABEL_17:

    goto LABEL_18;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tcpConnection"));

      if (v14 == v5)
      {
        v15 = v13;

        v10 = v15;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v9);

  if (v10)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverTCPEnsureStarted]_block_invoke_3", 30, "Remove buffered incoming connection on end: %@, %{error}\n", v5, v6, (_QWORD)v16);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeObject:", v10);
    goto LABEL_17;
  }
LABEL_18:

}

void sub_1000A156C(id a1, NSNumber *a2, RPConnection *a3, BOOL *a4)
{
  -[RPConnection invalidate](a3, "invalidate");
}

void sub_1000A1804(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "client"));
  objc_msgSend(v2, "sessionEndedWithID:netCnx:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_update");

}

void sub_1000A185C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  RPReceivedMessageEntry *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_receivedEventID:event:options:sessionID:", v13, v7, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v11 = objc_alloc_init(RPReceivedMessageEntry);
    -[RPReceivedMessageEntry setEventID:](v11, "setEventID:", v13);
    -[RPReceivedMessageEntry setEvent:](v11, "setEvent:", v7);
    -[RPReceivedMessageEntry setOptions:](v11, "setOptions:", v8);
    -[RPReceivedMessageEntry setSessionID:](v11, "setSessionID:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "receivedMessages"));
    objc_msgSend(v12, "addObject:", v11);

  }
}

void sub_1000A194C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  RPReceivedMessageEntry *v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client"));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "_receivedRequestID:request:options:responseHandler:sessionID:", v16, v9, v10, v11, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v14 = objc_alloc_init(RPReceivedMessageEntry);
    -[RPReceivedMessageEntry setRequestID:](v14, "setRequestID:", v16);
    -[RPReceivedMessageEntry setRequest:](v14, "setRequest:", v9);
    -[RPReceivedMessageEntry setOptions:](v14, "setOptions:", v10);
    -[RPReceivedMessageEntry setResponseHandler:](v14, "setResponseHandler:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "receivedMessages"));
    objc_msgSend(v15, "addObject:", v14);

  }
}

id sub_1000A1A50(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_serverHandleSessionStartWithID:netCnx:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void sub_1000A1A80(uint64_t a1, int a2)
{
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = objc_msgSend(*(id *)(a1 + 32), "passwordType");
  if (a2 == 1 && v4 == 10 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 296))
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverTCPHandleConnectionStarted:]_block_invoke_5", 30, "Discovery session state change after server session setup of session paired device\n");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_findMatchingDeviceWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 296)));
    if (v5)
    {
      v9 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cameraCapabilities"));

      v5 = v9;
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 40), "_changeDiscoverySessionStateForDevice:startReason:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 296), 1);
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(void **)(v7 + 296);
        *(_QWORD *)(v7 + 296) = 0;

        v5 = v9;
      }
    }

  }
}

void sub_1000A22C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  (*(void (**)(void))(a14 + 16))();
  _Unwind_Resume(a1);
}

uint64_t (**sub_1000A2328(uint64_t a1))(id, _QWORD)
{
  uint64_t (**result)(id, _QWORD);

  result = *(uint64_t (***)(id, _QWORD))(a1 + 48);
  if (result)
    result = (uint64_t (**)(id, _QWORD))result[2](result, *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 32))
    return (uint64_t (**)(id, _QWORD))objc_msgSend(*(id *)(a1 + 40), "invalidate");
  return result;
}

void sub_1000A2370(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverHandleSessionStartWithID:netCnx:completion:]_block_invoke_2", 30, "Received XPC reply for token %llu\n", objc_msgSend(*(id *)(a1 + 32), "token"));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 568));
  v6 = *(void **)(a1 + 48);
  if (v6)
    objc_msgSend(v6, "invalidate");

}

void sub_1000A2424(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void sub_1000A2554(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsIdentifier"));

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsIdentifier"));
    objc_msgSend(v5, "addObject:", v6);

  }
}

void sub_1000A25BC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peerDeviceInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

void sub_1000A280C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  if (v3)
  {
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverRegisterForIncomingMessages]_block_invoke", 30, "### Failed to activate CLink client to receive incoming messages: %@\n", v3);
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 392);
    *(_QWORD *)(v6 + 392) = 0;

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 392);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A28FC;
    v8[3] = &unk_100112AE0;
    v8[4] = v4;
    objc_msgSend(v5, "registerEventID:options:handler:", CFSTR("_rdNeedsAWDL"), 0, v8);
  }

}

void sub_1000A28FC(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 568);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  objc_msgSend(*(id *)(a1 + 32), "_serverReceivedNeedsAWDLEvent:", v4);

}

void sub_1000A2BAC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 376);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 376);
    *(_QWORD *)(v4 + 376) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 360))
  {
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _serverReceivedNeedsAWDLEvent:]_block_invoke", 90, "### Removing expired NeedsAWDL requests\n");
    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 360);
    *(_QWORD *)(v6 + 360) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_update");
  }
}

id sub_1000A2D80(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_btAddressChanged");
}

id sub_1000A2D88(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_btAddressChanged");
}

void sub_1000A3CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A3D34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (dword_100131A18 <= 90)
  {
    if (dword_100131A18 != -1)
    {
LABEL_4:
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _startPairingServerWithPassword:completion:]_block_invoke", 90, "### Pairing server can not be started: %@\n", v2);
      goto LABEL_6;
    }
    if (_LogCategory_Initialize(&dword_100131A18, 90))
    {
      v2 = *(_QWORD *)(a1 + 32);
      goto LABEL_4;
    }
  }
LABEL_6:
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 136))
  {
    *(_BYTE *)(v3 + 136) = 0;
    objc_msgSend(*(id *)(a1 + 40), "_update");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id sub_1000A41F4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearCameraCapabilitiesRefetchTimer");
  return objc_msgSend(*(id *)(a1 + 40), "_requestCameraCapabilitiesForDevice:", *(_QWORD *)(a1 + 32));
}

void sub_1000A490C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4 == *(void **)(*(_QWORD *)(a1 + 40) + 224))
  {
    if (v3)
    {
      if (dword_100131A18 <= 90
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForIncomingMessages]_block_invoke", 90, "### Failed to activate a client to register for camera capabilities update events: %@\n", v3);
      }
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 224);
      *(_QWORD *)(v6 + 224) = 0;

      objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dispatchQueue"));
      dispatch_assert_queue_V2(v5);

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000A4AF0;
      v12[3] = &unk_100114A08;
      v13 = *(_OWORD *)(a1 + 32);
      objc_msgSend((id)v13, "registerEventID:options:handler:", CFSTR("_camCapUpdate"), 0, v12);
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForIncomingMessages]_block_invoke", 30, "Registered for camera capabilities update event\n");
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000A4C18;
      v10[3] = &unk_100114A30;
      v11 = *(_OWORD *)(a1 + 32);
      objc_msgSend((id)v11, "registerRequestID:options:handler:", CFSTR("_ccConfirmResp"), 0, v10);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000A4D74;
      v8[3] = &unk_100114A08;
      v9 = *(_OWORD *)(a1 + 32);
      objc_msgSend((id)v9, "registerEventID:options:handler:", CFSTR("_ccExit"), 0, v8);
    }
  }

}

void sub_1000A4AF0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v6 + 224))
  {
    v14 = v5;
    v7 = *(NSObject **)(v6 + 568);
    v8 = a3;
    dispatch_assert_queue_V2(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderIDS")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_findMatchingDeviceWithIdentifier:", v9));
    v11 = v10;
    if (v10)
    {
      v12 = *(void **)(a1 + 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cameraCapabilities"));
      objc_msgSend(v12, "_receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:", v14, v11, v13 == 0);

    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForIncomingMessages]_block_invoke_2", 90, "### Rejected camera capabilities update, device not found with ID: %@\n", v9);
    }

    v5 = v14;
  }

}

void sub_1000A4C18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v8 + 224))
  {
    v15 = v7;
    v9 = *(NSObject **)(v8 + 568);
    v10 = a4;
    v11 = a3;
    dispatch_assert_queue_V2(v9);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("senderIDS")));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "objectForKeyedSubscript:", v12));
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "invalidate");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "setObject:forKeyedSubscript:", 0, v12);
      }

      objc_msgSend(*(id *)(a1 + 40), "_handleConfirmationResult:fromDevice:", v15, v12);
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForIncomingMessages]_block_invoke_3", 90, "### Received continuity camera confirmation but sender's IDS ID: %@\n", 0);
    }

    v7 = v15;
  }

}

void sub_1000A4D74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v6 + 224))
  {
    v10 = v5;
    v7 = *(NSObject **)(v6 + 568);
    v8 = a3;
    dispatch_assert_queue_V2(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderIDS")));

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "_receivedCameraExitEvent:from:", v10, v9);
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForIncomingMessages]_block_invoke_4", 90, "### Received continuity camera exit session but sender's IDS ID: %@\n", 0);
    }

    v5 = v10;
  }

}

void sub_1000A51E4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  int v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[6];
  id v19;
  uint64_t v20;

  v3 = a2;
  if (!v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A5524;
    v18[3] = &unk_100114A58;
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(a1 + 32);
    v18[4] = *(_QWORD *)(a1 + 48);
    v18[5] = v9;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 56);
    v19 = v10;
    v20 = v11;
    objc_msgSend(v9, "sendRequestID:request:options:responseHandler:", CFSTR("_camCap"), v5, 0, v18);

    goto LABEL_36;
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "setCameraCapabilityRequestIsActive:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identitiesOfType:error:", 13, 0));

  if (objc_msgSend(v3, "code") == (id)-6727)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_findMatchingDeviceWithIdentifier:", *(_QWORD *)(a1 + 56)));

    v7 = dword_100131A18;
    if (v6)
    {
      if (dword_100131A18 > 30)
      {
        v15 = 1;
        v16 = 5;
        goto LABEL_28;
      }
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]_block_invoke", 30, "Using faster interval(5s) to refetch camera capabilities, there is an existing device\n");
      v15 = 1;
      v16 = 5;
      goto LABEL_27;
    }
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
      {
        v12 = *(_QWORD *)(a1 + 56);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_findMatchingDeviceWithIdentifier:", v12));
        v14 = "yes";
        if (!v13)
          v14 = "no";
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]_block_invoke", 30, "Not scheduling camera capabilities, deviceIdentifier: %@ device known: %s\n", v12, v14);

      }
LABEL_26:
      v16 = 0;
      v15 = 0;
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  if (((unint64_t)objc_msgSend(*(id *)(a1 + 40), "statusFlags") & 0x2000000000) != 0
    && !objc_msgSend(v5, "count"))
  {
    v7 = dword_100131A18;
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30))
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]_block_invoke", 30, "Not scheduling camera capabilities, deviceIdentifier %@ statusFlags %#ll{flags}", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "statusFlags"), &unk_10010B429);
      goto LABEL_26;
    }
LABEL_20:
    v16 = 0;
    v15 = 0;
    goto LABEL_28;
  }
  v16 = 0;
  v15 = 1;
LABEL_27:
  v7 = dword_100131A18;
LABEL_28:
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
  {
    v17 = "no";
    if (v15)
      v17 = "yes";
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]_block_invoke", 90, "### Failed to activate a client to remote display device %@: %@, reschedule: %s\n", *(_QWORD *)(a1 + 56), v3, v17);
  }
  if (v15)
    objc_msgSend(*(id *)(a1 + 48), "_scheduleCameraCapabilitiesRequest:interval:", *(_QWORD *)(a1 + 40), v16);
LABEL_36:

}

void sub_1000A5524(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 568));
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 48), "setCameraCapabilityRequestIsActive:", 0);
  if (v6)
  {
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]_block_invoke_2", 90, "### Failed to send request to get camera capabilities: %@\n", v6);
    }
    objc_msgSend(*(id *)(a1 + 32), "_scheduleCameraCapabilitiesRequest:interval:", *(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_findMatchingDeviceWithIdentifier:", *(_QWORD *)(a1 + 56)));
    v8 = v7;
    if (v7)
    {
      v9 = *(void **)(a1 + 32);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cameraCapabilities"));
      objc_msgSend(v9, "_receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:", v11, v8, v10 == 0);

    }
    else if (dword_100131A18 <= 30
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestCameraCapabilitiesForDevice:]_block_invoke_2", 30, "Received camera capabilities but device is not known: %@\n", *(_QWORD *)(a1 + 56));
    }

  }
}

void sub_1000A5944(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
    v3 = v5;
    if (dword_100131A18 <= 90)
    {
      if (dword_100131A18 != -1 || (v4 = _LogCategory_Initialize(&dword_100131A18, 90), v3 = v5, v4))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendCameraCapabilitiesUpdateEventForDevice:]_block_invoke", 90, "### Failed to activate a client to IDS device %@: %@\n", *(_QWORD *)(a1 + 48), v3);
        v3 = v5;
      }
    }
  }

}

void sub_1000A59F4(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 568));
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3[30])
    objc_msgSend(v3, "_clearCameraCapabilitiesUpdateCache");
  v4 = v7;
  if (v7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "invalidate");
    }
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendCameraCapabilitiesUpdateEventForDevice:]_block_invoke_2", 90, "### Failed to send camera capabilities update event to device:%@ error:%@\n", *(_QWORD *)(a1 + 40), v7);
    }

    goto LABEL_14;
  }
  if (dword_100131A18 <= 30)
  {
    if (dword_100131A18 != -1 || (v6 = _LogCategory_Initialize(&dword_100131A18, 30), v4 = 0, v6))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendCameraCapabilitiesUpdateEventForDevice:]_block_invoke_2", 30, "Send camera capabilities update event completed to device: %@\n", *(_QWORD *)(a1 + 40));
LABEL_14:
      v4 = v7;
    }
  }

}

void sub_1000A5CA4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 216))
  {
    if (dword_100131A18 <= 40
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 40)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _cameraCapabilitiesChanged:]_block_invoke", 40, "Continuity camera capabilities change notification\n");
    }
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 208);
    objc_msgSend(*(id *)(a1 + 32), "_updateCameraCapabilities");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
    v4 = v2;
    v5 = v3;
    if (v4 != v5)
    {
      v6 = v5;
      if ((v4 == 0) != (v5 != 0))
      {
        v7 = objc_msgSend(v4, "isEqual:", v5);

        if ((v7 & 1) != 0)
          goto LABEL_24;
      }
      else
      {

      }
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _cameraCapabilitiesChanged:]_block_invoke", 30, "Continuity camera capabilities changed\n");
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceArray"));

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(a1 + 32), "_sendCameraCapabilitiesUpdateEventForDevice:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v12);
      }

      goto LABEL_24;
    }

LABEL_24:
    objc_msgSend(*(id *)(a1 + 32), "_postNotificationForWombatActivity:", 3, (_QWORD)v15);

  }
}

void sub_1000A61B4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4 == *(void **)(*(_QWORD *)(a1 + 40) + 256))
  {
    if (v3)
    {
      if (dword_100131A18 <= 90
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForCameraCapabilitiesRequest]_block_invoke", 90, "### Failed to activate a client to register for camera capabilities request: %@\n", v3);
      }
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 256);
      *(_QWORD *)(v6 + 256) = 0;

      objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dispatchQueue"));
      dispatch_assert_queue_V2(v5);

      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForCameraCapabilitiesRequest]_block_invoke", 30, "Registering for camera capabilities request\n");
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000A6364;
      v10[3] = &unk_100114A30;
      v11 = *(_OWORD *)(a1 + 32);
      objc_msgSend((id)v11, "registerRequestID:options:handler:", CFSTR("_camCap"), 0, v10);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000A64A0;
      v8[3] = &unk_100114A08;
      v9 = *(_OWORD *)(a1 + 32);
      objc_msgSend((id)v9, "registerEventID:options:handler:", CFSTR("_ccExit"), 0, v8);
    }
  }

}

void sub_1000A6364(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t Int64;
  uint64_t v8;
  uint64_t DeviceClass;
  uint64_t v10;
  id v11;

  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256))
  {
    v6 = a4;
    Int64 = CFDictionaryGetInt64(a2, CFSTR("_ccbrc"), 0);
    if (Int64)
    {
      DeviceClass = GestaltGetDeviceClass(Int64, v8);
      if ((_DWORD)DeviceClass == 1 || GestaltGetDeviceClass(DeviceClass, v10) == 3)
        objc_msgSend(*(id *)(a1 + 40), "_postNotificationForWombatActivity:", 3);
    }
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForCameraCapabilitiesRequest]_block_invoke_2", 30, "Responding to camera capabilities request %ld\n", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "count"));
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208), CFSTR("_cCap")));
    (*((void (**)(id, id, _QWORD, _QWORD))v6 + 2))(v6, v11, 0, 0);

  }
}

void sub_1000A64A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256))
  {
    v7 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("senderIDS")));
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "_receivedCameraExitEvent:from:", v7, v6);
    }
    else if (dword_100131A18 <= 90
           && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForCameraCapabilitiesRequest]_block_invoke_3", 90, "### Received continuity camera exit session but sender's IDS ID: %@\n", 0);
    }

    v5 = v7;
  }

}

id sub_1000A67E4(uint64_t a1)
{
  id result;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  unsigned int *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t state64;

  result = (id)*(unsigned int *)(*(_QWORD *)(a1 + 32) + 440);
  if ((_DWORD)result != -1)
  {
    state64 = 0;
    result = (id)notify_get_state((int)result, &state64);
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v3 + 444) != (_DWORD)state64)
    {
      *(_DWORD *)(v3 + 444) = state64;
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        v4 = *(int *)(*(_QWORD *)(a1 + 32) + 444);
        if (v4 > 3)
          v5 = "?";
        else
          v5 = (&off_100114D28)[v4];
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _registerForWombatStateNotifications]_block_invoke", 30, "Received wombat state change notification: %s (0x%x)\n", v5, v4);
      }
      v6 = *(unsigned int **)(a1 + 32);
      v7 = v6[111];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000A68F8;
      v8[3] = &unk_100114868;
      v8[4] = v6;
      return objc_msgSend(v6, "_bluetoothUseCaseFromWombatState:resultBlock:", v7, v8);
    }
  }
  return result;
}

void sub_1000A68F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dispatchQueue"));

    if (v9)
      _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateUseCase:bleScanRate:bleScanRateScreenOff:", a2, a3, a4);
  }
}

void sub_1000A6978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dispatchQueue"));

    if (v9)
      _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateUseCase:bleScanRate:bleScanRateScreenOff:", a2, a3, a4);
  }
}

id sub_1000A6BDC(uint64_t a1)
{
  unsigned int *v2;
  uint64_t v3;
  _QWORD v5[5];

  if (dword_100131A18 <= 20 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 20)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _startObservingOnenessEnabledState]_block_invoke", 20, "Received authentication state change, re-evaluating CBUseCase\n");
  v2 = *(unsigned int **)(a1 + 32);
  v3 = v2[111];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A6C90;
  v5[3] = &unk_100114868;
  v5[4] = v2;
  return objc_msgSend(v2, "_bluetoothUseCaseFromWombatState:resultBlock:", v3, v5);
}

void sub_1000A6C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dispatchQueue"));

    if (v9)
      _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateUseCase:bleScanRate:bleScanRateScreenOff:", a2, a3, a4);
  }
}

void sub_1000A6DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dispatchQueue"));

    if (v9)
      _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateUseCase:bleScanRate:bleScanRateScreenOff:", a2, a3, a4);
  }
}

id sub_1000A73A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

void sub_1000A76F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_1000A7714(_QWORD *result, void *a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v5;

  if (result[4] == a3)
  {
    v5 = result;
    result = objc_msgSend(a2, "unsignedIntValue");
    *(_DWORD *)(*(_QWORD *)(v5[5] + 8) + 24) = (_DWORD)result;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_1000A7994(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountAltDSID"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountAltDSID")),
        v7,
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountAltDSID"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountAltDSID"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountID"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountID"));
  }
  v10 = (void *)v9;
  v11 = v8;
  v12 = v10;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

LABEL_12:
      v15 = 0;
      goto LABEL_13;
    }
    v14 = objc_msgSend(v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_12;
  }
  v15 = 1;
LABEL_13:

  return v15;
}

id sub_1000A7B6C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToDevice:");
}

void sub_1000A7C64(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A7CE0;
  v5[3] = &unk_100114B70;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void sub_1000A7CE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  char v31;

  v5 = a2;
  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 576);
    if (!v7
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
          v9 = objc_msgSend(v7, "isEqualToString:", v8),
          v8,
          (v9 & 1) == 0))
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000A7F10;
      v28[3] = &unk_100114B48;
      v31 = *(_BYTE *)(a1 + 48);
      v10 = v5;
      v11 = *(_QWORD *)(a1 + 32);
      v29 = v10;
      v30 = v11;
      v12 = objc_retainBlock(v28);
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
      if (!v13)
      {
        v14 = objc_alloc_init((Class)NSMutableDictionary);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v15 + 504);
        *(_QWORD *)(v15 + 504) = v14;

        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
      }
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));
      if (v17)
      {
        v18 = (id)v17;
        ((void (*)(_QWORD *, uint64_t))v12[2])(v12, v17);
      }
      else
      {
        v19 = objc_alloc_init((Class)RPCompanionLinkClient);
        v20 = objc_alloc_init((Class)RPCompanionLinkDevice);
        objc_msgSend(v20, "setIdentifier:", v10);
        objc_msgSend(v19, "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));
        objc_msgSend(v19, "setDestinationDevice:", v20);
        objc_msgSend(v19, "setControlFlags:", 6);
        objc_msgSend(v19, "setServiceType:", CFSTR("com.apple.devicediscoveryui.rapportwake"));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000A81D0;
        v23[3] = &unk_1001122A8;
        v18 = v19;
        v21 = *(_QWORD *)(a1 + 32);
        v24 = v18;
        v25 = v21;
        v22 = v10;
        v26 = v22;
        v27 = v12;
        objc_msgSend(v18, "activateWithCompletion:", v23);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setObject:forKeyedSubscript:", v18, v22);

      }
    }
  }

}

void sub_1000A7F10(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
  {
    v5 = "confirm-dedicated";
    if (!v4)
      v5 = "confirm";
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]_block_invoke_3", 30, "Sending continuity camera '%s' message to device: %@\n", v5, *(_QWORD *)(a1 + 32));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 512), "UUIDString"));
  if (v4)
    v7 = 3;
  else
    v7 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, CFSTR("sesID"), v8, CFSTR("actionType"), 0));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A80A8;
  v11[3] = &unk_100114B20;
  v12 = *(id *)(a1 + 32);
  v13 = v3;
  v14 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  objc_msgSend(v10, "sendRequestID:request:options:responseHandler:", CFSTR("_ccConfirmStart"), v9, 0, v11);

}

void sub_1000A80A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (dword_100131A18 > 90)
      goto LABEL_10;
    if (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90))
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]_block_invoke_4", 90, "### Received error in response to confirmation message from device: %@: %@\n", *(_QWORD *)(a1 + 32), v8);
  }
  if (dword_100131A18 <= 40 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 40)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]_block_invoke_4", 40, "Received response dict %@ from device %@\n", v9, *(_QWORD *)(a1 + 32));
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 504), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

}

void sub_1000A81D0(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _requestConfirmationFromDevicesMatching:forDedicated:]_block_invoke_5", 90, "### Failed to activate a client to remote display device %@: %@\n", *(_QWORD *)(a1 + 48), v3);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_1000A8880(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendConfirmationCancelToAllDevices]_block_invoke", 30, "Sending continuity camera '%s' message to device: %@\n", "cancel", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v7, CFSTR("sesID"), v8, CFSTR("actionType"), 0));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A8A00;
  v12[3] = &unk_100114BC0;
  v13 = v6;
  v14 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v11, "sendRequestID:request:options:responseHandler:", CFSTR("_ccConfirmStart"), v9, 0, v12);

}

void sub_1000A8A00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  int v6;
  int v7;
  id v8;

  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v5 = v8;
  if (v8)
  {
    if (dword_100131A18 <= 90)
    {
      if (dword_100131A18 != -1 || (v6 = _LogCategory_Initialize(&dword_100131A18, 90), v5 = v8, v6))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendConfirmationCancelToAllDevices]_block_invoke_2", 90, "### Failed to send cancellation for continuity camera confirmation to device %@: %@\n", *(_QWORD *)(a1 + 40), v5);
LABEL_8:
        v5 = v8;
      }
    }
  }
  else if (dword_100131A18 <= 30)
  {
    if (dword_100131A18 != -1 || (v7 = _LogCategory_Initialize(&dword_100131A18, 30), v5 = 0, v7))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendConfirmationCancelToAllDevices]_block_invoke_2", 30, "Sent cancellation for continuity camera confirmation to device %@\n", *(_QWORD *)(a1 + 40));
      goto LABEL_8;
    }
  }

}

void sub_1000A8DD8(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[7];

  v3 = a2;
  v4 = (void *)a1[4];
  if (v3)
  {
    objc_msgSend(v4, "invalidate");
    if (dword_100131A18 <= 90
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendDiscoverySessionExitWithReason:]_block_invoke", 90, "### Failed to activate a client to remote display device %@: %@\n", a1[5], v3);
    }
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A8EC0;
    v6[3] = &unk_100114AA8;
    v5 = a1[6];
    v6[4] = a1[7];
    v6[5] = v4;
    v6[6] = a1[5];
    objc_msgSend(v4, "sendEventID:event:options:completion:", CFSTR("_ccExit"), v5, 0, v6);
  }

}

void sub_1000A8EC0(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  id v6;

  v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 568));
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v3 = v6;
  if (v6)
  {
    if (dword_100131A18 <= 90)
    {
      if (dword_100131A18 != -1 || (v4 = _LogCategory_Initialize(&dword_100131A18, 90), v3 = v6, v4))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendDiscoverySessionExitWithReason:]_block_invoke_2", 90, "### Failed to send request to exit session: %@\n", v3);
LABEL_8:
        v3 = v6;
      }
    }
  }
  else if (dword_100131A18 <= 30)
  {
    if (dword_100131A18 != -1 || (v5 = _LogCategory_Initialize(&dword_100131A18, 30), v3 = 0, v5))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _sendDiscoverySessionExitWithReason:]_block_invoke_2", 30, "Sent camera exit session to device %@\n", *(_QWORD *)(a1 + 48));
      goto LABEL_8;
    }
  }

}

id sub_1000A94EC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 312);
    *(_QWORD *)(v4 + 312) = 0;

  }
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _startDiscoverySessionExpirationTimer]_block_invoke", 30, "Discovery session expiration timer, exiting the session");
  return objc_msgSend(*(id *)(a1 + 32), "_changeDiscoverySessionStateForDevice:startReason:", 0, 0);
}

void sub_1000A96B8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 320);
    *(_QWORD *)(v4 + 320) = 0;

  }
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[72])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_findMatchingDeviceWithIdentifier:"));
    v10 = v7;
    if (!v7 || (v8 = objc_msgSend(v7, "inDiscoverySession"), v9 = v10, (v8 & 1) == 0))
    {
      if (dword_100131A18 <= 30
        && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayDaemon _startInSessionDeviceLostTimer]_block_invoke", 30, "Discovery session ended due to in-session device lost timer");
      }
      objc_msgSend(*(id *)(a1 + 32), "_changeDiscoverySessionStateForDevice:startReason:", 0, 0);
      v9 = v10;
    }

  }
}

void sub_1000A9D44(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "client"));
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
    objc_msgSend(v5, "invalidate");

}

id sub_1000AA34C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_authCompletion:", a2);
}

id sub_1000AA358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_promptForPasswordWithFlags:throttleSeconds:", a2, a3);
}

id sub_1000AA368(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionEndedWithID:netCnx:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_1000AA378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedEventID:event:options:sessionID:", a2, a3, a4, *(_QWORD *)(a1 + 40));
}

id sub_1000AA390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedRequestID:request:options:responseHandler:sessionID:", a2, a3, a4, a5, *(_QWORD *)(a1 + 40));
}

id sub_1000AA3AC(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint8_t v19[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingInfo"));

  if (!v4)
  {
    if (a2 != 1)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "_update");
LABEL_14:
    v8 = objc_msgSend(*(id *)(a1 + 48), "linkType");
    v9 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v9 + 40))
    {
      v10 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 80), "remoteObjectProxy"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
      objc_msgSend(v11, "remoteDisplayUpdateDataLinkType:", v12);

    }
    v13 = sub_10009AF98();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = sub_10009AF98();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 40));

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, v17, "RPConnectionStateReady", "RPConnectionStateReady", v19, 2u);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "_update");
  }
  if (a2)
  {
    if (a2 != 1)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "_update");
    if (dword_100131A18 <= 30
      && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection netConnectionStartWithDevice:session:error:]_block_invoke_6", 30, "Discovery session state change after client session setup of session paired device\n");
    }
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "peerDeviceInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verifiedIdentity"));
    objc_msgSend(v5, "_changeDiscoverySessionStateForDevice:startReason:", v7, 1);

    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "setNeedsAWDL:", 0);
  if (dword_100131A18 <= 30 && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 30)))
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection netConnectionStartWithDevice:session:error:]_block_invoke_6", 30, "Reset needsAWDL state at the end of pairing session\n");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "_update");
}

void sub_1000AAB48(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (dword_100131A18 <= 90)
  {
    if (dword_100131A18 != -1 || (v4 = _LogCategory_Initialize(&dword_100131A18, 90), v3 = v6, v4))
    {
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionStartWithID:netCnx:completion:]_block_invoke", 90, "### Server session start XPC error: %@, %{error}\n", *(_QWORD *)(a1 + 32), v3);
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void sub_1000AABF0(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t DeviceClass;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v11 = v3;
  if (v3)
  {
    v5 = v3;
    if (dword_100131A18 <= 90)
    {
      if (dword_100131A18 != -1 || (v6 = _LogCategory_Initialize(&dword_100131A18, 90), v5 = v11, v6))
      {
        LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionStartWithID:netCnx:completion:]_block_invoke_2", 90, "### Server session start failed: %@, device %@, %{error}\n", a1[4], a1[5], v5);
LABEL_14:
        v5 = v11;
      }
    }
  }
  else
  {
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 != -1 || (v3 = (id)_LogCategory_Initialize(&dword_100131A18, 30), (_DWORD)v3))
        v3 = (id)LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection sessionStartWithID:netCnx:completion:]_block_invoke_2", 30, "Server session started: %@, device %@\n", a1[4], a1[5]);
    }
    DeviceClass = GestaltGetDeviceClass(v3, v4);
    if ((_DWORD)DeviceClass == 1 || (v9 = GestaltGetDeviceClass(DeviceClass, v8), v5 = 0, v9 == 3))
    {
      objc_msgSend(*(id *)(a1[6] + 56), "_postNotificationForWombatActivity:", 1);
      goto LABEL_14;
    }
  }
  v10 = a1[7];
  if (v10)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
    v5 = v11;
  }

}

void sub_1000AB164(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (dword_100131A18 <= 90)
  {
    if (dword_100131A18 != -1 || (v4 = _LogCategory_Initialize(&dword_100131A18, 90), v3 = v5, v4))
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _receivedRequestID:request:options:responseHandler:sessionID:]_block_invoke", 90, "### Session start XPC error: %{error}\n", v3);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1000AB208(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (dword_100131A18 <= 90)
  {
    if (dword_100131A18 != -1 || (v4 = _LogCategory_Initialize(&dword_100131A18, 90), v3 = v5, v4))
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _receivedRequestID:request:options:responseHandler:sessionID:]_block_invoke_2", 90, "### Session start XPC error: %{error}\n", v3);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1000AB720(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  id v7;

  v2 = objc_msgSend((Class)off_100131B70[0](), "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v5 = objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v4, 0, &v7);
  v6 = v7;

  if ((v5 & 1) == 0
    && dword_100131A18 <= 90
    && (dword_100131A18 != -1 || _LogCategory_Initialize(&dword_100131A18, 90)))
  {
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _handleContinuityCameraDisabledAlertResponse]_block_invoke", 90, "### Launch URL failed: %@, %{error}\n", *(_QWORD *)(a1 + 32), v6);
  }

}

void sub_1000AB844(uint64_t a1)
{
  NSMutableDictionary *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __CFUserNotification *v11;
  SInt32 v12;
  __CFUserNotification *v13;
  CFOptionFlags responseFlags;
  SInt32 error;

  error = 0;
  v2 = objc_opt_new(NSMutableDictionary);
  v3 = off_100131B80(CFSTR("CC_DISABLED_HEADER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, kCFUserNotificationAlertHeaderKey);

  v5 = off_100131B80(CFSTR("CC_DISABLED_CANCEL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, kCFUserNotificationAlternateButtonTitleKey);

  v7 = off_100131B80(CFSTR("CC_DISABLED_SETTINGS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, kCFUserNotificationDefaultButtonTitleKey);

  v9 = off_100131B80(CFSTR("CC_DISABLED_MESSAGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v10, kCFUserNotificationAlertMessageKey);

  v11 = CFUserNotificationCreate(0, 0.0, 1uLL, &error, (CFDictionaryRef)v2);
  v12 = error;
  if (error)
  {
    if (dword_100131A18 <= 30)
    {
      if (dword_100131A18 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100131A18, 30))
          goto LABEL_9;
        v12 = error;
      }
      LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection _showContinuityCameraDisabledAlert]_block_invoke", 30, "Error creating continuity camera disabled user notification (error: %d)\n", v12);
    }
  }
  else
  {
    v13 = v11;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
    if ((responseFlags & 3) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_handleContinuityCameraDisabledAlertResponse");
    CFRelease(v13);
  }
LABEL_9:

}

void sub_1000ABCE8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldReportDevice:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "remoteObjectProxy"));
    objc_msgSend(v4, "remoteDisplayFoundDevice:", v5);

  }
}

id sub_1000ABF58(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "_deliverBufferedConnectionsToServer:");
}

void sub_1000AC834(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000AC870(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = result;
    if (dword_100131A18 > 90)
      goto LABEL_6;
    if (dword_100131A18 == -1)
    {
      if (!_LogCategory_Initialize(&dword_100131A18, 90))
      {
LABEL_6:
        result = *(_QWORD *)(v2 + 40);
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v2 + 32));
        return result;
      }
      v1 = *(_QWORD *)(v2 + 32);
    }
    LogPrintF(&dword_100131A18, "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]_block_invoke", 90, "### Activate session failed: %{error}\n", v1);
    goto LABEL_6;
  }
  return result;
}

Class sub_1000AD944()
{
  Class result;

  if (qword_100132300 != -1)
    dispatch_once(&qword_100132300, &stru_100114C58);
  result = objc_getClass("SFDeviceDiscovery");
  qword_1001322F8 = (uint64_t)result;
  off_100131A88[0] = (uint64_t (*)())sub_1000AD9A0;
  return result;
}

id sub_1000AD9A0()
{
  return (id)qword_1001322F8;
}

void sub_1000AD9AC(id a1)
{
  qword_100132308 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
}

void sub_1000AD9D4(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = LogCategoryCopyOSLogHandle(&dword_100131A18);
  v2 = (void *)qword_100132310;
  qword_100132310 = v1;

}

Class sub_1000AD9FC()
{
  Class result;

  if (qword_100132300 != -1)
    dispatch_once(&qword_100132300, &stru_100114C58);
  result = objc_getClass("SFService");
  qword_100132320 = (uint64_t)result;
  off_100131A90[0] = (uint64_t (*)())sub_1000ADA58;
  return result;
}

id sub_1000ADA58()
{
  return (id)qword_100132320;
}

id sub_1000ADA64()
{
  id *v0;

  if (qword_100132300 != -1)
    dispatch_once(&qword_100132300, &stru_100114C58);
  v0 = (id *)dlsym((void *)qword_100132308, "SFServiceIdentifierRemoteDisplay");
  if (v0)
    objc_storeStrong((id *)&qword_1001322F0, *v0);
  off_100131A98[0] = (uint64_t (*)())sub_1000ADADC;
  return (id)qword_1001322F0;
}

id sub_1000ADADC()
{
  return (id)qword_1001322F0;
}

Class sub_1000ADAE8()
{
  Class result;

  if (qword_100132300 != -1)
    dispatch_once(&qword_100132300, &stru_100114C58);
  result = objc_getClass("SFAuthenticationManager");
  qword_100132328 = (uint64_t)result;
  off_100131AA0 = (uint64_t (*)())sub_1000ADB44;
  return result;
}

id sub_1000ADB44()
{
  return (id)qword_100132328;
}

uint64_t sub_1000ADB50()
{
  if (qword_100132330 != -1)
    dispatch_once(&qword_100132330, &stru_100114C98);
  off_100131B78[0] = (uint64_t (*)())dlsym((void *)qword_100132338, "FigContinuityCaptureGetUserPreferenceDisabled");
  return off_100131B78[0]();
}

void sub_1000ADBA4(id a1)
{
  qword_100132338 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CMCapture.framework/CMCapture", 2);
}

Class sub_1000ADBCC()
{
  Class result;

  if (qword_100132348 != -1)
    dispatch_once(&qword_100132348, &stru_100114CB8);
  result = objc_getClass("LSApplicationWorkspace");
  qword_100132340 = (uint64_t)result;
  off_100131B70[0] = (uint64_t (*)())sub_1000ADC28;
  return result;
}

id sub_1000ADC28()
{
  return (id)qword_100132340;
}

void sub_1000ADC34(id a1)
{
  qword_100132350 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
}

id sub_1000ADC5C(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;

  v1 = qword_100132358;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&qword_100132358, &stru_100114CD8);
  off_100131B80 = (uint64_t (*)())dlsym((void *)qword_100132360, "RPUILocalizedString");
  v3 = ((uint64_t (*)(id))off_100131B80)(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

void sub_1000ADCDC(id a1)
{
  qword_100132360 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/RapportUI.framework/RapportUI", 2);
}

void sub_1000ADD44(id a1)
{
  RPStatusDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(RPStatusDaemon);
  v2 = (void *)qword_100132368;
  qword_100132368 = (uint64_t)v1;

}

id sub_1000AE0D0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_activate");
}

void sub_1000AE248(id a1, NSDictionary *a2, NSDictionary *a3)
{
  NSDictionary *v4;
  NSDictionary *v5;

  v5 = a2;
  v4 = a3;
  if (dword_100131B88 <= 20 && (dword_100131B88 != -1 || _LogCategory_Initialize(&dword_100131B88, 20)))
    LogPrintF(&dword_100131B88, "-[RPStatusDaemon _activate]_block_invoke", 20, "inEvent: %@, inOptions: %@", v5, v4);

}

id sub_1000AE334(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

id sub_1000AE92C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

id sub_1000AF610(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleSiriAudio:", a2);
}

void sub_1000AF61C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("senderID")));
  if (objc_msgSend(v9, "length"))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v9);
  objc_msgSend(*(id *)(a1 + 32), "_handleSiriStart:options:responseHandler:", v10, v7, v8);

}

id sub_1000AF6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleSiriStop:options:responseHandler:", a2, a3, a4);
}

id sub_1000AF6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleSiriStartWhileRecording:options:responseHandler:", a2, a3, a4);
}

uint64_t sub_1000B0468()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000B1530(v0, qword_100132388);
  sub_1000B1268(v0, (uint64_t)qword_100132388);
  return Logger.init(subsystem:category:)(0xD000000000000011, 0x80000001000F02A0, 0xD000000000000011, 0x80000001000F02C0);
}

uint64_t sub_1000B04E4()
{
  uint64_t v0;

  return swift_allocObject(v0, 16, 7);
}

void sub_1000B04F4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  NSObject *oslog;
  uint64_t v15;
  uint64_t v16;

  if (a2)
  {
    v4 = qword_100132380;
    swift_bridgeObjectRetain(a2);
    if (v4 != -1)
      swift_once(&qword_100132380, sub_1000B0468);
    v5 = type metadata accessor for Logger(0);
    sub_1000B1268(v5, (uint64_t)qword_100132388);
    v6 = swift_bridgeObjectRetain(a2);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = swift_slowAlloc(32, -1);
      v16 = v10;
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain(a2);
      v15 = sub_1000B0974(a1, a2, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Test log: RPSwiftMemoryTest_enum.associatedValue(%s)", v9, 0xCu);
      swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
  }
  else
  {
    if (qword_100132380 != -1)
      swift_once(&qword_100132380, sub_1000B0468);
    v11 = type metadata accessor for Logger(0);
    sub_1000B1268(v11, (uint64_t)qword_100132388);
    oslog = ((uint64_t (*)(void))Logger.logObject.getter)();
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Test log: RPSwiftMemoryTest_enum.empty", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

  }
}

uint64_t sub_1000B0760()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_allocObject(v0, 112, 15);
  swift_defaultActor_initialize();
  return v1;
}

id RPSwiftMemoryTest_objCClass.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id RPSwiftMemoryTest_objCClass.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

id RPSwiftMemoryTest_objCClass.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000B085C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

void sub_1000B086C()
{
  sub_1000B0878("Test log: RPSwiftMemoryTest_actor");
}

void sub_1000B0878(const char *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  NSObject *oslog;

  if (qword_100132380 != -1)
    swift_once(&qword_100132380, sub_1000B0468);
  v2 = type metadata accessor for Logger(0);
  sub_1000B1268(v2, (uint64_t)qword_100132388);
  oslog = Logger.logObject.getter();
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, a1, v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

}

uint64_t sub_1000B094C()
{
  uint64_t v0;

  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_1000B0968()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000B0974(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000B0A44(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000B14B0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1000B14B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000B1490(v12);
  return v7;
}

uint64_t sub_1000B0A44(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1000B0BFC(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_1000B0BFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000B0C90(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000B0E68(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000B0E68(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000B0C90(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000B0E04(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000B0E04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000B14EC((uint64_t *)&unk_100131EF0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000B0E68(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000B14EC((uint64_t *)&unk_100131EF0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void _s8rapportd27RPSwiftMemoryTest_objCClassC10performLogyyF_0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject *oslog;

  if (qword_100132380 != -1)
    swift_once(&qword_100132380, sub_1000B0468);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_1000B1268(v0, (uint64_t)qword_100132388);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Test log: RPSwiftMemoryTest_objCClass", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Test log: RPSwiftMemoryTest_swiftClass", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Test log: RPSwiftMemoryTest_struct", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Test log: RPSwiftMemoryTest_enum.empty", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  sub_1000B04F4(1953719636, 0xE400000000000000);
  v19 = type metadata accessor for RPSwiftMemoryTest_actor(v17, v18);
  v20 = swift_allocObject(v19, 112, 15);
  v21 = swift_defaultActor_initialize();
  oslog = Logger.logObject.getter(v21);
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v22, "Test log: RPSwiftMemoryTest_actor", v23, 2u);
    swift_slowDealloc(v23, -1, -1);
  }
  swift_release(v20);

}

uint64_t sub_1000B1268(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for RPSwiftMemoryTest_objCClass(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC8rapportd27RPSwiftMemoryTest_objCClass, a2);
}

uint64_t type metadata accessor for RPSwiftMemoryTest_swiftClass(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC8rapportd28RPSwiftMemoryTest_swiftClass, a2);
}

ValueMetadata *type metadata accessor for RPSwiftMemoryTest_struct()
{
  return &type metadata for RPSwiftMemoryTest_struct;
}

_QWORD *initializeBufferWithCopyOfBuffer for RPSwiftMemoryTest_enum(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RPSwiftMemoryTest_enum(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for RPSwiftMemoryTest_enum(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for RPSwiftMemoryTest_enum(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for RPSwiftMemoryTest_enum(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RPSwiftMemoryTest_enum(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RPSwiftMemoryTest_enum(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_1000B1424(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1000B1440(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for RPSwiftMemoryTest_enum()
{
  return &type metadata for RPSwiftMemoryTest_enum;
}

uint64_t type metadata accessor for RPSwiftMemoryTest_actor(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC8rapportd23RPSwiftMemoryTest_actor, a2);
}

uint64_t sub_1000B1490(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000B14B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000B14EC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *sub_1000B1530(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

void sub_1000B1574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10003FA28();
  sub_10003FA00((void *)&_mh_execute_header, &_os_log_default, v0, "Validated magic value: 0x%x", v1, v2, v3, v4, 0);
  sub_10003FA20();
}

void sub_1000B15E0()
{
  int v0;
  _DWORD v1[2];

  sub_10003FA28();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Magic value does not match: 0x%x", (uint8_t *)v1, 8u);
  sub_10003FA20();
}

void sub_1000B1658()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Connection not validated yet", v0, 2u);
  sub_10003FA20();
}

void sub_1000B1698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10003FA00((void *)&_mh_execute_header, &_os_log_default, a3, "Received error code=%u", a5, a6, a7, a8, 0);
  sub_10003FA20();
}

void sub_1000B1710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10003FA10((void *)&_mh_execute_header, &_os_log_default, a3, "Received data, length=%zu, passing through", a5, a6, a7, a8, 0);
  sub_10003F9F8();
}

void sub_1000B1788(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;

  v1 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v2 = *(unsigned __int8 *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 2048;
  v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Got a message header, type=%d, length=%zu", (uint8_t *)v4, 0x12u);
  sub_10003F9F8();
}

void sub_1000B181C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10003FA10((void *)&_mh_execute_header, &_os_log_default, a3, "Writing data (%zu bytes) on framer", a5, a6, a7, a8, 0);
  sub_10003F9F8();
}

void sub_1000B1888(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Stop handler called for framer=%@, sending CLOSE to daemon", (uint8_t *)&v1, 0xCu);
  sub_10003F9F8();
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
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

id objc_msgSend__AWDLBonjourTransportServiceMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_AWDLBonjourTransportServiceMetadata");
}

id objc_msgSend__FZIDType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_FZIDType");
}

id objc_msgSend__acquireRBSAssertionForEntry_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acquireRBSAssertionForEntry:error:");
}

id objc_msgSend__activateScreenSaverWithResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateScreenSaverWithResponseHandler:");
}

id objc_msgSend__activeDeviceAdded_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeDeviceAdded:cnx:");
}

id objc_msgSend__activeDeviceChanged_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeDeviceChanged:changes:");
}

id objc_msgSend__activeDeviceChangedForConnection_bonjourDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeDeviceChangedForConnection:bonjourDevice:");
}

id objc_msgSend__activeDeviceRemoved_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeDeviceRemoved:cnx:");
}

id objc_msgSend__addProxyIdentifier_toDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addProxyIdentifier:toDictionary:");
}

id objc_msgSend__airPlayLeaderStateUncached(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_airPlayLeaderStateUncached");
}

id objc_msgSend__allowMessageForRegistrationOptions_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowMessageForRegistrationOptions:cnx:");
}

id objc_msgSend__allowStreamRequest_xpcCnx_rpCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowStreamRequest:xpcCnx:rpCnx:");
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appearsToBeEmail");
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appearsToBePhoneNumber");
}

id objc_msgSend__applicationServiceAdvertiseDescriptorForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationServiceAdvertiseDescriptorForClient:");
}

id objc_msgSend__authTagWithSelfIdentity_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_authTagWithSelfIdentity:data:");
}

id objc_msgSend__beginTransactionForRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginTransactionForRole:");
}

id objc_msgSend__bestGuessURI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bestGuessURI");
}

id objc_msgSend__bleClientConnectionEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bleClientConnectionEnded:");
}

id objc_msgSend__bleClientConnectionStateChanged_cnx_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bleClientConnectionStateChanged:cnx:sessionID:");
}

id objc_msgSend__bleDiscoveryEnsureStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bleDiscoveryEnsureStarted:");
}

id objc_msgSend__bleDiscoveryTriggerEnhancedDiscovery_useCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bleDiscoveryTriggerEnhancedDiscovery:useCase:");
}

id objc_msgSend__bleServerEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bleServerEnsureStarted");
}

id objc_msgSend__bleServerEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bleServerEnsureStopped");
}

id objc_msgSend__bluetoothUseCaseFromWombatState_resultBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothUseCaseFromWombatState:resultBlock:");
}

id objc_msgSend__btAddressMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_btAddressMonitorEnsureStarted");
}

id objc_msgSend__btAddressMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_btAddressMonitorEnsureStopped");
}

id objc_msgSend__btPipeEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_btPipeEnsureStarted");
}

id objc_msgSend__btPipeEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_btPipeEnsureStopped");
}

id objc_msgSend__btPipeSetup_withPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_btPipeSetup:withPriority:");
}

id objc_msgSend__btPipeSyncKeysIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_btPipeSyncKeysIfNeeded");
}

id objc_msgSend__btPipeTearDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_btPipeTearDown:");
}

id objc_msgSend__bufferCloudMessage_frameType_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bufferCloudMessage:frameType:msgCtx:");
}

id objc_msgSend__changeDiscoverySessionStateForDevice_startReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeDiscoverySessionStateForDevice:startReason:");
}

id objc_msgSend__checkForProxyOrLocalDestinations_eventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForProxyOrLocalDestinations:eventID:event:options:completion:");
}

id objc_msgSend__checkRSSIThresholdForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkRSSIThresholdForDevice:");
}

id objc_msgSend__clearCameraCapabilitiesUpdateCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearCameraCapabilitiesUpdateCache");
}

id objc_msgSend__clearConfirmationClientCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearConfirmationClientCache");
}

id objc_msgSend__clearCurrentTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearCurrentTransaction");
}

id objc_msgSend__clientAWDLPairingSessionWithDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientAWDLPairingSessionWithDevice:");
}

id objc_msgSend__clientBLEActionDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEActionDiscoveryEnsureStarted");
}

id objc_msgSend__clientBLEActionDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEActionDiscoveryEnsureStopped");
}

id objc_msgSend__clientBLEActionDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEActionDiscoveryShouldRun");
}

id objc_msgSend__clientBLEDiscoveryDeviceLost_force_deviceFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEDiscoveryDeviceLost:force:deviceFlags:");
}

id objc_msgSend__clientBLEDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEDiscoveryEnsureStarted");
}

id objc_msgSend__clientBLEDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEDiscoveryEnsureStopped");
}

id objc_msgSend__clientBLEDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEDiscoveryShouldRun");
}

id objc_msgSend__clientBLEFamilyDeviceReportChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEFamilyDeviceReportChanges");
}

id objc_msgSend__clientBLENearbyActionAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionAdvertiserEnsureStopped");
}

id objc_msgSend__clientBLENearbyActionAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionAdvertiserShouldRun");
}

id objc_msgSend__clientBLENearbyActionAdvertiserStartTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionAdvertiserStartTimer");
}

id objc_msgSend__clientBLENearbyActionDisableDupeFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionDisableDupeFilter");
}

id objc_msgSend__clientBLENearbyActionDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionDiscoveryEnsureStarted");
}

id objc_msgSend__clientBLENearbyActionDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionDiscoveryEnsureStopped");
}

id objc_msgSend__clientBLENearbyActionDiscoveryScanRateStartTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionDiscoveryScanRateStartTimer");
}

id objc_msgSend__clientBLENearbyActionDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionDiscoveryShouldRun");
}

id objc_msgSend__clientBLENearbyActionEnableDupeFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionEnableDupeFilter");
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionV2AdvertiserEnsureStarted");
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionV2AdvertiserEnsureStopped");
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserRestart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionV2AdvertiserRestart");
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionV2AdvertiserShouldRun");
}

id objc_msgSend__clientBLENearbyActionV2AdvertiserUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENearbyActionV2AdvertiserUpdate");
}

id objc_msgSend__clientBLENeedsAWDLAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsAWDLAdvertiserEnsureStarted");
}

id objc_msgSend__clientBLENeedsAWDLAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsAWDLAdvertiserEnsureStopped");
}

id objc_msgSend__clientBLENeedsAWDLAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsAWDLAdvertiserShouldRun");
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsCLinkAdvertiserEnsureStarted");
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsCLinkAdvertiserEnsureStopped");
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserRestart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsCLinkAdvertiserRestart");
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsCLinkAdvertiserShouldRun");
}

id objc_msgSend__clientBLENeedsCLinkAdvertiserUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsCLinkAdvertiserUpdate");
}

id objc_msgSend__clientBLENeedsCLinkTargetDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLENeedsCLinkTargetDevice");
}

id objc_msgSend__clientBLEServerEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEServerEnsureStarted");
}

id objc_msgSend__clientBLEServerEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEServerEnsureStopped");
}

id objc_msgSend__clientBLEServerHandleConnectionEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEServerHandleConnectionEnded:");
}

id objc_msgSend__clientBLEServerShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLEServerShouldRun");
}

id objc_msgSend__clientBLETriggerEnhancedDiscovery_useCase_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBLETriggerEnhancedDiscovery:useCase:error:");
}

id objc_msgSend__clientBonjourAWDLBrowserEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourAWDLBrowserEnsureStarted");
}

id objc_msgSend__clientBonjourAWDLBrowserEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourAWDLBrowserEnsureStopped");
}

id objc_msgSend__clientBonjourAWDLBrowserShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourAWDLBrowserShouldRun");
}

id objc_msgSend__clientBonjourCheckFoundPairedDevice_publicID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourCheckFoundPairedDevice:publicID:");
}

id objc_msgSend__clientBonjourCheckLostPairedDevice_publicID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourCheckLostPairedDevice:publicID:");
}

id objc_msgSend__clientBonjourEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourEnsureStarted");
}

id objc_msgSend__clientBonjourEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourEnsureStopped");
}

id objc_msgSend__clientBonjourFoundDevice_reevaluate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourFoundDevice:reevaluate:");
}

id objc_msgSend__clientBonjourFoundUnauthDevice_isAWDLDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourFoundUnauthDevice:isAWDLDevice:");
}

id objc_msgSend__clientBonjourFoundUnresolvedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourFoundUnresolvedDevice:");
}

id objc_msgSend__clientBonjourLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourLostDevice:");
}

id objc_msgSend__clientBonjourLostUnauthDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourLostUnauthDevice:");
}

id objc_msgSend__clientBonjourLostUnresolvedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourLostUnresolvedDevice:");
}

id objc_msgSend__clientBonjourReconfirmDevice_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourReconfirmDevice:reason:");
}

id objc_msgSend__clientBonjourReevaluateAllDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourReevaluateAllDevices");
}

id objc_msgSend__clientBonjourReevaluateDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourReevaluateDevices");
}

id objc_msgSend__clientBonjourReevaluateUnauthDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientBonjourReevaluateUnauthDevices");
}

id objc_msgSend__clientConnectionEnded_uniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientConnectionEnded:uniqueID:");
}

id objc_msgSend__clientConnectionEndedUnauth_publicID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientConnectionEndedUnauth:publicID:");
}

id objc_msgSend__clientConnectionStart_controlFlags_uniqueID_identity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientConnectionStart:controlFlags:uniqueID:identity:");
}

id objc_msgSend__clientConnectionStartOnDemand_xpcCnx_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientConnectionStartOnDemand:xpcCnx:error:");
}

id objc_msgSend__clientConnectionStartUnauth_client_publicID_xpcCnx_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientConnectionStartUnauth:client:publicID:xpcCnx:error:");
}

id objc_msgSend__clientCreateConnection_xpcCnx_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientCreateConnection:xpcCnx:error:");
}

id objc_msgSend__clientEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientEnsureStarted");
}

id objc_msgSend__clientEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientEnsureStopped");
}

id objc_msgSend__clientLostAllDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientLostAllDevices");
}

id objc_msgSend__clientOnDemandAWDLDiscoveryStartForXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientOnDemandAWDLDiscoveryStartForXPC:");
}

id objc_msgSend__clientOnDemandConnectionEnded_uniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientOnDemandConnectionEnded:uniqueID:");
}

id objc_msgSend__clientOnDemandDiscoveryStart_xpcCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientOnDemandDiscoveryStart:xpcCnx:");
}

id objc_msgSend__clientProximityEstimatorEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientProximityEstimatorEnsureStarted");
}

id objc_msgSend__clientProximityEstimatorEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientProximityEstimatorEnsureStopped");
}

id objc_msgSend__clientProximityEstimatorShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientProximityEstimatorShouldRun");
}

id objc_msgSend__clientPurgeUnauthAWDLDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientPurgeUnauthAWDLDevices");
}

id objc_msgSend__clientReportChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientReportChangedDevice:changes:");
}

id objc_msgSend__clientReportFoundDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientReportFoundDevice:");
}

id objc_msgSend__clientReportLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientReportLostDevice:");
}

id objc_msgSend__clientSendActivityLevelOverWiFiIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientSendActivityLevelOverWiFiIfNecessary");
}

id objc_msgSend__clientSendNeedsAWDLOverWiFi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientSendNeedsAWDLOverWiFi:");
}

id objc_msgSend__clientShouldConnectOverBonjour_device_identities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientShouldConnectOverBonjour:device:identities:");
}

id objc_msgSend__clientShouldFindNonSameAccountDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientShouldFindNonSameAccountDevices");
}

id objc_msgSend__clientUINoteProcessPending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientUINoteProcessPending");
}

id objc_msgSend__clientUINoteStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientUINoteStart:");
}

id objc_msgSend__configureConnectionForPairing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureConnectionForPairing:");
}

id objc_msgSend__connectionConfigureCommon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionConfigureCommon:");
}

id objc_msgSend__connectionHasActiveSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionHasActiveSessions:");
}

id objc_msgSend__connectionStateChanged_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionStateChanged:cnx:");
}

id objc_msgSend__controlFlagsToNearbyActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_controlFlagsToNearbyActionType:");
}

id objc_msgSend__convertToLegacyApplicationLabelIfNeeded_forVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertToLegacyApplicationLabelIfNeeded:forVersion:");
}

id objc_msgSend__convertToUpdatedApplicationLabelIfNeeded_forVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertToUpdatedApplicationLabelIfNeeded:forVersion:");
}

id objc_msgSend__createAndRunSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAndRunSession");
}

id objc_msgSend__createAuthenticationPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAuthenticationPayload");
}

id objc_msgSend__createDestinationIdentifierMaps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDestinationIdentifierMaps");
}

id objc_msgSend__createOneShotTimerWithInterval_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createOneShotTimerWithInterval:completionHandler:");
}

id objc_msgSend__createRequestEntryForXid_requestID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createRequestEntryForXid:requestID:options:responseHandler:");
}

id objc_msgSend__createTapEventForApplicationLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createTapEventForApplicationLabel:");
}

id objc_msgSend__createValidationPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createValidationPayload");
}

id objc_msgSend__daemonDevice_updatedMeasurement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemonDevice:updatedMeasurement:");
}

id objc_msgSend__daemonDeviceFound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemonDeviceFound:");
}

id objc_msgSend__deliverEventID_event_options_unauth_cnx_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deliverEventID:event:options:unauth:cnx:outError:");
}

id objc_msgSend__destinationID_matchesCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationID:matchesCnx:");
}

id objc_msgSend__destinationID_matchesProxyDeviceOnCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationID:matchesProxyDeviceOnCnx:");
}

id objc_msgSend__deviceSupportsLaguna_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSupportsLaguna:");
}

id objc_msgSend__devicesForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_devicesForClient:");
}

id objc_msgSend__didReceiveAuthenticationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveAuthenticationMessage:");
}

id objc_msgSend__didReceiveAuthenticationResponseWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveAuthenticationResponseWithResult:error:");
}

id objc_msgSend__didReceiveValidationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveValidationMessage:");
}

id objc_msgSend__disconnectRemovedSharedHomeDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectRemovedSharedHomeDevices");
}

id objc_msgSend__disconnectUnauthConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectUnauthConnections");
}

id objc_msgSend__disconnectUnpairedDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectUnpairedDevices");
}

id objc_msgSend__discoveriCloudDevicesOnly(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discoveriCloudDevicesOnly");
}

id objc_msgSend__discoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discoveryEnsureStarted");
}

id objc_msgSend__discoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discoveryEnsureStopped");
}

id objc_msgSend__discoveryNonceOrRotate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discoveryNonceOrRotate:");
}

id objc_msgSend__duetSyncEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_duetSyncEnsureStarted");
}

id objc_msgSend__duetSyncEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_duetSyncEnsureStopped");
}

id objc_msgSend__ensureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureStopped");
}

id objc_msgSend__entitledAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitledAndReturnError:");
}

id objc_msgSend__entitledAndReturnError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitledAndReturnError:error:");
}

id objc_msgSend__entitledForLabel_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitledForLabel:error:");
}

id objc_msgSend__enumerateIdentitiesWithFlag_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateIdentitiesWithFlag:usingBlock:");
}

id objc_msgSend__eventForHomeHubDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventForHomeHubDevice:");
}

id objc_msgSend__existingProxyDeviceUpdated_event_isLocal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_existingProxyDeviceUpdated:event:isLocal:");
}

id objc_msgSend__exportedInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_exportedInterface");
}

id objc_msgSend__familyEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_familyEnsureStarted");
}

id objc_msgSend__familyEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_familyEnsureStopped");
}

id objc_msgSend__fetchSameAccountIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchSameAccountIdentities");
}

id objc_msgSend__fileTTRForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fileTTRForError:");
}

id objc_msgSend__filterHomeKitUserIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterHomeKitUserIdentifiers:");
}

id objc_msgSend__findDeviceWithDevice_deviceMap_matchedIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findDeviceWithDevice:deviceMap:matchedIdentifier:");
}

id objc_msgSend__findExistingActiveDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findExistingActiveDevice:");
}

id objc_msgSend__findMatchingAWDLBonjourDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findMatchingAWDLBonjourDevice:");
}

id objc_msgSend__findMatchingDevice_inDeviceDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findMatchingDevice:inDeviceDictionary:");
}

id objc_msgSend__findMatchingDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findMatchingDeviceWithIdentifier:");
}

id objc_msgSend__findWiFiConnectionByID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findWiFiConnectionByID:");
}

id objc_msgSend__finishCurrentTransactionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishCurrentTransactionWithError:");
}

id objc_msgSend__flagsForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flagsForVersion:");
}

id objc_msgSend__forEachConnectionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forEachConnectionWithHandler:");
}

id objc_msgSend__forEachMatchingDestinationID_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forEachMatchingDestinationID:handler:");
}

id objc_msgSend__forEachUniqueMatchingDestinationID_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forEachUniqueMatchingDestinationID:handler:");
}

id objc_msgSend__friendsEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_friendsEnsureStarted");
}

id objc_msgSend__friendsEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_friendsEnsureStopped");
}

id objc_msgSend__friendsUpdateSuggestedIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_friendsUpdateSuggestedIfNeeded");
}

id objc_msgSend__getAltDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAltDSID");
}

id objc_msgSend__getAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAppleID");
}

id objc_msgSend__handleConfirmationResult_fromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConfirmationResult:fromDevice:");
}

id objc_msgSend__handleContinuityCameraDisabledAlertResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleContinuityCameraDisabledAlertResponse");
}

id objc_msgSend__handleGameControllerAuxEvent_pressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleGameControllerAuxEvent:pressed:");
}

id objc_msgSend__handleGetVolume_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleGetVolume:responseHandler:");
}

id objc_msgSend__handleMediaCaptionGet_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMediaCaptionGet:responseHandler:");
}

id objc_msgSend__handleMediaCaptionSet_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMediaCaptionSet:responseHandler:");
}

id objc_msgSend__handleMovementCommand_endCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMovementCommand:endCommand:");
}

id objc_msgSend__handleSelectWithButtonState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSelectWithButtonState:");
}

id objc_msgSend__handleServerActivation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleServerActivation:");
}

id objc_msgSend__handleSetVolume_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSetVolume:responseHandler:");
}

id objc_msgSend__handleSiriStart_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSiriStart:options:responseHandler:");
}

id objc_msgSend__handleSkipByRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSkipByRequest:responseHandler:");
}

id objc_msgSend__haveActiveClientConnectionsOnAWDL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_haveActiveClientConnectionsOnAWDL");
}

id objc_msgSend__haveActiveServerConnectionsOnAWDL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_haveActiveServerConnectionsOnAWDL");
}

id objc_msgSend__hidEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hidEnsureStarted");
}

id objc_msgSend__hidEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hidEnsureStopped");
}

id objc_msgSend__homeHubDeviceAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeHubDeviceAdded:");
}

id objc_msgSend__homeHubDeviceRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeHubDeviceRemoved:");
}

id objc_msgSend__homeKitAuthMatchForBonjourDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitAuthMatchForBonjourDevice:");
}

id objc_msgSend__homeKitDecryptRotatingIDForBonjourDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitDecryptRotatingIDForBonjourDevice:");
}

id objc_msgSend__homeKitEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitEnsureStarted");
}

id objc_msgSend__homeKitEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitEnsureStopped");
}

id objc_msgSend__homeKitGetPairingIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitGetPairingIdentities");
}

id objc_msgSend__homeKitGetUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitGetUserInfo:");
}

id objc_msgSend__homeKitSelfAccessoryMediaSystemUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitSelfAccessoryMediaSystemUpdated:");
}

id objc_msgSend__homeKitUpdateInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitUpdateInfo:");
}

id objc_msgSend__homeKitUpdateUserIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeKitUpdateUserIdentifiers");
}

id objc_msgSend__identitiesOfType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identitiesOfType:error:");
}

id objc_msgSend__identityForNFCDeviceDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identityForNFCDeviceDiscovery");
}

id objc_msgSend__idleSessionConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_idleSessionConnection");
}

id objc_msgSend__idsAccountWithURI_senderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_idsAccountWithURI:senderID:");
}

id objc_msgSend__idsEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_idsEnsureStopped");
}

id objc_msgSend__idsURIWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_idsURIWithID:");
}

id objc_msgSend__injectKeyboardEventUsagePage_usageCode_buttonState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_injectKeyboardEventUsagePage:usageCode:buttonState:");
}

id objc_msgSend__interestReceived_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interestReceived:cnx:");
}

id objc_msgSend__interestRemoveForCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interestRemoveForCnx:");
}

id objc_msgSend__invalidateConnectionInList_listDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateConnectionInList:listDescription:");
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidated");
}

id objc_msgSend__irkMetricsSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_irkMetricsSetup");
}

id objc_msgSend__isTCPTransport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTCPTransport:");
}

id objc_msgSend__legacyApplicationLabels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_legacyApplicationLabels");
}

id objc_msgSend__loadSelfIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSelfIdentity:");
}

id objc_msgSend__loadTemporarySelfIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadTemporarySelfIdentity");
}

id objc_msgSend__localDeviceCleanup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localDeviceCleanup");
}

id objc_msgSend__localDeviceUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localDeviceUpdate");
}

id objc_msgSend__localMediaAccessControlSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localMediaAccessControlSetting");
}

id objc_msgSend__localPublicKeyForAgentClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localPublicKeyForAgentClient:");
}

id objc_msgSend__mediaControlEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaControlEnsureStarted");
}

id objc_msgSend__mediaControlEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaControlEnsureStopped");
}

id objc_msgSend__mediaRemoteIDGet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaRemoteIDGet");
}

id objc_msgSend__mediaRemoteSupportedCommandsGet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaRemoteSupportedCommandsGet");
}

id objc_msgSend__mediaRouteIDGet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaRouteIDGet");
}

id objc_msgSend__metricsSubmissionSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metricsSubmissionSetup");
}

id objc_msgSend__miscEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_miscEnsureStarted");
}

id objc_msgSend__miscEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_miscEnsureStopped");
}

id objc_msgSend__nearbyActionDeviceActionTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nearbyActionDeviceActionTypes");
}

id objc_msgSend__needToHoldPowerAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_needToHoldPowerAssertion");
}

id objc_msgSend__onenessEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onenessEnabled");
}

id objc_msgSend__payloadForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_payloadForType:");
}

id objc_msgSend__personalDeviceUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_personalDeviceUpdate");
}

id objc_msgSend__postIdentitiesChangedNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postIdentitiesChangedNotification");
}

id objc_msgSend__postNotificationForWombatActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postNotificationForWombatActivity:");
}

id objc_msgSend__powerAssertionEnsureHeld(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_powerAssertionEnsureHeld");
}

id objc_msgSend__powerAssertionEnsureReleased(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_powerAssertionEnsureReleased");
}

id objc_msgSend__prefsChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prefsChanged");
}

id objc_msgSend__primaryAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_primaryAppleID:");
}

id objc_msgSend__processBufferedCloudMessages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processBufferedCloudMessages");
}

id objc_msgSend__processDiscoverySessionStateChangeForDevice_startReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processDiscoverySessionStateChangeForDevice:startReason:");
}

id objc_msgSend__proxyDevice_isEqualTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_proxyDevice:isEqualTo:");
}

id objc_msgSend__proxyDevice_loopbackRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_proxyDevice:loopbackRequestID:request:options:responseHandler:");
}

id objc_msgSend__proxyDevice_receivedRequestID_request_options_responseHandler_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_proxyDevice:receivedRequestID:request:options:responseHandler:cnx:");
}

id objc_msgSend__proxyDeviceAdd_options_eventID_deviceInfo_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_proxyDeviceAdd:options:eventID:deviceInfo:cnx:");
}

id objc_msgSend__proxyDeviceListUpdated_content_options_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_proxyDeviceListUpdated:content:options:cnx:");
}

id objc_msgSend__proxyDeviceRemove_options_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_proxyDeviceRemove:options:cnx:");
}

id objc_msgSend__pruneFamilyDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pruneFamilyDevices");
}

id objc_msgSend__pruneFriendAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pruneFriendAccounts:");
}

id objc_msgSend__pruneFriendDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pruneFriendDevices");
}

id objc_msgSend__pruneFriends_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pruneFriends:");
}

id objc_msgSend__quicProtocolOptionsFromParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_quicProtocolOptionsFromParameters:");
}

id objc_msgSend__rangingBLEActionScannerBurst(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingBLEActionScannerBurst");
}

id objc_msgSend__rangingInitiatorEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingInitiatorEnsureStarted");
}

id objc_msgSend__rangingInitiatorEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingInitiatorEnsureStopped");
}

id objc_msgSend__rangingRemoveDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingRemoveDevice:");
}

id objc_msgSend__rangingResponderEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingResponderEnsureStopped");
}

id objc_msgSend__rangingResponderUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingResponderUpdate");
}

id objc_msgSend__rangingResponderUpdateForAirDropChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingResponderUpdateForAirDropChange");
}

id objc_msgSend__rangingUpdateForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangingUpdateForDevice:");
}

id objc_msgSend__reachabilityEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reachabilityEnsureStarted");
}

id objc_msgSend__reachabilityEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reachabilityEnsureStopped");
}

id objc_msgSend__receivedCameraCapabilitiesMessage_fromDevice_isFirstUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedCameraCapabilitiesMessage:fromDevice:isFirstUpdate:");
}

id objc_msgSend__receivedCameraExitEvent_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedCameraExitEvent:from:");
}

id objc_msgSend__receivedEventID_event_options_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedEventID:event:options:sessionID:");
}

id objc_msgSend__receivedEventID_event_options_unauth_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedEventID:event:options:unauth:cnx:");
}

id objc_msgSend__receivedEventID_event_options_xpcCnx_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedEventID:event:options:xpcCnx:sessionID:");
}

id objc_msgSend__receivedEventID_onXPCCnx_event_options_unauth_rpCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedEventID:onXPCCnx:event:options:unauth:rpCnx:");
}

id objc_msgSend__receivedFamilyIdentityFrameType_ptr_length_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedFamilyIdentityFrameType:ptr:length:msgCtx:");
}

id objc_msgSend__receivedFriendIdentityFrameType_ptr_length_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedFriendIdentityFrameType:ptr:length:msgCtx:");
}

id objc_msgSend__receivedRequestID_onXPCCnx_request_options_responseHandler_unauth_rpCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedRequestID:onXPCCnx:request:options:responseHandler:unauth:rpCnx:");
}

id objc_msgSend__receivedRequestID_request_options_responseHandler_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedRequestID:request:options:responseHandler:sessionID:");
}

id objc_msgSend__receivedRequestID_request_options_responseHandler_unauth_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedRequestID:request:options:responseHandler:unauth:cnx:");
}

id objc_msgSend__receivedRequestID_request_options_responseHandler_xpcCnx_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedRequestID:request:options:responseHandler:xpcCnx:sessionID:");
}

id objc_msgSend__receivedWatchIdentityFrameType_ptr_length_fromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedWatchIdentityFrameType:ptr:length:fromID:");
}

id objc_msgSend__receivedWatchIdentityRequest_fromIDSDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedWatchIdentityRequest:fromIDSDevice:");
}

id objc_msgSend__receivedWatchIdentityResponse_fromIDSDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedWatchIdentityResponse:fromIDSDevice:");
}

id objc_msgSend__regenerateSelfIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regenerateSelfIdentity:");
}

id objc_msgSend__registerConnectionRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerConnectionRequestID:options:handler:");
}

id objc_msgSend__registerForCameraCapabilitiesRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerForCameraCapabilitiesRequest");
}

id objc_msgSend__registerForWombatStateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerForWombatStateNotifications");
}

id objc_msgSend__releasePowerAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_releasePowerAssertion");
}

id objc_msgSend__remoteObjectInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteObjectInterface");
}

id objc_msgSend__remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteObjectProxy");
}

id objc_msgSend__removeSameAccountIdentityWithIDSIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeSameAccountIdentityWithIDSIdentifier:error:");
}

id objc_msgSend__removeSelfIdentityPublicWithPrivateIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeSelfIdentityPublicWithPrivateIdentity:");
}

id objc_msgSend__reportXPCMatchingDiscoveryCLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportXPCMatchingDiscoveryCLink");
}

id objc_msgSend__reportXPCMatchingDiscoveryCompanionAuthenticationDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportXPCMatchingDiscoveryCompanionAuthenticationDevice:");
}

id objc_msgSend__reportXPCMatchingDiscoveryUINoteDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportXPCMatchingDiscoveryUINoteDevice:");
}

id objc_msgSend__requestCameraCapabilitiesForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestCameraCapabilitiesForDevice:");
}

id objc_msgSend__requestConfirmationFromDevice_forDedicated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestConfirmationFromDevice:forDedicated:");
}

id objc_msgSend__requestConfirmationFromDevicesMatching_forDedicated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestConfirmationFromDevicesMatching:forDedicated:");
}

id objc_msgSend__requestConfirmationFromPerson_forDedicated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestConfirmationFromPerson:forDedicated:");
}

id objc_msgSend__requestMessageMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestMessageMetadata");
}

id objc_msgSend__resetFriends(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetFriends");
}

id objc_msgSend__rssiThresholdForApplicationService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rssiThresholdForApplicationService:");
}

id objc_msgSend__saveSelfIdentityPrivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveSelfIdentityPrivate:");
}

id objc_msgSend__saveSelfIdentityPublicWithPrivateIdentity_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveSelfIdentityPublicWithPrivateIdentity:force:");
}

id objc_msgSend__scheduleCameraCapabilitiesRequest_interval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleCameraCapabilitiesRequest:interval:");
}

id objc_msgSend__schedulePendingLostBLEDeviceTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_schedulePendingLostBLEDeviceTimer");
}

id objc_msgSend__schedulePendingLostDeviceTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_schedulePendingLostDeviceTimer");
}

id objc_msgSend__schedulePendingLostNeedsCLinkDeviceTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_schedulePendingLostNeedsCLinkDeviceTimer");
}

id objc_msgSend__selfIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selfIdentity");
}

id objc_msgSend__sendCameraCapabilitiesUpdateEventForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendCameraCapabilitiesUpdateEventForDevice:");
}

id objc_msgSend__sendCloudIdentityFrameType_destinationID_flags_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:");
}

id objc_msgSend__sendConfirmationCancelToAllDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendConfirmationCancelToAllDevices");
}

id objc_msgSend__sendDiscoverySessionExitWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDiscoverySessionExitWithReason:");
}

id objc_msgSend__sendProxyDeviceUpdateToPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendProxyDeviceUpdateToPeer:");
}

id objc_msgSend__serverBLEClientConnectionShouldStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLEClientConnectionShouldStart");
}

id objc_msgSend__serverBLEDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLEDiscoveryEnsureStarted");
}

id objc_msgSend__serverBLEDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLEDiscoveryEnsureStopped");
}

id objc_msgSend__serverBLEDiscoveryShouldStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLEDiscoveryShouldStart");
}

id objc_msgSend__serverBLENearbyActionAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionAdvertiserEnsureStarted");
}

id objc_msgSend__serverBLENearbyActionAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionAdvertiserEnsureStopped");
}

id objc_msgSend__serverBLENearbyActionAdvertiserRestartTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionAdvertiserRestartTimer");
}

id objc_msgSend__serverBLENearbyActionAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionAdvertiserShouldRun");
}

id objc_msgSend__serverBLENearbyActionDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionDiscoveryEnsureStarted");
}

id objc_msgSend__serverBLENearbyActionDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionDiscoveryEnsureStopped");
}

id objc_msgSend__serverBLENearbyActionDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionDiscoveryShouldRun");
}

id objc_msgSend__serverBLENearbyActionV2DiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionV2DiscoveryEnsureStarted");
}

id objc_msgSend__serverBLENearbyActionV2DiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionV2DiscoveryEnsureStopped");
}

id objc_msgSend__serverBLENearbyActionV2DiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyActionV2DiscoveryShouldRun");
}

id objc_msgSend__serverBLENearbyInfoDiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyInfoDiscoveryEnsureStarted");
}

id objc_msgSend__serverBLENearbyInfoDiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyInfoDiscoveryEnsureStopped");
}

id objc_msgSend__serverBLENearbyInfoDiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENearbyInfoDiscoveryShouldRun");
}

id objc_msgSend__serverBLENeedsAWDLScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENeedsAWDLScannerEnsureStarted");
}

id objc_msgSend__serverBLENeedsAWDLScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENeedsAWDLScannerEnsureStopped");
}

id objc_msgSend__serverBLENeedsAWDLScannerScreenOff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENeedsAWDLScannerScreenOff");
}

id objc_msgSend__serverBLENeedsCLinkScannerEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENeedsCLinkScannerEnsureStarted");
}

id objc_msgSend__serverBLENeedsCLinkScannerEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENeedsCLinkScannerEnsureStopped");
}

id objc_msgSend__serverBLENeedsCLinkScannerScreenOff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBLENeedsCLinkScannerScreenOff");
}

id objc_msgSend__serverBTAddressMonitorEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBTAddressMonitorEnsureStarted");
}

id objc_msgSend__serverBTAddressMonitorEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBTAddressMonitorEnsureStopped");
}

id objc_msgSend__serverBonjourAWDLAdvertiserEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAWDLAdvertiserEnsureStarted");
}

id objc_msgSend__serverBonjourAWDLAdvertiserEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAWDLAdvertiserEnsureStopped");
}

id objc_msgSend__serverBonjourAWDLAdvertiserShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAWDLAdvertiserShouldRun");
}

id objc_msgSend__serverBonjourAWDLAdvertiserUpdateTXT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAWDLAdvertiserUpdateTXT");
}

id objc_msgSend__serverBonjourAWDLNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAWDLNeeded");
}

id objc_msgSend__serverBonjourAWDLShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAWDLShouldRun");
}

id objc_msgSend__serverBonjourAuthTagString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAuthTagString");
}

id objc_msgSend__serverBonjourAuthTagStringWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourAuthTagStringWithData:");
}

id objc_msgSend__serverBonjourEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourEnsureStarted");
}

id objc_msgSend__serverBonjourEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourEnsureStopped");
}

id objc_msgSend__serverBonjourShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourShouldRun");
}

id objc_msgSend__serverBonjourTempAuthTagStringWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourTempAuthTagStringWithData:");
}

id objc_msgSend__serverBonjourUpdateTXT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverBonjourUpdateTXT");
}

id objc_msgSend__serverDirectLinkInterfaceIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverDirectLinkInterfaceIndex");
}

id objc_msgSend__serverEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverEnsureStarted");
}

id objc_msgSend__serverEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverEnsureStopped");
}

id objc_msgSend__serverHandleSessionStartWithID_netCnx_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverHandleSessionStartWithID:netCnx:completion:");
}

id objc_msgSend__serverNearbyActionV2DiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyActionV2DiscoveryEnsureStarted");
}

id objc_msgSend__serverNearbyActionV2DiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyActionV2DiscoveryEnsureStopped");
}

id objc_msgSend__serverNearbyActionV2DiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyActionV2DiscoveryShouldRun");
}

id objc_msgSend__serverNearbyInfoV2DeviceFound_deviceFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyInfoV2DeviceFound:deviceFlags:");
}

id objc_msgSend__serverNearbyInfoV2DeviceLost_idsIdentifier_force_deviceFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyInfoV2DeviceLost:idsIdentifier:force:deviceFlags:");
}

id objc_msgSend__serverNearbyInfoV2DiscoveryEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyInfoV2DiscoveryEnsureStarted");
}

id objc_msgSend__serverNearbyInfoV2DiscoveryEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyInfoV2DiscoveryEnsureStopped");
}

id objc_msgSend__serverNearbyInfoV2DiscoveryShouldRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverNearbyInfoV2DiscoveryShouldRun");
}

id objc_msgSend__serverReceivedNeedsAWDLEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverReceivedNeedsAWDLEvent:");
}

id objc_msgSend__serverReceivedNeedsAWDLEvent_event_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverReceivedNeedsAWDLEvent:event:");
}

id objc_msgSend__serverRegisterForIncomingMessages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverRegisterForIncomingMessages");
}

id objc_msgSend__serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverShouldAdvertiseIdentifiableInfoWhenUnpairedForAirPlayWithLinkType:");
}

id objc_msgSend__serverTCPEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverTCPEnsureStarted");
}

id objc_msgSend__serverTCPEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverTCPEnsureStopped");
}

id objc_msgSend__serverTCPHandleConnectionEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverTCPHandleConnectionEnded:");
}

id objc_msgSend__serverTCPHandleConnectionStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverTCPHandleConnectionStarted:");
}

id objc_msgSend__serverTCPHasActiveConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverTCPHasActiveConnections");
}

id objc_msgSend__serverTCPRemoveConnectionsWithIdentifier_exceptConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverTCPRemoveConnectionsWithIdentifier:exceptConnection:");
}

id objc_msgSend__sessionHandlePeerDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionHandlePeerDisconnect:");
}

id objc_msgSend__sessionsActiveOnConnection_xpcConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionsActiveOnConnection:xpcConnection:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setupHIDGCDeviceWithOptions_andReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupHIDGCDeviceWithOptions:andReturnError:");
}

id objc_msgSend__setupHIDGCSenderIDIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupHIDGCSenderIDIfNeeded");
}

id objc_msgSend__setupHIDSenderIDIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupHIDSenderIDIfNeeded");
}

id objc_msgSend__setupHIDTouchDeviceAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupHIDTouchDeviceAndReturnError:");
}

id objc_msgSend__setupHome(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupHome");
}

id objc_msgSend__shouldReceiveActivityLevelOverWiFi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReceiveActivityLevelOverWiFi:");
}

id objc_msgSend__shouldSendActivityLevelOverWiFi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSendActivityLevelOverWiFi");
}

id objc_msgSend__shouldThrottleFriendSyncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldThrottleFriendSyncing");
}

id objc_msgSend__showContinuityCameraDisabledAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showContinuityCameraDisabledAlert");
}

id objc_msgSend__signatureWithSelfIdentity_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signatureWithSelfIdentity:data:");
}

id objc_msgSend__siriEnsureStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_siriEnsureStarted");
}

id objc_msgSend__siriEnsureStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_siriEnsureStopped");
}

id objc_msgSend__sleepSystemWithResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sleepSystemWithResponseHandler:");
}

id objc_msgSend__startBecomeInitiatorTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startBecomeInitiatorTimer");
}

id objc_msgSend__startDiscoverySessionExpirationTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDiscoverySessionExpirationTimer");
}

id objc_msgSend__startInSessionDeviceLostTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startInSessionDeviceLostTimer");
}

id objc_msgSend__startInitiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startInitiator");
}

id objc_msgSend__startInitiatorLimitTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startInitiatorLimitTimer");
}

id objc_msgSend__startPairingServerWithPassword_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startPairingServerWithPassword:completion:");
}

id objc_msgSend__startPollingCoolDownTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startPollingCoolDownTimer");
}

id objc_msgSend__startReceiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startReceiver");
}

id objc_msgSend__startTransactionControllerIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTransactionControllerIfNeeded");
}

id objc_msgSend__stationaryDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stationaryDevice");
}

id objc_msgSend__stereoDeviceUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stereoDeviceUpdate:");
}

id objc_msgSend__stopBecomeInitiatorTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopBecomeInitiatorTimer");
}

id objc_msgSend__stopConnectToReceiverTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopConnectToReceiverTimer");
}

id objc_msgSend__stopInitiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopInitiator");
}

id objc_msgSend__stopInitiatorLimitTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopInitiatorLimitTimer");
}

id objc_msgSend__stopObservingOnenessEnabledState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopObservingOnenessEnabledState");
}

id objc_msgSend__stopPollingCoolDownTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopPollingCoolDownTimer");
}

id objc_msgSend__stopReceiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopReceiver");
}

id objc_msgSend__stopTimers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopTimers");
}

id objc_msgSend__stopTransactionControllerIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopTransactionControllerIfNeeded");
}

id objc_msgSend__stripFZIDPrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stripFZIDPrefix");
}

id objc_msgSend__supportsApplicationLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportsApplicationLabel:");
}

id objc_msgSend__transportServiceMetadataWithServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transportServiceMetadataWithServiceType:");
}

id objc_msgSend__triggerKeychainRefetch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerKeychainRefetch");
}

id objc_msgSend__unregisterWombatStateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterWombatStateNotifications");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_update");
}

id objc_msgSend__updateAssertions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAssertions");
}

id objc_msgSend__updateCameraCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCameraCapabilities");
}

id objc_msgSend__updateErrorFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateErrorFlags");
}

id objc_msgSend__updateFamilyAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFamilyAccounts");
}

id objc_msgSend__updateFamilyDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFamilyDevices");
}

id objc_msgSend__updateFamilyIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFamilyIdentities");
}

id objc_msgSend__updateFamilyIdentityWithFamilyMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFamilyIdentityWithFamilyMember:");
}

id objc_msgSend__updateFamilyNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFamilyNotification");
}

id objc_msgSend__updateFamilySyncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFamilySyncing");
}

id objc_msgSend__updateForXPCClientChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForXPCClientChange");
}

id objc_msgSend__updateForXPCServerChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForXPCServerChange");
}

id objc_msgSend__updateFriendAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFriendAccounts");
}

id objc_msgSend__updateFriendDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFriendDevices");
}

id objc_msgSend__updateFriendIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFriendIdentities");
}

id objc_msgSend__updateFriendIdentityWithAppleID_contactID_sendersKnownAlias_userAdded_updateDateRequested_suggestedContactIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:");
}

id objc_msgSend__updateFriendPrivacy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFriendPrivacy");
}

id objc_msgSend__updateFriendPrivacyResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFriendPrivacyResults:");
}

id objc_msgSend__updateFriendSyncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFriendSyncing");
}

id objc_msgSend__updateIdentityType_idsDeviceID_appleID_contactID_msg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateIdentityType:idsDeviceID:appleID:contactID:msg:");
}

id objc_msgSend__updateNearFieldDiscoveryPref(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateNearFieldDiscoveryPref");
}

id objc_msgSend__updatePairedDeviceIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePairedDeviceIdentities");
}

id objc_msgSend__updatePersonalRequestsStateForHomeHubDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePersonalRequestsStateForHomeHubDevices");
}

id objc_msgSend__updatePolling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePolling");
}

id objc_msgSend__updateRBSMonitorStateForXPCClients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRBSMonitorStateForXPCClients");
}

id objc_msgSend__updateSameAccountIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSameAccountIdentities");
}

id objc_msgSend__updateSelfIdentityPrivate_create_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSelfIdentityPrivate:create:");
}

id objc_msgSend__updateSelfIdentityPublic_privateIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSelfIdentityPublic:privateIdentity:");
}

id objc_msgSend__updateXPCMatchingDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateXPCMatchingDiscovery");
}

id objc_msgSend__wakeSystemWithResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wakeSystemWithResponseHandler:");
}

id objc_msgSend__xpcConnectionInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcConnectionInvalidated:");
}

id objc_msgSend__xpcConnections_withControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcConnections:withControlFlags:");
}

id objc_msgSend__xpcPublisherAddToken_event_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcPublisherAddToken:event:");
}

id objc_msgSend__xpcPublisherRemoveToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcPublisherRemoveToken:");
}

id objc_msgSend__xpcPublisherStateChangedForToken_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcPublisherStateChangedForToken:state:");
}

id objc_msgSend__xpcPublisherTriggeredToken_payload_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcPublisherTriggeredToken:payload:responseHandler:");
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessories");
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessory");
}

id objc_msgSend_accessoryWithSiriEndpointIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryWithSiriEndpointIdentifier:");
}

id objc_msgSend_accountAltDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountAltDSID");
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountID");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accounts");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_actionV2Devices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionV2Devices");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAndReturnError:");
}

id objc_msgSend_activateDirectAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateDirectAndReturnError:");
}

id objc_msgSend_activateForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateForClient:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activatedAdvertiser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedAdvertiser");
}

id objc_msgSend_activatedDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedDiscovery");
}

id objc_msgSend_activatedServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedServer");
}

id objc_msgSend_activatedSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedSession");
}

id objc_msgSend_activeNetCnx(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeNetCnx");
}

id objc_msgSend_activeServers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeServers");
}

id objc_msgSend_activityLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityLevel");
}

id objc_msgSend_adHocPairingIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocPairingIdentifier");
}

id objc_msgSend_addAgentClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAgentClient");
}

id objc_msgSend_addConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConnection:");
}

id objc_msgSend_addDeviceToApplicationServiceMapping_device_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeviceToApplicationServiceMapping:device:completion:");
}

id objc_msgSend_addDiscoveryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDiscoveryType:");
}

id objc_msgSend_addEndpointMapping_endpointID_applicationService_discoverySessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndpointMapping:endpointID:applicationService:discoverySessionID:");
}

id objc_msgSend_addEndpointMapping_endpointID_applicationService_discoverySessionID_shouldAutomapListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addIncomingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIncomingConnection:");
}

id objc_msgSend_addListenerAgentClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerAgentClient:");
}

id objc_msgSend_addMappingForDevice_endpointID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMappingForDevice:endpointID:");
}

id objc_msgSend_addNeedsAWDLPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNeedsAWDLPeer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOrUpdateAdHocPairedIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateAdHocPairedIdentity:");
}

id objc_msgSend_addOrUpdateAdHocPairedIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateAdHocPairedIdentity:error:");
}

id objc_msgSend_addOrUpdateIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateIdentity:error:");
}

id objc_msgSend_addOrUpdateOrReAddItem_logCategory_logLabel_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateOrReAddItem:logCategory:logLabel:error:");
}

id objc_msgSend_addPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPolicy:");
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSample:");
}

id objc_msgSend_addSelfIdentityInfoToMessage_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSelfIdentityInfoToMessage:flags:");
}

id objc_msgSend_addSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSession:");
}

id objc_msgSend_addXPCMatchingToken_event_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addXPCMatchingToken:event:handler:");
}

id objc_msgSend_advertiseDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertiseDescriptor");
}

id objc_msgSend_advertiseDeviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertiseDeviceName");
}

id objc_msgSend_advertisementData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisementData");
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisementFields");
}

id objc_msgSend_advertisingAddressDataNonConnectable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advertisingAddressDataNonConnectable");
}

id objc_msgSend_ageOutEndpointMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ageOutEndpointMapping:");
}

id objc_msgSend_ageOutListenerTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ageOutListenerTimer");
}

id objc_msgSend_ageOutTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ageOutTimeout");
}

id objc_msgSend_agentClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "agentClient");
}

id objc_msgSend_agentClientID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "agentClientID");
}

id objc_msgSend_aliasStrings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aliasStrings");
}

id objc_msgSend_allInterfaces(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allInterfaces");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allUsedSendersKnownAliases(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allUsedSendersKnownAliases");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowedMACAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedMACAddresses");
}

id objc_msgSend_altIRK(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "altIRK");
}

id objc_msgSend_angelAssertionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "angelAssertionName");
}

id objc_msgSend_angelJobLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "angelJobLabel");
}

id objc_msgSend_appID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appID");
}

id objc_msgSend_appSignIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appSignIn");
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

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleID");
}

id objc_msgSend_applicationLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationLabel");
}

id objc_msgSend_applicationService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationService");
}

id objc_msgSend_apply(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apply");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertions");
}

id objc_msgSend_assistantAccessControlForHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assistantAccessControlForHome:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_authTagForData_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authTagForData:type:error:");
}

id objc_msgSend_automapped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automapped");
}

id objc_msgSend_awdlGuestDiscoveryTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "awdlGuestDiscoveryTimeout");
}

id objc_msgSend_becomeInitiatorTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeInitiatorTimer");
}

id objc_msgSend_beginTransaction_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransaction:completionHandler:");
}

id objc_msgSend_bleAdvertisementData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleAdvertisementData");
}

id objc_msgSend_bleClientUseCase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleClientUseCase");
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleDevice");
}

id objc_msgSend_bleDeviceAcceptedInvitations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleDeviceAcceptedInvitations");
}

id objc_msgSend_bleDeviceAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleDeviceAddress");
}

id objc_msgSend_bleDeviceWantingInvitations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleDeviceWantingInvitations");
}

id objc_msgSend_blePeerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blePeerIdentifier");
}

id objc_msgSend_bleScanRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleScanRate");
}

id objc_msgSend_bleScanRateScreenOff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleScanRateScreenOff");
}

id objc_msgSend_bleScreenOffRescanInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleScreenOffRescanInterval");
}

id objc_msgSend_bleScreenOffScanRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleScreenOffScanRate");
}

id objc_msgSend_bleTargetData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleTargetData");
}

id objc_msgSend_bluetoothAddressData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothAddressData");
}

id objc_msgSend_bonjourDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bonjourDevice");
}

id objc_msgSend_bonjourListenerUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bonjourListenerUUID");
}

id objc_msgSend_bonjourPeerDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bonjourPeerDevice");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_browseClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browseClient");
}

id objc_msgSend_browseDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browseDescriptor");
}

id objc_msgSend_browseInvitationScope(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browseInvitationScope");
}

id objc_msgSend_browseResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browseResponse");
}

id objc_msgSend_browseSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browseSession");
}

id objc_msgSend_btAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btAddress");
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btAddressData");
}

id objc_msgSend_btIRKData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btIRKData");
}

id objc_msgSend_btPipe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btPipe");
}

id objc_msgSend_btPipeHighPriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "btPipeHighPriority");
}

id objc_msgSend_bundleIdentifiersForMachOUUIDs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifiersForMachOUUIDs:error:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cameraCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraCapabilities");
}

id objc_msgSend_cameraCapabilitiesRefetchTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraCapabilitiesRefetchTimer");
}

id objc_msgSend_cameraCapabilityRequestIsActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraCapabilityRequestIsActive");
}

id objc_msgSend_canSend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSend");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_cbDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cbDevice");
}

id objc_msgSend_chFieldType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chFieldType");
}

id objc_msgSend_changeFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeFlags");
}

id objc_msgSend_changed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changed");
}

id objc_msgSend_clearCameraCapabilitiesRefetchTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCameraCapabilitiesRefetchTimer");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "client");
}

id objc_msgSend_clientDevice_updatedMeasurement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientDevice:updatedMeasurement:");
}

id objc_msgSend_clientDeviceChanged_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientDeviceChanged:changes:");
}

id objc_msgSend_clientDeviceFound_report_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientDeviceFound:report:");
}

id objc_msgSend_clientDeviceLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientDeviceLost:");
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientID");
}

id objc_msgSend_clientMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientMode");
}

id objc_msgSend_clientNetCnx(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientNetCnx");
}

id objc_msgSend_clientPeopleStatusChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientPeopleStatusChanged:");
}

id objc_msgSend_cloudServiceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudServiceID");
}

id objc_msgSend_cnx(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cnx");
}

id objc_msgSend_cnxHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cnxHandler");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_companionLinkAuthCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkAuthCompleted:");
}

id objc_msgSend_companionLinkChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkChangedDevice:changes:");
}

id objc_msgSend_companionLinkFoundDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkFoundDevice:");
}

id objc_msgSend_companionLinkHandleDisconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkHandleDisconnect");
}

id objc_msgSend_companionLinkLocalDeviceUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkLocalDeviceUpdated:");
}

id objc_msgSend_companionLinkLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkLostDevice:");
}

id objc_msgSend_companionLinkPromptForPasswordType_flags_throttleSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkPromptForPasswordType:flags:throttleSeconds:");
}

id objc_msgSend_companionLinkReceivedEventID_event_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkReceivedEventID:event:options:");
}

id objc_msgSend_companionLinkReceivedRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkReceivedRequestID:request:options:responseHandler:");
}

id objc_msgSend_companionLinkRemoveLocalDeviceAsContextCollector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkRemoveLocalDeviceAsContextCollector:");
}

id objc_msgSend_companionLinkUpdateClientState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkUpdateClientState:");
}

id objc_msgSend_companionLinkUpdateErrorFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionLinkUpdateErrorFlags:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compareWithDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareWithDeviceIdentifier:");
}

id objc_msgSend_compareWithRPIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareWithRPIdentity:");
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectToOneAPIPeer_inboundConnection_applicationService_listenerID_automapListener_connectionID_connectHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToOneAPIPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:");
}

id objc_msgSend_connectToPeer_inboundConnection_applicationService_listenerID_automapListener_connectionID_connectHandler_lostHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToPeer:inboundConnection:applicationService:listenerID:automapListener:connectionID:connectHandler:lostHandler:");
}

id objc_msgSend_connectToPeer_inboundConnection_applicationService_listenerID_connectionID_connectHandler_disconnectHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHandler:disconnectHandler:");
}

id objc_msgSend_connectToReceiverTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToReceiverTimer");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionDate");
}

id objc_msgSend_connectionHandoverRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionHandoverRequest");
}

id objc_msgSend_connectionHandoverSelect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionHandoverSelect");
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionInvalidated");
}

id objc_msgSend_connectionInvalidatedCore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionInvalidatedCore");
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionUUID");
}

id objc_msgSend_contactID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactID");
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactIdentifier");
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

id objc_msgSend_continuityCaptureCameraCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continuityCaptureCameraCapabilities");
}

id objc_msgSend_controlCodeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlCodeToString:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlFlags");
}

id objc_msgSend_controlObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlObject:");
}

id objc_msgSend_convertBrowseParamsToControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertBrowseParamsToControlFlags:");
}

id objc_msgSend_convertBrowseScopeToControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertBrowseScopeToControlFlags:");
}

id objc_msgSend_convertConnectionParametersToControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertConnectionParametersToControlFlags:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemMatchingItem_flags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemMatchingItem:flags:error:");
}

id objc_msgSend_copyItemsMatchingItem_flags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemsMatchingItem:flags:error:");
}

id objc_msgSend_copyMyAppleIDAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMyAppleIDAndReturnError:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_createAuthenticationPayloadWithPkData_bonjourListenerUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAuthenticationPayloadWithPkData:bonjourListenerUUID:");
}

id objc_msgSend_createBrowseAgent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBrowseAgent");
}

id objc_msgSend_createConnectionFramer_assign_local_remote_incomingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConnectionFramer:assign:local:remote:incomingConnection:");
}

id objc_msgSend_createDeviceToEndpointMappingForDeviceID_endpointUUID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDeviceToEndpointMappingForDeviceID:endpointUUID:error:");
}

id objc_msgSend_createListenerFramer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createListenerFramer:");
}

id objc_msgSend_createNWEndpointForEndpoint_agentID_applicationService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNWEndpointForEndpoint:agentID:applicationService:");
}

id objc_msgSend_createNWEndpointWithID_agentID_applicationService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNWEndpointWithID:agentID:applicationService:");
}

id objc_msgSend_createNearbyInvitationConnectionFramer_assign_local_remote_incomingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:");
}

id objc_msgSend_createNetworkAgent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNetworkAgent");
}

id objc_msgSend_createRapportServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRapportServer");
}

id objc_msgSend_createRequestMessageWithApplicationLabel_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRequestMessageWithApplicationLabel:payload:");
}

id objc_msgSend_createResponseWithApplicationLabel_payload_forRequestMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createResponseWithApplicationLabel:payload:forRequestMessage:");
}

id objc_msgSend_createTapEventWithApplicationLabel_singleBandAWDLModeRequested_pkData_bonjourListenerUUID_identity_isUnsupportedApplicationLabel_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTapEventWithApplicationLabel:singleBandAWDLModeRequested:pkData:bonjourListenerUUID:identity:isUnsupportedApplicationLabel:flags:");
}

id objc_msgSend_createValidationPayloadWithKnownIdentity_supportsApplicationLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createValidationPayloadWithKnownIdentity:supportsApplicationLabel:");
}

id objc_msgSend_cuValueForEntitlementNoCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cuValueForEntitlementNoCache:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentContext");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentHome(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHome");
}

id objc_msgSend_currentPreferredPollingType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPreferredPollingType");
}

id objc_msgSend_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentState");
}

id objc_msgSend_currentTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTransaction");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUser");
}

id objc_msgSend_currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:");
}

id objc_msgSend_customEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customEntitlement:");
}

id objc_msgSend_daemonDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonDevice");
}

id objc_msgSend_daemonInfoChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonInfoChanged:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSource");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateAcknowledged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateAcknowledged");
}

id objc_msgSend_dateAdded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateAdded");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateRemoved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateRemoved");
}

id objc_msgSend_dateRequested(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateRequested");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decryptedActivityLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decryptedActivityLevel");
}

id objc_msgSend_dedicatedDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dedicatedDevice");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deregisterEventID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterEventID:");
}

id objc_msgSend_deregisterRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterRequestID:");
}

id objc_msgSend_deregisteredEventID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisteredEventID:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionWithLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionWithLevel:");
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationDevice");
}

id objc_msgSend_detailedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailedDescription");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device");
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceActionType");
}

id objc_msgSend_deviceAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceAddress");
}

id objc_msgSend_deviceClassCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceClassCode");
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceColor");
}

id objc_msgSend_deviceConfirmedIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceConfirmedIdentifier");
}

id objc_msgSend_deviceFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceFilter");
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceFlags");
}

id objc_msgSend_deviceIRKData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIRKData");
}

id objc_msgSend_deviceIdentifer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIdentifer");
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceInfo");
}

id objc_msgSend_deviceModelCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceModelCode");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceName");
}

id objc_msgSend_devicePresenceNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePresenceNotifier");
}

id objc_msgSend_devicePresencePreset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePresencePreset");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_deviceUniqueID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceUniqueID");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devices");
}

id objc_msgSend_diagnosticCommand_params_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticCommand:params:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didBeginTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didBeginTransaction:");
}

id objc_msgSend_didChangeStateForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeStateForTransaction:");
}

id objc_msgSend_didDetectDeviceNearbyWithInitiatorRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDetectDeviceNearbyWithInitiatorRole:");
}

id objc_msgSend_didUpdateTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateTransaction:");
}

id objc_msgSend_direct(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "direct");
}

id objc_msgSend_disabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabled");
}

id objc_msgSend_disabledUntilTicks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabledUntilTicks");
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryFlags");
}

id objc_msgSend_discoveryMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryMode");
}

id objc_msgSend_discoveryTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoveryTimer");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distance");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_duetSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duetSync");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_edPKData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "edPKData");
}

id objc_msgSend_edSKData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "edSKData");
}

id objc_msgSend_effectiveIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveIdentifier");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabled");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeSensitiveProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeSensitiveProperties");
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransaction:");
}

id objc_msgSend_endpointUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointUUID");
}

id objc_msgSend_endpoints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpoints");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorFlags");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "event");
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventID");
}

id objc_msgSend_executeAgentLogicInPersona_pid_handlerDescription_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeAgentLogicInPersona:pid:handlerDescription:handler:");
}

id objc_msgSend_failWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithError:");
}

id objc_msgSend_failedToConnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedToConnect");
}

id objc_msgSend_familyEndpointData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyEndpointData");
}

id objc_msgSend_familyMembers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyMembers");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureFlags");
}

id objc_msgSend_featureFlagsForIdentityMatchingIDSDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureFlagsForIdentityMatchingIDSDeviceIdentifier:");
}

id objc_msgSend_findAgentClient_tryPort_isTCP_isFlowHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findAgentClient:tryPort:isTCP:isFlowHandler:");
}

id objc_msgSend_findAgentClientFromConnectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findAgentClientFromConnectionID:");
}

id objc_msgSend_findAgentClientPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findAgentClientPort:");
}

id objc_msgSend_findAuthAWDLPairingModeDeviceForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findAuthAWDLPairingModeDeviceForIdentifier:");
}

id objc_msgSend_findConnectedDeviceForIdentifier_controlFlags_cnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findConnectedDeviceForIdentifier:controlFlags:cnx:");
}

id objc_msgSend_findContact_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findContact:completion:");
}

id objc_msgSend_findDeviceFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findDeviceFromID:");
}

id objc_msgSend_findEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEndpoint:");
}

id objc_msgSend_findListenerAgentClientFromApplicationServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findListenerAgentClientFromApplicationServiceName:");
}

id objc_msgSend_findListenerAndCreateConnection_version_applicationService_listenerID_connectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:");
}

id objc_msgSend_findListenerForAgentClient_sender_browseRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findListenerForAgentClient:sender:browseRequest:");
}

id objc_msgSend_findListenerForID_applicationService_fromPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findListenerForID:applicationService:fromPeer:");
}

id objc_msgSend_findNearbyInvitationListenerAndCreateConnection_applicationService_listenerID_connectionID_agentClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findNearbyInvitationListenerAndCreateConnection:applicationService:listenerID:connectionID:agentClient:");
}

id objc_msgSend_findServerClientFromID_senderIDS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findServerClientFromID:senderIDS:");
}

id objc_msgSend_findUnauthDeviceForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findUnauthDeviceForIdentifier:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstUnlocked");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flags");
}

id objc_msgSend_flowAssignHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flowAssignHandler");
}

id objc_msgSend_flowClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flowClient");
}

id objc_msgSend_frameType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frameType");
}

id objc_msgSend_framer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "framer");
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromID");
}

id objc_msgSend_getBundleIDForPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBundleIDForPID:");
}

id objc_msgSend_getConnectionWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getConnectionWithID:");
}

id objc_msgSend_getDeviceClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDeviceClass");
}

id objc_msgSend_getDiscoveryDeviceTypesDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDiscoveryDeviceTypesDescription:");
}

id objc_msgSend_getFamilyDeviceIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFamilyDeviceIdentities");
}

id objc_msgSend_getFamilyURIs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFamilyURIs");
}

id objc_msgSend_getFriendDeviceIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFriendDeviceIdentities");
}

id objc_msgSend_getLogInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLogInfo");
}

id objc_msgSend_getNonConnectableIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNonConnectableIdentity");
}

id objc_msgSend_getPairedPeersWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPairedPeersWithOptions:completion:");
}

id objc_msgSend_getPairingIdentityFromHomeWithAccessory_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPairingIdentityFromHomeWithAccessory:completionHandler:");
}

id objc_msgSend_getPairingIdentityWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPairingIdentityWithOptions:completion:");
}

id objc_msgSend_getPeopleSuggestions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPeopleSuggestions:completion:");
}

id objc_msgSend_getPersonaFromParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPersonaFromParameters:");
}

id objc_msgSend_getTypeDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTypeDescription");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:");
}

id objc_msgSend_getVolume_forCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getVolume:forCategory:");
}

id objc_msgSend_handleConnectionData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConnectionData:");
}

id objc_msgSend_handleConnectionRequest_agentClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConnectionRequest:agentClient:");
}

id objc_msgSend_handleDisconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDisconnect");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler");
}

id objc_msgSend_handles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handles");
}

id objc_msgSend_hasCurrentTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCurrentTransaction");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hidePasswordHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidePasswordHandler");
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "home");
}

id objc_msgSend_homeAccessControlForUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeAccessControlForUser:");
}

id objc_msgSend_homeHubDeviceForLaunchInstanceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeHubDeviceForLaunchInstanceID:");
}

id objc_msgSend_homeHubDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeHubDeviceWithIdentifier:");
}

id objc_msgSend_homeKitIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeKitIdentifier");
}

id objc_msgSend_homeKitIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeKitIdentity");
}

id objc_msgSend_homeKitIdentityUpdated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeKitIdentityUpdated");
}

id objc_msgSend_homeKitUserIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeKitUserIdentifiers");
}

id objc_msgSend_homePodVariant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homePodVariant");
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homes");
}

id objc_msgSend_hotspotInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hotspotInfo");
}

id objc_msgSend_idInfoForDestinations_service_infoTypes_options_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idInfoForDestinations:service:infoTypes:options:listenerID:queue:completionBlock:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_identitiesOfType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identitiesOfType:error:");
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_identityOfSelfAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityOfSelfAndReturnError:");
}

id objc_msgSend_identityOfTemporarySelfAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityOfTemporarySelfAndReturnError:");
}

id objc_msgSend_identityResolved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityResolved");
}

id objc_msgSend_identityVerified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityVerified");
}

id objc_msgSend_idsCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsCorrelationIdentifier");
}

id objc_msgSend_idsDeviceArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceArray");
}

id objc_msgSend_idsDeviceForBluetoothUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceForBluetoothUUID:");
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceID");
}

id objc_msgSend_idsDeviceIDSelf(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceIDSelf");
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceIdentifier");
}

id objc_msgSend_idsDeviceMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceMap");
}

id objc_msgSend_idsFamilyEndpointMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsFamilyEndpointMap");
}

id objc_msgSend_idsFamilyEndpointQueryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsFamilyEndpointQueryWithCompletion:");
}

id objc_msgSend_idsHandheldCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsHandheldCount");
}

id objc_msgSend_idsHasAppleTV(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsHasAppleTV");
}

id objc_msgSend_idsHasHomePod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsHasHomePod");
}

id objc_msgSend_idsHasMac(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsHasMac");
}

id objc_msgSend_idsHasRealityDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsHasRealityDevice");
}

id objc_msgSend_idsHasWatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsHasWatch");
}

id objc_msgSend_idsHasiPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsHasiPad");
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsIdentifier");
}

id objc_msgSend_idsIsSignedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsIsSignedIn");
}

id objc_msgSend_idsPersonalDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsPersonalDeviceIdentifier");
}

id objc_msgSend_inBubble(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inBubble");
}

id objc_msgSend_inDiscoverySession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inDiscoverySession");
}

id objc_msgSend_inbound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inbound");
}

id objc_msgSend_incomingConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incomingConnections");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:objCType:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConnection_dispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:dispatchQueue:");
}

id objc_msgSend_initWithDaemon_xpcCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDaemon:xpcCnx:");
}

id objc_msgSend_initWithDaemon_xpcConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDaemon:xpcConnection:");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithDevice_applicationService_endpointID_discoverySessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:applicationService:endpointID:discoverySessionID:");
}

id objc_msgSend_initWithDevice_applicationService_endpointID_discoverySessionID_shouldAutomapListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:applicationService:endpointID:discoverySessionID:shouldAutomapListener:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDispatchQueue:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithHomeMangerConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHomeMangerConfiguration:");
}

id objc_msgSend_initWithIdentifier_applicationLabel_pkData_bonjourListenerUUID_isSameAccount_contactID_accountID_forceSingleBandAWDLMode_knownIdentity_isUnsupportedApplicationLabel_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBandAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:");
}

id objc_msgSend_initWithInnerBoundary_outerBoundary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInnerBoundary:outerBoundary:error:");
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyOptions:valueOptions:capacity:");
}

id objc_msgSend_initWithKeychainDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeychainDictionaryRepresentation:");
}

id objc_msgSend_initWithKnownIdentity_supportsApplicationLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKnownIdentity:supportsApplicationLabel:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMetadata_applicationLabel_payload_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadata:applicationLabel:payload:version:");
}

id objc_msgSend_initWithName_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:devicePresencePreset:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithOptions_cachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:cachePolicy:");
}

id objc_msgSend_initWithOrder_result_conditions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrder:result:conditions:");
}

id objc_msgSend_initWithPairedPeer_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPairedPeer:type:");
}

id objc_msgSend_initWithPeer_session_inbound_internal_applicationService_connectionID_endpointID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:");
}

id objc_msgSend_initWithPeer_version_inbound_internal_applicationService_connectionID_endpointID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:");
}

id objc_msgSend_initWithPreferredPollingType_dispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredPollingType:dispatchQueue:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:");
}

id objc_msgSend_initWithRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRole:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithSingleBandModeRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSingleBandModeRequired:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_initWithTimeStamp_pkData_bonjourListenerUUID_selfIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeStamp:pkData:bonjourListenerUUID:selfIdentity:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithVersion_applicationLabel_serivceList_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVersion:applicationLabel:serivceList:userInfo:");
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiator");
}

id objc_msgSend_initiatorLimitTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatorLimitTimer");
}

id objc_msgSend_initiatorState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatorState");
}

id objc_msgSend_initiatorWithDelegate_callbackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatorWithDelegate:callbackQueue:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interestDeregisterEventID_peerIdentifier_owner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestDeregisterEventID:peerIdentifier:owner:");
}

id objc_msgSend_interestRegisterEventID_peerIdentifier_owner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestRegisterEventID:peerIdentifier:owner:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internal");
}

id objc_msgSend_internalAuthFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalAuthFlags");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateForClient:");
}

id objc_msgSend_invalidateTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateTransaction:");
}

id objc_msgSend_invalidateTransactionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateTransactionWithIdentifier:");
}

id objc_msgSend_invalidateTransactionWithIdentifier_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateTransactionWithIdentifier:context:");
}

id objc_msgSend_invalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateWithError:");
}

id objc_msgSend_invalidationHandled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidationHandled");
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidationHandler");
}

id objc_msgSend_ipAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ipAddress");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActive");
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplication");
}

id objc_msgSend_isBLEDeviceReplaced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBLEDeviceReplaced");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isContactValidForIdentity_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContactValidForIdentity:completionBlock:");
}

id objc_msgSend_isDeviceEnrolledWithDeKOTA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceEnrolledWithDeKOTA:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEnabledForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForType:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDevice:");
}

id objc_msgSend_isEqualToDeviceBasic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDeviceBasic:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isKnownIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKnownIdentity");
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMe");
}

id objc_msgSend_isNearbyActionV2AdvertiserActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNearbyActionV2AdvertiserActive");
}

id objc_msgSend_isOwner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOwner");
}

id objc_msgSend_isPersonal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPersonal");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isSingleBandModeRequired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSingleBandModeRequired");
}

id objc_msgSend_isTCP(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTCP");
}

id objc_msgSend_isUsingQUIC(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUsingQUIC");
}

id objc_msgSend_isValidTimeStamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidTimeStamp");
}

id objc_msgSend_isValidTimeStampSince_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidTimeStampSince:");
}

id objc_msgSend_keychainDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainDictionaryRepresentation");
}

id objc_msgSend_keychainStateString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainStateString");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_languageChangePending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageChangePending");
}

id objc_msgSend_launchInstanceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchInstanceID");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_linkType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkType");
}

id objc_msgSend_listAgentClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listAgentClients:");
}

id objc_msgSend_listAllowedApplicationServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listAllowedApplicationServices:");
}

id objc_msgSend_listConnections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listConnections:");
}

id objc_msgSend_listEndpoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listEndpoints:");
}

id objc_msgSend_listEndpointsForDiscoverySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listEndpointsForDiscoverySession:");
}

id objc_msgSend_listen_framer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listen_framer");
}

id objc_msgSend_listenerNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerNotifications");
}

id objc_msgSend_listeningPSM(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listeningPSM");
}

id objc_msgSend_listeningPort(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listeningPort");
}

id objc_msgSend_loadFamilyDeviceIdentitiesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFamilyDeviceIdentitiesWithError:");
}

id objc_msgSend_loadFriendDeviceIdentitiesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFriendDeviceIdentitiesWithError:");
}

id objc_msgSend_localDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localDeviceInfo");
}

id objc_msgSend_localDeviceUpdated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localDeviceUpdated");
}

id objc_msgSend_localEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localEndpoint");
}

id objc_msgSend_localValidationMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localValidationMessage");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_lockSessionToCurrentProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockSessionToCurrentProcess");
}

id objc_msgSend_logReceivedMessageType_identifier_options_appID_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logReceivedMessageType:identifier:options:appID:ctx:");
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loginID");
}

id objc_msgSend_longDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longDescription");
}

id objc_msgSend_manateeAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manateeAvailable");
}

id objc_msgSend_mappingID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mappingID");
}

id objc_msgSend_markConnectionAsTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markConnectionAsTriggered:");
}

id objc_msgSend_meDeviceFMFDeviceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meDeviceFMFDeviceID");
}

id objc_msgSend_meDeviceIDSDeviceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meDeviceIDSDeviceID");
}

id objc_msgSend_meDeviceIsMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meDeviceIsMe");
}

id objc_msgSend_meDeviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meDeviceName");
}

id objc_msgSend_meDeviceValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meDeviceValid");
}

id objc_msgSend_mediaProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaProfile");
}

id objc_msgSend_mediaRemoteID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRemoteID");
}

id objc_msgSend_mediaRemoteIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRemoteIdentifier");
}

id objc_msgSend_mediaRouteID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRouteID");
}

id objc_msgSend_mediaRouteIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRouteIdentifier");
}

id objc_msgSend_mediaSystemIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSystemIdentifier");
}

id objc_msgSend_mediaSystemIdentifierEffective(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSystemIdentifierEffective");
}

id objc_msgSend_mediaSystemName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSystemName");
}

id objc_msgSend_mediaSystemRole(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSystemRole");
}

id objc_msgSend_mediaSystemRoleEffective(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSystemRoleEffective");
}

id objc_msgSend_mediaSystemState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSystemState");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "message");
}

id objc_msgSend_messageWithConnectionHandoverRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithConnectionHandoverRequest:");
}

id objc_msgSend_messageWithConnectionHandoverSelect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithConnectionHandoverSelect:");
}

id objc_msgSend_messageWithMetadata_applicationLabel_payload_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithMetadata:applicationLabel:payload:version:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataWithDictionary:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "model");
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelIdentifier");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_msgCtx(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msgCtx");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nearFieldController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearFieldController");
}

id objc_msgSend_nearbyActionV2Type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyActionV2Type");
}

id objc_msgSend_nearbyInfoV2TempAuthTagData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInfoV2TempAuthTagData");
}

id objc_msgSend_nearbyInvitationChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationChangedDevice:changes:");
}

id objc_msgSend_nearbyInvitationConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationConnection");
}

id objc_msgSend_nearbyInvitationFoundDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationFoundDevice:");
}

id objc_msgSend_nearbyInvitationLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationLostDevice:");
}

id objc_msgSend_nearbyInvitationReceivedEventID_event_options_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationReceivedEventID:event:options:sessionID:");
}

id objc_msgSend_nearbyInvitationReceivedRequestID_request_options_responseHandler_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationReceivedRequestID:request:options:responseHandler:sessionID:");
}

id objc_msgSend_nearbyInvitationSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationSession");
}

id objc_msgSend_nearbyInvitationSessionEndedWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationSessionEndedWithID:");
}

id objc_msgSend_nearbyInvitationSessionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationSessionError:");
}

id objc_msgSend_nearbyInvitationSessionError_withID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationSessionError:withID:");
}

id objc_msgSend_nearbyInvitationStartServerSessionID_device_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyInvitationStartServerSessionID:device:completion:");
}

id objc_msgSend_needsAWDL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsAWDL");
}

id objc_msgSend_needsCLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsCLink");
}

id objc_msgSend_needsNearbyActionV2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsNearbyActionV2");
}

id objc_msgSend_netAgentUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "netAgentUUID:");
}

id objc_msgSend_netCnx(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "netCnx");
}

id objc_msgSend_netConnectionStartWithDevice_session_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "netConnectionStartWithDevice:session:error:");
}

id objc_msgSend_netFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "netFlags");
}

id objc_msgSend_networkAgentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkAgentID");
}

id objc_msgSend_nonWakingRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nonWakingRequest");
}

id objc_msgSend_notifyBluetoothSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyBluetoothSample:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_nsuuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nsuuid");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
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

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplicationWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplicationWithBundleID:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operatingSystemVersion");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_outgoingBuffer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outgoingBuffer");
}

id objc_msgSend_overrideScreenOff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideScreenOff");
}

id objc_msgSend_overrideScreenOffRescanInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideScreenOffRescanInterval");
}

id objc_msgSend_pairSetupACL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairSetupACL");
}

id objc_msgSend_pairVerifyAuthType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairVerifyAuthType");
}

id objc_msgSend_pairingInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingInfo");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "password");
}

id objc_msgSend_passwordType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordType");
}

id objc_msgSend_passwordTypeActual(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordTypeActual");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payload");
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peer");
}

id objc_msgSend_peerDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerDeviceInfo");
}

id objc_msgSend_peerDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerDevices");
}

id objc_msgSend_peerHostState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerHostState");
}

id objc_msgSend_peerID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerID");
}

id objc_msgSend_peerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerIdentifier");
}

id objc_msgSend_pendingInitiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingInitiator");
}

id objc_msgSend_pendingReceiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingReceiver");
}

id objc_msgSend_performLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performLog");
}

id objc_msgSend_personalDeviceState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalDeviceState");
}

id objc_msgSend_personalRequestsState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalRequestsState");
}

id objc_msgSend_personalRequestsStateForAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalRequestsStateForAccessory:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_pkData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pkData");
}

id objc_msgSend_pollingCoolDownTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pollingCoolDownTimer");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "port");
}

id objc_msgSend_postDaemonInfoChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postDaemonInfoChanges:");
}

id objc_msgSend_powerAssertionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerAssertionID");
}

id objc_msgSend_powerUnlimited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerUnlimited");
}

id objc_msgSend_predicateMatchingIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingIdentifiers:");
}

id objc_msgSend_preferredPollingType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredPollingType");
}

id objc_msgSend_prefsChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefsChanged");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "present");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousState");
}

id objc_msgSend_primaryAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryAppleID");
}

id objc_msgSend_primaryAppleIDIsHSA2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryAppleIDIsHSA2");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priority");
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateKey");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processSendsUsingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processSendsUsingConnection:");
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productVersion");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_proxyDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyDevices");
}

id objc_msgSend_publicIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicIdentifier");
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicKey");
}

id objc_msgSend_queryDeviceToApplicationServiceMapping_device_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryDeviceToApplicationServiceMapping:device:completion:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rapportIRK(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rapportIRK");
}

id objc_msgSend_rapportIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rapportIdentifier");
}

id objc_msgSend_receiveDataForConnection_statusHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveDataForConnection:statusHandler:");
}

id objc_msgSend_receiveWithRequestID_receiveHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveWithRequestID:receiveHandler:");
}

id objc_msgSend_receivedEventID_event_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedEventID:event:options:");
}

id objc_msgSend_receivedFamilyIdentityRequest_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedFamilyIdentityRequest:msgCtx:");
}

id objc_msgSend_receivedFamilyIdentityResponse_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedFamilyIdentityResponse:msgCtx:");
}

id objc_msgSend_receivedFamilyIdentityUpdate_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedFamilyIdentityUpdate:msgCtx:");
}

id objc_msgSend_receivedFriendIdentityRequest_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedFriendIdentityRequest:msgCtx:");
}

id objc_msgSend_receivedFriendIdentityResponse_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedFriendIdentityResponse:msgCtx:");
}

id objc_msgSend_receivedFriendIdentityUpdate_msgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedFriendIdentityUpdate:msgCtx:");
}

id objc_msgSend_receivedMessages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedMessages");
}

id objc_msgSend_receivedRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedRequestID:request:options:responseHandler:");
}

id objc_msgSend_receivedSiriAudioEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedSiriAudioEvent:");
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiver");
}

id objc_msgSend_receiverState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiverState");
}

id objc_msgSend_receiverWithDelegate_callbackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiverWithDelegate:callbackQueue:");
}

id objc_msgSend_reconfirm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconfirm");
}

id objc_msgSend_refreshIDInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshIDInfo");
}

id objc_msgSend_regenerateSelfIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regenerateSelfIdentity:");
}

id objc_msgSend_regenerateTemporarySelfIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regenerateTemporarySelfIdentity");
}

id objc_msgSend_registerEventID_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerEventID:options:handler:");
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerRequestID:options:handler:");
}

id objc_msgSend_registeredEventID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredEventID:");
}

id objc_msgSend_registeredEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredEvents");
}

id objc_msgSend_registeredRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredRequests");
}

id objc_msgSend_remoteAuthenticationMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteAuthenticationMessage");
}

id objc_msgSend_remoteDisplayAuthCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayAuthCompleted:");
}

id objc_msgSend_remoteDisplayChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayChangedDevice:changes:");
}

id objc_msgSend_remoteDisplayDedicatedDeviceChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayDedicatedDeviceChanged:");
}

id objc_msgSend_remoteDisplayDeviceSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayDeviceSelected:");
}

id objc_msgSend_remoteDisplayFoundDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayFoundDevice:");
}

id objc_msgSend_remoteDisplayHidePasswordWithFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayHidePasswordWithFlags:");
}

id objc_msgSend_remoteDisplayLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayLostDevice:");
}

id objc_msgSend_remoteDisplayNotifyDiscoverySessionState_forDevice_startReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayNotifyDiscoverySessionState:forDevice:startReason:");
}

id objc_msgSend_remoteDisplayPersonDeclined(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayPersonDeclined");
}

id objc_msgSend_remoteDisplayPromptForPasswordWithFlags_throttleSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayPromptForPasswordWithFlags:throttleSeconds:");
}

id objc_msgSend_remoteDisplayReceivedEventID_event_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayReceivedEventID:event:options:");
}

id objc_msgSend_remoteDisplayReceivedEventID_event_options_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayReceivedEventID:event:options:sessionID:");
}

id objc_msgSend_remoteDisplayReceivedRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayReceivedRequestID:request:options:responseHandler:");
}

id objc_msgSend_remoteDisplayReceivedRequestID_request_options_responseHandler_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayReceivedRequestID:request:options:responseHandler:sessionID:");
}

id objc_msgSend_remoteDisplaySessionEndedWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplaySessionEndedWithID:");
}

id objc_msgSend_remoteDisplaySessionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplaySessionError:");
}

id objc_msgSend_remoteDisplayShowPassword_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayShowPassword:flags:");
}

id objc_msgSend_remoteDisplayStartServerSessionID_device_linkType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayStartServerSessionID:device:linkType:completion:");
}

id objc_msgSend_remoteDisplayUpdateDataLinkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayUpdateDataLinkType:");
}

id objc_msgSend_remoteDisplayUpdateErrorFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteDisplayUpdateErrorFlags:");
}

id objc_msgSend_remoteIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteIdentity");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteValidationMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteValidationMessage");
}

id objc_msgSend_removeAgentClient_isFlowHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAgentClient:isFlowHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeBonjourDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeBonjourDevice:");
}

id objc_msgSend_removeCBDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCBDevice:");
}

id objc_msgSend_removeConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConnection:");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDevice:");
}

id objc_msgSend_removeDiscoverySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDiscoverySession:");
}

id objc_msgSend_removeDiscoverySession_lastEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDiscoverySession:lastEntry:");
}

id objc_msgSend_removeDiscoverySessionFromAllEndpoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDiscoverySessionFromAllEndpoints:");
}

id objc_msgSend_removeEndpointMapping_discoverySessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEndpointMapping:discoverySessionID:");
}

id objc_msgSend_removeEndpointMapping_discoverySessionID_immediate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEndpointMapping:discoverySessionID:immediate:");
}

id objc_msgSend_removeIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIdentity:error:");
}

id objc_msgSend_removeItemMatchingItem_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemMatchingItem:error:");
}

id objc_msgSend_removeListenerForApplicationService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeListenerForApplicationService:");
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

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeRPDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRPDevice:");
}

id objc_msgSend_removeSFDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSFDevice:");
}

id objc_msgSend_removeSessionPairedIdentityWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSessionPairedIdentityWithIdentifier:");
}

id objc_msgSend_removeTriggeredConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTriggeredConnection");
}

id objc_msgSend_removeXPCMatchingToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeXPCMatchingToken:");
}

id objc_msgSend_reportChangedDevice_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportChangedDevice:changes:");
}

id objc_msgSend_reportFoundDevice_outReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFoundDevice:outReason:");
}

id objc_msgSend_reportLostDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportLostDevice:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestID");
}

id objc_msgSend_requiredAgentDomain_agentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiredAgentDomain:agentType:");
}

id objc_msgSend_resetHomeKitUserIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetHomeKitUserIdentifiers");
}

id objc_msgSend_resolvableAccessories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvableAccessories");
}

id objc_msgSend_resolvableAccessoriesUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvableAccessoriesUpdated:");
}

id objc_msgSend_resolveIdentitiesForBonjourDevice_typeFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveIdentitiesForBonjourDevice:typeFlags:");
}

id objc_msgSend_resolveIdentityForBonjourDevice_typeFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveIdentityForBonjourDevice:typeFlags:");
}

id objc_msgSend_resolveIdentityForNearFieldMessagePayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveIdentityForNearFieldMessagePayload:");
}

id objc_msgSend_resolveIdentityForTempAuthTagData_bluetoothAddressData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveIdentityForTempAuthTagData:bluetoothAddressData:");
}

id objc_msgSend_resolvePeer_controlFlags_applicationService_clientPublicKey_resolveHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:");
}

id objc_msgSend_responseCodeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseCodeToString:");
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseHandler");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_roleBroadcastInBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roleBroadcastInBackground");
}

id objc_msgSend_room(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "room");
}

id objc_msgSend_roomName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roomName");
}

id objc_msgSend_rotatingIdentifierData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotatingIdentifierData");
}

id objc_msgSend_rpHomeKitManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpHomeKitManager");
}

id objc_msgSend_rpcFetchAndProcessChanges_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpcFetchAndProcessChanges:reply:");
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rssi");
}

id objc_msgSend_rssiThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rssiThreshold");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_runWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithConfiguration:");
}

id objc_msgSend_saveDedicatedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveDedicatedDevice:");
}

id objc_msgSend_saveIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveIdentity:error:");
}

id objc_msgSend_saveIdentityWithIDSDeviceID_message_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveIdentityWithIDSDeviceID:message:error:");
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanRate");
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenLocked");
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenOn");
}

id objc_msgSend_secretKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secretKey");
}

id objc_msgSend_seenBySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seenBySession:");
}

id objc_msgSend_selfAccessory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selfAccessory");
}

id objc_msgSend_selfAccessoryMediaAccessFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selfAccessoryMediaAccessFlags");
}

id objc_msgSend_selfAccessoryMediaAccessPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selfAccessoryMediaAccessPassword");
}

id objc_msgSend_selfAccessoryMediaSystem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selfAccessoryMediaSystem");
}

id objc_msgSend_selfAccessoryMediaSystemRole(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selfAccessoryMediaSystemRole");
}

id objc_msgSend_selfAccessorySiriEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selfAccessorySiriEnabled");
}

id objc_msgSend_sendData_fromAccount_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:fromAccount:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendData_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendDataForConnection_applicationService_connectionID_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataForConnection:applicationService:connectionID:responseHandler:");
}

id objc_msgSend_sendEncryptedEventID_data_xid_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEncryptedEventID:data:xid:options:completion:");
}

id objc_msgSend_sendEncryptedEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEncryptedEventID:event:options:completion:");
}

id objc_msgSend_sendEncryptedRequestID_request_xpcID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEncryptedRequestID:request:xpcID:options:responseHandler:");
}

id objc_msgSend_sendEventID_event_destinationID_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEventID:event:destinationID:options:completion:");
}

id objc_msgSend_sendEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEventID:event:options:completion:");
}

id objc_msgSend_sendHandoverRequest_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHandoverRequest:responseHandler:");
}

id objc_msgSend_sendHandoverSelect_delay_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHandoverSelect:delay:completionHandler:");
}

id objc_msgSend_sendHandoverSelect_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHandoverSelect:error:");
}

id objc_msgSend_sendIDSMessage_cloudServiceID_frameType_destinationDevice_sendFlags_msgCtx_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendIDSMessage:cloudServiceID:frameType:destinationDevice:sendFlags:msgCtx:error:");
}

id objc_msgSend_sendIDSMessage_cloudServiceID_frameType_destinationID_sendFlags_msgCtx_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendIDSMessage:cloudServiceID:frameType:destinationID:sendFlags:msgCtx:error:");
}

id objc_msgSend_sendReachabilityProbe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendReachabilityProbe:");
}

id objc_msgSend_sendRequestID_request_destinationID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestID:request:destinationID:options:responseHandler:");
}

id objc_msgSend_sendRequestID_request_destinationID_xpcID_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestID:request:destinationID:xpcID:options:responseHandler:");
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestID:request:options:responseHandler:");
}

id objc_msgSend_sendSampleForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSampleForDevice:");
}

id objc_msgSend_sendStatusUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendStatusUpdate:");
}

id objc_msgSend_sendStatusUpdateForConnection_connectionID_status_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendStatusUpdateForConnection:connectionID:status:responseHandler:");
}

id objc_msgSend_sendTicks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTicks");
}

id objc_msgSend_sendWithRequestID_data_status_applicationService_clientPublicKey_listenerID_automapListener_connectionID_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:");
}

id objc_msgSend_sendWithRequestID_data_status_applicationService_listenerID_connectionID_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:");
}

id objc_msgSend_senderCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderCorrelationIdentifier");
}

id objc_msgSend_sendersKnownAlias(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendersKnownAlias");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "server");
}

id objc_msgSend_serverNetCnxs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverNetCnxs");
}

id objc_msgSend_serversChangedState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serversChangedState");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceType");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_sessionActivatedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionActivatedWithError:");
}

id objc_msgSend_sessionEndedWithID_netCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionEndedWithID:netCnx:");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionID");
}

id objc_msgSend_sessionPairingIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionPairingIdentifier");
}

id objc_msgSend_sessionStartSend_session_xpcID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStartSend:session:xpcID:completion:");
}

id objc_msgSend_sessionStartWithID_netCnx_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStartWithID:netCnx:completion:");
}

id objc_msgSend_sessionStopSend_session_xpcID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStopSend:session:xpcID:completion:");
}

id objc_msgSend_sessionStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStopped:");
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessions");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessGroup:");
}

id objc_msgSend_setAccessibleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibleType:");
}

id objc_msgSend_setAccountAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountAltDSID:");
}

id objc_msgSend_setAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountID:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActiveServers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveServers:");
}

id objc_msgSend_setActivityLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityLevel:");
}

id objc_msgSend_setAdvertiseFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseFlags:");
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiseRate:");
}

id objc_msgSend_setAgeOutListenerTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgeOutListenerTimer:");
}

id objc_msgSend_setAgeOutTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgeOutTimeout:");
}

id objc_msgSend_setAgentClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgentClient:");
}

id objc_msgSend_setAgentClientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgentClientID:");
}

id objc_msgSend_setAgentUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgentUUID:");
}

id objc_msgSend_setAllUsedSendersKnownAliases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllUsedSendersKnownAliases:");
}

id objc_msgSend_setAllowedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedDevices:");
}

id objc_msgSend_setAllowedMACAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedMACAddresses:");
}

id objc_msgSend_setAltIRK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAltIRK:");
}

id objc_msgSend_setAngelAssertionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAngelAssertionName:");
}

id objc_msgSend_setAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAngelJobLabel:");
}

id objc_msgSend_setAppID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppID:");
}

id objc_msgSend_setAppSignIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppSignIn:");
}

id objc_msgSend_setAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppleID:");
}

id objc_msgSend_setApplicationService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationService:");
}

id objc_msgSend_setAuthCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthCompletionHandler:");
}

id objc_msgSend_setAutoMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoMapping:");
}

id objc_msgSend_setAutomapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomapped:");
}

id objc_msgSend_setBecomeInitiatorTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBecomeInitiatorTimer:");
}

id objc_msgSend_setBleClientUseCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleClientUseCase:");
}

id objc_msgSend_setBleConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleConnection:");
}

id objc_msgSend_setBleConnectionPSM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleConnectionPSM:");
}

id objc_msgSend_setBleDeviceAcceptedInvitations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleDeviceAcceptedInvitations:");
}

id objc_msgSend_setBleDeviceWantingInvitations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleDeviceWantingInvitations:");
}

id objc_msgSend_setBlePeerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlePeerIdentifier:");
}

id objc_msgSend_setBleRSSIThresholdHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleRSSIThresholdHint:");
}

id objc_msgSend_setBleScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleScanRate:");
}

id objc_msgSend_setBleScanRateScreenOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleScanRateScreenOff:");
}

id objc_msgSend_setBleScreenOffRescanInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleScreenOffRescanInterval:");
}

id objc_msgSend_setBleScreenOffScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleScreenOffScanRate:");
}

id objc_msgSend_setBluetoothAddressChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothAddressChangedHandler:");
}

id objc_msgSend_setBodyArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBodyArguments:");
}

id objc_msgSend_setBodyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBodyKey:");
}

id objc_msgSend_setBonjourDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBonjourDevice:");
}

id objc_msgSend_setBonjourPeerDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBonjourPeerDevice:");
}

id objc_msgSend_setBrowseClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrowseClient:");
}

id objc_msgSend_setBrowseFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrowseFlags:");
}

id objc_msgSend_setBrowseResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrowseResponse:");
}

id objc_msgSend_setBrowseSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrowseSession:");
}

id objc_msgSend_setBtAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtAddress:");
}

id objc_msgSend_setBtIRKData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtIRKData:");
}

id objc_msgSend_setBtPipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtPipe:");
}

id objc_msgSend_setBtPipeHighPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBtPipeHighPriority:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setCameraCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraCapabilities:");
}

id objc_msgSend_setCameraCapabilitiesRefetchTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraCapabilitiesRefetchTimer:");
}

id objc_msgSend_setCameraCapabilityRequestIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraCapabilityRequestIsActive:");
}

id objc_msgSend_setCategoryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryID:");
}

id objc_msgSend_setChangeFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeFlags:");
}

id objc_msgSend_setChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChanged:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setClientBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientBundleID:");
}

id objc_msgSend_setCloudDaemon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudDaemon:");
}

id objc_msgSend_setCloudServiceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudServiceID:");
}

id objc_msgSend_setCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCnx:");
}

id objc_msgSend_setCnxHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCnxHandler:");
}

id objc_msgSend_setConfigurePairingHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurePairingHandler:");
}

id objc_msgSend_setConnectToReceiverTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectToReceiverTimer:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConnectionEndedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionEndedHandler:");
}

id objc_msgSend_setConnectionPrepareHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionPrepareHandler:");
}

id objc_msgSend_setConnectionStartedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionStartedHandler:");
}

id objc_msgSend_setConnectionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionUUID:");
}

id objc_msgSend_setContactID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactID:");
}

id objc_msgSend_setContactIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIDs:");
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIdentifier:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setCopyIdentityHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCopyIdentityHandler:");
}

id objc_msgSend_setCurrentContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentContext:");
}

id objc_msgSend_setCurrentHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentHome:");
}

id objc_msgSend_setCurrentPreferredPollingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPreferredPollingType:");
}

id objc_msgSend_setCurrentTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTransaction:");
}

id objc_msgSend_setCurrentUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentUser:");
}

id objc_msgSend_setDaemon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemon:");
}

id objc_msgSend_setDaemonDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonDevice:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDateAcknowledged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateAcknowledged:");
}

id objc_msgSend_setDateAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateAdded:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateRemoved:");
}

id objc_msgSend_setDateRequested_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateRequested:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateQueue:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDestinationString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationString:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDeviceActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceActionType:");
}

id objc_msgSend_setDeviceAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceAddress:");
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceChangedHandler:");
}

id objc_msgSend_setDeviceColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceColor:");
}

id objc_msgSend_setDeviceConfirmedIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceConfirmedIdentifier:");
}

id objc_msgSend_setDeviceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFilter:");
}

id objc_msgSend_setDeviceFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFlags:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceIRKData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIRKData:");
}

id objc_msgSend_setDeviceInfoChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceInfoChangedHandler:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDeviceModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceModel:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDeviceRegionChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceRegionChangedHandler:");
}

id objc_msgSend_setDirect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirect:");
}

id objc_msgSend_setDisconnectHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisconnectHandler:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDiscoveryTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryTimer:");
}

id objc_msgSend_setDiscoveryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryType:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setEdPKData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdPKData:");
}

id objc_msgSend_setEdSKData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdSKData:");
}

id objc_msgSend_setEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmailAddress:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEncodeSensitiveProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEncodeSensitiveProperties:");
}

id objc_msgSend_setEndpointUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointUUID:");
}

id objc_msgSend_setEntitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitled:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorFlags:");
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorHandler:");
}

id objc_msgSend_setEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvent:");
}

id objc_msgSend_setEventID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventID:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFailedToConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailedToConnect:");
}

id objc_msgSend_setFamilyUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyUpdatedHandler:");
}

id objc_msgSend_setFeatureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeatureFlags:");
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstUnlockHandler:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setFlowAssignHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlowAssignHandler:");
}

id objc_msgSend_setFlowClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlowClient:");
}

id objc_msgSend_setFrameType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrameType:");
}

id objc_msgSend_setFramer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFramer:");
}

id objc_msgSend_setFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromID:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHidePasswordHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidePasswordHandler:");
}

id objc_msgSend_setHomeKitIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeKitIdentifier:");
}

id objc_msgSend_setHomeKitIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeKitIdentity:");
}

id objc_msgSend_setHomeKitManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeKitManager:");
}

id objc_msgSend_setHomeKitUserIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeKitUserIdentifier:");
}

id objc_msgSend_setHomeKitUserIdentifierHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeKitUserIdentifierHandler:");
}

id objc_msgSend_setHomeKitUserIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeKitUserIdentifiers:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentifierOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifierOverride:");
}

id objc_msgSend_setIdentityDaemon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentityDaemon:");
}

id objc_msgSend_setIdentityResolved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentityResolved:");
}

id objc_msgSend_setIdsCorrelationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsCorrelationIdentifier:");
}

id objc_msgSend_setIdsDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsDevice:");
}

id objc_msgSend_setIdsDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsDeviceID:");
}

id objc_msgSend_setIdsDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsDeviceIdentifier:");
}

id objc_msgSend_setIdsPersonalDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsPersonalDeviceIdentifier:");
}

id objc_msgSend_setInBubble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInBubble:");
}

id objc_msgSend_setInbound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInbound:");
}

id objc_msgSend_setInitiatorLimitTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitiatorLimitTimer:");
}

id objc_msgSend_setInitiatorState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitiatorState:");
}

id objc_msgSend_setInnerPresencePreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInnerPresencePreset:");
}

id objc_msgSend_setInnerRegionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInnerRegionName:");
}

id objc_msgSend_setInterfaceAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceAddress:");
}

id objc_msgSend_setInterfaceIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceIndex:");
}

id objc_msgSend_setInterfaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceName:");
}

id objc_msgSend_setInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternal:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandled:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setInvisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvisible:");
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsActive:");
}

id objc_msgSend_setIsBLEDeviceReplaced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBLEDeviceReplaced:");
}

id objc_msgSend_setIsConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsConnected:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setKeepAliveSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeepAliveSeconds:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLinkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkType:");
}

id objc_msgSend_setListenPSM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenPSM:");
}

id objc_msgSend_setListen_framer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListen_framer:");
}

id objc_msgSend_setListeningPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeningPort:");
}

id objc_msgSend_setLocalAuthenticationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalAuthenticationMessage:");
}

id objc_msgSend_setLocalDeviceInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceInfo:");
}

id objc_msgSend_setLocalDeviceUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalDeviceUpdated:");
}

id objc_msgSend_setLocalEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalEndpoint:");
}

id objc_msgSend_setLocalValidationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalValidationMessage:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setManateeChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManateeChangedHandler:");
}

id objc_msgSend_setMappingID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMappingID:");
}

id objc_msgSend_setMaxConnectionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConnectionCount:");
}

id objc_msgSend_setMaxDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxDelay:");
}

id objc_msgSend_setMaxPeople_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPeople:");
}

id objc_msgSend_setMeDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMeDeviceChangedHandler:");
}

id objc_msgSend_setMeasurementHandlerEx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMeasurementHandlerEx:");
}

id objc_msgSend_setMediaRemoteID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaRemoteID:");
}

id objc_msgSend_setMediaRemoteIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaRemoteIdentifier:");
}

id objc_msgSend_setMediaRouteID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaRouteID:");
}

id objc_msgSend_setMediaRouteIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaRouteIdentifier:");
}

id objc_msgSend_setMediaSystemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSystemIdentifier:");
}

id objc_msgSend_setMediaSystemIdentifierEffective_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSystemIdentifierEffective:");
}

id objc_msgSend_setMediaSystemName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSystemName:");
}

id objc_msgSend_setMediaSystemRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSystemRole:");
}

id objc_msgSend_setMediaSystemRoleEffective_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSystemRoleEffective:");
}

id objc_msgSend_setMediaSystemState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSystemState:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMessenger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessenger:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMinDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinDelay:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setMsgCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMsgCtx:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNearFieldController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearFieldController:");
}

id objc_msgSend_setNearbyActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionType:");
}

id objc_msgSend_setNearbyActionV2Flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionV2Flags:");
}

id objc_msgSend_setNearbyActionV2TargetData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionV2TargetData:");
}

id objc_msgSend_setNearbyActionV2Type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyActionV2Type:");
}

id objc_msgSend_setNearbyInvitationConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyInvitationConnection:");
}

id objc_msgSend_setNearbyInvitationServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyInvitationServer:");
}

id objc_msgSend_setNearbyInvitationSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyInvitationSession:");
}

id objc_msgSend_setNeedsAWDL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsAWDL:");
}

id objc_msgSend_setNeedsCLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsCLink:");
}

id objc_msgSend_setNeedsKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsKeyboard:");
}

id objc_msgSend_setNeedsNearbyActionV2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsNearbyActionV2:");
}

id objc_msgSend_setNetCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetCnx:");
}

id objc_msgSend_setNetFlagsChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetFlagsChangedHandler:");
}

id objc_msgSend_setNetLinkManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetLinkManager:");
}

id objc_msgSend_setNonWakingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNonWakingRequest:");
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

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOuterRegionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOuterRegionName:");
}

id objc_msgSend_setOutgoingBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoingBuffer:");
}

id objc_msgSend_setOverrideScreenOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideScreenOff:");
}

id objc_msgSend_setOverrideScreenOffRescanInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideScreenOffRescanInterval:");
}

id objc_msgSend_setPairSetupACL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairSetupACL:");
}

id objc_msgSend_setPairSetupDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairSetupDisabled:");
}

id objc_msgSend_setPairVerifyCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairVerifyCompletion:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPasswordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPasswordType:");
}

id objc_msgSend_setPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeer:");
}

id objc_msgSend_setPeerHostStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerHostStateChangedHandler:");
}

id objc_msgSend_setPeerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerID:");
}

id objc_msgSend_setPeerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerIdentifier:");
}

id objc_msgSend_setPeerUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeerUpdatedHandler:");
}

id objc_msgSend_setPeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeers:");
}

id objc_msgSend_setPendingInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingInitiator:");
}

id objc_msgSend_setPendingReceiver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingReceiver:");
}

id objc_msgSend_setPersistentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentIdentifier:");
}

id objc_msgSend_setPersonal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonal:");
}

id objc_msgSend_setPersonalDeviceState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalDeviceState:");
}

id objc_msgSend_setPersonalRequestsState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalRequestsState:");
}

id objc_msgSend_setPersonalRequestsStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalRequestsStateChangedHandler:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPid:");
}

id objc_msgSend_setPollingCoolDownTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPollingCoolDownTimer:");
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPort:");
}

id objc_msgSend_setPowerAssertionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerAssertionID:");
}

id objc_msgSend_setPowerUnlimitedChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPowerUnlimitedChangedHandler:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPreferredIdentityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredIdentityType:");
}

id objc_msgSend_setPreferredPollingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredPollingType:");
}

id objc_msgSend_setPresent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresent:");
}

id objc_msgSend_setPrimaryAppleIDChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryAppleIDChangedHandler:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPromptForPasswordHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptForPasswordHandler:");
}

id objc_msgSend_setProxyDeviceUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyDeviceUpdateHandler:");
}

id objc_msgSend_setProxyDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyDevices:");
}

id objc_msgSend_setPublicIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublicIdentifier:");
}

id objc_msgSend_setPublicKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublicKey:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRawRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawRSSI:");
}

id objc_msgSend_setReadErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadErrorHandler:");
}

id objc_msgSend_setReceivedEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedEventHandler:");
}

id objc_msgSend_setReceivedRequestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedRequestHandler:");
}

id objc_msgSend_setReceiverState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiverState:");
}

id objc_msgSend_setRelativeLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelativeLocation:");
}

id objc_msgSend_setRemoteAuthenticationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteAuthenticationMessage:");
}

id objc_msgSend_setRemoteIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteIdentity:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteValidationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteValidationMessage:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestID:");
}

id objc_msgSend_setResolvableAccessoriesChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvableAccessoriesChangedHandler:");
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseHandler:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setRoomName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoomName:");
}

id objc_msgSend_setRoomUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoomUpdatedHandler:");
}

id objc_msgSend_setRotatingIdentifierChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotatingIdentifierChangedHandler:");
}

id objc_msgSend_setRssiChangeDetection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssiChangeDetection:");
}

id objc_msgSend_setRssiThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRssiThreshold:");
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanRate:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setScreenLockedChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenLockedChangedHandler:");
}

id objc_msgSend_setScreenOnChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenOnChangedHandler:");
}

id objc_msgSend_setSecretKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecretKey:");
}

id objc_msgSend_setSelfAccessoryMediaAccessUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelfAccessoryMediaAccessUpdatedHandler:");
}

id objc_msgSend_setSelfAccessoryMediaSystemUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelfAccessoryMediaSystemUpdatedHandler:");
}

id objc_msgSend_setSelfAccessorySiriAccessUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelfAccessorySiriAccessUpdatedHandler:");
}

id objc_msgSend_setSelfAccessoryUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelfAccessoryUpdatedHandler:");
}

id objc_msgSend_setSendInterestEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendInterestEventHandler:");
}

id objc_msgSend_setSendTicks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendTicks:");
}

id objc_msgSend_setSendersKnownAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendersKnownAlias:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setServerNetCnxs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerNetCnxs:");
}

id objc_msgSend_setServersChangedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServersChangedState:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setServiceTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceTypes:");
}

id objc_msgSend_setSessionEndedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionEndedHandler:");
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionID:");
}

id objc_msgSend_setSessionStartHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionStartHandler:");
}

id objc_msgSend_setSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessions:");
}

id objc_msgSend_setShouldAutomapListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAutomapListener:");
}

id objc_msgSend_setShowPasswordHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPasswordHandler:");
}

id objc_msgSend_setSiriInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriInfo:");
}

id objc_msgSend_setSourceVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceVersion:");
}

id objc_msgSend_setStartTicks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTicks:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateChangedHandler:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setStatusChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusChangedHandler:");
}

id objc_msgSend_setStatusFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusFlags:");
}

id objc_msgSend_setSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncType:");
}

id objc_msgSend_setSystemNameChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemNameChangedHandler:");
}

id objc_msgSend_setTapEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTapEvent:");
}

id objc_msgSend_setTargetAuthTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetAuthTag:");
}

id objc_msgSend_setTargetData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetData:");
}

id objc_msgSend_setTcpConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTcpConnection:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTitleKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleKey:");
}

id objc_msgSend_setToID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToID:");
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToken:");
}

id objc_msgSend_setTrackPeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackPeers:");
}

id objc_msgSend_setTransactionChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionChangedHandler:");
}

id objc_msgSend_setTriggerEnhancedDiscovery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggerEnhancedDiscovery:");
}

id objc_msgSend_setTxtDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTxtDictionary:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUiTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUiTriggered:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUseCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseCase:");
}

id objc_msgSend_setUserAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAdded:");
}

id objc_msgSend_setUsingNearbyActionV2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingNearbyActionV2:");
}

id objc_msgSend_setUsingOnDemandConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingOnDemandConnection:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setViewHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewHint:");
}

id objc_msgSend_setVolumeTo_forCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeTo:forCategory:");
}

id objc_msgSend_setWaitingToConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitingToConnect:");
}

id objc_msgSend_setWasTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasTriggered:");
}

id objc_msgSend_setWifiStateChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiStateChangedHandler:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setXpcCnx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcCnx:");
}

id objc_msgSend_setXpcID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcID:");
}

id objc_msgSend_setupAssertHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAssertHandlers:");
}

id objc_msgSend_setupBrowseHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupBrowseHandlers");
}

id objc_msgSend_setupDaemonFramer_receiveHandler_closeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDaemonFramer:receiveHandler:closeHandler:");
}

id objc_msgSend_setupFlowHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupFlowHandlers");
}

id objc_msgSend_setupListenHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupListenHandlers");
}

id objc_msgSend_setupPolicyWithQueue_browseAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPolicyWithQueue:browseAgent:");
}

id objc_msgSend_setupResolveHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupResolveHandlers");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedCloudDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedCloudDaemon");
}

id objc_msgSend_sharedCompanionLinkDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedCompanionLinkDaemon");
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDaemon");
}

id objc_msgSend_sharedIdentityDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedIdentityDaemon");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedInvitationDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInvitationDaemon");
}

id objc_msgSend_sharedMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMetrics");
}

id objc_msgSend_sharedMetricsNoCreate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMetricsNoCreate");
}

id objc_msgSend_sharedNearFieldDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNearFieldDaemon");
}

id objc_msgSend_sharedNetworkAgent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNetworkAgent");
}

id objc_msgSend_sharedPeopleDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPeopleDaemon");
}

id objc_msgSend_sharedPrivateDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPrivateDaemon");
}

id objc_msgSend_sharedStatusDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedStatusDaemon");
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortDescription");
}

id objc_msgSend_shouldAutomapListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAutomapListener");
}

id objc_msgSend_shouldReportDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldReportDevice:");
}

id objc_msgSend_shouldReportDevice_toXPCConnectionWithLaunchInstanceID_outReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:");
}

id objc_msgSend_showPasswordHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPasswordHandler");
}

id objc_msgSend_sigTermPending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sigTermPending");
}

id objc_msgSend_signData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signData:error:");
}

id objc_msgSend_siriEndpointIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriEndpointIdentifier");
}

id objc_msgSend_siriEndpointProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriEndpointProfile");
}

id objc_msgSend_siriInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriInfo");
}

id objc_msgSend_sourceVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceVersion");
}

id objc_msgSend_speakText_flags_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speakText:flags:completion:");
}

id objc_msgSend_stableIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stableIdentifier");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startAgeOutTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAgeOutTimer");
}

id objc_msgSend_startConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConnection:");
}

id objc_msgSend_startDiscovery_applicationService_controlFlags_deviceFilter_connectedHandler_updateHandler_lostHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:");
}

id objc_msgSend_startDiscovery_controlFlags_deviceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDiscovery:controlFlags:deviceFilter:");
}

id objc_msgSend_startDiscovery_deviceTypes_controlFlags_deviceFilter_agentUUID_applicationService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDiscovery:deviceTypes:controlFlags:deviceFilter:agentUUID:applicationService:");
}

id objc_msgSend_startDiscovery_foundHandler_updateHandler_lostHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:");
}

id objc_msgSend_startListenerMappingTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListenerMappingTimeout:");
}

id objc_msgSend_startNearbyInvitationDiscovery_agentUUID_applicationService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startNearbyInvitationDiscovery:agentUUID:applicationService:");
}

id objc_msgSend_startObservingForAuthenticationStateChanges_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingForAuthenticationStateChanges:queue:");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_startServer_withCompletion_disconnectHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startServer:withCompletion:disconnectHandler:");
}

id objc_msgSend_startTicks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTicks");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_statusCodeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCodeToString:");
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusFlags");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAgentClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAgentClient");
}

id objc_msgSend_stopAllOutgoingConnectionsNotForPeer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAllOutgoingConnectionsNotForPeer:");
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopDiscovery");
}

id objc_msgSend_stopObservingForAuthenticationStateChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingForAuthenticationStateChanges");
}

id objc_msgSend_stopServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopServer");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subscriber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriber");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_supportedApplicationLabels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedApplicationLabels");
}

id objc_msgSend_supportsApplePay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsApplePay");
}

id objc_msgSend_supportsApplicationLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsApplicationLabel");
}

id objc_msgSend_supportsDataTransfer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsDataTransfer");
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemName");
}

id objc_msgSend_tapEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapEvent");
}

id objc_msgSend_targetAuthTag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetAuthTag");
}

id objc_msgSend_targetData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetData");
}

id objc_msgSend_targetWithProcessIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithProcessIdentity:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskState");
}

id objc_msgSend_tcpConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcpConnection");
}

id objc_msgSend_tcpListeningPort(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcpListeningPort");
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

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_toID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toID");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "token");
}

id objc_msgSend_trackPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackPeers");
}

id objc_msgSend_transactionChangedHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionChangedHandler");
}

id objc_msgSend_transactionController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionController");
}

id objc_msgSend_transactionController_didBeginTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionController:didBeginTransaction:");
}

id objc_msgSend_transactionController_didDetectDeviceNearbyWithInitiatorRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionController:didDetectDeviceNearbyWithInitiatorRole:");
}

id objc_msgSend_transactionController_didFinishTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionController:didFinishTransaction:error:");
}

id objc_msgSend_transactionController_requestMessageForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionController:requestMessageForType:");
}

id objc_msgSend_transactionController_responseMessageForRequestMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionController:responseMessageForRequestMessage:");
}

id objc_msgSend_transactionController_tapEventForApplicationLabel_singleBandAWDLModeRequested_pkData_bonjourListenerUUID_identity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionController:tapEventForApplicationLabel:singleBandAWDLModeRequested:pkData:bonjourListenerUUID:identity:");
}

id objc_msgSend_transportServiceList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transportServiceList");
}

id objc_msgSend_transportServicesMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transportServicesMetadata");
}

id objc_msgSend_transportServicesMetadataDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transportServicesMetadataDictionaryRepresentation");
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trigger");
}

id objc_msgSend_triggerEnhancedDiscovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerEnhancedDiscovery");
}

id objc_msgSend_triggerEnhancedDiscovery_useCase_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerEnhancedDiscovery:useCase:completion:");
}

id objc_msgSend_triggerEnhancedDiscoveryForReason_useCase_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerEnhancedDiscoveryForReason:useCase:error:");
}

id objc_msgSend_tryPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryPassword:");
}

id objc_msgSend_txtDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txtDictionary");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_uiTriggered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiTriggered");
}

id objc_msgSend_uid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uid:");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueID");
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIDOverride");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifier");
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

id objc_msgSend_updateAgentClientInfo_browseResponse_listener_bundleID_advertiseDescriptor_browseDescriptor_isFlowHandler_isUsingQUIC_isTCP_agentClientPID_persona_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateEndpointMapping_discoverySessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEndpointMapping:discoverySessionID:");
}

id objc_msgSend_updateErrorFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateErrorFlags:");
}

id objc_msgSend_updateFriendIdentityWithAppleID_contactID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFriendIdentityWithAppleID:contactID:");
}

id objc_msgSend_updateMappingForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMappingForDevice:");
}

id objc_msgSend_updateSessionPairedIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSessionPairedIdentity:");
}

id objc_msgSend_updateSharedTVIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSharedTVIdentities");
}

id objc_msgSend_updateTrustStatusFlagsWithIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrustStatusFlagsWithIdentity:");
}

id objc_msgSend_updateWithBonjourDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithBonjourDevice:");
}

id objc_msgSend_updateWithCBDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithCBDevice:");
}

id objc_msgSend_updateWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithEndpoint:");
}

id objc_msgSend_updateWithFamilyEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFamilyEndpoint:");
}

id objc_msgSend_updateWithIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithIdentity:");
}

id objc_msgSend_updateWithKeychainItem_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithKeychainItem:error:");
}

id objc_msgSend_updateWithRPDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRPDevice:");
}

id objc_msgSend_updateWithRPIdentity_revisionUpdate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRPIdentity:revisionUpdate:error:");
}

id objc_msgSend_updateWithRPMessage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRPMessage:error:");
}

id objc_msgSend_updateWithSFDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSFDevice:");
}

id objc_msgSend_updateWithSFDevice_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSFDevice:changes:");
}

id objc_msgSend_useCase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useCase");
}

id objc_msgSend_userAdded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAdded");
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userID");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "users");
}

id objc_msgSend_usingNearbyActionV2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usingNearbyActionV2");
}

id objc_msgSend_usingOnDemandConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usingOnDemandConnection");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_verifiedIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifiedIdentity");
}

id objc_msgSend_verifyAuthTag_data_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyAuthTag:data:type:error:");
}

id objc_msgSend_verifyAuthTagPtr_authTagLen_dataPtr_dataLen_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:");
}

id objc_msgSend_verifySignature_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifySignature:data:error:");
}

id objc_msgSend_verifyWithIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyWithIdentity:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "version");
}

id objc_msgSend_viewHint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewHint");
}

id objc_msgSend_waitingToConnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitingToConnect");
}

id objc_msgSend_wakeOnWirelessEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeOnWirelessEnabled");
}

id objc_msgSend_wifiFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiFlags");
}

id objc_msgSend_wifiState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiState");
}

id objc_msgSend_writeControlOnFramer_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeControlOnFramer:type:error:");
}

id objc_msgSend_writeDataOnFramer_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeDataOnFramer:data:");
}

id objc_msgSend_writeErrorOnFramer_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeErrorOnFramer:error:");
}

id objc_msgSend_xpcCnx(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcCnx");
}

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcConnectionInvalidated");
}

id objc_msgSend_xpcPeopleStatusChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcPeopleStatusChanged:");
}

id objc_msgSend_xpcPersonChanged_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcPersonChanged:changes:");
}

id objc_msgSend_xpcPersonFound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcPersonFound:");
}

id objc_msgSend_xpcPersonID_deviceID_updatedMeasurement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcPersonID:deviceID:updatedMeasurement:");
}

id objc_msgSend_xpcPersonLost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcPersonLost:");
}

id objc_msgSend_xpcPrivateAdvertiserActivate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcPrivateAdvertiserActivate:completion:");
}

id objc_msgSend_xpcPrivateDiscoveryActivate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcPrivateDiscoveryActivate:completion:");
}

id objc_msgSend_xpcServerHidePassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcServerHidePassword:");
}

id objc_msgSend_xpcServerShowPassword_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcServerShowPassword:flags:");
}

