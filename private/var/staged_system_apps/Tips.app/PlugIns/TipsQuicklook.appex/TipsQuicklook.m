id sub_100003BD8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100003CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

id sub_100003D1C()
{
  void *v0;
  id v1;
  unsigned int v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  objc_super v8;
  id v9;

  v1 = objc_msgSend((id)objc_opt_self(AVAudioSession), "sharedInstance");
  v9 = 0;
  v2 = objc_msgSend(v1, "setCategory:error:", AVAudioSessionCategoryAmbient, &v9);

  v3 = v9;
  if (v2)
  {
    v4 = v9;
  }
  else
  {
    v5 = v9;
    v6 = _convertNSErrorToError(_:)(v3);

    swift_willThrow();
    swift_errorRelease(v6);
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for PreviewViewController();
  return objc_msgSendSuper2(&v8, "viewDidLoad");
}

uint64_t variable initialization expression of TipPreviewView.tipsContentModel()
{
  type metadata accessor for TipsContentModel(0);
  return static TipsContentModel.shared()();
}

uint64_t variable initialization expression of TipPreviewView.currentTipIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of TipPreviewView.hostingView()
{
  return 0;
}

void *variable initialization expression of TipPreviewView.cancellables()
{
  return &_swiftEmptySetSingleton;
}

uint64_t (*variable initialization expression of TipPreviewView.contentSizeUpdatedHandler())()
{
  return nullsub_2;
}

uint64_t type metadata accessor for PreviewViewController()
{
  return objc_opt_self(_TtC13TipsQuicklook21PreviewViewController);
}

__n128 initializeWithTake for PreviewViewController.QuickLookPreviewError(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003FA0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100003FC0(uint64_t result, int a2, int a3)
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

  if (!qword_100010930)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10000C948);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010930);
  }
}

void sub_10000403C(uint64_t a1, uint64_t a2, char *a3, void (**a4)(_QWORD, _QWORD))
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  NSString v17;
  id v18;
  void *v19;
  NSString v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  Class isa;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  void *v53;
  id v54;
  id v55;

  v8 = objc_allocWithZone((Class)type metadata accessor for UserGuideTopic(0));
  swift_bridgeObjectRetain(a2);
  v9 = UserGuideTopic.init(searchableItemUniqueIdentifier:)(a1, a2);
  if (!v9)
    goto LABEL_16;
  v55 = (id)v9;
  dispatch thunk of UserGuideTopic.topicId.getter();
  if (!v10)
  {

LABEL_16:
    v50 = sub_100004BA8();
    v51 = swift_allocError(&type metadata for PreviewViewController.QuickLookPreviewError, v50, 0, 0);
    *v52 = a1;
    v52[1] = a2;
    swift_bridgeObjectRetain(a2);
    v53 = (void *)_convertErrorToNSError(_:)(v51);
    ((void (**)(_QWORD, void *))a4)[2](a4, v53);

    swift_errorRelease(v51);
    return;
  }
  v11 = v10;
  dispatch thunk of UserGuideTopic.productId.getter();
  v13 = v12;
  dispatch thunk of UserGuideTopic.version.getter();
  if (!v14)
    static String._unconditionallyBridgeFromObjectiveC(_:)(HLPHelpViewControllerVersionLatest, 0);
  v15 = v14;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  v18 = objc_msgSend((id)objc_opt_self(HLPHelpViewController), "helpViewControllerWithIdentifier:version:", v16, v17);

  if (v18)
  {
    v19 = *(void **)&a3[OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController];
    *(_QWORD *)&a3[OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController] = v18;
    v54 = v18;

    objc_msgSend(v54, "setShouldDisallowOffSiteRedirects:", 1);
    objc_msgSend(v54, "setDisplayHelpTopicsOnly:", 1);
    v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
    objc_msgSend(v54, "setSelectedHelpTopicID:", v20);

    objc_msgSend(v54, "setShowTopicViewOnLoad:", 1);
    v21 = objc_msgSend(v54, "view");
    if (!v21)
    {
LABEL_14:
      a4[2](a4, 0);

      return;
    }
    v22 = v21;
    v23 = objc_msgSend(a3, "view");
    if (v23)
    {
      v24 = v23;
      objc_msgSend(v23, "addSubview:", v22);

      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v25 = objc_msgSend(a3, "view");
      if (v25)
      {
        v26 = v25;
        v27 = sub_100004BEC(&qword_100010940);
        v28 = swift_allocObject(v27, 64, 7);
        *(_OWORD *)(v28 + 16) = xmmword_10000A0E0;
        v29 = objc_msgSend(v22, "leadingAnchor");
        v30 = objc_msgSend(a3, "view");
        if (v30)
        {
          v31 = v30;
          v32 = objc_msgSend(v30, "leadingAnchor");

          v33 = objc_msgSend(v29, "constraintEqualToAnchor:", v32);
          *(_QWORD *)(v28 + 32) = v33;
          v34 = objc_msgSend(v22, "topAnchor");
          v35 = objc_msgSend(a3, "view");
          if (v35)
          {
            v36 = v35;
            v37 = objc_msgSend(v35, "topAnchor");

            v38 = objc_msgSend(v34, "constraintEqualToAnchor:", v37);
            *(_QWORD *)(v28 + 40) = v38;
            v39 = objc_msgSend(v22, "trailingAnchor");
            v40 = objc_msgSend(a3, "view");
            if (v40)
            {
              v41 = v40;
              v42 = objc_msgSend(v40, "trailingAnchor");

              v43 = objc_msgSend(v39, "constraintEqualToAnchor:", v42);
              *(_QWORD *)(v28 + 48) = v43;
              v44 = objc_msgSend(v22, "bottomAnchor");
              v45 = objc_msgSend(a3, "view");
              if (v45)
              {
                v46 = v45;
                v47 = objc_msgSend(v45, "bottomAnchor");

                v48 = objc_msgSend(v44, "constraintEqualToAnchor:", v47);
                *(_QWORD *)(v28 + 56) = v48;
                specialized Array._endMutation()();
                sub_100004C2C();
                isa = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease(v28);
                objc_msgSend(v26, "addConstraints:", isa);

                objc_msgSend(v54, "didMoveToParentViewController:", a3);
                goto LABEL_14;
              }
              goto LABEL_24;
            }
LABEL_23:
            _Block_release(a4);
            __break(1u);
LABEL_24:
            _Block_release(a4);
            __break(1u);
            return;
          }
LABEL_22:
          _Block_release(a4);
          __break(1u);
          goto LABEL_23;
        }
LABEL_21:
        _Block_release(a4);
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      _Block_release(a4);
      __break(1u);
    }
    _Block_release(a4);
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease(v11);
  a4[2](a4, 0);

}

void sub_1000045DC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  Class isa;
  uint64_t v42;
  char v44[24];

  v8 = type metadata accessor for TipPreviewView();
  v9 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8)), "init");
  v10 = swift_allocObject(&unk_10000C998, 24, 7);
  *(_QWORD *)(v10 + 16) = v4;
  v11 = (uint64_t *)&v9[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
  swift_beginAccess(&v9[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler], v44, 1, 0);
  v12 = *v11;
  v13 = v11[1];
  *v11 = (uint64_t)sub_100004C8C;
  v11[1] = v10;
  v14 = v4;
  sub_100004C9C(v12, v13);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = objc_msgSend(v14, "view");
  if (!v15)
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v15;
  objc_msgSend(v15, "addSubview:", v9);

  v17 = objc_msgSend(v14, "view");
  if (!v17)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v18 = v17;
  v42 = a3;
  v19 = sub_100004BEC(&qword_100010940);
  v20 = swift_allocObject(v19, 64, 7);
  *(_OWORD *)(v20 + 16) = xmmword_10000A0E0;
  v21 = objc_msgSend(v9, "leadingAnchor");
  v22 = objc_msgSend(v14, "view");
  if (!v22)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, "leadingAnchor");

  v25 = objc_msgSend(v21, "constraintEqualToAnchor:", v24);
  *(_QWORD *)(v20 + 32) = v25;
  v26 = objc_msgSend(v9, "topAnchor");
  v27 = objc_msgSend(v14, "view");
  if (!v27)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v28 = v27;
  v29 = objc_msgSend(v27, "topAnchor");

  v30 = objc_msgSend(v26, "constraintEqualToAnchor:", v29);
  *(_QWORD *)(v20 + 40) = v30;
  v31 = objc_msgSend(v9, "trailingAnchor");
  v32 = objc_msgSend(v14, "view");
  if (!v32)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v33 = v32;
  v34 = objc_msgSend(v32, "trailingAnchor");

  v35 = objc_msgSend(v31, "constraintEqualToAnchor:", v34);
  *(_QWORD *)(v20 + 48) = v35;
  v36 = objc_msgSend(v9, "bottomAnchor");
  v37 = objc_msgSend(v14, "view");
  if (v37)
  {
    v38 = v37;
    v39 = objc_msgSend(v37, "bottomAnchor");

    v40 = objc_msgSend(v36, "constraintEqualToAnchor:", v39);
    *(_QWORD *)(v20 + 56) = v40;
    specialized Array._endMutation()();
    sub_100004C2C();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    objc_msgSend(v18, "addConstraints:", isa);

    sub_1000064B4(a1, a2, v42, a4);
    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_1000049A0(uint64_t a1, void *a2, uint64_t a3, void *a4, char *a5, void *a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  unint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;

  v24 = a5;
  v23 = type metadata accessor for TipsLog(0, a2);
  v11 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_allocObject(&unk_10000C970, 24, 7);
  *(_QWORD *)(v14 + 16) = a6;
  v15 = _Block_copy(a6);
  static TipsLog.default.getter(v15);
  v16 = (void *)0xE000000000000000;
  v25 = 0;
  v26 = 0xE000000000000000;
  _StringGuts.grow(_:)(64);
  v17._object = (void *)0x800000010000A360;
  v17._countAndFlagsBits = 0xD00000000000002DLL;
  String.append(_:)(v17);
  v18._countAndFlagsBits = a1;
  v18._object = a2;
  String.append(_:)(v18);
  v19._countAndFlagsBits = 0x537972657571202CLL;
  v19._object = (void *)0xEF203A676E697274;
  String.append(_:)(v19);
  if (a4)
    v16 = a4;
  else
    a3 = 0;
  swift_bridgeObjectRetain(a4);
  v20._countAndFlagsBits = a3;
  v20._object = v16;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v16);
  v21 = v26;
  logDebug(_:_:)(v13, v25, v26);
  swift_bridgeObjectRelease(v21);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v23);
  type metadata accessor for UserGuideTopic(0);
  if ((static UserGuideTopic.isValidIdentifier(_:)(a1, a2) & 1) != 0)
  {
    _Block_copy(a6);
    sub_10000403C(a1, (uint64_t)a2, v24, (void (**)(_QWORD, _QWORD))a6);
    _Block_release(a6);
  }
  else
  {
    sub_1000045DC(a1, a2, (uint64_t)sub_100004BA0, v14);
  }
  return swift_release(v14);
}

