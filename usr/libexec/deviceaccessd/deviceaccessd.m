void sub_100001C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a60, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001CEC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100001CFC(uint64_t a1)
{

}

void sub_100001D04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v2 + 40);
  v3 = CUDescriptionWithLevel(a2, *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  NSAppendPrintF(&obj, "%@\n", v4);
  objc_storeStrong((id *)(v2 + 40), obj);

}

void sub_100001D70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id obj;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "discoverySet"));
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "discoveryObj"));

  NSAppendPrintF(&obj, "AppID %@, clients %d, %@\n", v6, v8, v9);
  objc_storeStrong((id *)(v4 + 40), obj);

}

id sub_100001E78(uint64_t a1)
{
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer activate]_block_invoke", 30, "Activate");
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

id sub_1000021EC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcListenerEvent:", a2);
}

id sub_1000021F8(uint64_t a1)
{
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _activate]_block_invoke_2", 30, "Prefs changed");
  return objc_msgSend(*(id *)(a1 + 32), "_prefsChanged");
}

id sub_100002268(uint64_t a1)
{
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _activate]_block_invoke_3", 50, "Clearing All permissions and resetting database");
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllDevicesAndAppAccess");
}

uint64_t sub_1000022D8(uint64_t a1)
{
  return CUStateDumpWithObject("DADaemon", *(_QWORD *)(a1 + 32), &dword_10003F400);
}

id sub_1000022F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_keychainVerificationDevicesRestoredOnSameDevice");
}

id sub_1000022FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_keychainVerificationDevicesRestoredOnSameDevice");
}

void sub_100002304(id a1, OS_xpc_object *a2)
{
  const char *string;
  const char *v3;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (dword_10003F400 <= 50)
  {
    v3 = string;
    if (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50))
      LogPrintF(&dword_10003F400, "-[DADaemonServer _activate]_block_invoke_7", 50, "com.apple.notifyd.matching %s", v3);
  }
}

id sub_1000023E8(uint64_t a1)
{
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer invalidate]_block_invoke", 30, "Invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_1000026B0(id a1, NSString *a2, DADaemonDiscovery *a3, BOOL *a4)
{
  void *v4;
  DADaemonDiscovery *v5;

  v5 = a3;
  -[DADaemonDiscovery setDeviceMap:](v5, "setDeviceMap:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonDiscovery discoveryObj](v5, "discoveryObj"));
  objc_msgSend(v4, "invalidate");

  -[DADaemonDiscovery setDiscoveryObj:](v5, "setDiscoveryObj:", 0);
  -[DADaemonDiscovery setDiscoverySet:](v5, "setDiscoverySet:", 0);

}

id sub_1000032AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationsDidInstall:", *(_QWORD *)(a1 + 40));
}

void sub_100003384(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _applicationsDidInstall:]_block_invoke", 50, "### applicationsDidInstall %@", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appState"));
  v5 = objc_msgSend(v4, "isPlaceholder");

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "appBundleInfoAccessoryOptions:", v3);
    v7 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v7, "_updateAppInfo:options:", v3);
    else
      objc_msgSend(v7, "removeAppsAccessForBundleID:appRemoval:", v3);
  }

}

id sub_1000034E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationsDidUninstall:", *(_QWORD *)(a1 + 40));
}

void sub_1000035E0(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "bundleIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void sub_100003864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000389C(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v1 = CUPrintNSError();
    v2 = (id)objc_claimAutoreleasedReturnValue(v1);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _keychainMarkDeviceForRestoreOnSameDevice]_block_invoke", 90, "### KeychainMarkDevicesForRestoreOnSameDevice failed: %@", v2);

  }
}

void sub_100004084(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "appAccessInfoMap"));
  if (objc_msgSend(v4, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);

  }
}

void sub_1000042F8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[6];
  id v9;

  v3 = a2;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _removeAllDevicesAndAppAccess]_block_invoke", 50, "### Removing all access for device: %@", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appAccessInfoMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004400;
  v8[3] = &unk_100038B38;
  v5 = *(_QWORD *)(a1 + 32);
  v8[4] = v7;
  v8[5] = v5;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

}

void sub_100004400(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setState:", 0);
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 0;
    objc_msgSend(v5, "updateAppAccessInfo:accessoryDevice:removalType:error:", v4, v6, 1, &v8);
    v7 = v8;
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _removeAllDevicesAndAppAccess]_block_invoke_2", 50, "### Removed-AllDevicesAndAppAccess %@, %@", v4, v7);
    }

  }
}

void sub_1000045A8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer removeAppsAccess:]_block_invoke", 50, "### removeAppsAccess %@", v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004684;
  v7[3] = &unk_100038B60;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void sub_100004684(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer removeAppsAccess:]_block_invoke_2", 50, "### removeAppsAccess %@ %@", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appAccessInfoMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32)));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setState:", 0);
    v7 = *(void **)(a1 + 40);
    v9 = 0;
    objc_msgSend(v7, "updateAppAccessInfo:accessoryDevice:removalType:error:", v6, v3, 1, &v9);
    v8 = v9;
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer removeAppsAccess:]_block_invoke_2", 50, "### removeAppsAccess %@ %@ %@", v6, v3, v8);
    }

  }
}

void sub_1000048E8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appAccessInfoMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 32)));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setState:", 0);
    v10 = *(unsigned __int8 *)(a1 + 48);
    v11 = *(void **)(a1 + 40);
    v12 = 0;
    objc_msgSend(v11, "updateAppAccessInfo:accessoryDevice:removalType:error:", v9, v6, v10, &v12);
    *a4 = 1;
  }

}

id sub_100004A00(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppInfo:options:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "appBundleInfoAccessoryOptions:", *(_QWORD *)(a1 + 40)));
}

void sub_100004B7C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateAppInfo:options:]_block_invoke", 50, "### updateAppsAccess %@ %@", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appAccessInfoMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32)));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "accessoryOptions") != *(id *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 40);
    v9 = 0;
    objc_msgSend(v7, "updateAppAccessInfo:accessoryDevice:removalType:error:", v6, v3, 0, &v9);
    v8 = v9;
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateAppInfo:options:]_block_invoke", 50, "### updateAppsAccess saveAppAccessInfo %@ %@ %@", v6, v3, v8);
    }

  }
}

void sub_1000051D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  (*(void (**)(void))(a10 + 16))();
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_10000522C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = CUPrintNSError();
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF(&dword_10003F400, "-[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:]_block_invoke", 90, "### UpdateAppAccessInfo %@ failed: %@", v2, v4);

  }
}

void sub_1000052E4(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("com.apple."));
  if (objc_msgSend(*(id *)(a1 + 40), "state") == (id)20)
  {
    if (*(_QWORD *)(a1 + 80) == 3)
      v3 = 100;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  if (v2)
    v4 = 6;
  else
    v4 = 1;
  v5 = objc_msgSend(*(id *)(a1 + 48), "state");
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "appAccessInfoMap"));
  v7 = (unint64_t)objc_msgSend(v6, "count") > 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 80), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "discoveryObj"));
  +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", v5, v10, v7, v9, objc_msgSend(*(id *)(a1 + 56), "flags"), v4, *(_QWORD *)(a1 + 72), v3);

}

_QWORD *sub_100005688(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[4])
    return objc_msgSend(result, "_checkAppAccessInfo");
  return result;
}

void sub_10000588C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1000058BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "approveTime");
  v8 = v7;
  v9 = objc_msgSend(v6, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothClassicAddress"));

  if (v10)
    v11 = v9 == (id)25;
  else
    v11 = 0;
  if (!v11)
  {
    if (v9 != (id)20 && v9 != (id)10)
      goto LABEL_29;
    v12 = 104;
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bluetoothIdentifier"));
  if (!v13 || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "state") != (id)5)
  {
LABEL_20:

    goto LABEL_29;
  }
  v14 = *(void **)(*(_QWORD *)(a1 + 40) + 264);
  v25 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "retrievePeripheralsWithIdentifiers:", v15));

  if (!v16 || !objc_msgSend(v16, "count"))
  {

    goto LABEL_20;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "customProperty:", CFSTR("ASK_RELATED_RADIO_ADDRESS")));
  v19 = objc_msgSend(v18, "length");

  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAppAccessInfoExpired]_block_invoke", 30, "_checkAppAccessInfoExpired: found CBPeripheral, %@ awaitingTransportBridging %d", v16, v19 != 0);

  if (v19)
  {
    v12 = 120;
LABEL_8:
    if (*(double *)(*(_QWORD *)(a1 + 40) + v12) - (*(double *)(a1 + 56) - v8) <= 0.0)
    {
      if (dword_10003F400 <= 50
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAppAccessInfoExpired]_block_invoke", 50, "Authorization expired removing access info for %@", v6);
      }
      objc_msgSend(v6, "setState:", 0);
      v21 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(a1 + 40);
      v24 = 0;
      v22 = objc_msgSend(v20, "updateAppAccessInfo:accessoryDevice:removalType:error:", v6, v21, 3, &v24);
      v23 = v24;
      if ((v22 & 1) == 0
        && dword_10003F400 <= 90
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAppAccessInfoExpired]_block_invoke", 90, "Error removing access info: appID %@, %@", v5, v23);
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_29:

}

void sub_1000060B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  (*(void (**)(uint64_t))(v33 + 16))(v33);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_10000611C(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v1 = CUPrintNSError();
    v2 = (id)objc_claimAutoreleasedReturnValue(v1);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _checkDevicesForAllApps]_block_invoke", 90, "### CheckDevicesForAllApps failed: %@", v2);

  }
}

_QWORD *sub_1000061CC(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[6])
    return objc_msgSend(result, "_checkDevices");
  return result;
}

void sub_100006DA4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_opt_class(NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
  {
    v6 = CFDictionaryGetInt64Ranged(v10, CFSTR("deviceState"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0) << 32;
    if (v6 == 0x1900000000 || v6 == 0x1400000000)
    {
      v8 = objc_msgSend(objc_alloc((Class)DADevice), "initWithPersistentDictionaryRepresentation:error:", v10, 0);
      if (v8)
      {
        v9 = v8;
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

      }
    }
  }

}

void sub_100007390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  (*(void (**)(void))(a5 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000073E8(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v2 = CUPrintNSError();
    v3 = (id)objc_claimAutoreleasedReturnValue(v2);
    LogPrintF(&dword_10003F400, "-[DADaemonServer generateImageURLForDevice:]_block_invoke", 90, "### GenerateImageURL failed, %@, %@", v3, *(_QWORD *)(a1 + 32));

  }
}

void sub_100008228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a72;

  (*(void (**)(void))(a19 + 16))();
  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

void sub_1000082E8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v1 = CUPrintNSError();
    v2 = (id)objc_claimAutoreleasedReturnValue(v1);
    LogPrintF(&dword_10003F400, "-[DADaemonServer getDevicesWithFlags:appID:]_block_invoke", 90, "### GetDevices failed, %@", v2);

  }
}

