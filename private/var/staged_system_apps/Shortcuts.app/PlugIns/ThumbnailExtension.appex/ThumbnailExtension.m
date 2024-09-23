void sub_1000030C4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  NSURL *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _QWORD aBlock[5];
  _QWORD *v17;

  type metadata accessor for URL(0);
  __chkstk_darwin();
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, "fileURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v9 = objc_allocWithZone((Class)WFShortcutExtractor);
  v11 = sub_100003520((uint64_t)v7, 1, 1, 0, 0, v10);
  v12 = (_QWORD *)sub_10000398C((uint64_t)&unk_100004288, 40);
  v12[2] = a2;
  v12[3] = a3;
  v12[4] = a1;
  aBlock[4] = sub_100003648;
  v17 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000330C;
  aBlock[3] = &unk_1000042A0;
  v13 = _Block_copy(aBlock);
  v14 = v17;
  swift_retain(a3);
  v15 = a1;
  swift_release(v14);
  objc_msgSend(v11, "extractShortcutWithCompletion:", v13);
  _Block_release(v13);

}

id sub_100003228(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;

  v10[4] = a1;
  v11 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000032D4;
  v10[3] = &unk_1000042F0;
  v7 = _Block_copy(v10);
  v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(v4), "replyWithContextSize:currentContextDrawingBlock:", v7, a3, a4);
  _Block_release(v7);
  swift_release(v11);
  return v8;
}

uint64_t sub_1000032D4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  LOBYTE(v1) = v1(v3);
  swift_release(v2);
  return v1 & 1;
}

void sub_10000330C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_1000033FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

id sub_100003454()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailProvider();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000034A4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ThumbnailProvider()
{
  return objc_opt_self(_TtC18ThumbnailExtension17ThumbnailProvider);
}

uint64_t sub_1000034F4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100003518(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000033FC(a1, a2, *(_QWORD *)(v2 + 16));
}

id sub_100003520@<X0>(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X4>, uint64_t a5@<X6>, NSURL *a6@<X8>)
{
  void *v6;
  void *v7;
  void *v13;
  void *v14;
  NSString v15;
  NSString v16;
  id v17;
  uint64_t v18;

  v7 = v6;
  URL._bridgeToObjectiveC()(a6);
  v14 = v13;
  if (!a4)
  {
    v15 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a5);
LABEL_6:
  v17 = objc_msgSend(v7, "initWithURL:allowsOldFormatFile:skipsMaliciousScanning:suggestedName:sourceApplication:", v14, a2 & 1, a3 & 1, v15, v16);

  v18 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(a1, v18);
  return v17;
}

uint64_t sub_10000361C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_100003648(void *a1)
{
  uint64_t v1;
  void (*v2)(void);
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v2 = *(void (**)(void))(v1 + 16);
  if (a1)
  {
    v3 = *(void **)(v1 + 32);
    v15 = a1;
    sub_100003980();
    v5 = v4;
    sub_100003980();
    if (v6 < v5)
      v5 = v6;
    objc_msgSend(v3, "scale");
    v8 = v7;
    v9 = objc_msgSend(v15, "record");
    v10 = objc_msgSend(v9, "icon");

    sub_1000037BC();
    v11 = sub_10000398C((uint64_t)&unk_1000042D8, 48);
    *(_QWORD *)(v11 + 16) = v8;
    *(_QWORD *)(v11 + 24) = v10;
    *(double *)(v11 + 32) = v5;
    *(double *)(v11 + 40) = v5;
    v12 = v10;
    v13 = sub_100003228((uint64_t)sub_10000381C, v11, v5, v5);
    objc_msgSend(v13, "setIconFlavor:", 0);
    v14 = v13;
    ((void (*)(id, _QWORD))v2)(v13, 0);

  }
  else
  {
    v2();
  }
}

uint64_t sub_1000037A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000037B4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000037BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000081A0;
  if (!qword_1000081A0)
  {
    v1 = objc_opt_self(QLThumbnailReply);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000081A0);
  }
  return result;
}

uint64_t sub_1000037F8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000381C()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
  id v4;
  id v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(double *)(v0 + 32);
  v3 = *(double *)(v0 + 40);
  v4 = objc_msgSend((id)objc_opt_self(WFBitmapContext), "currentContextWithScale:", *(double *)(v0 + 16));
  v5 = objc_msgSend(objc_allocWithZone((Class)WFWorkflowIconDrawer), "initWithIcon:", v1);
  objc_msgSend(v5, "setCornerRadius:", 1.0);
  objc_msgSend(v5, "drawInContext:inRect:", v4, 0.0, 0.0, v2, v3);

  return 1;
}

__n128 sub_1000038D8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000038E8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100003908(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1000081A8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100004380);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000081A8);
  }
}

id sub_100003980()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 104));
}

uint64_t sub_10000398C(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}