uint64_t sub_100004B7C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100004BA0(uint64_t a1)
{
  uint64_t v1;

  sub_100003CD0(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_100004BA8()
{
  unint64_t result;

  result = qword_100010938;
  if (!qword_100010938)
  {
    result = swift_getWitnessTable(&unk_10000A148, &type metadata for PreviewViewController.QuickLookPreviewError);
    atomic_store(result, (unint64_t *)&qword_100010938);
  }
  return result;
}

uint64_t sub_100004BEC(uint64_t *a1)
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

unint64_t sub_100004C2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010948;
  if (!qword_100010948)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100010948);
  }
  return result;
}

uint64_t sub_100004C68()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_100004C8C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "setPreferredContentSize:");
}

uint64_t sub_100004C9C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

unint64_t destroy for PreviewViewController.QuickLookPreviewError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s13TipsQuicklook21PreviewViewControllerC21QuickLookPreviewErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for PreviewViewController.QuickLookPreviewError(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = a1[1];
  v5 = a2[1];
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(a1[1]);
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for PreviewViewController.QuickLookPreviewError(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 < 0xFFFFFFFF)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewViewController.QuickLookPreviewError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviewViewController.QuickLookPreviewError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_100004EC0(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_100004EDC(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for PreviewViewController.QuickLookPreviewError()
{
  return &type metadata for PreviewViewController.QuickLookPreviewError;
}

uint64_t TipPreviewView.contentSizeUpdatedHandler.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler);
  swift_beginAccess(v0 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler, v4, 0, 0);
  v2 = *v1;
  sub_100004F64(*v1, v1[1]);
  return v2;
}

uint64_t sub_100004F64(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t TipPreviewView.contentSizeUpdatedHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler);
  swift_beginAccess(v5, v9, 1, 0);
  v6 = *v5;
  v7 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return sub_100004C9C(v6, v7);
}

void *TipPreviewView.contentSizeUpdatedHandler.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler, a1, 33, 0);
  return &j__swift_endAccess;
}

double sub_100005018()
{
  double result;

  result = 428.0;
  xmmword_1000109B0 = xmmword_10000A190;
  return result;
}

double sub_100005030()
{
  double result;

  result = 1000.0;
  xmmword_1000109C0 = xmmword_10000A1A0;
  return result;
}

void TipPreviewView.preparePreviewForTip(identifier:queryString:completionHandler:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1000064B4(a1, a2, a5, a6);
}

void sub_100005054(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  void *v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v15, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    v9 = *(_QWORD *)(Strong + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier);
    v8 = *(void **)(Strong + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier + 8);
    swift_bridgeObjectRetain(v8);

    if (v8)
    {
      if (v9 == a2 && v8 == a3)
      {
        swift_bridgeObjectRelease(v8);
      }
      else
      {
        v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v8, a2, a3, 0);
        swift_bridgeObjectRelease(v8);
        if ((v11 & 1) == 0)
          return;
      }
      swift_beginAccess(v5, &v14, 0, 0);
      v12 = swift_unknownObjectWeakLoadStrong(v5);
      if (v12)
      {
        v13 = (void *)v12;
        sub_10000514C(a2, a3);

      }
    }
  }
}

uint64_t sub_10000514C(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  Swift::String v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;

  v3 = v2;
  v6 = type metadata accessor for TipsLog(0, a2);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  v11 = *(id *)&v2[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel];
  v12 = (void *)dispatch thunk of TipsContentModel.tip(forIdentifier:)(a1, a2);

  if (v12)
  {
    v14 = objc_msgSend(v3, "traitCollection");
    v15 = objc_msgSend(v14, "userInterfaceStyle");

    v16 = v15 == (id)2;
    v17 = *(id *)&v3[v10];
    v18 = v12;
    dispatch thunk of TipsContentModel.currentTip.setter(v12);

    v19 = *(void **)&v3[v10];
    v20 = swift_allocObject(&unk_10000CA78, 24, 7);
    swift_unknownObjectWeakInit(v20 + 16, v3);
    v21 = (_QWORD *)swift_allocObject(&unk_10000CAA0, 40, 7);
    v21[2] = a1;
    v21[3] = a2;
    v21[4] = v20;
    v22 = v19;
    swift_bridgeObjectRetain(a2);
    swift_retain(v20);
    dispatch thunk of TipsContentModel.fetchTipAssetsInfo(for:userInterfaceStyle:completionHandler:)(v18, v16, sub_100006874, v21);

    swift_release(v20);
    return swift_release(v21);
  }
  else
  {
    static TipsLog.default.getter(v13);
    v26 = 0;
    v27 = 0xE000000000000000;
    _StringGuts.grow(_:)(30);
    swift_bridgeObjectRelease(v27);
    v26 = 0xD00000000000001CLL;
    v27 = 0x800000010000A550;
    v24._countAndFlagsBits = a1;
    v24._object = a2;
    String.append(_:)(v24);
    v25 = v27;
    logError(_:_:)(v9, v26, v27);
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return sub_100005750(a1, a2, 0);
  }
}