void sub_100008398(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id obj;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);

  }
  v10 = objc_alloc((Class)DADeviceAppAccessInfo);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v10, "initWithPersistentDictionaryRepresentation:error:", v7, &obj);

  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
}

void sub_1000084AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id obj;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);

  }
  v10 = objc_alloc((Class)DADeviceAppAccessInfo);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v10, "initWithPersistentDictionaryRepresentation:error:", v7, &obj);

  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

  }
}

void sub_100009098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000090C0(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  _BYTE *v18;

  v13 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "associationIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "associationIdentifier"));
    v9 = objc_msgSend(v8, "isEqualToString:", v7);

    if (v9)
    {
      if (dword_10003F400 <= 50
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:]_block_invoke", 50, "### saveDeviceAppAccessInfo found config %@ for device %@ appAccessInfo %@", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
      *a3 = 1;
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configurations"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009244;
  v14[3] = &unk_100038CF0;
  v15 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v16 = v11;
  v17 = v12;
  v18 = a3;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

}

void sub_100009244(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "associationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "associationIdentifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if (v9)
  {
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:]_block_invoke_2", 50, "### saveDeviceAppAccessInfo found config %@ for device %@ appAccessInfo %@", v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }

}

id sub_1000093AC(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_checkAppAccessInfo");
}

id sub_100009424(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_checkDevices");
}

void sub_10000A3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  (*(void (**)(void))(a17 + 16))();
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_10000A4EC(_QWORD *a1)
{
  NSObject *v2;
  _QWORD block[4];
  __int128 v4;

  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer saveDevice:session:allowCreate:error:]_block_invoke", 30, "groupableDevicesCount: %d, groupedDevicesCount: %d", *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v2 = *(NSObject **)(a1[4] + 88);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A5BC;
  block[3] = &unk_100038D40;
  v4 = *(_OWORD *)(a1 + 5);
  dispatch_async(v2, block);
}

void sub_10000A5BC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 2)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer saveDevice:session:allowCreate:error:]_block_invoke_2", 30, "Sending DeviceGroupingUsage metric");
    }
    v8 = CFSTR("GroupableDevicesCount");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)));
    v9 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

    +[DADeviceAccessAnalytics sendAnalytics:forEvent:](DADeviceAccessAnalytics, "sendAnalytics:forEvent:", v3, CFSTR("com.apple.Bluetooth.DeviceGroupingUsage"));
  }
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 2)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer saveDevice:session:allowCreate:error:]_block_invoke_2", 30, "Sending GroupedDevices metric");
    }
    v6 = CFSTR("GroupableDevicesCount");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

    +[DADeviceAccessAnalytics sendAnalytics:forEvent:](DADeviceAccessAnalytics, "sendAnalytics:forEvent:", v5, CFSTR("com.apple.Bluetooth.GroupedDevices"));
  }
}

void sub_10000CAE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000CB2C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if ((objc_msgSend(v4, "accessoryOptions") & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 1uLL;
  v5 = objc_msgSend(v4, "accessoryOptions");

  if ((v5 & 2) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 2uLL;
}

void sub_10000CD00(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v7 = objc_opt_class(NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = objc_msgSend(objc_alloc((Class)DADevice), "initWithPersistentDictionaryRepresentation:error:", v5, 0);
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

_QWORD *sub_10000CF58(_QWORD *result)
{
  _QWORD *v1;

  if (result[4] == *(_QWORD *)(result[5] + 72))
  {
    v1 = result;
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateTimer]_block_invoke", 30, "DeviceState timer fired");
    }
    return objc_msgSend((id)v1[5], "_checkDevices");
  }
  return result;
}

void sub_10000D3E0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "discoveryObj"));

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 48), "_discoveryEvent:appID:", v5, *(_QWORD *)(a1 + 56));

}

void sub_10000D6F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appAccessInfoMap"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D788;
  v7[3] = &unk_100038DE0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void sub_10000D788(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appDiscoveryConfiguration"));
    v7 = objc_msgSend(v6, "flags");
    if (objc_msgSend(v5, "state") != (id)25 && (v7 & 0x10) != 0)
    {
      objc_msgSend(v5, "setState:", 0);
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 0;
      objc_msgSend(v8, "updateAppAccessInfo:accessoryDevice:removalType:error:", v5, v9, 1, &v11);
      v10 = v11;
      if (dword_10003F400 <= 50
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer removeDiscovery:]_block_invoke_2", 50, "### Invalidate devices waiting for app approval when UI is dismissed %@, %@, %@", *(_QWORD *)(a1 + 40), v5, v10);
      }

    }
  }

}

void sub_10000DE9C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("com.apple.")))
    v2 = 6;
  else
    v2 = 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appAccessInfoMap"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "discoveryObj"));
  +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", 5, v6, v4, v5, objc_msgSend(*(id *)(a1 + 40), "flags"), v2, *(_QWORD *)(a1 + 56), 0);

}

void sub_10000E384(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("com.apple.")))
    v2 = 6;
  else
    v2 = 1;
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 40);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "appAccessInfoDeviceMap"));
  v5 = (unint64_t)objc_msgSend(v7, "count") > 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "discoveryObj"));
  +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", v3, v4, v5, v6, objc_msgSend(*(id *)(a1 + 48), "flags"), v2, *(_QWORD *)(a1 + 64), 0);

}

uint64_t sub_10000F0A8(uint64_t result, unsigned int a2)
{
  uint64_t v3;

  if (dword_10003F400 <= 50)
  {
    v3 = result;
    if (dword_10003F400 != -1)
      return LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]_block_invoke", 50, "### runMigrationWithDiscovery active sessions for appID %@, count %d", *(_QWORD *)(v3 + 32), a2);
    result = _LogCategory_Initialize(&dword_10003F400, 50);
    if ((_DWORD)result)
      return LogPrintF(&dword_10003F400, "-[DADaemonServer runMigrationWithDiscovery:]_block_invoke", 50, "### runMigrationWithDiscovery active sessions for appID %@, count %d", *(_QWORD *)(v3 + 32), a2);
  }
  return result;
}

void sub_10000F1AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F5D4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v1 = CUPrintNSError();
    v2 = (id)objc_claimAutoreleasedReturnValue(v1);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateDeviceStateForBluetooth:device:]_block_invoke", 90, "### _updateDeviceStateForBluetooth failed, %@", v2);

  }
}

void sub_10000FAEC(id a1, NSUUID *a2, NSDictionary *a3, BOOL *a4)
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("CBPeripheral")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("DADevice")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("DiscoveryObj")));

  if (v11)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    if (!v7
      || (v8 = (void *)v7,
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name")),
          v10 = objc_msgSend(v9, "length"),
          v9,
          v8,
          !v10))
    {
      if (dword_10003F400 <= 50
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _cleanupBTDiscovery]_block_invoke", 50, "### _cleanupBTDiscovery nameless BT Accessory %@ %@ %@", v11, v5, v6);
      }
    }
  }

}

void sub_10000FF18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_10000FF34(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  unsigned __int8 v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v35 = a3;
  v7 = a4;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v8 = sub_100022920(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _persistBluetoothDevice:device:requirePairing:pairWithCTKD:]_block_invoke", 50, "### _persistBluetoothDevice BT pairing manager event %@ %@ %@ %@", v9, v35, *(_QWORD *)(a1 + 32), v7);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "hotspotSSIDPrefixes"));
  if (objc_msgSend(v10, "count"))
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "hotspotSSIDs"));
    v11 = objc_msgSend(v12, "count") != 0;

  }
  v13 = objc_msgSend(v35, "appConfirmsAuth");
  v14 = v13;
  if (a2 <= 19)
  {
    if (!a2)
    {
LABEL_45:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      goto LABEL_46;
    }
    if (a2 != 10 || !v13)
      goto LABEL_55;
LABEL_25:
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    goto LABEL_26;
  }
  if (a2 != 20)
  {
    if (a2 == 30)
    {
      if (objc_msgSend(v7, "code") != (id)350014)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
        goto LABEL_55;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "bluetoothIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_findDADeviceWithBTIdentifier:", v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "appAccessInfoMap"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 72)));

      if (objc_msgSend(v24, "state") == (id)25)
      {

LABEL_54:
        goto LABEL_55;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;

      goto LABEL_46;
    }
    if (a2 != 40)
      goto LABEL_55;
    v15 = objc_msgSend(v35, "pairingType");
    v16 = objc_msgSend(v35, "pairingRequired");
    if (v14 && (v16 & 1) == 0)
    {
      if (dword_10003F400 <= 90
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _persistBluetoothDevice:device:requirePairing:pairWithCTKD:]_block_invoke", 90, "### device did not require pairing, but its pairing. Aborting");
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 304), "respondToPairingRequest:type:accept:passkey:", *(_QWORD *)(a1 + 64), v15, 0, 0);
      goto LABEL_45;
    }
    if (v15)
    {
      if (v15 != (id)10)
      {
        v30 = v35;
        v31 = objc_msgSend(objc_alloc((Class)DAEventDeviceBluetoothPairingRequest), "initWithEventType:pairingInfo:", 55, v30);

        objc_msgSend(*(id *)(a1 + 56), "_discoveryEvent:appID:", v31, *(_QWORD *)(a1 + 72));
        goto LABEL_41;
      }
      v25 = *(_QWORD *)(a1 + 64);
      v26 = *(void **)(*(_QWORD *)(a1 + 56) + 304);
      v27 = 10;
      v28 = 1;
    }
    else
    {
      v25 = *(_QWORD *)(a1 + 64);
      v26 = *(void **)(*(_QWORD *)(a1 + 56) + 304);
      v27 = 0;
      v28 = 0;
    }
    objc_msgSend(v26, "respondToPairingRequest:type:accept:passkey:", v25, v27, v28, 0);
LABEL_41:
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v20 = 10;
    goto LABEL_42;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "SSID"));
  if (v17)
    v18 = 0;
  else
    v18 = v11;

  if (v18)
    goto LABEL_25;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "bluetoothIdentifier"));

  if (!v29)
    goto LABEL_55;
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if ((v14 & 1) == 0)
  {
    v20 = 25;
    goto LABEL_42;
  }
LABEL_26:
  v20 = 20;
LABEL_42:
  *(_QWORD *)(v19 + 24) = v20;
LABEL_46:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_updateStateForDiscoveryDeviceID:state:appID:", *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(a1 + 72)));
  if (v21
    || (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "bluetoothIdentifier")),
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_findDADeviceWithBTIdentifier:", v32)),
        v32,
        v21))
  {
    if (v35)
    {
      if (a2 == 20 && !v7)
      {
        objc_msgSend(v21, "setFlags:", (unint64_t)objc_msgSend(v21, "flags") | 0x40);
        if (objc_msgSend(v35, "pairedWithCTKD"))
          objc_msgSend(v21, "setFlags:", (unint64_t)objc_msgSend(v21, "flags") | 0x20);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 56), "updateAppAccessInfo:accessoryDevice:removalType:error:", *(_QWORD *)(a1 + 32), v21, 0, 0);
    goto LABEL_54;
  }
