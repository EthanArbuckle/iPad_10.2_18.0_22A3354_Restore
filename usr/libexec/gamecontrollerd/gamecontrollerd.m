id sub_1000034D8(uint64_t a1, int a2)
{
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    v5 = a2 + 1;
    do
    {
      if ((_DWORD)v5 == 2)
        v6 = &stru_10000C660;
      else
        v6 = CFSTR(":");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02x%@"), *(unsigned __int8 *)(a1 + (v5 - 2)), v6));
      objc_msgSend(v4, "appendString:", v7);

      --v5;
    }
    while (v5 > 1);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));

  return v9;
}

uint64_t sub_1000035CC()
{
  if (qword_100011F18 != -1)
    dispatch_once(&qword_100011F18, &stru_10000C318);
  return byte_100011F20;
}

void sub_10000360C(id a1)
{
  id v1;
  id v2;
  NSObject *v3;
  _DWORD v4[2];

  v1 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.GameController"));
  byte_100011F20 = objc_msgSend(v1, "BOOLForKey:", CFSTR("GCPartnersEnable"));
  v2 = sub_1000068A0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_100011F20;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }

}

void sub_100003AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_100003AF4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "setInterruptionHandler:", 0);
    objc_msgSend(v7, "setInvalidationHandler:", 0);
    v3 = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = v3;
    if (v3)
    {
      v5 = v3;
      objc_sync_enter(v5);
      objc_msgSend(v5, "removeObject:", v7);
      objc_sync_exit(v5);

      v6 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
      objc_sync_enter(v6);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v7);
      objc_sync_exit(v6);

    }
    WeakRetained = v7;
  }

}

void sub_100003BB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003DD4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setInterruptionHandler:", 0);
    objc_msgSend(v2, "setInvalidationHandler:", 0);
    WeakRetained = v2;
  }

}