uint64_t sub_100005390(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void **aBlock;
  unint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  void (*v47)();
  _QWORD *v48;

  v37 = a5;
  v41 = a3;
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v40 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v38 = *(_QWORD *)(v11 - 8);
  v39 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TipsLog(0, v14);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v19 = swift_errorRetain(a2);
    static TipsLog.default.getter(v19);
    aBlock = 0;
    v44 = 0xE000000000000000;
    _StringGuts.grow(_:)(36);
    v20._object = (void *)0x800000010000A580;
    v20._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v20);
    v21._countAndFlagsBits = v41;
    v21._object = a4;
    String.append(_:)(v21);
    v22._countAndFlagsBits = 8250;
    v22._object = (void *)0xE200000000000000;
    String.append(_:)(v22);
    v42 = a2;
    v23 = sub_100004BEC(&qword_100010A60);
    _print_unlocked<A, B>(_:_:)(&v42, &aBlock, v23, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v24 = v44;
    logError(_:_:)(v18, aBlock, v44);
    swift_bridgeObjectRelease(v24);
    swift_errorRelease(a2);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  sub_100006880(0, &qword_100010A40, OS_dispatch_queue_ptr);
  v25 = (void *)static OS_dispatch_queue.main.getter();
  v26 = (_QWORD *)swift_allocObject(&unk_10000CAC8, 48, 7);
  v27 = v37;
  v28 = v41;
  v26[2] = v37;
  v26[3] = v28;
  v26[4] = a4;
  v26[5] = a1;
  v47 = sub_1000068EC;
  v48 = v26;
  aBlock = _NSConcreteStackBlock;
  v44 = 1107296256;
  v45 = sub_100005724;
  v46 = &unk_10000CAE0;
  v29 = _Block_copy(&aBlock);
  v30 = v48;
  v31 = a1;
  swift_retain(v27);
  swift_bridgeObjectRetain(a4);
  v32 = swift_release(v30);
  static DispatchQoS.unspecified.getter(v32);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  v33 = sub_100006910();
  v34 = sub_100004BEC(&qword_100010A50);
  v35 = sub_100006A18(&qword_100010A58, &qword_100010A50, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v34, v35, v8, v33);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v10, v29);
  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v13, v39);
}

void sub_1000056B0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t Strong;
  void *v9;
  _BYTE v10[24];

  v7 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    sub_100005750(a2, a3, a4);

  }
}

uint64_t sub_100005724(uint64_t a1)
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

uint64_t sub_100005750(uint64_t a1, void *a2, void *a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char *v57;
  void (*v58)(double, double);
  uint64_t v59;
  uint64_t v60;
  __int128 *v61;
  unsigned int v62;
  char *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  Class isa;
  char *v82;
  char *v83;
  void (*v84)(_QWORD);
  uint64_t v85;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  _QWORD v93[2];
  char v94;
  uint64_t v95;

  v4 = v3;
  v8 = type metadata accessor for TipsLog(0, a2);
  v89 = *(_QWORD *)(v8 - 8);
  v90 = v8;
  ((void (*)(void))__chkstk_darwin)();
  v91 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004BEC(&qword_100010A28);
  ((void (*)(void))__chkstk_darwin)();
  v11 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SingleTipView(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  v16 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v87 - v17;
  v19 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView], "removeFromSuperview");
  sub_100005E10(a1, a2, a3, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_100006710((uint64_t)v11);
    v20 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000014, 0x800000010000A4C0);
    v21 = Text.init(_:tableName:bundle:comment:)(v20);
    v23 = v22;
    v25 = v24;
    v27 = v26 & 1;
    v28 = static Font.title.getter();
    v29 = Text.font(_:)(v28, v21, v23, v27, v25);
    v31 = v30;
    v33 = v32;
    v88 = v19;
    v35 = v34;
    swift_release(v28);
    v36 = v33 & 1;
    sub_100006750(v21, v23, v27);
    v37 = swift_bridgeObjectRelease(v25);
    v38 = static Color.secondary.getter(v37);
    v39 = Text.foregroundColor(_:)(v38, v29, v31, v36, v35);
    v41 = v40;
    LOBYTE(v27) = v42;
    v44 = v43;
    swift_release(v38);
    sub_100006750(v29, v31, v36);
    v45 = v35;
    v46 = v88;
    swift_bridgeObjectRelease(v45);
    v93[0] = v39;
    v93[1] = v41;
    v94 = v27 & 1;
    v95 = v44;
    v47 = objc_allocWithZone((Class)sub_100004BEC(&qword_100010A30));
    v48 = _UIHostingView.init(rootView:)(v93);
    v49 = *(void **)&v4[v46];
    *(_QWORD *)&v4[v46] = v48;

    v51 = v89;
    v50 = v90;
    v52 = *(void **)&v4[v46];
    if (!v52)
      goto LABEL_17;
    goto LABEL_16;
  }
  sub_100006760((uint64_t)v11, (uint64_t)v18);
  sub_1000067A4((uint64_t)v18, (uint64_t)v16);
  v53 = objc_allocWithZone((Class)sub_100004BEC(&qword_100010A38));
  v54 = _UIHostingView.init(rootView:)(v16);
  v55 = *(void **)&v4[v19];
  *(_QWORD *)&v4[v19] = v54;

  v56 = (void *)objc_opt_self(TPSCommonDefines);
  if (objc_msgSend(v56, "isPhoneUI"))
  {
    v57 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
    swift_beginAccess(&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler], v93, 0, 0);
    v58 = *(void (**)(double, double))v57;
    v51 = v89;
    v50 = v90;
    if (!*(_QWORD *)v57)
      goto LABEL_15;
    v59 = *((_QWORD *)v57 + 1);
    v60 = qword_100010890;
    swift_retain(v59);
    if (v60 != -1)
      swift_once(&qword_100010890, sub_100005018);
    v61 = &xmmword_1000109B0;
    goto LABEL_14;
  }
  v62 = objc_msgSend(v56, "isPadUI");
  v51 = v89;
  v50 = v90;
  if (v62)
  {
    v63 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
    swift_beginAccess(&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler], v93, 0, 0);
    v58 = *(void (**)(double, double))v63;
    if (*(_QWORD *)v63)
    {
      v59 = *((_QWORD *)v63 + 1);
      v64 = qword_100010898;
      swift_retain(v59);
      if (v64 != -1)
        swift_once(&qword_100010898, sub_100005030);
      v61 = &xmmword_1000109C0;
LABEL_14:
      v58(*(double *)v61, *((double *)v61 + 1));
      sub_100004C9C((uint64_t)v58, v59);
    }
  }
LABEL_15:
  sub_1000067E8((uint64_t)v18);
  v52 = *(void **)&v4[v19];
  if (v52)
  {
LABEL_16:
    v65 = v52;
    objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", v65);
    v66 = sub_100004BEC(&qword_100010940);
    v67 = swift_allocObject(v66, 64, 7);
    *(_OWORD *)(v67 + 16) = xmmword_10000A0E0;
    v68 = objc_msgSend(v65, "leadingAnchor");
    v69 = objc_msgSend(v4, "leadingAnchor");
    v70 = objc_msgSend(v68, "constraintEqualToAnchor:", v69);

    *(_QWORD *)(v67 + 32) = v70;
    v71 = objc_msgSend(v65, "topAnchor");
    v72 = objc_msgSend(v4, "topAnchor");
    v73 = objc_msgSend(v71, "constraintEqualToAnchor:", v72);

    *(_QWORD *)(v67 + 40) = v73;
    v74 = objc_msgSend(v65, "trailingAnchor");
    v75 = objc_msgSend(v4, "trailingAnchor");
    v76 = objc_msgSend(v74, "constraintEqualToAnchor:", v75);

    *(_QWORD *)(v67 + 48) = v76;
    v77 = objc_msgSend(v65, "bottomAnchor");
    v78 = objc_msgSend(v4, "bottomAnchor");
    v79 = objc_msgSend(v77, "constraintEqualToAnchor:", v78);

    *(_QWORD *)(v67 + 56) = v79;
    v92 = v67;
    specialized Array._endMutation()();
    v80 = v92;
    sub_100006880(0, (unint64_t *)&qword_100010948, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v80);
    objc_msgSend(v4, "addConstraints:", isa);

  }
LABEL_17:
  v82 = v91;
  static TipsLog.default.getter();
  logDebug(_:_:)(v82, 0xD000000000000021, 0x800000010000A520);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v82, v50);
  v83 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler];
  v84 = *(void (**)(_QWORD))&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler];
  v85 = *((_QWORD *)v83 + 1);
  swift_retain(v85);
  v84(0);
  return swift_release(v85);
}