LABEL_55:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 304), "busy") & 1) == 0)
  {
    v33 = *(_QWORD *)(a1 + 56);
    v34 = *(void **)(v33 + 304);
    *(_QWORD *)(v33 + 304) = 0;

  }
}

void sub_100010484(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v8 = sub_100022920(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _forgetBluetoothDevice:]_block_invoke", 50, "### _forgetBluetoothDevice BT pairing manager event %@ uuid:%@ error:%@", v9, *(_QWORD *)(a1 + 32), v7, v12);

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "busy") & 1) == 0)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 304);
    *(_QWORD *)(v10 + 304) = 0;

  }
}

void sub_100010664(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v11 = v6;
  if (dword_10003F400 <= 50)
  {
    if (dword_10003F400 != -1 || (v7 = _LogCategory_Initialize(&dword_10003F400, 50), v6 = v11, v7))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateBluetoothScannerIfNeeded]_block_invoke", 50, "### _updateBluetoothScannerIfNeeded App: %@ inDaemonDiscovery: %@", v5, v6);
      v6 = v11;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "discoverySet"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010770;
  v12[3] = &unk_100038F60;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v10 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

}

void sub_100010770(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v8 = a2;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateBluetoothScannerIfNeeded]_block_invoke_2", 50, "### _updateBluetoothScannerIfNeeded App: %@ inDiscoveryObj: %@", *(_QWORD *)(a1 + 32), v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configurations"));
  if (v5)
    objc_msgSend(v3, "addObjectsFromArray:", v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000108B4;
  v9[3] = &unk_100038F38;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

}

void sub_1000108B4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (dword_10003F400 <= 50)
  {
    if (dword_10003F400 != -1 || (v4 = _LogCategory_Initialize(&dword_10003F400, 50), v3 = v7, v4))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateBluetoothScannerIfNeeded]_block_invoke_3", 50, "### _updateBluetoothScannerIfNeeded App: %@ config: %@", *(_QWORD *)(a1 + 32), v3);
      v3 = v7;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_parseDADiscoveryConfiguration:", v3));
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateBluetoothScannerIfNeeded]_block_invoke_3", 50, "### _updateBluetoothScannerIfNeeded Adding filter app: %@ filters: %@", *(_QWORD *)(a1 + 32), v5);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "addObjectsFromArray:", v5);
    v6 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v6 + 256))
      objc_storeStrong((id *)(v6 + 256), *(id *)(a1 + 32));
  }

}

void sub_100010B54(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  void *v15;

  v3 = CBCentralManagerScanOptionMatchingRuleServiceUUID;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CBCentralManagerScanOptionFilterIdentifierString));

  if (v5)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
    v15 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "retrieveConnectedPeripheralsWithServices:", v8));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100010C94;
    v12[3] = &unk_100038FB0;
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
}

void sub_100010C94(uint64_t a1, void *a2)
{
  id v3;
  NSMutableDictionary *v4;

  v3 = a2;
  v4 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CBCentralManagerScanOptionFilterIdentifierString);
  objc_msgSend(*(id *)(a1 + 40), "centralManager:didDiscoverPeripheral:advertisementData:RSSI:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264), v3, v4, &off_10003A508);

}

void sub_100010D14(id a1, NSError *a2, NSNumber *a3)
{
  NSNumber *v4;
  uint64_t v5;
  void *v6;
  NSError *v7;

  v7 = a2;
  v4 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
  {
    v5 = CUPrintNSError(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _startBTScan]_block_invoke", 50, "### centralManagerDidUpdateState Scan Stopped %@, %@ ms", v6, v4);

  }
}

void sub_100010F48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ADVData")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CBAdvertisementDataTimestamp));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = *(double *)(*(_QWORD *)(a1 + 32) + 128) + *(double *)(*(_QWORD *)(a1 + 32) + 128);
  v11 = *(double *)(a1 + 48) - v9;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAndReportLostBTDevices]_block_invoke", 50, "### btUUID %@ seen %f seconds ago threshold:%f", v12, *(_QWORD *)&v11, *(_QWORD *)&v10);
  if (v11 > v10)
  {
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _checkAndReportLostBTDevices]_block_invoke", 50, "### lost %@", v12);
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void sub_1000110B0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CBPeripheral")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ADVData")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CBAdvertisementDataTimestamp));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DADevice")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "removeObjectForKey:", v9);
  v10 = DAErrorF(350015, "Lost %@ %@ last seen %f seconds ago", v8, v13, *(double *)(a1 + 40) - v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(objc_alloc((Class)DADeviceEvent), "initWithEventType:device:error:", 41, v8, v11);
  objc_msgSend(*(id *)(a1 + 32), "_discoveryEvent:appID:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

}

_QWORD *sub_10001131C(_QWORD *result)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)result[4];
  v2 = result[5];
  if (v1 == *(void **)(v2 + 312))
  {
    v3 = result;
    *(_QWORD *)(v2 + 312) = 0;

    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _armBTScanTimer]_block_invoke", 50, "BT Scan refresh timer fired");
    }
    objc_msgSend((id)v3[5], "_stopBTScan");
    objc_msgSend((id)v3[5], "_checkAndReportLostBTDevices");
    result = (_QWORD *)v3[5];
    if (*((_BYTE *)result + 296))
    {
      objc_msgSend(result, "_startBTScan");
      return objc_msgSend((id)v3[5], "_armBTScanTimer");
    }
  }
  return result;
}

void sub_100011594(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DADevice")));
  v4 = DAErrorF(350016, "bluetoothd crashed, lost %@", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(objc_alloc((Class)DADeviceEvent), "initWithEventType:device:error:", 41, v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "_discoveryEvent:appID:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

}

void sub_10001188C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000118A8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bluetoothIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTPeripheral:]_block_invoke", 50, "### _findDADeviceWithBTPeripheral getDevicesWithFlags DADevice %@ for DADevice for %@", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
    }
  }

}

void sub_100011BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011BF4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothIdentifier"));
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _findDADeviceWithBTIdentifier:]_block_invoke", 50, "### _findDADeviceWithBTIdentifier getDevicesWithFlags DADevice %@ for DADevice for %@", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
    }
  }

}

void sub_1000123EC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer centralManager:didDiscoverPeripheral:advertisementData:RSSI:]_block_invoke", 50, "### didDiscoverPeripheral App: %@ inDaemonDiscovery: %@", v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "discoverySet"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012538;
  v11[3] = &unk_100039108;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v14 = v6;
  v7 = *(void **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v7;
  v17 = *(id *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void sub_100012538(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v3 = a2;
  if (dword_10003F400 <= 50 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer centralManager:didDiscoverPeripheral:advertisementData:RSSI:]_block_invoke_2", 50, "### didDiscoverPeripheral App: %@ inDiscoveryObj: %@", *(_QWORD *)(a1 + 32), v3);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  if (v10)
  {
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer centralManager:didDiscoverPeripheral:advertisementData:RSSI:]_block_invoke_2", 50, "### didDiscoverPeripheral App: %@ config: %@", *(_QWORD *)(a1 + 32), v10);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "associationIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CBCentralManagerScanOptionFilterIdentifierString));
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

    if (v6)
    {
      if (dword_10003F400 <= 50
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer centralManager:didDiscoverPeripheral:advertisementData:RSSI:]_block_invoke_2", 50, "### didDiscoverPeripheral found filter App: %@ inDaemonDiscovery: %@ inDiscoveryObj: %@ config: %@", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v3, v10);
      }
      objc_msgSend(*(id *)(a1 + 56), "_reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v3, v10);
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configurations"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000127C4;
  v11[3] = &unk_1000390E0;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v3;
  v8 = *(void **)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = v8;
  v18 = *(id *)(a1 + 72);
  v9 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

}

void sub_1000127C4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (dword_10003F400 <= 50)
  {
    if (dword_10003F400 != -1 || (v4 = _LogCategory_Initialize(&dword_10003F400, 50), v3 = v8, v4))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer centralManager:didDiscoverPeripheral:advertisementData:RSSI:]_block_invoke_3", 50, "### didDiscoverPeripheral App: %@ config: %@", *(_QWORD *)(a1 + 32), v3);
      v3 = v8;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "associationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CBCentralManagerScanOptionFilterIdentifierString));
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if (v7)
  {
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer centralManager:didDiscoverPeripheral:advertisementData:RSSI:]_block_invoke_3", 50, "### didDiscoverPeripheral found filter App: %@ inDaemonDiscovery: %@ inDiscoveryObj: %@ config: %@", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);
    }
    objc_msgSend(*(id *)(a1 + 64), "_reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);
  }

}

void sub_100012E7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10 = v6;
  if (dword_10003F400 <= 50)
  {
    if (dword_10003F400 != -1 || (v7 = _LogCategory_Initialize(&dword_10003F400, 50), v6 = v10, v7))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke", 50, "[WIFI] app='%@' daemon discovery='%@'", v5, v6);
      v6 = v10;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "discoverySet"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012F98;
  v11[3] = &unk_100038F60;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

void sub_100012F98(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  DAWiFiScanDescriptor *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  DAWiFiScanDescriptor *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  if (!v4)
  {
LABEL_39:
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configurations"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001340C;
    v34[3] = &unk_100038F38;
    v35 = *(id *)(a1 + 32);
    v36 = *(id *)(a1 + 40);
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v34);

    goto LABEL_40;
  }
  v5 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hotspotSSIDs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hotspotSSIDPrefixes"));
    v31 = v6;
    v5 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_2", 30, "[WIFI] single app='%@' discovery config='%@' SSIDs='%@' prefixes='%@'", v31, v4, v7, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothCompanyIdentifiers"));
  if (objc_msgSend(v10, "count"))
    goto LABEL_17;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothCompanyPayload"));
  if (objc_msgSend(v11, "length"))
  {
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothCompanyPayloadMask"));
  if (objc_msgSend(v12, "length"))
  {
LABEL_15:

    goto LABEL_16;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothNameSubstring"));
  if (objc_msgSend(v13, "length"))
  {
LABEL_14:

    goto LABEL_15;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothServicePayload"));
  if (objc_msgSend(v14, "length"))
  {
LABEL_13:

    goto LABEL_14;
  }
  v33 = v3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothServicePayloadMask"));
  if (objc_msgSend(v15, "length"))
  {

    v3 = v33;
    goto LABEL_13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothServices"));
  v32 = objc_msgSend(v17, "count");

  v5 = &OBJC_IVAR___DADaemonServer__prefsBTRSSIThreshold;
  v3 = v33;
  if (!v32)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hotspotSSIDs"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v18);
          v23 = -[DAWiFiScanDescriptor initWithSSID:]([DAWiFiScanDescriptor alloc], "initWithSSID:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i));
          -[DAWiFiScanDescriptor setBundleID:](v23, "setBundleID:", v9);
          -[DAWiFiScanDescriptor setConfiguration:](v23, "setConfiguration:", v4);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v20);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hotspotSSIDPrefixes"));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v24);
          v29 = -[DAWiFiScanDescriptor initWithPrefix:]([DAWiFiScanDescriptor alloc], "initWithPrefix:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j));
          -[DAWiFiScanDescriptor setBundleID:](v29, "setBundleID:", v9);
          -[DAWiFiScanDescriptor setConfiguration:](v29, "setConfiguration:", v4);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v26);
    }

    goto LABEL_39;
  }
LABEL_18:
  v16 = v5[256];
  if (v16 <= 50 && (v16 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_2", 50, "[WIFI] skipping since configuration has BT as well");

LABEL_40:
}

void sub_10001340C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  DAWiFiScanDescriptor *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  DAWiFiScanDescriptor *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v3 = a2;
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hotspotSSIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hotspotSSIDPrefixes"));
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_3", 30, "[WIFI] app='%@' discovery config='%@' SSIDs='%@' prefixes='%@'", v4, v3, v5, v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyIdentifiers"));
  if (objc_msgSend(v7, "count"))
    goto LABEL_16;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyPayload"));
  if (objc_msgSend(v8, "length"))
  {
LABEL_15:

LABEL_16:
LABEL_17:
    if (dword_10003F400 <= 50
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 50)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_3", 50, "[WIFI] skipping since configuration has BT as well");
    }
    goto LABEL_38;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothCompanyPayloadMask"));
  if (objc_msgSend(v9, "length"))
  {
LABEL_14:

    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothNameSubstring"));
  if (objc_msgSend(v10, "length"))
  {
LABEL_13:

    goto LABEL_14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServicePayload"));
  if (objc_msgSend(v11, "length"))
  {
LABEL_12:

    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServicePayloadMask"));
  if (objc_msgSend(v12, "length"))
  {

    goto LABEL_12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothServices"));
  v26 = objc_msgSend(v13, "count");

  if (v26)
    goto LABEL_17;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hotspotSSIDs"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = -[DAWiFiScanDescriptor initWithSSID:]([DAWiFiScanDescriptor alloc], "initWithSSID:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i));
        -[DAWiFiScanDescriptor setBundleID:](v19, "setBundleID:", *(_QWORD *)(a1 + 32));
        -[DAWiFiScanDescriptor setConfiguration:](v19, "setConfiguration:", v3);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v16);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hotspotSSIDPrefixes"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = -[DAWiFiScanDescriptor initWithPrefix:]([DAWiFiScanDescriptor alloc], "initWithPrefix:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j));
        -[DAWiFiScanDescriptor setBundleID:](v25, "setBundleID:", *(_QWORD *)(a1 + 32));
        -[DAWiFiScanDescriptor setConfiguration:](v25, "setConfiguration:", v3);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v22);
  }