void sub_100004140(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000042E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004614(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28,id *a29,id *a30)
{
  void *v30;

  objc_sync_exit(v30);
  _Unwind_Resume(a1);
}

void sub_100005488(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_1000054DC(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005530(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 2, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005584(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 3, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_1000055D8(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 4, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_10000562C(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 5, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005680(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 6, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_1000056D4(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 7, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005728(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 8, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_10000577C(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 9, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_1000057D0(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 10, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005824(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 11, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005878(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 12, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_1000058CC(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 13, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005920(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 14, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005974(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 15, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_1000059C8(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 16, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005A1C(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 17, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005A70(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 18, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005AC4(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 19, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005B18(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 28, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005B6C(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 29, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005BC0(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 27, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005C14(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 26, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005C68(uint64_t a1, float a2)
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v4 = a2;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 25, *(unsigned __int8 *)(a1 + 48), v4);

}

void sub_100005CBC(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  float v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "gravity");
  v8 = v7;
  objc_msgSend(v4, "gravity");
  v10 = v9;
  objc_msgSend(v4, "gravity");
  *(float *)&v11 = v11;
  LODWORD(v12) = 0;
  *(float *)&v13 = v8;
  *(float *)&v14 = v10;
  objc_msgSend(WeakRetained, "controllerWithUDID:setArrayValue:forElement:forward:", v6, 20, *(unsigned __int8 *)(a1 + 48), v13, v14, v11, v12);

  v15 = objc_loadWeakRetained(v3);
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "userAcceleration");
  v18 = v17;
  objc_msgSend(v4, "userAcceleration");
  v20 = v19;
  objc_msgSend(v4, "userAcceleration");
  *(float *)&v21 = v21;
  LODWORD(v22) = 0;
  *(float *)&v23 = v18;
  *(float *)&v24 = v20;
  objc_msgSend(v15, "controllerWithUDID:setArrayValue:forElement:forward:", v16, 21, *(unsigned __int8 *)(a1 + 48), v23, v24, v21, v22);

  v25 = objc_loadWeakRetained(v3);
  v26 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "attitude");
  v28 = v27;
  objc_msgSend(v4, "attitude");
  v30 = v29;
  objc_msgSend(v4, "attitude");
  v32 = v31;
  objc_msgSend(v4, "attitude");
  *(float *)&v33 = v33;
  *(float *)&v34 = v28;
  *(float *)&v35 = v30;
  *(float *)&v36 = v32;
  objc_msgSend(v25, "controllerWithUDID:setArrayValue:forElement:forward:", v26, 22, *(unsigned __int8 *)(a1 + 48), v34, v35, v36, v33);

  v48 = objc_loadWeakRetained(v3);
  v37 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "rotationRate");
  v39 = v38;
  objc_msgSend(v4, "rotationRate");
  v41 = v40;
  objc_msgSend(v4, "rotationRate");
  v43 = v42;

  *(float *)&v44 = v43;
  LODWORD(v45) = 0;
  *(float *)&v46 = v39;
  *(float *)&v47 = v41;
  objc_msgSend(v48, "controllerWithUDID:setArrayValue:forElement:forward:", v37, 23, *(unsigned __int8 *)(a1 + 48), v46, v47, v44, v45);

}

void sub_100005E80(uint64_t a1)
{
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(v2) = 1.0;
  objc_msgSend(WeakRetained, "controllerWithUDID:setValue:forElement:forward:", *(_QWORD *)(a1 + 40), 24, *(unsigned __int8 *)(a1 + 48), v2);

}

void sub_1000060BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006394(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000657C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000065E0()
{
  if (qword_100011F30 != -1)
    dispatch_once(&qword_100011F30, &stru_10000C460);
  return byte_100011F28;
}

void sub_100006620(id a1)
{
  byte_100011F28 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_100006644()
{
  if (qword_100011F40 != -1)
    dispatch_once(&qword_100011F40, &stru_10000C480);
  return (id)qword_100011F38;
}

void sub_100006684(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_100011F38;
  qword_100011F38 = (uint64_t)v1;

}

id sub_1000066B4()
{
  if (qword_100011F50 != -1)
    dispatch_once(&qword_100011F50, &stru_10000C4A0);
  return (id)qword_100011F48;
}

void sub_1000066F4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_100011F48;
  qword_100011F48 = (uint64_t)v1;

}

id sub_100006724()
{
  if (qword_100011F60 != -1)
    dispatch_once(&qword_100011F60, &stru_10000C4C0);
  return (id)qword_100011F58;
}

void sub_100006764(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_100011F58;
  qword_100011F58 = (uint64_t)v1;

}

id sub_100006794()
{
  if (qword_100011F70 != -1)
    dispatch_once(&qword_100011F70, &stru_10000C4E0);
  return (id)qword_100011F68;
}

void sub_1000067D4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_100011F68;
  qword_100011F68 = (uint64_t)v1;

}

id sub_100006804()
{
  if (qword_100011F80 != -1)
    dispatch_once(&qword_100011F80, &stru_10000C500);
  return (id)qword_100011F78;
}

void sub_100006844(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_100011F78;
  qword_100011F78 = (uint64_t)v1;

}

void sub_100006874(char *category)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_100011F88;
  qword_100011F88 = (uint64_t)v1;

}

id sub_1000068A0()
{
  if (qword_100011F90 != -1)
    dispatch_once(&qword_100011F90, &stru_10000C520);
  return (id)qword_100011F88;
}

void sub_1000068E0(id a1)
{
  if (!qword_100011F88)
    objc_storeStrong((id *)&qword_100011F88, &_os_log_default);
}

id sub_100006904()
{
  if (qword_100011FA0 != -1)
    dispatch_once(&qword_100011FA0, &stru_10000C540);
  return (id)qword_100011F98;
}

void sub_100006944(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_100011F98;
  qword_100011F98 = (uint64_t)v1;

}

id sub_100006974()
{
  if (qword_100011FB0 != -1)
    dispatch_once(&qword_100011FB0, &stru_10000C560);
  return (id)qword_100011FA8;
}

void sub_1000069B4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_100011FA8;
  qword_100011FA8 = (uint64_t)v1;

}

id sub_1000069E4()
{
  if (qword_100011FC0 != -1)
    dispatch_once(&qword_100011FC0, &stru_10000C580);
  return (id)qword_100011FB8;
}

void sub_100006A24(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_100011FB8;
  qword_100011FB8 = (uint64_t)v1;

}

id sub_100006A54()
{
  if (qword_100011FD0 != -1)
    dispatch_once(&qword_100011FD0, &stru_10000C5A0);
  return (id)qword_100011FC8;
}

void sub_100006A94(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_100011FC8;
  qword_100011FC8 = (uint64_t)v1;

}

uint64_t start()
{
  void *v0;
  GCDGameControllerDaemonDelegate *v1;
  dispatch_source_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  _set_user_dir_suffix("com.apple.gamecontrollerd");
  if (os_variant_allows_internal_security_policies("com.apple.gamecontroller"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = objc_msgSend(v8, "fileExistsAtPath:", CFSTR("/tmp/gamecontrollerd_prevent_startup"));

    if (v9)
    {
      do
      {
        if (sub_1000065E0())
        {
          v12 = sub_100006804();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deferring startup...", buf, 2u);
          }

        }
        sleep(1u);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v11 = objc_msgSend(v10, "fileExistsAtPath:", CFSTR("/tmp/gamecontrollerd_prevent_startup"));

      }
      while ((v11 & 1) != 0);
    }
  }
  if (sub_1000065E0())
  {
    v14 = sub_100006804();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Running...", v19, 2u);
    }

  }
  v0 = objc_autoreleasePoolPush();
  +[GameControllerDaemon run](GameControllerDaemon, "run");
  v1 = objc_alloc_init(GCDGameControllerDaemonDelegate);
  signal(15, (void (__cdecl *)(int))1);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)qword_100011FD8;
  qword_100011FD8 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100011FD8, &stru_10000C5C0);
  dispatch_resume((dispatch_object_t)qword_100011FD8);
  do
  {
    v4 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    objc_msgSend(v5, "runUntilDate:", v6);

    objc_autoreleasePoolPop(v4);
  }
  while (-[GCDGameControllerDaemonDelegate shouldKeepRunning](v1, "shouldKeepRunning"));
  if (sub_1000065E0())
  {
    v16 = sub_100006804();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Stopping...", v18, 2u);
    }

  }
  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_100006D54(id a1)
{
  exit(0);
}

void sub_100006E1C(id a1)
{
  id v1;
  void *v2;

  v1 = -[GameControllerDaemon _init]([GameControllerDaemon alloc], "_init");
  v2 = (void *)qword_100011FE0;
  qword_100011FE0 = (uint64_t)v1;

}

void sub_1000070A0(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (sub_1000065E0())
  {
    v3 = sub_100006644();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100008088((uint64_t)v2, v4);

  }
}

void sub_100007420(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000075F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007750(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007E0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007EBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008088(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "XPC Event Stream 'com.apple.iokit.match.gamecontroller' event: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_init");
}

id objc_msgSend__start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_start");
}

id objc_msgSend_acceptIncomingDriverConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptIncomingDriverConnection:");
}

id objc_msgSend_acceptNewConnection_fromGCEnabledApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptNewConnection:fromGCEnabledApp:");
}

id objc_msgSend_acceptNewConnection_fromHIDServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptNewConnection:fromHIDServer:");
}

id objc_msgSend_acceptNewConnection_fromHapticsEnabledApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptNewConnection:fromHapticsEnabledApp:");
}

id objc_msgSend_acceptNewConnectionFromMediaRemote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptNewConnectionFromMediaRemote:");
}

id objc_msgSend_addConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConnection:");
}

id objc_msgSend_addController_forward_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addController:forward:");
}

id objc_msgSend_addControllerForAppStoreRemote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addControllerForAppStoreRemote:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attitude");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_buttonA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonA");
}

id objc_msgSend_buttonB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonB");
}

id objc_msgSend_buttonHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonHome");
}

id objc_msgSend_buttonMenu(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonMenu");
}

id objc_msgSend_buttonOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonOptions");
}

id objc_msgSend_buttonX(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonX");
}

id objc_msgSend_buttonY(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonY");
}

id objc_msgSend_client_connectionsDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client:connectionsDidChange:");
}

id objc_msgSend_clientForConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientForConnection:");
}