uint64_t sub_100005E10@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  Swift::String v29;
  unint64_t v30;
  uint64_t v31;
  void *v33;
  unsigned __int8 v34;
  unsigned int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;

  v5 = v4;
  v40 = a3;
  v9 = type metadata accessor for TipsLog(0, a2);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  v14 = *(id *)(v4 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel);
  v15 = (void *)dispatch thunk of TipsContentModel.collection(forTipIdentifier:)(a1, a2);

  if (!v15)
    goto LABEL_7;
  v39 = a4;
  v16 = *(id *)(v5 + v13);
  v17 = (void *)dispatch thunk of TipsContentModel.tip(forIdentifier:)(a1, a2);

  if (!v17)
  {

    a4 = v39;
LABEL_7:
    static TipsLog.default.getter();
    v41 = 0;
    v42 = 0xE000000000000000;
    _StringGuts.grow(_:)(44);
    swift_bridgeObjectRelease(v42);
    v41 = 0xD00000000000002ALL;
    v42 = 0x800000010000A490;
    v29._countAndFlagsBits = a1;
    v29._object = a2;
    String.append(_:)(v29);
    v30 = v42;
    logError(_:_:)(v12, v41, v42);
    swift_bridgeObjectRelease(v30);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v31 = type metadata accessor for SingleTipView(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(a4, 1, 1, v31);
  }
  v18 = *(id *)(v5 + v13);
  v19 = (void *)dispatch thunk of TipsContentModel.assetSizes()();

  if (v19
    && (v20 = objc_msgSend(v19, "tip"),
        v19,
        v21 = objc_msgSend(v20, "compact"),
        v20,
        v21))
  {
    v22 = objc_msgSend(v21, "width");
    v23 = objc_msgSend(v22, "integerValue");

    v24 = objc_msgSend(v21, "height");
    v25 = objc_msgSend(v24, "integerValue");

    v26 = (double)(uint64_t)v23;
    v27 = (double)(uint64_t)v25;
    v28 = v40;
  }
  else
  {
    v33 = (void *)objc_opt_self(TPSCommonDefines);
    v34 = objc_msgSend(v33, "isPadUI");
    v28 = v40;
    if ((v34 & 1) != 0)
    {
      v26 = 2500.0;
      v27 = 1500.0;
    }
    else
    {
      v35 = objc_msgSend(v33, "isMacUI");
      if (v35)
        v27 = 2000.0;
      else
        v27 = 0.0;
      if (v35)
        v26 = 3200.0;
      else
        v26 = 0.0;
    }
  }
  v36 = v28;
  v37 = v39;
  sub_100006A58(v15, v17, v28, v39, v26, v27);
  v38 = type metadata accessor for SingleTipView(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 0, 1, v38);
}

id TipPreviewView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), "initWithFrame:", a1, a2, a3, a4);
}

id TipPreviewView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  objc_super v15;

  v9 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  type metadata accessor for TipsContentModel(0);
  v10 = v4;
  *(_QWORD *)&v4[v9] = static TipsContentModel.shared()();
  v11 = &v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables] = &_swiftEmptySetSingleton;
  v12 = &v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler];
  *(_QWORD *)v12 = nullsub_2;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
  *(_QWORD *)v13 = nullsub_2;
  *((_QWORD *)v13 + 1) = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for TipPreviewView();
  return objc_msgSendSuper2(&v15, "initWithFrame:", a1, a2, a3, a4);
}

id TipPreviewView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id TipPreviewView.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  id v8;
  objc_super v10;

  v3 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  type metadata accessor for TipsContentModel(0);
  v4 = v1;
  *(_QWORD *)&v1[v3] = static TipsContentModel.shared()();
  v5 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables] = &_swiftEmptySetSingleton;
  v6 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler];
  *(_QWORD *)v6 = nullsub_2;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
  *(_QWORD *)v7 = nullsub_2;
  *((_QWORD *)v7 + 1) = 0;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for TipPreviewView();
  v8 = objc_msgSendSuper2(&v10, "initWithCoder:", a1);

  return v8;
}

id TipPreviewView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipPreviewView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000064B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[3];
  _BYTE v29[24];

  v5 = v4;
  v10 = (uint64_t *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier);
  v11 = *(_QWORD *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier + 8);
  *v10 = a1;
  v10[1] = (uint64_t)a2;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRelease(v11);
  v12 = (_QWORD *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler);
  v13 = *(_QWORD *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler + 8);
  *v12 = a3;
  v12[1] = a4;
  swift_retain(a4);
  swift_release(v13);
  v14 = (uint64_t *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables);
  swift_beginAccess(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables, v29, 1, 0);
  v15 = *v14;
  *v14 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v15);
  v16 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  v17 = *(id *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel);
  v18 = TipsContentModel.contentDidUpdate.getter();

  v28[0] = v18;
  v19 = swift_allocObject(&unk_10000CA78, 24, 7);
  swift_unknownObjectWeakInit(v19 + 16, v5);
  v20 = (_QWORD *)swift_allocObject(&unk_10000CB18, 40, 7);
  v20[2] = v19;
  v20[3] = a1;
  v20[4] = a2;
  v21 = swift_allocObject(&unk_10000CB40, 32, 7);
  *(_QWORD *)(v21 + 16) = sub_1000069C8;
  *(_QWORD *)(v21 + 24) = v20;
  swift_bridgeObjectRetain(a2);
  v22 = sub_100004BEC(&qword_100010A68);
  v23 = sub_100006A18(&qword_100010A70, &qword_100010A68, (uint64_t)&protocol conformance descriptor for PassthroughSubject<A, B>);
  v24 = Publisher<>.sink(receiveValue:)(sub_1000069F8, v21, v22, v23);
  swift_release(v21);
  swift_release(v28[0]);
  swift_beginAccess(v14, v28, 33, 0);
  AnyCancellable.store(in:)(v14);
  swift_endAccess(v28);
  swift_release(v24);
  v25 = *(id *)(v5 + v16);
  v26 = (void *)dispatch thunk of TipsContentModel.tip(forIdentifier:)(a1, a2);

  if (v26)
  {

    sub_10000514C(a1, a2);
  }
  else
  {
    v27 = *(id *)(v5 + v16);
    dispatch thunk of TipsContentModel.updateContent(alwaysShowIntro:)(0);

  }
}

uint64_t type metadata accessor for TipPreviewView()
{
  return objc_opt_self(_TtC13TipsQuicklook14TipPreviewView);
}