LABEL_38:
}

void sub_1000137CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];

  v6 = a2;
  v5 = a3;
  if (v6)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_4", 30, "[WIFI] scan error='%@'", v6);
    }
  }
  else
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_4", 30, "[WIFI] scan results='%@'", v5);
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000138FC;
    v7[3] = &unk_100039158;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);
  }

}

void sub_1000138FC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *i;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v4 = a2;
  v5 = a3;
  if (dword_10003F400 <= 30 && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_5", 30, "[WIFI] descriptor='%@' networks='%@'", v4, v5);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getDevicesWithFlags:appID:", 8, 0));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v5;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v44)
  {
    v41 = *(_QWORD *)v51;
    v42 = v4;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v8 = v43;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v47;
LABEL_12:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v47 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SSID"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "SSID"));
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
              break;
            if (v10 == (id)++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
              if (v10)
                goto LABEL_12;
              goto LABEL_18;
            }
          }
          v4 = v42;
          if (dword_10003F400 <= 30
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bundleID"));
            LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_5", 30, "[WIFI] found existing device='%@' for bundle %@", v13, v17);

          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "configuration"));
          objc_msgSend(v13, "setDiscoveryConfiguration:", v18);

          if (objc_msgSend(v7, "isUnsecured"))
            objc_msgSend(v13, "setFlags:", (unint64_t)objc_msgSend(v13, "flags") | 0x80);
          v19 = v13;

          if (v19)
            goto LABEL_30;
        }
        else
        {
LABEL_18:

          v4 = v42;
        }
        v19 = objc_alloc_init((Class)DADevice);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
        objc_msgSend(v19, "setIdentifier:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
        objc_msgSend(v19, "setDiscoveryConfiguration:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "SSID"));
        objc_msgSend(v19, "setSSID:", v23);

        objc_msgSend(v19, "setFlags:", 8);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "displayName"));
        objc_msgSend(v19, "setName:", v25);

        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
          LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiManagerIfNeeded]_block_invoke_5", 30, "[WIFI] reporting new device='%@' for bundle %@", v19, v26);

        }
LABEL_30:
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appAccessInfoMap"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v28));
        v30 = objc_msgSend(v29, "accessoryOptions");

        v31 = *(void **)(a1 + 32);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
        v33 = objc_msgSend(v31, "appBundleInfoAccessoryOptions:", v32);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appAccessInfoMap"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v35));
        if (!objc_msgSend(v36, "state"))
        {

LABEL_35:
          v37 = objc_msgSend(objc_alloc((Class)DADeviceEvent), "initWithEventType:device:", 40, v19);
          v38 = *(void **)(a1 + 32);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
          objc_msgSend(v38, "_discoveryEvent:appID:", v37, v39);

          goto LABEL_36;
        }

        if ((v33 & 2) != 0 && (v30 & 2) == 0)
          goto LABEL_35;
LABEL_36:

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v44);
  }

}

void sub_100013F64(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
      LogPrintF(&dword_10003F400, "-[DADaemonServer _forgetWiFiDevice:]_block_invoke", 30, "[WiFi] removing profile = '%@ - %@'", v9, v10);

    }
    v11 = *(void **)(a1 + 40);
    v18 = 0;
    v12 = objc_msgSend(v11, "removeKnownNetworkProfile:reason:error:", v6, 1, &v18);
    v13 = v18;
    if ((v12 & 1) == 0
      && dword_10003F400 <= 90
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
      v16 = CUPrintNSError(v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      LogPrintF(&dword_10003F400, "-[DADaemonServer _forgetWiFiDevice:]_block_invoke", 90, "[WiFi] failed to remove profile = '%@ - %@' error = '%@'", v14, v15, v17);

    }
    *a4 = 1;

  }
  else if (dword_10003F400 <= 90
         && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    LogPrintF(&dword_10003F400, "-[DADaemonServer _forgetWiFiDevice:]_block_invoke", 90, "[WiFi] profile not found for SSID = '%@'", *(_QWORD *)(a1 + 32));
  }

}

void sub_100014300(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  char v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSSpecificAttributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AccessoryIdentifier")));

  v10 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v9);
  v11 = v10;
  if (v10
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName")),
        v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 40)),
        v12,
        (v13 & 1) == 0))
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]_block_invoke", 30, "[WiFi] removing profile = '%@ - %@'", v22, v23);

    }
    v25 = *(void **)(a1 + 48);
    v42 = 0;
    v26 = objc_msgSend(v25, "removeKnownNetworkProfile:reason:error:", v6, 1, &v42);
    v27 = v42;
    if ((v26 & 1) == 0
      && dword_10003F400 <= 90
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
      v30 = CUPrintNSError(v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]_block_invoke", 90, "[WiFi] failed to remove profile = '%@ - %@' error = '%@'", v28, v29, v31);

    }
    *a4 = 1;

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
    if (objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    {
      v15 = objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", v7);

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSSpecificAttributes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("DisplayFriendlyName")));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "name"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSSpecificAttributes"));
        v20 = objc_msgSend(v19, "mutableCopy");

        if (v18 && (objc_msgSend(v17, "isEqualToString:", v18) & 1) == 0)
        {
          if (dword_10003F400 <= 30
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
            LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]_block_invoke", 30, "[WiFi] updating display name for '%@' to '%@' (was '%@')", v24, v18, v17);

          }
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("DisplayFriendlyName"));
          v21 = 1;
          if ((v11 & 1) != 0)
            goto LABEL_34;
        }
        else
        {
          v21 = 0;
          if ((v11 & 1) != 0)
            goto LABEL_34;
        }
        if (*(_QWORD *)(a1 + 32))
        {
          if (dword_10003F400 <= 30
            && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
            LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]_block_invoke", 30, "[WiFi] setting accessory identifier for '%@' to '%@'", v32, *(_QWORD *)(a1 + 32));

          }
          objc_msgSend(v20, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("AccessoryIdentifier"));
          goto LABEL_38;
        }
LABEL_34:
        if (!v21)
        {
LABEL_48:
          *a4 = 1;

          goto LABEL_49;
        }
LABEL_38:
        objc_msgSend(v6, "setOSSpecificAttributes:", v20);
        if (dword_10003F400 <= 30
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
          LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]_block_invoke", 30, "[WiFi] updating profile for '%@' with attributes '%@'", v33, v20);

        }
        v34 = *(void **)(a1 + 48);
        v41 = 0;
        v35 = objc_msgSend(v34, "updateKnownNetworkProfile:properties:error:", v6, 0, &v41);
        v36 = v41;
        if ((v35 & 1) == 0
          && dword_10003F400 <= 90
          && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
          v39 = CUPrintNSError(v36);
          v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
          LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]_block_invoke", 90, "[WiFi] failed to update profile = '%@ - %@' error = '%@'", v37, v38, v40);

        }
        goto LABEL_48;
      }
    }
    else
    {

    }
    if (dword_10003F400 <= 90
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _updateWiFiDevice:bundleID:]_block_invoke", 90, "[WiFi] profile not found for SSID = '%@'", *(_QWORD *)(a1 + 40));
    }
  }
LABEL_49:

}

void sub_100014C00(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100014C48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = CUPrintNSError(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _addTXTRecordToNWEndpoint:appID:]_block_invoke", 90, "### Process Metadata failed: deviceID %@, appID %@, %@", v5, v2, v4);

  }
}

uint64_t sub_100014D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];

  if ((off_10003F600(*(_QWORD *)(a1 + 64), a2, a3) & 1) != 0)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _addTXTRecordToNWEndpoint:appID:]_block_invoke", 30, "Successfully validated txt record data");
    }
    nw_endpoint_set_txt_record(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _addTXTRecordToNWEndpoint:appID:]_block_invoke_2", 30, "Failed to validate txt record data");
    }
    v10[0] = CFSTR("BundleID");
    v10[1] = CFSTR("SupportsBonjour");
    v4 = *(void **)(a1 + 40);
    v11[0] = *(_QWORD *)(a1 + 32);
    v11[1] = &off_10003A520;
    v10[2] = CFSTR("BonjourServices");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protocolType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v11[2] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    +[DADeviceAccessAnalytics sendAnalyticsInfo:forEvent:withDeviceIdentifier:](DADeviceAccessAnalytics, "sendAnalyticsInfo:forEvent:withDeviceIdentifier:", v7, CFSTR("com.apple.DeviceAccess.BonjourMetadataFailure"), v8);

  }
  return 1;
}

