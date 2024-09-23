unint64_t sub_100005CD4()
{
  uint64_t v0;
  unint64_t result;

  result = (unint64_t)objc_msgSend(*(id *)(v0 + 32), "currentDeviceOrientation");
  if (result >= 7)
    return 1;
  return result;
}

id sub_100005CFC(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

uint64_t sub_100005E00(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  CGAffineTransform v6;

  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(&v6, 0, sizeof(v6));
  if (CGAffineTransformIsIdentity(&v6))
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t type metadata accessor for RecentsContainerViewController()
{
  return objc_opt_self(FTRecentsContainerViewController);
}

uint64_t type metadata accessor for AccelerometerOrientationMonitorWrapper()
{
  return objc_opt_self(_TtC8FaceTime38AccelerometerOrientationMonitorWrapper);
}

id sub_100006018(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

void sub_1000060D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t);
  uint64_t v19;
  char v20;
  void (*v21)(_BYTE *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char v24;
  _BYTE v25[24];
  _BYTE v26[24];

  v3 = v2;
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(a1, a2);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = v4[11];
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v7, v12);
  v14 = &v25[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = v2 + v4[20];
  swift_beginAccess(v15, v26, 0, 0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v14, v15, v10);
  v16 = (*(uint64_t (**)(uint64_t))(v4[13] + 40))(v10);
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v14, v10);
  *(_QWORD *)(v3 + 24) = v16;
  if ((*(_BYTE *)(v3 + 40) & 1) == 0 && (unint64_t)(v16 - 5) >= 0xFFFFFFFFFFFFFFFCLL)
    *(_QWORD *)(v3 + 32) = v16;
  v17 = v3 + *(_QWORD *)(*(_QWORD *)v3 + 152);
  swift_beginAccess(v17, v25, 0, 0);
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16);
  v18(v9, v17, v5);
  v19 = v4[12];
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 48))(v5, v19);
  v21 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v21(v9, v5);
  if ((v20 & 1) != 0)
  {
    v18(v9, v17, v5);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 40))(v5, v19);
    v21(v9, v5);
    *(_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 168)) = v22;
    v23 = *(_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 168));
    if ((unint64_t)(v23 - 1) <= 3)
      *(_QWORD *)(v3 + 32) = v23;
    v24 = *(_BYTE *)(v3 + 40);
    *(_BYTE *)(v3 + 40) = 1;
    sub_1000159E0(v24);
  }
}

uint64_t sub_1000062C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[24];
  _BYTE v9[24];
  uint64_t v10;

  v1 = v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate, v8, 0, 0);
  sub_10004B214(v1, (uint64_t)v9);
  if (!v10)
    return sub_10001287C((uint64_t)v9, (uint64_t *)&unk_1000A2BA0);
  sub_10004B278((uint64_t)v9, (uint64_t)v5);
  sub_10001287C((uint64_t)v9, (uint64_t *)&unk_1000A2BA0);
  v2 = v6;
  v3 = v7;
  sub_100015268(v5, v6);
  dispatch thunk of RecentCallProviderDelegate.recentCallsDidChange()(v2, v3);
  return sub_1000469AC(v5);
}

uint64_t type metadata accessor for RecentCallDetailControllerFactory()
{
  return objc_opt_self(_TtC8FaceTime33RecentCallDetailControllerFactory);
}

uint64_t type metadata accessor for SpringBoardOrientationObserverWrapper()
{
  return objc_opt_self(_TtC8FaceTime37SpringBoardOrientationObserverWrapper);
}

id sub_1000064D8(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

uint64_t sub_100006520(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for () + 64;
    v4[2] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_1000065A4(id a1)
{
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;

  v7 = 0;
  v1 = (const __CFBoolean *)MGCopyAnswerWithError(CFSTR("jkr5aFPOh/d6zTzNKYthBw"), 0, &v7);
  if (v1)
  {
    v2 = v1;
    if (v7)
    {
      v3 = sub_10000E6C4();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_100054C68(&v7, v4);

    }
    else
    {
      byte_1000A3640 = CFBooleanGetValue(v1) != 0;
    }
    CFRelease(v2);
  }
  else
  {
    v5 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100054C28(v6);

  }
}

uint64_t sub_100006668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

_QWORD *sub_100006694(uint64_t a1, uint64_t a2)
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
  v4 = sub_10001283C(&qword_1000A3158);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

id sub_1000067AC(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

uint64_t sub_100006874()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008758(v0, qword_1000A2540);
  v1 = sub_1000138F4(v0, (uint64_t)qword_1000A2540);
  if (qword_1000A1ED0 != -1)
    swift_once(&qword_1000A1ED0, sub_100015DA8);
  v2 = sub_1000138F4(v0, (uint64_t)qword_1000A49D8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t type metadata accessor for OrientationMonitorComposer()
{
  return objc_opt_self(PHOrientationMonitorComposer);
}

void sub_100006F70(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[0] = CNContactPhoneNumbersKey;
  v4[1] = CNContactEmailAddressesKey;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v4[2] = v1;
  v4[3] = CNContactSocialProfilesKey;
  v2 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 4));
  v3 = (void *)qword_1000A3918;
  qword_1000A3918 = v2;

}

uint64_t sub_10000702C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008758(v0, qword_1000A2E00);
  v1 = sub_1000138F4(v0, (uint64_t)qword_1000A2E00);
  if (qword_1000A1ED8 != -1)
    swift_once(&qword_1000A1ED8, sub_100015D74);
  v2 = sub_1000138F4(v0, (uint64_t)qword_1000A49F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  id v5;
  uint64_t v6;

  v4 = objc_autoreleasePoolPush();
  v5 = +[FTApplicationServices sharedInstance](FTApplicationServices, "sharedInstance");
  +[TUVideoDeviceController prewarm](TUVideoDeviceController, "prewarm");
  v6 = UIApplicationMain(a1, a2, 0, 0);
  objc_autoreleasePoolPop(v4);
  return v6;
}

uint64_t sub_100007130(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[8];

  v6[0] = &unk_1000682E8;
  v6[1] = (char *)&value witness table for Builtin.Int64 + 64;
  v6[2] = (char *)&value witness table for Builtin.Int64 + 64;
  v6[3] = &unk_1000682E8;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v6[4] = *(_QWORD *)(result - 8) + 64;
    result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 80));
    if (v4 <= 0x3F)
    {
      v6[5] = *(_QWORD *)(result - 8) + 64;
      result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 88));
      if (v5 <= 0x3F)
      {
        v6[6] = *(_QWORD *)(result - 8) + 64;
        v6[7] = (char *)&value witness table for Builtin.Int64 + 64;
        return swift_initClassMetadata2(a1, 0, 8, v6, a1 + 112);
      }
    }
  }
  return result;
}

uint64_t sub_1000071F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint32_t v3;
  int v5;
  uint64_t *p_out_token;
  uint64_t v7;
  uint64_t out_token;
  char v9;

  v1 = v0;
  if (*(_BYTE *)(v0 + 20) == 1)
  {
    LODWORD(out_token) = -1;
    v2 = String.utf8CString.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    v3 = notify_register_check((const char *)(v2 + 32), (int *)&out_token);
    swift_release(v2);
    if (v3)
    {
      if ((*(_BYTE *)(v1 + 20) & 1) != 0)
        return *(_QWORD *)(v1 + 40);
    }
    else
    {
      *(_DWORD *)(v1 + 16) = out_token;
      *(_BYTE *)(v1 + 20) = 0;
    }
  }
  v5 = *(_DWORD *)(v1 + 16);
  v7 = (*(uint64_t (**)(uint64_t))(v1 + 48))(v1 + 40);
  notify_get_state(v5, (uint64_t *)&v7);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(v1 + 64))(&out_token, v7);
  if (v9)
    p_out_token = (uint64_t *)(v1 + 40);
  else
    p_out_token = &out_token;
  return *p_out_token;
}

uint64_t sub_1000072F0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_1000072F8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100007478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint32_t v3;
  int v5;
  int out_token[2];
  uint64_t v7;

  v1 = v0;
  if (*(_BYTE *)(v0 + 20) == 1)
  {
    out_token[0] = -1;
    v2 = String.utf8CString.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    v3 = notify_register_check((const char *)(v2 + 32), out_token);
    swift_release(v2);
    if (v3)
    {
      if ((*(_BYTE *)(v1 + 20) & 1) != 0)
        return *(unsigned __int8 *)(v1 + 40);
    }
    else
    {
      *(_DWORD *)(v1 + 16) = out_token[0];
      *(_BYTE *)(v1 + 20) = 0;
    }
  }
  v5 = *(_DWORD *)(v1 + 16);
  *(_QWORD *)out_token = (*(uint64_t (**)(uint64_t))(v1 + 48))(v1 + 40);
  notify_get_state(v5, (uint64_t *)out_token);
  (*(void (**)(uint64_t *__return_ptr, _QWORD))(v1 + 64))(&v7, *(_QWORD *)out_token);
  if (v7 == 2)
    return *(unsigned __int8 *)(v1 + 40);
  else
    return v7 & 1;
}

uint64_t sub_100007574(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t sub_10000757C@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

uint64_t sub_10000758C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = &unk_1000679B8;
  v4[1] = &unk_1000679D0;
  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    v4[3] = (char *)&value witness table for () + 64;
    v4[4] = (char *)&value witness table for () + 64;
    result = swift_initClassMetadata2(a1, 0, 5, v4, a1 + 88);
    if (!result)
      return 0;
  }
  return result;
}

_QWORD *sub_100007620()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *result;
  uint64_t v11;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000A1EB0 != -1)
    swift_once(&qword_1000A1EB0, sub_100006874);
  v5 = sub_1000138F4(v0, (uint64_t)qword_1000A2540);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  v6 = type metadata accessor for SpringBoardOrientationObserver(0);
  v7 = swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  v8 = (_QWORD *)(v7 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_onOrientationLock);
  *v8 = nullsub_1;
  v8[1] = 0;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver____lazy_storage___cfObserver) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v7 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_logger, v4, v0);
  v9 = type metadata accessor for SpringBoardOrientationObserverWrapper();
  result = (_QWORD *)swift_allocObject(v9, 56, 7);
  result[4] = 0xEB00000000647261;
  result[5] = nullsub_1;
  result[6] = 0;
  result[2] = v7;
  result[3] = 0x6F42676E69727053;
  qword_1000A2558 = (uint64_t)result;
  return result;
}

Class sub_100007774(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_100013580(0, &qword_1000A2700, NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

void sub_100007B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000081BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008264()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  if (v1)
  {
    v2 = objc_allocWithZone((Class)PHFrecentNavigationController);
    v3 = v1;
    v4 = objc_msgSend(v2, "initWithRootViewController:", v3);
    v5 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_content);
    *(_QWORD *)(v0 + OBJC_IVAR___FTRecentsContainerViewController_content) = v4;
    v7 = v4;
    sub_1000097F8(v5);

  }
  else
  {
    v6 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_content);
    *(_QWORD *)(v0 + OBJC_IVAR___FTRecentsContainerViewController_content) = 0;
    v7 = v6;
    sub_1000097F8(v6);
  }

}

void sub_10000848C()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for RecentsContainerViewController();
  objc_msgSendSuper2(&v14, "viewWillLayoutSubviews");
  v1 = *(void **)&v0[OBJC_IVAR___FTRecentsContainerViewController_content];
  if (v1)
  {
    v2 = objc_msgSend(v1, "view");
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v0, "view");
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v4, "bounds");
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;

        objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_100008570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000A1EB0 != -1)
    swift_once(&qword_1000A1EB0, sub_100006874);
  v5 = sub_1000138F4(v0, (uint64_t)qword_1000A2540);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  if (qword_1000A1EB8 != -1)
    swift_once(&qword_1000A1EB8, sub_100007620);
  v6 = qword_1000A2558;
  v7 = type metadata accessor for AccelerometerOrientationMonitorWrapper();
  v8 = swift_allocObject(v7, 56, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100067900;
  *(_QWORD *)(v8 + 32) = 0xED0000726574656DLL;
  *(_QWORD *)(v8 + 40) = nullsub_1;
  *(_QWORD *)(v8 + 48) = 0;
  swift_retain(v6);
  v9 = sub_1000091CC();
  swift_release(v9);
  v10 = sub_10001283C(&qword_1000A25C0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = sub_100009AE4((uint64_t)v4, v6, v8);
  swift_release(v6);
  result = swift_release(v8);
  qword_1000A2560 = v11;
  return result;
}

uint64_t sub_1000086E8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;

  v9 = type metadata accessor for Logger(0);
  sub_100008758(v9, a2);
  sub_1000138F4(v9, (uint64_t)a2);
  return Logger.init(subsystem:category:)(a3, a4, a5, 0xE700000000000000);
}

uint64_t *sub_100008758(uint64_t a1, uint64_t *a2)
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

void sub_100008948(uint64_t a1)
{
  PhoneRootViewController *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc_init(PhoneRootViewController);
  objc_msgSend(UIApp, "setRootViewController:", v2);

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (!v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRootViewController:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_initializeUI");
  objc_msgSend(*(id *)(a1 + 32), "setIsUIInitialized:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "makeKeyAndVisible");

}

void sub_100008A10()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _BYTE v15[24];

  v1 = v0;
  v2 = (_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 160));
  swift_beginAccess(v2, v15, 0, 0);
  v3 = *v2;
  swift_retain(*v2);
  v4 = sub_1000091CC();
  v5 = sub_100005CD4();
  swift_release(v3);
  swift_release(v4);
  *(_QWORD *)(v1 + 24) = v5;
  if ((*(_BYTE *)(v1 + 40) & 1) == 0 && v5 - 5 > 0xFFFFFFFFFFFFFFFBLL)
    *(_QWORD *)(v1 + 32) = v5;
  v6 = (_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152));
  swift_beginAccess(v6, &v14, 0, 0);
  v7 = *v6;
  swift_retain(*v6);
  v8 = sub_10001283C(&qword_1000A25C8);
  swift_initStaticObject(v8, &unk_1000A1F28);
  v9 = sub_100007478();
  swift_release(v7);
  if ((v9 & 1) != 0)
  {
    v10 = *v6;
    swift_retain(v10);
    v11 = sub_10001283C(&qword_1000A25D0);
    swift_initStaticObject(v11, &unk_1000A1F80);
    v12 = sub_1000071F8();
    swift_release(v10);
    *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 168)) = v12;
    if ((unint64_t)(v12 - 1) <= 3)
      *(_QWORD *)(v1 + 32) = v12;
    v13 = *(_BYTE *)(v1 + 40);
    *(_BYTE *)(v1 + 40) = 1;
    sub_100009CD8(v13);
  }
}

char *sub_100008B70(void *a1)
{
  _BYTE *v1;
  _OWORD *v3;
  _QWORD *v4;
  id v5;
  char *v6;
  void *v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = &v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate];
  *v3 = 0u;
  v3[1] = 0u;
  v3[2] = 0u;
  v4 = &v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield];
  *v4 = 0;
  v4[1] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController] = a1;
  v1[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls] = 0;
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for RecentCallProvider();
  v5 = a1;
  v6 = (char *)objc_msgSendSuper2(&v13, "init");
  v7 = *(void **)&v6[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController];
  sub_100013580(0, (unint64_t *)&unk_1000A2BE0, OS_dispatch_queue_ptr);
  v8 = v6;
  v9 = v7;
  v11 = (void *)static OS_dispatch_queue.main.getter(v9, v10);
  objc_msgSend(v9, "addDelegate:queue:", v8, v11, v13.receiver, v13.super_class);

  return v8;
}

void sub_100008F18()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v1 = v0;
  v2 = *(_QWORD *)v0;
  v3 = swift_retain(v0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 67109120;
    v10 = v1[16];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v6 + 4, v6 + 8);
    swift_release(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "setOrientationEventsEnabled: %{BOOL}d", v6, 8u);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_release(v1);
  }

  v7 = v1[16];
  swift_beginAccess(&v1[*(_QWORD *)(*(_QWORD *)v1 + 160)], &v10, 33, 0);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 + 104) + 56))(v7, *(_QWORD *)(v2 + 88));
  v8 = swift_endAccess(&v10);
  if (v1[16] == 1)
    sub_1000060D8(v8, v9);
}

uint64_t sub_10000915C(char a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = sub_1000091CC();
  objc_msgSend((id)v2[4], "setOrientationEventsEnabled:", a1 & 1);
  swift_release(v2);
  v3 = sub_1000091CC();
  objc_msgSend((id)v3[4], "setPassiveOrientationEvents:", (a1 & 1) == 0);
  return swift_release(v3);
}

_QWORD *sub_1000091CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = *(_QWORD **)(v0 + 16);
  }
  else
  {
    v3 = v0;
    v4 = swift_allocObject(&unk_10008A730, 24, 7);
    swift_weakInit(v4 + 16, v3);
    v5 = type metadata accessor for OrientationMonitorAccelerometer();
    swift_allocObject(v5, 48, 7);
    v2 = sub_10000A5D4((uint64_t)sub_100041488, v4);
    v6 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;
    swift_retain(v2);
    swift_release(v6);
    v1 = 0;
  }
  swift_retain(v1);
  return v2;
}

void sub_1000097F8(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;

  v2 = v1;
  v4 = type metadata accessor for DispatchPredicate(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (uint64_t *)((char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100013580(0, (unint64_t *)&unk_1000A2BE0, OS_dispatch_queue_ptr);
  *v8 = static OS_dispatch_queue.main.getter();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v4);
  v9 = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v8, v4);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (!a1)
    goto LABEL_5;
  v10 = a1;
  objc_msgSend(v10, "willMoveToParentViewController:", 0);
  v11 = objc_msgSend(v10, "view");
  if (!v11)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v12 = v11;
  objc_msgSend(v11, "removeFromSuperview");

  objc_msgSend(v10, "removeFromParentViewController");
LABEL_5:
  v13 = *(void **)&v2[OBJC_IVAR___FTRecentsContainerViewController_content];
  if (!v13)
    return;
  v14 = v13;
  objc_msgSend(v2, "addChildViewController:", v14);
  v15 = objc_msgSend(v2, "view");
  if (!v15)
    goto LABEL_12;
  v16 = v15;
  v17 = objc_msgSend(v14, "view");
  if (!v17)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v18 = v17;
  objc_msgSend(v16, "addSubview:", v17);

  objc_msgSend(v14, "didMoveToParentViewController:", v2);
}

uint64_t sub_100009AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)(uint64_t, char);
  uint64_t v21;
  _BYTE v23[24];
  _BYTE v24[24];

  *(_BYTE *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 32) = 0;
  *(_BYTE *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 168)) = 0;
  v7 = v3 + qword_1000A31D8;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  v10 = (_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 152));
  *v10 = a2;
  v11 = (uint64_t *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 160));
  *v11 = a3;
  v12 = swift_allocObject(&unk_10008A888, 24, 7);
  swift_weakInit(v12 + 16, v3);
  swift_beginAccess(v11, v24, 1, 0);
  v13 = *v11;
  v14 = *(_QWORD *)(*v11 + 48);
  *(_QWORD *)(v13 + 40) = sub_10004465C;
  *(_QWORD *)(v13 + 48) = v12;
  swift_retain(a2);
  swift_retain(a3);
  swift_release(v14);
  v15 = swift_allocObject(&unk_10008A888, 24, 7);
  swift_weakInit(v15 + 16, v3);
  swift_beginAccess(v10, v23, 33, 0);
  v16 = (_QWORD *)*v10;
  v17 = v16[6];
  v16[5] = sub_100044664;
  v16[6] = v15;
  swift_retain_n(v15, 2);
  swift_release(v17);
  v18 = v16[2];
  v19 = swift_allocObject(&unk_10008A8B0, 24, 7);
  swift_weakInit(v19 + 16, v16);
  v20 = (uint64_t (**)(uint64_t, char))(v18
                                               + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_onOrientationLock);
  v21 = *(_QWORD *)(v18 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_onOrientationLock + 8);
  *v20 = sub_100044670;
  v20[1] = (uint64_t (*)(uint64_t, char))v19;
  swift_endAccess(v23);
  swift_release_n(v15, 2);
  swift_release(v21);
  sub_100008A10();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v3;
}

void sub_100009CD8(char a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Class isa;
  uint64_t v17;
  uint64_t v18;

  if (v1[40] != (a1 & 1))
  {
    v2 = v1;
    v3 = swift_retain_n(v1, 2);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = swift_slowAlloc(18, -1);
      v7 = swift_slowAlloc(32, -1);
      v18 = v7;
      *(_DWORD *)v6 = 67109378;
      LODWORD(v17) = v2[40];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, (char *)&v17 + 4, v6 + 4, v6 + 8);
      *(_WORD *)(v6 + 8) = 2080;
      v8 = *(_QWORD *)&v2[*(_QWORD *)(*(_QWORD *)v2 + 168)];
      swift_release(v2);
      v9 = v8 - 1;
      v10 = 0xE800000000000000;
      v11 = 0x7469617274726F70;
      switch(v9)
      {
        case 0:
          break;
        case 1:
          v10 = 0x800000010006A7A0;
          v11 = 0xD000000000000012;
          break;
        case 2:
          v10 = 0xED00007466654C65;
          goto LABEL_9;
        case 3:
          v10 = 0xEE00746867695265;
LABEL_9:
          v11 = 0x70616373646E616CLL;
          break;
        case 4:
          v10 = 0xE600000000000000;
          v11 = 0x705565636166;
          break;
        case 5:
          v11 = 0x6E776F4465636166;
          break;
        default:
          v10 = 0xE700000000000000;
          v11 = 0x6E776F6E6B6E75;
          break;
      }
      v17 = sub_100013E00(v11, v10, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v6 + 10, v6 + 18);
      swift_release(v2);
      swift_bridgeObjectRelease(v10);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "set orientation locked: %{BOOL}d to orientation: %s", (uint8_t *)v6, 0x12u);
      swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
    }
    else
    {
      swift_release_n(v2, 2);
    }

    if ((v2[40] & 1) == 0)
    {
      v12 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
      if (qword_1000A1F00 != -1)
        swift_once(&qword_1000A1F00, sub_100052020);
      v13 = qword_1000A4A68;
      v14 = sub_100043AD0();
      v15 = sub_10005216C(v14);
      swift_bridgeObjectRelease(v14);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v15);
      objc_msgSend(v12, "postNotificationName:object:userInfo:", v13, 0, isa);

    }
  }
}

void sub_10000A334(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Registration dismissed but faceTimeRootViewController is not visible.", v1, 2u);
}

void sub_10000A374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;

  v6 = sub_10001283C(&qword_1000A26E0);
  v7 = swift_allocObject(v6, 112, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100067A20;
  *(_QWORD *)(v7 + 56) = &type metadata for String;
  *(_QWORD *)(v7 + 64) = sub_100015724();
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  *(_QWORD *)(v7 + 96) = sub_10001283C(&qword_1000A26E8);
  *(_QWORD *)(v7 + 104) = sub_1000156D8();
  *(_QWORD *)(v7 + 72) = a3;
  sub_100013580(0, (unint64_t *)&qword_1000A26F8, OS_os_log_ptr);
  swift_bridgeObjectRetain(a2);
  v8 = swift_bridgeObjectRetain(a3);
  v9 = (void *)static OS_os_log.default.getter(v8);
  v10 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("MPAnalyticsLogger: logging core analytics view %@ with dictionary %@", 68, 2, &_mh_execute_header, v9, v10, v7);
  swift_bridgeObjectRelease(v7);

  v11 = String._bridgeToObjectiveC()();
  v12 = swift_allocObject(&unk_10008A990, 24, 7);
  *(_QWORD *)(v12 + 16) = a3;
  v15[4] = sub_100015D6C;
  v16 = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100007774;
  v15[3] = &unk_10008A9A8;
  v13 = _Block_copy(v15);
  v14 = v16;
  swift_bridgeObjectRetain(a3);
  swift_release(v14);
  AnalyticsSendEventLazy(v11, v13);
  _Block_release(v13);

}

uint64_t type metadata accessor for PHOrientationMonitor_OBJC()
{
  return objc_opt_self(_TtC8FaceTime25PHOrientationMonitor_OBJC);
}

_QWORD *sub_10000A5D4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  uint64_t (**v11)(uint64_t);
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v2[2] = 0;
  v2[3] = 0;
  v2[4] = objc_msgSend(objc_allocWithZone((Class)BKSAccelerometer), "init");
  v2[5] = 0;
  v5 = v2[2];
  v6 = v2[3];
  v2[2] = a1;
  v2[3] = a2;
  sub_1000156C8(a1, a2);
  sub_10000A730(v5, v6);
  v7 = (void *)v2[4];
  v8 = swift_allocObject(&unk_10008ACC8, 24, 7);
  swift_weakInit(v8 + 16, v2);
  v9 = (objc_class *)type metadata accessor for AccelerometerDelegate();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = (uint64_t (**)(uint64_t))&v10[OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_onOrientationChange];
  *v11 = sub_10004B594;
  v11[1] = (uint64_t (*)(uint64_t))v8;
  *(_QWORD *)&v10[OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_accelerometer] = v7;
  v17.receiver = v10;
  v17.super_class = v9;
  v12 = v7;
  swift_retain_n(v8, 2);
  v13 = objc_msgSendSuper2(&v17, "init");
  v14 = v13;
  objc_msgSend(v12, "setDelegate:", v14, v17.receiver, v17.super_class);

  swift_release(v8);
  sub_10000A730(a1, a2);
  swift_release(v8);
  v15 = (void *)v2[5];
  v2[5] = v13;

  return v2;
}

uint64_t sub_10000A730(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void sub_10000B930(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];

  +[TUCallCapabilities initializeCachedValues](TUCallCapabilities, "initializeCachedValues");
  v2 = objc_alloc_init((Class)TUCallProviderManager);
  objc_msgSend(*(id *)(a1 + 32), "setCallProviderManager:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStore contactStore](CNContactStore, "contactStore"));
  objc_msgSend(*(id *)(a1 + 32), "setContactStore:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStore suggestedContactStore](CNContactStore, "suggestedContactStore"));
  objc_msgSend(*(id *)(a1 + 32), "setSuggestedContactStore:", v4);

  v5 = objc_alloc_init((Class)TUCallDirectoryMetadataCacheDataProvider);
  v14[0] = v5;
  v6 = objc_alloc_init((Class)TUMapsMetadataCacheDataProvider);
  v14[1] = v6;
  v7 = objc_alloc_init((Class)TUSuggestionsMetadataCacheDataProvider);
  v14[2] = v7;
  v8 = objc_alloc_init((Class)TUGeoLocationMetadataCacheDataProvider);
  v14[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));

  v10 = objc_msgSend(objc_alloc((Class)TUMetadataCache), "initWithDataProviders:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setMetadataCache:", v10);

  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "telephonyProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = objc_msgSend(v2, "providerWithIdentifier:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "setInitializationBlockQueued:", 0);

}

void sub_10000BB04(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int *v17;
  NSObject *v18;
  _QWORD handler[4];
  id v20;
  id v21;
  id location;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchContactFormatter"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchNumberFormatter"));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v5;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = v8;

  v11 = objc_alloc_init((Class)NSDictionary);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 96);
  *(_QWORD *)(v12 + 96) = v11;

  objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
  objc_msgSend(*(id *)(a1 + 32), "populateMessageCache");
  objc_msgSend(*(id *)(a1 + 32), "setUnreadCallCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unreadCallCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleCNContactStoreDidChangeNotification:", CNContactStoreDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleIDSServiceAvailabilityDidChangeNotification:", IDSServiceAvailabilityDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleNSCurrentLocaleDidChangeNotification:", NSCurrentLocaleDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleTUCallHistoryControllerRecentCallsDidChangeNotification:", TUCallHistoryControllerRecentCallsDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:", TUCallHistoryControllerUnreadCallCountDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleTUMetadataCacheDidFinishUpdatingNotification:", TUMetadataCacheDidFinishUpdatingNotification, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleUIApplicationSignificantTimeChangeNotification:", UIApplicationSignificantTimeChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleUIApplicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (qword_1000A3908 != -1)
    dispatch_once(&qword_1000A3908, &stru_10008A018);
  v15 = (const char *)qword_1000A3910;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = (int *)(v16 + 16);
  v18 = *(NSObject **)(v16 + 48);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002BDBC;
  handler[3] = &unk_100089E68;
  objc_copyWeak(&v21, &location);
  v20 = *(id *)(a1 + 32);
  notify_register_dispatch(v15, v17, v18, handler);
  objc_msgSend(*(id *)(a1 + 32), "setInitializationBlockQueued:", 0);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void sub_10000BDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C88C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  char *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *oslog;
  _QWORD v36[5];
  _QWORD v37[6];

  v1 = OBJC_IVAR___FTRecentsContainerViewController_recentsList;
  if (*(_QWORD *)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList))
  {
    if (qword_1000A1EC8 != -1)
      swift_once(&qword_1000A1EC8, sub_10000702C);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_1000138F4(v2, (uint64_t)qword_1000A2E00);
    oslog = Logger.logObject.getter(v3);
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Already showing RecentsListViewController", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }
LABEL_15:

    return;
  }
  v6 = v0;
  if (qword_1000A1EC8 != -1)
    swift_once(&qword_1000A1EC8, sub_10000702C);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_1000138F4(v7, (uint64_t)qword_1000A2E00);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Showing RecentsListViewController", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  oslog = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v12 = objc_opt_self(FaceTimeApplication);
  v13 = (void *)swift_dynamicCastObjCClassUnconditional(oslog, v12, 0, 0, 0);
  type metadata accessor for RecentsListItemViewHelper(0);
  static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.setter(objc_msgSend(v13, "shouldUseCompactHorizontalLayout"));
  v14 = objc_msgSend(v13, "recentsController");
  if (!v14)
  {
    __break(1u);
    goto LABEL_17;
  }
  v15 = v14;
  v16 = (objc_class *)type metadata accessor for RecentCallProvider();
  v17 = objc_allocWithZone(v16);
  v18 = sub_100008B70(v15);
  v37[3] = v16;
  v37[4] = sub_10000CC50(&qword_1000A2EF0, (uint64_t (*)(uint64_t))type metadata accessor for RecentCallProvider, (uint64_t)&unk_100067E58);
  v37[5] = sub_10000CC50(&qword_1000A2EF8, (uint64_t (*)(uint64_t))type metadata accessor for RecentCallProvider, (uint64_t)&unk_100067E00);
  v37[0] = v18;
  v19 = objc_msgSend(v13, "recentsController");
  if (!v19)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v20 = v19;
  v21 = type metadata accessor for RecentCallDetailControllerFactory();
  v22 = swift_allocObject(v21, 24, 7);
  *(_QWORD *)(v22 + 16) = v20;
  v36[3] = v21;
  v36[4] = sub_10000CC50((unint64_t *)&unk_1000A2F00, (uint64_t (*)(uint64_t))type metadata accessor for RecentCallDetailControllerFactory, (uint64_t)&unk_1000683C4);
  v36[0] = v22;
  v23 = objc_msgSend(v13, "recentsController");
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v23, "contactStore");

    v26 = objc_allocWithZone((Class)type metadata accessor for RecentsListViewController(0));
    v27 = (void *)RecentsListViewController.init(recentCallProvider:detailControllerFactory:contactStore:)(v37, v36, v25);
    v28 = *(void **)(v6 + v1);
    *(_QWORD *)(v6 + v1) = v27;
    v29 = v27;

    sub_100008264();
    v30 = *(void **)(v6 + v1);
    if (v30)
    {
      v31 = v6 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield;
      v32 = *(_QWORD *)(v6 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
      v33 = *(_QWORD *)(v31 + 8);
      v34 = v30;
      sub_1000156C8(v32, v33);
      dispatch thunk of RecentsListViewController.presentScreenTimeShield.setter(v32, v33);

    }
    goto LABEL_15;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_10000CC50(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for RecentCallProvider()
{
  return objc_opt_self(_TtC8FaceTime18RecentCallProvider);
}

id sub_10000CE64(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  }
  if (-[__CFString length](v3, "length") && -[__CFString length](v4, "length"))
    v6 = (void *)CFPreferencesCopyValue(v3, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  else
    v6 = 0;

  return v6;
}

id sub_10000CF14(void *a1)
{
  return sub_10000CE64(a1, 0);
}

void sub_10000E664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000E67C(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

id sub_10000E6C4()
{
  if (qword_1000A36F0 != -1)
    dispatch_once(&qword_1000A36F0, &stru_100089BF8);
  return (id)qword_1000A36E8;
}

void sub_10000EFDC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactsByHandleForRecentCall:keyDescriptors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v13, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

_QWORD *sub_10000F158()
{
  void **v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  _QWORD *v7;

  v1 = *v0;
  v2 = objc_msgSend(*(id *)((char *)*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "recentCalls");
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v3 = v2;
  v4 = sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  v6 = v1;
  v7 = sub_10000F210(v5, v6);
  swift_bridgeObjectRelease(v5);

  return v7;
}

_QWORD *sub_10000F210(unint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  Class isa;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;

  v3 = v2;
  v6 = sub_10001283C((uint64_t *)&unk_1000A2BB0);
  __chkstk_darwin(v6, v7);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = type metadata accessor for RecentsCallItem(0);
  v10 = *(_QWORD *)(v54 - 8);
  v12 = __chkstk_darwin(v54, v11);
  v49 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v14);
  v44 = (char *)&v44 - v15;
  v50 = a1;
  if (a1 >> 62)
    goto LABEL_24;
  v16 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v50);
  for (; v16; v16 = _CocoaArrayWrapper.endIndex.getter(v42))
  {
    v51 = v3;
    v45 = *(char **)&a2[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController];
    v17 = &_swiftEmptyArrayStorage;
    v47 = v10;
    v48 = v50 & 0xC000000000000001;
    v18 = 4;
    v46 = v16;
    while (1)
    {
      v53 = v17;
      v3 = v18 - 4;
      v19 = v48
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18 - 4, v50)
          : *(id *)(v50 + 8 * v18);
      v20 = v19;
      if (__OFADD__(v3, 1))
        break;
      v52 = v18 - 3;
      a2 = v45;
      v21 = objc_msgSend(v45, "itemForRecentCall:", v19);
      sub_10001283C(&qword_1000A24A0);
      isa = Array._bridgeToObjectiveC()().super.isa;
      v23 = objc_msgSend(a2, "contactByHandleForRecentCall:keyDescriptors:", v20, isa);

      if (v23)
      {
        a2 = (char *)&unk_1000A2BC0;
        v24 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
        v25 = sub_100013580(0, &qword_1000A2B88, CNContact_ptr);
        v26 = sub_100012940((unint64_t *)&qword_1000A3490, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
        v27 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v23, v24, v25, v26);

      }
      else
      {
        v27 = 0;
      }
      v28 = objc_msgSend(v20, "validRemoteParticipantHandles", v44);
      if (v28)
      {
        v29 = v28;
        a2 = (char *)&unk_1000A2BC0;
        v30 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
        v31 = sub_100012940((unint64_t *)&qword_1000A3490, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
        v32 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v29, v30, v31);

        swift_bridgeObjectRetain(v27);
        v33 = v20;
        v34 = v51;
        sub_10001390C(v32, v27, v33);
        v36 = v35;
        v51 = v34;
        swift_bridgeObjectRelease(v32);
        swift_bridgeObjectRelease_n(v27, 2);

      }
      else
      {
        swift_bridgeObjectRelease(v27);
        v36 = &_swiftEmptyArrayStorage;
      }
      v37 = v52;
      sub_100012194(v20, v21, (uint64_t)v36, (uint64_t)v9);

      swift_bridgeObjectRelease(v36);
      v10 = v47;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v9, 1, v54) == 1)
      {
        sub_10001287C((uint64_t)v9, (uint64_t *)&unk_1000A2BB0);
        v17 = v53;
      }
      else
      {
        a2 = *(char **)(v10 + 32);
        v38 = v44;
        v39 = v54;
        ((void (*)(char *, char *, uint64_t))a2)(v44, v9, v54);
        ((void (*)(char *, char *, uint64_t))a2)(v49, v38, v39);
        v17 = v53;
        if ((swift_isUniquelyReferenced_nonNull_native(v53) & 1) == 0)
          v17 = (_QWORD *)sub_1000135B8(0, v17[2] + 1, 1, (unint64_t)v17, &qword_1000A2BD0, (uint64_t (*)(_QWORD))&type metadata accessor for RecentsCallItem);
        v41 = v17[2];
        v40 = v17[3];
        if (v41 >= v40 >> 1)
          v17 = (_QWORD *)sub_1000135B8(v40 > 1, v41 + 1, 1, (unint64_t)v17, &qword_1000A2BD0, (uint64_t (*)(_QWORD))&type metadata accessor for RecentsCallItem);
        v17[2] = v41 + 1;
        ((void (*)(char *, char *, uint64_t))a2)((char *)v17+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v41, v49, v54);
      }
      ++v18;
      if (v37 == v46)
      {
        swift_bridgeObjectRelease(v50);
        return v17;
      }
    }
    __break(1u);
LABEL_24:
    if (v50 < 0)
      v42 = v50;
    else
      v42 = v50 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v50);
  }
  swift_bridgeObjectRelease(v50);
  return &_swiftEmptyArrayStorage;
}

void sub_1000106F4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uniqueId"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v2));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t sub_100012194@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;

  v114 = a4;
  v115 = a3;
  v6 = sub_10001283C(&qword_1000A2660);
  __chkstk_darwin(v6, v7);
  v113 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10001283C(&qword_1000A2668);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for RecentCallRecentItemMetadata(0);
  v111 = *(_QWORD *)(v13 - 8);
  v112 = v13;
  v15 = __chkstk_darwin(v13, v14);
  v110 = (char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v17);
  v109 = (char *)&v99 - v18;
  v19 = sub_10001283C(&qword_1000A2670);
  v21 = __chkstk_darwin(v19, v20);
  v23 = (char *)&v99 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v21, v24);
  v27 = (char *)&v99 - v26;
  v29 = __chkstk_darwin(v25, v28);
  v31 = (char *)&v99 - v30;
  __chkstk_darwin(v29, v32);
  v34 = (char *)&v99 - v33;
  v35 = sub_10001283C(&qword_1000A2678);
  v37 = __chkstk_darwin(v35, v36);
  v116 = (uint64_t)&v99 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __chkstk_darwin(v37, v39);
  v42 = (char *)&v99 - v41;
  __chkstk_darwin(v40, v43);
  v45 = (char *)&v99 - v44;
  v46 = objc_msgSend(a1, "uniqueId");
  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  v107 = v48;
  v108 = v47;

  v49 = objc_msgSend(a1, "date");
  if (v49)
  {
    v51 = v49;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v53 = type metadata accessor for Date(0, v52);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v42, 0, 1, v53);
  }
  else
  {
    v54 = type metadata accessor for Date(0, v50);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v42, 1, 1, v54);
  }
  sub_1000128FC((uint64_t)v42, (uint64_t)v45, &qword_1000A2678);
  v55 = objc_msgSend(a2, "localizedTitle");
  if (v55)
  {
    v56 = v55;
    v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
    v105 = v58;
    v106 = v57;

  }
  else
  {
    v105 = 0;
    v106 = 0;
  }
  v59 = objc_msgSend(a2, "localizedSubtitle");
  if (v59)
  {
    v60 = v59;
    v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
    v103 = v62;
    v104 = v61;

  }
  else
  {
    v103 = 0;
    v104 = 0;
  }
  v63 = objc_msgSend(a2, "localizedSenderIdentityTitle");
  if (v63)
  {
    v64 = v63;
    v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v63);
    v101 = v66;
    v102 = v65;

  }
  else
  {
    v101 = 0;
    v102 = 0;
  }
  v67 = objc_msgSend(a2, "localizedCount");
  if (v67)
  {
    v68 = v67;
    v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v67);
    v99 = v70;
    v100 = v69;

  }
  else
  {
    v99 = 0;
    v100 = 0;
  }
  v71 = objc_msgSend(a1, "conversationID", v99, v100);
  if (v71)
  {
    v72 = v71;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v71);

    v73 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 56))(v31, 0, 1, v73);
  }
  else
  {
    v74 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v31, 1, 1, v74);
  }
  sub_1000128FC((uint64_t)v31, (uint64_t)v34, &qword_1000A2670);
  v75 = objc_msgSend(a1, "validRemoteParticipantHandles");
  if (v75)
  {
    v76 = v75;
    v77 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v78 = sub_100012940((unint64_t *)&qword_1000A3490, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v79 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v76, v77, v78);

    v80 = sub_100012F48(v79);
    swift_bridgeObjectRelease(v79);
    v81 = sub_1000129A0((uint64_t)v80);
    swift_bridgeObjectRelease(v80);
  }
  else
  {
    v81 = 0;
  }
  sub_1000128B8((uint64_t)v45, v116, &qword_1000A2678);
  v82 = objc_msgSend(a1, "mediaType");
  v83 = objc_msgSend(a1, "countOfExcludedHandles");
  v84 = objc_msgSend(a1, "participantGroupUUID");
  if (v84)
  {
    v85 = v84;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v84);

    v86 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 56))(v27, 0, 1, v86);
  }
  else
  {
    v87 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v27, 1, 1, v87);
  }
  v88 = type metadata accessor for ConversationLink(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 56))(v12, 1, 1, v88);
  sub_1000128B8((uint64_t)v34, (uint64_t)v23, &qword_1000A2670);
  v89 = a1;
  v98 = v23;
  v90 = v109;
  RecentCallRecentItemMetadata.init(uniqueId:date:recentCall:mediaType:remoteParticipantHandles:countOfExcludedHandles:groupUUID:conversationLink:conversationID:)(v108, v107, v116, a1, v82, 0, v81, v83, v27, v12, v98);
  v92 = v110;
  v91 = v111;
  v93 = v112;
  (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v110, v90, v112);
  v94 = type metadata accessor for RecentsCallItemType(0);
  v95 = v113;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v94 - 8) + 56))(v113, 1, 1, v94);
  v96 = v115;
  swift_bridgeObjectRetain(v115);
  RecentsCallItem.init(recentsCallMetadata:contacts:title:subtitle:forcedSubtitle:senderIdentity:occurrenceCount:applicationIcon:type:)(v92, v96, v106, v105, v104, v103, 0, 0, v102, v101, v100, v99, 0, v95);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v90, v93);
  sub_10001287C((uint64_t)v34, &qword_1000A2670);
  return sub_10001287C((uint64_t)v45, &qword_1000A2678);
}

uint64_t sub_10001283C(uint64_t *a1)
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

uint64_t sub_10001287C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10001283C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000128B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10001283C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000128FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10001283C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012940(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100013580(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000129A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v2 = type metadata accessor for RecentsCallHandle(0);
  v3 = *(_QWORD *)(v2 - 8);
  v5 = __chkstk_darwin(v2, v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  v10 = (char *)&v17 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  v12 = sub_100012D14(&qword_1000A2680, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  result = Set.init(minimumCapacity:)(v11, v2, v12);
  v18 = result;
  if (v11)
  {
    v14 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v15 = *(_QWORD *)(v3 + 72);
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v16(v7, v14, v2);
      sub_100012AC0((uint64_t)v10, v7);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
      v14 += v15;
      --v11;
    }
    while (v11);
    return v18;
  }
  return result;
}

uint64_t sub_100012AC0(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD, _QWORD, _QWORD);
  uint64_t v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v3 = v2;
  v6 = type metadata accessor for RecentsCallHandle(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  v12 = *(_QWORD *)(*v2 + 40);
  v13 = sub_100012D14(&qword_1000A2680, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  swift_bridgeObjectRetain(v11);
  v35 = a2;
  v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v12, v6, v13);
  v15 = -1 << *(_BYTE *)(v11 + 32);
  v16 = v14 & ~v15;
  v17 = v11;
  v18 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
  {
    v31 = v3;
    v32 = a1;
    v33 = ~v15;
    v19 = v7;
    v20 = *(_QWORD *)(v7 + 72);
    v34 = v19;
    v21 = *(void (**)(_QWORD, _QWORD, _QWORD))(v19 + 16);
    while (1)
    {
      v22 = v17;
      v23 = v21;
      v21(v10, *(_QWORD *)(v17 + 48) + v20 * v16, v6);
      v24 = sub_100012D14(&qword_1000A2688, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
      v25 = dispatch thunk of static Equatable.== infix(_:_:)(v10, v35, v6, v24);
      v26 = *(void (**)(char *, uint64_t))(v34 + 8);
      v26(v10, v6);
      if ((v25 & 1) != 0)
        break;
      v16 = (v16 + 1) & v33;
      v17 = v22;
      v21 = v23;
      if (((*(_QWORD *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v22);
        v3 = v31;
        a1 = v32;
        v7 = v34;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease(v22);
    v26(v35, v6);
    v23(v32, *(_QWORD *)(*v31 + 48) + v20 * v16, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(v11);
    v21 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v28 = v35;
    v21(v10, v35, v6);
    v36 = *v3;
    *v3 = 0x8000000000000000;
    sub_100012D54((uint64_t)v10, v16, isUniquelyReferenced_nonNull_native);
    v29 = *v3;
    *v3 = v36;
    swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v28, v6);
    return 1;
  }
}

uint64_t sub_100012D14(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for RecentsCallHandle(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100012D54(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, unint64_t, uint64_t);
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = a1;
  v6 = type metadata accessor for RecentsCallHandle(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(*v3 + 16);
  v12 = *(_QWORD *)(*v3 + 24);
  v30 = v3;
  if (v12 > v11 && (a3 & 1) != 0)
    goto LABEL_12;
  v13 = v11 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100044BB0(v13);
  }
  else
  {
    if (v12 > v11)
    {
      sub_1000453B4();
      goto LABEL_12;
    }
    sub_100045780(v13);
  }
  v14 = *v3;
  v15 = *(_QWORD *)(*v3 + 40);
  v16 = sub_100012D14(&qword_1000A2680, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
  v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v6, v16);
  v18 = -1 << *(_BYTE *)(v14 + 32);
  a2 = v17 & ~v18;
  if (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v19 = ~v18;
    v20 = *(_QWORD *)(v7 + 72);
    v21 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v21(v10, *(_QWORD *)(v14 + 48) + v20 * a2, v6);
      v22 = sub_100012D14(&qword_1000A2688, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
      v23 = dispatch thunk of static Equatable.== infix(_:_:)(v10, v31, v6, v22);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      if ((v23 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v19;
    }
    while (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v24 = v31;
  v25 = *v30;
  *(_QWORD *)(*v30 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v25 + 48) + *(_QWORD *)(v7 + 72) * a2, v24, v6);
  v27 = *(_QWORD *)(v25 + 16);
  v28 = __OFADD__(v27, 1);
  v29 = v27 + 1;
  if (!v28)
  {
    *(_QWORD *)(v25 + 16) = v29;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

_QWORD *sub_100012F48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *result;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  void *v65;
  unsigned int v66;
  unsigned int v67;
  char *v68;
  uint64_t v69;
  int64_t v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[6];
  void *v85;

  v2 = type metadata accessor for RecentsCallHandleType(0);
  v77 = *(_QWORD *)(v2 - 8);
  v78 = v2;
  v4 = __chkstk_darwin(v2, v3);
  v76 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v6);
  v75 = (char *)&v61 - v7;
  v8 = sub_10001283C(&qword_1000A2698);
  __chkstk_darwin(v8, v9);
  v74 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for RecentsCallHandle(0);
  v80 = *(_QWORD *)(v11 - 8);
  v81 = v11;
  v13 = __chkstk_darwin(v11, v12);
  v64 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v15);
  v62 = (char *)&v61 - v16;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v17 = a1;
    else
      v17 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v18 = __CocoaSet.makeIterator()(v17);
    v19 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v20 = sub_100012940((unint64_t *)&qword_1000A3490, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    result = Set.Iterator.init(_cocoa:)(v84, v18, v19, v20);
    a1 = v84[0];
    v71 = v84[1];
    v22 = v84[2];
    v23 = v84[3];
    v24 = v84[4];
  }
  else
  {
    v25 = -1 << *(_BYTE *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 56);
    v71 = a1 + 56;
    v22 = ~v25;
    v27 = -v25;
    if (v27 < 64)
      v28 = ~(-1 << v27);
    else
      v28 = -1;
    v24 = v28 & v26;
    result = (_QWORD *)swift_bridgeObjectRetain(a1);
    v23 = 0;
  }
  v69 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v63 = v22;
  v70 = (unint64_t)(v22 + 64) >> 6;
  v67 = enum case for RecentsCallHandleType.emailAddress(_:);
  v73 = enum case for RecentsCallHandleType.phoneNumber(_:);
  v66 = enum case for RecentsCallHandleType.generic(_:);
  v65 = &_swiftEmptyArrayStorage;
  v72 = enum case for RecentsCallHandleType.unknown(_:);
  v68 = (char *)&type metadata for Swift.AnyObject + 8;
  v79 = a1;
  v29 = v77;
  v30 = v78;
  v31 = v75;
  while (a1 < 0)
  {
    v35 = __CocoaSet.Iterator.next()(result);
    if (!v35)
      goto LABEL_46;
    v36 = v35;
    v83 = v35;
    v37 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    swift_unknownObjectRetain(v36);
    swift_dynamicCast(&v85, &v83, v68, v37, 7);
    v38 = v85;
    swift_unknownObjectRelease(v36, v39);
    v34 = v23;
    v32 = v24;
    if (!v38)
      goto LABEL_46;
LABEL_34:
    v43 = objc_msgSend(v38, "type");
    v82 = v34;
    if (v43 == (id)3)
    {
      v44 = v67;
    }
    else
    {
      v44 = v73;
      if (v43 != (id)2)
      {
        v44 = v72;
        if (v43 == (id)1)
          v44 = v66;
      }
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 104))(v31, v44, v30);
    v45 = v76;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v76, v31, v30);
    v46 = objc_msgSend(v38, "value");
    v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
    v49 = v48;

    v50 = (uint64_t)v74;
    RecentsCallHandle.init(type:value:)(v45, v47, v49);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v30);
    v52 = v80;
    v51 = v81;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v80 + 56))(v50, 0, 1, v81);

    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v50, 1, v51) == 1)
    {
      result = (_QWORD *)sub_10001287C(v50, &qword_1000A2698);
      v23 = v82;
      v24 = v32;
      a1 = v79;
    }
    else
    {
      v53 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 32);
      v54 = v62;
      v55 = v50;
      v56 = v81;
      v53(v62, v55, v81);
      v53(v64, (uint64_t)v54, v56);
      v57 = (unint64_t)v65;
      if ((swift_isUniquelyReferenced_nonNull_native(v65) & 1) == 0)
        v57 = sub_1000138E0(0, *(_QWORD *)(v57 + 16) + 1, 1, v57);
      v59 = *(_QWORD *)(v57 + 16);
      v58 = *(_QWORD *)(v57 + 24);
      if (v59 >= v58 >> 1)
        v57 = sub_1000138E0(v58 > 1, v59 + 1, 1, v57);
      *(_QWORD *)(v57 + 16) = v59 + 1;
      v60 = (*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
      v65 = (void *)v57;
      result = (_QWORD *)((uint64_t (*)(unint64_t, char *, uint64_t))v53)(v57 + v60 + *(_QWORD *)(v80 + 72) * v59, v64, v81);
      a1 = v79;
      v24 = v32;
      v23 = v82;
    }
  }
  if (v24)
  {
    v32 = (v24 - 1) & v24;
    v33 = __clz(__rbit64(v24)) | (v23 << 6);
    v34 = v23;
LABEL_33:
    v38 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v33);
    if (!v38)
      goto LABEL_46;
    goto LABEL_34;
  }
  v40 = v23 + 1;
  if (!__OFADD__(v23, 1))
  {
    if (v40 >= v70)
      goto LABEL_46;
    v41 = *(_QWORD *)(v71 + 8 * v40);
    v34 = v23 + 1;
    if (!v41)
    {
      v34 = v23 + 2;
      if (v23 + 2 >= v70)
        goto LABEL_46;
      v41 = *(_QWORD *)(v71 + 8 * v34);
      if (!v41)
      {
        v34 = v23 + 3;
        if (v23 + 3 >= v70)
          goto LABEL_46;
        v41 = *(_QWORD *)(v71 + 8 * v34);
        if (!v41)
        {
          v34 = v23 + 4;
          if (v23 + 4 >= v70)
            goto LABEL_46;
          v41 = *(_QWORD *)(v71 + 8 * v34);
          if (!v41)
          {
            v34 = v23 + 5;
            if (v23 + 5 >= v70)
              goto LABEL_46;
            v41 = *(_QWORD *)(v71 + 8 * v34);
            if (!v41)
            {
              v42 = v23 + 6;
              while (v70 != v42)
              {
                v41 = *(_QWORD *)(v71 + 8 * v42++);
                if (v41)
                {
                  v34 = v42 - 1;
                  a1 = v79;
                  goto LABEL_32;
                }
              }
LABEL_46:
              sub_100045D18(v79);
              return v65;
            }
          }
        }
      }
    }
LABEL_32:
    v32 = (v41 - 1) & v41;
    v33 = __clz(__rbit64(v41)) + (v34 << 6);
    goto LABEL_33;
  }
  __break(1u);
  return result;
}

uint64_t sub_100013580(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000135B8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_10001283C(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
    goto LABEL_29;
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(_QWORD *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }
    else if (v18 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000137C8(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_1000137C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a5(0) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1000138E0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000135B8(a1, a2, a3, a4, &qword_1000A2BD8, (uint64_t (*)(_QWORD))&type metadata accessor for RecentsCallHandle);
}

uint64_t sub_1000138F4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_10001390C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  id v38;
  id v39;
  id v40;
  NSString v41;
  char **v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[5];
  unint64_t v61;

  v4 = a1;
  v61 = (unint64_t)&_swiftEmptyArrayStorage;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v6 = __CocoaSet.makeIterator()(v5);
    v7 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v8 = sub_100012940((unint64_t *)&qword_1000A3490, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v9 = Set.Iterator.init(_cocoa:)(v60, v6, v7, v8);
    v4 = v60[0];
    v54 = v60[1];
    v10 = v60[2];
    v11 = v60[3];
    v12 = v60[4];
  }
  else
  {
    v13 = -1 << *(_BYTE *)(a1 + 32);
    v54 = a1 + 56;
    v14 = ~v13;
    v15 = -v13;
    if (v15 < 64)
      v16 = ~(-1 << v15);
    else
      v16 = -1;
    v12 = v16 & *(_QWORD *)(a1 + 56);
    v9 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v10 = v14;
    v11 = 0;
  }
  v53 = (unint64_t)(v10 + 64) >> 6;
  v17 = a2 & 0xC000000000000001;
  v18 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0)
    v18 = a2;
  v52 = v18;
  v19 = &selRef_showsCallsFromService_;
  if ((v4 & 0x8000000000000000) == 0)
    goto LABEL_18;
LABEL_15:
  v20 = __CocoaSet.Iterator.next()(v9);
  if (!v20)
    goto LABEL_55;
  v21 = v20;
  v58 = v20;
  v22 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
  swift_unknownObjectRetain(v21);
  swift_dynamicCast(&v59, &v58, (char *)&type metadata for Swift.AnyObject + 8, v22, 7);
  v23 = v59;
  swift_unknownObjectRelease(v21, v24);
  v25 = v11;
  v26 = v12;
  if (!v23)
    goto LABEL_55;
  while (1)
  {
    if (a2)
    {
      if (v17)
      {
        v31 = __CocoaDictionary.lookup(_:)(v23, v52);
        if (!v31)
          goto LABEL_46;
        v32 = v31;
        v58 = v31;
        v33 = sub_100013580(0, &qword_1000A2B88, CNContact_ptr);
        swift_unknownObjectRetain(v32);
        swift_dynamicCast(&v59, &v58, (char *)&type metadata for Swift.AnyObject + 8, v33, 7);
        v34 = v59;
        swift_unknownObjectRelease(v32, v35);

        if (v34)
          goto LABEL_45;
      }
      else if (*(_QWORD *)(a2 + 16))
      {
        v36 = sub_10004A5E8((uint64_t)v23);
        if ((v37 & 1) == 0)
        {
LABEL_46:

          goto LABEL_47;
        }
        v34 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v36);

        if (v34)
        {
LABEL_45:
          v57 = v26;
          goto LABEL_51;
        }
      }
    }
LABEL_47:
    v38 = objc_msgSend(v23, v19[133]);
    if (!v38)
    {

      v11 = v25;
      v12 = v26;
      if (v4 < 0)
        goto LABEL_15;
      goto LABEL_18;
    }
    v39 = v38;
    v57 = v26;
    v40 = objc_msgSend(a3, "isoCountryCode");
    v41 = v40;
    if (v40)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
      v56 = v25;
      v42 = v19;
      v43 = v4;
      v44 = a2;
      v45 = v17;
      v47 = v46;

      v41 = String._bridgeToObjectiveC()();
      v48 = v47;
      v17 = v45;
      a2 = v44;
      v4 = v43;
      v19 = v42;
      v25 = v56;
      swift_bridgeObjectRelease(v48);
    }
    v34 = objc_msgSend((id)objc_opt_self(CNMutableContact), "contactForHandle:isoCountryCode:metadataCache:", v39, v41, 0);

    v23 = v39;
LABEL_51:

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v50 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v49 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v50 >= v49 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v49 > 1, v50 + 1, 1);
    v51 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v50, v34);
    v9 = (_QWORD *)specialized Array._endMutation()(v51);
    v11 = v25;
    v12 = v57;
    if (v4 < 0)
      goto LABEL_15;
LABEL_18:
    if (!v12)
      break;
    v26 = (v12 - 1) & v12;
    v27 = __clz(__rbit64(v12)) | (v11 << 6);
    v25 = v11;
LABEL_36:
    v23 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v27);
    if (!v23)
      goto LABEL_55;
  }
  v28 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    return;
  }
  if (v28 >= v53)
    goto LABEL_55;
  v29 = *(_QWORD *)(v54 + 8 * v28);
  v25 = v11 + 1;
  if (v29)
    goto LABEL_35;
  v25 = v11 + 2;
  if (v11 + 2 >= v53)
    goto LABEL_55;
  v29 = *(_QWORD *)(v54 + 8 * v25);
  if (v29)
    goto LABEL_35;
  v25 = v11 + 3;
  if (v11 + 3 >= v53)
    goto LABEL_55;
  v29 = *(_QWORD *)(v54 + 8 * v25);
  if (v29)
    goto LABEL_35;
  v25 = v11 + 4;
  if (v11 + 4 >= v53)
    goto LABEL_55;
  v29 = *(_QWORD *)(v54 + 8 * v25);
  if (v29)
    goto LABEL_35;
  v25 = v11 + 5;
  if (v11 + 5 >= v53)
    goto LABEL_55;
  v29 = *(_QWORD *)(v54 + 8 * v25);
  if (v29)
  {
LABEL_35:
    v26 = (v29 - 1) & v29;
    v27 = __clz(__rbit64(v29)) + (v25 << 6);
    goto LABEL_36;
  }
  v30 = v11 + 6;
  while (v53 != v30)
  {
    v29 = *(_QWORD *)(v54 + 8 * v30++);
    if (v29)
    {
      v25 = v30 - 1;
      goto LABEL_35;
    }
  }
LABEL_55:
  sub_100045D18(v4);
}

uint64_t sub_100013E00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_100013F0C(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_100013ED0((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_100013ED0((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000469AC(v13);
  return v8;
}

uint64_t sub_100013ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100013F0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000155DC(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

void sub_100014308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000143F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100014AC4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_6;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 != 1)
  {
    if (v4 >= 2)
    {
      v9 = TUBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@_OTHERS"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "numberFormatter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromNumber:", v13));
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v3, v14));

      goto LABEL_7;
    }
LABEL_6:
    v8 = v3;
    goto LABEL_7;
  }
  v5 = TUBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@_AND_ONE_OTHER"), &stru_10008B240, CFSTR("TelephonyUtilities")));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3));

LABEL_7:
  return v8;
}

id sub_100015000(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "logRecentsScrollingEvent:", *(_QWORD *)(a1 + 40));
}

id sub_10001500C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls) = 1;
  return objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "continuousScrollingReachedIndexPath:", a1);
}

id sub_100015144(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setContentViewNormalPosition");
}

BOOL sub_1000151B4(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

uint64_t sub_1000151C4()
{
  _QWORD *v0;

  return *(unsigned __int8 *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls);
}

uint64_t type metadata accessor for PHCFNotifyObserver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006668(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PHCFNotifyObserver);
}

uint64_t sub_1000151F0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000151F8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100015200(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100015208(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100015210(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100015218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015228(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015238(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015248(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015258(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

_QWORD *sub_100015268(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001528C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1000152D0(id a1)
{
  uint64_t *v1;

  v1 = (uint64_t *)CUTWeakLinkSymbol("CXCallDirectoryManagerIdentificationEntriesChangedNotification", CFSTR("CallKit"));
  if (v1)
    qword_1000A3910 = *v1;
}

void sub_100015304(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.calls.mobilephone", "Default");
  v2 = (void *)qword_1000A36E8;
  qword_1000A36E8 = (uint64_t)v1;

}

id sub_100015334(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStartedLoadingOlderCalls:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
}

id sub_100015360(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didChangeCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_100015370(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
}

void sub_100015378(id a1)
{
  double v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", objc_msgSend(UIApp, "backdropStyle")));
  objc_msgSend(v2, "blurRadius");
  byte_1000A3978 = v1 > 0.0;

}

id sub_1000153DC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fadeInAnimated:", *(unsigned __int8 *)(a1 + 56));
  return _objc_msgSend(*(id *)(a1 + 40), "updateVideoViewControllerWithOrientationMonitor:", *(_QWORD *)(a1 + 48));
}

id sub_100015408(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void sub_100015414(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v1, "markRecentCallsAsRead");

}

void sub_100015444(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000A38E8;
  qword_1000A38E8 = (uint64_t)v1;

}

_QWORD *sub_100015468(uint64_t a1, unint64_t a2)
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
      v5 = sub_100006694(v4, 0);
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

uint64_t sub_1000155DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100015468(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100051B5C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100051B5C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void sub_100015670(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
  sub_100015670(a1, &qword_1000A2038, (uint64_t)&unk_10008A5E0);
}

uint64_t sub_1000156C8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

unint64_t sub_1000156D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A26F0;
  if (!qword_1000A26F0)
  {
    v1 = sub_10001528C(&qword_1000A26E8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_1000A26F0);
  }
  return result;
}

unint64_t sub_100015724()
{
  unint64_t result;

  result = qword_1000A2BF0;
  if (!qword_1000A2BF0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000A2BF0);
  }
  return result;
}

unint64_t sub_100015768()
{
  _QWORD *v0;
  unint64_t v1;

  v0 = sub_1000091CC();
  v1 = sub_100005CD4();
  swift_release(v0);
  return v1;
}

uint64_t sub_1000157A0()
{
  uint64_t v0;

  v0 = sub_10001283C(&qword_1000A25C8);
  swift_initStaticObject(v0, &unk_1000A1F28);
  return sub_100007478() & 1;
}

uint64_t sub_1000157DC()
{
  uint64_t v0;

  v0 = sub_10001283C(&qword_1000A25D0);
  swift_initStaticObject(v0, &unk_1000A1F80);
  return sub_1000071F8();
}

uint64_t type metadata accessor for OrientationMonitorAccelerometer()
{
  return objc_opt_self(_TtC8FaceTime31OrientationMonitorAccelerometer);
}

uint64_t type metadata accessor for SpringBoardOrientationObserver(uint64_t a1)
{
  uint64_t result;

  result = qword_1000A32A8;
  if (!qword_1000A32A8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SpringBoardOrientationObserver);
  return result;
}

uint64_t type metadata accessor for AccelerometerDelegate()
{
  return objc_opt_self(_TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate);
}

void sub_100015938()
{
  _QWORD *v0;

  *(_BYTE *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_startedLoadingOlderCalls) = 0;
}

uint64_t variable initialization expression of ClarityUISceneDelegate.window()
{
  return 0;
}

id sub_100015958()
{
  _QWORD *v0;

  return objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "markRecentCallsAsRead");
}

uint64_t type metadata accessor for OrientationMonitor(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for OrientationMonitor);
}

uint64_t sub_100015980(uint64_t a1, uint64_t a2, char a3)
{
  swift_retain(a1);
  sub_1000159B0(a3);
  return swift_release(a1);
}

void sub_1000159B0(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  sub_100008F18();
}

uint64_t sub_1000159B8()
{
  return sub_1000159D8();
}

uint64_t sub_1000159D8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

void sub_1000159E0(char a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Class isa;
  uint64_t v17;
  uint64_t v18;

  if (v1[40] != (a1 & 1))
  {
    v2 = v1;
    v3 = swift_retain_n(v1, 2);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = swift_slowAlloc(18, -1);
      v7 = swift_slowAlloc(32, -1);
      v18 = v7;
      *(_DWORD *)v6 = 67109378;
      LODWORD(v17) = v2[40];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, (char *)&v17 + 4, v6 + 4, v6 + 8);
      *(_WORD *)(v6 + 8) = 2080;
      v8 = *(_QWORD *)&v2[*(_QWORD *)(*(_QWORD *)v2 + 168)];
      swift_release(v2);
      v9 = v8 - 1;
      v10 = 0xE800000000000000;
      v11 = 0x7469617274726F70;
      switch(v9)
      {
        case 0:
          break;
        case 1:
          v10 = 0x800000010006A7A0;
          v11 = 0xD000000000000012;
          break;
        case 2:
          v10 = 0xED00007466654C65;
          goto LABEL_9;
        case 3:
          v10 = 0xEE00746867695265;
LABEL_9:
          v11 = 0x70616373646E616CLL;
          break;
        case 4:
          v10 = 0xE600000000000000;
          v11 = 0x705565636166;
          break;
        case 5:
          v11 = 0x6E776F4465636166;
          break;
        default:
          v10 = 0xE700000000000000;
          v11 = 0x6E776F6E6B6E75;
          break;
      }
      v17 = sub_100013E00(v11, v10, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v6 + 10, v6 + 18);
      swift_release(v2);
      swift_bridgeObjectRelease(v10);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "set orientation locked: %{BOOL}d to orientation: %s", (uint8_t *)v6, 0x12u);
      swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
    }
    else
    {
      swift_release_n(v2, 2);
    }

    if ((v2[40] & 1) == 0)
    {
      v12 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
      if (qword_1000A1F00 != -1)
        swift_once(&qword_1000A1F00, sub_100052020);
      v13 = qword_1000A4A68;
      v14 = sub_100043AD0();
      v15 = sub_10005216C(v14);
      swift_bridgeObjectRelease(v14);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v15);
      objc_msgSend(v12, "postNotificationName:object:userInfo:", v13, 0, isa);

    }
  }
}

uint64_t sub_100015D08(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t type metadata accessor for MPAnalyticsLogger()
{
  return objc_opt_self(MPAnalyticsLogger);
}

uint64_t sub_100015D6C()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100015D74(uint64_t a1)
{
  return sub_1000086E8(a1, qword_1000A49F0, 0xD000000000000018, 0x800000010006BCF0, 0x73746E65636552);
}

uint64_t sub_100015DA8(uint64_t a1)
{
  return sub_1000086E8(a1, qword_1000A49D8, 0xD000000000000018, 0x800000010006BCF0, 0x746C7561666544);
}

uint64_t sub_100015DDC(uint64_t a1)
{
  return sub_1000086E8(a1, qword_1000A4A08, 0xD00000000000001BLL, 0x800000010006BCD0, 0x746C7561666544);
}

void sub_100016734(id a1)
{
  PHDevice *v1;
  void *v2;

  v1 = objc_alloc_init(PHDevice);
  v2 = (void *)qword_1000A3630;
  qword_1000A3630 = (uint64_t)v1;

}

id sub_100016830(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id result;

  v2 = objc_alloc((Class)RadiosPreferences);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dispatchQueue"));
  v4 = objc_msgSend(v2, "initWithQueue:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 32), "fetchCellularRadioEnabled");
  result = objc_msgSend(*(id *)(a1 + 32), "fetchRingerSwitchEnabled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = (_BYTE)result;
  return result;
}

void sub_1000169C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000169E0(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void sub_100016A70(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016AE4;
    block[3] = &unk_1000898B8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100016AE4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHDeviceCellularRadioEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void sub_100016BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016BEC(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

void sub_100016C7C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(_BYTE *)(v1 + 9) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016CF0;
    block[3] = &unk_1000898B8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100016CF0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHDeviceRingerSwitchDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void sub_100016E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016E2C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100016E3C(uint64_t a1)
{

}

void sub_100016E44(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void sub_100016F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100016F9C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRingerSwitchEnabled:", objc_msgSend(WeakRetained, "fetchRingerSwitchEnabled"));

}

void sub_100018388(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "badge");
  v4 = v3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001841C;
  block[3] = &unk_100089958;
  v6 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10001841C(_QWORD *a1)
{
  void *v1;
  __CFString *v2;
  id v3;

  v1 = (void *)a1[4];
  v2 = sub_1000344D0(a1[5], a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v1, "setBadgeValue:", v3);

}

id sub_100019008()
{
  if (qword_1000A3658 != -1)
    dispatch_once(&qword_1000A3658, &stru_1000899A0);
  return (id)qword_1000A3650;
}

void sub_100019048(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  qword_1000A3650 = CUTWeakLinkClass(CFSTR("RTTUIConversationViewController"), CFSTR("RTTUI"));
  if (!qword_1000A3650)
  {
    v1 = sub_10000E6C4();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTUIConversationViewController; RTTUI may have failed to link.",
        v3,
        2u);
    }

  }
}

id sub_1000190CC()
{
  if (qword_1000A3668 != -1)
    dispatch_once(&qword_1000A3668, &stru_1000899C0);
  return (id)qword_1000A3660;
}

void sub_10001910C(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  qword_1000A3660 = CUTWeakLinkClass(CFSTR("RTTUIUtilities"), CFSTR("RTTUI"));
  if (!qword_1000A3660)
  {
    v1 = sub_10000E6C4();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTUIUtilities; RTTUI.framework may have failed to link.",
        v3,
        2u);
    }

  }
}

UIFont *__cdecl sub_100019DD8(UIFont *self, SEL a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  void *v12;
  UIFontDescriptorAttributeName v13;
  void *v14;

  v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_10008DB70;
  v11[1] = &off_10008DB88;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
  return (UIFont *)v8;
}

void sub_10001AFA0(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v1 = sub_10000E6C4();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "prewarming InCallService...", buf, 2u);
  }

  v3 = objc_alloc_init((Class)CUTWeakLinkClass(CFSTR("BKSSystemService"), CFSTR("BackBoardServices")));
  v4 = TUBundleIdentifierInCallServiceApplication;
  if (objc_msgSend(v3, "pidForApplication:", TUBundleIdentifierInCallServiceApplication) == -1)
  {
    objc_msgSend(v3, "openApplication:options:withResult:", v4, &__NSDictionary0__struct, &stru_100089A38);
  }
  else
  {
    v5 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InCallService is already running...", v7, 2u);
    }

  }
}

void sub_10001B0A4(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_10000E6C4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100054CE0(v2, v4);

  }
}

id sub_10001B8F0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "dialVoicemail");
}

void sub_10001BB74(id a1)
{
  void *v1;
  unint64_t v2;
  double v3;
  void *v4;
  double v5;
  double v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v2 = (unint64_t)objc_msgSend(v1, "userInterfaceIdiom");

  if ((v2 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v3 = 1024.0;
  else
    v3 = 480.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v6 = v5;

  byte_1000A367C = v6 > v3;
}

void sub_10001BD20(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  qword_1000A3688 = (uint64_t)objc_msgSend(v1, "_graphicsQuality");

}

void sub_10001CC18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001D664(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
  objc_msgSend(v2, "reloadData");

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
  objc_msgSend(v3, "setNeedsLayout");

}

void sub_10001DCE4(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 28, UIFontTextStyleCaption1, 1, 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.800000012, 1.0));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v1));
  v3 = (void *)qword_1000A3698;
  qword_1000A3698 = v2;

}

void sub_10001DDB8(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 28, UIFontTextStyleCaption1, 1, 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.800000012, 1.0));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v1));
  v3 = (void *)qword_1000A36A0;
  qword_1000A36A0 = v2;

}

void sub_10001DE8C(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 36, UIFontTextStyleCaption1, 1, 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.800000012, 1.0));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v1));
  v3 = (void *)qword_1000A36A8;
  qword_1000A36A8 = v2;

}

void sub_10001DF60(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 35, UIFontTextStyleCaption1, 1, 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.800000012, 1.0));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v1));
  v3 = (void *)qword_1000A36B0;
  qword_1000A36B0 = v2;

}

void sub_10001F6FC(uint64_t a1)
{
  id v1;
  void *v2;
  objc_super v3;

  if (!qword_1000A36D8)
  {
    v3.receiver = *(id *)(a1 + 32);
    v3.super_class = (Class)&OBJC_METACLASS___FTMacRuntimeConfig;
    v1 = objc_msgSend(objc_msgSendSuper2(&v3, "allocWithZone:", 0), "init");
    v2 = (void *)qword_1000A36D8;
    qword_1000A36D8 = (uint64_t)v1;

  }
}

void sub_10001FB80(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    IOHIDEventSystemClientUnscheduleFromDispatchQueue(v2, *(_QWORD *)(a1 + 32));
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

id sub_10001FC28(uint64_t a1)
{
  id result;
  id v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[2];

  result = objc_msgSend(*(id *)(a1 + 32), "HIDEventSystemClient");
  if (!result)
  {
    result = (id)IOHIDEventSystemClientCreate(kCFAllocatorDefault);
    if (result)
    {
      v3 = result;
      v5[0] = CFSTR("DeviceUsagePage");
      v5[1] = CFSTR("DeviceUsage");
      v6[0] = &off_10008DBB8;
      v6[1] = &off_10008DBD0;
      IOHIDEventSystemClientSetMatching(result, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
      IOHIDEventSystemClientRegisterEventBlock(v3, &stru_100089B80, *(_QWORD *)(a1 + 32), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dispatchQueue"));
      IOHIDEventSystemClientScheduleWithDispatchQueue(v3, v4);

      return objc_msgSend(*(id *)(a1 + 32), "setHIDEventSystemClient:", v3);
    }
  }
  return result;
}

void sub_10001FD34(id a1, void *a2, void *a3, void *a4, __IOHIDEvent *a5)
{
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;

  if (a2)
  {
    v7 = objc_opt_class(PHHIDEventMonitor);
    if ((objc_opt_isKindOfClass(a2, v7) & 1) != 0)
    {
      v10 = a2;
      v8 = IOHIDEventGetType(a5) == 3;
      v9 = v10;
      if (v8)
      {
        objc_msgSend(v10, "handleKeyboardEvent:", a5);
        v9 = v10;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

}

id sub_10001FE24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHIDEventSystemClient:", 0);
}

void sub_100021418(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nameAndLabelLabel"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_10002144C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nameAndLabelLabel"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100021480(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nameAndLabelLabel"));
  objc_msgSend(v2, "setAttributedText:", v1);

}

id sub_100021574(void *a1)
{
  id v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = objc_msgSend(v1, "characterAtIndex:", 0);
    if (v2 == 59 || v2 == 44)
    {
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringFromIndex:", 1));

      v1 = (id)v3;
    }
  }
  v4 = TUNetworkCountryCode();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5)
  {
    v6 = TUNetworkCountryCode();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = UIFormattedPhoneNumberFromStringWithCountry(v1, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  else
  {
    v10 = UIFormattedPhoneNumberFromString(v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v9;
}

uint64_t sub_100021630(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;

  v3 = a2;
  v4 = objc_msgSend((id)CUTWeakLinkClass(CFSTR("FTNetworkSupport"), CFSTR("FTServices")), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc_init((Class)RadiosPreferences);
  v7 = objc_msgSend(v6, "airplaneMode");

  if (!v7)
  {
    v11 = 1;
    goto LABEL_21;
  }
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCapabilities senderIdentityCapabilitiesWithUUID:](TUCallCapabilities, "senderIdentityCapabilitiesWithUUID:", v3));
    v9 = v8;
    if (a1 == 1)
      v10 = objc_msgSend(v8, "canAttemptEmergencyCallsWithoutCellularConnection");
    else
      v10 = objc_msgSend(v8, "canAttemptTelephonyCallsWithoutCellularConnection");
    v12 = v10;

    if ((v12 & 1) != 0)
    {
LABEL_11:
      v11 = 1;
      if ((objc_msgSend(v5, "networkReachable") & 1) != 0)
        goto LABEL_21;
      goto LABEL_12;
    }
  }
  else if (a1 == 1)
  {
    if ((+[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnection](TUCallCapabilities, "canAttemptEmergencyCallsWithoutCellularConnection") & 1) != 0)goto LABEL_11;
  }
  else if (+[TUCallCapabilities canAttemptTelephonyCallsWithoutCellularConnection](TUCallCapabilities, "canAttemptTelephonyCallsWithoutCellularConnection"))
  {
    goto LABEL_11;
  }
  LODWORD(v11) = 0;
LABEL_12:
  v13 = sub_10000E6C4();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v11)
      v15 = CFSTR("NO");
    else
      v15 = CFSTR("YES");
    if (objc_msgSend(v5, "networkReachable"))
      v16 = CFSTR("NO");
    else
      v16 = CFSTR("YES");
    v18 = 138412546;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Aborting telephony call, the device is in airplane mode and, cannot make telephony calls while in airplane mode (%@) or is not connected to an active Wi-Fi network (%@).", (uint8_t *)&v18, 0x16u);
  }

  v11 = 0;
LABEL_21:

  return v11;
}

id sub_1000217E8()
{
  id v0;
  id v1;

  v0 = objc_alloc_init((Class)RadiosPreferences);
  v1 = objc_msgSend(v0, "airplaneMode");

  return v1;
}

void sub_100021C94(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021D28;
  v4[3] = &unk_100089C18;
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", TUCallCapabilitiesThumperCallingChangedNotification, 0, 0, v4);

}

id sub_100021D28(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_removeHasShownPromptDefaultIfNecessary");
}

void sub_100021D30(id a1, IMUserNotification *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = -[IMUserNotification response](a2, "response");
  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User tapped Not Now on the Thumper Available Alert in FaceTime", v6, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User tapped Turn On on the Thumper Available Alert in FaceTime", buf, 2u);
    }

    +[TUCallCapabilities requestPinFromPrimaryDevice](TUCallCapabilities, "requestPinFromPrimaryDevice");
  }
}

void sub_100021E58(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000A3700;
  qword_1000A3700 = (uint64_t)v1;

}

void sub_100023284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  NSAttributedStringKey v10;
  void *v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_accessibilityHigherContrastTintColorForColor:", a2));
  v8 = *(void **)(a1 + 40);
  v10 = NSForegroundColorAttributeName;
  v11 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  objc_msgSend(v8, "setAttributes:range:", v9, a3, a4);

}

void sub_100023EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023EE8(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
  v2 = (void *)qword_1000A3720;
  qword_1000A3720 = v1;

  v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
  v4 = (void *)qword_1000A3728;
  qword_1000A3728 = v3;

}

uint64_t sub_100023F34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100023F44(uint64_t a1)
{

}

void sub_100023F4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;

  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v10 = sub_10000E6C4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100054E44();

  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100024054(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000A3738;
  qword_1000A3738 = (uint64_t)v1;

}

void sub_1000241B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024210(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", &_dispatch_main_q);
  v2 = (void *)qword_1000A3748;
  qword_1000A3748 = (uint64_t)v1;

}

void sub_100024870(id a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)TUCallProviderManager);
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "telephonyProvider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "providerWithIdentifier:", v2));
  v4 = (void *)qword_1000A3760;
  qword_1000A3760 = v3;

}

void sub_100024924(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)FBSOrientationObserver);
  v2 = (void *)qword_1000A3768;
  qword_1000A3768 = (uint64_t)v1;

}

void sub_100024E44(uint64_t a1)
{
  unsigned int v2;
  int v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isSpringBoardLocked");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSpringBoardLocked:", v3 != 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("PHLockScreenStatusChangedNotification"), *(_QWORD *)(a1 + 32));

  }
}

void *sub_100024EC4(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000A3780)
  {
    v5 = off_100089D70;
    v6 = 0;
    qword_1000A3780 = _sl_dlopen(&v5, &v4);
  }
  v2 = (void *)qword_1000A3780;
  if (!qword_1000A3780)
    sub_100055098(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "SBSGetScreenLockStatus");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_1000A3778 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100024F9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100028540(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "registrationDelegate"));
  objc_msgSend(v2, "registrationViewSignInPhoneAccount:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "setSigningIn:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setActivationFailed:", 0);
  return _objc_msgSend(*(id *)(a1 + 32), "_setContinueButtonTouched:", 0);
}

void sub_100028598(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000551C8((uint64_t)v4, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100029E38(uint64_t a1)
{
  id v1;
  _BOOL4 v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id *from;
  void *v19;
  _QWORD block[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  id to;
  _BYTE v30[128];

  from = (id *)(a1 + 32);
  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  v2 = v1 == 0;

  if (v2)
  {
    v17 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because MPRecentsContactHeaderViewController was deallocated before starting", buf, 2u);
    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v3 = objc_loadWeakRetained(&to);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recentCall"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callOccurrences"));

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v25;
      v9 = kCHCallOccurrenceUniqueIdKey;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10), "objectForKeyedSubscript:", v9));
          v12 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            v13 = v11;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "sharedUtilityProvider"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "conversationForCallUID:", v13));

            if (v15)
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v13);

          }
          v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002A118;
    block[3] = &unk_100089DB8;
    objc_copyWeak(&v23, from);
    v22 = v19;
    v16 = v19;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v23);
  }

  objc_destroyWeak(&to);
}

void sub_10002A0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A118(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setRttConversations:", *(_QWORD *)(a1 + 32));
    v4 = sub_10000E6C4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully finished loadRTTConversations", buf, 2u);
    }

    v6 = sub_10000E6C4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reloading conversation list", v11, 2u);
    }

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "detailsView"));
    -[NSObject reloadCallOccurences](v8, "reloadCallOccurences");
  }
  else
  {
    v9 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because MPRecentsContactHeaderViewController was deallocated when trying to write rttConversations", v10, 2u);
    }
  }

}

void sub_10002A4CC(id a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  if (v3 >= v5)
    v6 = v3;
  else
    v6 = v5;
  v7 = (int)v6;
  v8 = MGGetProductType();
  if (v7 == 1136)
    goto LABEL_5;
  if (v8 <= 2795618602)
  {
    if (v8 > 851437780)
    {
      if (v8 <= 2688879998)
      {
        if (v8 != 851437781)
        {
          if (v8 != 1169082144)
            goto LABEL_23;
          goto LABEL_42;
        }
LABEL_32:
        v11 = v7 == 2556;
        goto LABEL_45;
      }
      if (v8 != 2688879999)
      {
        if (v8 != 2793418701)
          goto LABEL_23;
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v8 == 133314240)
      goto LABEL_32;
    if (v8 != 330877086)
    {
      v10 = 574536383;
LABEL_22:
      if (v8 != v10)
        goto LABEL_23;
LABEL_33:
      v12 = v7 == 2796;
      goto LABEL_34;
    }
    v12 = v7 == 2868;
LABEL_34:
    v9 = 14;
    if (!v12)
      v9 = 15;
    goto LABEL_47;
  }
  if (v8 <= 3001488777)
  {
    if (v8 == 2795618603)
    {
      v11 = v7 == 2622;
LABEL_45:
      v9 = 9;
      if (v11)
        v9 = 12;
      goto LABEL_47;
    }
    if (v8 == 2940697645)
      goto LABEL_32;
    v10 = 2941181571;
    goto LABEL_22;
  }
  if (v8 <= 3885279869)
  {
    if (v8 == 3001488778)
    {
LABEL_42:
      v11 = v7 == 2532;
      goto LABEL_45;
    }
    v10 = 3825599860;
    goto LABEL_22;
  }
  if (v8 == 4201643249)
  {
    v12 = v7 == 2778;
    goto LABEL_34;
  }
  if (v8 == 3885279870)
  {
    v9 = 9;
    if (v7 == 2436)
      v9 = 10;
    goto LABEL_47;
  }
LABEL_23:
  if (v7 > 2271)
  {
    if (v7 > 2531)
    {
      if (v7 > 2731)
      {
        if (v7 == 2732 || v7 == 2752)
        {
          v9 = 7;
          goto LABEL_47;
        }
        if (v7 == 2778)
        {
          v9 = 14;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v7 == 2532)
      {
        v9 = 12;
        goto LABEL_47;
      }
      if (v7 != 2688)
        goto LABEL_48;
LABEL_74:
      v9 = 5;
      goto LABEL_47;
    }
    if (v7 > 2387)
    {
      if (v7 != 2388)
      {
        if (v7 != 2436)
          goto LABEL_48;
        goto LABEL_77;
      }
    }
    else
    {
      if (v7 == 2272)
      {
LABEL_5:
        v9 = 0;
LABEL_47:
        qword_1000A3788 = v9;
        goto LABEL_48;
      }
      if (v7 != 2360)
        goto LABEL_48;
    }
    v9 = 8;
    goto LABEL_47;
  }
  v9 = 2;
  if (v7 > 2000)
  {
    if (v7 > 2078)
    {
      switch(v7)
      {
        case 2079:
          v9 = 9;
          break;
        case 2208:
          v9 = 6;
          break;
        case 2224:
          v9 = 3;
          break;
        default:
          goto LABEL_48;
      }
      goto LABEL_47;
    }
    if (v7 != 2001)
    {
      if (v7 == 2048)
        goto LABEL_47;
      goto LABEL_48;
    }
LABEL_79:
    v9 = 1;
    goto LABEL_47;
  }
  if (v7 > 1623)
  {
    if (v7 != 1624)
    {
      if (v7 != 1792)
        goto LABEL_48;
      goto LABEL_74;
    }
LABEL_77:
    v9 = 4;
    goto LABEL_47;
  }
  if (v7 == 1024)
    goto LABEL_47;
  if (v7 == 1334)
    goto LABEL_79;
LABEL_48:
  v13 = sub_10000E6C4();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218240;
    v16 = qword_1000A3788;
    v17 = 1024;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Determined screen size to be %ld for screenHeight: %d", (uint8_t *)&v15, 0x12u);
  }

}

char *sub_10002A8F0(uint64_t a1)
{
  char *result;
  uint64_t v2;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if ((unint64_t)(result - 1) > 0xE)
    v2 = 3;
  else
    v2 = qword_100066F60[(_QWORD)(result - 1)];
  qword_1000A1800 = v2;
  return result;
}

unint64_t sub_10002A9A4(uint64_t a1)
{
  unint64_t result;
  uint64_t v2;

  result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if (result > 0xE)
    v2 = 1;
  else
    v2 = qword_100066FD8[result];
  qword_1000A37A0 = v2;
  return result;
}

unint64_t sub_10002AA54(uint64_t a1)
{
  unint64_t result;
  uint64_t v2;

  result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if (result > 0xF)
    v2 = 1;
  else
    v2 = qword_100067050[result];
  qword_1000A37B0 = v2;
  return result;
}

char *sub_10002AB04(uint64_t a1)
{
  char *result;
  uint64_t v2;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if ((unint64_t)(result - 1) > 7)
    v2 = 1;
  else
    v2 = qword_1000670D0[(_QWORD)(result - 1)];
  qword_1000A37C0 = v2;
  return result;
}

id sub_10002ABC4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  byte_1000A37D0 = result == 0;
  return result;
}

char *sub_10002AC60(uint64_t a1)
{
  char *result;
  uint64_t v2;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if ((unint64_t)(result - 5) > 9)
    v2 = 2;
  else
    v2 = qword_100067110[(_QWORD)(result - 5)];
  qword_1000A1808 = v2;
  return result;
}

unint64_t sub_10002AD20(uint64_t a1)
{
  unint64_t result;

  result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  byte_1000A37E8 = (result < 0xF) & (0x5060u >> result);
  return result;
}

unint64_t sub_10002ADD4(uint64_t a1)
{
  unint64_t result;

  result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  byte_1000A37F8 = (result < 0xF) & (0x5060u >> result);
  return result;
}

unint64_t sub_10002B0A0(uint64_t a1)
{
  unint64_t result;
  uint64_t v2;

  result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if (result > 0xE)
    v2 = 1;
  else
    v2 = qword_100067190[result];
  qword_1000A3808 = v2;
  return result;
}

char *sub_10002B150(uint64_t a1)
{
  char *result;
  uint64_t v2;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if ((unint64_t)(result - 1) > 0xE)
    v2 = 2;
  else
    v2 = qword_100067208[(_QWORD)(result - 1)];
  qword_1000A1810 = v2;
  return result;
}

unint64_t sub_10002B204(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldUseExplicitLayoutDimensions"))
  {
    result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "yOffsetForDialerLCDViewForDxDevices");
  }
  else
  {
    result = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
    if (result > 7)
      v3 = 0x4061000000000000;
    else
      v3 = qword_100067280[result];
  }
  qword_1000A3820 = v3;
  return result;
}

double sub_10002B318(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "yOffsetForDialerLCDView");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "yParticipantsViewAdjustmentForKeypad");
  result = v3 + v4;
  qword_1000A3830 = *(_QWORD *)&result;
  return result;
}

void sub_10002B39C(id a1)
{
  if (!+[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize"))
    qword_1000A3840 = 0x4046800000000000;
}

id sub_10002B488(uint64_t a1)
{
  id result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  v2 = 1;
  if (result == (id)7)
    v2 = 2;
  if (result == (id)6)
    v2 = 0;
  qword_1000A3850 = v2;
  return result;
}

unint64_t sub_10002B530(uint64_t a1)
{
  unint64_t result;
  uint64_t v2;

  result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  if (result > 8)
    v2 = 0x4055900000000000;
  else
    v2 = qword_1000672F0[result];
  qword_1000A1818 = v2;
  return result;
}

char *sub_10002B5E4(uint64_t a1)
{
  char *result;
  double v2;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  v2 = 13.0;
  if ((unint64_t)(result - 4) <= 0xA)
    v2 = dbl_100067338[(_QWORD)(result - 4)];
  qword_1000A1820 = *(_QWORD *)&v2;
  return result;
}

id sub_10002B694(uint64_t a1)
{
  id result;
  BOOL v2;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  v2 = result == (id)9 || result == (id)4;
  v3 = 0.0;
  if (v2)
    v3 = 2.5;
  qword_1000A3870 = *(_QWORD *)&v3;
  return result;
}

id sub_10002B73C(uint64_t a1)
{
  id result;
  double v2;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  v2 = 4.0;
  if (result == (id)4)
    v2 = 17.0;
  qword_1000A3880 = *(_QWORD *)&v2;
  return result;
}

char *sub_10002B7E4(uint64_t a1)
{
  char *result;
  double v2;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  v2 = 1.0;
  if ((unint64_t)(result - 1) <= 0xE)
    v2 = dbl_100067390[(_QWORD)(result - 1)];
  qword_1000A1828 = *(_QWORD *)&v2;
  return result;
}

unint64_t sub_10002B8CC(uint64_t a1)
{
  unint64_t result;

  result = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "screenSize");
  byte_1000A3898 = (result < 9) & (0x18Cu >> result);
  return result;
}

id sub_10002B980(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  byte_1000A38A8 = result == (id)7;
  return result;
}

id sub_10002BA28(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  byte_1000A38B8 = result == (id)6;
  return result;
}

id sub_10002BAC4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "screenSize");
  byte_1000A38C8 = result == 0;
  return result;
}

void sub_10002BB54(id a1)
{
  unint64_t v1;

  v1 = +[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing");
  if (v1 <= 6)
    byte_1000A38D8 = (7u >> v1) & 1;
}

void sub_10002BDBC(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = sub_10000E6C4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_1000A3908 != -1)
        dispatch_once(&qword_1000A3908, &stru_10008A018);
      *(_DWORD *)buf = 136315138;
      v11 = qword_1000A3910;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling %s by fetching metadata for recent calls", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serialQueue"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10002BF34;
      v7[3] = &unk_100089980;
      v8 = *(id *)(a1 + 32);
      v9 = v5;
      dispatch_async(v6, v7);

    }
  }

}

id sub_10002BF34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchMetadataForRecentCalls:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_10002BFEC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002BFFC(uint64_t a1)
{

}

void sub_10002C004(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_10002C078(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactForHandle:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10002C18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002C1A4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ph_uniqueIDs", 0));
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
      v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "messageCache"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

void sub_10002C3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002C40C(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  v3 = objc_msgSend(v2, "coalescingStrategy");

  if (v3 == (id)2)
  {
    v4 = (id *)&kCHCoalescingStrategyCollapseIfEqual;
  }
  else
  {
    if (v3 != (id)1)
      return;
    v4 = (id *)&kCHCoalescingStrategyRecents;
  }
  v5 = *v4;
  if (v5)
  {
    v9 = v5;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coalescedCallWithCall:usingStrategy:", *(_QWORD *)(a1 + 48), v5));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void sub_10002C534(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v1, "deleteAllRecentCalls");

}

void sub_10002C5FC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v2, "deleteRecentCalls:", *(_QWORD *)(a1 + 40));

}

void sub_10002C6A8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v1, "markRecentAudioCallsAsRead");

}

void sub_10002C874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002C890(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactsByHandleForRecentCall:keyDescriptors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_10002C9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002CA00(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v2 = sub_10000E6C4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v20 = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to create a dial request for recent call %@", (uint8_t *)&v20, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "callProviderManager"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dialRequestForRecentCall:", *(_QWORD *)(a1 + 32)));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "validRemoteParticipantHandles"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contactForHandle:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setContactIdentifier:", v12);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setOriginatingUIType:", 8);
  }
  else
  {
    v13 = sub_10000E6C4();
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005527C(a1 + 32, v10, v14, v15, v16, v17, v18, v19);
  }

}

void sub_10002CCB8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = sub_10000E6C4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000552E4(a1, (uint64_t)v3, v5);

  }
}

id sub_10002D4FC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didUpdateCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10002D50C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didChangeCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 120));
}

id sub_10002D6F4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didCompleteFetchingCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10002D89C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didChangeUnreadCallCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10002DA40(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsControllerDidChangeMessages:", *(_QWORD *)(a1 + 40));
}

void sub_10002E150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002E168(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchUnifiedContactForID:withDescriptors:", v3, v5));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_10002E4D4(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featureFlags"));
  v3 = objc_msgSend(v2, "phoneRecentsAvatarsEnabled");

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serialQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002E584;
    v7[3] = &unk_100089980;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(v4, v7);

  }
}

void sub_10002E584(uint64_t a1)
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueId", (_QWORD)v15));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "itemCache"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));
          v11 = objc_msgSend(v10, "mutableCopy");

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedSubtitleForRecentCall:", v7));
            objc_msgSend(v11, "setLocalizedSubtitle:", v12);

            v13 = objc_msgSend(v11, "copy");
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "itemCache"));
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v8);

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v4);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
    objc_msgSend(*(id *)(a1 + 40), "notifyDelegatesRecentsController:didUpdateCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
  }
}

void sub_10002EACC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v6, "count"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactCache"));
    objc_msgSend(v2, "removeAllObjects");

    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recentCalls"));
    objc_msgSend(v3, "fetchContactsForRecentCalls:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
    objc_msgSend(v5, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "populateItemCacheForRecentCalls:", v6);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegatesRecentsController:didChangeCalls:", *(_QWORD *)(a1 + 32), v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }

}

id sub_10002ECE8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
}

void sub_10002EE3C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchContactFormatter"));
  objc_msgSend(*(id *)(a1 + 32), "setContactFormatter:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchNumberFormatter"));
  objc_msgSend(*(id *)(a1 + 32), "setNumberFormatter:", v3);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v8, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
    objc_msgSend(v4, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "populateItemCacheForRecentCalls:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featureFlags"));
    v6 = objc_msgSend(v5, "phoneRecentsAvatarsEnabled");

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    v7 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v7, "notifyDelegatesRecentsController:didUpdateCalls:", v7, v8);
    else
      objc_msgSend(v7, "notifyDelegatesRecentsController:didChangeCalls:", v7, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }

}

void sub_10002F20C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v2, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v2;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueId"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
          v12 = objc_msgSend(v11, "mutableCopy");

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedSubtitleForRecentCall:", v8));
            objc_msgSend(v12, "setLocalizedSubtitle:", v13);

            v14 = objc_msgSend(v12, "copy");
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v9);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegatesRecentsController:didChangeCalls:", *(_QWORD *)(a1 + 32), v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    v2 = v16;
  }

}

id sub_10002F538(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "populateMessageCache");
}

void sub_10002F68C(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v3, "count"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
    objc_msgSend(v2, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "populateItemCacheForRecentCalls:", v3);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegatesRecentsController:didChangeCalls:", *(_QWORD *)(a1 + 32), v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }

}

void sub_10002FC7C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_LABEL"), &stru_10008B240, CFSTR("PHRecents")));
  v4 = (void *)qword_1000A38F8;
  qword_1000A38F8 = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featureFlags"));
  LODWORD(v2) = objc_msgSend(v5, "callHistorySearchEnabled");

  if ((_DWORD)v2)
  {
    v6 = TUBundle();
    v9 = (id)objc_claimAutoreleasedReturnValue(v6);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_LABEL"), &stru_10008B240, CFSTR("TelephonyUtilities")));
    v8 = (void *)qword_1000A38F8;
    qword_1000A38F8 = v7;

  }
}

id sub_100030144(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

id sub_1000307A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:", *(_QWORD *)(a1 + 40));
}

void sub_100030984(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localVideoView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_100031740(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));

  if (objc_msgSend(v8, "length"))
  {
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    LODWORD(v9) = objc_msgSend(v9, "isEmergencyNumberForDigits:senderIdentityUUID:", v8, v10);

    if ((_DWORD)v9)
      objc_msgSend(v5, "setDialType:", 1);
  }
  if (objc_msgSend(v5, "dialType") == (id)1
    && objc_msgSend(*(id *)(a1 + 40), "canMakeEmergencyCallForSenderIdentity:", v6))
  {
    v11 = v6;
    v12 = sub_10000E6C4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating emergency dial request %@ to use sender identity %@", (uint8_t *)&v17, 0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
    objc_msgSend(v5, "setLocalSenderIdentityUUID:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountUUID"));
    objc_msgSend(v5, "setLocalSenderIdentityAccountUUID:", v15);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1000318F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100031984(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000A3928;
  qword_1000A3928 = (uint64_t)v1;

}

uint64_t sub_1000319E0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000319F0(uint64_t a1)
{

}

void sub_1000319F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100031B08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100031B44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100031B80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1000321FC(id a1, NSNotification *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)qword_1000A3948;
  qword_1000A3948 = 0;

  v3 = (void *)qword_1000A3950;
  qword_1000A3950 = 0;

  v4 = (void *)qword_1000A3960;
  qword_1000A3960 = 0;

  v5 = (void *)qword_1000A3958;
  qword_1000A3958 = 0;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10008A160);
}

void sub_10003225C(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("PHRecentCallDetailsViewFormattersDidChangeNotification"), 0);

}

void sub_100033FB4(id *a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[8];
  id to;

  v2 = a1 + 5;
  objc_copyWeak(&to, a1 + 5);
  v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "sharedUtilityProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "UUIDString"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationForCallUID:", v5));

    if (v6)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100034134;
      block[3] = &unk_10008A188;
      objc_copyWeak(&v11, v2);
      v6 = v6;
      v9 = v6;
      v10 = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v11);
    }
  }
  else
  {
    v7 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated before starting", buf, 2u);
    }
  }

  objc_destroyWeak(&to);
}

void sub_10003411C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100034134(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t v10[8];
  const __CFString *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setConversation:", *(_QWORD *)(a1 + 32));
    v4 = sub_10000E6C4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully finished fetchRTTConversationForCallUUID", v10, 2u);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = CFSTR("MPVoicemailRTTTranscriptDidLoadCallIDKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    v12 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[NSObject postNotificationName:object:userInfo:](v6, "postNotificationName:object:userInfo:", CFSTR("MPVoicemailRTTTranscriptDidLoadNotification"), 0, v8);

  }
  else
  {
    v9 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated when trying to write conversation", v10, 2u);
    }
  }

}

__CFString *sub_1000344D0(char a1, unint64_t a2)
{
  void *v2;
  id v4;
  NSObject *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;

  v2 = (void *)a2;
  if (a2 >= 0x7FFFFFFF)
  {
    v4 = sub_10000E6C4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Found unexpected badge count (%llu). Defaulting to zero.", buf, 0xCu);
    }

    if ((a1 & 1) != 0)
      return (__CFString *)0;
    return CFSTR(" ");
  }
  if ((a1 & 1) == 0)
  {
    if (a2)
    {
      v7 = objc_msgSend((id)objc_opt_class(UIApp), "sharedNumberFormatter");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v2));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromNumber:", v9));

      v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@+"), v10);
      return (__CFString *)v11;
    }
    return CFSTR(" ");
  }
  if (a2)
  {
    v12 = objc_msgSend((id)objc_opt_class(UIApp), "sharedNumberFormatter");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v2));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromNumber:", v14));

  }
  return (__CFString *)v2;
}

void sub_100034678(void *a1, void *a2)
{
  sub_100034680(a1, a2, 0);
}

void sub_100034680(void *a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  __CFString *key;

  key = a1;
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));

  }
  if (-[__CFString length](key, "length") && -[__CFString length](v6, "length"))
  {
    CFPreferencesSetValue(key, v5, v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }

}

id sub_100035C80(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100035CE8;
  v2[3] = &unk_1000898B8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.150000006);
}

void sub_100035CE8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactLabel"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_100035D1C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addContactButton"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

id sub_100035D50(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100035DB8;
  v2[3] = &unk_1000898B8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.150000006);
}

void sub_100035DB8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addContactButton"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_100035DEC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactLabel"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100035E20(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v2 = 0.0;
  v3 = 0.0;
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_QWORD *)(a1 + 40))
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactLabel"));
  objc_msgSend(v4, "setAlpha:", v3);

  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_QWORD *)(a1 + 40))
      v2 = 0.0;
    else
      v2 = 1.0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addContactButton"));
  objc_msgSend(v5, "setAlpha:", v2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v8 = v6;
  v7 = 1.0;
  if (!*(_BYTE *)(a1 + 49))
    v7 = 0.0;
  objc_msgSend(v6, "setDeleteButtonAlpha:", v7);

}

void sub_100037950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100037968(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setSigningIn:", 1);

}

uint64_t sub_10003799C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000379AC(uint64_t a1)
{

}

id sub_1000379B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleRegistrarCompletion:errorAlertController:", a2, a3);
}

void sub_100037DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100037DBC(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, _QWORD);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setSigningIn:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
  if (v3)
  {
    v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
    v4[2](v4, 0);

  }
}

void sub_100037E44(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setSigningIn:", 1);

}

id sub_100037E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleRegistrarCompletion:errorAlertController:", a2, a3);
}

void sub_100037E88(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setSigningIn:", 0);

}

void sub_100038008(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setSigningIn:", 0);

}

void sub_10003830C(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
    objc_msgSend(v6, "activateAccount:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "registerAccount");
  }
  else
  {
    v7 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registration enable failed: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void sub_100038B14(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setSigningIn:", 0);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v3, "setActivationFailed:", 1);

}

void sub_100038C48(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100039EB4(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    if (!*(_BYTE *)(a1 + 40))
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentUnavailableView"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
      objc_msgSend(v4, "setHidden:", 1);
      objc_msgSend(v3, "setBackgroundView:", 0);
      objc_msgSend(v3, "setSeparatorStyle:", 1);

    }
  }
}

void sub_100039F40(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentUnavailableView"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
    objc_msgSend(v4, "setHidden:", 0);
    objc_msgSend(v4, "setAlpha:", 1.0);
    objc_msgSend(v3, "setBackgroundView:", v4);
    objc_msgSend(v3, "setSeparatorStyle:", 0);

  }
  else
  {
    objc_msgSend(v4, "setAlpha:", 0.0);
  }

}

uint64_t sub_10003A764(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setReloadingData:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10003B690(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[0] = CFSTR("group-facetime-participant-join");
  v4[1] = CFSTR("group-facetime-moments-request");
  v4[2] = CFSTR("group-facetime-let-me-in-request-pre-conversation");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 3));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000A3988;
  qword_1000A3988 = v2;

}

void sub_10003B86C(id a1, NSNotification *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)qword_1000A39A8;
  qword_1000A39A8 = 0;

  v3 = (void *)qword_1000A39B0;
  qword_1000A39B0 = 0;

  v4 = (void *)qword_1000A39B8;
  qword_1000A39B8 = 0;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10008A320);
}

void sub_10003B8BC(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("PHRecentHeaderViewFormattersDidChangeNotification"), 0);

}

id sub_10003CCE0(double a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  signed int v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  if (a1 < 0.0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Negative time interval passed into PHRecentsPersonHeaderViewStringForTimeInterval")));
    NSLog(CFSTR("** TUCAssertion failure: %@"), v2);

    if (_TUAssertShouldCrashApplication())
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *PHRecentsPersonHeaderViewStringForTimeInterval(NSTimeInterval)"));
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PHRecentsHeaderView.m"), 347, CFSTR("Negative time interval passed into PHRecentsPersonHeaderViewStringForTimeInterval"));

    }
  }
  v5 = (int)a1 & ~((int)a1 >> 31);
  v6 = objc_msgSend((id)objc_opt_class(UIApp), "sharedNumberFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v5 <= 0x3B)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)a1 & ~((int)a1 >> 31)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromNumber:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    if (v5 == 1)
      v12 = CFSTR("SECOND_UNIT");
    else
      v12 = CFSTR("SECOND_UNIT_PLURAL");
LABEL_16:
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_10008B240, CFSTR("Recents")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v9, v13));
    goto LABEL_17;
  }
  if (v5 <= 0xE0F)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (unsigned __int16)((int)a1 & ~(unsigned __int16)((int)a1 >> 31)) / 0x3Cu));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromNumber:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    if (v5 <= 0x77)
      v12 = CFSTR("MINUTE_UNIT");
    else
      v12 = CFSTR("MINUTE_UNIT_PLURAL");
    goto LABEL_16;
  }
  if (v5 % 0xE10 <= 0x3B)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromNumber:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    if (v5 - 7200 >= 0xFFFFF1F0)
      v12 = CFSTR("HOUR_UNIT");
    else
      v12 = CFSTR("HOUR_UNIT_PLURAL");
    goto LABEL_16;
  }
  v16 = v5 % 0xE10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromNumber:", v8));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = v17;
  if (v5 - 7200 >= 0xFFFFF1F0)
    v18 = CFSTR("HOUR_UNIT");
  else
    v18 = CFSTR("HOUR_UNIT_PLURAL");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_10008B240, CFSTR("Recents")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v16 / 60)));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromNumber:", v19));
  v21 = v16 - 120;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = v22;
  if (v21 >= 0xFFFFFFC4)
    v24 = CFSTR("MINUTE_UNIT");
  else
    v24 = CFSTR("MINUTE_UNIT_PLURAL");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_10008B240, CFSTR("Recents")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v9, v13, v20, v25));

LABEL_17:
  return v14;
}

id sub_10003D1E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureProperPositionForContentView");
}

id sub_10003D508(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "updateVideoViewControllerWithOrientationMonitor:", *(_QWORD *)(a1 + 40));
}

void sub_10003D83C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  CGAffineTransform v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentView"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(&v7, 0, sizeof(v7));
  if (!CGAffineTransformIsIdentity(&v7))
    objc_msgSend(v5, "setHidden:", 1);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);

}

id sub_10003D8CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentViewHiddenPosition");
}

id sub_10003DAA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "viewDidAppear:", *(unsigned __int8 *)(a1 + 40));
}

id sub_10003DAC4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

id sub_10003DC54(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "viewDidDisappear:", *(unsigned __int8 *)(a1 + 48));
}

id sub_10003DC8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void sub_10003E010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003E038(uint64_t a1, char a2)
{
  id *WeakRetained;
  id *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained[10], "showContent");
    if ((objc_msgSend(v4[2], "isViewLoaded") & 1) != 0)
    {
      objc_msgSend(v4[2], "viewWillDisappear:", 1);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10003E160;
      v8[3] = &unk_1000898B8;
      v8[4] = v4;
      v5 = objc_retainBlock(v8);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10003E234;
      v7[3] = &unk_10008A1D8;
      v7[4] = v4;
      v6 = objc_retainBlock(v7);
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v5, v6, 0.400000006, 0.0500000007);

    }
    else
    {
      objc_msgSend(v4, "_destroyFirstRunController");
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_constrainRegistrationView");
  }

}

void sub_10003E160(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "view"));
  objc_msgSend(v11, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bounds");
  objc_msgSend(v11, "setFrame:", v3, v8, v5, v7);
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "baseViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v10, "setAlpha:", 1.0);

  }
}

id sub_10003E234(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "viewDidDisappear:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_destroyFirstRunController");
}

void sub_10003F45C(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_10000E6C4();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished test", v3, 2u);
  }

}

void sub_10003F618(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = sub_10000E6C4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32) + 1;
    v5 = 134217984;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Finished test %ld", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10003F6C0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = sub_10000E6C4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Finished test %ld", (uint8_t *)&v5, 0xCu);
  }

}

id sub_100040230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", NSForegroundColorAttributeName, *(_QWORD *)(a1 + 40), a2, a3);
}

unint64_t UIDeviceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;

  v1 = a1 - 1;
  result = 0x7469617274726F70;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0xD000000000000012;
      break;
    case 2:
    case 3:
      result = 0x70616373646E616CLL;
      break;
    case 4:
      result = 0x705565636166;
      break;
    case 5:
      result = 0x6E776F4465636166;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_100040F44()
{
  uint64_t *v0;

  return UIDeviceOrientation.description.getter(*v0);
}

void type metadata accessor for VMTranscriptConfidenceRating(uint64_t a1)
{
  sub_100015670(a1, &qword_1000A2030, (uint64_t)&unk_10008A5C0);
}

uint64_t sub_100040F60(uint64_t a1, uint64_t a2)
{
  return sub_10004121C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100040F6C(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100040FE0(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10004105C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
  sub_100015670(a1, &qword_1000A20A0, (uint64_t)&unk_10008A600);
}

uint64_t sub_1000410B0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000410F4@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10004111C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000411D0(&qword_1000A20C0, (uint64_t)&unk_10006770C);
  v3 = sub_1000411D0(&qword_1000A20C8, (uint64_t)&unk_1000676AC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100041188()
{
  return sub_1000411D0(&qword_1000A20A8, (uint64_t)&unk_100067670);
}

uint64_t sub_1000411AC()
{
  return sub_1000411D0(&qword_1000A20B0, (uint64_t)&unk_100067644);
}

uint64_t sub_1000411D0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for UIContentSizeCategory(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100041210(uint64_t a1, uint64_t a2)
{
  return sub_10004121C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10004121C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100041258(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100041298(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100041308(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100041390()
{
  return sub_1000411D0(&qword_1000A20B8, (uint64_t)&unk_1000676E0);
}

uint64_t sub_1000413B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  _BYTE v8[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    v7 = *(void (**)(uint64_t))(result + 40);
    v6 = *(_QWORD *)(result + 48);
    swift_retain(v6);
    swift_release(v5);
    v7(a1);
    return swift_release(v6);
  }
  return result;
}

uint64_t sub_100041430()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[6]);
  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_100041464()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100041488(uint64_t a1)
{
  uint64_t v1;

  return sub_1000413B4(a1, v1);
}

uint64_t sub_100041490()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  void *v18;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue_serial.Attributes(0);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004184C();
  static DispatchQoS.userInteractive.getter();
  v18 = &_swiftEmptyArrayStorage;
  v13 = sub_100041888(&qword_1000A2420, 255, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes);
  v14 = sub_10001283C(&qword_1000A2428);
  v15 = sub_1000418C8();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v18, v14, v15, v5, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  result = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000021, 0x800000010006AA70, v12, v8, v4, 0);
  qword_1000A49C0 = result;
  return result;
}

uint64_t sub_10004165C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for VoicemailActor()
{
  return objc_opt_self(_TtC8FaceTime14VoicemailActor);
}

uint64_t sub_10004168C()
{
  if (qword_1000A1EA0 != -1)
    swift_once(&qword_1000A1EA0, sub_100041490);
  return OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()();
}

uint64_t sub_1000416D8()
{
  uint64_t v0;

  return swift_initStaticObject(v0, &unk_1000A1F10);
}

uint64_t sub_1000416E8()
{
  uint64_t v0;

  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

id sub_10004172C()
{
  if (qword_1000A1EA0 != -1)
    swift_once(&qword_1000A1EA0, sub_100041490);
  qword_1000A49C8 = qword_1000A49C0;
  return (id)qword_1000A49C0;
}

id sub_100041790(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4, uint64_t a5)
{
  if (*a3 != -1)
    swift_once(a3, a5);
  return *a4;
}

id sub_1000417CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VoicemailQueueManager()
{
  return objc_opt_self(MPVoicemailQueueManager);
}

uint64_t sub_100041820(uint64_t a1, uint64_t a2)
{
  return sub_100041888(&qword_1000A2410, a2, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100067868);
}

unint64_t sub_10004184C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A2418;
  if (!qword_1000A2418)
  {
    v1 = objc_opt_self(OS_dispatch_queue_serial);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000A2418);
  }
  return result;
}

uint64_t sub_100041888(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000418C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A2430;
  if (!qword_1000A2430)
  {
    v1 = sub_10001528C(&qword_1000A2428);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000A2430);
  }
  return result;
}

id sub_100041AC4()
{
  return sub_1000426C4(type metadata accessor for VisualTranscriptionMessage);
}

uint64_t type metadata accessor for VisualTranscriptionMessage()
{
  return objc_opt_self(MPVisualTranscriptionMessage);
}

id sub_100041DC4(char *a1, uint64_t a2, SEL *a3)
{
  void *v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v4 = *(void **)&a1[OBJC_IVAR___MPVisualMessage_vmMessage];
  v5 = a1;
  v6 = objc_msgSend(v4, *a3);
  if (v6)
  {
    v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v9 = v8;

    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {

    v10 = 0;
  }
  return v10;
}

id sub_100042260(char *a1, uint64_t a2, void *a3, _QWORD *a4, uint64_t (*a5)(void))
{
  id v6;
  objc_super v8;

  *(_QWORD *)&a1[*a4] = a3;
  v8.receiver = a1;
  v8.super_class = (Class)a5();
  v6 = a3;
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t sub_1000422CC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  _QWORD *v16;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = &_swiftEmptyArrayStorage;
  if (!v2)
    return (uint64_t)v3;
  v16 = &_swiftEmptyArrayStorage;
  result = sub_100042724(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      v3 = v16;
      do
      {
        v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
        v6 = sub_10001283C(&qword_1000A24A0);
        swift_dynamicCast(v15, &v14, v6, (char *)&type metadata for Any + 8, 7);
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        {
          sub_100042724(0, v3[2] + 1, 1);
          v3 = v16;
        }
        v8 = v3[2];
        v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_100042724(v7 > 1, v8 + 1, 1);
          v3 = v16;
        }
        ++v5;
        v3[2] = v8 + 1;
        sub_100042740(v15, &v3[4 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (uint64_t *)(a1 + 32);
      v3 = v16;
      do
      {
        v14 = *v9;
        swift_unknownObjectRetain(v14);
        v10 = sub_10001283C(&qword_1000A24A0);
        swift_dynamicCast(v15, &v14, v10, (char *)&type metadata for Any + 8, 7);
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        {
          sub_100042724(0, v3[2] + 1, 1);
          v3 = v16;
        }
        v12 = v3[2];
        v11 = v3[3];
        if (v12 >= v11 >> 1)
        {
          sub_100042724(v11 > 1, v12 + 1, 1);
          v3 = v16;
        }
        v3[2] = v12 + 1;
        sub_100042740(v15, &v3[4 * v12 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_1000426B8()
{
  return sub_1000426C4(type metadata accessor for VisualMessage);
}

id sub_1000426C4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for VisualMessage()
{
  return objc_opt_self(MPVisualMessage);
}

uint64_t sub_100042724(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100042750(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

_OWORD *sub_100042740(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100042750(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
        goto LABEL_32;
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
    v10 = sub_10001283C(&qword_1000A24A8);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void sub_1000428BC(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  NSString v26;
  Class isa;
  Class v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  Class v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v2 = v1;
  if (qword_1000A1EF8 != -1)
    swift_once(&qword_1000A1EF8, sub_10004DE34);
  v4 = type metadata accessor for Logger(0);
  sub_1000138F4(v4, (uint64_t)qword_1000A4A40);
  v5 = swift_unknownObjectRetain_n(a1, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v70 = (uint64_t)a1;
    v71 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_unknownObjectRetain(a1);
    v10 = sub_10001283C((uint64_t *)&unk_1000A2520);
    v11 = String.init<A>(reflecting:)(&v70, v10);
    v13 = v12;
    v70 = sub_100013E00(v11, v12, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v8 + 4, v8 + 12);
    swift_unknownObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "showScreenTimeShield for %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n(a1, 2);
  }
  v14 = objc_msgSend(a1, "bundleIdentifier");
  if (v14)
  {
    v15 = v14;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v17 = v16;

    v18 = objc_msgSend(v1, "lockoutViewController");
    if (v18)
      sub_10004312C(0);
    v19 = objc_msgSend(a1, "sanitizedHandles");
    v20 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String, &protocol witness table for String);

    v21 = sub_1000540DC(v20);
    swift_bridgeObjectRelease(v20);
    v22 = objc_msgSend((id)objc_opt_self(TUCallCenter), "sharedInstance");
    v23 = objc_msgSend(v22, "contactStore");

    v24 = objc_msgSend(a1, "contactNamesByHandleWithContactsDataSource:", v23);
    v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v24, &type metadata for String, &type metadata for String, &protocol witness table for String);

    v26 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_release(v21);
    v28 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v25);
    v29 = objc_msgSend((id)objc_opt_self(STLockoutViewController), "lockoutViewControllerWithBundleIdentifier:contactsHandles:contactNameByHandle:", v26, isa, v28);

    objc_msgSend(v29, "setViewControllerDelegate:", v2);
    objc_msgSend(v29, "setOkButtonAction:", 1);
    v30 = v29;
    objc_msgSend(v2, "setLockoutViewController:", v30);
    v31 = objc_msgSend(v30, "view");

    if (!v31)
    {
      sub_10004312C(0);

      return;
    }
    objc_msgSend(v31, "setAlpha:", 0.0);
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v2, "addChildViewController:", v30);
    v32 = objc_msgSend(v2, "view");
    if (v32)
    {
      v33 = v32;
      objc_msgSend(v32, "addSubview:", v31);

      v34 = sub_10001283C((uint64_t *)&unk_1000A3190);
      v35 = swift_allocObject(v34, 64, 7);
      *(_OWORD *)(v35 + 16) = xmmword_1000678F0;
      v36 = objc_msgSend(v31, "topAnchor");
      v37 = objc_msgSend(v2, "view");
      if (v37)
      {
        v38 = v37;
        v39 = objc_msgSend(v37, "topAnchor");

        v40 = objc_msgSend(v36, "constraintEqualToAnchor:", v39);
        *(_QWORD *)(v35 + 32) = v40;
        v41 = objc_msgSend(v31, "bottomAnchor");
        v42 = objc_msgSend(v2, "view");
        if (v42)
        {
          v43 = v42;
          v44 = objc_msgSend(v42, "bottomAnchor");

          v45 = objc_msgSend(v41, "constraintEqualToAnchor:", v44);
          *(_QWORD *)(v35 + 40) = v45;
          v46 = objc_msgSend(v31, "leadingAnchor");
          v47 = objc_msgSend(v2, "detailsViewController");
          if (v47)
          {
            v48 = v47;
            v49 = objc_msgSend(v47, "view");

            if (v49)
            {
              v50 = objc_msgSend(v49, "trailingAnchor");

              v51 = objc_msgSend(v46, "constraintEqualToAnchor:", v50);
              *(_QWORD *)(v35 + 48) = v51;
              v52 = objc_msgSend(v31, "trailingAnchor");
              v53 = objc_msgSend(v2, "view");
              if (v53)
              {
                v54 = v53;
                v55 = (void *)objc_opt_self(NSLayoutConstraint);
                v56 = objc_msgSend(v54, "trailingAnchor");

                v57 = objc_msgSend(v52, "constraintEqualToAnchor:", v56);
                *(_QWORD *)(v35 + 56) = v57;
                v71 = v35;
                specialized Array._endMutation()(v58);
                v59 = v71;
                sub_100043934();
                v60 = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease(v59);
                objc_msgSend(v55, "activateConstraints:", v60);

                sub_100043280(1, 1, 0, 0);
                return;
              }
              goto LABEL_26;
            }
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            return;
          }
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
  v61 = swift_unknownObjectRetain_n(a1, 2);
  v62 = Logger.logObject.getter(v61);
  v63 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc(12, -1);
    v65 = swift_slowAlloc(32, -1);
    v70 = (uint64_t)a1;
    v71 = v65;
    *(_DWORD *)v64 = 136315138;
    swift_unknownObjectRetain(a1);
    v66 = sub_10001283C((uint64_t *)&unk_1000A2520);
    v67 = String.init<A>(reflecting:)(&v70, v66);
    v69 = v68;
    v70 = sub_100013E00(v67, v68, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v64 + 4, v64 + 12);
    swift_unknownObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v69);
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Could not find bundle identifier for TUFilteredRequest %s", v64, 0xCu);
    swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v65, -1, -1);
    swift_slowDealloc(v64, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n(a1, 2);
  }
}

void sub_10004312C(char a1)
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v2 = v1;
  v4 = objc_msgSend(v1, "lockoutViewController");

  if (v4)
  {
    if (qword_1000A1EF8 != -1)
      swift_once(&qword_1000A1EF8, sub_10004DE34);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_1000138F4(v5, (uint64_t)qword_1000A4A40);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "removeScreenTimeShield", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    v10 = swift_allocObject(&unk_10008A798, 24, 7);
    swift_unknownObjectWeakInit(v10 + 16, v2);
    swift_retain(v10);
    sub_100043280(0, a1 & 1, (uint64_t)sub_10004392C, v10);
    swift_release_n(v10, 2);
  }
}

void sub_100043280(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t Strong;
  void *v21;
  id v22;
  void *v23;
  id v24;
  double v25;
  void **v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v5 = v4;
  v10 = swift_allocObject(&unk_10008A798, 24, 7);
  v11 = v10 + 16;
  swift_unknownObjectWeakInit(v10 + 16, v5);
  v12 = swift_allocObject(&unk_10008A7C0, 25, 7);
  *(_QWORD *)(v12 + 16) = v10;
  *(_BYTE *)(v12 + 24) = a1;
  if ((a2 & 1) != 0)
  {
    v13 = (void *)objc_opt_self(UIView);
    v14 = swift_allocObject(&unk_10008A7E8, 32, 7);
    *(_QWORD *)(v14 + 16) = sub_100043994;
    *(_QWORD *)(v14 + 24) = v12;
    v30 = sub_1000439C4;
    v31 = v14;
    v26 = _NSConcreteStackBlock;
    v27 = 1107296256;
    v28 = sub_100043704;
    v29 = &unk_10008A800;
    v15 = _Block_copy(&v26);
    v16 = v31;
    swift_retain(v12);
    swift_release(v16);
    v17 = swift_allocObject(&unk_10008A838, 32, 7);
    *(_QWORD *)(v17 + 16) = a3;
    *(_QWORD *)(v17 + 24) = a4;
    v30 = sub_100043A10;
    v31 = v17;
    v26 = _NSConcreteStackBlock;
    v27 = 1107296256;
    v28 = sub_100043730;
    v29 = &unk_10008A850;
    v18 = _Block_copy(&v26);
    v19 = v31;
    sub_1000156C8(a3, a4);
    swift_release(v19);
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v15, v18, 0.2);
    swift_release(v12);
    _Block_release(v18);
    _Block_release(v15);
    return;
  }
  swift_beginAccess(v11, &v26, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v11);
  if (!Strong)
  {
    swift_release(v12);
    return;
  }
  v21 = (void *)Strong;
  swift_retain(v10);
  v22 = objc_msgSend(v21, "lockoutViewController");
  if (!v22)
  {
    __break(1u);
    goto LABEL_11;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, "view");

  if (!v24)
  {
LABEL_11:
    __break(1u);
    return;
  }
  v25 = 0.0;
  if ((a1 & 1) != 0)
    v25 = 1.0;
  objc_msgSend(v24, "setAlpha:", v25);
  swift_release(v12);
  swift_release(v10);

}

void sub_100043554(uint64_t a1)
{
  uint64_t v1;
  void *Strong;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _BYTE v9[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    v4 = objc_msgSend(Strong, "lockoutViewController");
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "view");

      if (v6)
      {
        objc_msgSend(v6, "removeFromSuperview");

        v7 = objc_msgSend(v3, "lockoutViewController");
        if (v7)
        {
          v8 = v7;
          objc_msgSend(v7, "removeFromParentViewController");

          objc_msgSend(v3, "setLockoutViewController:", 0);
          return;
        }
LABEL_9:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
}

void sub_100043644(uint64_t a1, char a2)
{
  uint64_t v3;
  void *Strong;
  void *v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  _BYTE v10[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (!Strong)
    return;
  v5 = Strong;
  v6 = objc_msgSend(Strong, "lockoutViewController");
  if (!v6)
  {
    __break(1u);
    goto LABEL_9;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "view");

  if (!v8)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v9 = 0.0;
  if ((a2 & 1) != 0)
    v9 = 1.0;
  objc_msgSend(v8, "setAlpha:", v9);

}

uint64_t sub_100043704(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100043730(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void PhoneRootViewController.lockoutViewControllerDidFinishDismissing(_:)()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;

  v1 = v0;
  v2 = objc_msgSend(v0, "lockoutViewController");

  if (v2)
  {
    if (qword_1000A1EF8 != -1)
      swift_once(&qword_1000A1EF8, sub_10004DE34);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_1000138F4(v3, (uint64_t)qword_1000A4A40);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "removeScreenTimeShield", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    v8 = swift_allocObject(&unk_10008A798, 24, 7);
    swift_unknownObjectWeakInit(v8 + 16, v1);
    swift_retain(v8);
    sub_100043280(0, 1, (uint64_t)sub_10004392C, v8);
    swift_release_n(v8, 2);
  }
}

uint64_t sub_100043908()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10004392C()
{
  uint64_t v0;

  sub_100043554(v0);
}

unint64_t sub_100043934()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A2530;
  if (!qword_1000A2530)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000A2530);
  }
  return result;
}

uint64_t sub_100043970()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 25, 7);
}

void sub_100043994()
{
  uint64_t v0;

  sub_100043644(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_1000439A0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000439C4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000439E4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100043A10(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(void);

  if ((result & 1) != 0)
  {
    v2 = *(uint64_t (**)(void))(v1 + 16);
    if (v2)
      return v2();
  }
  return result;
}

id sub_100043A44()
{
  return sub_1000426C4(type metadata accessor for OrientationMonitorComposer);
}

id sub_100043AAC()
{
  return sub_1000426C4(type metadata accessor for PHOrientationMonitor_OBJC);
}

unint64_t sub_100043AD0()
{
  uint64_t v0;
  uint64_t inited;
  _BYTE v3[104];

  v0 = sub_10001283C(qword_1000A25D8);
  inited = swift_initStackObject(v0, v3);
  *(_OWORD *)(inited + 16) = xmmword_100067910;
  *(_QWORD *)(inited + 32) = 0xD00000000000001FLL;
  *(_QWORD *)(inited + 40) = 0x800000010006AF90;
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 56) = 0xD000000000000023;
  *(_QWORD *)(inited + 64) = 0x800000010006AFB0;
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 80) = 0xD000000000000020;
  *(_QWORD *)(inited + 88) = 0x800000010006AFE0;
  *(NSNumber *)(inited + 96) = Int._bridgeToObjectiveC()();
  return sub_100052054(inited);
}

void sub_100043BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v20, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    *(_QWORD *)(Strong + 24) = a1;
    if ((*(_BYTE *)(Strong + 40) & 1) == 0 && (unint64_t)(a1 - 5) >= 0xFFFFFFFFFFFFFFFCLL)
      *(_QWORD *)(Strong + 32) = a1;
    v6 = Logger.logObject.getter(Strong);
    v7 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = swift_slowAlloc(22, -1);
      v9 = swift_slowAlloc(64, -1);
      v19 = v9;
      *(_DWORD *)v8 = 136315394;
      v18 = sub_100013E00(0xD00000000000001FLL, 0x800000010006B010, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v8 + 4, v8 + 12);
      *(_WORD *)(v8 + 12) = 2080;
      v10 = a1 - 1;
      v11 = 0xE800000000000000;
      v12 = 0x7469617274726F70;
      switch(v10)
      {
        case 0:
          break;
        case 1:
          v11 = 0x800000010006A7A0;
          v12 = 0xD000000000000012;
          break;
        case 2:
          v11 = 0xED00007466654C65;
          goto LABEL_11;
        case 3:
          v11 = 0xEE00746867695265;
LABEL_11:
          v12 = 0x70616373646E616CLL;
          break;
        case 4:
          v11 = 0xE600000000000000;
          v12 = 0x705565636166;
          break;
        case 5:
          v12 = 0x6E776F4465636166;
          break;
        default:
          v11 = 0xE700000000000000;
          v12 = 0x6E776F6E6B6E75;
          break;
      }
      v18 = sub_100013E00(v12, v11, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v8 + 14, v8 + 22);
      swift_bridgeObjectRelease(v11);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "posting %s for orientation: %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy(v9, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);
    }

    v13 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_1000A1F00 != -1)
      swift_once(&qword_1000A1F00, sub_100052020);
    v14 = qword_1000A4A68;
    v15 = sub_100043AD0();
    v16 = sub_10005216C(v15);
    swift_bridgeObjectRelease(v15);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v16);
    objc_msgSend(v13, "postNotificationName:object:userInfo:", v14, 0, isa);
    swift_release(v5);

  }
}

_BYTE *sub_100043F1C(char a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE *result;
  _BYTE *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[16];
  uint64_t v39[3];
  _BYTE v40[24];
  _BYTE v41[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v41, 0, 0);
  result = (_BYTE *)swift_weakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    if ((a1 & 1) != 0)
    {
      v19 = result[40];
      v5[40] = 0;
LABEL_36:
      sub_100009CD8(v19);
      return (_BYTE *)swift_release(v5);
    }
    v6 = &result[*(_QWORD *)(*(_QWORD *)result + 152)];
    swift_beginAccess(v6, v40, 0, 0);
    v7 = *v6;
    swift_retain(*v6);
    v8 = sub_10001283C(&qword_1000A25D0);
    swift_initStaticObject(v8, &unk_1000A1F80);
    v9 = sub_1000071F8();
    swift_release(v7);
    v10 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == (id)1)
    {
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc(12, -1);
        v16 = swift_slowAlloc(32, -1);
        v39[0] = v16;
        *(_DWORD *)v15 = 136315138;
        v17 = 0x7469617274726F70;
        v18 = 0xE800000000000000;
        switch(v9)
        {
          case 1uLL:
            break;
          case 2uLL:
            v18 = 0x800000010006A7A0;
            v17 = 0xD000000000000012;
            break;
          case 3uLL:
            v17 = 0x70616373646E616CLL;
            v18 = 0xED00007466654C65;
            break;
          case 4uLL:
            v17 = 0x70616373646E616CLL;
            v18 = 0xEE00746867695265;
            break;
          case 5uLL:
            v18 = 0xE600000000000000;
            v17 = 0x705565636166;
            break;
          case 6uLL:
            v17 = 0x6E776F4465636166;
            break;
          default:
            v18 = 0xE700000000000000;
            v17 = 0x6E776F6E6B6E75;
            break;
        }
        v37 = sub_100013E00(v17, v18, v39);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v15 + 4, v15 + 12);
        swift_bridgeObjectRelease(v18);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "SpringBoardOrientationLockChangedNotification: SpringBoard is locked to %s", v15, 0xCu);
        swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v16, -1, -1);
        swift_slowDealloc(v15, -1, -1);
      }

      *(_QWORD *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 168)] = v9;
      if (v9 - 1 > 3)
        goto LABEL_35;
    }
    else
    {
      v20 = swift_retain_n(v5, 2);
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = 0x7469617274726F70;
        v24 = swift_slowAlloc(22, -1);
        v25 = swift_slowAlloc(64, -1);
        v39[0] = v25;
        *(_DWORD *)v24 = 136315394;
        v26 = 0xE800000000000000;
        v27 = 0x7469617274726F70;
        switch(v9)
        {
          case 1uLL:
            break;
          case 2uLL:
            v26 = 0x800000010006A7A0;
            v27 = 0xD000000000000012;
            break;
          case 3uLL:
            v27 = 0x70616373646E616CLL;
            v26 = 0xED00007466654C65;
            break;
          case 4uLL:
            v27 = 0x70616373646E616CLL;
            v26 = 0xEE00746867695265;
            break;
          case 5uLL:
            v26 = 0xE600000000000000;
            v27 = 0x705565636166;
            break;
          case 6uLL:
            v27 = 0x6E776F4465636166;
            break;
          default:
            v26 = 0xE700000000000000;
            v27 = 0x6E776F6E6B6E75;
            break;
        }
        v37 = sub_100013E00(v27, v26, v39);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v24 + 4, v24 + 12);
        swift_bridgeObjectRelease(v26);
        *(_WORD *)(v24 + 12) = 2080;
        v28 = &v5[*(_QWORD *)(*(_QWORD *)v5 + 160)];
        swift_beginAccess(v28, &v37, 0, 0);
        v29 = *v28;
        swift_retain(*v28);
        v30 = sub_1000091CC();
        v31 = sub_100005CD4();
        swift_release(v5);
        swift_release(v29);
        swift_release(v30);
        v32 = 0xE800000000000000;
        switch(v31)
        {
          case 1uLL:
            break;
          case 2uLL:
            v32 = 0x800000010006A7A0;
            v23 = 0xD000000000000012;
            break;
          case 3uLL:
            v23 = 0x70616373646E616CLL;
            v32 = 0xED00007466654C65;
            break;
          case 4uLL:
            v23 = 0x70616373646E616CLL;
            v32 = 0xEE00746867695265;
            break;
          case 5uLL:
            v32 = 0xE600000000000000;
            v23 = 0x705565636166;
            break;
          case 6uLL:
            v23 = 0x6E776F4465636166;
            break;
          default:
            v32 = 0xE700000000000000;
            v23 = 0x6E776F6E6B6E75;
            break;
        }
        v36 = sub_100013E00(v23, v32, v39);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v24 + 14, v24 + 22);
        swift_release(v5);
        swift_bridgeObjectRelease(v32);
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "SpringBoardOrientationLockChangedNotification: SpringBoard is locked to %s, but using %s", (uint8_t *)v24, 0x16u);
        swift_arrayDestroy(v25, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v25, -1, -1);
        swift_slowDealloc(v24, -1, -1);

      }
      else
      {

        swift_release_n(v5, 2);
      }
      v33 = &v5[*(_QWORD *)(*(_QWORD *)v5 + 160)];
      swift_beginAccess(v33, v39, 0, 0);
      v34 = *v33;
      swift_retain(*v33);
      v35 = sub_1000091CC();
      v9 = sub_100005CD4();
      swift_release(v34);
      swift_release(v35);
      *(_QWORD *)&v5[*(_QWORD *)(*(_QWORD *)v5 + 168)] = v9;
      if (v9 - 1 >= 4)
        goto LABEL_35;
    }
    *((_QWORD *)v5 + 4) = v9;
LABEL_35:
    v19 = v5[40];
    v5[40] = 1;
    goto LABEL_36;
  }
  return result;
}

uint64_t sub_100044638()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10004465C(uint64_t a1)
{
  uint64_t v1;

  sub_100043BB0(a1, v1);
}

_BYTE *sub_100044664(char a1)
{
  uint64_t v1;

  return sub_100043F1C(a1 & 1, v1);
}

uint64_t sub_100044670(uint64_t a1, char a2)
{
  uint64_t v2;

  return sub_1000549C0(a1, a2 & 1, v2);
}

uint64_t *sub_100044680()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if ((*((_BYTE *)v0 + 20) & 1) == 0)
    notify_cancel(*((_DWORD *)v0 + 4));
  swift_bridgeObjectRelease(v0[4]);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 104));
  swift_release(*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 112) + 8));
  swift_release(*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 120) + 8));
  return v0;
}

uint64_t sub_1000446FC()
{
  uint64_t v0;

  sub_100044680();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100044720(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  void *v22;
  id v23;
  Swift::Int v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  Swift::Int v33;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v32 = v9;
      v10 = sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v33;
      swift_unknownObjectRelease(v9, v11);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v24 = sub_1000449BC(v7, result + 1);
    v33 = v24;
    v25 = *(_QWORD *)(v24 + 16);
    if (*(_QWORD *)(v24 + 24) <= v25)
    {
      v30 = v25 + 1;
      v31 = v8;
      sub_100044F14(v30);
      v26 = v33;
    }
    else
    {
      v26 = v24;
      v27 = v8;
    }
    sub_1000451B0((uint64_t)v8, v26);
    v29 = *v3;
    *v3 = v26;
  }
  else
  {
    v13 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v14 = NSObject._rawHashValue(seed:)(v13);
    v15 = -1 << *(_BYTE *)(v6 + 32);
    v16 = v14 & ~v15;
    if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
    {
      sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
      v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
      v18 = static NSObject.== infix(_:_:)();

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v22 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v16);
        *a1 = (Swift::Int)v22;
        v23 = v22;
        return 0;
      }
      v19 = ~v15;
      while (1)
      {
        v16 = (v16 + 1) & v19;
        if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
        v21 = static NSObject.== infix(_:_:)();

        if ((v21 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v33 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_100045230((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    v29 = *v3;
    *v3 = v33;
  }
  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_1000449BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_10001283C(&qword_1000A26A8);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      v7 = v6;
      v8 = sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_100044F14(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()(result);
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1, 0);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

uint64_t sub_100044BB0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(char *, unint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;

  v2 = v1;
  v4 = type metadata accessor for RecentsCallHandle(0);
  v41 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_10001283C(&qword_1000A2690);
  v9 = static _SetStorage.resize(original:capacity:move:)(v8, a1, 1);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_39;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 56);
  v40 = (_QWORD *)(v8 + 56);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v38 = v2;
  v39 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 56;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_26;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
    if (v21 >= v39)
      goto LABEL_35;
    v22 = v40[v21];
    ++v17;
    if (!v22)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_35;
      v22 = v40[v17];
      if (!v22)
      {
        v17 = v21 + 2;
        if (v21 + 2 >= v39)
          goto LABEL_35;
        v22 = v40[v17];
        if (!v22)
          break;
      }
    }
LABEL_25:
    v14 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_26:
    v24 = v8;
    v25 = *(_QWORD *)(v41 + 72);
    v26 = *(_QWORD *)(v8 + 48) + v25 * v20;
    v27 = *(void (**)(char *, unint64_t, uint64_t))(v41 + 32);
    v27(v7, v26, v4);
    v28 = *(_QWORD *)(v10 + 40);
    v29 = sub_100012D14(&qword_1000A2680, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v28, v4, v29);
    v30 = -1 << *(_BYTE *)(v10 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v35 = v32 == v34;
        if (v32 == v34)
          v32 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(*(_QWORD *)(v10 + 48) + v18 * v25, v7, v4);
    ++*(_QWORD *)(v10 + 16);
    v8 = v24;
  }
  v23 = v21 + 3;
  if (v23 < v39)
  {
    v22 = v40[v23];
    if (!v22)
    {
      while (1)
      {
        v17 = v23 + 1;
        if (__OFADD__(v23, 1))
          goto LABEL_41;
        if (v17 >= v39)
          goto LABEL_35;
        v22 = v40[v17];
        ++v23;
        if (v22)
          goto LABEL_25;
      }
    }
    v17 = v23;
    goto LABEL_25;
  }
LABEL_35:
  swift_release(v8);
  v2 = v38;
  v37 = 1 << *(_BYTE *)(v8 + 32);
  if (v37 > 63)
    bzero(v40, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v40 = -1 << v37;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_39:
  result = swift_release(v8);
  *v2 = v10;
  return result;
}

Swift::Int sub_100044F14(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10001283C(&qword_1000A26A8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_1000451B0(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_100045230(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100044F14(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_1000455D8();
      goto LABEL_14;
    }
    sub_100045AA0(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

void *sub_1000453B4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  uint64_t v11;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = type metadata accessor for RecentsCallHandle(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001283C(&qword_1000A2690);
  v7 = *v0;
  v8 = static _SetStorage.copy(original:)(*v0);
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = (void *)swift_release(v7);
LABEL_30:
    *v1 = v9;
    return result;
  }
  v26 = v1;
  result = (void *)(v8 + 56);
  v11 = v7 + 56;
  v12 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 56 + 8 * v12)
    result = memmove(result, (const void *)(v7 + 56), 8 * v12);
  v14 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v15 = 1 << *(_BYTE *)(v7 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v7 + 56);
  v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v22 >= v18)
      goto LABEL_28;
    v23 = *(_QWORD *)(v11 + 8 * v22);
    ++v14;
    if (!v23)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v18)
        goto LABEL_28;
      v23 = *(_QWORD *)(v11 + 8 * v14);
      if (!v23)
      {
        v14 = v22 + 2;
        if (v22 + 2 >= v18)
          goto LABEL_28;
        v23 = *(_QWORD *)(v11 + 8 * v14);
        if (!v23)
          break;
      }
    }
LABEL_27:
    v17 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_12:
    v21 = *(_QWORD *)(v3 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v7 + 48) + v21, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v9 + 48) + v21, v6, v2);
  }
  v24 = v22 + 3;
  if (v24 >= v18)
  {
LABEL_28:
    result = (void *)swift_release(v7);
    v1 = v26;
    goto LABEL_30;
  }
  v23 = *(_QWORD *)(v11 + 8 * v24);
  if (v23)
  {
    v14 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    v14 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v14 >= v18)
      goto LABEL_28;
    v23 = *(_QWORD *)(v11 + 8 * v14);
    ++v24;
    if (v23)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

id sub_1000455D8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_10001283C(&qword_1000A26A8);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100045780(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;

  v2 = v1;
  v4 = type metadata accessor for RecentsCallHandle(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_10001283C(&qword_1000A2690);
  v10 = static _SetStorage.resize(original:capacity:move:)(v9, a1, 0);
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = swift_release(v9);
LABEL_37:
    *v2 = v11;
    return result;
  }
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 56);
  v36 = v2;
  v37 = v9 + 56;
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 56;
  result = swift_retain(v9);
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_26;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v22 >= v38)
      goto LABEL_35;
    v23 = *(_QWORD *)(v37 + 8 * v22);
    ++v18;
    if (!v23)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v38)
        goto LABEL_35;
      v23 = *(_QWORD *)(v37 + 8 * v18);
      if (!v23)
      {
        v18 = v22 + 2;
        if (v22 + 2 >= v38)
          goto LABEL_35;
        v23 = *(_QWORD *)(v37 + 8 * v18);
        if (!v23)
          break;
      }
    }
LABEL_25:
    v15 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v18 << 6);
LABEL_26:
    v25 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v8, *(_QWORD *)(v9 + 48) + v25 * v21, v4);
    v26 = *(_QWORD *)(v11 + 40);
    v27 = sub_100012D14(&qword_1000A2680, (uint64_t)&protocol conformance descriptor for RecentsCallHandle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v26, v4, v27);
    v28 = -1 << *(_BYTE *)(v11 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v16 + 8 * v30);
      }
      while (v34 == -1);
      v19 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v11 + 48) + v19 * v25, v8, v4);
    ++*(_QWORD *)(v11 + 16);
  }
  v24 = v22 + 3;
  if (v24 >= v38)
  {
LABEL_35:
    result = swift_release_n(v9, 2);
    v2 = v36;
    goto LABEL_37;
  }
  v23 = *(_QWORD *)(v37 + 8 * v24);
  if (v23)
  {
    v18 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v18 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v18 >= v38)
      goto LABEL_35;
    v23 = *(_QWORD *)(v37 + 8 * v18);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_39:
  __break(1u);
  return result;
}

Swift::Int sub_100045AA0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10001283C(&qword_1000A26A8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100045D18(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100045D20(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void **v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
  v5 = sub_100012940(&qword_1000A2B70, &qword_1000A26A0, TUConversationMember_ptr);
  result = Set.init(minimumCapacity:)(v3, v4, v5);
  v15 = result;
  if (v2)
  {
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = _CocoaArrayWrapper.endIndex.getter(v8);
    result = swift_bridgeObjectRelease(a1);
    if (!v7)
      return v15;
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return v15;
  }
  if (v7 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v7; ++i)
      {
        v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_100044720((Swift::Int *)&v14, v10);

      }
    }
    else
    {
      v11 = (void **)(a1 + 32);
      do
      {
        v12 = *v11++;
        sub_100044720((Swift::Int *)&v14, v12);

        --v7;
      }
      while (v7);
    }
    return v15;
  }
  __break(1u);
  return result;
}

id sub_100046098()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MPAnalyticsLogger();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000460C8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000460F4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100046118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    v3 = sub_10001283C((uint64_t *)&unk_1000A2860);
    v2 = swift_allocObject(v3, 24, 7);
    v4 = swift_weakInit(v2 + 16, 0);
    swift_weakAssign(v4, v0);
    v5 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v2;
    swift_retain(v2);
    swift_release(v5);
    v1 = 0;
  }
  swift_retain(v1);
  return v2;
}

uint64_t sub_10004619C()
{
  uint64_t v0;
  __CFNotificationCenter *v1;
  uint64_t v3;

  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = sub_100046118();
  CFNotificationCenterRemoveEveryObserver(v1, &v3);

  swift_release(v3);
  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for PHCFNotificationCenterObserver()
{
  return objc_opt_self(_TtC8FaceTime30PHCFNotificationCenterObserver);
}

uint64_t sub_100046258(uint64_t a1)
{
  const char *v2;

  v2 = "\b";
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 88);
}

uint64_t type metadata accessor for PHCFNotificationCenterObserver.ObserverKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006668(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PHCFNotificationCenterObserver.ObserverKey);
}

char *sub_1000462A4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t (*v8)(void);
  uint64_t (*v9)(void);
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *result;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33[3];
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = dlopen("/System/Library/PrivateFrameworks/ConversationKit.framework/ConversationKit", 256);
  if (!v7)
  {
    if (qword_1000A1EF0 != -1)
      swift_once(&qword_1000A1EF0, sub_10004DDBC);
    v19 = sub_1000138F4(v2, (uint64_t)qword_1000A4A28);
    v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v19, v2);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v33[0] = v24;
      *(_DWORD *)v23 = 136315138;
      result = dlerror();
      if (!result)
      {
        __break(1u);
        return result;
      }
      v25 = String.init(cString:)();
      v27 = v26;
      v36 = (id)sub_100013E00(v25, v26, v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v23 + 4, v23 + 12);
      swift_bridgeObjectRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to load ConversationKit.framework:%s", v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);
    }

    v28 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_19:
    result = (char *)AnyView.init<A>(_:)(v28, &type metadata for EmptyView, &protocol witness table for EmptyView);
    *a1 = result;
    return result;
  }
  v8 = (uint64_t (*)(void))dlsym(v7, "clarityUIRootView_generic");
  if (!v8)
  {
    if (qword_1000A1EF0 != -1)
      swift_once(&qword_1000A1EF0, sub_10004DDBC);
    v29 = sub_1000138F4(v2, (uint64_t)qword_1000A4A28);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "No function clarityUIRootView_generic in ConversationKit.", v32, 2u);
      swift_slowDealloc(v32, -1, -1);
    }

    goto LABEL_19;
  }
  v9 = v8;
  if (qword_1000A1EF0 != -1)
    swift_once(&qword_1000A1EF0, sub_10004DDBC);
  v10 = sub_1000138F4(v2, (uint64_t)qword_1000A4A28);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Successfully soft linked ConversationKit!", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  v36 = (id)v9();
  v14 = sub_10001283C((uint64_t *)&unk_1000A2900);
  swift_dynamicCast(v33, &v36, (char *)&type metadata for Swift.AnyObject + 8, v14, 7);
  v15 = v34;
  v16 = v35;
  v17 = sub_100015268(v33, v34);
  *a1 = sub_100046664((uint64_t)v17, v15, v16);
  return (char *)sub_1000469AC(v33);
}

uint64_t sub_100046664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  __chkstk_darwin(a1, a1);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v6);
  return AnyView.init<A>(_:)(v6, a2, a3);
}

void *ClarityUISceneDelegate.window.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess(v0 + OBJC_IVAR___CNKClarityUISceneDelegate_window, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void ClarityUISceneDelegate.window.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

void *ClarityUISceneDelegate.window.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR___CNKClarityUISceneDelegate_window, a1, 33, 0);
  return &j__swift_endAccess;
}

id ClarityUISceneDelegate.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id ClarityUISceneDelegate.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___CNKClarityUISceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for ClarityUISceneDelegate()
{
  return objc_opt_self(CNKClarityUISceneDelegate);
}

id ClarityUISceneDelegate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

ValueMetadata *_s8ProviderVMa()
{
  return &_s8ProviderVN;
}

uint64_t sub_10004699C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100084604, 1);
}

uint64_t sub_1000469AC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void *sub_1000469CC()
{
  return &protocol witness table for AnyView;
}

uint64_t sub_1000469D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  _BYTE v20[40];
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[2];
  uint64_t v24;
  _OWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v2 = *(_QWORD *)(a1 + 64);
  v27 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & v2;
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v8 = 0;
  v9 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    if (v5)
    {
      v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v11 = v10 | (v8 << 6);
      goto LABEL_22;
    }
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v12 >= v6)
      goto LABEL_30;
    v13 = *(_QWORD *)(v27 + 8 * v12);
    ++v8;
    if (!v13)
    {
      v8 = v12 + 1;
      if (v12 + 1 >= v6)
        goto LABEL_30;
      v13 = *(_QWORD *)(v27 + 8 * v8);
      if (!v13)
      {
        v8 = v12 + 2;
        if (v12 + 2 >= v6)
          goto LABEL_30;
        v13 = *(_QWORD *)(v27 + 8 * v8);
        if (!v13)
        {
          v8 = v12 + 3;
          if (v12 + 3 >= v6)
            goto LABEL_30;
          v13 = *(_QWORD *)(v27 + 8 * v8);
          if (!v13)
            break;
        }
      }
    }
LABEL_21:
    v5 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_22:
    sub_100046E88(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v25);
    v23[0] = v25[0];
    v23[1] = v25[1];
    v24 = v26;
    sub_100046E88((uint64_t)v23, (uint64_t)v20);
    if ((swift_dynamicCast(&v21, v20, &type metadata for AnyHashable, &type metadata for String, 6) & 1) == 0)
    {
      v21 = 0;
      v22 = 0;
    }
    result = sub_100046EC4((uint64_t)v23);
    v15 = v22;
    if (v22)
    {
      v16 = v21;
      result = swift_isUniquelyReferenced_nonNull_native(v9);
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_10004A290(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
        v9 = (char *)result;
      }
      v18 = *((_QWORD *)v9 + 2);
      v17 = *((_QWORD *)v9 + 3);
      if (v18 >= v17 >> 1)
      {
        result = (uint64_t)sub_10004A290((char *)(v17 > 1), v18 + 1, 1, v9);
        v9 = (char *)result;
      }
      *((_QWORD *)v9 + 2) = v18 + 1;
      v19 = &v9[16 * v18];
      *((_QWORD *)v19 + 4) = v16;
      *((_QWORD *)v19 + 5) = v15;
    }
  }
  v14 = v12 + 4;
  if (v14 >= v6)
  {
LABEL_30:
    swift_release(a1);
    return (uint64_t)v9;
  }
  v13 = *(_QWORD *)(v27 + 8 * v14);
  if (v13)
  {
    v8 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    v8 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v8 >= v6)
      goto LABEL_30;
    v13 = *(_QWORD *)(v27 + 8 * v8);
    ++v14;
    if (v13)
      goto LABEL_21;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_100046C8C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

id sub_100046E30(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for SearchUtilities()
{
  return objc_opt_self(PHSearchUtilities);
}

uint64_t sub_100046E88(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100046EC4(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

void *sub_100046EF8(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSString v27;
  NSString v28;
  id v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v6 = type metadata accessor for IndexSet(0);
  v37 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  v35 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10001283C(&qword_1000A2998);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = HIBYTE(a3) & 0xF;
  v38 = a2;
  v39 = a3;
  if ((a3 & 0x2000000000000000) == 0)
    v13 = a2 & 0xFFFFFFFFFFFFLL;
  if (v13)
  {
    v14 = objc_msgSend(a1, "phoneNumbers");
    v15 = sub_10001283C(&qword_1000A29A0);
    v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);

    if ((unint64_t)v16 >> 62)
      goto LABEL_19;
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (v17)
    {
      v36 = v16 & 0xC000000000000001;
      v18 = 4;
      while (1)
      {
        v19 = v36
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18 - 4, v16)
            : *(id *)(v16 + 8 * v18);
        v20 = v19;
        v21 = v18 - 3;
        if (__OFADD__(v18 - 4, 1))
          break;
        v22 = objc_msgSend(v19, "value");
        v23 = objc_msgSend(v22, "formattedInternationalStringValue");

        if (!v23)
        {
          v24 = objc_msgSend(v20, "value");
          v23 = objc_msgSend(v24, "stringValue");

        }
        static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
        v26 = v25;

        v27 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v26);
        v28 = String._bridgeToObjectiveC()();
        v29 = objc_msgSend(v27, "indexSetToHighlightDigitsInText:", v28);

        if (v29)
        {
          v30 = v35;
          static IndexSet._unconditionallyBridgeFromObjectiveC(_:)(v29);

          v31 = v37;
          (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v12, v30, v6);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v12, 0, 1, v6);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v12, 1, v6) != 1)
          {
            sub_100047224((uint64_t)v12);
            swift_bridgeObjectRelease(v16);
            return v20;
          }
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v12, 1, 1, v6);
        }

        sub_100047224((uint64_t)v12);
        ++v18;
        if (v21 == v17)
          goto LABEL_23;
      }
      __break(1u);
LABEL_19:
      if (v16 < 0)
        v32 = v16;
      else
        v32 = v16 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v16);
      v17 = _CocoaArrayWrapper.endIndex.getter(v32);
      swift_bridgeObjectRelease(v16);
    }
LABEL_23:
    swift_bridgeObjectRelease(v16);
  }
  return 0;
}

uint64_t sub_100047224(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10001283C(&qword_1000A2998);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10004726C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_100048B98(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

BOOL sub_10004729C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000472B0()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000472F4()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10004731C(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t *sub_10004735C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_100047378(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

Swift::Int sub_100047384()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::UInt *v10;
  uint64_t v11;
  Swift::UInt v12;
  _QWORD v15[9];

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v15[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v7, v8);
  v10 = (_QWORD *)((char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)(v15, 0);
  sub_100048B54(v1, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload(v10, v7) == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v6, v10, v2);
    Hasher._combine(_:)(1uLL);
    v11 = sub_10000CC50(&qword_1000A2AA8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v15, v2, v11);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    v12 = *v10;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v12);
  }
  return Hasher._finalize()();
}

BOOL sub_1000474DC(uint64_t a1, uint64_t a2)
{
  return (sub_1000485DC(a2, a1) & 1) == 0;
}

BOOL sub_100047504(uint64_t a1, uint64_t a2)
{
  return (sub_1000485DC(a1, a2) & 1) == 0;
}

uint64_t sub_100047520(uint64_t a1, uint64_t a2)
{
  return sub_1000485DC(a2, a1);
}

void sub_100047534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  Swift::UInt *v14;
  uint64_t v15;
  Swift::UInt v16;
  uint64_t v17;

  v4 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v9 = __chkstk_darwin(v6, v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  v14 = (Swift::UInt *)((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100048B54(v4, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload(v14, a2) == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v7 + 32))(v11, v14, v6);
    Hasher._combine(_:)(1uLL);
    v15 = sub_10000CC50(&qword_1000A2AA8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(a1, v6, v15);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  else
  {
    v16 = *v14;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v16);
  }
}

Swift::Int sub_10004766C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  Swift::UInt *v14;
  uint64_t v15;
  Swift::UInt v16;
  _QWORD v19[9];

  v4 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v9 = __chkstk_darwin(v6, v8);
  v11 = (char *)&v19[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  v14 = (_QWORD *)((char *)&v19[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)(v19, a1);
  sub_100048B54(v4, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload(v14, a2) == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v7 + 32))(v11, v14, v6);
    Hasher._combine(_:)(1uLL);
    v15 = sub_10000CC50(&qword_1000A2AA8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v19, v6, v15);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  else
  {
    v16 = *v14;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v16);
  }
  return Hasher._finalize()();
}

uint64_t sub_10004781C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v6, v7);
  v9 = (_QWORD *)((char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100048B54(v0 + OBJC_IVAR___MPMessageID_value, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload(v9, v6) == 1)
  {
    v10 = (*(uint64_t (**)(char *, _QWORD *, uint64_t))(v2 + 32))(v5, v9, v1);
    v11 = UUID.uuidString.getter(v10);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    v13[1] = *v9;
    return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt, &protocol witness table for UInt);
  }
  return v11;
}

id sub_100047C6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageID(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100047CB0()
{
  return type metadata accessor for MessageID(0);
}

uint64_t type metadata accessor for MessageID(uint64_t a1)
{
  return sub_100047D4C(a1, (uint64_t *)&unk_1000A29D0, (uint64_t)&nominal type descriptor for MessageID);
}

uint64_t sub_100047CCC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for MessageID.Value(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for MessageID.Value(uint64_t a1)
{
  return sub_100047D4C(a1, qword_1000A2A50, (uint64_t)&nominal type descriptor for MessageID.Value);
}

uint64_t sub_100047D4C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100047DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t ObjectType;
  void *v5;
  char v6;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;

  ObjectType = swift_getObjectType(v2, a2);
  sub_100048BA8(a1, (uint64_t)v9);
  if (!v10)
  {
    sub_10001287C((uint64_t)v9, &qword_1000A2AB0);
    goto LABEL_5;
  }
  if ((swift_dynamicCast(&v8, v9, (char *)&type metadata for Any + 8, ObjectType, 6) & 1) == 0)
  {
LABEL_5:
    v6 = 0;
    return v6 & 1;
  }
  v5 = v8;
  v6 = sub_1000483D8((uint64_t)v8 + OBJC_IVAR___MPMessageID_value, v2 + OBJC_IVAR___MPMessageID_value);

  return v6 & 1;
}

ValueMetadata *type metadata accessor for MessageFolder()
{
  return &type metadata for MessageFolder;
}

uint64_t *sub_100047EF4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v9);
  }
  else if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t sub_100047FA8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if ((_DWORD)result == 1)
  {
    v4 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_100047FF4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_100048080(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_10004811C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for UUID(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10004811C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100048158(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_1000481E4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_10004811C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for UUID(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100048280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10004828C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10004829C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_1000482AC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

uint64_t sub_100048320()
{
  return sub_10000CC50(&qword_1000A2A88, type metadata accessor for MessageID.Value, (uint64_t)&unk_100067B84);
}

unint64_t sub_100048350()
{
  unint64_t result;

  result = qword_1000A2A90;
  if (!qword_1000A2A90)
  {
    result = swift_getWitnessTable(&unk_100067CAC, &type metadata for MessageFolder);
    atomic_store(result, (unint64_t *)&qword_1000A2A90);
  }
  return result;
}

uint64_t sub_100048394()
{
  return sub_10000CC50(&qword_1000A2A98, type metadata accessor for MessageID, (uint64_t)&protocol conformance descriptor for NSObject);
}

uint64_t sub_1000483C0(uint64_t *a1, uint64_t *a2)
{
  return sub_10004890C(*a1, *a2);
}

uint64_t sub_1000483D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MessageID.Value(0);
  v11 = __chkstk_darwin(v9, v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  v16 = (uint64_t *)((char *)&v26 - v15);
  v17 = sub_10001283C(&qword_1000A2AA0);
  v19 = __chkstk_darwin(v17, v18);
  v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = &v21[*(int *)(v19 + 48)];
  sub_100048B54(a1, (uint64_t)v21);
  sub_100048B54(a2, (uint64_t)v22);
  if (swift_getEnumCaseMultiPayload(v21, v9) != 1)
  {
    sub_100048B54((uint64_t)v21, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload(v22, v9) != 1)
    {
      v23 = *v16 == *(_QWORD *)v22;
      goto LABEL_6;
    }
LABEL_8:
    sub_10001287C((uint64_t)v21, &qword_1000A2AA0);
    v23 = 0;
    return v23 & 1;
  }
  sub_100048B54((uint64_t)v21, (uint64_t)v13);
  if (swift_getEnumCaseMultiPayload(v22, v9) != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v22, v4);
  v23 = static UUID.== infix(_:_:)(v13, v8);
  v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v8, v4);
  v24(v13, v4);
LABEL_6:
  sub_10004811C((uint64_t)v21);
  return v23 & 1;
}

uint64_t sub_1000485DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  unint64_t v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = type metadata accessor for UUID(0);
  v46 = *(_QWORD *)(v4 - 8);
  v47 = v4;
  v6 = __chkstk_darwin(v4, v5);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  v45 = (char *)&v44 - v10;
  v11 = type metadata accessor for MessageID.Value(0);
  v13 = __chkstk_darwin(v11, v12);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v13, v16);
  v19 = (char *)&v44 - v18;
  v21 = __chkstk_darwin(v17, v20);
  v23 = (char *)&v44 - v22;
  __chkstk_darwin(v21, v24);
  v26 = (unint64_t *)((char *)&v44 - v25);
  v27 = sub_10001283C(&qword_1000A2AA0);
  v29 = __chkstk_darwin(v27, v28);
  v31 = (char *)&v44 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = &v31[*(int *)(v29 + 48)];
  v48 = a1;
  sub_100048B54(a1, (uint64_t)v31);
  v49 = a2;
  sub_100048B54(a2, (uint64_t)v32);
  if (swift_getEnumCaseMultiPayload(v31, v11) == 1)
  {
    sub_100048B54((uint64_t)v31, (uint64_t)v23);
    if (swift_getEnumCaseMultiPayload(v32, v11) == 1)
    {
      v34 = v45;
      v33 = v46;
      v35 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
      v36 = v47;
      v35(v45, v23, v47);
      v35(v8, v32, v36);
      if ((static UUID.== infix(_:_:)(v34, v8) & 1) != 0)
      {
        v37 = *(void (**)(char *, uint64_t))(v33 + 8);
        v37(v8, v36);
        v37(v34, v36);
LABEL_7:
        sub_10004811C((uint64_t)v31);
        v39 = 0;
        return v39 & 1;
      }
      v39 = static UUID.< infix(_:_:)(v34, v8);
      v42 = *(void (**)(char *, uint64_t))(v33 + 8);
      v42(v8, v36);
      v42(v34, v36);
LABEL_18:
      sub_10004811C((uint64_t)v31);
      return v39 & 1;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v23, v47);
  }
  else
  {
    sub_100048B54((uint64_t)v31, (uint64_t)v26);
    v38 = *v26;
    if (swift_getEnumCaseMultiPayload(v32, v11) != 1)
    {
      if (v38 == *(_QWORD *)v32)
        goto LABEL_7;
      v39 = v38 < *(_QWORD *)v32;
      goto LABEL_18;
    }
  }
  sub_100048B54(v48, (uint64_t)v19);
  if (swift_getEnumCaseMultiPayload(v19, v11) == 1)
  {
    sub_10004811C((uint64_t)v19);
    v40 = 1;
  }
  else
  {
    v40 = 0;
  }
  sub_100048B54(v49, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload(v15, v11) == 1)
  {
    sub_10004811C((uint64_t)v15);
    v41 = 1;
  }
  else
  {
    v41 = 0;
  }
  v39 = v40 < v41;
  sub_10001287C((uint64_t)v31, &qword_1000A2AA0);
  return v39 & 1;
}

uint64_t sub_10004890C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  char v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  v7 = __chkstk_darwin(v4, v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  v12 = (char *)&v33 - v11;
  v13 = type metadata accessor for MessageID.Value(0);
  v15 = __chkstk_darwin(v13, v14);
  v17 = (uint64_t *)((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v15, v18);
  v20 = (char *)&v33 - v19;
  v21 = sub_10001283C(&qword_1000A2AA0);
  v23 = __chkstk_darwin(v21, v22);
  v25 = (char *)&v33 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = a1 + OBJC_IVAR___MPMessageID_value;
  v27 = a2 + OBJC_IVAR___MPMessageID_value;
  v28 = &v25[*(int *)(v23 + 48)];
  sub_100048B54(v26, (uint64_t)v25);
  sub_100048B54(v27, (uint64_t)v28);
  if (swift_getEnumCaseMultiPayload(v25, v13) == 1)
  {
    sub_100048B54((uint64_t)v25, (uint64_t)v20);
    if (swift_getEnumCaseMultiPayload(v28, v13) == 1)
    {
      v29 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v29(v12, v20, v4);
      v29(v9, v28, v4);
      v30 = static UUID.< infix(_:_:)(v12, v9);
      v31 = *(void (**)(char *, uint64_t))(v5 + 8);
      v31(v9, v4);
      v31(v12, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v20, v4);
      sub_10004811C((uint64_t)v28);
      v30 = 1;
    }
  }
  else
  {
    sub_100048B54((uint64_t)v25, (uint64_t)v17);
    if (swift_getEnumCaseMultiPayload(v28, v13) == 1)
    {
      sub_10004811C((uint64_t)v28);
      v30 = 0;
    }
    else
    {
      v30 = *v17 < *(_QWORD *)v28;
    }
  }
  sub_10004811C((uint64_t)v25);
  return v30 & 1;
}

uint64_t sub_100048B54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100048B98(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

uint64_t sub_100048BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10001283C(&qword_1000A2AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

unint64_t sub_100048C04()
{
  unint64_t result;

  result = qword_1000A2AB8;
  if (!qword_1000A2AB8)
  {
    result = swift_getWitnessTable(&unk_100067DA0, &type metadata for MessageType);
    atomic_store(result, (unint64_t *)&qword_1000A2AB8);
  }
  return result;
}

_QWORD *sub_100048C54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  unint64_t v33;

  v1 = a1;
  v33 = (unint64_t)&_swiftEmptyArrayStorage;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_100013580(0, &qword_1000A2B78, TUHandle_ptr);
    v5 = sub_100012940(&qword_1000A2B80, &qword_1000A2B78, TUHandle_ptr);
    result = Set.Iterator.init(_cocoa:)(v32, v3, v4, v5);
    v1 = v32[0];
    v29 = v32[1];
    v7 = v32[2];
    v8 = v32[3];
    v9 = v32[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v29 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    result = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v13 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_13;
  while (1)
  {
    if (v9)
    {
      v14 = (v9 - 1) & v9;
      v15 = __clz(__rbit64(v9)) | (v8 << 6);
      v16 = v8;
      goto LABEL_32;
    }
    v22 = v8 + 1;
    if (__OFADD__(v8, 1))
      break;
    if (v22 >= v13)
      goto LABEL_37;
    v23 = *(_QWORD *)(v29 + 8 * v22);
    v16 = v8 + 1;
    if (!v23)
    {
      v16 = v8 + 2;
      if (v8 + 2 >= v13)
        goto LABEL_37;
      v23 = *(_QWORD *)(v29 + 8 * v16);
      if (!v23)
      {
        v16 = v8 + 3;
        if (v8 + 3 >= v13)
          goto LABEL_37;
        v23 = *(_QWORD *)(v29 + 8 * v16);
        if (!v23)
        {
          v16 = v8 + 4;
          if (v8 + 4 >= v13)
            goto LABEL_37;
          v23 = *(_QWORD *)(v29 + 8 * v16);
          if (!v23)
          {
            v16 = v8 + 5;
            if (v8 + 5 >= v13)
              goto LABEL_37;
            v23 = *(_QWORD *)(v29 + 8 * v16);
            if (!v23)
            {
              v24 = v8 + 6;
              while (v13 != v24)
              {
                v23 = *(_QWORD *)(v29 + 8 * v24++);
                if (v23)
                {
                  v16 = v24 - 1;
                  goto LABEL_31;
                }
              }
LABEL_37:
              sub_100045D18(v1);
              return (_QWORD *)v33;
            }
          }
        }
      }
    }
LABEL_31:
    v14 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_32:
    v20 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v15);
    if (!v20)
      goto LABEL_37;
    while (1)
    {
      v25 = objc_msgSend((id)objc_opt_self(CNMutableContact), "contactForHandle:isoCountryCode:metadataCache:", v20, 0, 0);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v27 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v26 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v27 >= v26 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
      v28 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v25);
      result = (_QWORD *)specialized Array._endMutation()(v28);
      v8 = v16;
      v9 = v14;
      if ((v1 & 0x8000000000000000) == 0)
        break;
LABEL_13:
      v17 = __CocoaSet.Iterator.next()(result);
      if (v17)
      {
        v18 = v17;
        v30 = v17;
        v19 = sub_100013580(0, &qword_1000A2B78, TUHandle_ptr);
        swift_unknownObjectRetain(v18);
        swift_dynamicCast(&v31, &v30, (char *)&type metadata for Swift.AnyObject + 8, v19, 7);
        v20 = v31;
        swift_unknownObjectRelease(v18, v21);
        v16 = v8;
        v14 = v9;
        if (v20)
          continue;
      }
      goto LABEL_37;
    }
  }
  __break(1u);
  return result;
}

_QWORD *sub_100048F98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  void *v35;

  v1 = a1;
  v35 = &_swiftEmptyArrayStorage;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
    v5 = sub_100012940(&qword_1000A2B70, &qword_1000A26A0, TUConversationMember_ptr);
    result = Set.Iterator.init(_cocoa:)(v34, v3, v4, v5);
    v1 = v34[0];
    v31 = v34[1];
    v7 = v34[2];
    v8 = v34[3];
    v9 = v34[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v31 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    result = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v29 = v7;
  v30 = (unint64_t)(v7 + 64) >> 6;
  if ((v1 & 0x8000000000000000) == 0)
    goto LABEL_14;
  while (1)
  {
    v13 = __CocoaSet.Iterator.next()(result);
    if (!v13)
      break;
    v14 = v13;
    v32 = v13;
    v15 = sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
    swift_unknownObjectRetain(v14);
    swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v15, 7);
    v16 = v33;
    swift_unknownObjectRelease(v14, v17);
    v18 = v8;
    v19 = v9;
    if (!v16)
      break;
    while (1)
    {
      v23 = objc_msgSend(v16, "handles", v29);
      v24 = sub_100013580(0, &qword_1000A2B78, TUHandle_ptr);
      v25 = sub_100012940(&qword_1000A2B80, &qword_1000A2B78, TUHandle_ptr);
      v26 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v23, v24, v25);

      v27 = sub_100048C54(v26);
      swift_bridgeObjectRelease(v26);
      result = (_QWORD *)sub_10004A39C((uint64_t)v27);
      v8 = v18;
      v9 = v19;
      if (v1 < 0)
        break;
LABEL_14:
      if (v9)
      {
        v19 = (v9 - 1) & v9;
        v20 = __clz(__rbit64(v9)) | (v8 << 6);
        v18 = v8;
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          return result;
        }
        if (v18 >= v30)
          goto LABEL_36;
        v21 = *(_QWORD *)(v31 + 8 * v18);
        if (!v21)
        {
          v22 = v8 + 2;
          if (v8 + 2 >= v30)
            goto LABEL_36;
          v21 = *(_QWORD *)(v31 + 8 * v22);
          if (v21)
            goto LABEL_25;
          v22 = v8 + 3;
          if (v8 + 3 >= v30)
            goto LABEL_36;
          v21 = *(_QWORD *)(v31 + 8 * v22);
          if (v21)
            goto LABEL_25;
          v22 = v8 + 4;
          if (v8 + 4 >= v30)
            goto LABEL_36;
          v21 = *(_QWORD *)(v31 + 8 * v22);
          if (v21)
          {
LABEL_25:
            v18 = v22;
          }
          else
          {
            v18 = v8 + 5;
            if (v8 + 5 >= v30)
              goto LABEL_36;
            v21 = *(_QWORD *)(v31 + 8 * v18);
            if (!v21)
            {
              v28 = v8 + 6;
              while (v30 != v28)
              {
                v21 = *(_QWORD *)(v31 + 8 * v28++);
                if (v21)
                {
                  v18 = v28 - 1;
                  goto LABEL_26;
                }
              }
              goto LABEL_36;
            }
          }
        }
LABEL_26:
        v19 = (v21 - 1) & v21;
        v20 = __clz(__rbit64(v21)) + (v18 << 6);
      }
      v16 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v20);
      if (!v16)
        goto LABEL_36;
    }
  }
LABEL_36:
  sub_100045D18(v1);
  return v35;
}

void (*sub_100049318(_QWORD *a1))(void ****a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield;
  v3[6] = v1;
  v3[7] = v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  return sub_100049370;
}

void sub_100049370(void ****a1, char a2)
{
  void ***v3;
  void **v4;
  void ***v5;
  void *v6;
  void **v7;
  void *v8;
  void **v9;

  v3 = *a1;
  swift_endAccess(*a1);
  if ((a2 & 1) == 0)
  {
    v4 = v3[6];
    v5 = (void ***)((char *)v3[7] + (_QWORD)v4);
    v6 = *(void **)((char *)v4 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController);
    if (*v5)
    {
      v7 = v5[1];
      v3[4] = *v5;
      v3[5] = v7;
      *v3 = _NSConcreteStackBlock;
      v3[1] = (void **)1107296256;
      v3[2] = (void **)sub_100049444;
      v3[3] = (void **)&unk_10008ABE8;
      v8 = _Block_copy(v3);
      v9 = v3[5];
      swift_retain(v7);
      swift_release(v9);
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v6, "setPresentScreenTimeShield:", v8);
    _Block_release(v8);
  }
  free(v3);
}

uint64_t sub_100049444(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2, v6);
}

void sub_10004948C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[6];

  v2 = v1;
  if ((RecentsCallItem.isRecentCall.getter() & 1) == 0)
    goto LABEL_5;
  v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                             + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "recentCalls"));
  if (!v4)
    goto LABEL_5;
  v5 = v4;
  v6 = sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  __chkstk_darwin(v8, v9);
  v13[2] = a1;
  v10 = sub_100052B8C(sub_10004B25C, (uint64_t)v13, v7);
  swift_bridgeObjectRelease(v7);
  if (v10)
  {
    sub_1000495A0(v10);
  }
  else
  {
LABEL_5:
    v11 = RecentsCallItem.handleForMailCallback.getter();
    if (!v11)
      return;
    v10 = (void *)v11;
    v12 = RecentsCallItem.hasAudioMessage.getter(v11);
    sub_100049694((uint64_t)v10, v12 & 1);
  }

}

id sub_1000495A0(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;

  v3 = objc_msgSend(a1, "remoteParticipantHandles");
  if (!v3)
    goto LABEL_10;
  v4 = v3;
  v5 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
  v6 = sub_100012940((unint64_t *)&qword_1000A3490, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v4, v5, v6);

  if ((v7 & 0xC000000000000001) != 0)
  {
    v8 = v7 < 0 ? v7 : v7 & 0xFFFFFFFFFFFFFF8;
    v9 = __CocoaSet.count.getter(v8);
  }
  else
  {
    v9 = *(_QWORD *)(v7 + 16);
  }
  swift_bridgeObjectRelease(v7);
  if (v9 > 1)
    v10 = &selRef_performJoinRequestForRecentCall_;
  else
LABEL_10:
    v10 = &selRef_performDialRequestForRecentCall_;
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), *v10, a1);
}

void sub_100049694(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t inited;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  Class isa;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Class v19;
  uint64_t v20;
  void (*v21)(void);
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27[3];
  _BYTE v28[40];

  v3 = v2;
  v6 = sub_10001283C((uint64_t *)&unk_1000A3190);
  inited = swift_initStackObject(v6, v28);
  *(_OWORD *)(inited + 16) = xmmword_100067DD0;
  v8 = objc_msgSend(objc_allocWithZone((Class)TUConversationMember), "initWithHandle:", a1);
  *(_QWORD *)(inited + 32) = v8;
  v27[0] = inited;
  specialized Array._endMutation()(v8);
  v9 = inited;
  v10 = sub_100045D20(inited);
  swift_bridgeObjectRelease(v9);
  v11 = objc_allocWithZone((Class)TUJoinConversationRequest);
  sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
  sub_100012940(&qword_1000A2B70, &qword_1000A26A0, TUConversationMember_ptr);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  v13 = objc_msgSend(v11, "initWithRemoteMembers:", isa);

  if ((a2 & 1) != 0)
    v14 = 1;
  else
    v14 = 2;
  objc_msgSend(v13, "setAvMode:", v14, v27[0]);
  objc_msgSend(v13, "setVideoEnabled:", (a2 & 1) == 0);
  objc_msgSend(v13, "setOriginatingUIType:", 14);
  v15 = objc_msgSend((id)objc_opt_self(TUCallProviderManager), "invitationPreferencesForRecentCall");
  v16 = sub_100013580(0, &qword_1000A2C00, TUConversationInvitationPreference_ptr);
  v17 = sub_100012940(&qword_1000A2C08, &qword_1000A2C00, TUConversationInvitationPreference_ptr);
  v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v15, v16, v17);

  v19 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  objc_msgSend(v13, "setInvitationPreferences:", v19);

  v20 = v3 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield;
  swift_beginAccess(v3 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield, v27, 0, 0);
  v21 = *(void (**)(void))v20;
  if (!*(_QWORD *)v20)
    goto LABEL_8;
  v22 = *(_QWORD *)(v20 + 8);
  v23 = (void *)objc_opt_self(TUCallCenter);
  swift_retain(v22);
  v24 = objc_msgSend(v23, "sharedInstance");
  v25 = objc_msgSend(v24, "callFilterController");

  LODWORD(v24) = objc_msgSend(v25, "shouldRestrictJoinConversationRequest:performSynchronously:", v13, 1);
  if (!(_DWORD)v24)
  {
    sub_10000A730((uint64_t)v21, v22);
LABEL_8:
    v26 = objc_msgSend((id)objc_opt_self(TUCallCenter), "sharedInstance");
    objc_msgSend(v26, "launchAppForJoinRequest:", v13);

    goto LABEL_9;
  }
  v26 = v13;
  v21();

  sub_10000A730((uint64_t)v21, v22);
LABEL_9:

}

id sub_1000499AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  if (qword_1000A1ED8 != -1)
    swift_once(&qword_1000A1ED8, sub_100015D74);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_1000138F4(v2, (uint64_t)qword_1000A49F0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Deleting all recent calls (PHRecentsController)", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "deleteAllRecentCalls");
}

void sub_100049A90(uint64_t a1)
{
  void *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  Class isa;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v1;
  v4 = (uint64_t)sub_10004AD0C(a1, (uint64_t)v3);

  if (qword_1000A1ED8 != -1)
    swift_once(&qword_1000A1ED8, sub_100015D74);
  v5 = type metadata accessor for Logger(0);
  sub_1000138F4(v5, (uint64_t)qword_1000A49F0);
  v6 = swift_bridgeObjectRetain_n(v4, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v9 = 134217984;
    if ((unint64_t)v4 >> 62)
    {
      if (v4 < 0)
        v13 = v4;
      else
        v13 = v4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v4);
      v10 = _CocoaArrayWrapper.endIndex.getter(v13);
      swift_bridgeObjectRelease(v4);
    }
    else
    {
      v10 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v4);
    v14 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "filtered recent calls. deleting recent calls %ld", v9, 0xCu);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v4, 2);
  }
  v11 = *(void **)&v3[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController];
  sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v11, "deleteRecentCalls:", isa);

}

void sub_100049C74()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController), "recentCalls"));
  if (!v1)
    return;
  v2 = sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0)
      v23 = v3;
    else
      v23 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v23);
    swift_bridgeObjectRelease(v3);
    if (v4)
      goto LABEL_4;
LABEL_28:
    swift_bridgeObjectRelease(v3);
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
      goto LABEL_32;
    goto LABEL_29;
  }
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    goto LABEL_28;
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  v5 = 0;
  v6 = kCHServiceProviderFaceTime;
  do
  {
    if ((v3 & 0xC000000000000001) != 0)
      v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v3);
    else
      v9 = *(id *)(v3 + 8 * v5 + 32);
    v10 = v9;
    v11 = objc_msgSend(v9, "serviceProvider");
    if (!v11)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      v8 = v7;
LABEL_7:

      swift_bridgeObjectRelease(v8);
      goto LABEL_8;
    }
    v12 = v11;
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v15 = v14;

    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v8 = v17;
    if (!v15)
      goto LABEL_7;
    if (v13 == v16 && v15 == v17)
    {
      v20 = swift_bridgeObjectRelease_n(v15, 2);
    }
    else
    {
      v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16, v17, 0);
      swift_bridgeObjectRelease(v15);
      v20 = swift_bridgeObjectRelease(v8);
      if ((v19 & 1) == 0)
      {

        goto LABEL_8;
      }
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v20);
    v21 = _swiftEmptyArrayStorage[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v21);
    v22 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v10);
    specialized ContiguousArray._endMutation()(v22);
LABEL_8:
    ++v5;
  }
  while (v4 != v5);
  swift_bridgeObjectRelease(v3);
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_32:
    v24 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
    _CocoaArrayWrapper.endIndex.getter(v24);
    swift_release(_swiftEmptyArrayStorage);
    goto LABEL_30;
  }
LABEL_29:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
    goto LABEL_32;
LABEL_30:
  swift_release(_swiftEmptyArrayStorage);
}

id sub_100049F08()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecentCallProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100049F8C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = *v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate;
  swift_beginAccess(v3, v5, 0, 0);
  return sub_10004B214(v3, a1);
}

uint64_t sub_100049FE0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = *v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate;
  swift_beginAccess(v3, v5, 33, 0);
  sub_10004B1CC(a1, v3);
  return swift_endAccess(v5);
}

void *sub_10004A03C(uint64_t a1)
{
  _QWORD *v1;

  swift_beginAccess(*v1 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_10004A084()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield);
  swift_beginAccess(v1, v4, 0, 0);
  v2 = *v1;
  sub_1000156C8(*v1, v1[1]);
  return v2;
}

uint64_t sub_10004A0E0(uint64_t a1, uint64_t a2)
{
  sub_10004B0C8(a1, a2);
  return sub_10000A730(a1, a2);
}

void (*sub_10004A118(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100049318(v2);
  return sub_10004A160;
}

_QWORD *sub_10004A164(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = objc_msgSend(a1, "mergedRemoteMembers");
  v2 = sub_100013580(0, &qword_1000A26A0, TUConversationMember_ptr);
  v3 = sub_100012940(&qword_1000A2B70, &qword_1000A26A0, TUConversationMember_ptr);
  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, v3);

  v5 = sub_100048F98(v4);
  swift_bridgeObjectRelease(v4);
  return v5;
}

void sub_10004A210(uint64_t a1)
{
  sub_10004948C(a1);
}

id sub_10004A230()
{
  return sub_1000499AC();
}

void sub_10004A250(uint64_t a1)
{
  sub_100049A90(a1);
}

void sub_10004A270()
{
  sub_100049C74();
}

char *sub_10004A290(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_10001283C((uint64_t *)&unk_1000A2C10);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10004AC1C(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10004A39C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10004A9C8(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

unint64_t sub_10004A554(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10004A618(a1, a2, v5);
}

unint64_t sub_10004A5B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10004A6F8(a1, v4);
}

unint64_t sub_10004A5E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10004A7BC(a1, v4);
}

unint64_t sub_10004A618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10004A6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_100046E88(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100046EC4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10004A7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

void (*sub_10004A8D4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10004A954(v6, a2, a3);
  return sub_10004A160;
}

void sub_10004A928(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10004A954(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_10004A9C0;
  }
  __break(1u);
  return result;
}

void sub_10004A9C0(id *a1)
{

}

uint64_t sub_10004A9C8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10004ABD0();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10001283C(&qword_1000A2B90);
          v13 = sub_10004A8D4(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100013580(0, &qword_1000A2B88, CNContact_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_10004ABD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A2B98;
  if (!qword_1000A2B98)
  {
    v1 = sub_10001528C(&qword_1000A2B90);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000A2B98);
  }
  return result;
}

uint64_t sub_10004AC1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

id sub_10004AD0C(uint64_t a1, uint64_t a2)
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD v47[2];
  unint64_t v48;

  result = &_swiftEmptyArrayStorage;
  v48 = (unint64_t)&_swiftEmptyArrayStorage;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    type metadata accessor for RecentsCallItem(0);
    v41 = OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController;
    v39 = a1;
    v5 = swift_bridgeObjectRetain(a1);
    v6 = 0;
    v40 = v4;
    while (1)
    {
      v43 = v6;
      if ((RecentsCallItem.isRecentCall.getter(v5) & 1) == 0)
        goto LABEL_34;
      v10 = objc_msgSend(*(id *)(a2 + v41), "recentCalls", v39);
      if (!v10)
        goto LABEL_34;
      v11 = v10;
      v12 = sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
      v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

      if ((unint64_t)v13 >> 62)
      {
        if (v13 < 0)
          v32 = v13;
        else
          v32 = v13 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v13);
        v14 = _CocoaArrayWrapper.endIndex.getter(v32);
        if (!v14)
        {
LABEL_33:
          swift_bridgeObjectRelease_n(v13, 2);
          v4 = v40;
LABEL_34:
          if (qword_1000A1EE8 != -1)
            swift_once(&qword_1000A1EE8, sub_10004DD24);
          v33 = qword_1000A4A20;
          v34 = sub_10001283C(&qword_1000A26E0);
          v35 = swift_allocObject(v34, 72, 7);
          *(_OWORD *)(v35 + 16) = xmmword_100067A10;
          v36 = RecentsCallItem.callUniqueId.getter();
          if (v37)
          {
            v47[0] = v36;
            v47[1] = v37;
            v8 = String.init<A>(reflecting:)(v47, &type metadata for String);
            v7 = v38;
          }
          else
          {
            v7 = 0xE300000000000000;
            v8 = 7104878;
          }
          *(_QWORD *)(v35 + 56) = &type metadata for String;
          *(_QWORD *)(v35 + 64) = sub_100015724();
          *(_QWORD *)(v35 + 32) = v8;
          *(_QWORD *)(v35 + 40) = v7;
          v9 = static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)("Could not retrieve recentCall for item %@", 41, 2, &_mh_execute_header, v33, v9, v35);
          v5 = swift_bridgeObjectRelease(v35);
          goto LABEL_5;
        }
      }
      else
      {
        v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v13);
        if (!v14)
          goto LABEL_33;
      }
      v45 = v13;
      v46 = v13 & 0xC000000000000001;
      v15 = 4;
      v44 = v14;
      while (1)
      {
        if (v46)
          result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15 - 4, v13);
        else
          result = *(id *)(v13 + 8 * v15);
        v16 = result;
        v17 = v15 - 3;
        if (__OFADD__(v15 - 4, 1))
        {
          __break(1u);
          return result;
        }
        v18 = RecentsCallItem.callUniqueId.getter();
        v20 = v19;
        v21 = objc_msgSend(v16, "uniqueId");
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
        v24 = v23;

        if (v20)
          break;

        swift_bridgeObjectRelease(v24);
LABEL_12:
        ++v15;
        v13 = v45;
        if (v17 == v44)
          goto LABEL_33;
      }
      if (v18 == v22 && v20 == v24)
      {
        swift_bridgeObjectRelease_n(v45, 2);
        v27 = v20;
        goto LABEL_26;
      }
      v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v22, v24, 0);
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(v24);
      if ((v26 & 1) == 0)
        break;
      v24 = v45;
      v27 = v45;
LABEL_26:
      swift_bridgeObjectRelease(v27);
      v4 = v40;
      v28 = swift_bridgeObjectRelease(v24);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v28);
      v30 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v29 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v30 >= v29 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1);
      v31 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v16);
      v5 = specialized Array._endMutation()(v31);
LABEL_5:
      v6 = v43 + 1;
      if (v43 + 1 == v4)
      {
        swift_bridgeObjectRelease(v39);
        return (id)v48;
      }
    }

    goto LABEL_12;
  }
  return result;
}

void sub_10004B0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD aBlock[5];
  uint64_t v14;
  char v15[24];

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield);
  swift_beginAccess(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield, v15, 1, 0);
  v6 = *v5;
  v7 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  sub_1000156C8(a1, a2);
  sub_10000A730(v6, v7);
  v8 = *(void **)(v2 + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController);
  v9 = *v5;
  if (*v5)
  {
    v10 = v5[1];
    aBlock[4] = v9;
    v14 = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100049444;
    aBlock[3] = &unk_10008ABC0;
    v11 = _Block_copy(aBlock);
    v12 = v14;
    swift_retain(v10);
    swift_release(v12);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v8, "setPresentScreenTimeShield:", v11);
  _Block_release(v11);
}

uint64_t sub_10004B1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10001283C((uint64_t *)&unk_1000A2BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004B214(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10001283C((uint64_t *)&unk_1000A2BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004B25C(void **a1)
{
  return sub_10004DEB0(a1) & 1;
}

uint64_t sub_10004B278(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10004B2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  _BYTE v8[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    v7 = *(void (**)(uint64_t))(result + 16);
    v6 = *(_QWORD *)(result + 24);
    sub_1000156C8((uint64_t)v7, v6);
    result = swift_release(v5);
    if (v7)
    {
      v7(a1);
      return sub_10000A730((uint64_t)v7, v6);
    }
  }
  return result;
}

uint64_t sub_10004B348()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  objc_msgSend(v1, "setOrientationEventsEnabled:", 0);
  objc_msgSend(v1, "setPassiveOrientationEvents:", 1);
  objc_msgSend(v1, "setDelegate:", 0);
  sub_10000A730(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return swift_deallocClassInstance(v0, 48, 7);
}

id sub_10004B3C4()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_accelerometer], "setDelegate:", 0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccelerometerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10004B53C(unint64_t a1)
{
  uint64_t v1;

  if (a1 >= 7)
    a1 = 1;
  return (*(uint64_t (**)(unint64_t))(v1
                                                     + OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_onOrientationChange))(a1);
}

uint64_t sub_10004B570()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004B594(uint64_t a1)
{
  uint64_t v1;

  return sub_10004B2C4(a1, v1);
}

id sub_10004B618()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTPreferences();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FTPreferences()
{
  return objc_opt_self(_TtC8FaceTime13FTPreferences);
}

void sub_10004B7A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;

  v1 = v0;
  if (qword_1000A1EC8 != -1)
    swift_once(&qword_1000A1EC8, sub_10000702C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_1000138F4(v2, (uint64_t)qword_1000A2E00);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Destroying RecentsListViewController", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = *(void **)(v1 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  *(_QWORD *)(v1 + OBJC_IVAR___FTRecentsContainerViewController_recentsList) = 0;

  sub_100008264();
}

void sub_10004BA0C()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v1 = (void *)objc_opt_self(CHRecentCall);
  v2 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v1, "predicateForCallsWithUniqueID:", v2);

  v3 = objc_msgSend(objc_allocWithZone((Class)CHManager), "init");
  v4 = objc_msgSend(v3, "callsWithPredicate:limit:offset:batchSize:", v14, 0, 0, 0);

  v5 = sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  if (!((unint64_t)v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_14:

    swift_bridgeObjectRelease(v6);
    return;
  }
  if (v6 < 0)
    v12 = v6;
  else
    v12 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v6);
  v13 = _CocoaArrayWrapper.endIndex.getter(v12);
  swift_bridgeObjectRelease(v6);
  if (!v13)
    goto LABEL_14;
LABEL_3:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v6);
  }
  else
  {
    if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v7 = *(id *)(v6 + 32);
  }
  v8 = v7;
  swift_bridgeObjectRelease(v6);
  v9 = *(void **)(v0 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    RecentsListViewController.presentDetailsView(for:)(v10);

  }
  else
  {

  }
}

id sub_10004BC84(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v5;
  NSString v7;
  id v8;
  objc_super v10;

  v5 = &v3[OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR___FTRecentsContainerViewController_recentsList] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___FTRecentsContainerViewController_content] = 0;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for RecentsContainerViewController();
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_10004BD94()
{
  return sub_1000426C4(type metadata accessor for RecentsContainerViewController);
}

id sub_10004BF20()
{
  return sub_1000426C4(type metadata accessor for RemoteRecentsContainerViewController);
}

uint64_t type metadata accessor for RemoteRecentsContainerViewController()
{
  return objc_opt_self(FTRemoteRecentsContainerViewController);
}

void sub_10004BF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = (uint64_t *)(v2 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield + 8);
  *v3 = a1;
  v3[1] = a2;
  sub_1000156C8(a1, a2);
  sub_10000A730(v4, v5);
  v6 = *(void **)(v2 + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  if (v6)
  {
    v7 = *v3;
    v8 = v3[1];
    v9 = v6;
    sub_1000156C8(v7, v8);
    dispatch thunk of RecentsListViewController.presentScreenTimeShield.setter(v7, v8);

  }
}

uint64_t sub_10004BFE8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004C00C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

_QWORD *sub_10004C01C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_10004C04C(uint64_t a1)
{
  void *v1;
  NSString v2;
  id v3;
  id v4;
  double v5;
  double v6;
  id v7;
  id v8;
  uint64_t result;
  uint64_t v10;

  if (*(_QWORD *)(a1 + OBJC_IVAR___PHDialerContactResultButtonView_type) > 1uLL)
  {
    v10 = *(_QWORD *)(a1 + OBJC_IVAR___PHDialerContactResultButtonView_type);
    result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for DialerContactResultButtonType, &v10, &type metadata for DialerContactResultButtonType, &type metadata for Int);
    __break(1u);
  }
  else
  {
    v1 = (void *)objc_opt_self(UIImage);
    v2 = String._bridgeToObjectiveC()();
    v3 = objc_msgSend(v1, "__systemImageNamedSwift:", v2);

    v4 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v3);
    LODWORD(v5) = 1148846080;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    LODWORD(v6) = 1148846080;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v6);
    v7 = objc_msgSend((id)objc_opt_self(UIColor), "dynamicLabelColor");
    objc_msgSend(v4, "setTintColor:", v7);

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = v4;
    objc_msgSend(v8, "setContentMode:", 4);

    return (uint64_t)v8;
  }
  return result;
}

id sub_10004C234()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel;
  v2 = *(void **)(v0 + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel);
  }
  else
  {
    v4 = sub_10004C2C4();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_10004C2C4()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v1 = (void *)objc_opt_self(UIColor);
  v2 = v0;
  v3 = objc_msgSend(v1, "clearColor");
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 18.0);
  v5 = objc_msgSend(v4, "withCaseSensitiveAttribute");

  objc_msgSend(v2, "setFont:", v5);
  objc_msgSend(v2, "setAdjustsFontForContentSizeCategory:", 0);
  return v2;
}

id sub_10004C3D4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel;
  v2 = *(void **)(v0 + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel);
  v3 = v2;
  if (v2 == (void *)1)
  {
    v3 = sub_10004C440(v0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;
    sub_10004DBC4(v4);
  }
  sub_10004DBD4(v2);
  return v3;
}

id sub_10004C440(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + OBJC_IVAR___PHDialerContactResultButtonView_type))
    return 0;
  v2 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_opt_self(UIColor);
  v1 = v2;
  v4 = objc_msgSend(v3, "clearColor");
  objc_msgSend(v1, "setBackgroundColor:", v4);

  v5 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 18.0);
  v6 = objc_msgSend(v5, "withCaseSensitiveAttribute");

  objc_msgSend(v1, "setFont:", v6);
  objc_msgSend(v1, "setAdjustsFontForContentSizeCategory:", 0);
  return v1;
}

id sub_10004C568(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2(v2);
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_10004C5C4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  Class isa;
  id v8;
  id v9;

  v2 = sub_10001283C((uint64_t *)&unk_1000A3190);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_100067FB0;
  *(_QWORD *)(v3 + 32) = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10004C04C);
  v4 = sub_10004C234();
  *(_QWORD *)(v3 + 40) = v4;
  specialized Array._endMutation()(v4);
  v5 = v3;
  v6 = objc_allocWithZone((Class)UIStackView);
  sub_100013580(0, &qword_1000A2F98, UIView_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  v8 = objc_msgSend(v6, "initWithArrangedSubviews:", isa);

  objc_msgSend(v8, "setAxis:", 0);
  objc_msgSend(v8, "setSpacing:", 0.0);
  objc_msgSend(v8, "setAlignment:", 3);
  objc_msgSend(v8, "setDistribution:", 0);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10004C04C);
  objc_msgSend(v8, "setCustomSpacing:afterView:", v9, 8.0);

  objc_msgSend(a1, "addSubview:", v8);
  return v8;
}

id sub_10004C764(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  objc_super v22;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v3, a2);
  v6 = OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding;
  v7 = (void *)objc_opt_self(TPNumberPadButton);
  v8 = v3;
  objc_msgSend(v7, "horizontalPadding");
  *(_QWORD *)&v3[v6] = v9;
  *(_QWORD *)&v8[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel] = 1;
  Logger.init(subsystem:category:)(0xD000000000000015, 0x800000010006BC30, 0xD000000000000019, 0x800000010006BC50);
  *(_QWORD *)&v8[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___PHDialerContactResultButtonView_type] = a1;

  v22.receiver = v8;
  v22.super_class = ObjectType;
  v10 = objc_msgSendSuper2(&v22, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v11 = (void *)objc_opt_self(UIColor);
  v12 = v10;
  v13 = objc_msgSend(v11, "clearColor");
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = sub_10004C3D4();
  if (v14)
  {
    v15 = v14;
    v16 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10004C5C4);
    objc_msgSend(v16, "addArrangedSubview:", v15);

  }
  sub_10004CA00();
  v17 = objc_msgSend(v12, "traitCollection");
  v18 = objc_msgSend(v17, "preferredContentSizeCategory");

  v19 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10004C04C);
  objc_msgSend(v19, "setHidden:", UIContentSizeCategory.isAccessibilityCategory.getter(v18) & 1);

  v20 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v20, "addObserver:selector:name:object:", v12, "handleContentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  return v12;
}

void sub_10004CA00()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  Class isa;

  v1 = sub_10001283C((uint64_t *)&unk_1000A3190);
  v2 = swift_allocObject(v1, 80, 7);
  *(_OWORD *)(v2 + 16) = xmmword_100067FC0;
  v3 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10004C5C4);
  v4 = objc_msgSend(v3, "leadingAnchor");

  v5 = objc_msgSend(v0, "leadingAnchor");
  v6 = OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding;
  v7 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, *(double *)&v0[OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding]);

  *(_QWORD *)(v2 + 32) = v7;
  v8 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10004C5C4);
  v9 = objc_msgSend(v8, "trailingAnchor");

  v10 = objc_msgSend(v0, "trailingAnchor");
  v11 = objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:constant:", v10, -*(double *)&v0[v6]);

  *(_QWORD *)(v2 + 40) = v11;
  v12 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10004C5C4);
  v13 = objc_msgSend(v12, "topAnchor");

  v14 = objc_msgSend(v0, "topAnchor");
  v15 = objc_msgSend(v13, "constraintEqualToAnchor:", v14);

  *(_QWORD *)(v2 + 48) = v15;
  v16 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10004C5C4);
  v17 = objc_msgSend(v16, "bottomAnchor");

  v18 = objc_msgSend(v0, "bottomAnchor");
  v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);

  *(_QWORD *)(v2 + 56) = v19;
  v20 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10004C5C4);
  v21 = objc_msgSend(v20, "heightAnchor");

  v22 = objc_msgSend(v21, "constraintEqualToConstant:", 22.0);
  *(_QWORD *)(v2 + 64) = v22;
  v23 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10004C04C);
  v24 = objc_msgSend(v23, "widthAnchor");

  v25 = objc_msgSend(v24, "constraintGreaterThanOrEqualToConstant:", 27.0);
  *(_QWORD *)(v2 + 72) = v25;
  specialized Array._endMutation()(v26);
  v27 = (void *)objc_opt_self(NSLayoutConstraint);
  sub_100013580(0, (unint64_t *)&qword_1000A2530, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  objc_msgSend(v27, "activateConstraints:", isa);

}

void sub_10004CDD0(void *a1, float a2, float a3)
{
  id v5;
  double v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  id v11;

  v11 = a1;
  v5 = sub_10004C234();
  *(float *)&v6 = a2;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v6);

  v7 = sub_10004C3D4();
  if (v7)
  {
    v9 = v7;
    *(float *)&v8 = a3;
    objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);

    v10 = v9;
  }
  else
  {
    v10 = v11;
  }

}

void sub_10004CEF8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double Width;
  uint64_t v28;
  id v29;
  NSString v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  int v37;
  char *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  Class isa;
  id v44;
  NSString v45;
  NSString v46;
  id v47;
  id v48;
  NSString v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  char *v58;
  id v59;
  uint64_t v60;
  CGRect v61;

  v60 = a2;
  v5 = type metadata accessor for PersonNameComponents(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10001283C(&qword_1000A2F90);
  v12 = __chkstk_darwin(v10, v11);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v12, v15);
  v18 = (char *)&v57 - v17;
  __chkstk_darwin(v16, v19);
  v21 = (char *)&v57 - v20;
  v22 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView, (uint64_t (*)(uint64_t))sub_10004C5C4);
  objc_msgSend(v22, "layoutIfNeeded");

  v23 = sub_10004C3D4();
  if (v23)
  {
    v24 = v23;
    objc_msgSend(v23, "sizeThatFits:", 0.0, 0.0);
    v26 = v25;
    objc_msgSend(v24, "frame");
    Width = CGRectGetWidth(v61);

    if (Width < v26)
    {
      v58 = v9;
      v28 = a3;
      v29 = objc_msgSend(objc_allocWithZone((Class)NSPersonNameComponentsFormatter), "init");
      v30 = objc_msgSend(a1, "string");
      if (!v30)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v32 = v31;
        v30 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v32);
      }
      v59 = v29;
      v33 = objc_msgSend(v29, "personNameComponentsFromString:", v30);

      if (v33)
      {
        static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)(v33);

        v34 = 0;
      }
      else
      {
        v34 = 1;
      }
      v35 = v28;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v18, v34, 1, v5);
      sub_10004DBE4((uint64_t)v18, (uint64_t)v21);
      v36 = v59;
      objc_msgSend(v59, "setStyle:", 1);
      sub_1000128B8((uint64_t)v21, (uint64_t)v14, &qword_1000A2F90);
      v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v14, 1, v5);
      v38 = v58;
      if (v37 == 1)
      {
        sub_10001287C((uint64_t)v21, &qword_1000A2F90);

        v21 = v14;
LABEL_18:
        sub_10001287C((uint64_t)v21, &qword_1000A2F90);
        return;
      }
      v39 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v58, v14, v5);
      v40 = Logger.logObject.getter(v39);
      v41 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "DialerContactResultButtonView: Using Short name as the number is being truncated", v42, 2u);
        swift_slowDealloc(v42, -1, -1);
      }

      isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
      v44 = objc_msgSend(v36, "stringFromPersonNameComponents:", isa);

      v45 = v44;
      v46 = v44;
      if (v44)
      {
        if (v35)
        {
LABEL_14:
          v47 = v44;

          v48 = sub_10004C234();
          v49 = String._bridgeToObjectiveC()();
          v50 = objc_msgSend(v46, "attributedStringToHighlightText:style:", v49, 1);

LABEL_17:
          objc_msgSend(v48, "setAttributedText:", v50);

          (*(void (**)(char *, uint64_t))(v6 + 8))(v38, v5);
          goto LABEL_18;
        }
      }
      else
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v52 = v51;
        v46 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v52);
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v54 = v53;
        v45 = String._bridgeToObjectiveC()();
        v55 = v54;
        v36 = v59;
        swift_bridgeObjectRelease(v55);
        if (v35)
          goto LABEL_14;
      }
      v56 = v44;

      v48 = sub_10004C234();
      v49 = String._bridgeToObjectiveC()();
      v50 = objc_msgSend(v45, "attributedStringToHighlightText:", v49);

      goto LABEL_17;
    }
  }
}

void sub_10004D384(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = sub_10004C234();
  v12 = v10;
  if ((a5 & 1) != 0)
  {
    LODWORD(v11) = 1144750080;
    objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v11);

    v13 = sub_10004C3D4();
    if (!v13)
      goto LABEL_7;
    v15 = v13;
    v16 = 1148846080;
  }
  else
  {
    LODWORD(v11) = 1148846080;
    objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v11);

    v17 = sub_10004C3D4();
    if (!v17)
      goto LABEL_7;
    v15 = v17;
    v16 = 1144750080;
  }
  LODWORD(v14) = v16;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 0, v14);

LABEL_7:
  v18 = sub_10004C234();
  objc_msgSend(v18, "setAttributedText:", a1);

  v19 = sub_10004C3D4();
  objc_msgSend(v19, "setAttributedText:", a2);

  if (a1)
  {
    v20 = a1;
    sub_10004CEF8(v20, a3, a4);

  }
}

void sub_10004D56C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[2];
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;

  v2 = sub_10001283C(&qword_1000A2F88);
  __chkstk_darwin(v2, v3);
  v5 = (char *)&v16[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000128B8(a1, (uint64_t)v5, &qword_1000A2F88);
  v6 = type metadata accessor for Notification(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_10001287C((uint64_t)v5, &qword_1000A2F88);
LABEL_7:
    v18 = 0u;
    v19 = 0u;
LABEL_8:
    sub_10001287C((uint64_t)&v18, &qword_1000A2AB0);
    return;
  }
  v8 = Notification.userInfo.getter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  if (!v8)
    goto LABEL_7;
  v16[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryNewValueKey);
  v16[1] = v9;
  AnyHashable.init<A>(_:)(v17, v16, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v8 + 16) && (v10 = sub_10004A5B8((uint64_t)v17), (v11 & 1) != 0))
  {
    sub_100013ED0(*(_QWORD *)(v8 + 56) + 32 * v10, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease(v8);
  sub_100046EC4((uint64_t)v17);
  if (!*((_QWORD *)&v19 + 1))
    goto LABEL_8;
  type metadata accessor for UIContentSizeCategory(0);
  if ((swift_dynamicCast(v17, &v18, (char *)&type metadata for Any + 8, v12, 6) & 1) != 0)
  {
    v13 = (void *)v17[0];
    v14 = sub_10004C568(&OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView, sub_10004C04C);
    objc_msgSend(v14, "setHidden:", UIContentSizeCategory.isAccessibilityCategory.getter(v13) & 1);

  }
}

uint64_t sub_10004D8A0()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  Swift::String v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String v14;

  v0 = (void *)0xE000000000000000;
  v1 = sub_10004C234();
  v2 = objc_msgSend(v1, "attributedText");

  if (v2)
  {
    v3 = objc_msgSend(v2, "string");

    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v0 = v5;

  }
  else
  {
    v4 = 0;
  }
  v6._countAndFlagsBits = v4;
  v6._object = v0;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(v0);
  v7 = sub_10004C3D4();
  if (v7
    && (v8 = v7, v9 = objc_msgSend(v7, "attributedText"), v8, v9))
  {
    v10 = objc_msgSend(v9, "string");

    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = (void *)0xE000000000000000;
  }
  v14._countAndFlagsBits = v11;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v13);
  return 0;
}

uint64_t sub_10004DA94()
{
  return type metadata accessor for DialerContactResultButtonView(0);
}

uint64_t type metadata accessor for DialerContactResultButtonView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000A2F70;
  if (!qword_1000A2F70)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DialerContactResultButtonView);
  return result;
}

uint64_t sub_10004DAD8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[2] = "\b";
  v4[3] = "\b";
  v4[4] = &unk_100068008;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    v4[6] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DialerContactResultButtonType()
{
  return &type metadata for DialerContactResultButtonType;
}

unint64_t sub_10004DB80()
{
  unint64_t result;

  result = qword_1000A2F80;
  if (!qword_1000A2F80)
  {
    result = swift_getWitnessTable(&unk_1000680B8, &type metadata for DialerContactResultButtonType);
    atomic_store(result, (unint64_t *)&qword_1000A2F80);
  }
  return result;
}

void sub_10004DBC4(id a1)
{
  if (a1 != (id)1)

}

id sub_10004DBD4(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_10004DBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10001283C(&qword_1000A2F90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10004DC2C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR___PHDialerContactResultButtonView_horizontalPadding;
  objc_msgSend((id)objc_opt_self(TPNumberPadButton), "horizontalPadding");
  *(_QWORD *)&v0[v1] = v2;
  *(_QWORD *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel] = 1;
  Logger.init(subsystem:category:)(0xD000000000000015, 0x800000010006BC30, 0xD000000000000019, 0x800000010006BC50);
  *(_QWORD *)&v0[OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010006BCA0, "FaceTime/DialerContactResultButtonView.swift", 44, 2, 101, 0);
  __break(1u);
}

uint64_t sub_10004DD24()
{
  uint64_t result;

  sub_10004DD80();
  result = OS_os_log.init(subsystem:category:)(0xD000000000000018, 0x800000010006BCF0, 0x746C7561666544, 0xE700000000000000);
  qword_1000A4A20 = result;
  return result;
}

unint64_t sub_10004DD80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A26F8;
  if (!qword_1000A26F8)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000A26F8);
  }
  return result;
}

uint64_t sub_10004DDBC()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100008758(v0, qword_1000A4A28);
  sub_1000138F4(v0, (uint64_t)qword_1000A4A28);
  return Logger.init(subsystem:category:)(0xD00000000000001DLL, 0x800000010006BD10, 0x5579746972616C43, 0xE900000000000049);
}

uint64_t sub_10004DE34()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100008758(v0, qword_1000A4A40);
  sub_1000138F4(v0, (uint64_t)qword_1000A4A40);
  return Logger.init(subsystem:category:)(0xD000000000000018, 0x800000010006BCF0, 0x67656C6544707041, 0xEB00000000657461);
}

uint64_t sub_10004DEB0(void **a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v1 = *a1;
  v2 = RecentsCallItem.callUniqueId.getter();
  v4 = v3;
  v5 = objc_msgSend(v1, "uniqueId");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  if (v4)
  {
    if (v2 == v6 && v4 == v8)
      v10 = 1;
    else
      v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v6, v8, 0);
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v10 = 0;
  }
  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

uint64_t sub_10004E0DC()
{
  return type metadata accessor for FTTranscriptionMessage(0);
}

uint64_t type metadata accessor for FTTranscriptionMessage(uint64_t a1)
{
  return sub_100047D4C(a1, (uint64_t *)&unk_1000A2FD0, (uint64_t)&nominal type descriptor for FTTranscriptionMessage);
}

uint64_t sub_10004E0F8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for Transcript(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = (char *)&value witness table for Builtin.Int64 + 64;
    v5[2] = (char *)&value witness table for Builtin.Int64 + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v5, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

BOOL sub_10004E290(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10004E2A4()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10004E2E8()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10004E310(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10004E620()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  void *object;
  __int16 v5;
  unint64_t v6;
  unint64_t v7;

  LOWORD(result) = ((uint64_t (*)(void))dispatch thunk of Message.messageType.getter)();
  if ((unsigned __int16)result < 3u)
    return (unsigned __int16)result;
  _StringGuts.grow(_:)(23);
  v1 = swift_bridgeObjectRelease(0xE000000000000000);
  v6 = 0xD000000000000015;
  v7 = 0x800000010006C510;
  v2 = dispatch thunk of Message.messageType.getter(v1);
  v5 = MessageType.rawValue.getter(v2);
  v3._countAndFlagsBits = String.init<A>(reflecting:)(&v5, &type metadata for Int16);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v6, v7, "FaceTime/FTMessage.swift", 24, 2, 84, 0);
  __break(1u);
  return result;
}

id sub_10004E7D8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  swift_retain(a1);
  a4(a3);
  v8 = v7;
  swift_release(a1);
  if (v8)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t sub_10004E84C(SEL *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  if ((dispatch thunk of Message.isFromUnknown.getter(a1) & 1) != 0)
    return 0;
  dispatch thunk of Message.from.getter();
  v3 = v2;
  v4 = (void *)objc_opt_self(TUHandle);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "normalizedHandleWithDestinationID:", v5);

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, *a1);
  if (!v7)
  {

    return 0;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v9;
}

uint64_t sub_10004E950(SEL *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  dispatch thunk of Message.recipient.getter();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (void *)objc_opt_self(TUHandle);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "normalizedHandleWithDestinationID:", v5);

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, *a1);
  if (!v7)
  {

    return 0;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v9;
}

uint64_t sub_10004EA94()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  if (*(_BYTE *)(v0 + 32) != 1)
    return *(_QWORD *)(v0 + 24);
  v1 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
  v2 = 1;
  if (v1 == 2)
    v2 = 2;
  if (v1 == 1)
    result = 3;
  else
    result = v2;
  *(_QWORD *)(v0 + 24) = result;
  *(_BYTE *)(v0 + 32) = 0;
  return result;
}

uint64_t sub_10004EB24()
{
  uint64_t v0;
  int v2;
  uint64_t v3;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty) == 1)
    return sub_10004EA94();
  v2 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
  v3 = 1;
  if (v2 == 2)
    v3 = 2;
  if (v2 == 1)
    return 3;
  else
    return v3;
}

uint64_t sub_10004EB9C()
{
  uint64_t v0;
  int v1;
  char v2;

  v1 = *(unsigned __int8 *)(v0 + 33);
  if (v1 == 2)
  {
    v2 = dispatch thunk of Message.isRead.getter();
    *(_BYTE *)(v0 + 33) = v2 & 1;
  }
  else
  {
    v2 = v1 & 1;
  }
  return v2 & 1;
}

void sub_10004ED0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  __chkstk_darwin(v1, v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10001283C((uint64_t *)&unk_1000A3068);
  v7 = __chkstk_darwin(v5, v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10004EF44(v7);
  if (v10 == 2
    && (v10 = dispatch thunk of Message.isRTT.getter(), (v10 & 1) != 0)
    && (v10 = TUCallScreeningRTTEnabled(0), (_DWORD)v10))
  {
    if (*(_BYTE *)(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript) == 1)
    {
      v11 = sub_10004F130();
      if (v11)
      {
        v12 = objc_opt_self(MPRTTTranscriptionMessage);
        v13 = (void *)swift_dynamicCastObjCClass(v11, v12);
        if (v13)
        {
          v15 = objc_msgSend(v13, "conversation");
          swift_unknownObjectRelease(v11, v16);
          if (v15)
          {
            v17 = objc_msgSend(v15, "utterances");

            if (v17)
            {
              objc_msgSend(v17, "count");

            }
            else
            {
              __break(1u);
            }
          }
        }
        else
        {
          swift_unknownObjectRelease(v11, v14);
        }
      }
    }
  }
  else
  {
    v18 = sub_10004EF44(v10);
    if (v18)
    {
      if (v18 == 1)
        return;
      sub_10004F19C((uint64_t)v9);
      v23 = type metadata accessor for Transcript(0, v22);
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v9, 1, v23);
      v20 = (uint64_t *)&unk_1000A3068;
      v21 = (uint64_t)v9;
    }
    else
    {
      sub_10004F898(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v4);
      v19 = type metadata accessor for URL(0);
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v4, 1, v19);
      v20 = (uint64_t *)&unk_1000A24B0;
      v21 = (uint64_t)v4;
    }
    sub_10001287C(v21, v20);
  }
}

uint64_t sub_10004EF44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int16 v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = v1;
  v3 = dispatch thunk of Message.messageType.getter(a1);
  if (v3 < 3u)
    return 0x10002u >> (8 * v3);
  if (qword_1000A1EE0 != -1)
    swift_once(&qword_1000A1EE0, sub_100015DDC);
  v5 = type metadata accessor for Logger(0);
  sub_1000138F4(v5, (uint64_t)qword_1000A4A08);
  v6 = swift_retain_n(v1, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v15 = v10;
    *(_DWORD *)v9 = 136446210;
    LOWORD(v14) = dispatch thunk of Message.messageType.getter(v10);
    v11 = String.init<A>(describing:)(&v14, &type metadata for MessageType);
    v13 = v12;
    v14 = sub_100013E00(v11, v12, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v9 + 4, v9 + 12);
    swift_release_n(v2, 2);
    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unexpected Message type %{public}s", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  return 0;
}

uint64_t sub_10004F130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript);
  v3 = v2;
  if (v2 == 1)
  {
    v3 = (uint64_t)sub_10004FF4C(v0);
    v4 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    swift_unknownObjectRetain(v3);
    sub_100051CA8(v4, v5);
  }
  sub_100051CB8(v2);
  return v3;
}

uint64_t sub_10004F19C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];
  _BYTE v17[24];

  v3 = sub_10001283C(&qword_1000A3178);
  v5 = __chkstk_darwin(v3, v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5, v8);
  v10 = &v16[-v9];
  v11 = v1 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptData;
  swift_beginAccess(v1 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptData, v17, 0, 0);
  sub_1000128B8(v11, (uint64_t)v10, &qword_1000A3178);
  v12 = sub_10001283C((uint64_t *)&unk_1000A3068);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
    return sub_1000128FC((uint64_t)v10, a1, (uint64_t *)&unk_1000A3068);
  v14 = sub_10001287C((uint64_t)v10, &qword_1000A3178);
  dispatch thunk of Message.transcript.getter(v14);
  sub_1000128B8(a1, (uint64_t)v7, (uint64_t *)&unk_1000A3068);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v7, 0, 1, v12);
  swift_beginAccess(v11, v16, 33, 0);
  sub_100051D0C((uint64_t)v7, v11, &qword_1000A3178);
  return swift_endAccess(v16);
}

uint64_t sub_10004F3E8()
{
  uint64_t v0;
  int v1;
  uint64_t result;

  v1 = *(unsigned __int8 *)(v0 + 34);
  if (v1 != 2)
    return v1 & 1;
  result = 0;
  *(_BYTE *)(v0 + 34) = 0;
  return result;
}

uint64_t sub_10004F4F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[24];
  char v35[24];

  v3 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v3, v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  v11 = (char *)&v32 - v10;
  v12 = sub_10001283C(&qword_1000A3180);
  v14 = __chkstk_darwin(v12, v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  v19 = (char *)&v32 - v18;
  v20 = v1 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___dataURL;
  swift_beginAccess(v1 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___dataURL, v35, 0, 0);
  sub_1000128B8(v20, (uint64_t)v19, &qword_1000A3180);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v19, 1, v3) == 1)
  {
    v21 = sub_10001287C((uint64_t)v19, &qword_1000A3180);
    v22 = (void *)dispatch thunk of Message.sandboxMessageFile.getter(v21);
    v23 = (void *)dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter();

    if (v23)
    {
      v33 = a1;
      v24 = type metadata accessor for URL(0);
      v25 = *(_QWORD *)(v24 - 8);
      v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
      v26(v8, 1, 1, v24);
      v27 = sub_10000CC50(&qword_1000A3188, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)(v23, v8, v24, v27);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v8, 1, v24) == 1)
      {
        v28 = v11;
        v29 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v11, v8, v24);
        v28 = v11;
        v29 = 0;
      }
      v26(v28, v29, 1, v24);
      a1 = v33;
    }
    else
    {
      v30 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v11, 1, 1, v30);
    }
    sub_1000128B8((uint64_t)v11, (uint64_t)v16, (uint64_t *)&unk_1000A24B0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v16, 0, 1, v3);
    swift_beginAccess(v20, v34, 33, 0);
    sub_100051D0C((uint64_t)v16, v20, &qword_1000A3180);
    swift_endAccess(v34);
  }
  else
  {
    v11 = v19;
  }
  return sub_1000128FC((uint64_t)v11, a1, (uint64_t *)&unk_1000A24B0);
}

uint64_t sub_10004F898@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  int v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[24];
  char v41[24];

  v39 = a3;
  v6 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  v7 = *(_QWORD *)(v6 - 8);
  v9 = __chkstk_darwin(v6, v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  v14 = (char *)&v38 - v13;
  v15 = sub_10001283C(&qword_1000A3180);
  v17 = __chkstk_darwin(v15, v16);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v20);
  v22 = (char *)&v38 - v21;
  v23 = v3 + *a1;
  swift_beginAccess(v23, v41, 0, 0);
  sub_1000128B8(v23, (uint64_t)v22, &qword_1000A3180);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v22, 1, v6) == 1)
  {
    v24 = sub_10001287C((uint64_t)v22, &qword_1000A3180);
    v25 = a2(v24);
    if (v25
      && (v26 = (void *)v25,
          v27 = (void *)dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter(),
          v26,
          v27))
    {
      v28 = type metadata accessor for URL(0);
      v29 = *(_QWORD *)(v28 - 8);
      v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
      v30(v11, 1, 1, v28);
      v31 = sub_10000CC50(&qword_1000A3188, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)(v27, v11, v28, v31);

      v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48))(v11, 1, v28);
      v33 = v39;
      if (v32 == 1)
      {
        v34 = v14;
        v35 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v14, v11, v28);
        v34 = v14;
        v35 = 0;
      }
      v30(v34, v35, 1, v28);
    }
    else
    {
      v36 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v14, 1, 1, v36);
      v33 = v39;
    }
    sub_1000128B8((uint64_t)v14, (uint64_t)v19, (uint64_t *)&unk_1000A24B0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
    swift_beginAccess(v23, v40, 33, 0);
    sub_100051D0C((uint64_t)v19, v23, &qword_1000A3180);
    swift_endAccess(v40);
  }
  else
  {
    v14 = v22;
    v33 = v39;
  }
  return sub_1000128FC((uint64_t)v14, v33, (uint64_t *)&unk_1000A24B0);
}

uint64_t sub_10004FB70(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v21[24];

  v7 = sub_10001283C(&qword_1000A3180);
  __chkstk_darwin(v7, v8);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  v15 = &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v16 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 0, 1, v16);
  }
  else
  {
    v17 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  sub_1000128FC((uint64_t)v15, (uint64_t)v10, (uint64_t *)&unk_1000A24B0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  v18 = a1 + *a4;
  swift_beginAccess(v18, v21, 33, 0);
  swift_retain(a1);
  sub_100051D0C((uint64_t)v10, v18, &qword_1000A3180);
  swift_endAccess(v21);
  return swift_release(a1);
}

uint64_t sub_10004FCFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;

  v5 = swift_retain(a1);
  LOBYTE(a3) = a3(v5);
  swift_release(a1);
  return a3 & 1;
}

uint64_t sub_10004FD4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;

  v5 = swift_retain(a1);
  LOBYTE(a3) = a3(v5);
  swift_release(a1);
  return a3 & 1;
}

id sub_10004FD84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  uint64_t v15;

  v0 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004F4F4((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_10001287C((uint64_t)v3, (uint64_t *)&unk_1000A24B0);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
    v10 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    URL.path.getter();
    v12 = v11;
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
    v9 = objc_msgSend(v10, "fileExistsAtPath:", v13);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return v9;
}

id sub_10004FF4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  Class isa;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  objc_class *v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_class *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v59;
  objc_super v60;

  v57 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  v3 = __chkstk_darwin(v57, v2);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v52 - v5;
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10001283C((uint64_t *)&unk_1000A3068);
  __chkstk_darwin(v12, v13);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Transcript(0, v16);
  v55 = *(_QWORD *)(v17 - 8);
  v56 = v17;
  v19 = __chkstk_darwin(v17, v18);
  v54 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19, v21);
  v53 = (char *)&v52 - v22;
  v23 = type metadata accessor for UUID(0);
  v24 = *(_QWORD *)(v23 - 8);
  v26 = __chkstk_darwin(v23, v25);
  v28 = (char *)&v52 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = a1;
  v29 = sub_10004EF44(v26);
  if (v29)
  {
    v30 = 0;
    v31 = v58;
    if (v29 != 1)
    {
      if ((dispatch thunk of Message.isRTT.getter() & 1) != 0 && (v32 = TUCallScreeningRTTEnabled(0), (_DWORD)v32))
      {
        dispatch thunk of Message.callUUID.getter(v32);
        v33 = objc_allocWithZone((Class)MPRTTTranscriptionMessage);
        isa = UUID._bridgeToObjectiveC()().super.isa;
        v30 = objc_msgSend(v33, "initWithCallUUID:", isa);

        (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v23);
      }
      else
      {
        sub_10004F19C((uint64_t)v15);
        v36 = v55;
        v35 = v56;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v15, 1, v56) == 1)
        {
          sub_10001287C((uint64_t)v15, (uint64_t *)&unk_1000A3068);
          v30 = 0;
        }
        else
        {
          v38 = v53;
          (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v53, v15, v35);
          v39 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
          v40 = v54;
          v39(v54, v38, v35);
          v41 = (objc_class *)type metadata accessor for FTTranscriptionMessage(0);
          v42 = (char *)objc_allocWithZone(v41);
          *(_QWORD *)&v42[OBJC_IVAR____TtC8FaceTime22FTTranscriptionMessage_confidenceRating] = 0;
          *(_QWORD *)&v42[OBJC_IVAR____TtC8FaceTime22FTTranscriptionMessage_confidence] = 0x3FF0000000000000;
          v39(&v42[OBJC_IVAR____TtC8FaceTime22FTTranscriptionMessage_transcriptData], v40, v35);
          v59.receiver = v42;
          v59.super_class = v41;
          v30 = objc_msgSendSuper2(&v59, "init");
          v43 = *(void (**)(char *, uint64_t))(v36 + 8);
          v43(v40, v35);
          v43(v38, v35);
        }
      }
    }
  }
  else
  {
    sub_10004F898(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_10001287C((uint64_t)v6, (uint64_t *)&unk_1000A24B0);
      v30 = 0;
      v31 = v58;
    }
    else
    {
      v37 = v11;
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
      v44 = Data.init(contentsOf:options:)(v11, 0);
      v46 = v45;
      sub_100013580(0, &qword_1000A3168, NSKeyedUnarchiver_ptr);
      v47 = sub_100013580(0, &qword_1000A3170, VMVoicemailTranscript_ptr);
      v48 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v47, v44, v46, v47);
      v31 = v58;
      v30 = (id)v48;
      if (v48)
      {
        v50 = (objc_class *)type metadata accessor for VisualTranscriptionMessage();
        v51 = (char *)objc_allocWithZone(v50);
        *(_QWORD *)&v51[OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript] = v30;
        v60.receiver = v51;
        v60.super_class = v50;
        v30 = objc_msgSendSuper2(&v60, "init");
        sub_100051CC8(v44, v46);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v37, v7);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v37, v7);
        sub_100051CC8(v44, v46);
      }
    }
  }
  *(_BYTE *)(v31 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript) = 1;
  return v30;
}

uint64_t sub_100050644()
{
  id *v0;
  uint64_t v1;

  sub_10001287C((uint64_t)v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___dataURL, &qword_1000A3180);
  sub_10001287C((uint64_t)v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___thumbnailURL, &qword_1000A3180);
  sub_10001287C((uint64_t)v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, &qword_1000A3180);
  sub_10001287C((uint64_t)v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptData, &qword_1000A3178);
  sub_100051CA8(*(uint64_t *)((char *)v0 + OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript), v1);
  return swift_deallocClassInstance(v0, *((unsigned int *)*v0 + 12), *((unsigned __int16 *)*v0 + 26));
}

uint64_t sub_1000506E0()
{
  return type metadata accessor for FTMessage(0);
}

uint64_t type metadata accessor for FTMessage(uint64_t a1)
{
  return sub_100047D4C(a1, (uint64_t *)&unk_1000A3040, (uint64_t)&nominal type descriptor for FTMessage);
}

void sub_1000506FC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[4];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v6[1] = "\t";
  v6[2] = &unk_100068170;
  v6[3] = &unk_100068170;
  sub_1000507DC(319, (unint64_t *)&unk_1000A3050, (uint64_t *)&unk_1000A24B0);
  if (v3 <= 0x3F)
  {
    v7 = *(_QWORD *)(v2 - 8) + 64;
    v8 = v7;
    v9 = v7;
    sub_1000507DC(319, &qword_1000A3060, (uint64_t *)&unk_1000A3068);
    if (v5 <= 0x3F)
    {
      v10 = *(_QWORD *)(v4 - 8) + 64;
      v11 = &unk_100068188;
      v12 = &unk_1000681A0;
      v13 = &unk_1000681A0;
      swift_updateClassMetadata2(a1, 256, 11, v6, a1 + 80);
    }
  }
}

void sub_1000507DC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = sub_10001528C(a3);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

BOOL sub_100050828(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v4;

  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty) & 1) != 0)
  {
    v4 = sub_10004EB9C();
    if ((v4 & 1) == 0)
      return a2 > 5.0 || dispatch thunk of Message.duration.getter(v4) / 3.0 < a2;
    return 0;
  }
  v4 = dispatch thunk of Message.isRead.getter(a1);
  if ((v4 & 1) != 0)
    return 0;
  return a2 > 5.0 || dispatch thunk of Message.duration.getter(v4) / 3.0 < a2;
}

id sub_1000508F0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  Class isa;
  id v18;

  if ((dispatch thunk of Message.isFromUnknown.getter(a1) & 1) != 0)
    return 0;
  ((void (*)(void))dispatch thunk of Message.from.getter)();
  v3 = v2;
  v4 = (void *)objc_opt_self(TUHandle);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "normalizedHandleWithDestinationID:", v5);

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, "normalizedValue");
  if (!v7)
  {

    return 0;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v11 = v10;

  v12 = swift_bridgeObjectRelease(v11);
  v13 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0)
    v13 = v9 & 0xFFFFFFFFFFFFLL;
  if (!v13)
    return 0;
  dispatch thunk of Message.from.getter(v12);
  v15 = v14;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  sub_10001283C(&qword_1000A24A0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v18 = objc_msgSend(a1, "contactForDestinationId:keysToFetch:", v16, isa);

  return v18;
}

uint64_t sub_100050AD4(void *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;

  v2 = dispatch thunk of Message.from.getter(a1);
  v4 = v3;
  swift_bridgeObjectRelease(v3);
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (!v5)
    return 0;
  v6 = sub_10001283C((uint64_t *)&unk_1000A3190);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100067DD0;
  v8 = (void *)objc_opt_self(CNContactFormatter);
  v9 = objc_msgSend(v8, "descriptorForRequiredKeysForStyle:", 0);
  *(_QWORD *)(v7 + 32) = v9;
  specialized Array._endMutation()(v9);
  v10 = v7;
  v11 = sub_1000508F0(a1);
  swift_bridgeObjectRelease(v10);
  if (!v11)
    return sub_100050C50();
  if ((objc_msgSend(v11, "isSuggested") & 1) == 0)
  {
    v13 = objc_msgSend(v8, "stringFromContact:style:", v11, 0);
    if (v13)
    {
      v14 = v13;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);

      return v12;
    }

    return 0;
  }
  v12 = sub_100050C50();

  return v12;
}

uint64_t sub_100050C50()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSString v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v0 = (void *)objc_opt_self(TUHandle);
  dispatch thunk of Message.from.getter();
  v2 = v1;
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  v4 = objc_msgSend(v0, "normalizedHandleWithDestinationID:", v3);

  if (!v4)
    return 0;
  v5 = objc_msgSend(v4, "normalizedValue");
  v6 = objc_msgSend(v4, "isoCountryCode");
  v7 = (id)TUFormattedPhoneNumber(v5, v6);

  if (!v7)
  {

    return 0;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v8;
}

uint64_t sub_100050DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  Swift::String v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  objc_class *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  id v36;
  void (*v37)(char *, uint64_t);
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  Swift::String v42;
  Swift::String v43;
  uint64_t v44;
  Swift::String v45;
  void *object;
  Swift::String v47;
  uint64_t v48;
  Swift::String v49;
  void *v50;
  Swift::String v51;
  Swift::String v52;
  uint64_t v53;
  uint64_t v54;
  Swift::String v55;
  void *v56;
  Swift::String v57;
  uint64_t v58;
  Swift::String v59;
  void *v60;
  Swift::String v61;
  uint64_t v62;
  Swift::String v63;
  void *v64;
  Swift::String v65;
  uint64_t v66;
  Swift::String v67;
  void *v68;
  Swift::String v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  Swift::String v74;
  void *v75;
  Swift::String v76;
  Swift::String v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  Swift::String v82;
  char v83;
  BOOL v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  Swift::String v88;
  uint64_t v89;
  int v90;
  char v91;
  BOOL v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  Swift::String v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  Swift::String v101;
  void *v102;
  Swift::String v103;
  char v104;
  BOOL v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  Swift::String v109;
  uint64_t v110;
  double v111;
  Swift::String v112;
  Swift::String v113;
  Swift::String v114;
  Swift::String v115;
  Swift::String v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  unsigned __int16 v120;
  BOOL v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  Swift::String v125;
  uint64_t v126;
  int v127;
  unsigned __int16 v128;
  BOOL v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  Swift::String v133;
  char v134;
  BOOL v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  Swift::String v139;
  char v140;
  BOOL v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  Swift::String v145;
  uint64_t v146;
  uint64_t v147;
  Swift::String v148;
  void *v149;
  Swift::String v150;
  Swift::String v151;
  void *v152;
  Swift::String v153;
  Swift::String v154;
  void *v155;
  Swift::String v156;
  uint64_t v157;
  Swift::String v158;
  void *v159;
  Swift::String v160;
  char v161;
  BOOL v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  Swift::String v166;
  unsigned __int8 v167;
  BOOL v168;
  uint64_t v169;
  unint64_t v170;
  unint64_t v171;
  Swift::String v172;
  uint64_t v173;
  Swift::String v174;
  void *v175;
  Swift::String v176;
  uint64_t v177;
  unint64_t v178;
  unint64_t v179;
  Swift::String v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  Swift::String v184;
  uint64_t v185;
  Swift::String v186;
  id v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  objc_super v200;
  _QWORD v201[2];

  v1 = v0;
  v197 = sub_10001283C((uint64_t *)&unk_1000A3068);
  __chkstk_darwin(v197, v2);
  v196 = (uint64_t)&v188 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v195 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  __chkstk_darwin(v195, v4);
  v194 = (uint64_t)&v188 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0, v6);
  v192 = *(_QWORD *)(v7 - 8);
  v193 = v7;
  __chkstk_darwin(v7, v8);
  v191 = (char *)&v188 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v190 = sub_10001283C(&qword_1000A2670);
  __chkstk_darwin(v190, v10);
  v12 = (char *)&v188 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  v16 = __chkstk_darwin(v13, v15);
  v18 = (char *)&v188 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  v21 = (char *)&v188 - v20;
  v201[0] = 0;
  v201[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(722);
  v22._countAndFlagsBits = 0xD00000000000001ALL;
  v189 = 0xD00000000000001ALL;
  v22._object = (void *)0x800000010006C030;
  String.append(_:)(v22);
  v23 = *(id *)(v0 + 16);
  v24 = objc_msgSend(v23, "description");
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
  v27 = v26;

  v28._countAndFlagsBits = v25;
  v28._object = v27;
  String.append(_:)(v28);
  v188 = v23;

  swift_bridgeObjectRelease(v27);
  v29._countAndFlagsBits = 0x3A6469202020200ALL;
  v29._object = (void *)0xE900000000000020;
  String.append(_:)(v29);
  dispatch thunk of Message.recordUUID.getter(v30);
  v31 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v31(v18, v21, v13);
  v32 = (objc_class *)type metadata accessor for MessageID(0);
  v33 = (char *)objc_allocWithZone(v32);
  v34 = &v33[OBJC_IVAR___MPMessageID_value];
  v31(&v33[OBJC_IVAR___MPMessageID_value], v18, v13);
  v35 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v34, v35, 1);
  v200.receiver = v33;
  v200.super_class = v32;
  v36 = objc_msgSendSuper2(&v200, "init");
  v37 = *(void (**)(char *, uint64_t))(v14 + 8);
  v37(v18, v13);
  v37(v21, v13);
  v38 = objc_msgSend(v36, "description");
  v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
  v41 = v40;

  v42._countAndFlagsBits = v39;
  v42._object = v41;
  String.append(_:)(v42);

  swift_bridgeObjectRelease(v41);
  v43._countAndFlagsBits = 0x6F7270202020200ALL;
  v43._object = (void *)0xEF203A7265646976;
  String.append(_:)(v43);
  v45._countAndFlagsBits = dispatch thunk of Message.provider.getter(v44);
  object = v45._object;
  String.append(_:)(v45);
  swift_bridgeObjectRelease(object);
  v47._countAndFlagsBits = 0x6C6163202020200ALL;
  v47._object = (void *)0xEF203A444955556CLL;
  String.append(_:)(v47);
  dispatch thunk of Message.callUUID.getter(v48);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  v49._countAndFlagsBits = String.init<A>(describing:)(v12, v190);
  v50 = v49._object;
  String.append(_:)(v49);
  swift_bridgeObjectRelease(v50);
  v51._countAndFlagsBits = 0xD000000000000012;
  v51._object = (void *)0x800000010006C050;
  String.append(_:)(v51);
  v198 = sub_10004E620();
  _print_unlocked<A, B>(_:_:)(&v198, v201, &type metadata for MessageType, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v52._object = (void *)0x800000010006C070;
  v52._countAndFlagsBits = v189;
  String.append(_:)(v52);
  v198 = sub_10004E84C((SEL *)&selRef_normalizedValue);
  v199 = v53;
  v54 = sub_10001283C(&qword_1000A3140);
  v55._countAndFlagsBits = String.init<A>(describing:)(&v198, v54);
  v56 = v55._object;
  String.append(_:)(v55);
  swift_bridgeObjectRelease(v56);
  v57._countAndFlagsBits = 0xD00000000000001BLL;
  v57._object = (void *)0x800000010006C090;
  String.append(_:)(v57);
  v198 = sub_10004E84C((SEL *)&selRef_isoCountryCode);
  v199 = v58;
  v59._countAndFlagsBits = String.init<A>(describing:)(&v198, v54);
  v60 = v59._object;
  String.append(_:)(v59);
  swift_bridgeObjectRelease(v60);
  v61._object = (void *)0x800000010006C0B0;
  v61._countAndFlagsBits = 0xD00000000000001CLL;
  String.append(_:)(v61);
  v198 = sub_10004E950((SEL *)&selRef_normalizedValue);
  v199 = v62;
  v63._countAndFlagsBits = String.init<A>(describing:)(&v198, v54);
  v64 = v63._object;
  String.append(_:)(v63);
  swift_bridgeObjectRelease(v64);
  v65._countAndFlagsBits = 0xD00000000000001DLL;
  v65._object = (void *)0x800000010006C0D0;
  String.append(_:)(v65);
  v198 = sub_10004E950((SEL *)&selRef_isoCountryCode);
  v199 = v66;
  v67._countAndFlagsBits = String.init<A>(describing:)(&v198, v54);
  v68 = v67._object;
  String.append(_:)(v67);
  swift_bridgeObjectRelease(v68);
  v69._object = (void *)0x800000010006C0F0;
  v69._countAndFlagsBits = 0xD00000000000001CLL;
  String.append(_:)(v69);
  v71 = dispatch thunk of Message.isFromUnknown.getter(v70);
  v72 = 0;
  v73 = 0;
  if ((v71 & 1) == 0)
    v72 = dispatch thunk of Message.from.getter(0);
  v198 = v72;
  v199 = v73;
  v74._countAndFlagsBits = String.init<A>(describing:)(&v198, v54);
  v75 = v74._object;
  String.append(_:)(v74);
  swift_bridgeObjectRelease(v75);
  v76._countAndFlagsBits = 0xD000000000000012;
  v76._object = (void *)0x800000010006C110;
  String.append(_:)(v76);
  v198 = sub_10004EA94();
  _print_unlocked<A, B>(_:_:)(&v198, v201, &type metadata for MessageFolder, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v77._countAndFlagsBits = 0x6C6F66202020200ALL;
  v77._object = (void *)0xED0000203A726564;
  String.append(_:)(v77);
  v78 = OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty) == 1)
  {
    v79 = *(_QWORD *)(v1 + 24);
  }
  else
  {
    v80 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
    v81 = 1;
    if (v80 == 2)
      v81 = 2;
    v84 = v80 == 1;
    v79 = 3;
    if (!v84)
      v79 = v81;
  }
  v198 = v79;
  _print_unlocked<A, B>(_:_:)(&v198, v201, &type metadata for MessageFolder, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v82._object = (void *)0x800000010006C130;
  v82._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v82);
  v83 = sub_10004EB9C();
  v84 = (v83 & 1) == 0;
  if ((v83 & 1) != 0)
    v85 = 1702195828;
  else
    v85 = 0x65736C6166;
  if (v84)
    v86 = 0xE500000000000000;
  else
    v86 = 0xE400000000000000;
  v87 = v86;
  String.append(_:)(*(Swift::String *)&v85);
  swift_bridgeObjectRelease(v86);
  v88._countAndFlagsBits = 0x616572202020200ALL;
  v88._object = (void *)0xEB00000000203A64;
  String.append(_:)(v88);
  v90 = *(unsigned __int8 *)(v1 + v78);
  v190 = v78;
  if (v90 == 1)
    v91 = *(_BYTE *)(v1 + 33) & 1;
  else
    v91 = dispatch thunk of Message.isRead.getter(v89);
  v92 = (v91 & 1) == 0;
  if ((v91 & 1) != 0)
    v93 = 1702195828;
  else
    v93 = 0x65736C6166;
  if (v92)
    v94 = 0xE500000000000000;
  else
    v94 = 0xE400000000000000;
  v95 = v94;
  String.append(_:)(*(Swift::String *)&v93);
  swift_bridgeObjectRelease(v94);
  v96._object = (void *)0xEB00000000203A65;
  v96._countAndFlagsBits = 0x746164202020200ALL;
  String.append(_:)(v96);
  v97 = v191;
  dispatch thunk of Message.dateCreated.getter(v98);
  v99 = sub_10000CC50(&qword_1000A3148, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v100 = v193;
  v101._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v193, v99);
  v102 = v101._object;
  String.append(_:)(v101);
  swift_bridgeObjectRelease(v102);
  (*(void (**)(char *, uint64_t))(v192 + 8))(v97, v100);
  v103._countAndFlagsBits = 0xD00000000000001FLL;
  v103._object = (void *)0x800000010006C150;
  String.append(_:)(v103);
  sub_10004ED0C();
  v105 = (v104 & 1) == 0;
  if ((v104 & 1) != 0)
    v106 = 1702195828;
  else
    v106 = 0x65736C6166;
  if (v105)
    v107 = 0xE500000000000000;
  else
    v107 = 0xE400000000000000;
  v108 = v107;
  String.append(_:)(*(Swift::String *)&v106);
  swift_bridgeObjectRelease(v107);
  v109._countAndFlagsBits = 0x727564202020200ALL;
  v109._object = (void *)0xEF203A6E6F697461;
  String.append(_:)(v109);
  v111 = dispatch thunk of Message.duration.getter(v110);
  Double.write<A>(to:)(v201, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, v111);
  v112._countAndFlagsBits = 0xD00000000000001BLL;
  v112._object = (void *)0x800000010006C170;
  String.append(_:)(v112);
  v113._countAndFlagsBits = 0x65736C6166;
  v113._object = (void *)0xE500000000000000;
  String.append(_:)(v113);
  v114._object = (void *)0x800000010006C190;
  v114._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v114);
  v115._countAndFlagsBits = 0x65736C6166;
  v115._object = (void *)0xE500000000000000;
  String.append(_:)(v115);
  v116._countAndFlagsBits = 0xD00000000000001DLL;
  v116._object = (void *)0x800000010006C1B0;
  String.append(_:)(v116);
  v118 = dispatch thunk of Message.transcriptionStatus.getter(v117);
  v119 = (unsigned __int16)TranscriptionStatus.rawValue.getter(v118);
  v120 = TranscriptionStatus.rawValue.getter(0);
  v121 = v119 == v120;
  if (v119 == v120)
    v122 = 0x65736C6166;
  else
    v122 = 1702195828;
  if (v121)
    v123 = 0xE500000000000000;
  else
    v123 = 0xE400000000000000;
  v124 = v123;
  String.append(_:)(*(Swift::String *)&v122);
  swift_bridgeObjectRelease(v123);
  v125._object = (void *)0x800000010006C1D0;
  v125._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v125);
  v126 = dispatch thunk of Message.mailboxType.getter();
  v127 = (unsigned __int16)MailboxType.rawValue.getter(v126);
  v128 = MailboxType.rawValue.getter(1);
  v129 = v127 == v128;
  if (v127 == v128)
    v130 = 1702195828;
  else
    v130 = 0x65736C6166;
  if (v129)
    v131 = 0xE400000000000000;
  else
    v131 = 0xE500000000000000;
  v132 = v131;
  String.append(_:)(*(Swift::String *)&v130);
  swift_bridgeObjectRelease(v131);
  v133._object = (void *)0x800000010006C1F0;
  v133._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v133);
  v134 = sub_10004F3E8();
  v135 = (v134 & 1) == 0;
  if ((v134 & 1) != 0)
    v136 = 1702195828;
  else
    v136 = 0x65736C6166;
  if (v135)
    v137 = 0xE500000000000000;
  else
    v137 = 0xE400000000000000;
  v138 = v137;
  String.append(_:)(*(Swift::String *)&v136);
  swift_bridgeObjectRelease(v137);
  v139._countAndFlagsBits = 0xD000000000000012;
  v139._object = (void *)0x800000010006C210;
  String.append(_:)(v139);
  v140 = dispatch thunk of Message.isSensitive.getter();
  v141 = (v140 & 1) == 0;
  if ((v140 & 1) != 0)
    v142 = 1702195828;
  else
    v142 = 0x65736C6166;
  if (v141)
    v143 = 0xE500000000000000;
  else
    v143 = 0xE400000000000000;
  v144 = v143;
  String.append(_:)(*(Swift::String *)&v142);
  swift_bridgeObjectRelease(v143);
  v145._countAndFlagsBits = 0x746164202020200ALL;
  v145._object = (void *)0xEE00203A4C525561;
  String.append(_:)(v145);
  v146 = v194;
  sub_10004F4F4(v194);
  v147 = v195;
  v148._countAndFlagsBits = String.init<A>(describing:)(v146, v195);
  v149 = v148._object;
  String.append(_:)(v148);
  swift_bridgeObjectRelease(v149);
  v150._countAndFlagsBits = 0xD000000000000013;
  v150._object = (void *)0x800000010006C230;
  String.append(_:)(v150);
  sub_10004F898(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, v146);
  v151._countAndFlagsBits = String.init<A>(describing:)(v146, v147);
  v152 = v151._object;
  String.append(_:)(v151);
  swift_bridgeObjectRelease(v152);
  v153._object = (void *)0x800000010006C250;
  v153._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v153);
  sub_10004F898(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, v146);
  v154._countAndFlagsBits = String.init<A>(describing:)(v146, v147);
  v155 = v154._object;
  String.append(_:)(v154);
  swift_bridgeObjectRelease(v155);
  v156._object = (void *)0x800000010006C270;
  v156._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v156);
  v157 = v196;
  sub_10004F19C(v196);
  v158._countAndFlagsBits = String.init<A>(describing:)(v157, v197);
  v159 = v158._object;
  String.append(_:)(v158);
  swift_bridgeObjectRelease(v159);
  v160._countAndFlagsBits = 0x527369202020200ALL;
  v160._object = (void *)0xEC000000203A5454;
  String.append(_:)(v160);
  v161 = dispatch thunk of Message.isRTT.getter();
  v162 = (v161 & 1) == 0;
  if ((v161 & 1) != 0)
    v163 = 1702195828;
  else
    v163 = 0x65736C6166;
  if (v162)
    v164 = 0xE500000000000000;
  else
    v164 = 0xE400000000000000;
  v165 = v164;
  String.append(_:)(*(Swift::String *)&v163);
  swift_bridgeObjectRelease(v164);
  v166._countAndFlagsBits = 0xD000000000000016;
  v166._object = (void *)0x800000010006C290;
  String.append(_:)(v166);
  v167 = sub_10004FD84();
  v168 = (v167 & 1) == 0;
  if ((v167 & 1) != 0)
    v169 = 1702195828;
  else
    v169 = 0x65736C6166;
  if (v168)
    v170 = 0xE500000000000000;
  else
    v170 = 0xE400000000000000;
  v171 = v170;
  String.append(_:)(*(Swift::String *)&v169);
  swift_bridgeObjectRelease(v170);
  v172._countAndFlagsBits = 0xD000000000000011;
  v172._object = (void *)0x800000010006C2B0;
  String.append(_:)(v172);
  v198 = sub_10004F130();
  v173 = sub_10001283C(&qword_1000A3150);
  v174._countAndFlagsBits = String.init<A>(describing:)(&v198, v173);
  v175 = v174._object;
  String.append(_:)(v174);
  swift_bridgeObjectRelease(v175);
  v176._countAndFlagsBits = 0xD000000000000018;
  v176._object = (void *)0x800000010006C2D0;
  String.append(_:)(v176);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript))
    v177 = 1702195828;
  else
    v177 = 0x65736C6166;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8FaceTime9FTMessage_didLoadTranscript))
    v178 = 0xE400000000000000;
  else
    v178 = 0xE500000000000000;
  v179 = v178;
  String.append(_:)(*(Swift::String *)&v177);
  swift_bridgeObjectRelease(v178);
  v180._countAndFlagsBits = 0x447369202020200ALL;
  v180._object = (void *)0xEE00203A79747269;
  String.append(_:)(v180);
  if (*(_BYTE *)(v1 + v190))
    v181 = 1702195828;
  else
    v181 = 0x65736C6166;
  if (*(_BYTE *)(v1 + v190))
    v182 = 0xE400000000000000;
  else
    v182 = 0xE500000000000000;
  v183 = v182;
  String.append(_:)(*(Swift::String *)&v181);
  swift_bridgeObjectRelease(v182);
  v184._object = (void *)0x800000010006C2F0;
  v184._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v184);
  LOBYTE(v198) = sub_10004EF44(v185);
  _print_unlocked<A, B>(_:_:)(&v198, v201, &type metadata for FTMessageSource, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v186._countAndFlagsBits = 0x202020202020200ALL;
  v186._object = (void *)0xEA00000000002920;
  String.append(_:)(v186);
  return v201[0];
}

uint64_t sub_100051B3C()
{
  return sub_100050DD0();
}

uint64_t sub_100051B5C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10001283C(&qword_1000A3158);
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

uint64_t sub_100051CA8(uint64_t result, uint64_t a2)
{
  if (result != 1)
    return swift_unknownObjectRelease(result, a2);
  return result;
}

uint64_t sub_100051CB8(uint64_t result)
{
  if (result != 1)
    return swift_unknownObjectRetain(result);
  return result;
}

uint64_t sub_100051CC8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100051D0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10001283C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

_BYTE *initializeBufferWithCopyOfBuffer for FTMessageSource(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FTMessageSource(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FTMessageSource(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_100051E3C + 4 * byte_1000680F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100051E70 + 4 * byte_1000680F0[v4]))();
}

uint64_t sub_100051E70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100051E78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100051E80);
  return result;
}

uint64_t sub_100051E8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100051E94);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100051E98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100051EA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100051EAC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FTMessageSource()
{
  return &type metadata for FTMessageSource;
}

unint64_t sub_100051EC8()
{
  unint64_t result;

  result = qword_1000A31A0;
  if (!qword_1000A31A0)
  {
    result = swift_getWitnessTable(&unk_100068268, &type metadata for FTMessageSource);
    atomic_store(result, (unint64_t *)&qword_1000A31A0);
  }
  return result;
}

id sub_100051FCC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OrientationMonitorKeys();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OrientationMonitorKeys()
{
  return objc_opt_self(PHOrientationMonitorKeys);
}

NSString sub_100052020()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_1000A4A68 = (uint64_t)result;
  return result;
}

unint64_t sub_100052054(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001283C(&qword_1000A3260);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_10004A554(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10005216C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10001283C(&qword_1000A3268);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v31 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v30)
      goto LABEL_37;
    v15 = *(_QWORD *)(v31 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v30)
        goto LABEL_37;
      v15 = *(_QWORD *)(v31 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v30)
          goto LABEL_37;
        v15 = *(_QWORD *)(v31 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v30)
            goto LABEL_37;
          v15 = *(_QWORD *)(v31 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v19 = v18[1];
    v20 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v13);
    *(_QWORD *)&v41[0] = *v18;
    *((_QWORD *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    v21 = v20;
    swift_dynamicCast(&v33, v41, &type metadata for String, &type metadata for AnyHashable, 7);
    v32 = v21;
    v22 = sub_10005299C();
    swift_dynamicCast(v36, &v32, v22, (char *)&type metadata for Any + 8, 7);
    v37 = v33;
    v38 = v34;
    v39 = v35;
    sub_100042740(v36, v40);
    v33 = v37;
    v34 = v38;
    v35 = v39;
    sub_100042740(v40, v41);
    sub_100042740(v41, &v37);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v23 = -1 << *((_BYTE *)v3 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)&v7[8 * (v24 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)&v7[8 * (v24 >> 6)])) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)&v7[8 * v25];
      }
      while (v29 == -1);
      v10 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v33;
    *(_OWORD *)(v11 + 16) = v34;
    *(_QWORD *)(v11 + 32) = v35;
    result = (uint64_t)sub_100042740(&v37, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v30)
  {
LABEL_37:
    swift_release(v3);
    sub_100045D18(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v31 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v30)
      goto LABEL_37;
    v15 = *(_QWORD *)(v31 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_10005251C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t i;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10001283C(&qword_1000A3270);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain(a1);
  i = 0;
  if (v6)
    goto LABEL_10;
LABEL_11:
  v12 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v12 >= v28)
    goto LABEL_32;
  v13 = *(_QWORD *)(v29 + 8 * v12);
  v14 = i + 1;
  if (!v13)
  {
    v14 = i + 2;
    if (i + 2 >= v28)
      goto LABEL_32;
    v13 = *(_QWORD *)(v29 + 8 * v14);
    if (!v13)
    {
      v14 = i + 3;
      if (i + 3 >= v28)
        goto LABEL_32;
      v13 = *(_QWORD *)(v29 + 8 * v14);
      if (!v13)
      {
        v14 = i + 4;
        if (i + 4 >= v28)
          goto LABEL_32;
        v13 = *(_QWORD *)(v29 + 8 * v14);
        if (!v13)
        {
          v15 = i + 5;
          if (i + 5 < v28)
          {
            v13 = *(_QWORD *)(v29 + 8 * v15);
            if (v13)
            {
              v14 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v14 = v15 + 1;
              if (__OFADD__(v15, 1))
                goto LABEL_36;
              if (v14 >= v28)
                break;
              v13 = *(_QWORD *)(v29 + 8 * v14);
              ++v15;
              if (v13)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_100045D18(a1);
          return;
        }
      }
    }
  }
LABEL_26:
  v6 = (v13 - 1) & v13;
  v11 = __clz(__rbit64(v13)) + (v14 << 6);
  for (i = v14; ; v11 = v10 | (i << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v18 = *v16;
    v17 = v16[1];
    v19 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v17);
    v20 = v19;
    v21 = sub_10004A554(v18, v17);
    v22 = v21;
    if ((v23 & 1) != 0)
    {
      v8 = (uint64_t *)(v3[6] + 16 * v21);
      swift_bridgeObjectRelease(v8[1]);
      *v8 = v18;
      v8[1] = v17;
      v9 = v3[7];

      *(_QWORD *)(v9 + 8 * v22) = v20;
      if (!v6)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v21;
    v24 = (uint64_t *)(v3[6] + 16 * v21);
    *v24 = v18;
    v24[1] = v17;
    *(_QWORD *)(v3[7] + 8 * v21) = v20;
    v25 = v3[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_34;
    v3[2] = v27;
    if (!v6)
      goto LABEL_11;
LABEL_10:
    v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_1000527BC()
{
  return sub_1000527E0() & 1;
}

uint64_t sub_1000527E0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_1000527E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain(a1);
  sub_100052818(a3);
  return swift_release(a1);
}

uint64_t sub_100052818(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  if ((*(_BYTE *)(v1 + 40) & 1) == 0 && (unint64_t)(result - 5) >= 0xFFFFFFFFFFFFFFFCLL)
    *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t sub_100052838()
{
  return sub_100052858();
}

uint64_t sub_100052858()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 40) == 1)
    return *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 168));
  else
    return *(_QWORD *)(v0 + 32);
}

uint64_t sub_100052884(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 32) = a3;
  return result;
}

void sub_1000528A4(char a1)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 40);
  *(_BYTE *)(v1 + 40) = a1;
  sub_1000159E0(v2);
}

uint64_t sub_1000528B4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 168));
}

uint64_t sub_1000528C4(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)((char *)v1 + *(_QWORD *)(*v1 + 168)) = result;
  v2 = *(_QWORD *)((char *)v1 + *(_QWORD *)(*v1 + 168));
  if ((unint64_t)(v2 - 1) <= 3)
    v1[4] = v2;
  return result;
}

uint64_t *sub_1000528F0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = (uint64_t)v0 + qword_1000A31D8;
  v3 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 152));
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 160));
  return v0;
}

uint64_t sub_100052978()
{
  uint64_t v0;

  sub_1000528F0();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

unint64_t sub_10005299C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A26D8;
  if (!qword_1000A26D8)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000A26D8);
  }
  return result;
}

uint64_t sub_1000529D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver_onOrientationLock + 8));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC8FaceTime30SpringBoardOrientationObserver____lazy_storage___cfObserver));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100052A4C()
{
  return type metadata accessor for SpringBoardOrientationObserver(0);
}

uint64_t initializeBufferWithCopyOfBuffer for SpringBoardOrientationObserver.OrientationStatus(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpringBoardOrientationObserver.OrientationStatus(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SpringBoardOrientationObserver.OrientationStatus(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_100052AB8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100052AD4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SpringBoardOrientationObserver.OrientationStatus()
{
  return &type metadata for SpringBoardOrientationObserver.OrientationStatus;
}

_QWORD *sub_100052B04(uint64_t a1)
{
  _QWORD *result;
  int v3;
  char v4;
  uint64_t v5;

  result = (_QWORD *)sub_100054804(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_10005488C(&v5, (uint64_t)result, v3, 0, a1);
}

void *sub_100052B8C(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  id v15;

  v4 = v3;
  if ((unint64_t)a3 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a3);
  for (; v7; v7 = _CocoaArrayWrapper.endIndex.getter(v14))
  {
    v8 = 4;
    while (1)
    {
      v9 = (a3 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, a3)
         : *(id *)(a3 + 8 * v8);
      v10 = v9;
      v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      v15 = v9;
      v12 = a1(&v15);
      if (v4)
      {
        swift_bridgeObjectRelease(a3);

        return v10;
      }
      if ((v12 & 1) != 0)
      {
        swift_bridgeObjectRelease(a3);
        return v10;
      }

      ++v8;
      if (v11 == v7)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    if (a3 < 0)
      v14 = a3;
    else
      v14 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
  }
LABEL_11:
  swift_bridgeObjectRelease(a3);
  return 0;
}

uint64_t sub_100052CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];

  v7 = objc_msgSend(*(id *)(v3 + 16), "recentCalls");
  if (!v7)
    return sub_1000536FC(a1);
  v8 = v7;
  v9 = sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

  __chkstk_darwin(v11, v12);
  v16[2] = a1;
  v13 = sub_100052B8C(sub_10004B25C, (uint64_t)v16, v10);
  swift_bridgeObjectRelease(v10);
  if (!v13)
    return sub_1000536FC(a1);
  v14 = sub_100052DB4(v13, a2, a3);

  return (uint64_t)v14;
}

id sub_100052DB4(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;

  v6 = objc_msgSend(a1, "remoteParticipantHandles");
  if (v6)
  {
    v7 = v6;
    v8 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v9 = sub_100054968();
    v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v7, v8, v9);

    if ((v10 & 0xC000000000000001) != 0)
    {
      if (v10 < 0)
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFFFFFFFF8;
      v12 = __CocoaSet.count.getter(v11);
    }
    else
    {
      v12 = *(_QWORD *)(v10 + 16);
    }
    swift_bridgeObjectRelease(v10);
    if (v12 < 2)
      return sub_100053518(a1);
    else
      return sub_100052F94(a1, a2, a3);
  }
  else
  {
    if (qword_1000A1EE8 != -1)
      swift_once(&qword_1000A1EE8, sub_10004DD24);
    v13 = qword_1000A4A20;
    v14 = sub_10001283C(&qword_1000A26E0);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_100067A10;
    v23 = a1;
    v16 = sub_100013580(0, (unint64_t *)&unk_1000A2EE0, CHRecentCall_ptr);
    v17 = a1;
    v18 = String.init<A>(reflecting:)(&v23, v16);
    v20 = v19;
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_100015724();
    *(_QWORD *)(v15 + 32) = v18;
    *(_QWORD *)(v15 + 40) = v20;
    v21 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Could not find any participants for recent call %@", 50, 2, &_mh_execute_header, v13, v21, v15);
    swift_bridgeObjectRelease(v15);
    return 0;
  }
}

id sub_100052F94(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  Class isa;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t **v33;
  id v34;
  Class v35;
  Class v36;
  id v37;
  id result;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD aBlock[5];
  uint64_t v49;

  v7 = *(void **)(v3 + 16);
  v8 = sub_10001283C((uint64_t *)&unk_1000A3190);
  v9 = swift_allocObject(v8, 40, 7);
  *(_OWORD *)(v9 + 16) = xmmword_100067DD0;
  v10 = sub_100013580(0, (unint64_t *)&unk_1000A3460, off_100088D10);
  v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(v10), "descriptorForRequiredKeys");
  *(_QWORD *)(v9 + 32) = v11;
  aBlock[0] = v9;
  specialized Array._endMutation()(v11);
  v12 = v9;
  sub_10001283C(&qword_1000A24A0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v14 = objc_msgSend(v7, "contactByHandleForRecentCall:keyDescriptors:", a1, isa);

  if (v14)
  {
    v15 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v16 = sub_100013580(0, &qword_1000A2B88, CNContact_ptr);
    v17 = sub_100054968();
    v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v14, v15, v16, v17);

  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(a1, "validRemoteParticipantHandles");
  if (v19)
  {
    v20 = v19;
    v21 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v22 = sub_100054968();
    v23 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v20, v21, v22);

    swift_bridgeObjectRetain(v18);
    v24 = a1;
    sub_10001390C(v23, v18, v24);
    v26 = v25;
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease_n(v18, 2);

    if (!((unint64_t)v26 >> 62))
      goto LABEL_6;
LABEL_18:
    if (v26 < 0)
      v46 = v26;
    else
      v46 = v26 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v26);
    v47 = _CocoaArrayWrapper.endIndex.getter(v46);
    swift_bridgeObjectRelease(v26);
    if (v47 < 1)
      goto LABEL_25;
    goto LABEL_7;
  }
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v18);
  v26 = (uint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)_swiftEmptyArrayStorage >> 62)
    goto LABEL_18;
LABEL_6:
  if (*(uint64_t *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10) < 1)
  {
LABEL_25:
    swift_bridgeObjectRelease(v26);
    return 0;
  }
LABEL_7:
  v27 = objc_msgSend(a1, "validRemoteParticipantHandles");
  if (!v27)
    goto LABEL_25;
  v28 = v27;
  v29 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
  v30 = sub_100054968();
  v31 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v28, v29, v30);

  if ((v31 & 0xC000000000000001) == 0)
  {
    if (*(uint64_t *)(v31 + 16) >= 1)
      goto LABEL_13;
    goto LABEL_24;
  }
  if (v31 < 0)
    v32 = v31;
  else
    v32 = v31 & 0xFFFFFFFFFFFFFF8;
  if (__CocoaSet.count.getter(v32) < 1)
  {
LABEL_24:
    swift_bridgeObjectRelease(v31);
    goto LABEL_25;
  }
LABEL_13:
  v33 = sub_1000541C0(v31);
  swift_bridgeObjectRelease(v31);
  v34 = objc_allocWithZone((Class)PHContactsTableViewController);
  sub_100013580(0, &qword_1000A2B88, CNContact_ptr);
  v35 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v26);
  v36 = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v33);
  v37 = objc_msgSend(v34, "initWithContactArray:contactHandles:", v35, v36);

  objc_msgSend(v37, "setEdgesForExtendedLayout:", 0);
  result = objc_msgSend(v37, "tableView");
  if (result)
  {
    v39 = result;
    v40 = (void *)objc_opt_self(UIColor);
    v41 = objc_msgSend(v40, "clearColor");
    objc_msgSend(v39, "setBackgroundColor:", v41);

    result = objc_msgSend(v37, "tableView");
    if (result)
    {
      v42 = result;
      v43 = objc_msgSend(v40, "systemGrayColor");
      objc_msgSend(v42, "setSeparatorColor:", v43);

      if (a2)
      {
        aBlock[4] = a2;
        v49 = a3;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_10005347C;
        aBlock[3] = &unk_10008AFE8;
        v44 = _Block_copy(aBlock);
        v45 = v49;
        swift_retain(a3);
        swift_release(v45);
      }
      else
      {
        v44 = 0;
      }
      objc_msgSend(v37, "setCustomInfoButtonAction:", v44);
      _Block_release(v44);
      return v37;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_10005347C(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13;
  void (*v14)(void *, id, double, double, double, double);
  id v15;
  id v16;

  v14 = *(void (**)(void *, id, double, double, double, double))(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  swift_retain(v13);
  v16 = a2;
  v15 = a3;
  v14(a2, v15, a4, a5, a6, a7);
  swift_release(v13);

}

id sub_100053518(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSString v13;
  NSString *const *v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  _OWORD v19[2];
  _BYTE v20[24];
  uint64_t v21;

  v3 = objc_msgSend((id)objc_opt_self(PHRecentsTableViewController), "contactViewControllerForRecentCall:recentsController:", a1, *(_QWORD *)(v1 + 16));
  if (v3)
  {
    v4 = (void *)objc_opt_self(PHRecentsHeaderView);
    v5 = v3;
    v6 = objc_msgSend(v4, "headerViewWithFrame:recentCall:", a1, 0.0, 0.0, 0.0, 0.0);
    if (v6)
    {
      v7 = v6;
      _bridgeAnyObjectToAny(_:)(v19, v6);
      swift_unknownObjectRelease(v7, v8);
    }
    else
    {
      memset(v19, 0, sizeof(v19));
    }
    sub_100054920((uint64_t)v19, (uint64_t)v20);
    if (v21)
    {
      v9 = sub_100013580(0, (unint64_t *)&unk_1000A3480, off_100088D20);
      if ((swift_dynamicCast(&v18, v20, (char *)&type metadata for Any + 8, v9, 6) & 1) != 0)
      {
        v10 = v18;
        goto LABEL_10;
      }
    }
    else
    {
      sub_10001287C((uint64_t)v20, &qword_1000A2AB0);
    }
    v10 = 0;
LABEL_10:
    objc_msgSend(v5, "setContactHeaderView:", v10);

    objc_msgSend(v5, "setContactHeaderViewController:", 0);
    v11 = v5;
    v12 = objc_msgSend(a1, "handleType");
    if (v12 == (id)2)
    {
      v14 = &CNContactPhoneNumbersKey;
    }
    else
    {
      v13 = 0;
      if (v12 != (id)3)
      {
LABEL_15:
        objc_msgSend(v11, "setPrimaryPropertyKey:", v13);

        return v3;
      }
      v14 = &CNContactEmailAddressesKey;
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)(*v14);
    v16 = v15;
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
    goto LABEL_15;
  }
  return v3;
}

uint64_t sub_1000536FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  Class isa;
  uint64_t v51;
  Class v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t result;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  NSString v73;
  NSString *const *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v2 = v1;
  v4 = type metadata accessor for RecentsCallItem(0);
  v5 = *(_QWORD *)(v4 - 8);
  v7 = __chkstk_darwin(v4, v6);
  v9 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  v12 = (char *)&v77 - v11;
  v13 = sub_10001283C((uint64_t *)&unk_1000A2BB0);
  v15 = __chkstk_darwin(v13, v14);
  v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  v20 = (char *)&v77 - v19;
  v21 = sub_100053DF4();
  if (!v21)
  {
    if (qword_1000A1EE8 != -1)
      swift_once(&qword_1000A1EE8, sub_10004DD24);
    v29 = qword_1000A4A20;
    v30 = sub_10001283C(&qword_1000A26E0);
    v31 = swift_allocObject(v30, 72, 7);
    *(_OWORD *)(v31 + 16) = xmmword_100067A10;
    v32 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v32(v20, a1, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v20, 0, 1, v4);
    sub_1000542B8((uint64_t)v20, (uint64_t)v17);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v17, 1, v4) == 1)
    {
      sub_10001287C((uint64_t)v17, (uint64_t *)&unk_1000A2BB0);
      v33 = 0xE300000000000000;
      v34 = 7104878;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v12, v17, v4);
      v32(v9, (uint64_t)v12, v4);
      v34 = String.init<A>(reflecting:)(v9, v4);
      v33 = v35;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
    }
    sub_10001287C((uint64_t)v20, (uint64_t *)&unk_1000A2BB0);
    *(_QWORD *)(v31 + 56) = &type metadata for String;
    *(_QWORD *)(v31 + 64) = sub_100015724();
    *(_QWORD *)(v31 + 32) = v34;
    *(_QWORD *)(v31 + 40) = v33;
    v36 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Could not retrieve handle for call item %@", 42, 2, &_mh_execute_header, v29, v36, v31);
    swift_bridgeObjectRelease(v31);
    return 0;
  }
  v22 = v21;
  v23 = sub_10001283C((uint64_t *)&unk_1000A3190);
  v24 = swift_allocObject(v23, 40, 7);
  *(_OWORD *)(v24 + 16) = xmmword_100067DD0;
  v25 = sub_100013580(0, (unint64_t *)&unk_1000A3460, off_100088D10);
  v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(v25), "descriptorForRequiredKeys");
  *(_QWORD *)(v24 + 32) = v26;
  v78 = v24;
  specialized Array._endMutation()(v26);
  v27 = objc_msgSend(v22, "type");
  if (v27 == (id)1)
  {
    v28 = (id *)&CNContactSocialProfilesKey;
  }
  else if (v27 == (id)2)
  {
    v28 = (id *)&CNContactPhoneNumbersKey;
  }
  else
  {
    if (v27 != (id)3)
      goto LABEL_17;
    v28 = (id *)&CNContactEmailAddressesKey;
  }
  v38 = *v28;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v38);
  v40 = *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v39 = *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v40 >= v39 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1);
  v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v38);
  specialized Array._endMutation()(v41);
LABEL_17:
  v42 = objc_msgSend((id)objc_opt_self(TUCallCenter), "sharedInstance");
  v43 = objc_msgSend(v42, "contactStore");

  v44 = sub_10001283C((uint64_t *)&unk_1000A2C10);
  v45 = swift_allocObject(v44, 48, 7);
  *(_OWORD *)(v45 + 16) = xmmword_100067A10;
  v46 = objc_msgSend(v22, "value");
  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  v49 = v48;

  *(_QWORD *)(v45 + 32) = v47;
  *(_QWORD *)(v45 + 40) = v49;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v45);
  v51 = v78;
  sub_10001283C(&qword_1000A24A0);
  v52 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v51);
  v53 = objc_msgSend(v43, "contactsByContactHandleForContactHandles:keyDescriptors:", isa, v52);

  v54 = sub_10001283C(&qword_1000A2B90);
  v55 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v53, &type metadata for String, v54, &protocol witness table for String);

  sub_100052B04(v55);
  v57 = v56;
  v59 = v58;
  swift_bridgeObjectRelease(v55);
  if (!v57)
  {
LABEL_29:
    sub_100013580(0, (unint64_t *)&unk_1000A3470, CNMutableContact_ptr);
    v62 = (void *)CNMutableContact.init(handle:)(v22);
LABEL_30:
    v65 = objc_msgSend(v62, "hasBeenPersisted");
    v66 = (void *)objc_opt_self(PHContactViewController);
    if (v65)
    {
      v67 = objc_msgSend(v66, "viewControllerForContact:", v62);
      objc_msgSend(v67, "setShouldShowLinkedContacts:", 1);
    }
    else
    {
      v67 = objc_msgSend(v66, "viewControllerForUnknownContact:", v62);
    }
    objc_msgSend(v67, "setContactHeaderViewController:", 0);
    v68 = v67;
    objc_msgSend(v68, "setActions:", (unint64_t)objc_msgSend(v68, "actions") | 0x80);

    v69 = *(void **)(v2 + 16);
    v70 = v68;
    v71 = objc_msgSend(v69, "suggestedContactStore");
    objc_msgSend(v70, "setContactStore:", v71);

    v37 = v70;
    v72 = objc_msgSend(v22, "type");
    if (v72 == (id)2)
    {
      v74 = &CNContactPhoneNumbersKey;
    }
    else
    {
      v73 = 0;
      if (v72 != (id)3)
      {
LABEL_38:
        objc_msgSend(v37, "setPrimaryPropertyKey:", v73);

        return (uint64_t)v37;
      }
      v74 = &CNContactEmailAddressesKey;
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)(*v74);
    v76 = v75;
    v73 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v76);
    goto LABEL_38;
  }
  result = swift_bridgeObjectRelease(v57);
  if (!((unint64_t)v59 >> 62))
  {
    if (*(_QWORD *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_20;
    goto LABEL_28;
  }
  if (v59 >= 0)
    v63 = v59 & 0xFFFFFFFFFFFFFF8;
  else
    v63 = v59;
  swift_bridgeObjectRetain(v59);
  v64 = _CocoaArrayWrapper.endIndex.getter(v63);
  result = swift_bridgeObjectRelease(v59);
  if (!v64)
  {
LABEL_28:
    swift_bridgeObjectRelease(v59);
    goto LABEL_29;
  }
LABEL_20:
  if ((v59 & 0xC000000000000001) != 0)
  {
    v61 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v59);
    goto LABEL_23;
  }
  if (*(_QWORD *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v61 = *(id *)(v59 + 32);
LABEL_23:
    v62 = v61;
    swift_bridgeObjectRelease(v59);
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

id sub_100053DF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  int v21;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  v2 = type metadata accessor for RecentsCallItemType(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = type metadata accessor for RecentCallRecentItemMetadata(0);
  v7 = *(_QWORD *)(v31 - 8);
  __chkstk_darwin(v31, v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for RecentsCallItem(0);
  v12 = *(_QWORD *)(v11 - 8);
  v14 = __chkstk_darwin(v11, v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = RecentsCallItem.hasVideoMessage.getter(v14);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v1, v11);
  if ((v17 & 1) != 0)
  {
    v19 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, v11);
  }
  else
  {
    v20 = RecentsCallItem.hasAudioMessage.getter(v18);
    v19 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    if ((v20 & 1) == 0)
      return 0;
  }
  RecentsCallItem.type.getter(v19);
  v21 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  v23 = v21 == enum case for RecentsCallItemType.recent(_:)
     || v21 == enum case for RecentsCallItemType.ongoing(_:)
     || v21 == enum case for RecentsCallItemType.link(_:);
  if (v23
    || (v21 != enum case for RecentsCallItemType.videoMessage(_:)
      ? (v24 = v21 == enum case for RecentsCallItemType.audioMessage(_:))
      : (v24 = 1),
        !v24))
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
  v25 = v31;
  v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))(v10, v6, v31);
  v27 = (void *)RecentCallRecentItemMetadata.messageIndicatorViewModel.getter(v26);
  v28 = objc_msgSend(v27, "fromHandle");

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v25);
  return v28;
}

uint64_t sub_100054024()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100054048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100052CAC(a1, a2, a3);
}

id sub_100054068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100054080(a1, a2, a3, (SEL *)&selRef_viewControllerForContact_);
}

id sub_100054074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100054080(a1, a2, a3, (SEL *)&selRef_viewControllerForUnknownContact_);
}

id sub_100054080(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  return objc_msgSend((id)objc_opt_self(PHContactViewController), *a4, a1);
}

id sub_1000540BC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100052DB4(a1, a2, a3);
}

_QWORD *sub_1000540DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v3 = sub_10001283C((uint64_t *)&unk_1000A2C10);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_100054300((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_100045D18(v8);
  if (v7 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t **sub_1000541C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t **v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t **result;
  uint64_t v9;

  v1 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      goto LABEL_5;
    return (uint64_t **)_swiftEmptyArrayStorage;
  }
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  v2 = __CocoaSet.count.getter(a1);
  if (!v2)
    return (uint64_t **)_swiftEmptyArrayStorage;
LABEL_5:
  if (v2 <= 0)
  {
    v4 = (uint64_t **)_swiftEmptyArrayStorage;
  }
  else
  {
    v3 = sub_10001283C((uint64_t *)&unk_1000A3190);
    v4 = (uint64_t **)swift_allocObject(v3, 8 * v2 + 32, 7);
    v5 = j__malloc_size(v4);
    v6 = v5 - 32;
    if (v5 < 32)
      v6 = v5 - 25;
    v4[2] = (uint64_t *)v2;
    v4[3] = (uint64_t *)((2 * (v6 >> 3)) | 1);
  }
  swift_bridgeObjectRetain(v1);
  v7 = sub_1000544FC(&v9, v4 + 4, v2, v1);
  result = (uint64_t **)sub_100045D18(v9);
  if (v7 == (uint64_t *)v2)
    return v4;
  __break(1u);
  return result;
}

uint64_t sub_1000542B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10001283C((uint64_t *)&unk_1000A2BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100054300(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain(v21);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t *sub_1000544FC(uint64_t *result, uint64_t **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t *v36;
  _QWORD v37[5];

  v4 = a4;
  v6 = a2;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a4 < 0)
      v8 = a4;
    else
      v8 = a4 & 0xFFFFFFFFFFFFFF8;
    v9 = __CocoaSet.makeIterator()(v8);
    v10 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    v11 = sub_100054968();
    result = Set.Iterator.init(_cocoa:)(v37, v9, v10, v11);
    v4 = v37[0];
    v12 = v37[1];
    v13 = v37[2];
    v14 = v37[3];
    v15 = v37[4];
    v33 = v7;
    if (v6)
      goto LABEL_6;
LABEL_39:
    v16 = 0;
LABEL_49:
    *v33 = v4;
    v33[1] = v12;
    v33[2] = v13;
    v33[3] = v14;
    v33[4] = v15;
    return (uint64_t *)v16;
  }
  v14 = 0;
  v29 = -1 << *(_BYTE *)(a4 + 32);
  v12 = a4 + 56;
  v13 = ~v29;
  v30 = -v29;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  else
    v31 = -1;
  v15 = v31 & *(_QWORD *)(a4 + 56);
  v33 = result;
  if (!a2)
    goto LABEL_39;
LABEL_6:
  if (!a3)
  {
    v16 = 0;
    goto LABEL_49;
  }
  if (a3 < 0)
    goto LABEL_51;
  v16 = 0;
  v34 = (unint64_t)(v13 + 64) >> 6;
  v32 = v13;
  while (1)
  {
    if (v4 < 0)
    {
      v23 = v12;
      v24 = __CocoaSet.Iterator.next()(result);
      if (!v24)
        goto LABEL_48;
      v25 = v24;
      v35 = v24;
      v26 = sub_100013580(0, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
      swift_unknownObjectRetain(v25);
      swift_dynamicCast(&v36, &v35, (char *)&type metadata for Swift.AnyObject + 8, v26, 7);
      v19 = v36;
      result = (uint64_t *)swift_unknownObjectRelease(v25, v27);
      v12 = v23;
      if (!v19)
        goto LABEL_48;
      goto LABEL_11;
    }
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v14 << 6);
      goto LABEL_10;
    }
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v20 >= v34)
    {
      v15 = 0;
      goto LABEL_48;
    }
    v21 = *(_QWORD *)(v12 + 8 * v20);
    if (v21)
      goto LABEL_26;
    v22 = v14 + 2;
    if (v14 + 2 >= v34)
    {
      v15 = 0;
      ++v14;
      goto LABEL_48;
    }
    v21 = *(_QWORD *)(v12 + 8 * v22);
    if (!v21)
    {
      if (v14 + 3 >= v34)
        goto LABEL_45;
      v21 = *(_QWORD *)(v12 + 8 * (v14 + 3));
      if (v21)
      {
        v20 = v14 + 3;
        goto LABEL_26;
      }
      v22 = v14 + 4;
      if (v14 + 4 >= v34)
      {
        v15 = 0;
        v14 += 3;
        goto LABEL_48;
      }
      v21 = *(_QWORD *)(v12 + 8 * v22);
      if (!v21)
      {
        v20 = v14 + 5;
        if (v14 + 5 >= v34)
        {
LABEL_45:
          v15 = 0;
          v14 = v22;
          goto LABEL_48;
        }
        v21 = *(_QWORD *)(v12 + 8 * v20);
        if (!v21)
        {
          v28 = v14 + 6;
          while (v34 != v28)
          {
            v21 = *(_QWORD *)(v12 + 8 * v28++);
            if (v21)
            {
              v20 = v28 - 1;
              goto LABEL_26;
            }
          }
          v15 = 0;
          v14 = v34 - 1;
          goto LABEL_48;
        }
        goto LABEL_26;
      }
    }
    v20 = v22;
LABEL_26:
    v15 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v20 << 6);
    v14 = v20;
LABEL_10:
    result = (uint64_t *)*(id *)(*(_QWORD *)(v4 + 48) + 8 * v18);
    v19 = result;
    if (!result)
      goto LABEL_48;
LABEL_11:
    ++v16;
    *v6++ = v19;
    if (v16 == a3)
    {
      v16 = a3;
LABEL_48:
      v13 = v32;
      goto LABEL_49;
    }
  }
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_100054804(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_QWORD *sub_10005488C(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = (uint64_t *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = *v5;
    v7 = v5[1];
    v8 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * a2);
    *result = v8;
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    return (_QWORD *)v6;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_100054920(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10001283C(&qword_1000A2AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100054968()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000A3490;
  if (!qword_1000A3490)
  {
    v1 = sub_100013580(255, (unint64_t *)&unk_1000A2BC0, CHHandle_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000A3490);
  }
  return result;
}

uint64_t sub_1000549C0(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD);
  _BYTE v9[24];

  v4 = a3 + 16;
  swift_beginAccess(a3 + 16, v9, 0, 0);
  result = swift_weakLoadStrong(v4);
  if (result)
  {
    v6 = result;
    v8 = *(void (**)(_QWORD))(result + 40);
    v7 = *(_QWORD *)(result + 48);
    swift_retain(v7);
    swift_release(v6);
    v8(a2 & 1);
    return swift_release(v7);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for OrientationMonitorLockedStatus(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OrientationMonitorLockedStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_100054B1C + 4 * byte_100068475[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100054B50 + 4 * byte_100068470[v4]))();
}

uint64_t sub_100054B50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100054B58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100054B60);
  return result;
}

uint64_t sub_100054B6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100054B74);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100054B78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100054B80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100054B8C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OrientationMonitorLockedStatus()
{
  return &type metadata for OrientationMonitorLockedStatus;
}

unint64_t sub_100054BAC()
{
  unint64_t result;

  result = qword_1000A3588;
  if (!qword_1000A3588)
  {
    result = swift_getWitnessTable(&unk_100068540, &type metadata for OrientationMonitorLockedStatus);
    atomic_store(result, (unint64_t *)&qword_1000A3588);
  }
  return result;
}

BOOL sub_100054BF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC8FaceTimeP33_DAA8DC7DA45215E4A59FBAD2FDFF4DF419ResourceBundleClass);
}

void sub_100054C28(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy", v1, 2u);
}

void sub_100054C68(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy, mobileGestaltErrorCode: %d", (uint8_t *)v3, 8u);
}

void sub_100054CE0(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v5 = 138412290;
  v6 = v3;
  sub_10001CC18((void *)&_mh_execute_header, a2, v4, "Error launching InCallService: %@", (uint8_t *)&v5);

}

void sub_100054D6C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10001CC18((void *)&_mh_execute_header, a2, a3, "Could not initiate a voicemail call due to a nil URL from the dial request (%@).", (uint8_t *)&v3);
}

void sub_100054DD8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10001CC18((void *)&_mh_execute_header, a2, a3, "Could not initiate a voicemail call due to an invalid dial request (%@).", (uint8_t *)&v3);
}

void sub_100054E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100024FB4();
  sub_100024F9C((void *)&_mh_execute_header, v0, v1, "Error retrieving extensions: %@", v2, v3, v4, v5, v6);
  sub_100024FAC();
}

void sub_100054EA4()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Boolean PHSBSGetScreenLockStatus(Boolean *)"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PHInCallUIUtilities.m"), 28, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_100054F18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100024FB4();
  sub_100024F9C((void *)&_mh_execute_header, v0, v1, "Received subscriptionInfo: %@ with no subscriptions", v2, v3, v4, v5, v6);
  sub_100024FAC();
}

void sub_100054F78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100024FB4();
  sub_100024F9C((void *)&_mh_execute_header, v0, v1, "Received error: %@ while querying -getSubscriptionInfoWithError", v2, v3, v4, v5, v6);
  sub_100024FAC();
}

void sub_100054FD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100024FB4();
  sub_100024F9C((void *)&_mh_execute_header, v0, v1, "ShowExplicitCallTransferButton: received subscriptionInfo: %@ with no subscriptions", v2, v3, v4, v5, v6);
  sub_100024FAC();
}

void sub_100055038()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100024FB4();
  sub_100024F9C((void *)&_mh_execute_header, v0, v1, "ShowExplicitCallTransferButton: received error: %@ while querying -getSubscriptionInfoWithError", v2, v3, v4, v5, v6);
  sub_100024FAC();
}

void sub_100055098(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PHInCallUIUtilities.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_100055114(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type of scene: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100055188(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "-[CHRecentCall handleType] returned a value of CHHandleTypeUnknown", v1, 2u);
}

void sub_1000551C8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not enable data usage. error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10005523C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No rttConversation found", v1, 2u);
}

void sub_10005527C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Could not create a dial request for the recent call (%@).", a5, a6, a7, a8, 2u);
  sub_100024FAC();
}

void sub_1000552E4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error initiating dial request %@: %@", (uint8_t *)&v4, 0x16u);
  sub_100024FAC();
}

void sub_100055368(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Failed to fetch unified contact for identifier: %@", a5, a6, a7, a8, 2u);
  sub_100024FAC();
}

void sub_1000553CC(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedHandleTypes"));
  v8 = 134218498;
  v9 = a2;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not create a dial request due to an invalid handle type (%zd). For call provider %@, the supported handle types are (%@).", (uint8_t *)&v8, 0x20u);

}

void sub_100055498(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000318F8((void *)&_mh_execute_header, a1, a3, "User activity does not contains a user info dictionary.", a5, a6, a7, a8, 0);
}

void sub_1000554CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000318F8((void *)&_mh_execute_header, a1, a3, "User activity is missing the required key TUCallUserActivityProviderIdentifierKey.", a5, a6, a7, a8, 0);
}

void sub_100055500(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retrieve a call provider for the specified identifier %@.", (uint8_t *)&v2, 0xCu);
}

void sub_100055574(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100024FAC();
}

void sub_1000555E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Contact fetch failed with the following error: %@", a5, a6, a7, a8, 2u);
  sub_100024FAC();
}

void sub_100055648()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100038C60();
  sub_100038C48((void *)&_mh_execute_header, v0, v1, "Registering", v2, v3, v4, v5, v6);
  sub_100038C58();
}

void sub_100055674()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100038C60();
  sub_100038C48((void *)&_mh_execute_header, v0, v1, "AKTapToSignInViewController results had username+password", v2, v3, v4, v5, v6);
  sub_100038C58();
}

void sub_1000556A0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100038C60();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Authentication handler: Missing either username or password", v1, 2u);
  sub_100038C58();
}

void sub_1000556D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100038C60();
  sub_100038C48((void *)&_mh_execute_header, v0, v1, "AKTapToSignInViewController obtained results", v2, v3, v4, v5, v6);
  sub_100038C58();
}

void sub_100055704(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not authenticate: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100055778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100038C60();
  sub_100038C48((void *)&_mh_execute_header, v0, v1, "AKTapToSignInViewController callback", v2, v3, v4, v5, v6);
  sub_100038C58();
}

void sub_1000557A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100038C60();
  sub_100038C48((void *)&_mh_execute_header, v0, v1, "Success! Calling completion block", v2, v3, v4, v5, v6);
  sub_100038C58();
}

void sub_1000557D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100038C60();
  sub_100038C48((void *)&_mh_execute_header, v0, v1, "Failure. showing error alert", v2, v3, v4, v5, v6);
  sub_100038C58();
}

void sub_1000557FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100038C60();
  sub_100038C48((void *)&_mh_execute_header, v0, v1, "Handling registration callback", v2, v3, v4, v5, v6);
  sub_100038C58();
}

void sub_100055828(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a CNPhoneNumber for the specified telephone number (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_10005589C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Failed to parse message UUID from URL: %@", a5, a6, a7, a8, 2u);
}

void sub_100055904(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Failed to parse message uniqueID from URL: %@", a5, a6, a7, a8, 2u);
}

void sub_10005596C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Invalid test definitions iterations value was provided: %@.", a5, a6, a7, a8, 2u);
  sub_100024FAC();
}

void sub_1000559D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Could not perform scroll test %@; a scroll view does not exist.",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_100024FAC();
}

void sub_100055A34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100024F9C((void *)&_mh_execute_header, a2, a3, "Invalid test definitions delta value was provided: %@.", a5, a6, a7, a8, 2u);
  sub_100024FAC();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGFloatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGFloatValue");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_HIDEventSystemClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HIDEventSystemClient");
}

id objc_msgSend_TTYActionImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TTYActionImage");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLContexts");
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

id objc_msgSend__accessibilityHigherContrastTintColorForColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColor:");
}

id objc_msgSend__accessibilitySetInterfaceStyleIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilitySetInterfaceStyleIntent:");
}

id objc_msgSend__applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:");
}

id objc_msgSend__applyAutoRotationCorrectionForOrientation_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:");
}

id objc_msgSend__applyPreviewMSROptimizationTransformsForOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyPreviewMSROptimizationTransformsForOrientation:");
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baselineOffsetFromBottom");
}

id objc_msgSend__bodyLeading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bodyLeading");
}

id objc_msgSend__buildView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildView");
}

id objc_msgSend__carScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_carScreen");
}

id objc_msgSend__constrainRegistrationView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constrainRegistrationView");
}

id objc_msgSend__contentViewWidthForApplicationBoundsSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentViewWidthForApplicationBoundsSize:");
}

id objc_msgSend__createWindowFromScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createWindowFromScene:");
}

id objc_msgSend__currentTraitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentTraitCollection");
}

id objc_msgSend__destroyFirstRunController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destroyFirstRunController");
}

id objc_msgSend__deviceSpecificImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSpecificImageNamed:");
}

id objc_msgSend__dissociateVideoLayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dissociateVideoLayers");
}

id objc_msgSend__effectCopyingFromCaptureGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectCopyingFromCaptureGroup:");
}

id objc_msgSend__encodedDialerStringSkippingUnmappedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodedDialerStringSkippingUnmappedCharacters:");
}

id objc_msgSend__ensureLocalVideoWillBecomeVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureLocalVideoWillBecomeVisible");
}

id objc_msgSend__ensureProperPositionForContentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureProperPositionForContentView");
}

id objc_msgSend__ensureVideoLayersExist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureVideoLayersExist");
}

id objc_msgSend__faceTimeInvitationExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_faceTimeInvitationExists");
}

id objc_msgSend__fadeInLocalVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fadeInLocalVideo");
}

id objc_msgSend__fetchScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchScrollView");
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flatImageWithColor:");
}

id objc_msgSend__ftFailedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ftFailedTest:");
}

id objc_msgSend__ftStartedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ftStartedTest:");
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_graphicsQuality");
}

id objc_msgSend__inProgressRegisteringNonPhoneAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inProgressRegisteringNonPhoneAccount");
}

id objc_msgSend__initWithFrame_recentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithFrame:recentCall:");
}

id objc_msgSend__initializeUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeUI");
}

id objc_msgSend__intents_extensionMatchingAttributesForIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intents_extensionMatchingAttributesForIntents:");
}

id objc_msgSend__isAnimatingScroll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAnimatingScroll");
}

id objc_msgSend__isAnimatingZoom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAnimatingZoom");
}

id objc_msgSend__isBlurUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isBlurUI");
}

id objc_msgSend__isValidFaceTimeOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidFaceTimeOrientation:");
}

id objc_msgSend__keypadImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keypadImage");
}

id objc_msgSend__makeCalloutVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeCalloutVisible:");
}

id objc_msgSend__performScrollTest_iterations_delta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:");
}

id objc_msgSend__phImageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_phImageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend__previewMSROptimizationCompensationForOrientation_withTransform_withBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_previewMSROptimizationCompensationForOrientation:withTransform:withBounds:");
}

id objc_msgSend__primitiveSetNavigationControllerContentInsetAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_primitiveSetNavigationControllerContentInsetAdjustment:");
}

id objc_msgSend__primitiveSetNavigationControllerContentOffsetAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_primitiveSetNavigationControllerContentOffsetAdjustment:");
}

id objc_msgSend__requestMakeCutCopyPasteCalloutVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestMakeCutCopyPasteCalloutVisible:");
}

id objc_msgSend__resetCurrentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetCurrentViewController");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__scene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scene");
}

id objc_msgSend__screen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screen");
}

id objc_msgSend__setCaptureView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCaptureView:");
}

id objc_msgSend__setClipUnderlapWhileTransitioning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setClipUnderlapWhileTransitioning:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setDefaultTopNavBarTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDefaultTopNavBarTintColor:");
}

id objc_msgSend__setGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGroupName:");
}

id objc_msgSend__setHidesShadow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHidesShadow:");
}

id objc_msgSend__setInternalTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInternalTitle:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setupVideoLayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupVideoLayers");
}

id objc_msgSend__sharedDetailDisclosureImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharedDetailDisclosureImage");
}

id objc_msgSend__sharedTTYDirectImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharedTTYDirectImage");
}

id objc_msgSend__sharedTTYRelayImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharedTTYRelayImage");
}

id objc_msgSend__shouldShowAuthKitSignIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowAuthKitSignIn");
}

id objc_msgSend__startListeningForKeyboardNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startListeningForKeyboardNotifications");
}

id objc_msgSend__stopListeningToKeyboardNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopListeningToKeyboardNotifications");
}

id objc_msgSend__thinSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_thinSystemFontOfSize:");
}

id objc_msgSend__tuVideoDeviceOrientationForDeviceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tuVideoDeviceOrientationForDeviceOrientation:");
}

id objc_msgSend__updateLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLayout");
}

id objc_msgSend__updateLocalPreviewStatusBarGradient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocalPreviewStatusBarGradient");
}

id objc_msgSend__updateLocalVideoOrientationAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocalVideoOrientationAnimated:");
}

id objc_msgSend__updateRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRootViewController");
}

id objc_msgSend__updateTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTextColor");
}

id objc_msgSend__userHasAlreadyBeenPrompted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userHasAlreadyBeenPrompted");
}

id objc_msgSend__verifiedCheckmarkImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifiedCheckmarkImage");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountType");
}

id objc_msgSend_accountUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountUUID");
}

id objc_msgSend_accountsForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsForService:");
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButton");
}

id objc_msgSend_actionButtonImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButtonImage");
}

id objc_msgSend_actionButtonImageForActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButtonImageForActionType:");
}

id objc_msgSend_actionButtonTappedHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButtonTappedHandler");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actions");
}

id objc_msgSend_activateAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAccount:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationState");
}

id objc_msgSend_activeConversationForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConversationForCall:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeInterfaceOrientation");
}

id objc_msgSend_activeVideoCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeVideoCall");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addContactButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContactButton");
}

id objc_msgSend_addContactButtonTopConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContactButtonTopConstraint");
}

id objc_msgSend_addContactButtonTopConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContactButtonTopConstraintConstant");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addDurationAndDataSubview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDurationAndDataSubview");
}

id objc_msgSend_addEmergencyItemsSubview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEmergencyItemsSubview");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerID:capabilities:");
}

id objc_msgSend_addListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerID:forService:");
}

id objc_msgSend_addNotificationObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationObservers");
}

id objc_msgSend_addNumberFontSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNumberFontSize");
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

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addRTTInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRTTInfo");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_addUserNotification_listener_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserNotification:listener:completionHandler:");
}

id objc_msgSend_addVerifiedBadge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVerifiedBadge");
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airplaneMode");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowedNotificationCategories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedNotificationCategories");
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alpha");
}

id objc_msgSend_alwaysShowLocalVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alwaysShowLocalVideo");
}

id objc_msgSend_ambientHorizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ambientHorizontalSizeClass");
}

id objc_msgSend_ambientVerticalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ambientVerticalSizeClass");
}

id objc_msgSend_analyticsLogger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsLogger");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animation");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendPath:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleAccountRebrandEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleAccountRebrandEnabled");
}

id objc_msgSend_applicationOpenURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationOpenURL:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationState");
}

id objc_msgSend_applicationTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationTintColor");
}

id objc_msgSend_applicationsForUserActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationsForUserActivityType:");
}

id objc_msgSend_applyLayoutConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyLayoutConstraints");
}

id objc_msgSend_areKeysAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areKeysAvailable:");
}

id objc_msgSend_arrangedSubviewInColumnAtIndex_rowAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrangedSubviewInColumnAtIndex:rowAtIndex:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ascender");
}

id objc_msgSend_associateLocalVideoLayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateLocalVideoLayers");
}

id objc_msgSend_attributedStringForName_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringForName:label:");
}

id objc_msgSend_attributedStringToHighlightText_primaryColour_secondaryColour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringToHighlightText:primaryColour:secondaryColour:");
}

id objc_msgSend_attributedStringToHighlightText_primaryColour_secondaryColour_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringToHighlightText:primaryColour:secondaryColour:style:");
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedText");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_autoresizingMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoresizingMask");
}

id objc_msgSend_availabilityForListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availabilityForListenerID:forService:");
}

id objc_msgSend_availableKeyDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableKeyDescriptor");
}

id objc_msgSend_avatarLayoutGuideLeadingAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avatarLayoutGuideLeadingAnchorLayoutConstraintConstant");
}

id objc_msgSend_avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:");
}

id objc_msgSend_avatarLayoutGuideWidthAnchorLayoutConstraintConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avatarLayoutGuideWidthAnchorLayoutConstraintConstant:");
}

id objc_msgSend_avatarViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avatarViewController");
}

id objc_msgSend_avatarViewControllerSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avatarViewControllerSettings");
}

id objc_msgSend_backdropStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backdropStyle");
}

id objc_msgSend_backdropView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backdropView");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_badge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badge");
}

id objc_msgSend_baseViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseViewController");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginUpdates");
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginningOfDocument");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockUntilConnected");
}

id objc_msgSend_blockedByExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockedByExtension");
}

id objc_msgSend_blurRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blurRadius");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:defaultValue:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boostQualityOfService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boostQualityOfService");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bottommostLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottommostLabel");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_cachedIsUsingIPadExternalCamera(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedIsUsingIPadExternalCamera");
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendar");
}

id objc_msgSend_callDirectoryIdentityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDirectoryIdentityType");
}

id objc_msgSend_callDirectoryManagerIdentificationEntriesChangedNotificationToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDirectoryManagerIdentificationEntriesChangedNotificationToken");
}

id objc_msgSend_callFilterController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callFilterController");
}

id objc_msgSend_callHistoryController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistoryController");
}

id objc_msgSend_callHistoryControllerCallHistoryFetchLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistoryControllerCallHistoryFetchLimit");
}

id objc_msgSend_callHistoryControllerOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistoryControllerOptions");
}

id objc_msgSend_callHistorySearchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistorySearchEnabled");
}

id objc_msgSend_callOccurrences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callOccurrences");
}

id objc_msgSend_callProviderCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callProviderCache");
}

id objc_msgSend_callProviderIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callProviderIdentifier");
}

id objc_msgSend_callProviderManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callProviderManager");
}

id objc_msgSend_callService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callService");
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callStatus");
}

id objc_msgSend_callType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callType");
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callUUID");
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerId");
}

id objc_msgSend_callerIdForDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIdForDisplay");
}

id objc_msgSend_callerIdIsBlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIdIsBlocked");
}

id objc_msgSend_callerNameForDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerNameForDisplay");
}

id objc_msgSend_canAttemptEmergencyCallsWithoutCellularConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAttemptEmergencyCallsWithoutCellularConnection");
}

id objc_msgSend_canAttemptEmergencyCallsWithoutCellularConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:");
}

id objc_msgSend_canAttemptTelephonyCallsWithoutCellularConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAttemptTelephonyCallsWithoutCellularConnection");
}

id objc_msgSend_canBecomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBecomeFirstResponder");
}

id objc_msgSend_canExceedUnifyingThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canExceedUnifyingThreshold");
}

id objc_msgSend_canLoadOlderRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canLoadOlderRecentCalls");
}

id objc_msgSend_canMakeEmergencyCallForSenderIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canMakeEmergencyCallForSenderIdentity:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelSearchFetchOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelSearchFetchOperations");
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capHeight");
}

id objc_msgSend_captureGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureGroup");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_cellClassForCachedCellHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellClassForCachedCellHeight");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "center");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_coalescedCallWithCall_usingStrategy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescedCallWithCall:usingStrategy:");
}

id objc_msgSend_coalescingStrategy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescingStrategy");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_colorForDodge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorForDodge");
}

id objc_msgSend_colorForLuminance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorForLuminance");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_columnAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnAtIndex:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonInit");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compose(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compose");
}

id objc_msgSend_configureForImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureForImage:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:");
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsWithVisualFormat:options:metrics:views:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contact");
}

id objc_msgSend_contactArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactArray");
}

id objc_msgSend_contactAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactAtIndex:");
}

id objc_msgSend_contactCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactCache");
}

id objc_msgSend_contactForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForHandle:");
}

id objc_msgSend_contactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForHandle:isoCountryCode:metadataCache:");
}

id objc_msgSend_contactForRecentCall_keyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForRecentCall:keyDescriptors:");
}

id objc_msgSend_contactForRecentCall_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForRecentCall:metadataCache:");
}

id objc_msgSend_contactFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactFormatter");
}

id objc_msgSend_contactHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactHandles");
}

id objc_msgSend_contactHandlesForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactHandlesForHandle:");
}

id objc_msgSend_contactHandlesForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactHandlesForRecentCalls:");
}

id objc_msgSend_contactLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactLabel");
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactRelations");
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactStore");
}

id objc_msgSend_contactViewControllerForRecentCall_contact_recentsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactViewControllerForRecentCall:contact:recentsController:");
}

id objc_msgSend_contactsByHandleForRecentCall_keyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsByHandleForRecentCall:keyDescriptors:");
}

id objc_msgSend_contactsForHandles_keyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsForHandles:keyDescriptors:");
}

id objc_msgSend_contactsForHandles_keyDescriptors_alwaysUnifyLabeledValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsForHandles:keyDescriptors:alwaysUnifyLabeledValues:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentInset");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentOffset");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentUnavailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentUnavailable");
}

id objc_msgSend_contentUnavailableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentUnavailableView");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_contentViewAnimationsFadeInsteadOfMove(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentViewAnimationsFadeInsteadOfMove");
}

id objc_msgSend_contentViewCanRotate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentViewCanRotate");
}

id objc_msgSend_contentViewOffscreenEdge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentViewOffscreenEdge");
}

id objc_msgSend_contentViewSizeForFaceTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentViewSizeForFaceTime");
}

id objc_msgSend_continueButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueButton");
}

id objc_msgSend_continueHandoffEligibleConversation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueHandoffEligibleConversation");
}

id objc_msgSend_continueRegistrationForAccount_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueRegistrationForAccount:completionBlock:");
}

id objc_msgSend_conversationForCallUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationForCallUID:");
}

id objc_msgSend_conversationHandoffEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationHandoffEnabled");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyCarrierBundleValue_keyHierarchy_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleValue:keyHierarchy:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleValueWithDefault_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleValueWithDefault:key:bundleType:error:");
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cornerRadius");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfExcludedHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfExcludedHandles");
}

id objc_msgSend_createFaceTimeFirstRunViewIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFaceTimeFirstRunViewIfNeeded");
}

id objc_msgSend_createPillViewForSenderIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPillViewForSenderIdentity:");
}

id objc_msgSend_createRingImageWithSize_strokeWidth_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentCycleStringIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCycleStringIndex");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentInputDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentInputDevice");
}

id objc_msgSend_currentInputIsExternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentInputIsExternal");
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLayout");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_currentTabViewType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTabViewType");
}

id objc_msgSend_customInfoButtonAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customInfoButtonAction");
}

id objc_msgSend_cycleStrings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cycleStrings");
}

id objc_msgSend_cycleTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cycleTimer");
}

id objc_msgSend_dataSourcePrefetchingOperationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourcePrefetchingOperationQueue");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatter");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAction");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultPNGName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPNGName");
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSettings");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateToQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateToQueue");
}

id objc_msgSend_deleteAllRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllRecentCalls");
}

id objc_msgSend_deleteBackward(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteBackward");
}

id objc_msgSend_deleteCharacter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCharacter");
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCharactersInRange:");
}

id objc_msgSend_deleteRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecentCalls:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descender");
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeys");
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailsView");
}

id objc_msgSend_detailsViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailsViewController");
}

id objc_msgSend_deviceIsFrontFacingOrExternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsFrontFacingOrExternal:");
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceOrientation");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dialRequestForCallProvider_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialRequestForCallProvider:handle:");
}

id objc_msgSend_dialRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialRequestForRecentCall:");
}

id objc_msgSend_dialType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialType");
}

id objc_msgSend_dialerField_stringWasPasted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialerField:stringWasPasted:");
}

id objc_msgSend_dialerLCDFieldTextDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialerLCDFieldTextDidChange:");
}

id objc_msgSend_dialerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialerType");
}

id objc_msgSend_dialerView_stringWasPasted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialerView:stringWasPasted:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDeferStartCameraAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeferStartCameraAction");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_disableAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAnimation");
}

id objc_msgSend_disabledOverlayView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabledOverlayView");
}

id objc_msgSend_disconnectedReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectedReason");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_displayUIAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayUIAnimated:");
}

id objc_msgSend_displayedCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayedCalls");
}

id objc_msgSend_displayedLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayedLabel");
}

id objc_msgSend_displayedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayedName");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_durationAndDataLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationAndDataLabel");
}

id objc_msgSend_durationAndDataText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationAndDataText");
}

id objc_msgSend_dynamicLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicLabelColor");
}

id objc_msgSend_dynamicSecondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicSecondaryLabelColor");
}

id objc_msgSend_dynamicTertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicTertiaryLabelColor");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveBaselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBaselineOffsetFromBottom");
}

id objc_msgSend_effectiveBaselineOffsetFromContentBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBaselineOffsetFromContentBottom");
}

id objc_msgSend_effectiveFirstBaselineOffsetFromContentTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveFirstBaselineOffsetFromContentTop");
}

id objc_msgSend_effectiveFirstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveFirstBaselineOffsetFromTop");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elements");
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emailAddresses");
}

id objc_msgSend_emergencyItemLabelText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emergencyItemLabelText:");
}

id objc_msgSend_emergencyItemsText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emergencyItemsText");
}

id objc_msgSend_enableAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableAnimation");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "end");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_endOfDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endOfDocument");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUpdates");
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_enumerateRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRangesUsingBlock:");
}

id objc_msgSend_errorAlertMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorAlertMessage");
}

id objc_msgSend_errorAlertTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorAlertTitle");
}

id objc_msgSend_errorLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorLabel");
}

id objc_msgSend_escapedPatternForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "escapedPatternForString:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_extensionsWithMatchingAttributes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsWithMatchingAttributes:completion:");
}

id objc_msgSend_faceTimeAudioIsAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeAudioIsAvailable");
}

id objc_msgSend_faceTimeContainerViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeContainerViewController");
}

id objc_msgSend_faceTimeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeProvider");
}

id objc_msgSend_faceTimeVideoIsAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeVideoIsAvailable");
}

id objc_msgSend_facetimeService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "facetimeService");
}

id objc_msgSend_fadeInAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fadeInAnimated:");
}

id objc_msgSend_fadeOutAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fadeOutAnimated:");
}

id objc_msgSend_favoritesAudioGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesAudioGlyphImage");
}

id objc_msgSend_favoritesMailGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesMailGlyphImage");
}

id objc_msgSend_favoritesMessageGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesMessageGlyphImage");
}

id objc_msgSend_favoritesTTYDirectGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesTTYDirectGlyphImage");
}

id objc_msgSend_favoritesTTYRelayGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesTTYRelayGlyphImage");
}

id objc_msgSend_favoritesVideoGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesVideoGlyphImage");
}

id objc_msgSend_fbsOrientationObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fbsOrientationObserver");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureFlags");
}

id objc_msgSend_fetchCallProviderForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCallProviderForRecentCall:");
}

id objc_msgSend_fetchCellularRadioEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCellularRadioEnabled");
}

id objc_msgSend_fetchContactFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactFormatter");
}

id objc_msgSend_fetchContactsForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactsForHandles:");
}

id objc_msgSend_fetchContactsForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactsForRecentCalls:");
}

id objc_msgSend_fetchImageForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchImageForRecentCall:");
}

id objc_msgSend_fetchMetadataForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMetadataForRecentCalls:");
}

id objc_msgSend_fetchMutableItemForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMutableItemForRecentCall:");
}

id objc_msgSend_fetchMutableItemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMutableItemForRecentCall:numberOfOccurences:");
}

id objc_msgSend_fetchNumberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchNumberFormatter");
}

id objc_msgSend_fetchRTTConversationForCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRTTConversationForCallUUID:");
}

id objc_msgSend_fetchRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecentCalls");
}

id objc_msgSend_fetchRingerSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRingerSwitchEnabled");
}

id objc_msgSend_fetchUnifiedContactForID_withDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUnifiedContactForID:withDescriptors:");
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fill");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstIndex");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "font");
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptor");
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontName");
}

id objc_msgSend_fontSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontSize");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_foregroundView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foregroundView");
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_formattedNameForHandle_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedNameForHandle:countryCode:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generalPasteboard");
}

id objc_msgSend_generateDetailsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateDetailsView");
}

id objc_msgSend_generateNumberLabelHorizontalConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateNumberLabelHorizontalConstraints");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gridView");
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupName");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handle");
}

id objc_msgSend_handleAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAtIndex:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForCHRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForCHRecentCall:");
}

id objc_msgSend_handleKeyboardEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyboardEvent:");
}

id objc_msgSend_handleRecentsDetailsViewURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRecentsDetailsViewURL:");
}

id objc_msgSend_handleShortcutItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleShortcutItem:");
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleType");
}

id objc_msgSend_handleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURL:");
}

id objc_msgSend_handleUserActivityContinuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUserActivityContinuation:");
}

id objc_msgSend_handleVideoMessagePlaybackURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleVideoMessagePlaybackURL:");
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithDestinationID:");
}

id objc_msgSend_handleWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithDictionaryRepresentation:");
}

id objc_msgSend_handsetDialerSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handsetDialerSize");
}

id objc_msgSend_handsetDialerSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handsetDialerSpacing");
}

id objc_msgSend_hasBeenPersisted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenPersisted");
}

id objc_msgSend_hasEnhancedVoicemail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEnhancedVoicemail");
}

id objc_msgSend_hasMultipleSenderIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasMultipleSenderIdentities");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasRecentsListViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRecentsListViewController");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_headerViewNumberOfCallsToShow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerViewNumberOfCallsToShow");
}

id objc_msgSend_headerViewShowsAllRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerViewShowsAllRecentCalls");
}

id objc_msgSend_hideContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideContent");
}

id objc_msgSend_hideDetailsViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideDetailsViewController");
}

id objc_msgSend_highlightKeyAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightKeyAtIndex:");
}

id objc_msgSend_highlightPropertyWithKey_identifier_important_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightPropertyWithKey:identifier:important:");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image");
}

id objc_msgSend_imageForActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForActionType:");
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageOrientation");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageURL");
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_inCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inCall");
}

id objc_msgSend_inCallBottomBarSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inCallBottomBarSpacing");
}

id objc_msgSend_inCallControlSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inCallControlSpacing");
}

id objc_msgSend_incomingVideoCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incomingVideoCall");
}

id objc_msgSend_increaseCallHistoryEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "increaseCallHistoryEnabled");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexSetToHighlightDigitsInText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetToHighlightDigitsInText:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initWithArrangedSubviewRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArrangedSubviewRows:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributedString:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithCGFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGFloat:");
}

id objc_msgSend_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:");
}

id objc_msgSend_initWithCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallProviderManager:");
}

id objc_msgSend_initWithDataProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataProviders:");
}

id objc_msgSend_initWithDestinationID_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestinationID:isoCountryCode:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_callUUID_ttyType_timeLabel_statusLabel_durationAndDataText_emergencyItemsText_verified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:callUUID:ttyType:timeLabel:statusLabel:durationAndDataText:emergencyItemsText:verified:");
}

id objc_msgSend_initWithFrame_privateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:privateStyle:");
}

id objc_msgSend_initWithFrame_recentCall_occurrenceDate_status_duration_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:recentCall:occurrenceDate:status:duration:type:");
}

id objc_msgSend_initWithFrame_recentCall_occurrenceDate_status_duration_type_dataUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:recentCall:occurrenceDate:status:duration:type:dataUsage:");
}

id objc_msgSend_initWithFrame_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:title:");
}

id objc_msgSend_initWithHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandles:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeysToFetch:");
}

id objc_msgSend_initWithMetadataCache_callProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadataCache:callProviderManager:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRemoteMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteMembers:");
}

id objc_msgSend_initWithServiceType_presentationViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceType:presentationViewController:");
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSettings:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithTabBarSystemItem_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTabBarSystemItem:tag:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_initWithTitle_frame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:frame:");
}

id objc_msgSend_initWithTitle_image_selectedImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:image:selectedImage:");
}

id objc_msgSend_initWithType_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:value:");
}

id objc_msgSend_initWithUrlString_username_userIdentifier_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrlString:username:userIdentifier:service:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initializeCachedValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeCachedValues");
}

id objc_msgSend_initializeIconAndTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeIconAndTitle:");
}

id objc_msgSend_inputDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputDevices");
}

id objc_msgSend_insertColumnAtIndex_withArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertColumnAtIndex:withArrangedSubviews:");
}

id objc_msgSend_insertSublayer_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSublayer:below:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_instantMessageAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instantMessageAddresses");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_interfaceOrientationForDeviceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientationForDeviceOrientation:");
}

id objc_msgSend_intrinsicContentHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intrinsicContentHeight");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateIntrinsicContentSize");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_invitationPreferencesForRecentCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationPreferencesForRecentCall");
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnecting");
}

id objc_msgSend_isContentViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentViewLoaded");
}

id objc_msgSend_isConversation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConversation");
}

id objc_msgSend_isDecelerating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDecelerating");
}

id objc_msgSend_isDeviceCapableOfFaceTimeAudio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceCapableOfFaceTimeAudio");
}

id objc_msgSend_isDeviceCapableOfFaceTimeVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceCapableOfFaceTimeVideo");
}

id objc_msgSend_isDeviceCapableOfTelephonyCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceCapableOfTelephonyCalls");
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDragging");
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEditing");
}

id objc_msgSend_isEmergencyNumberForDigits_senderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmergencyNumberForDigits:senderIdentityUUID:");
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmpty");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFaceTimeAppVideoMessagePlaybackURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeAppVideoMessagePlaybackURL");
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeProvider");
}

id objc_msgSend_isFaceTimeRecentsDetailsViewURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeRecentsDetailsViewURL");
}

id objc_msgSend_isGeminiCapable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGeminiCapable");
}

id objc_msgSend_isHostedInRemoteViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHostedInRemoteViewController");
}

id objc_msgSend_isIncoming(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIncoming");
}

id objc_msgSend_isInitializationBlockQueued(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInitializationBlockQueued");
}

id objc_msgSend_isJunk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isJunk");
}

id objc_msgSend_isKeyAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyAvailable:");
}

id objc_msgSend_isLikePhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLikePhoneNumber:");
}

id objc_msgSend_isLocalizedSubtitleUnknown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalizedSubtitleUnknown:");
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMe");
}

id objc_msgSend_isMenuVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMenuVisible");
}

id objc_msgSend_isNumeric(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNumeric");
}

id objc_msgSend_isOneToOneModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOneToOneModeEnabled");
}

id objc_msgSend_isPreferredContentSizeCategoryAccessible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreferredContentSizeCategoryAccessible");
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRead");
}

id objc_msgSend_isReadyForPreview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReadyForPreview");
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecapAvailable");
}

id objc_msgSend_isReloadingData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReloadingData");
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSimHidden");
}

id objc_msgSend_isSpringBoardLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSpringBoardLocked");
}

id objc_msgSend_isSpringBoardPasscodeLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSpringBoardPasscodeLocked");
}

id objc_msgSend_isStatusBarHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStatusBarHidden");
}

id objc_msgSend_isSuggested(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSuggested");
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSuspended");
}

id objc_msgSend_isSuspendedEventsOnly(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSuspendedEventsOnly");
}

id objc_msgSend_isSystemItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemItem");
}

id objc_msgSend_isSystemProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemProvider");
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTelephonyProvider");
}

id objc_msgSend_isThumperCallingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThumperCallingEnabled");
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTracking");
}

id objc_msgSend_isTranscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTranscription");
}

id objc_msgSend_isUIInitialized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUIInitialized");
}

id objc_msgSend_isUsingIPadExternalCamera(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUsingIPadExternalCamera");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isZoomBouncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isZoomBouncing");
}

id objc_msgSend_isZooming(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isZooming");
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isoCountryCode");
}

id objc_msgSend_itemCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemCache");
}

id objc_msgSend_itemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemForRecentCall:numberOfOccurences:");
}

id objc_msgSend_joinConversationRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinConversationRequestForRecentCall:");
}

id objc_msgSend_junkIdentificationCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "junkIdentificationCategory");
}

id objc_msgSend_keyIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyIndex");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelColor");
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelID");
}

id objc_msgSend_labeledValueForEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueForEmailAddress:");
}

id objc_msgSend_labeledValueForPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueForPhoneNumber:");
}

id objc_msgSend_labeledValueForSocialProfileWithUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueForSocialProfileWithUsername:");
}

id objc_msgSend_labeledValueWithLabel_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueWithLabel:value:");
}

id objc_msgSend_largeTitleDisplayMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "largeTitleDisplayMode");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastValidInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastValidInterfaceOrientation");
}

id objc_msgSend_launchAppForDialRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppForDialRequest:completion:");
}

id objc_msgSend_launchAppForJoinRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppForJoinRequest:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIsLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIsLocked:");
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutSubviews");
}

id objc_msgSend_layoutTextField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutTextField");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_learnMoreButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "learnMoreButton");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_linkWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkWithBundleIdentifier:");
}

id objc_msgSend_loadLayoutConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadLayoutConstraints");
}

id objc_msgSend_loadOlderCallsIfNecessaryForRemainingRowCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadOlderCallsIfNecessaryForRemainingRowCount:");
}

id objc_msgSend_loadOlderRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadOlderRecentCalls");
}

id objc_msgSend_loadRTTConversations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRTTConversations");
}

id objc_msgSend_loadRootViewAndContentViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRootViewAndContentViews");
}

id objc_msgSend_loadSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSubviews");
}

id objc_msgSend_localFrontLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localFrontLayer");
}

id objc_msgSend_localParticipantUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localParticipantUUID");
}

id objc_msgSend_localSenderIdentityAccountUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSenderIdentityAccountUUID");
}

id objc_msgSend_localSenderIdentityUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSenderIdentityUUID");
}

id objc_msgSend_localVideoView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localVideoView");
}

id objc_msgSend_localVideoViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localVideoViewController");
}

id objc_msgSend_localizedBlockedByExtensionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedBlockedByExtensionName");
}

id objc_msgSend_localizedCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCount");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedDisplayStringForLabel_propertyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDisplayStringForLabel:propertyName:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedSenderIdentityTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSenderIdentityTitle");
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedShortName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedSubtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitle");
}

id objc_msgSend_localizedSubtitleCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleCache");
}

id objc_msgSend_localizedSubtitleForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleForRecentCall:");
}

id objc_msgSend_localizedSubtitleForRecentCall_handle_contact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleForRecentCall:handle:contact:");
}

id objc_msgSend_localizedSubtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleForRecentEmergencyCall:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitle");
}

id objc_msgSend_localizedValidHandlesTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedValidHandlesTitle");
}

id objc_msgSend_logEvent_withCoreAnalyticsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logEvent:withCoreAnalyticsDictionary:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mailActionImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mailActionImage");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainDisplay");
}

id objc_msgSend_mainNumberLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainNumberLabel");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeInterfaceOrientationFrom_whenFailing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeInterfaceOrientationFrom:whenFailing:");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_markRecentAudioCallsAsRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markRecentAudioCallsAsRead");
}

id objc_msgSend_markRecentCallsAsRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markRecentCallsAsRead");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaType");
}

id objc_msgSend_messageCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageCache");
}

id objc_msgSend_messagesActionImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagesActionImage");
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataCache");
}

id objc_msgSend_metadataDestinationIDsForCHRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDestinationIDsForCHRecentCall:");
}

id objc_msgSend_metadataDestinationIDsForCHRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDestinationIDsForCHRecentCalls:");
}

id objc_msgSend_metadataForDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataForDestinationID:");
}

id objc_msgSend_metadataForProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataForProvider:");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nameAndLabelFontSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameAndLabelFontSize");
}

id objc_msgSend_nameAndLabelLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameAndLabelLabel");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_needsManualInCallSounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsManualInCallSounds");
}

id objc_msgSend_needsReloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsReloadData");
}

id objc_msgSend_networkReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkReachable");
}

id objc_msgSend_networkUnavailableAlertControllerWithCallProvider_dialType_senderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:");
}

id objc_msgSend_newAddContactButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAddContactButton");
}

id objc_msgSend_newSummaryViewForRecentCall_occurrenceDate_status_duration_type_dataUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newSummaryViewForRecentCall:occurrenceDate:status:duration:type:dataUsage:");
}

id objc_msgSend_newWithTestName_parameters_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWithTestName:parameters:completionHandler:");
}

id objc_msgSend_newestSuggestedContactForDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestSuggestedContactForDestinationID:");
}

id objc_msgSend_nextFocusedItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextFocusedItem");
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedValue");
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationCenter");
}

id objc_msgSend_notificationEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationEvent");
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didChangeCalls:");
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeUnreadCallCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didChangeUnreadCallCount:");
}

id objc_msgSend_notifyDelegatesRecentsController_didCompleteFetchingCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didCompleteFetchingCalls:");
}

id objc_msgSend_notifyDelegatesRecentsController_didUpdateCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didUpdateCalls:");
}

id objc_msgSend_notifyDelegatesRecentsControllerDidChangeMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsControllerDidChangeMessages:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:defaultValue:");
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFormatter");
}

id objc_msgSend_numberLabelFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberLabelFont");
}

id objc_msgSend_numberLabelHorizontalConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberLabelHorizontalConstraints");
}

id objc_msgSend_numberLabelMinimumFontSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberLabelMinimumFontSize");
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfColumns");
}

id objc_msgSend_numberOfOccurrences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfOccurrences");
}

id objc_msgSend_numberTextField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberTextField");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithCGFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithCGFloat:");
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

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
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

id objc_msgSend_openApplication_options_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:options:withResult:");
}

id objc_msgSend_openURL_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withCompletionHandler:");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operations");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_orderFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderFront:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orientation");
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "origin");
}

id objc_msgSend_originalAuthKitViewHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalAuthKitViewHeight");
}

id objc_msgSend_outgoingLocalParticipantUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outgoingLocalParticipantUUID");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pauseCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseCharacterSet");
}

id objc_msgSend_performDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDialRequest:");
}

id objc_msgSend_performNetworkAccessFlowIfAllowed_ignoreForeground_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performNetworkAccessFlowIfAllowed:ignoreForeground:completion:");
}

id objc_msgSend_performScrollTestWithName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performScrollTestWithName:options:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSynchronousBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSynchronousBlock:");
}

id objc_msgSend_performTapActionCancelForHighlightedKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTapActionCancelForHighlightedKey");
}

id objc_msgSend_performTestWithName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTestWithName:options:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_phCarPlayImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phCarPlayImageNamed:");
}

id objc_msgSend_phPathForImageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPathForImageNamed:inBundle:");
}

id objc_msgSend_phPreferredBoldFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredBoldFontForTextStyle:");
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredFontDescriptorForTextStyle:");
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:");
}

id objc_msgSend_phPreferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredFontForTextStyle:");
}

id objc_msgSend_ph_supportsLocalParticipantBadge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ph_supportsLocalParticipantBadge");
}

id objc_msgSend_ph_uniqueIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ph_uniqueIDs");
}

id objc_msgSend_phoneKit_isAuthorized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneKit_isAuthorized");
}

id objc_msgSend_phoneNumberWithDigits_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithDigits:countryCode:");
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithStringValue:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumbers");
}

id objc_msgSend_phoneRecentsAvatarsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneRecentsAvatarsEnabled");
}

id objc_msgSend_phoneRecentsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneRecentsEnabled");
}

id objc_msgSend_pidForApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pidForApplication:");
}

id objc_msgSend_pillLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillLayoutGuide");
}

id objc_msgSend_pillView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillView");
}

id objc_msgSend_pillViewTopConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillViewTopConstraint");
}

id objc_msgSend_pillViewTopConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillViewTopConstraintConstant");
}

id objc_msgSend_pillViewTopOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillViewTopOffset");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointSize");
}

id objc_msgSend_populateCachesForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateCachesForRecentCalls:");
}

id objc_msgSend_populateItemCacheForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateItemCacheForRecentCalls:");
}

id objc_msgSend_populateMessageCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateMessageCache");
}

id objc_msgSend_populateMessageCacheForMessages_recentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateMessageCacheForMessages:recentCalls:");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "position");
}

id objc_msgSend_positionFromPosition_offset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positionFromPosition:offset:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postalAddresses");
}

id objc_msgSend_predicateForContactsMatchingHandleStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingHandleStrings:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferencesValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesValueForKey:");
}

id objc_msgSend_preferencesValueForKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesValueForKey:domain:");
}

id objc_msgSend_preferredCaption1BoldFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredCaption1BoldFont");
}

id objc_msgSend_preferredCaption1Font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredCaption1Font");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredSubheadline1Font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredSubheadline1Font");
}

id objc_msgSend_prepareForSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForSnapshot");
}

id objc_msgSend_presentConversationForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentConversationForUUID:");
}

id objc_msgSend_presentRecentsDetailsViewFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentRecentsDetailsViewFor:");
}

id objc_msgSend_presentScreenTimeShield(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentScreenTimeShield");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_previewMSROptimizationEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewMSROptimizationEnabled");
}

id objc_msgSend_previousTextSuggestion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousTextSuggestion");
}

id objc_msgSend_prewarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prewarm");
}

id objc_msgSend_prioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prioritizedSenderIdentities");
}

id objc_msgSend_privacyLinkView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyLinkView");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForRecentCall:");
}

id objc_msgSend_providerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithIdentifier:");
}

id objc_msgSend_providerWithService_video_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithService:video:");
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providers");
}

id objc_msgSend_pseudonymForLinkDetailsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pseudonymForLinkDetailsView");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfCharacterFromSet_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rangeToHighlightText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeToHighlightText:");
}

id objc_msgSend_recentCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCall");
}

id objc_msgSend_recentCallTTYType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallTTYType");
}

id objc_msgSend_recentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCalls");
}

id objc_msgSend_recentCallsChangedFromCachedRecentCalls_callHistoryControllerRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallsChangedFromCachedRecentCalls:callHistoryControllerRecentCalls:");
}

id objc_msgSend_recentsAudioCallImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsAudioCallImage");
}

id objc_msgSend_recentsCallTapTargetsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsCallTapTargetsEnabled");
}

id objc_msgSend_recentsOutgoingAudioCallGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsOutgoingAudioCallGlyphImage");
}

id objc_msgSend_recentsOutgoingVideoCallGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsOutgoingVideoCallGlyphImage");
}

id objc_msgSend_recentsTTYDirectGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsTTYDirectGlyphImage");
}

id objc_msgSend_recentsTTYRelayGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsTTYRelayGlyphImage");
}

id objc_msgSend_recentsUniqueID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsUniqueID");
}

id objc_msgSend_recentsVideoCallImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsVideoCallImage");
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectForRowAtIndexPath:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redColor");
}

id objc_msgSend_reformatText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reformatText");
}

id objc_msgSend_registerAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAccount");
}

id objc_msgSend_registerAccountWithUsername_password_service_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAccountWithUsername:password:service:completionBlock:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForRingerStateNotifications");
}

id objc_msgSend_registrationDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationDelegate");
}

id objc_msgSend_registrationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationStatus");
}

id objc_msgSend_registrationTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationTimeout");
}

id objc_msgSend_registrationViewSignInPhoneAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationViewSignInPhoneAccount:");
}

id objc_msgSend_reloadCallOccurences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadCallOccurences");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantHandles");
}

id objc_msgSend_remoteViewControllerLCDOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteViewControllerLCDOffset");
}

id objc_msgSend_removeAllIndexes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllIndexes");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeColumnAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeColumnAtIndex:");
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConstraints:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeListenerID_forService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeListenerID:forService:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replaceArrangedSubview_inColumnAtIndex_rowAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceArrangedSubview:inColumnAtIndex:rowAtIndex:");
}

id objc_msgSend_replaceRange_withText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceRange:withText:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestPinFromPrimaryDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPinFromPrimaryDevice");
}

id objc_msgSend_requiresSmallScreenConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresSmallScreenConfig");
}

id objc_msgSend_resetViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetViewController");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "response");
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reuseIdentifier");
}

id objc_msgSend_ringCornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ringCornerRadius");
}

id objc_msgSend_ringImageForDodge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ringImageForDodge");
}

id objc_msgSend_ringImageForLuminance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ringImageForLuminance");
}

id objc_msgSend_ringSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ringSize");
}

id objc_msgSend_ringStroke(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ringStroke");
}

id objc_msgSend_ringerStateNotifyToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ringerStateNotifyToken");
}

id objc_msgSend_rootView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootView");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_rootViewLayoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewLayoutMargins");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "row");
}

id objc_msgSend_rowHeightCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowHeightCache");
}

id objc_msgSend_rttConversationForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rttConversationForUUID:");
}

id objc_msgSend_rttConversations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rttConversations");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_sanitizedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizedString");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:");
}

id objc_msgSend_scene_continueUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:continueUserActivity:");
}

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:openURLContexts:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_screenSharingType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenSharingType");
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenSize");
}

id objc_msgSend_scrollTestsWithCount_forScrollView_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollTestsWithCount:forScrollView:name:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_selectedSenderIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedSenderIdentity");
}

id objc_msgSend_selectedTextRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedTextRange");
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedViewController");
}

id objc_msgSend_selectionRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectionRange");
}

id objc_msgSend_sendMessageIntentExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessageIntentExtension");
}

id objc_msgSend_senderIdentityCapabilitiesWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityCapabilitiesWithUUID:");
}

id objc_msgSend_senderIdentityForAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityForAccountUUID:");
}

id objc_msgSend_senderIdentityMenuForDialerField_selectedSenderIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityMenuForDialerField:selectedSenderIdentity:");
}

id objc_msgSend_senderIdentityMenuForDialerView_selectedSenderIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityMenuForDialerView:selectedSenderIdentity:");
}

id objc_msgSend_separatorInsetForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorInsetForContentSizeCategory:");
}

id objc_msgSend_sequenceWithItems_loops_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sequenceWithItems:loops:");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service");
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceProvider");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setActionButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionButton:");
}

id objc_msgSend_setActionButtonImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionButtonImage:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActivationFailed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationFailed:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAddContactButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddContactButton:");
}

id objc_msgSend_setAddContactButtonTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddContactButtonTopConstraint:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAdjustsImageSizeForAccessibilityContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageSizeForAccessibilityContentSizeCategory:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAlignment_forView_inAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:forView:inAxis:");
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedPressTypes:");
}

id objc_msgSend_setAllowsActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsActions:");
}

id objc_msgSend_setAllowsEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsEditing:");
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupBlending:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlternateName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateName:");
}

id objc_msgSend_setAnalyticsLogger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalyticsLogger:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setArrowDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArrowDirection:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAttributedTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedTitle:forState:");
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:range:");
}

id objc_msgSend_setAuthKitSignInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthKitSignInView:");
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizesSubviews:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAvatarViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvatarViewController:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundEffects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundEffects:");
}

id objc_msgSend_setBackgroundImage_forBarPosition_barMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forBarPosition:barMetrics:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBadgeText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeText:");
}

id objc_msgSend_setBadgeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeValue:");
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarStyle:");
}

id objc_msgSend_setBaselineRelativeArrangement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineRelativeArrangement:");
}

id objc_msgSend_setBottommostLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottommostLabel:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCachedCellHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedCellHeight:");
}

id objc_msgSend_setCachedIsUsingIPadExternalCamera_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedIsUsingIPadExternalCamera:");
}

id objc_msgSend_setCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallProviderManager:");
}

id objc_msgSend_setCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerID:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setColumnSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColumnSpacing:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContactFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactFormatter:");
}

id objc_msgSend_setContactHeaderViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactHeaderViewController:");
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIdentifier:");
}

id objc_msgSend_setContactLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactLabel:");
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactStore:");
}

id objc_msgSend_setContactType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactType:");
}

id objc_msgSend_setContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContacts:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentEdgeInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentEdgeInsets:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContentUnavailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentUnavailable:");
}

id objc_msgSend_setContentUnavailableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentUnavailableView:");
}

id objc_msgSend_setContentUnavailableViewTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentUnavailableViewTitle:");
}

id objc_msgSend_setContentViewHiddenPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewHiddenPosition");
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setContentsGravity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsGravity:");
}

id objc_msgSend_setContentsIsSingleValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsIsSingleValue:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversation:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentCycleStringIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCycleStringIndex:");
}

id objc_msgSend_setCurrentInputDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentInputDevice:");
}

id objc_msgSend_setCurrentVideoOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentVideoOrientation:");
}

id objc_msgSend_setCustomBaselineOffsetFromBottom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomBaselineOffsetFromBottom:");
}

id objc_msgSend_setCustomFirstBaselineOffsetFromTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomFirstBaselineOffsetFromTop:");
}

id objc_msgSend_setCycleTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCycleTimer:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateLabels:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDefinesPresentationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefinesPresentationContext:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeleteButtonAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteButtonAlpha:");
}

id objc_msgSend_setDetailsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailsView:");
}

id objc_msgSend_setDialType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialType:");
}

id objc_msgSend_setDialerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialerType:");
}

id objc_msgSend_setDidDeferStartCameraAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidDeferStartCameraAction:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setDisabledOverlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabledOverlayView:");
}

id objc_msgSend_setDisplayedLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayedLabel:");
}

id objc_msgSend_setDisplayedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayedName:");
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoesRelativeDateFormatting:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdgesForExtendedLayout:");
}

id objc_msgSend_setEmailAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmailAddresses:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFill");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundView:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupName:");
}

id objc_msgSend_setHIDEventSystemClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHIDEventSystemClient:");
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandle:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInitializationBlockQueued_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializationBlockQueued:");
}

id objc_msgSend_setIntrinsicContentHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntrinsicContentHeight:");
}

id objc_msgSend_setInvitationPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationPreferences:");
}

id objc_msgSend_setIsUIInitialized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUIInitialized:");
}

id objc_msgSend_setKeyIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyIndex:");
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLargeTitleDisplayMode:");
}

id objc_msgSend_setLayoutMarginsRelativeArrangement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMarginsRelativeArrangement:");
}

id objc_msgSend_setLcdViewTextFieldDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLcdViewTextFieldDelegate:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLocalFrontLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalFrontLayer:");
}

id objc_msgSend_setLocalSenderIdentityAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityAccountUUID:");
}

id objc_msgSend_setLocalSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityUUID:");
}

id objc_msgSend_setLocalizedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedCount:");
}

id objc_msgSend_setLocalizedSenderIdentityTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedSenderIdentityTitle:");
}

id objc_msgSend_setLocalizedSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedSubtitle:");
}

id objc_msgSend_setLocalizedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedTitle:");
}

id objc_msgSend_setLocalizedValidHandlesTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedValidHandlesTitle:");
}

id objc_msgSend_setMainNumberLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainNumberLabel:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaximumLayoutSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumLayoutSize:");
}

id objc_msgSend_setMenuVisible_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuVisible:animated:");
}

id objc_msgSend_setMetadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataCache:");
}

id objc_msgSend_setMinimumFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumFontSize:");
}

id objc_msgSend_setMinimumLayoutSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLayoutSize:");
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumPressDuration:");
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumScaleFactor:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNameAndLabelLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameAndLabelLabel:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setNonEditingLinebreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNonEditingLinebreakMode:");
}

id objc_msgSend_setNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCenter:");
}

id objc_msgSend_setNumber_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:");
}

id objc_msgSend_setNumberFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberFormatter:");
}

id objc_msgSend_setNumberLabelHorizontalConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberLabelHorizontalConstraints:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfTapsRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfTapsRequired:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectViewControllerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObjectViewControllerDelegate:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOrganizationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrganizationName:");
}

id objc_msgSend_setOrientationEventsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientationEventsEnabled:");
}

id objc_msgSend_setOriginatingUIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatingUIType:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setPhoneNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumbers:");
}

id objc_msgSend_setPillLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPillLayoutGuide:");
}

id objc_msgSend_setPillView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPillView:");
}

id objc_msgSend_setPreFetchingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreFetchingPredicate:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPreferencesValue_forKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferencesValue:forKey:domain:");
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersLargeTitles:");
}

id objc_msgSend_setPrefetchDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefetchDataSource:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setPreviousTextSuggestion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousTextSuggestion:");
}

id objc_msgSend_setPrivacyLinkView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyLinkView:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setReceivesMemoryWarnings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivesMemoryWarnings:");
}

id objc_msgSend_setRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecentCall:");
}

id objc_msgSend_setRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecentCalls:");
}

id objc_msgSend_setRegistrationDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistrationDelegate:");
}

id objc_msgSend_setRegistrationTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistrationTimeout:");
}

id objc_msgSend_setReloadingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReloadingData:");
}

id objc_msgSend_setRenderMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderMode:");
}

id objc_msgSend_setRepresentedApplicationBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepresentedApplicationBundle:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRingerSwitchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRingerSwitchEnabled:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRowSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowSpacing:");
}

id objc_msgSend_setRttConversations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRttConversations:");
}

id objc_msgSend_setSelectedSenderIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedSenderIdentity:");
}

id objc_msgSend_setSelectedTextRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTextRange:");
}

id objc_msgSend_setSelectionRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionRange:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setShortcutItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortcutItem:");
}

id objc_msgSend_setShouldFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldFlick:");
}

id objc_msgSend_setShouldShowLinkedContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowLinkedContacts:");
}

id objc_msgSend_setShowsAuthKitUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsAuthKitUI:");
}

id objc_msgSend_setSigningIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSigningIn:");
}

id objc_msgSend_setSocialProfiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSocialProfiles:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpringBoardLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpringBoardLocked:");
}

id objc_msgSend_setStandardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStandardAppearance:");
}

id objc_msgSend_setStartedLoadingOlderCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartedLoadingOlderCalls:");
}

id objc_msgSend_setStatusBarOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBarOrientation:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSuggestedContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedContactStore:");
}

id objc_msgSend_setSummaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummaries:");
}

id objc_msgSend_setTabBarItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabBarItem:");
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableFooterView:");
}

id objc_msgSend_setTargetRect_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetRect:inView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setText_needsFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:needsFormat:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setThreeDTouchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreeDTouchEnabled:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleView:");
}

id objc_msgSend_setTopmostLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopmostLabel:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnreadCallCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnreadCallCount:");
}

id objc_msgSend_setUpTableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpTableView");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setUsesBrandedCallHeaderFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesBrandedCallHeaderFormat:");
}

id objc_msgSend_setUsesDarkMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesDarkMode:");
}

id objc_msgSend_setUsesEvenOddFillRule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesEvenOddFillRule:");
}

id objc_msgSend_setUsesNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesNotificationCenter:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVerified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerified:");
}

id objc_msgSend_setVerticalAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalAlignment:");
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideo:");
}

id objc_msgSend_setVideoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEnabled:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWaitingForLocalVideoFirstFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitingForLocalVideoFirstFrame:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForPrivateStyle:");
}

id objc_msgSend_setupContentViewFullSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupContentViewFullSize");
}

id objc_msgSend_setupContentViewSidebar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupContentViewSidebar");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedMenuController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMenuController");
}

id objc_msgSend_sharedMonitorForDisplayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMonitorForDisplayType:");
}

id objc_msgSend_sharedNumberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNumberFormatter");
}

id objc_msgSend_sharedUtilityProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedUtilityProvider");
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutItem");
}

id objc_msgSend_shouldDeferStartCameraAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDeferStartCameraAction");
}

id objc_msgSend_shouldDisableEdgeClip(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDisableEdgeClip");
}

id objc_msgSend_shouldInsertStringAtCurrentPosition_deletingPreviousCharacter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInsertStringAtCurrentPosition:deletingPreviousCharacter:");
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldMakeUIForDefaultPNG");
}

id objc_msgSend_shouldNavigationControllerPresentLargeTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldNavigationControllerPresentLargeTitles");
}

id objc_msgSend_shouldRestrictDialRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRestrictDialRequest:performSynchronously:");
}

id objc_msgSend_shouldRestrictJoinConversationRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRestrictJoinConversationRequest:performSynchronously:");
}

id objc_msgSend_shouldShowRegistration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowRegistration");
}

id objc_msgSend_shouldSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSnapshot");
}

id objc_msgSend_shouldUseExplicitLayoutDimensions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseExplicitLayoutDimensions");
}

id objc_msgSend_showContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showContent");
}

id objc_msgSend_showContentViewAnimated_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showContentViewAnimated:completionBlock:");
}

id objc_msgSend_showDetailsViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDetailsViewController");
}

id objc_msgSend_showFaceTimeFirstRunViewIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showFaceTimeFirstRunViewIfNeeded");
}

id objc_msgSend_showLinkDetailViewControllerForPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showLinkDetailViewControllerForPseudonym:");
}

id objc_msgSend_showName_label_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showName:label:animated:");
}

id objc_msgSend_showThumperAvailableDialogIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showThumperAvailableDialogIfNecessary");
}

id objc_msgSend_showVideoPlayerForMessageWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showVideoPlayerForMessageWithUUID:");
}

id objc_msgSend_showsAuthKitUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsAuthKitUI");
}

id objc_msgSend_showsCallsFromService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsCallsFromService:");
}

id objc_msgSend_showsFaceTimeAudio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsFaceTimeAudio");
}

id objc_msgSend_showsFaceTimeAudioRecents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsFaceTimeAudioRecents");
}

id objc_msgSend_showsFaceTimeVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsFaceTimeVideo");
}

id objc_msgSend_showsFaceTimeVideoRecents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsFaceTimeVideoRecents");
}

id objc_msgSend_showsLocalPreviewStatusBarGradient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsLocalPreviewStatusBarGradient");
}

id objc_msgSend_showsTelephonyCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsTelephonyCalls");
}

id objc_msgSend_showsTelephonyRecents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsTelephonyRecents");
}

id objc_msgSend_showsThirdPartyRecents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsThirdPartyRecents");
}

id objc_msgSend_signingInLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingInLabel");
}

id objc_msgSend_signingInSpinner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingInSpinner");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_socialProfiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "socialProfiles");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_spacingBetweenNumberBaselineAndNameBaseline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spacingBetweenNumberBaselineAndNameBaseline");
}

id objc_msgSend_specialDialerCharacters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specialDialerCharacters");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_starAndOctothorpeCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "starAndOctothorpeCharacterSet");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startPreview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPreview");
}

id objc_msgSend_startPreviewIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPreviewIfNeeded");
}

id objc_msgSend_startedLoadingOlderCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedLoadingOlderCalls");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateForNotifyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateForNotifyToken:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "status");
}

id objc_msgSend_statusBarFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarFrame");
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarOrientation");
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusLabel");
}

id objc_msgSend_statusText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusText");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stopPreview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPreview");
}

id objc_msgSend_storeWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeWithOptions:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByRemovingCharactersFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByRemovingCharactersFromSet:");
}

id objc_msgSend_stringByRemovingDiatrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByRemovingDiatrics");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringByTrimmingLastCharacter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingLastCharacter");
}

id objc_msgSend_stringForDataUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForDataUsage:");
}

id objc_msgSend_stringForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForTimeInterval:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringFromContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromContact:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromIOHIDUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromIOHIDUsage:");
}

id objc_msgSend_stringFromIOHIDUsagePage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromIOHIDUsagePage:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptions");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_subtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleForRecentEmergencyCall:");
}

id objc_msgSend_subtitleImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleImageView");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_subtitleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabelFirstBaselineLayoutConstraintConstant");
}

id objc_msgSend_subtitleLabelLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabelLastBaselineLayoutConstraintConstant");
}

id objc_msgSend_subtitleLabelLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabelLeadingLayoutConstraintConstant");
}

id objc_msgSend_subtitleLabelTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabelTextColor");
}

id objc_msgSend_subtitleProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleProvider");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_suggestedContactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedContactForHandle:isoCountryCode:metadataCache:");
}

id objc_msgSend_suggestedContactStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedContactStore");
}

id objc_msgSend_suggestionsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionsEnabled");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_supplementalVerbiageLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supplementalVerbiageLabel");
}

id objc_msgSend_supportedHandleTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedHandleTypes");
}

id objc_msgSend_supportsAutoRotation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsAutoRotation");
}

id objc_msgSend_supportsHandleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsHandleType:");
}

id objc_msgSend_supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsPrimaryCalling");
}

id objc_msgSend_supportsSendMessageIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsSendMessageIntent");
}

id objc_msgSend_supportsThumperCalling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsThumperCalling");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_systemPreferredCamera(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemPreferredCamera");
}

id objc_msgSend_tabBarCanSlide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarCanSlide");
}

id objc_msgSend_tabBarFillsScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarFillsScreen");
}

id objc_msgSend_tabBarIconImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarIconImage");
}

id objc_msgSend_tabBarIconName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarIconName");
}

id objc_msgSend_tabBarItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarItem");
}

id objc_msgSend_tabBarItemImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarItemImage");
}

id objc_msgSend_tabBarItemSelectedImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarItemSelectedImage");
}

id objc_msgSend_tabBarItemTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarItemTitle");
}

id objc_msgSend_tabBarSystemItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarSystemItem");
}

id objc_msgSend_tabBarSystemItemTag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarSystemItemTag");
}

id objc_msgSend_tabBarSystemItemTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarSystemItemTitle");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_tableViewCanPerformReloadData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableViewCanPerformReloadData:");
}

id objc_msgSend_tapTargets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapTargets");
}

id objc_msgSend_telephonyCallingIsAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyCallingIsAvailable");
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyClient");
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyProvider");
}

id objc_msgSend_telephonyUIBodyShortEmphasizedFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUIBodyShortEmphasizedFont");
}

id objc_msgSend_telephonyUIBodyShortFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUIBodyShortFont");
}

id objc_msgSend_telephonyUISubheadlineShortFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUISubheadlineShortFont");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textColor");
}

id objc_msgSend_textField_didUpdateString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textField:didUpdateString:");
}

id objc_msgSend_textInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textInRange:");
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textInputTraits");
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRangeFromPosition:toPosition:");
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeFormatter");
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeLabel");
}

id objc_msgSend_timeText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeText");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColor");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelFirstBaselineLayoutConstraintConstant");
}

id objc_msgSend_titleLabelLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelLastBaselineLayoutConstraintConstant");
}

id objc_msgSend_titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:");
}

id objc_msgSend_titleLabelLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelLeadingLayoutConstraintConstant");
}

id objc_msgSend_titleLabelTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelTrailingLayoutConstraintConstant");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topViewController");
}

id objc_msgSend_topmostLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topmostLabel");
}

id objc_msgSend_tpImageForSymbolType_textStyle_scale_isStaticSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tpImageForSymbolType:textStyle:scale:isStaticSize:");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transform");
}

id objc_msgSend_ttyType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ttyType");
}

id objc_msgSend_tuHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuHandle");
}

id objc_msgSend_tu_dynamicIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_dynamicIdentifier");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_unformattedNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unformattedNumber");
}

id objc_msgSend_unformattedNumberInLatin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unformattedNumberInLatin");
}

id objc_msgSend_unicodeDirectionalCharactersSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unicodeDirectionalCharactersSet");
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:");
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueId");
}

id objc_msgSend_unknownLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unknownLabel");
}

id objc_msgSend_unreadCallCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadCallCount");
}

id objc_msgSend_unregisterForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForRingerStateNotifications");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateAddAndDeleteButtonForText_name_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAddAndDeleteButtonForText:name:animated:");
}

id objc_msgSend_updateAddAndDeleteButtonForText_name_label_suggestion_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAddAndDeleteButtonForText:name:label:suggestion:animated:");
}

id objc_msgSend_updateCacheWithDestinationIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithDestinationIDs:");
}

id objc_msgSend_updateCacheWithDestinationIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithDestinationIDs:completion:");
}

id objc_msgSend_updateFontsAndLayoutMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFontsAndLayoutMetrics");
}

id objc_msgSend_updateFontsLayoutMetricsAndSeparatorInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFontsLayoutMetricsAndSeparatorInset");
}

id objc_msgSend_updateRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecentCalls");
}

id objc_msgSend_updateRootView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRootView");
}

id objc_msgSend_updateTitleDisplayModeIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTitleDisplayModeIfNeeded:");
}

id objc_msgSend_updateViewControllerForOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateViewControllerForOrientation:");
}

id objc_msgSend_urlAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlAddresses");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirection");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "username");
}

id objc_msgSend_usesUnifiedInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usesUnifiedInterface");
}

id objc_msgSend_utterances(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utterances");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_validRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validRemoteParticipantHandles");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_verbiageLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verbiageLabel");
}

id objc_msgSend_verificationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verificationStatus");
}

id objc_msgSend_verified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verified");
}

id objc_msgSend_videoDeviceController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoDeviceController");
}

id objc_msgSend_videoMessageUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoMessageUUID");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForContact:");
}

id objc_msgSend_viewControllerForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForConversation:");
}

id objc_msgSend_viewControllerForUnknownContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForUnknownContact:");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_viewDidAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDidAppear:");
}

id objc_msgSend_viewDidDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDidDisappear:");
}

id objc_msgSend_viewWillAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWillAppear:");
}

id objc_msgSend_viewWillDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWillDisappear:");
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleViewController");
}

id objc_msgSend_voicemailMessageUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageUUID");
}

id objc_msgSend_waitingForActivationLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitingForActivationLabel");
}

id objc_msgSend_waitingForLocalVideoFirstFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitingForLocalVideoFirstFrame");
}

id objc_msgSend_warmInCallServiceIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "warmInCallServiceIfNecessary");
}

id objc_msgSend_wasEmergencyCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasEmergencyCall");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakToStrongObjectsMapTable");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_withCaseSensitiveAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withCaseSensitiveAttribute");
}

id objc_msgSend_wombatWisdomEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wombatWisdomEnabled");
}

id objc_msgSend_yOffsetForDialerLCDView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yOffsetForDialerLCDView");
}

id objc_msgSend_yOffsetForDialerLCDViewForDxDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yOffsetForDialerLCDViewForDxDevices");
}

id objc_msgSend_yParticipantsViewAdjustmentForKeypad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yParticipantsViewAdjustmentForKeypad");
}