uint64_t sub_100006710(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004BEC(&qword_100010A28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006750(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100006760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SingleTipView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000067A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SingleTipView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000067E8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SingleTipView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006824()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006848()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006874(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100005390(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_100006880(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000068B8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

void sub_1000068EC()
{
  uint64_t v0;

  sub_1000056B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_1000068F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006908(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100006910()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010A48;
  if (!qword_100010A48)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100010A48);
  }
  return result;
}

uint64_t sub_100006958(uint64_t *a1)
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

uint64_t sub_10000699C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_1000069C8()
{
  uint64_t v0;

  sub_100005054(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1000069D4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000069F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100006A18(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006958(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_100006A58(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v12;
  int *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  LOBYTE(v23) = 0;
  State.init(wrappedValue:)(&v24, &v23, &type metadata for Bool);
  v12 = v25;
  *(_BYTE *)(a4 + 16) = v24;
  *(_QWORD *)(a4 + 24) = v12;
  v13 = (int *)type metadata accessor for SingleTipView(0);
  v14 = (_QWORD *)(a4 + v13[6]);
  *v14 = swift_getKeyPath("Pk");
  v15 = sub_100004BEC(&qword_100010A78);
  swift_storeEnumTagMultiPayload(v14, v15, 0);
  *(_QWORD *)(a4 + v13[7]) = 0x4040000000000000;
  type metadata accessor for TipsContentModel(0);
  v16 = a3;
  v17 = a1;
  v18 = a2;
  v19 = static TipsContentModel.shared()();
  v20 = type metadata accessor for TipViewModel(0);
  swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
  v23 = TipViewModel.init(collection:tip:assetsInfo:contentModel:onNextHandler:)(v17, v18, a3, v19, 0, 0);
  State.init(wrappedValue:)(&v24, &v23, v20);

  v21 = v25;
  *(_QWORD *)a4 = v24;
  *(_QWORD *)(a4 + 8) = v21;
  v22 = (double *)(a4 + v13[8]);
  *v22 = a5;
  v22[1] = a6;
}

uint64_t type metadata accessor for SingleTipView(uint64_t a1)
{
  uint64_t result;

  result = qword_100010AE0;
  if (!qword_100010AE0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SingleTipView);
  return result;
}

uint64_t sub_100006C00@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
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
  char *v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  __int128 v36;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[3];
  _OWORD v46[2];
  uint64_t v47;

  v40 = a1;
  v44 = a2;
  v3 = sub_100004BEC(&qword_100010BF0);
  __chkstk_darwin(v3);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_100004BEC(&qword_100010BF8);
  __chkstk_darwin(v43);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ConstellationContentParagraphStyle(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100004BEC(&qword_100010C00);
  __chkstk_darwin(v12);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for ConstellationContentAttributes(0);
  v41 = *(_QWORD *)(v15 - 8);
  v42 = v15;
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = GeometryProxy.size.getter(v16);
  v20 = type metadata accessor for SingleTipView(0);
  v21 = v19 - (*(double *)((char *)a1 + *(int *)(v20 + 28)) + *(double *)((char *)a1 + *(int *)(v20 + 28)));
  GeometryProxy.size.getter(v20);
  v23 = v22;
  sub_100006880(0, &qword_100010C08, UIFont_ptr);
  v24 = static UIFont.fontWithStyle(_:size:)(UIFontTextStyleSubheadline, 15.0);
  v25 = type metadata accessor for Locale.Language(0);
  memset(v46, 0, sizeof(v46));
  v47 = 0;
  v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v14, 1, 1, v25);
  v27 = defaultParagraphSpacing.getter(v26);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for ConstellationContentParagraphStyle.newline(_:), v8);
  BYTE2(v38) = 1;
  LOWORD(v38) = 1;
  v28 = ConstellationContentAttributes.init(font:foregroundColor:accentColor:titleGradientStyle:textAlignment:paragraphSpacing:paragraphStyle:numberOfLines:lineBreakMode:symbolScale:useForegroundColorForSymbol:displayLinkStyle:typeSettingLanguage:supportsLinks:)(v24, 0, 0, v46, 4, v11, 0, 0, v27, 0, v38, v14, 1);
  *(_QWORD *)v5 = static HorizontalAlignment.center.getter(v28);
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 0;
  v29 = sub_100004BEC(&qword_100010C10);
  v30 = sub_100006F44(v40, (uint64_t)v18, (uint64_t)&v5[*(int *)(v29 + 44)], v21, v23);
  v31 = GeometryProxy.size.getter(v30);
  v33 = static Alignment.center.getter(v32);
  _FrameLayout.init(width:height:alignment:)(v45, *(_QWORD *)&v31, 0, 0, 1, v33, v34);
  sub_100009770((uint64_t)v5, (uint64_t)v7, &qword_100010BF0);
  v35 = &v7[*(int *)(v43 + 36)];
  v36 = v45[1];
  *(_OWORD *)v35 = v45[0];
  *((_OWORD *)v35 + 1) = v36;
  *((_OWORD *)v35 + 2) = v45[2];
  sub_1000097B4((uint64_t)v5, &qword_100010BF0);
  sub_10000972C((uint64_t)v7, v44, &qword_100010BF8);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v18, v42);
}

uint64_t sub_100006F44@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;

  v10 = sub_100004BEC(&qword_100010C18);
  __chkstk_darwin(v10);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100004BEC(&qword_100010C20);
  __chkstk_darwin(v13);
  v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100004BEC(&qword_100010C28);
  __chkstk_darwin(v16);
  v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100004BEC(&qword_100010C30);
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v12 = static HorizontalAlignment.leading.getter(v20);
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 0;
  v23 = sub_100004BEC(&qword_100010C38);
  v24 = sub_100007244(a1, a2, (uint64_t)&v12[*(int *)(v23 + 44)], a4, a5);
  v25 = static Alignment.center.getter(v24);
  sub_100007A24(0.0, 1, 0.0, 1, 1.79769313e308, 0, 0.0, 1, (uint64_t)v15, 0.0, 1, 0.0, 1, v25, v26);
  v27 = sub_1000097B4((uint64_t)v12, &qword_100010C18);
  LOBYTE(v12) = static Edge.Set.horizontal.getter(v27);
  v28 = type metadata accessor for SingleTipView(0);
  v29 = EdgeInsets.init(_all:)(*(double *)((char *)a1 + *(int *)(v28 + 28)));
  v31 = v30;
  v33 = v32;
  v35 = v34;
  sub_100009770((uint64_t)v15, (uint64_t)v18, &qword_100010C20);
  v36 = &v18[*(int *)(v16 + 36)];
  *v36 = (char)v12;
  *((double *)v36 + 1) = v29;
  *((_QWORD *)v36 + 2) = v31;
  *((_QWORD *)v36 + 3) = v33;
  *((_QWORD *)v36 + 4) = v35;
  v36[40] = 0;
  v37 = sub_1000097B4((uint64_t)v15, &qword_100010C20);
  LOBYTE(v12) = static Edge.Set.top.getter(v37);
  v38 = EdgeInsets.init(_all:)(8.0);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  sub_100009770((uint64_t)v18, (uint64_t)v22, &qword_100010C28);
  v45 = &v22[*(int *)(v19 + 36)];
  *v45 = (char)v12;
  *((double *)v45 + 1) = v38;
  *((_QWORD *)v45 + 2) = v40;
  *((_QWORD *)v45 + 3) = v42;
  *((_QWORD *)v45 + 4) = v44;
  v45[40] = 0;
  v46 = sub_1000097B4((uint64_t)v18, &qword_100010C28);
  LOBYTE(v12) = static Edge.Set.bottom.getter(v46);
  v47 = EdgeInsets.init(_all:)(12.0);
  v49 = v48;
  v51 = v50;
  v53 = v52;
  sub_100009770((uint64_t)v22, a3, &qword_100010C30);
  v54 = a3 + *(int *)(sub_100004BEC(&qword_100010C40) + 36);
  *(_BYTE *)v54 = (_BYTE)v12;
  *(double *)(v54 + 8) = v47;
  *(_QWORD *)(v54 + 16) = v49;
  *(_QWORD *)(v54 + 24) = v51;
  *(_QWORD *)(v54 + 32) = v53;
  *(_BYTE *)(v54 + 40) = 0;
  return sub_1000097B4((uint64_t)v22, &qword_100010C30);
}

uint64_t sub_100007244@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  char *v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  _QWORD v142[2];

  v130 = a2;
  v135 = a3;
  v8 = sub_100004BEC(&qword_100010C48);
  __chkstk_darwin(v8);
  v127 = (char *)&v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004BEC(&qword_100010C50);
  __chkstk_darwin(v10);
  v126 = (char *)&v116 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for ConstellationContentView(0);
  v133 = *(_QWORD *)(v12 - 8);
  v134 = v12;
  __chkstk_darwin(v12);
  v128 = (char *)&v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = sub_100004BEC(&qword_100010C58);
  v14 = __chkstk_darwin(v132);
  v129 = (char *)&v116 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v131 = (uint64_t)&v116 - v16;
  v125 = type metadata accessor for AccessibilityTraits(0);
  v124 = *(_QWORD *)(v125 - 8);
  __chkstk_darwin(v125);
  v123 = (char *)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = sub_100004BEC(&qword_100010C60);
  v120 = *(_QWORD *)(v122 - 8);
  __chkstk_darwin(v122);
  v116 = (char *)&v116 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_100004BEC(&qword_100010C68);
  __chkstk_darwin(v118);
  v117 = (char *)&v116 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100004BEC(&qword_100010C70);
  v21 = __chkstk_darwin(v20);
  v136 = (uint64_t)&v116 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v137 = (uint64_t)&v116 - v23;
  v121 = a1;
  v24 = a1[1];
  v138 = *a1;
  v139 = v24;
  v119 = sub_100004BEC(&qword_100010B60);
  v25 = State.wrappedValue.getter(v142);
  v26 = v142[0];
  v27 = dispatch thunk of TipViewModel.title.getter(v25);
  v29 = v28;
  swift_release(v26);
  v138 = v27;
  v139 = v29;
  v30 = sub_100009658();
  v31 = Text.init<A>(_:)(&v138, &type metadata for String, v30);
  v33 = v32;
  v35 = v34;
  v37 = v36 & 1;
  sub_100006880(0, &qword_100010C08, UIFont_ptr);
  v38 = static UIFont.fontWithStyle(_:size:)(UIFontTextStyleTitle3, 20.0);
  v39 = Font.init(_:)(v38);
  v40 = Text.font(_:)(v39, v31, v33, v37, v35);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  swift_release(v39);
  v47 = v44 & 1;
  sub_100006750(v31, v33, v37);
  v48 = swift_bridgeObjectRelease(v35);
  v49 = static Font.Weight.bold.getter(v48);
  v50 = Text.fontWeight(_:)(*(_QWORD *)&v49, 0, v40, v42, v47, v46);
  v52 = v51;
  v54 = v53;
  LOBYTE(v39) = v55 & 1;
  sub_100006750(v40, v42, v47);
  v56 = swift_bridgeObjectRelease(v46);
  v138 = v50;
  v139 = v52;
  v140 = v39;
  v141 = v54;
  static UIFont.defaultHyphenationFactor.getter(v56);
  v57 = v116;
  View.hyphenationFactor(_:)(&type metadata for Text, &protocol witness table for Text);
  sub_100006750(v50, v52, v39);
  v58 = swift_bridgeObjectRelease(v54);
  LOBYTE(v50) = static Edge.Set.top.getter(v58);
  v59 = EdgeInsets.init(_all:)(4.0);
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v66 = v120;
  v67 = (uint64_t)v117;
  v68 = v57;
  v69 = v57;
  v70 = v122;
  (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v117, v68, v122);
  v71 = v118;
  v72 = v67 + *(int *)(v118 + 36);
  *(_BYTE *)v72 = v50;
  *(double *)(v72 + 8) = v59;
  *(_QWORD *)(v72 + 16) = v61;
  *(_QWORD *)(v72 + 24) = v63;
  *(_QWORD *)(v72 + 32) = v65;
  *(_BYTE *)(v72 + 40) = 0;
  v73 = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v69, v70);
  v74 = v123;
  static AccessibilityTraits.isHeader.getter(v73);
  v75 = sub_10000969C();
  v76 = v136;
  View.accessibilityAddTraits(_:)(v74, v71, v75);
  (*(void (**)(char *, uint64_t))(v124 + 8))(v74, v125);
  sub_1000097B4(v67, &qword_100010C68);
  sub_10000972C(v76, v137, &qword_100010C70);
  v78 = v121[1];
  v138 = *v121;
  v77 = v138;
  v139 = v78;
  v79 = State.wrappedValue.getter(v142);
  v80 = v142[0];
  v125 = dispatch thunk of TipViewModel.plainBodyContentOrText.getter(v79);
  swift_release(v80);
  v138 = v77;
  v139 = v78;
  v81 = State.wrappedValue.getter(v142);
  v82 = v142[0];
  v83 = dispatch thunk of TipViewModel.language.getter(v81);
  v85 = v84;
  swift_release(v82);
  v138 = v77;
  v139 = v78;
  v86 = State.wrappedValue.getter(v142);
  v87 = v142[0];
  v88 = v126;
  dispatch thunk of TipViewModel.assetsBaseURL.getter(v86);
  swift_release(v87);
  v138 = v77;
  v139 = v78;
  v89 = State.wrappedValue.getter(v142);
  v90 = v142[0];
  v91 = dispatch thunk of TipViewModel.assetFileInfoManager.getter(v89);
  swift_release(v90);
  v92 = type metadata accessor for ConstellationContentAttributes(0);
  v93 = *(_QWORD *)(v92 - 8);
  v94 = v127;
  (*(void (**)(char *, uint64_t, uint64_t))(v93 + 16))(v127, v130, v92);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v93 + 56))(v94, 0, 1, v92);
  v138 = v77;
  v139 = v78;
  State.wrappedValue.getter(v142);
  v95 = v128;
  v96 = ConstellationContentView.init(rawContent:language:assetsBaseURL:assetFileInfoManager:attributes:size:maxWidth:textIsSelectable:delegate:)(v125, v83, v85, v88, v91, v94, 0, 1, a4, a5, 1, v142[0], &protocol witness table for TipViewModel);
  LOBYTE(v76) = static Edge.Set.top.getter(v96);
  v97 = EdgeInsets.init(_all:)(6.0);
  v99 = v98;
  v101 = v100;
  v103 = v102;
  v104 = v133;
  v105 = (uint64_t)v129;
  v106 = v95;
  v107 = v95;
  v108 = v134;
  (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v129, v106, v134);
  v109 = v105 + *(int *)(v132 + 36);
  *(_BYTE *)v109 = v76;
  *(double *)(v109 + 8) = v97;
  *(_QWORD *)(v109 + 16) = v99;
  *(_QWORD *)(v109 + 24) = v101;
  *(_QWORD *)(v109 + 32) = v103;
  *(_BYTE *)(v109 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v104 + 8))(v107, v108);
  v110 = v131;
  sub_10000972C(v105, v131, &qword_100010C58);
  v111 = v136;
  v112 = v137;
  sub_100009770(v137, v136, &qword_100010C70);
  sub_100009770(v110, v105, &qword_100010C58);
  v113 = v135;
  sub_100009770(v111, v135, &qword_100010C70);
  v114 = sub_100004BEC(&qword_100010C88);
  sub_100009770(v105, v113 + *(int *)(v114 + 48), &qword_100010C58);
  sub_1000097B4(v110, &qword_100010C58);
  sub_1000097B4(v112, &qword_100010C70);
  sub_1000097B4(v105, &qword_100010C58);
  return sub_1000097B4(v111, &qword_100010C70);
}