id objc_msgSend_clientProxyWithConnection_server_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientProxyWithConnection:server:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_controllerWithUDID_setArrayValue_forElement_forward_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerWithUDID:setArrayValue:forElement:forward:");
}

id objc_msgSend_controllerWithUDID_setValue0_setValue1_setValue2_setValue3_forElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerWithUDID:setValue0:setValue1:setValue2:setValue3:forElement:");
}

id objc_msgSend_controllerWithUDID_setValue_forElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerWithUDID:setValue:forElement:");
}

id objc_msgSend_controllerWithUDID_setValue_forElement_forward_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerWithUDID:setValue:forElement:forward:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deviceHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceHash");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_down(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "down");
}

id objc_msgSend_dpad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dpad");
}

id objc_msgSend_extendedGamepad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedGamepad");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_gamepad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gamepad");
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gravity");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_fromProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:fromProcess:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithUserDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUserDefaults:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isATVRemote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isATVRemote");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_left(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "left");
}

id objc_msgSend_leftShoulder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftShoulder");
}

id objc_msgSend_leftThumbstick(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftThumbstick");
}

id objc_msgSend_leftThumbstickButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftThumbstickButton");
}

id objc_msgSend_leftTrigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftTrigger");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "member:");
}

id objc_msgSend_microControllerWithUDID_setDigitizerX_digitizerY_withTimeStamp_touchDown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "microControllerWithUDID:setDigitizerX:digitizerY:withTimeStamp:touchDown:");
}

id objc_msgSend_motion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motion");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processMicroControllerWithUDID_setDigitizerX_withY_withTimeStamp_touchDown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processMicroControllerWithUDID:setDigitizerX:withY:withTimeStamp:touchDown:");
}

id objc_msgSend_refreshClientTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshClientTransaction");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeController:");
}

id objc_msgSend_removeController_forward_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeController:forward:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourcePath");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_right(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "right");
}

id objc_msgSend_rightShoulder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightShoulder");
}

id objc_msgSend_rightThumbstick(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightThumbstick");
}

id objc_msgSend_rightThumbstickButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightThumbstickButton");
}

id objc_msgSend_rightTrigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightTrigger");
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotationRate");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_setControllerPausedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControllerPausedHandler:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setValueChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValueChangedHandler:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldKeepRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldKeepRunning");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_up(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "up");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userAcceleration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAcceleration");
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userIdentifier");
}