void sub_100015704(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_100015790(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = CUPrintNSError(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]_block_invoke", 90, "### Process SSDP Metadata failed: deviceID %@, appID %@, %@", v5, v2, v4);

  }
}

void sub_10001585C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  int v7;
  nw_path_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (dword_10003F400 <= 30)
  {
    if (dword_10003F400 != -1 || (v6 = _LogCategory_Initialize(&dword_10003F400, 30), v5 = v11, v6))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]_block_invoke_2", 30, "Get nw connection state %d", a2);
      v5 = v11;
    }
  }
  if (v5)
  {
    if (dword_10003F400 <= 30)
    {
      if (dword_10003F400 != -1 || (v7 = _LogCategory_Initialize(&dword_10003F400, 30), v5 = v11, v7))
      {
        LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]_block_invoke_2", 30, "Get error %@ from nw connection with state: %d!", v5, a2);
        v5 = v11;
      }
    }
  }
  if ((_DWORD)a2 == 4)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
LABEL_24:
    v5 = v11;
    goto LABEL_25;
  }
  if ((_DWORD)a2 == 3)
  {
    if (dword_10003F400 <= 30
      && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
    {
      LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]_block_invoke_2", 30, "Resolve succeeded for : host %s, port %s", *(const char **)(a1 + 72), *(const char **)(a1 + 80));
    }
    v8 = nw_connection_copy_current_path(*(nw_connection_t *)(a1 + 32));
    if (nw_path_is_direct())
    {
      if (dword_10003F400 <= 30
        && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 30)))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "identifier"));
        LogPrintF(&dword_10003F400, "-[DADaemonServer _addSSDPDatatoNWEndpoint:appID:]_block_invoke_2", 30, "Host is on local network for appID %@, deviceID %@", v9, v10);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

    goto LABEL_24;
  }
LABEL_25:

}

void sub_100015F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  (*(void (**)(uint64_t))(v16 + 16))(v16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015FD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && dword_10003F400 <= 90
    && (dword_10003F400 != -1 || _LogCategory_Initialize(&dword_10003F400, 90)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v3 = *(_QWORD *)(a1 + 48);
    v4 = CUPrintNSError(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    LogPrintF(&dword_10003F400, "-[DADaemonServer _necpSignEndpointForDevice:appID:]_block_invoke", 90, "### Sign endpoint failed: NWEP %@, deviceID %@, appID %@, %@", v2, v6, v3, v5);

  }
}

void sub_100016374(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1000163A4(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void sub_1000166FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_100016730(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void sub_1000167E4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100001CEC;
  v17 = sub_100001CFC;
  v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100016990;
  v12[3] = &unk_1000392B8;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = &v13;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

void sub_100016964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016990(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init((Class)NSMutableSet);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", v9);
  }

}

void sub_100016A90(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100001CEC;
  v19 = sub_100001CFC;
  v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100016C4C;
  v12[3] = &unk_1000392B8;
  v13 = *(id *)(a1 + 32);
  v14 = &v15;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v16[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v21, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v15, 8);
}

void sub_100016C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016C4C(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a3) & 1) == 0)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init((Class)NSMutableSet);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", v9);
  }

}

id sub_10001700C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1000174DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017538(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2 && dword_10003F400 <= 90)
  {
    if (dword_10003F400 != -1)
    {
LABEL_4:
      v3 = CUPrintNSError(v2);
      v4 = (id)objc_claimAutoreleasedReturnValue(v3);
      LogPrintF(&dword_10003F400, "-[DADaemonServer _necpUpdateUUIDsWithBlock:]_block_invoke", 90, "### NECP update UUID failed, %@", v4);

      return;
    }
    if (_LogCategory_Initialize(&dword_10003F400, 90))
    {
      v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      goto LABEL_4;
    }
  }
}

id sub_10001800C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "respondToPairingRequest:type:accept:passkey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

void sub_1000180BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000182FC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcReceivedMessage:", a2);
}

uint64_t sub_100018424()
{
  if (qword_10003F9B0 != -1)
    dispatch_once(&qword_10003F9B0, &stru_100039370);
  off_10003F5F0 = (uint64_t (*)())dlsym((void *)qword_10003F9B8, "BYSetupAssistantNeedsToRun");
  return off_10003F5F0();
}

void sub_100018478(id a1)
{
  qword_10003F9B8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
}

uint64_t sub_1000184A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_10003F9C0 != -1)
    dispatch_once(&qword_10003F9C0, &stru_100039390);
  off_10003F5F8 = (uint64_t (*)())dlsym((void *)qword_10003F9C8, "mdns_signed_browse_result_create_from_data");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))off_10003F5F8)(a1, a2, a3);
}

void sub_100018520(id a1)
{
  qword_10003F9C8 = (uint64_t)dlopen("/usr/lib/libmdns.dylib", 2);
}

uint64_t sub_100018548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_10003F9C0 != -1)
    dispatch_once(&qword_10003F9C0, &stru_100039390);
  off_10003F600 = (uint64_t (*)())dlsym((void *)qword_10003F9C8, "mdns_signed_browse_result_covers_txt_rdata");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))off_10003F600)(a1, a2, a3);
}

void sub_1000185C8(void *a1)
{
  uint64_t v1;
  id v2;

  v1 = qword_10003F9C0;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&qword_10003F9C0, &stru_100039390);
  off_10003F608 = (uint64_t (*)())dlsym((void *)qword_10003F9C8, "mdns_release");
  ((void (*)(id))off_10003F608)(v2);

}

void sub_10001921C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019240(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100019250(uint64_t a1)
{

}

void sub_100019258(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BYTE *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = DANestedErrorF(v5, 350004, "WiFi scan failed");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (dword_10003F670 <= 30
      && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
    {
      LogPrintF(&dword_10003F670, "-[DAWiFiScanner _performScan]_block_invoke", 30, "[WiFi] scan error='%@'", v5);
    }
  }
  else
  {
    if (dword_10003F670 <= 30
      && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
    {
      LogPrintF(&dword_10003F670, "-[DAWiFiScanner _performScan]_block_invoke", 30, "[WiFi] scan results='%@'", v6);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          if (dword_10003F670 <= 30)
          {
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            if (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "networkName"));
              LogPrintF(&dword_10003F670, "-[DAWiFiScanner _performScan]_block_invoke", 30, "[WiFi] Found network='%@'", v17);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_coalesceResults:descriptors:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v6 = v22;
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  v21 = *(_BYTE **)(a1 + 32);
  if (v21[8])
    objc_msgSend(v21, "_queueNextScan");

}

id sub_100019594(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performScan");
}

void sub_100019F50(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_100019F80(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    free(v1);
}

void sub_10001B608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  (*(void (**)(void))(a13 + 16))();
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B688(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001B698(uint64_t a1)
{

}

id sub_10001B6A0(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcBluetoothAccessInfoGet:]_block_invoke", 90, "### BluetoothAccessInfo get failed: %@, from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_10001C964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_10001C9B0(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == result[2])
    return objc_msgSend(result, "_xpcReportDAEvent:", a2);
  return result;
}

void sub_10001C9D4(_QWORD *a1, int a2, void *a3)
{
  id v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  if (dword_10003F6E0 <= 30 && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
  {
    v6 = "no";
    if (a2)
      v6 = "yes";
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDASessionActivate:]_block_invoke_2", 30, "Activate %@, Watch App Installed: %s, error: %@", a1[4], v6, v5);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CADC;
  block[3] = &unk_100039420;
  v9 = v7;
  v14 = a2;
  v10 = a1[5];
  v12 = v9;
  v13 = v10;
  dispatch_async(v8, block);

}

id sub_10001CADC(uint64_t a1)
{
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "waCk", *(_BYTE *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_xpcSendReply:", *(_QWORD *)(a1 + 32));
}

void sub_10001CB10(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  _QWORD v20[4];
  __int128 v21;
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 36)));
  v22 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v2, &v22));
  v4 = v22;

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentState"));
    v6 = &off_10003A550;
    if (objc_msgSend(v5, "taskState") == 4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endowmentNamespaces"));
      if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.frontboard.visibility")))
        v6 = &off_10003A538;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v6, CFSTR("ApplicationState"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "appBundleInfoAccessoryOptions:", *(_QWORD *)(a1 + 40))));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("AccessorySetupKitTechnologySupported"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "applicationHasBluetoothGlobalTCC:", *(_QWORD *)(a1 + 40))));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v10, CFSTR("BluetoothGlobalTCC"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "appBundleInfoAccessoryDiscoveryOptions:", *(_QWORD *)(a1 + 40)));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupBluetoothCompanyIdentifiers")));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, CFSTR("hasAccessorySetupBluetoothCompanyIdentifiers"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupBluetoothNames")));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, CFSTR("hasAccessorySetupBluetoothNames"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupBluetoothServices")));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v14, CFSTR("hasAccessorySetupBluetoothServices"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_findSyncExtensionPoint:bundleID:", DAAccessorySetupExtensionPointIdentifier, *(_QWORD *)(a1 + 40))));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v15, CFSTR("hasAccessorySetupDiscoveryExtension"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001CE34;
  v20[3] = &unk_100039470;
  v19 = *(_OWORD *)(a1 + 40);
  v18 = (id)v19;
  v21 = v19;
  objc_msgSend(v16, "loadConfigurationsWithCompletionQueue:handler:", v17, v20);

}

void sub_10001CE34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uid_t v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  _UNKNOWN **v24;
  id v25;
  uint64_t v26;
  id v27;
  void *i;
  _QWORD *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  unsigned __int8 v41[128];
  uuid_t uu;
  _BYTE v43[128];

  v5 = a2;
  v27 = a3;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10001D210;
  v40[3] = &unk_100038AE8;
  v40[4] = *(_QWORD *)(a1 + 40);
  v29 = objc_retainBlock(v40);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v25)
  {
    v31 = 0;
    v26 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.preferences.networkprivacy")))
        {
          v8 = v6;

          v9 = v8;
        }
        else
        {
          if (objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.preferences.networkprivacy")))
          {
            memset(uu, 0, sizeof(uu));
            v10 = getuid();
            mbr_uid_to_uuid(v10, uu);
            v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", uu);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
            v14 = objc_msgSend(v12, "hasSuffix:", v13);

            if (v14)
            {
              v15 = v6;

              v31 = v15;
            }

          }
          v9 = v31;
        }
        if (!v9)
        {
          v31 = 0;
LABEL_29:

          goto LABEL_31;
        }
        v31 = v9;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathController"));
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathRules"));
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v33;
          while (2)
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(_QWORD *)v33 != v19)
                objc_enumerationMutation(v17);
              v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
              v22 = *(void **)(a1 + 32);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "matchSigningIdentifier"));
              LODWORD(v22) = objc_msgSend(v22, "isEqualToString:", v23);

              if ((_DWORD)v22)
              {
                if (objc_msgSend(v21, "denyMulticast"))
                  v24 = &off_10003A550;
                else
                  v24 = &off_10003A568;
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v24, CFSTR("LocalNetworkGlobalTCC"));

                goto LABEL_29;
              }
            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            if (v18)
              continue;
            break;
          }
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      if (v25)
        continue;
      break;
    }
  }
  else
  {
    v31 = 0;
  }