__n128 sub_100007A24@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_100009770(v16, a9, &qword_100010C18);
  v35 = a9 + *(int *)(sub_100004BEC(&qword_100010C20) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

uint64_t sub_100007BE0@<X0>(char *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v58;
  char *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  _OWORD v67[3];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;

  v65 = a1;
  v10 = type metadata accessor for SingleTipView(0);
  v11 = *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  v63 = *(_QWORD *)(v10 - 8);
  v64 = v11;
  __chkstk_darwin(v10);
  v62 = (uint64_t)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for RemoteVideoView(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100004BEC(&qword_100010BC8);
  __chkstk_darwin(v17);
  v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_100004BEC(&qword_100010BD0);
  v61 = *(_QWORD *)(v66 - 8);
  v20 = __chkstk_darwin(v66);
  v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v24 = (char *)&v58 - v23;
  v59 = (char *)&v58 - v23;
  v60 = v5;
  v25 = v5[1];
  v68 = *v5;
  v69 = v25;
  sub_100004BEC(&qword_100010B60);
  v26 = State.wrappedValue.getter(v67);
  v27 = *(_QWORD *)&v67[0];
  v28 = dispatch thunk of TipViewModel.assetViewModel.getter(v26);
  swift_release(v27);
  LOBYTE(v67[0]) = 0;
  static Binding.constant(_:)(&v68, v67, &type metadata for Bool);
  v29 = RemoteVideoView.init(viewModel:showReplayButtonAtVideoEnd:isImageLoaded:)(v28, v68, v69, v70, 0, 0, 0);
  v30 = static Alignment.center.getter(v29);
  _FrameLayout.init(width:height:alignment:)(v67, *(_QWORD *)&a2, 0, *(_QWORD *)&a3, 0, v30, v31);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v19, v16, v13);
  v32 = &v19[*(int *)(v17 + 36)];
  v33 = v67[1];
  *(_OWORD *)v32 = v67[0];
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v67[2];
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v34 = sub_10000947C(&qword_100010BD8, &qword_100010BC8, (void (*)(void))sub_1000094E4);
  View.assetContentMode(_:)(1, v17, v34);
  sub_1000097B4((uint64_t)v19, &qword_100010BC8);
  v35 = v61;
  v36 = v24;
  v37 = v22;
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v36, v22, v66);
  v38 = v62;
  sub_1000067A4((uint64_t)v60, v62);
  v39 = *(unsigned __int8 *)(v63 + 80);
  v40 = (v39 + 16) & ~v39;
  v41 = swift_allocObject(&unk_10000CC30, v40 + v64, v39 | 7);
  v42 = sub_100006760(v38, v41 + v40);
  if (a5 > 0.0)
    v43 = a5;
  else
    v43 = 0.0;
  v44 = static Alignment.center.getter(v42);
  _FrameLayout.init(width:height:alignment:)(&v68, *(_QWORD *)&a4, 0, *(_QWORD *)&v43, a5 <= 0.0, v44, v45);
  v64 = v68;
  LODWORD(v63) = v69;
  v62 = v70;
  v46 = v71;
  v47 = v72;
  v48 = v73;
  v49 = v35;
  v50 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v51 = v37;
  v52 = v59;
  v53 = v66;
  v50(v37, v59, v66);
  v54 = v65;
  v50(v65, v51, v53);
  v55 = &v54[*(int *)(sub_100004BEC(&qword_100010BE8) + 48)];
  *(_QWORD *)v55 = sub_1000095F0;
  *((_QWORD *)v55 + 1) = v41;
  *((_QWORD *)v55 + 2) = v64;
  v55[24] = v63;
  *((_QWORD *)v55 + 4) = v62;
  v55[40] = v46;
  *((_QWORD *)v55 + 6) = v47;
  *((_QWORD *)v55 + 7) = v48;
  v56 = *(void (**)(char *, uint64_t))(v49 + 8);
  swift_retain(v41);
  v56(v52, v53);
  swift_release(v41);
  return ((uint64_t (*)(char *, uint64_t))v56)(v51, v53);
}

uint64_t sub_100007FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;

  v65 = a3;
  v5 = sub_100004BEC(&qword_100010B30);
  v66 = *(_QWORD *)(v5 - 8);
  v67 = v5;
  __chkstk_darwin(v5);
  v64 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SingleTipView(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004BEC(&qword_100010B38);
  __chkstk_darwin(v11);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100004BEC(&qword_100010B40);
  __chkstk_darwin(v14);
  v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_100004BEC(&qword_100010B48);
  __chkstk_darwin(v68);
  v60 = (uint64_t)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100004BEC(&qword_100010B50);
  v62 = *(_QWORD *)(v18 - 8);
  v63 = v18;
  v19 = __chkstk_darwin(v18);
  v61 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v13 = static HorizontalAlignment.center.getter(v19);
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 0;
  sub_100004BEC(&qword_100010B58);
  sub_1000084D4(a1, a2);
  sub_1000067A4(a2, (uint64_t)v10);
  v21 = *(unsigned __int8 *)(v8 + 80);
  v22 = ((v21 + 16) & ~v21) + v9;
  v23 = (v21 + 16) & ~v21;
  v24 = v21 | 7;
  v25 = swift_allocObject(&unk_10000CB90, v22, v21 | 7);
  sub_100006760((uint64_t)v10, v25 + v23);
  sub_100009770((uint64_t)v13, (uint64_t)v16, &qword_100010B38);
  v26 = &v16[*(int *)(v14 + 36)];
  *(_QWORD *)v26 = sub_1000092B8;
  *((_QWORD *)v26 + 1) = v25;
  *((_QWORD *)v26 + 2) = 0;
  *((_QWORD *)v26 + 3) = 0;
  sub_1000097B4((uint64_t)v13, &qword_100010B38);
  sub_1000067A4(a2, (uint64_t)v10);
  v59 = v22;
  v27 = swift_allocObject(&unk_10000CBB8, v22, v24);
  v58 = v23;
  sub_100006760((uint64_t)v10, v27 + v23);
  v28 = v60;
  sub_100009770((uint64_t)v16, v60, &qword_100010B40);
  v29 = (_QWORD *)(v28 + *(int *)(v68 + 36));
  *v29 = 0;
  v29[1] = 0;
  v29[2] = sub_1000092B8;
  v29[3] = v27;
  sub_1000097B4((uint64_t)v16, &qword_100010B40);
  v30 = *(_QWORD *)(a2 + 8);
  v69 = *(id *)a2;
  v70 = v30;
  sub_100004BEC(&qword_100010B60);
  v31 = State.wrappedValue.getter(&v71);
  v32 = v71;
  v33 = (void *)TipViewModel.contentModel.getter(v31);
  v34 = swift_release(v32);
  v35 = (void *)dispatch thunk of TipsContentModel.currentTip.getter(v34);

  v69 = v35;
  sub_1000067A4(a2, (uint64_t)v10);
  v36 = v22;
  v37 = v24;
  v38 = swift_allocObject(&unk_10000CBE0, v36, v24);
  sub_100006760((uint64_t)v10, v38 + v23);
  v39 = sub_100004BEC(&qword_100010B68);
  v40 = sub_10000947C(&qword_100010B70, &qword_100010B48, (void (*)(void))sub_1000092FC);
  v41 = sub_100009380();
  v42 = v61;
  View.onChange<A>(of:initial:_:)(&v69, 0, sub_1000092B8, v38, v68, v39, v40, v41);
  swift_release(v38);

  sub_1000097B4(v28, &qword_100010B48);
  v43 = *(_QWORD *)(a2 + 8);
  v69 = *(id *)a2;
  v70 = v43;
  v44 = State.wrappedValue.getter(&v71);
  v45 = v71;
  v46 = dispatch thunk of TipViewModel.assetViewModel.getter(v44);
  v47 = swift_release(v45);
  v48 = v64;
  dispatch thunk of DocumentAssetViewModel.$player.getter(v47);
  swift_release(v46);
  sub_1000067A4(a2, (uint64_t)v10);
  v49 = swift_allocObject(&unk_10000CC08, v59, v37);
  sub_100006760((uint64_t)v10, v49 + v58);
  v51 = v62;
  v50 = v63;
  v52 = v65;
  (*(void (**)(uint64_t, char *, uint64_t))(v62 + 16))(v65, v42, v63);
  v53 = sub_100004BEC(&qword_100010BA0);
  v55 = v66;
  v54 = v67;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v52 + *(int *)(v53 + 52), v48, v67);
  v56 = (_QWORD *)(v52 + *(int *)(v53 + 56));
  *v56 = sub_100009440;
  v56[1] = v49;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v48, v54);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v42, v50);
}

uint64_t sub_1000084D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v40;

  v3 = sub_100004BEC(&qword_100010BB0);
  __chkstk_darwin(v3);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004BEC(&qword_100010BB8);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  GeometryProxy.size.getter(v7);
  v11 = v10;
  v13 = GeometryProxy.size.getter(v12);
  v15 = GeometryProxy.size.getter(v14);
  v16 = type metadata accessor for SingleTipView(0);
  v17 = (double *)(a2 + *(int *)(v16 + 32));
  v19 = *v17;
  v18 = v17[1];
  v20 = v18 / *v17;
  v21 = v15 * v20;
  GeometryProxy.size.getter(v16);
  if (v11 >= v23 || (GeometryProxy.size.getter(v22), v24 - v21 >= v11))
  {
    v37 = GeometryProxy.size.getter(v22);
    sub_100007BE0(v9, v13, v21, v37, 0.0);
    sub_100009770((uint64_t)v9, (uint64_t)v5, &qword_100010BB8);
    v34 = v5;
    v35 = v3;
    v36 = 1;
  }
  else
  {
    GeometryProxy.size.getter(v22);
    v26 = v19 / v18 * (v25 - v11);
    v29 = GeometryProxy.size.getter(v27);
    if (v29 < v26)
      v26 = v29;
    GeometryProxy.size.getter(v28);
    v31 = v30 - v20 * v26;
    v33 = GeometryProxy.size.getter(v32);
    sub_100007BE0(v9, v26, v20 * v26, v33, v31);
    sub_100009770((uint64_t)v9, (uint64_t)v5, &qword_100010BB8);
    v34 = v5;
    v35 = v3;
    v36 = 0;
  }
  swift_storeEnumTagMultiPayload(v34, v35, v36);
  v38 = sub_100006A18(&qword_100010BC0, &qword_100010BB8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  _ConditionalContent<>.init(storage:)(v5, v6, v6, v38, v38);
  return sub_1000097B4((uint64_t)v9, &qword_100010BB8);
}