LABEL_31:

  ((void (*)(void))v29[2])();
}

void sub_10001D1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  (*(void (**)(void))(a14 + 16))();
  _Unwind_Resume(a1);
}

id sub_10001D210(uint64_t a1)
{
  return +[DADeviceAccessAnalytics sendAnalytics:forEvent:](DADeviceAccessAnalytics, "sendAnalytics:forEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("com.apple.DeviceAccess.Activation"));
}

void sub_10001DAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;

  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 152), 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_10001DB28(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40))
  {
    v3 = result;
    if (dword_10003F6E0 <= 90
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      v4 = CUPrintPID(*(unsigned int *)(v3[4] + 36), a2, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcRemoveDeviceAppAccessInfo:]_block_invoke", 90, "### RemoveDeviceAppAccessInfo[%@] failed: %@", v5, *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 40));

    }
    return objc_msgSend((id)v3[4], "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 40), v3[5]);
  }
  return result;
}

id sub_10001DBF4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier"));
  if (objc_msgSend(v4, "isEqualToString:", v5))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

void sub_10001DC68(uint64_t a1, uint64_t a2)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_xpcRemoveDeviceConfirmation:accessInfo:userConfirmed:request:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2 == 1, *(_QWORD *)(a1 + 56));
  v2 = (void *)qword_10003F9D0;
  qword_10003F9D0 = 0;

}

void sub_10001DC9C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    if (dword_10003F6E0 <= 90
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      v5 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcRemoveDeviceAppAccessInfo:]_block_invoke_4", 90, "### RemoveDeviceConfirmation[%@] alert failed: %@", v6, v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", v7, *(_QWORD *)(a1 + 40));
  }

}

void sub_10001DFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_10001DFE4(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40))
  {
    v3 = result;
    if (dword_10003F6E0 <= 90
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      v4 = CUPrintPID(*(unsigned int *)(v3[4] + 36), a2, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcRemoveDeviceConfirmation:accessInfo:userConfirmed:request:]_block_invoke", 90, "### RemoveDeviceConfirmation[%@] failed: %@", v5, *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 40));

    }
    return objc_msgSend((id)v3[4], "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 40), v3[5]);
  }
  return result;
}

void sub_10001E518(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_10001E55C(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  int v8;

  v3 = result[6];
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40);
  if (v4)
  {
    v5 = result;
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v8 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v3 = v5[6];
        if (!v8)
          return objc_msgSend((id)v5[4], "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40), v5[5]);
        v4 = *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40);
      }
      v6 = CUPrintPID(*(unsigned int *)(v5[4] + 36), a2, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetDeviceAppAccessInfo:]_block_invoke", 90, "### SetDeviceAppAccessInfo failed: %@ from %@", v4, v7);

      v3 = v5[6];
    }
    return objc_msgSend((id)v5[4], "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40), v5[5]);
  }
  return result;
}

void sub_10001E950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001E990(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetAuthorizedAccessories:]_block_invoke", 90, "### GetAuthorizedAccessories failed: %@ from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_10001ED94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001EDD4(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetAuthorizedDevices:]_block_invoke", 90, "### GetAuthorizedDevices failed: %@ from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_10001F258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  (*(void (**)(uint64_t))(v14 + 16))(v14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001F2A0(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetDevices:]_block_invoke", 90, "### GetDevices failed: %@ from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_10001F84C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_10001F89C(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcModifyDeviceSettings:]_block_invoke", 90, "### ModifyDeviceSettings failed: %@ from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_10001FDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  (*(void (**)(uint64_t))(v27 + 16))(v27);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id sub_10001FDFC(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetDeviceState:]_block_invoke", 90, "### SetDeviceState failed: %@ from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_10002025C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_1000202A4(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetPartialIPs:]_block_invoke", 90, "### SetPartialIPs failed: %@ from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_1000206C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10002070C(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcBluetoothPairingMsg:]_block_invoke", 90, "### RespondToBluetoothPairingRequest failed: %@, from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_100020AC8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100020B0C(uint64_t a1)
{
  uint64_t v2;
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_10003F6E0 <= 90)
    {
      if (dword_10003F6E0 == -1)
      {
        v10 = _LogCategory_Initialize(&dword_10003F6E0, 90);
        v2 = *(_QWORD *)(a1 + 48);
        if (!v10)
          return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
        result = *(id *)(*(_QWORD *)(v2 + 8) + 40);
      }
      v4 = CUPrintNSError(result);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v8 = CUPrintPID(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetPartialIPs:]_block_invoke", 90, "### GetPartialIPs failed: %@ from %@", v5, v9);

      v2 = *(_QWORD *)(a1 + 48);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t start(int a1, uint64_t a2)
{
  const char **v2;
  uint64_t v3;
  const char *v4;
  int *v5;
  uint64_t v6;
  void *v7;
  DADaemonServer *v8;
  void *v9;

  if (a1 < 2)
  {
LABEL_7:
    if (dword_10003F750 <= 30
      && (dword_10003F750 != -1 || _LogCategory_Initialize(&dword_10003F750, 30)))
    {
      LogPrintF(&dword_10003F750, "int main(int, const char **)", 30, "Launched");
    }
    if ((_set_user_dir_suffix("com.apple.deviceaccessd") & 1) == 0
      && dword_10003F750 <= 90
      && (dword_10003F750 != -1 || _LogCategory_Initialize(&dword_10003F750, 90)))
    {
      v5 = __error();
      v6 = CUPrintErrorCode(*v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      LogPrintF(&dword_10003F750, "int main(int, const char **)", 90, "### _set_user_dir_suffix failed: %@", v7);

    }
    signal(13, (void (__cdecl *)(int))1);
    v8 = objc_alloc_init(DADaemonServer);
    -[DADaemonServer activate](v8, "activate");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v9, "run");

  }
  else
  {
    v2 = (const char **)(a2 + 8);
    v3 = a1 - 1;
    while (1)
    {
      v4 = *v2;
      if (!strcmp(*v2, "-V") || !strcmp_prefix(v4, "--vers") || !strcmp_prefix(v4, "vers"))
        break;
      fprintf(__stderrp, "warning: unknown option '%s'\n", v4);
      ++v2;
      if (!--v3)
        goto LABEL_7;
    }
    fprintf(__stdoutp, "DeviceAccess daemon version %s\n", "300.10");
  }
  return 0;
}

void sub_100021078(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

id sub_100021520(uint64_t a1)
{
  if (dword_10003F7C0 <= 30 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 30)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager invalidate]_block_invoke", 30, "Invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "cancelAll");
}

id sub_100021750(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
    v3 = 10;
  else
    v3 = 20;
  LOBYTE(v5) = *(_BYTE *)(a1 + 74);
  objc_msgSend(v2, "_addNewTask:completion:bluetoothOp:pairCTKD:displayName:taskTimeout:appConfirmsAuth:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v3, *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5);
  return objc_msgSend(*(id *)(a1 + 32), "_runNextTask");
}

id sub_100021900(uint64_t a1)
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_addNewTask:completion:bluetoothOp:pairCTKD:displayName:taskTimeout:appConfirmsAuth:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 30, 0, &stru_100039F08, &off_10003A580, v3);
  return objc_msgSend(*(id *)(a1 + 32), "_runNextTask");
}

void sub_100021A0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    objc_msgSend(*(id *)(v2 + 40), "cancelTimer");
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager cancelCurrentTask]_block_invoke", 50, "### cancelCurrentTask task cancelled %@", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    }
    v2 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v2 + 32))
    {
      v3 = DAErrorF(350014, "cancelCurrentTask pending task %@", *(_QWORD *)(v2 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      objc_msgSend(*(id *)(a1 + 32), "_reportFailure:", v4);

      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "_getNextTask"));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  v8 = *(_QWORD **)(a1 + 32);
  if (v8[5])
  {
    objc_msgSend(v8, "_runNextTask");
  }
  else
  {
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager cancelCurrentTask]_block_invoke", 50, "### cancelCurrentTask no more tasks");
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:", 0);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 48);
    *(_QWORD *)(v11 + 48) = 0;

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 24);
    *(_QWORD *)(v15 + 24) = 0;

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 16);
    *(_QWORD *)(v17 + 16) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 0;
  }
}

void sub_100021CA4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  while (1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    if (!v3)
      break;
LABEL_4:
    objc_msgSend(v3, "cancelTimer");
    if (dword_10003F7C0 <= 50
      && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    {
      LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager cancelAll]_block_invoke", 50, "### cancelAll task cancelled %@", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    }
    v6 = DAErrorF(350014, "Cancelled pending task %@", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(*(id *)(a1 + 32), "_reportFailure:", v7);

    v5 = *(_QWORD *)(a1 + 32);
LABEL_9:
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "_getNextTask"));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  v4 = objc_msgSend(*(id *)(v2 + 48), "count");
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v3 = *(void **)(v5 + 40);
    if (!v3)
      goto LABEL_9;
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(v5 + 16), "setDelegate:", 0);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  *(_QWORD *)(v11 + 8) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 48);
  *(_QWORD *)(v13 + 48) = 0;

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 24);
  *(_QWORD *)(v17 + 24) = 0;

  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 16);
  *(_QWORD *)(v19 + 16) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 0;
}

void sub_100022578(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (dword_10003F7C0 <= 50 && (dword_10003F7C0 != -1 || _LogCategory_Initialize(&dword_10003F7C0, 50)))
    LogPrintF(&dword_10003F7C0, "-[DABluetoothPairingManager _runNextTask]_block_invoke", 50, "BT task timeout timer fired");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelPeripheralConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "bluetoothUUID"));
  v5 = DAErrorF(350003, "BT Task timed out btuuid %@ task %@", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(*(id *)(a1 + 32), "_reportFailure:", v6);
}

const __CFString *sub_100022920(uint64_t a1)
{
  if (a1 <= 19)
  {
    if (!a1)
      return CFSTR("DABluetoothEventUnknown");
    if (a1 == 10)
      return CFSTR("DABluetoothEventAccessoryConnected");
  }
  else
  {
    switch(a1)
    {
      case 20:
        return CFSTR("DABluetoothEventCompleted");
      case 30:
        return CFSTR("DABluetoothEventFailed");
      case 40:
        return CFSTR("DABluetoothEventPairingRequested");
    }
  }
  return CFSTR("?");
}

id objc_msgSend_OSSpecificAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "OSSpecificAttributes");
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SSID");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__addNewTask_completion_bluetoothOp_pairCTKD_displayName_taskTimeout_appConfirmsAuth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addNewTask:completion:bluetoothOp:pairCTKD:displayName:taskTimeout:appConfirmsAuth:");
}

id objc_msgSend__addSSDPDatatoNWEndpoint_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addSSDPDatatoNWEndpoint:appID:");
}

id objc_msgSend__addTXTRecordToNWEndpoint_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTXTRecordToNWEndpoint:appID:");
}

id objc_msgSend__applicationHasBluetoothGlobalTCC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applicationHasBluetoothGlobalTCC:");
}

id objc_msgSend__armBTScanTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_armBTScanTimer");
}

id objc_msgSend__checkAndReportLostBTDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkAndReportLostBTDevices");
}

id objc_msgSend__checkAppAccessInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkAppAccessInfo");
}

id objc_msgSend__checkAppAccessInfoExpired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkAppAccessInfoExpired");
}

id objc_msgSend__checkDevicesForAllApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkDevicesForAllApps");
}

id objc_msgSend__checkDevicesForAppDataURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkDevicesForAppDataURL:");
}

id objc_msgSend__cleanupBTDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupBTDiscovery");
}

id objc_msgSend__cleanupWiFiDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupWiFiDiscovery");
}

id objc_msgSend__coalesceResults_descriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_coalesceResults:descriptors:");
}

id objc_msgSend__defaultScanParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultScanParameters");
}

id objc_msgSend__discoveryEvent_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoveryEvent:appID:");
}

id objc_msgSend__entitledAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entitledAndReturnError:");
}

id objc_msgSend__entitledForAccessLevel_returnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entitledForAccessLevel:returnError:");
}

id objc_msgSend__findDADeviceWithBTIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findDADeviceWithBTIdentifier:");
}

id objc_msgSend__findDADeviceWithBTPeripheral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findDADeviceWithBTPeripheral:");
}

id objc_msgSend__findSyncExtensionPoint_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findSyncExtensionPoint:bundleID:");
}

id objc_msgSend__forgetBluetoothDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_forgetBluetoothDevice:");
}

id objc_msgSend__forgetWiFiDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_forgetWiFiDevice:");
}

id objc_msgSend__getNextTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getNextTask");
}

id objc_msgSend__keychainMarkDeviceForRestoreOnSameDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_keychainMarkDeviceForRestoreOnSameDevice");
}

id objc_msgSend__necpCleanupIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpCleanupIfNeeded");
}

id objc_msgSend__necpRemoveUUIDsForAppID_deviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpRemoveUUIDsForAppID:deviceID:");
}

id objc_msgSend__necpSignAddressEndpoint_uuidBytes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpSignAddressEndpoint:uuidBytes:error:");
}

id objc_msgSend__necpSignEndpointForDevice_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpSignEndpointForDevice:appID:");
}

id objc_msgSend__necpSignHostnameEndpoint_uuidBytes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpSignHostnameEndpoint:uuidBytes:error:");
}

id objc_msgSend__necpUUIDForAppID_deviceID_uuidBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpUUIDForAppID:deviceID:uuidBytes:");
}

id objc_msgSend__necpUpdateUUIDForAppID_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpUpdateUUIDForAppID:device:");
}

id objc_msgSend__necpUpdateUUIDsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpUpdateUUIDsWithBlock:");
}

id objc_msgSend__necpUpdateValueStrings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_necpUpdateValueStrings:");
}

id objc_msgSend__parseDADiscoveryConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseDADiscoveryConfiguration:");
}

id objc_msgSend__performScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScan");
}

id objc_msgSend__persistBluetoothDevice_device_requirePairing_pairWithCTKD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistBluetoothDevice:device:requirePairing:pairWithCTKD:");
}

id objc_msgSend__prefsChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prefsChanged");
}

id objc_msgSend__queueNextScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queueNextScan");
}

id objc_msgSend__reportDeviceChanged_appID_discovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDeviceChanged:appID:discovery:");
}

id objc_msgSend__reportDevicesMigratedEvent_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDevicesMigratedEvent:appID:");
}

id objc_msgSend__reportDevicesPresentChanged_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDevicesPresentChanged:appID:");
}

id objc_msgSend__reportDiscoveredBTDevice_advertisementData_RSSI_AppID_DADaemonDiscovery_DADiscovery_config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:");
}

id objc_msgSend__reportDiscoveryEvent_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportDiscoveryEvent:appID:");
}

id objc_msgSend__reportEvent_error_endCurrentTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportEvent:error:endCurrentTask:");
}

id objc_msgSend__reportFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportFailure:");
}

id objc_msgSend__reportRemovedDevice_appID_discovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportRemovedDevice:appID:discovery:");
}

id objc_msgSend__runNextTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runNextTask");
}

id objc_msgSend__saveAccessoryDevice_bundleID_existingOptions_removalType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveAccessoryDevice:bundleID:existingOptions:removalType:error:");
}

id objc_msgSend__saveAppDataDict_fileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveAppDataDict:fileURL:");
}

id objc_msgSend__saveDeviceAppAccessInfo_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveDeviceAppAccessInfo:device:error:");
}

id objc_msgSend__scheduleCheckAppAccessInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleCheckAppAccessInfo");
}

id objc_msgSend__scheduleCheckDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleCheckDevices");
}

id objc_msgSend__setupBTPairingManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupBTPairingManager");
}

id objc_msgSend__startBTScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startBTScan");
}

id objc_msgSend__statefulDevicesForAppID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_statefulDevicesForAppID:");
}

id objc_msgSend__stopBTScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopBTScan");
}

id objc_msgSend__updateAppInfo_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAppInfo:options:");
}

id objc_msgSend__updateBluetoothScannerIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateBluetoothScannerIfNeeded");
}

id objc_msgSend__updateDeviceStateForBluetooth_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeviceStateForBluetooth:device:");
}

id objc_msgSend__updateDeviceStateForWifi_currentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeviceStateForWifi:currentState:");
}

id objc_msgSend__updateDeviceStateTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeviceStateTimer");
}

id objc_msgSend__updateStateForDiscoveryDeviceID_state_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStateForDiscoveryDeviceID:state:appID:");
}

id objc_msgSend__updateWiFiDevice_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWiFiDevice:bundleID:");
}

id objc_msgSend__xpcBluetoothAccessInfoGet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcBluetoothAccessInfoGet:");
}

id objc_msgSend__xpcBluetoothPairingMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcBluetoothPairingMsg:");
}

id objc_msgSend__xpcConnectionAccept_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcConnectionAccept:");
}

id objc_msgSend__xpcDADiscoveryActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDADiscoveryActivate:");
}

id objc_msgSend__xpcDADiscoveryInvalidateWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDADiscoveryInvalidateWithReason:");
}

id objc_msgSend__xpcDADiscoveryMigrationComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDADiscoveryMigrationComplete:");
}

id objc_msgSend__xpcDASessionActivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDASessionActivate:");
}

id objc_msgSend__xpcDiagnosticShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcDiagnosticShow:");
}

id objc_msgSend__xpcGetAuthorizedAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetAuthorizedAccessories:");
}

id objc_msgSend__xpcGetAuthorizedDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetAuthorizedDevices:");
}

id objc_msgSend__xpcGetDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetDevices:");
}

id objc_msgSend__xpcGetPartialIPs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcGetPartialIPs:");
}

id objc_msgSend__xpcModifyDeviceSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcModifyDeviceSettings:");
}

id objc_msgSend__xpcRemoveDeviceAppAccessInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcRemoveDeviceAppAccessInfo:");
}

id objc_msgSend__xpcRemoveDeviceConfirmation_accessInfo_userConfirmed_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcRemoveDeviceConfirmation:accessInfo:userConfirmed:request:");
}

id objc_msgSend__xpcReportDAEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcReportDAEvent:");
}

id objc_msgSend__xpcSendEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendEvent:");
}

id objc_msgSend__xpcSendReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendReply:");
}

id objc_msgSend__xpcSendReplyError_request_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSendReplyError:request:");
}

id objc_msgSend__xpcSetDeviceAppAccessInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSetDeviceAppAccessInfo:");
}

id objc_msgSend__xpcSetDeviceState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSetDeviceState:");
}

id objc_msgSend__xpcSetPartialIPs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcSetPartialIPs:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accept(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accept");
}

id objc_msgSend_accessLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessLevel");
}

id objc_msgSend_accessoryOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryOptions");
}

id objc_msgSend_accessoryRemovalAlert_appName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryRemovalAlert:appName:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletionHandler:");
}

id objc_msgSend_addDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDiscovery:");
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

id objc_msgSend_addOrUpdateOrReAddItem_flags_logCategory_logLabel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
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

id objc_msgSend_allowsBluetoothPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsBluetoothPairing");
}

id objc_msgSend_alwaysConfirmBeforeAccessoryRemoval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alwaysConfirmBeforeAccessoryRemoval");
}

id objc_msgSend_appAccessInfoDeviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appAccessInfoDeviceMap");
}

id objc_msgSend_appAccessInfoForDeviceID_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appAccessInfoForDeviceID:appID:");
}

id objc_msgSend_appAccessInfoMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appAccessInfoMap");
}

id objc_msgSend_appBundleInfoAccessoryDiscoveryOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleInfoAccessoryDiscoveryOptions:");
}

id objc_msgSend_appBundleInfoAccessoryOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleInfoAccessoryOptions:");
}

id objc_msgSend_appConfirmsAuth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appConfirmsAuth");
}

id objc_msgSend_appDiscoveryConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appDiscoveryConfiguration");
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appState");
}

id objc_msgSend_applicationHasBluetoothGlobalTCC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationHasBluetoothGlobalTCC:");
}

id objc_msgSend_applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:completion:");
}

id objc_msgSend_approveTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "approveTime");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associationIdentifier");
}

id objc_msgSend_bluetoothClassicAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothClassicAddress");
}

id objc_msgSend_bluetoothCompanyIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothCompanyIdentifiers");
}

id objc_msgSend_bluetoothCompanyPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothCompanyPayload");
}

id objc_msgSend_bluetoothCompanyPayloadMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothCompanyPayloadMask");
}

id objc_msgSend_bluetoothIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothIdentifier");
}

id objc_msgSend_bluetoothNameSubstring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothNameSubstring");
}

id objc_msgSend_bluetoothRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothRange");
}

id objc_msgSend_bluetoothServicePayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothServicePayload");
}

id objc_msgSend_bluetoothServicePayloadMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothServicePayloadMask");
}

id objc_msgSend_bluetoothServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothServices");
}

id objc_msgSend_bluetoothUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothUUID");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bridgingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bridgingIdentifier");
}

id objc_msgSend_btOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btOperation");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_busy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "busy");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancelAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAll");
}

id objc_msgSend_cancelCurrentTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelCurrentTask");
}

id objc_msgSend_cancelPeripheralConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPeripheralConnection:");
}

id objc_msgSend_cancelTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTimer");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_centralManager_didDiscoverPeripheral_advertisementData_RSSI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centralManager:didDiscoverPeripheral:advertisementData:RSSI:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurations");
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectPeripheral:options:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemsMatchingItem_flags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemsMatchingItem:flags:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_cuFilteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cuFilteredArrayUsingBlock:");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_customProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customProperty:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_denyMulticast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denyMulticast");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_deviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMap");
}