uint64_t sub_1000086F0()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  sub_100004BEC(&qword_100010B60);
  v0 = State.wrappedValue.getter(&v20);
  v1 = v20;
  v2 = dispatch thunk of TipViewModel.isCurrentTip.getter(v0);
  swift_release(v1);
  LOBYTE(v20) = v2 & 1;
  v3 = sub_100004BEC(&qword_100010BA8);
  State.wrappedValue.setter(&v20, v3);
  State.wrappedValue.getter(&v20);
  if (v20 == 1)
  {
    v4 = State.wrappedValue.getter(&v20);
    v5 = v20;
    v6 = dispatch thunk of TipViewModel.assetViewModel.getter(v4);
    v7 = swift_release(v5);
    dispatch thunk of DocumentAssetViewModel.load()(v7);
    swift_release(v6);
    v8 = State.wrappedValue.getter(&v20);
    v9 = v20;
    v10 = dispatch thunk of TipViewModel.assetViewModel.getter(v8);
    v11 = swift_release(v9);
    dispatch thunk of DocumentAssetViewModel.playVideo()(v11);
  }
  else
  {
    v12 = State.wrappedValue.getter(&v20);
    v13 = v20;
    v14 = dispatch thunk of TipViewModel.assetViewModel.getter(v12);
    v15 = swift_release(v13);
    dispatch thunk of DocumentAssetViewModel.cancel()(v15);
    swift_release(v14);
    v16 = State.wrappedValue.getter(&v20);
    v17 = v20;
    v10 = dispatch thunk of TipViewModel.assetViewModel.getter(v16);
    v18 = swift_release(v17);
    dispatch thunk of DocumentAssetViewModel.resetVideo()(v18);
  }
  return swift_release(v10);
}

_QWORD *sub_10000889C(void **a1)
{
  void *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = *a1;
  sub_100004BEC(&qword_100010BA8);
  result = State.wrappedValue.getter(&v3);
  if (v3 == 1)
    return objc_msgSend(v1, "play");
  return result;
}

uint64_t sub_10000890C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100008924@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  v7 = type metadata accessor for TipsLog(0, v6);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TipsLog.default.getter(v9);
  logDebug(_:_:)(v11, 0xD000000000000014, 0x800000010000A5A0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  sub_1000067A4(v2, (uint64_t)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(unsigned __int8 *)(v4 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = swift_allocObject(&unk_10000CB68, v13 + v5, v12 | 7);
  result = sub_100006760((uint64_t)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  *a2 = sub_1000092A8;
  a2[1] = (uint64_t (*)(uint64_t))v14;
  return result;
}

uint64_t sub_100008A44()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100008A64(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_100008AE4(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain(v5);
  }
  else
  {
    v8 = a2[1];
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v9 = a2[3];
    *(_QWORD *)(a1 + 24) = v9;
    v10 = a3[6];
    v11 = (uint64_t *)(a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    swift_retain(v5);
    swift_retain(v8);
    swift_retain(v9);
    v13 = sub_100004BEC(&qword_100010A78);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
      v15 = 1;
    }
    else
    {
      v16 = *v12;
      *v11 = *v12;
      swift_retain(v16);
      v15 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v13, v15);
    v17 = a3[8];
    *(_QWORD *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(_OWORD *)(a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  }
  return a1;
}

uint64_t sub_100008C04(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*a1);
  swift_release(a1[1]);
  swift_release(a1[3]);
  v4 = (_QWORD *)((char *)a1 + *(int *)(a2 + 24));
  v5 = sub_100004BEC(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for ColorScheme(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

uint64_t sub_100008C8C(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *a2;
  v7 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  v8 = a2[3];
  *(_QWORD *)(a1 + 24) = v8;
  v9 = a3[6];
  v10 = (uint64_t *)(a1 + v9);
  v11 = (uint64_t *)((char *)a2 + v9);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  v12 = sub_100004BEC(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
  {
    v13 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
    v14 = 1;
  }
  else
  {
    v15 = *v11;
    *v10 = *v11;
    swift_retain(v15);
    v14 = 0;
  }
  swift_storeEnumTagMultiPayload(v10, v12, v14);
  v16 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)((char *)a2 + v16);
  return a1;
}

uint64_t *sub_100008D80(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  swift_retain(v6);
  swift_release(v7);
  v8 = a1[1];
  v9 = a2[1];
  a1[1] = v9;
  swift_retain(v9);
  swift_release(v8);
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  v10 = a1[3];
  v11 = a2[3];
  a1[3] = v11;
  swift_retain(v11);
  swift_release(v10);
  if (a1 != a2)
  {
    v12 = a3[6];
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_1000097B4((uint64_t)a1 + v12, &qword_100010A78);
    v15 = sub_100004BEC(&qword_100010A78);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = 1;
    }
    else
    {
      v18 = *v14;
      *v13 = *v14;
      swift_retain(v18);
      v17 = 0;
    }
    swift_storeEnumTagMultiPayload(v13, v15, v17);
  }
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  v19 = a3[8];
  v20 = (uint64_t *)((char *)a1 + v19);
  v21 = (uint64_t *)((char *)a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  return a1;
}

_OWORD *sub_100008EBC(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_100004BEC(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload(v8, v10, 1);
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v12 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  return a1;
}

uint64_t *sub_100008F88(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  v7 = a1[1];
  a1[1] = a2[1];
  swift_release(v7);
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  v8 = a1[3];
  a1[3] = a2[3];
  swift_release(v8);
  if (a1 != a2)
  {
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    sub_1000097B4((uint64_t)a1 + v9, &qword_100010A78);
    v12 = sub_100004BEC(&qword_100010A78);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload(v10, v12, 1);
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
  }
  v14 = a3[8];
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v14) = *(_OWORD *)((char *)a2 + v14);
  return a1;
}

uint64_t sub_10000909C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000090A8);
}

uint64_t sub_1000090A8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_100004BEC(&qword_100010A80);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_100009128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009134);
}

char *sub_100009134(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_100004BEC(&qword_100010A80);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_1000091AC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = &unk_10000A218;
  v4[1] = &unk_10000A230;
  sub_100009240(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[4] = &unk_10000A248;
    swift_initStructMetadata(a1, 256, 5, v4, a1 + 16);
  }
}

void sub_100009240(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100010AF0)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100010AF0);
  }
}

uint64_t sub_100009294(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000AC30, 1);
}

uint64_t sub_1000092A8(uint64_t a1)
{
  return sub_1000095FC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100007FF4);
}

uint64_t sub_1000092C4()
{
  type metadata accessor for SingleTipView(0);
  return sub_1000086F0();
}

unint64_t sub_1000092FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010B78;
  if (!qword_100010B78)
  {
    v1 = sub_100006958(&qword_100010B40);
    sub_100006A18(&qword_100010B80, &qword_100010B38, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100010B78);
  }
  return result;
}

unint64_t sub_100009380()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010B88;
  if (!qword_100010B88)
  {
    v1 = sub_100006958(&qword_100010B68);
    sub_1000093E4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100010B88);
  }
  return result;
}

unint64_t sub_1000093E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010B90;
  if (!qword_100010B90)
  {
    v1 = sub_100006880(255, &qword_100010B98, TPSTip_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100010B90);
  }
  return result;
}

_QWORD *sub_100009440(void **a1)
{
  type metadata accessor for SingleTipView(0);
  return sub_10000889C(a1);
}

uint64_t sub_10000947C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006958(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000094E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010BE0;
  if (!qword_100010BE0)
  {
    v1 = type metadata accessor for RemoteVideoView(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for RemoteVideoView, v1);
    atomic_store(result, (unint64_t *)&qword_100010BE0);
  }
  return result;
}

uint64_t sub_100009530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for SingleTipView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_release(*(_QWORD *)(v0 + v4));
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  swift_release(*(_QWORD *)(v0 + v4 + 24));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 24));
  v7 = sub_100004BEC(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_1000095F0(uint64_t a1)
{
  return sub_1000095FC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100006C00);
}

uint64_t sub_1000095FC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SingleTipView(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_100009658()
{
  unint64_t result;

  result = qword_100010C78;
  if (!qword_100010C78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010C78);
  }
  return result;
}

unint64_t sub_10000969C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100010C80;
  if (!qword_100010C80)
  {
    v1 = sub_100006958(&qword_100010C68);
    v2[0] = &type metadata for Text;
    v2[1] = &protocol witness table for Text;
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.hyphenationFactor(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100010C80);
  }
  return result;
}

uint64_t sub_10000972C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004BEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009770(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004BEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000097B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004BEC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000097F0()
{
  return sub_100006A18(&qword_100010C90, &qword_100010C98, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}