id objc_msgSend_deviceMetadataURLValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMetadataURLValid:");
}

id objc_msgSend_devicesPresentWithAppID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicesPresentWithAppID:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverServices:");
}

id objc_msgSend_discoveredInExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredInExtension");
}

id objc_msgSend_discoveryConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryConfiguration");
}

id objc_msgSend_discoveryObj(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryObj");
}

id objc_msgSend_discoverySet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverySet");
}

id objc_msgSend_displayImageFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayImageFileURL");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeWithXPCObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeWithXPCObject:");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_eventHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventHandler");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_executeQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:");
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

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstUnlocked");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flags");
}

id objc_msgSend_forgetBluetoothDevice_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forgetBluetoothDevice:completion:");
}

id objc_msgSend_generateImageURLForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateImageURLForDevice:");
}

id objc_msgSend_getAuthorizedDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAuthorizedDevices:");
}

id objc_msgSend_getCurrentTaskBluetoothIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentTaskBluetoothIdentifier");
}

id objc_msgSend_getDevicesWithFlags_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDevicesWithFlags:appID:");
}

id objc_msgSend_getPartialIPsWithAppBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPartialIPsWithAppBundleID:error:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasTag:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_hotspotSSIDPrefixes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hotspotSSIDPrefixes");
}

id objc_msgSend_hotspotSSIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hotspotSSIDs");
}

id objc_msgSend_iconType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconType");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initWithAddress_mask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddress:mask:");
}

id objc_msgSend_initWithBluetoothIdentifier_pairedCTKD_appConfirmsAuth_pairingRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBluetoothIdentifier:pairedCTKD:appConfirmsAuth:pairingRequired:");
}

id objc_msgSend_initWithBluetoothIdentifier_pairingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBluetoothIdentifier:pairingType:");
}

id objc_msgSend_initWithBundleIdentifier_deviceIdentifier_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:deviceIdentifier:state:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithEventType_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:device:");
}

id objc_msgSend_initWithEventType_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:device:error:");
}

id objc_msgSend_initWithEventType_pairingInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:pairingInfo:");
}

id objc_msgSend_initWithExtensionPointIdentifier_predicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExtensionPointIdentifier:predicate:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithMigration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMigration:");
}

id objc_msgSend_initWithPersistentDictionaryRepresentation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersistentDictionaryRepresentation:error:");
}

id objc_msgSend_initWithPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrefix:");
}

id objc_msgSend_initWithPresent_devicesMigrated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPresent:devicesMigrated:");
}

id objc_msgSend_initWithSSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSSID:");
}

id objc_msgSend_initWithServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceType:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithXPCObject_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCObject:error:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOpen");
}

id objc_msgSend_isPeerPaired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPeerPaired:");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isUnsecured(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUnsecured");
}

id objc_msgSend_knownNetworkProfilesWithProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownNetworkProfilesWithProperties:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadConfigurationsWithCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadConfigurationsWithCompletionQueue:handler:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_markSessionActivationForPid_atTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markSessionActivationForPid:atTime:");
}

id objc_msgSend_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:");
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mask");
}

id objc_msgSend_matchSigningIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchSigningIdentifier");
}

id objc_msgSend_modifyAccessoryDevice_session_settings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyAccessoryDevice:session:settings:error:");
}

id objc_msgSend_modifyDeviceIdentifier_session_settings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyDeviceIdentifier:session:settings:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_networkEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkEndpoint");
}

id objc_msgSend_networkHotspotSSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkHotspotSSID");
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkName");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
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

id objc_msgSend_pairCTKD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairCTKD");
}

id objc_msgSend_pairPeer_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairPeer:options:");
}

id objc_msgSend_pairedCTKD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedCTKD");
}

id objc_msgSend_pairedWithCTKD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedWithCTKD");
}

id objc_msgSend_pairingAgent_peerDidCompletePairing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingAgent:peerDidCompletePairing:");
}

id objc_msgSend_pairingRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingRequired");
}

id objc_msgSend_pairingType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingType");
}

id objc_msgSend_passkey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passkey");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathController");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathRules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathRules");
}

id objc_msgSend_pendingRemoval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingRemoval");
}

id objc_msgSend_performScanWithParameters_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performScanWithParameters:reply:");
}

id objc_msgSend_persistBluetoothDevice_pairingRequired_pairWithCTKD_displayName_taskTimeout_appConfirmsAuth_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistBluetoothDevice:pairingRequired:pairWithCTKD:displayName:taskTimeout:appConfirmsAuth:completion:");
}

id objc_msgSend_persistentDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentDictionaryRepresentation");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefix");
}

id objc_msgSend_presenceOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenceOnly");
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocol");
}

id objc_msgSend_protocolType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocolType");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAppsAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAppsAccess:");
}

id objc_msgSend_removeAppsAccessForBundleID_appRemoval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAppsAccessForBundleID:appRemoval:");
}

id objc_msgSend_removeDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDiscovery:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeKnownNetworkProfile_reason_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeKnownNetworkProfile:reason:error:");
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

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_reportAuthorizedDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportAuthorizedDevices:");
}

id objc_msgSend_reportDeviceChanged_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDeviceChanged:appID:");
}

id objc_msgSend_reportDeviceChanged_appID_discovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDeviceChanged:appID:discovery:");
}

id objc_msgSend_reportDevicesMigrated_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDevicesMigrated:appID:");
}

id objc_msgSend_reportDevicesPresentChanged_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDevicesPresentChanged:appID:");
}

id objc_msgSend_reportDiscoveryEvent_appID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDiscoveryEvent:appID:");
}

id objc_msgSend_reportRemovedDevice_appID_discovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportRemovedDevice:appID:discovery:");
}

id objc_msgSend_respondToBluetoothPairingRequest_accept_pairingType_passkey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToBluetoothPairingRequest:accept:pairingType:passkey:");
}

id objc_msgSend_respondToPairingRequest_type_accept_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToPairingRequest:type:accept:data:");
}

id objc_msgSend_respondToPairingRequest_type_accept_passkey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToPairingRequest:type:accept:passkey:");
}

id objc_msgSend_retrieveBundle_sessionCountWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveBundle:sessionCountWithCompletion:");
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveConnectedPeripheralsWithServices:");
}

id objc_msgSend_retrievePeripheralsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePeripheralsWithIdentifiers:");
}

id objc_msgSend_revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokeBluetoothGlobalTCCIfNeededForDeviceAppAccessInfo:device:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runMigrationWithDiscovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMigrationWithDiscovery:");
}

id objc_msgSend_saveDevice_session_allowCreate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveDevice:session:allowCreate:error:");
}

id objc_msgSend_scanForPeripheralsWithServices_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanForPeripheralsWithServices:options:completion:");
}

id objc_msgSend_scanResultPredicate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanResultPredicate");
}

id objc_msgSend_sendAnalytics_forEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAnalytics:forEvent:");
}

id objc_msgSend_sendAnalyticsInfo_forEvent_withDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAnalyticsInfo:forEvent:withDeviceIdentifier:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessGroup:");
}

id objc_msgSend_setAccessibleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibleType:");
}

id objc_msgSend_setAccessoryOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryOptions:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setAppAccessInfoDeviceMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppAccessInfoDeviceMap:");
}

id objc_msgSend_setAppConfirmsAuth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppConfirmsAuth:");
}

id objc_msgSend_setAppDiscoveryConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppDiscoveryConfiguration:");
}

id objc_msgSend_setApproveTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApproveTime:");
}

id objc_msgSend_setBluetoothClassicAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothClassicAddress:");
}

id objc_msgSend_setBluetoothDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothDevices:");
}

id objc_msgSend_setBluetoothIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothIdentifier:");
}

id objc_msgSend_setBluetoothOTAName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothOTAName:");
}

id objc_msgSend_setBluetoothUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothUUID:");
}

id objc_msgSend_setBtOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtOperation:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfigurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurations:");
}

id objc_msgSend_setCustomProperty_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomProperty:value:");
}

id objc_msgSend_setDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaemon:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMap:");
}

id objc_msgSend_setDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevices:");
}

id objc_msgSend_setDirect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirect:");
}

id objc_msgSend_setDiscoveryConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryConfiguration:");
}

id objc_msgSend_setDiscoveryObj_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryObj:");
}

id objc_msgSend_setDiscoverySet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoverySet:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDisplayImageFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayImageFileURL:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirstUnlockHandler:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInvisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvisible:");
}

id objc_msgSend_setMergeScanResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMergeScanResults:");
}

id objc_msgSend_setMitmPairing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMitmPairing:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setOSSpecificAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOSSpecificAttributes:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPairCTKD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairCTKD:");
}

id objc_msgSend_setPairedCTKD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairedCTKD:");
}

id objc_msgSend_setPartialIPsForAppBundleID_partialIPs_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPartialIPsForAppBundleID:partialIPs:error:");
}

id objc_msgSend_setPasskey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasskey:");
}

id objc_msgSend_setPendingRemoval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingRemoval:");
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPid:");
}

id objc_msgSend_setProtocolType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocolType:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setResultsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultsHandler:");
}

id objc_msgSend_setSSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSSID:");
}

id objc_msgSend_setSSIDList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSSIDList:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatefulDeviceMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatefulDeviceMap:");
}

id objc_msgSend_setSyncType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncType:");
}

id objc_msgSend_setTaskTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskTimeout:");
}

id objc_msgSend_setTaskTimeoutSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskTimeoutSeconds:");
}

id objc_msgSend_setTimerTimeout_queue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimerTimeout:queue:handler:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnsecured_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnsecured:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setXpcCnx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcCnx:");
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDeviceConnection");
}

id objc_msgSend_sharedManagerForAllUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManagerForAllUsers");
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPairingAgent");
}

id objc_msgSend_startScanningWithDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScanningWithDescriptors:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statefulDeviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statefulDeviceMap");
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopScan");
}

id objc_msgSend_stopScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopScanning");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsGrouping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsGrouping");
}

id objc_msgSend_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tag:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskState");
}

id objc_msgSend_taskTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskTimeout");
}

id objc_msgSend_txtRecordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "txtRecordData");
}

id objc_msgSend_unpairPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpairPeer:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_untag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "untag:");
}

id objc_msgSend_updateAppAccessInfo_accessoryDevice_removalType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAppAccessInfo:accessoryDevice:removalType:error:");
}

id objc_msgSend_updateAppInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAppInfo:");
}

id objc_msgSend_updateDADevicesWithInstalledApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDADevicesWithInstalledApps");
}

id objc_msgSend_updateKnownNetworkProfile_properties_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateKnownNetworkProfile:properties:error:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInitiated");
}

id objc_msgSend_utf8ValueSafe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utf8ValueSafe");
}

id objc_msgSend_wifiInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiInterface");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xpcConnectionInvalidated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnectionInvalidated:");
}

id objc_msgSend_xpcReceivedRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceivedRequest:");
}
